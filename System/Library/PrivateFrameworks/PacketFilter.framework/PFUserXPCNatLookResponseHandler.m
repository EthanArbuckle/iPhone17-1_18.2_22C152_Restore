@interface PFUserXPCNatLookResponseHandler
@end

@implementation PFUserXPCNatLookResponseHandler

void ____PFUserXPCNatLookResponseHandler_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v2) {
    xpc_object_t value = xpc_dictionary_get_value(v2, (const char *)pfXPCKeyRule);
  }
  else {
    xpc_object_t value = 0;
  }
  (*(void (**)(uint64_t, BOOL, xpc_object_t))(v3 + 16))(v3, v4 != 0, value);
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    xpc_release(v6);
  }
}

@end