from ipykernel.ipkernel import IPythonKernel


class CustomKernel(IPythonKernel):
    def do_execute(self, code, silent, store_history=True, user_expressions=None,
                   allow_stdin=False):
        # Log the command
        print(f"Executing command: {code}")

        # Execute the command using the parent class method
        result = super().do_execute(code, silent, store_history,
                                    user_expressions, allow_stdin)

        # Log the response
        if result:
            print(f"Response: {result}")
        else:
            print("No response")

        return result


if __name__ == '__main__':
    from ipykernel.kernelapp import IPKernelApp
    app = IPKernelApp.instance()
    app.kernel_class = CustomKernel
    app.initialize()
    app.start()
