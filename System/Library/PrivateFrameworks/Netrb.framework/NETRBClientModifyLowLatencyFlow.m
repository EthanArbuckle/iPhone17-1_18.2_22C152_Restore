@interface NETRBClientModifyLowLatencyFlow
@end

@implementation NETRBClientModifyLowLatencyFlow

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 40)))
  {
    uint64_t result = NETRBErrorLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), netrbXPCClientID, (const char *)(*(void *)(a1 + 40) + 32));
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v3 = 1019;
    }
    else {
      uint64_t v3 = 1018;
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), netrbXPCKey, v3);
    NETRBInfoLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke_2;
    v5[3] = &unk_264241130;
    long long v6 = *(_OWORD *)(a1 + 32);
    return NETRBXPCSetupAndSend(0, v4, (uint64_t)v5);
  }
  return result;
}

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2
    && MEMORY[0x2166B88A0](a2) == MEMORY[0x263EF8708]
    && (xpc_object_t value = xpc_dictionary_get_value(a2, netrbXPCResponse)) != 0
    && (long long v6 = value, MEMORY[0x2166B88A0]() == MEMORY[0x263EF87A0]))
  {
    if (xpc_uint64_get_value(v6) == 2001) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    NETRBErrorLog();
  }
  return NETRBInfoLog();
}

@end