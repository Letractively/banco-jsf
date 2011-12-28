package com.pruebas.controller;

import javax.faces.application.FacesMessage;
import javax.faces.component.UICommand;
import javax.faces.component.UIForm;
import javax.faces.context.FacesContext;

import com.pruebas.model.Cliente;
import com.pruebas.model.ClienteRepository;

public class ClienteController {

    private ClienteRepository clienteRepository;

    private Cliente cliente = new Cliente();

    private Cliente clienteSeleccionado;

    private UIForm form;

    private UICommand addNewCommand;

    private UICommand persistCommand;

    public String addNew() {
        form.setRendered(true);
        addNewCommand.setRendered(false);
        persistCommand.setValue("Agregar");
        return null;
    }

    public String persist() {
        form.setRendered(false);
        addNewCommand.setRendered(true);
        if (clienteRepository.persist(cliente) == null) {
            addStatusMessage("Cliente guardado.");
        } else {
            addStatusMessage("Cliente actualizado.");
        }
        return null;
    }

    public String remove() {
        clienteRepository.remove(clienteSeleccionado);
        addStatusMessage("Cliente eliminado.");
        return null;
    }

    public String read() {
        cliente = clienteSeleccionado;
        form.setRendered(true);
        addNewCommand.setRendered(false);
        persistCommand.setValue("Actualizar");
        return null;
    }

    private void addStatusMessage(String message) {
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, message, null));
    }

	
    //getter/setter
    
    public UICommand getAddNewCommand() {
		return addNewCommand;
	}

	public void setAddNewCommand(UICommand addNewCommand) {
		this.addNewCommand = addNewCommand;
	}
	
    public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Cliente getSelectedCliente() {
		return clienteSeleccionado;
	}

	public void setSelectedCliente(Cliente selectedCliente) {
		this.clienteSeleccionado = selectedCliente;
	}

	public UIForm getForm() {
		return form;
	}

	public void setForm(UIForm form) {
		this.form = form;
	}

	public UICommand getPersistCommand() {
		return persistCommand;
	}

	public void setPersistCommand(UICommand persistCommand) {
		this.persistCommand = persistCommand;
	}

	public void setClienteRepository(ClienteRepository clienteRepository) {
		this.clienteRepository = clienteRepository;
	}
	
	public ClienteRepository getClienteRepository() {
		return clienteRepository;
	}

}