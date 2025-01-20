@interface MRServiceHandlePostNotification
@end

@implementation MRServiceHandlePostNotification

void ___MRServiceHandlePostNotification_block_invoke(uint64_t a1)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    connection = v2;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply) {
      xpc_connection_send_message(connection, reply);
    }

    v2 = connection;
  }
}

@end