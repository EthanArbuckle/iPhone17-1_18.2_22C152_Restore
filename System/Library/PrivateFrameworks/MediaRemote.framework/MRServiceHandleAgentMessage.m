@interface MRServiceHandleAgentMessage
@end

@implementation MRServiceHandleAgentMessage

void ___MRServiceHandleAgentMessage_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0xA00000000000002)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    xpc_object_t xdict = *(id *)(a1 + 32);
    if (v4)
    {
      v5 = (uint64_t (*)(void))v4[1];
      if (v5) {
        v4 = (void *)v5(*v4);
      }
      else {
        v4 = 0;
      }
    }
    id v8 = v3;
    v9 = xpc_dictionary_get_remote_connection(xdict);
    if (v9)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(xdict);
      v11 = reply;
      if (reply)
      {
        xpc_dictionary_set_uint64(reply, "MRXPC_AGENT_NUMBER_ACTIVE_CALLS_KEY", (uint64_t)v4);
        v12 = [v8 connection];
        xpc_connection_send_message(v12, v11);
      }
    }
  }
  else
  {
    uint64_t v6 = uint64;
    v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Agent client message %lu not handled", buf, 0xCu);
    }
  }
}

@end