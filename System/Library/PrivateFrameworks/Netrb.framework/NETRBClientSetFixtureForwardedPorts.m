@interface NETRBClientSetFixtureForwardedPorts
@end

@implementation NETRBClientSetFixtureForwardedPorts

void ___NETRBClientSetFixtureForwardedPorts_block_invoke(uint64_t a1)
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
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EEuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
    v4 = netrbXPCForwardedLowPort;
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), (const char *)netrbClientForwardedLowPort);
    xpc_dictionary_set_uint64(v3, v4, uint64);
    v6 = netrbXPCForwardedHighPort;
    uint64_t v7 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), (const char *)netrbClientForwardedHighPort);
    xpc_dictionary_set_uint64(v3, v6, v7);
    NETRBInfoLog();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    v8[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke_2;
    v8[3] = &unk_264240CB0;
    long long v9 = *(_OWORD *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v8);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientSetFixtureForwardedPorts_block_invoke_2(uint64_t a1, void *a2)
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