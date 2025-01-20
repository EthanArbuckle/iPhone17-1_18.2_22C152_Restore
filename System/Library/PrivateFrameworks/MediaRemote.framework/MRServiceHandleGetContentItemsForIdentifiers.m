@interface MRServiceHandleGetContentItemsForIdentifiers
@end

@implementation MRServiceHandleGetContentItemsForIdentifiers

void ___MRServiceHandleGetContentItemsForIdentifiers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    connection = v6;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v8 = reply;
    if (reply)
    {
      MRAddContentItemsToXPCMessage(reply, a2);
      MRAddClientErrorToXPCMessage(v8, a3);
      xpc_connection_send_message(connection, v8);
    }

    v6 = connection;
  }
}

@end