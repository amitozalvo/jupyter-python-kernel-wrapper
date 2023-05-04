from setuptools import setup, find_packages

setup(
    name="custom_kernel",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "ipykernel",
    ],
)
