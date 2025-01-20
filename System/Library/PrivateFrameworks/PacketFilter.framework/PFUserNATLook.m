@interface PFUserNATLook
@end

@implementation PFUserNATLook

void __PFUserNATLook_S_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    PFManagerInfoLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = PFManagerSendMessage(*(void **)(a1 + 56), *(const char **)(*(void *)(a1 + 48) + 24), *(const char **)(*(void *)(a1 + 48) + 32), 0x3EEu, 0xFFFFFFFFuLL, 0);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v2 = (void *)PFXPCGetResponse();
      xpc_object_t value = xpc_dictionary_get_value(v2, (const char *)pfXPCKeyRule);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_copy(value);
      v4 = (void *)PFXPCGetResponse();
      xpc_release(v4);
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end