@interface PFUserInsertRule
@end

@implementation PFUserInsertRule

void __PFUserInsertRule_S_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    PFManagerInfoLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = PFManagerSendMessage(*(void **)(a1 + 56), *(const char **)(*(void *)(a1 + 48) + 24), *(const char **)(*(void *)(a1 + 48) + 32), 0x3E9u, *(unsigned __int16 *)(a1 + 64), 0);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v2 = (void *)PFXPCGetResponse();
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(v2, (const char *)pfXPCKeyInsertID);
      v3 = (void *)PFXPCGetResponse();
      xpc_release(v3);
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end