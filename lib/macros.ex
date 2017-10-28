defmodule Dynamic.Macros do

	defmacro get(fun) do
		quote do
			get(unquote(fun), Atom.to_string(unquote(fun)))
		end
	end
	defmacro get(fun, path) do
		quote do
			get(unquote(fun), unquote(path), &(&1))
		end
	end

	defmacro get(fun, path, cb) when is_list(path) === false do
		quote do
			get(unquote(fun), [unquote(path)], unquote(cb))
		end
	end
	defmacro get(fun, path, cb) do
		quote do
			def unquote(fun)(input) do
				result =
					input
					|> Dynamic.get(unquote(path))
				unquote(cb).(result)
			end
		end
	end
end

defmodule Dynamic.Example do
	import Dynamic.Macros

	get :a
	get :b

end