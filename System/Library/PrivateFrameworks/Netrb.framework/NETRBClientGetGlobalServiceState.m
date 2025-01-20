@interface NETRBClientGetGlobalServiceState
@end

@implementation NETRBClientGetGlobalServiceState

void ___NETRBClientGetGlobalServiceState_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 64))
    || (xpc_object_t v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EBuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 64) + 32));
    NETRBInfoLog();
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___NETRBClientGetGlobalServiceState_block_invoke_2;
    v5[3] = &unk_264240B70;
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v6 = *(_OWORD *)(a1 + 40);
    long long v7 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v5);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientGetGlobalServiceState_block_invoke_2(void *a1, void *a2)
{
  uint64_t result = NETRBInfoLog();
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(void *)(*(void *)(a1[4] + 8) + 24) = result;
    if (*(void *)(*(void *)(a1[4] + 8) + 24) == 2001)
    {
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = xpc_dictionary_get_uint64(a2, netrbXPCState);
      uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCReason);
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

@end