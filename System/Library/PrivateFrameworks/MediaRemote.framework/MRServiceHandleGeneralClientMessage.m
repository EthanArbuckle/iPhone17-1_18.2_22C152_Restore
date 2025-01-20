@interface MRServiceHandleGeneralClientMessage
@end

@implementation MRServiceHandleGeneralClientMessage

void ___MRServiceHandleGeneralClientMessage_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v5 = reply;
    if (reply)
    {
      MRAddProtobufToXPCMessage(reply, v6);
      xpc_connection_send_message(v3, v5);
    }
  }
}

@end