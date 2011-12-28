package com.pruebas.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

public class ClienteRepository {
   private Map<Long, Cliente> clientes = new LinkedHashMap<Long, Cliente>();
   private static long counter = 1l;

   public List<Cliente> getClientes() {
      return new ArrayList<Cliente>(clientes.values());
   }

   public synchronized Cliente persist(Cliente cliente) {
      if (cliente.id == 0) {
         cliente.id = counter++;
      }
      return clientes.put(cliente.id, cliente);
   }

   public synchronized void remove(Cliente cliente) {
      clientes.remove(cliente.id);
   }

}