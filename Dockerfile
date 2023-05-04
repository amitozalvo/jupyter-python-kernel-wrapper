FROM jupyter/base-notebook:notebook-6.4.8

RUN pip install wandb
RUN wandb login 7016e5ef14bf578f6a0c2ab63bfd4d32b8486e68

COPY ./custom_kernel /home/custom_kernel
USER root

RUN chmod -R u+w /home/custom_kernel
RUN pip install ipykernel

RUN pip install --user -e /home/custom_kernel
RUN jupyter kernelspec install --user /home/custom_kernel/kernelspec --name=custom_kernel --replace

# Create the jovyan group if it doesn't exist
RUN groupadd -f jovyan

# Change the ownership of the /home/jovyan/.local directory to the jovyan user and group
RUN chown -R jovyan:jovyan /home/jovyan/.local

# Switch back to the jovyan user
USER jovyan
CMD ["jupyter", "notebook", "--debug", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
