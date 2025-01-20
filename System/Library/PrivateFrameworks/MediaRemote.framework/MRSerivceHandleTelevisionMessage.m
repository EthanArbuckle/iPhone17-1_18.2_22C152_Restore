@interface MRSerivceHandleTelevisionMessage
@end

@implementation MRSerivceHandleTelevisionMessage

void ___MRSerivceHandleTelevisionMessage_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x60000000000000ALL)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v4;
    if (v3 && *(void *)(v3 + 8))
    {
      v6 = MRCreatePropertyListFromXPCMessage(v4, "MRXPC_CUSTOM_DATA_NAME_KEY");
      v7 = (void *)MRCreatePropertyListFromXPCMessage(v5, "MRXPC_CUSTOM_DATA_KEY");
      (*(void (**)(void))(*(void *)(v3 + 8) + 16))();
    }
    else
    {
      v6 = _MRLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "No callback for television custom data", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = uint64;
    v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Television client message %lu not handled", (uint8_t *)&v9, 0xCu);
    }
  }
}

@end