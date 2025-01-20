@interface NETRBClientSetGlobalServiceState
@end

@implementation NETRBClientSetGlobalServiceState

void ___NETRBClientSetGlobalServiceState_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 48))
    || (xpc_object_t v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3ECuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
    xpc_dictionary_set_uint64(v3, netrbXPCState, *(unsigned int *)(a1 + 56));
    NETRBInfoLog();
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = ___NETRBClientSetGlobalServiceState_block_invoke_2;
    v4[3] = &unk_264240BC0;
    long long v5 = *(_OWORD *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v4);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientSetGlobalServiceState_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = NETRBInfoLog();
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end