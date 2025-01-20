@interface NETRBClientAddIPPortForwardingRule
@end

@implementation NETRBClientAddIPPortForwardingRule

void ___NETRBClientAddIPPortForwardingRule_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 48)))
  {
    NETRBErrorLog();
  }
  else
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F7uLL);
    PortForwardingRuleDict = netrbMakePortForwardingRuleDict(*(unsigned __int8 *)(a1 + 76), *(unsigned __int16 *)(a1 + 72), *(unsigned __int8 *)(a1 + 77), *(void **)(a1 + 56), *(unsigned __int16 *)(a1 + 74));
    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, PortForwardingRuleDict);
    xpc_release(PortForwardingRuleDict);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke_2;
    v5[3] = &unk_264240F00;
    uint64_t v4 = *(void *)(a1 + 48);
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    NETRBInfoLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NETRBXPCSetupAndSend(*(NSObject **)(a1 + 64), v2, (uint64_t)v5);
    xpc_release(v2);
  }
}

void ___NETRBClientAddIPPortForwardingRule_block_invoke_2(uint64_t a1, void *a2)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      LOBYTE(a2) = xpc_dictionary_get_uint64(a2, netrbXPCResponse) == 2001;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke_3;
    v6[3] = &unk_264240ED8;
    v6[4] = v4;
    char v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }
}

uint64_t ___NETRBClientAddIPPortForwardingRule_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end