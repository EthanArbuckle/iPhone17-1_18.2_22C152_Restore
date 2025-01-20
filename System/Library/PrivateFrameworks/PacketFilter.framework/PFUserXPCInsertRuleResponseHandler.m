@interface PFUserXPCInsertRuleResponseHandler
@end

@implementation PFUserXPCInsertRuleResponseHandler

void ____PFUserXPCInsertRuleResponseHandler_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v2) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v2, (const char *)pfXPCKeyInsertID);
  }
  else {
    uint64_t uint64 = 0;
  }
  (*(void (**)(uint64_t, BOOL, uint64_t))(v3 + 16))(v3, v4 != 0, uint64);
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    xpc_release(v6);
  }
}

@end