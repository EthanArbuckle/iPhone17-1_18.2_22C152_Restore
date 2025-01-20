@interface HandleListenerConnection
@end

@implementation HandleListenerConnection

uint64_t ___HandleListenerConnection_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 48) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void ___HandleListenerConnection_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = MEMORY[0x210568780](a2);
  if (v11 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(_xpc_connection_s **)(a1 + 40);
    _HandleIncomingMessage(v17, v18, a2, v12, v13, v14, v15, v16, a9);
  }
  else if (v11 == MEMORY[0x263EF8720])
  {
    v19 = *(_xpc_connection_s **)(a1 + 40);
    char string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    if (a2 == (void *)MEMORY[0x263EF86A8])
    {
      context = xpc_connection_get_context(v19);
      if (context)
      {
        xpc_release(context);
        xpc_connection_set_context(v19, 0);
      }
      MEMORY[0x2105687C0]();
      xpc_connection_cancel(v19);
      xpc_release(v19);
    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"_HandleClientError", @"client connection error: %s", v21, v22, v23, v24, string);
    }
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"_HandleListenerConnection_block_invoke_2", @"ignoring unknown event type from client", v13, v14, v15, v16, a9);
  }
}

@end