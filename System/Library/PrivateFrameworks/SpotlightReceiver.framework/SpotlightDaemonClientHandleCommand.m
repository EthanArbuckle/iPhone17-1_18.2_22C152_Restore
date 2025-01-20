@interface SpotlightDaemonClientHandleCommand
@end

@implementation SpotlightDaemonClientHandleCommand

void ___SpotlightDaemonClientHandleCommand_block_invoke(uint64_t a1, const char *a2, void *a3, const char *a4, int64_t a5)
{
  xpc_object_t value = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v11 = reply;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", a5);
      if (a5)
      {
        xpc_dictionary_set_string(v11, "ed", a4);
      }
      else if (a2 && value)
      {
        xpc_dictionary_set_value(v11, a2, value);
      }
      xpc_connection_send_message(v9, v11);
    }
  }
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_2();
  }
  id v7 = 0;
  v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v7];
  id v5 = v7;
  if (v5)
  {
    v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_1((uint64_t)v5, v6);
    }
  }
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  xpc_object_t v6 = (xpc_object_t)[v11 length];
  if (v6) {
    xpc_object_t v6 = xpc_data_create((const void *)[v11 bytes], (size_t)v6);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v5 domain];
  uint64_t v9 = [v8 UTF8String];
  uint64_t v10 = [v5 code];

  (*(void (**)(uint64_t, const char *, xpc_object_t, uint64_t, uint64_t))(v7 + 16))(v7, "d", v6, v9, v10);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_2_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F02A30];
  id v6 = a3;
  uint64_t v7 = [v5 encodeURLPreservingSecurityScope:a2];
  id v8 = v7;
  if (v7 && [v7 length])
  {
    id v9 = v8;
    id v14 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v6 domain];
  uint64_t v12 = [v11 UTF8String];
  uint64_t v13 = [v6 code];

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v10 + 16))(v10, "u", v14, v12, v13);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_3_47(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F08910];
  id v6 = a3;
  uint64_t v7 = [v5 archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  size_t v8 = [v7 length];
  if (v8) {
    id v13 = xpc_data_create((const void *)[v7 bytes], v8);
  }
  else {
    id v13 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v6 domain];
  uint64_t v11 = [v10 UTF8String];
  uint64_t v12 = [v6 code];

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v9 + 16))(v9, "brs", v13, v11, v12);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_4_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F08910];
  id v6 = a3;
  uint64_t v7 = [v5 archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  size_t v8 = [v7 length];
  if (v8) {
    id v13 = xpc_data_create((const void *)[v7 bytes], v8);
  }
  else {
    id v13 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v6 domain];
  uint64_t v11 = [v10 UTF8String];
  uint64_t v12 = [v6 code];

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v9 + 16))(v9, "brs", v13, v11, v12);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_52(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (objc_class *)MEMORY[0x263F02A60];
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = (void *)[[v6 alloc] initWithFileURL:v8 andError:v7];

  [v5 addObject:v9];
  id v10 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v10);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21B5E5000, a2, OS_LOG_TYPE_ERROR, "Error while decoding updatedItem: %@", (uint8_t *)&v2, 0xCu);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_2()
{
}

@end