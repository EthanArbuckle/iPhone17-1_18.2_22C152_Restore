@interface NETRBClientGetIPPortForwardingRules
@end

@implementation NETRBClientGetIPPortForwardingRules

void ___NETRBClientGetIPPortForwardingRules_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 48)))
  {
    NETRBErrorLog();
  }
  else
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F9uLL);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
    if (v3 == 30 || v3 == 2)
    {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v5, netrbXPCPortForwardingRuleAddressFamily, v3);
    }
    else
    {
      xpc_object_t v5 = 0;
    }
    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, v5);
    xpc_release(v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    v7[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke_2;
    v7[3] = &unk_264240FF0;
    uint64_t v6 = *(void *)(a1 + 48);
    v7[4] = *(void *)(a1 + 32);
    v7[5] = v6;
    NETRBInfoLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NETRBXPCSetupAndSend(*(NSObject **)(a1 + 56), v2, (uint64_t)v7);
    xpc_release(v2);
  }
}

void ___NETRBClientGetIPPortForwardingRules_block_invoke_2(uint64_t a1, void *a2)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (a2)
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, netrbXPCPortForwardingRules);
    a2 = value;
    if (value) {
      xpc_retain(value);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke_3;
  v6[3] = &unk_264240FC8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  dispatch_async(global_queue, v6);
}

void ___NETRBClientGetIPPortForwardingRules_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_object_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    xpc_release(v2);
  }
}

@end