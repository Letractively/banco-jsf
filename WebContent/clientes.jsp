<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Clientes</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
</head>

<body>
	<f:view>
		<h4>Clientes</h4>

		<h:messages infoClass="infoClass" errorClass="errorClass"
			layout="table" globalOnly="true" />

		<h:form>
			<h:commandLink binding="#{clienteController.addNewCommand}"
				action="#{clienteController.addNew}" value="Agregar nuevo..." />
		</h:form>

		<h:form binding="#{clienteController.form}" rendered="false"
			styleClass="form">

			<h:inputHidden value="#{clienteController.cliente.id}" />
			<h:panelGrid columns="6">
				<%-- First Name --%>
				<h:outputLabel value="First Name" for="firstName" accesskey="f" />
				<h:inputText id="firstName" label="First Name" required="true"
					value="#{clienteController.cliente.firstName}" size="10" />
				<h:message for="firstName" errorClass="errorClass" />

				<%-- Last Name --%>
				<h:outputLabel value="Last Name" for="lastName" accesskey="l" />
				<h:inputText id="lastName" required="true"
					value="#{clienteController.cliente.lastName}" size="15" />
				<h:message for="lastName" errorClass="errorClass" />
			</h:panelGrid>
			<h:panelGroup>
				<h:commandButton binding="#{clienteController.persistCommand}"
					action="#{clienteController.persist}" />
			</h:panelGroup>
		</h:form>
		<h:form>
			<h:dataTable value="#{clienteController.clienteRepository.clientes}" var="cliente"
				rowClasses="oddRow, evenRow"
				rendered="#{not empty clienteController.clienteRepository.clientes}"
				styleClass="clienteTable" headerClass="headerTable"
				columnClasses="normal,centered">
				<h:column>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Nombre" />
						</h:column>
					</f:facet>
					<h:outputText value="#{cliente.firstName} #{cliente.lastName}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Opciones" />
						</h:column>
					</f:facet>
					<h:panelGrid columns="2" styleClass="centered">
						<h:commandLink styleClass="icono eliminar" title="Eliminar" action="#{clienteController.remove}">
							<f:setPropertyActionListener
								target="#{clienteController.selectedcliente}" value="#{cliente}" />
						</h:commandLink>
						<h:commandLink  styleClass="icono editar" value="" title="Editar" action="#{clienteController.read}">
							<f:setPropertyActionListener
								target="#{clienteController.selectedcliente}" value="#{cliente}" />
						</h:commandLink>
					</h:panelGrid>
				</h:column>

			</h:dataTable>
		</h:form>
	</f:view>
</body>

</html>