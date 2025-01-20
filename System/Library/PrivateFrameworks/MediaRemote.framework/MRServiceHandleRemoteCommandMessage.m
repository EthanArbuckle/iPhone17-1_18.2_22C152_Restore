@interface MRServiceHandleRemoteCommandMessage
@end

@implementation MRServiceHandleRemoteCommandMessage

void ___MRServiceHandleRemoteCommandMessage_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v6 = _MRLogForCategory(2uLL);
      v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
      os_signpost_id_t v8 = [v7 hash];

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_194F3C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SendCommandXPCResultFromApp", (const char *)&unk_195251F31, v10, 2u);
      }

      MRAddCommandResultToXPCMessage(reply, v3);
      xpc_connection_send_message(v4, reply);
    }
  }
  if (*(void *)(a1 + 48) != -1 && sandbox_extension_release() == -1)
  {
    v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___MRServiceHandleRemoteCommandMessage_block_invoke_cold_1();
    }
  }
}

void ___MRServiceHandleRemoteCommandMessage_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_194F3C000, v0, v1, "Failed to release sandbox extension.", v2, v3, v4, v5, v6);
}

@end