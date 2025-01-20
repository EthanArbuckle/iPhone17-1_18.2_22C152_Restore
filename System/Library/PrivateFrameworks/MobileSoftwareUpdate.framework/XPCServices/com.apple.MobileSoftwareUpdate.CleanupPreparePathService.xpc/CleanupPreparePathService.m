@interface CleanupPreparePathService
@end

@implementation CleanupPreparePathService

void __CleanupPreparePathService_event_handler_block_invoke(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v10 = *(_xpc_connection_s **)(a1 + 32);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object != &_xpc_error_connection_interrupted)
    {
      char string = xpc_dictionary_get_string(object, _xpc_error_key_description);
      logfunction(", 1, @"XPC error: %s\n"", v17, v18, v19, v20, v21, string);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    handle_message(v10, object, (uint64_t)&jump_table, 5, v12, v13, v14, v15, a9);
  }
}

@end