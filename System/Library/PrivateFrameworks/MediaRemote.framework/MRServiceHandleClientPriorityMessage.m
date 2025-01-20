@interface MRServiceHandleClientPriorityMessage
@end

@implementation MRServiceHandleClientPriorityMessage

void ___MRServiceHandleClientPriorityMessage_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x800000000000001)
  {
    v3 = *(void (***)(void *, uint64_t, void *, long long *))(a1 + 40);
    v4 = *(id *)(a1 + 32);
    kdebug_trace();
    if (v3 && *v3)
    {
      uint64_t v5 = xpc_dictionary_get_uint64(v4, "MRXPC_COMMAND_KEY");
      size_t length = 0;
      data = xpc_dictionary_get_data(v4, "MRXPC_COMMAND_OPTIONS_KEY", &length);
      if (data)
      {
        v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
        v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
        v9 = (void *)[v8 mutableCopy];
      }
      else
      {
        v9 = 0;
      }
      v11 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteOptionSanboxExtensionToken"];
      v12 = v11;
      if (v11)
      {
        [v11 UTF8String];
        uint64_t v13 = sandbox_extension_consume();
        if (v13 == -1)
        {
          v14 = _MRLogForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            ___MRServiceHandleClientPriorityMessage_block_invoke_cold_1();
          }
        }
        else
        {
          v14 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteOptionPlaybackSessionFilePath"];
          v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v14];
          [v9 setObject:v15 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackSessionData"];
        }
      }
      else
      {
        uint64_t v13 = -1;
      }
      v16 = _MRLogForCategory(2uLL);
      v17 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
      os_signpost_id_t v18 = [v17 hash];

      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_194F3C000, v16, OS_SIGNPOST_INTERVAL_END, v18, "SendCommandXPCToApp", (const char *)&unk_195251F31, (uint8_t *)&buf, 2u);
      }

      v19 = MRCreatePlayerPathFromXPCMessage(v4);
      v20 = *v3;
      v21 = (void *)[v9 copy];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v25 = ___MRServiceHandleRemoteCommandMessage_block_invoke;
      v26 = &unk_1E57D2788;
      v27 = v4;
      id v28 = v9;
      uint64_t v29 = v13;
      id v22 = v9;
      v20(v19, v5, v21, &buf);
    }
  }
  else
  {
    uint64_t v10 = uint64;
    v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC message with ID %lu not handled.", (uint8_t *)&buf, 0xCu);
    }
  }
}

void ___MRServiceHandleClientPriorityMessage_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_194F3C000, v0, v1, "Failed to consume sandbox extension.", v2, v3, v4, v5, v6);
}

@end