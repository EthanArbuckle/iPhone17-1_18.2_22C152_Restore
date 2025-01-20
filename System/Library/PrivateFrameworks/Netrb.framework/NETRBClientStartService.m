@interface NETRBClientStartService
@end

@implementation NETRBClientStartService

double ___NETRBClientStartService_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 40))
    || *(unsigned char *)(*(void *)(a1 + 40) + 289)
    || (xpc_object_t v3 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v4 = v3;
    xpc_dictionary_set_uint64(v3, netrbXPCKey, 0x3E9uLL);
    xpc_dictionary_set_string(v4, netrbXPCClientID, (const char *)(*(void *)(a1 + 40) + 32));
    xpc_dictionary_set_uint64(v4, netrbXPCOpMode, *(unsigned int *)(a1 + 72));
    xpc_dictionary_set_uint64(v4, netrbXPCBridgeType, *(unsigned int *)(a1 + 76));
    xpc_dictionary_set_value(v4, netrbXPCInterfaceParam, *(xpc_object_t *)(a1 + 48));
    v5 = *(const char **)(a1 + 56);
    if (v5 && *v5)
    {
      if (!strncmp(*(const char **)(a1 + 56), (const char *)netrbClientAnyExternal, 0x10uLL))
      {
        v7 = netrbXPCAnyExternal;
        v6 = v4;
      }
      else
      {
        v6 = v4;
        v7 = v5;
      }
      xpc_dictionary_set_string(v6, netrbXPCExtName, v7);
    }
    NETRBInfoLog();
    snprintf((char *)(*(void *)(a1 + 40) + 289), 0x100uLL, "%s-%p-%u", "com.apple.netrb", *(const void **)(a1 + 40), __netrbStartId);
    ++__netrbStartId;
    v8 = *(NSObject **)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = ___NETRBClientStartService_block_invoke_2;
    v10[3] = &__block_descriptor_tmp_79;
    v10[4] = *(void *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(v8, v4, (uint64_t)v10);
    xpc_release(v4);
    uint64_t v9 = *(void *)(a1 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      CFRetain((CFTypeRef)v9);
    }
    else
    {
      double result = 0.0;
      *(_OWORD *)(v9 + 513) = 0u;
      *(_OWORD *)(v9 + 529) = 0u;
      *(_OWORD *)(v9 + 481) = 0u;
      *(_OWORD *)(v9 + 497) = 0u;
      *(_OWORD *)(v9 + 449) = 0u;
      *(_OWORD *)(v9 + 465) = 0u;
      *(_OWORD *)(v9 + 417) = 0u;
      *(_OWORD *)(v9 + 433) = 0u;
      *(_OWORD *)(v9 + 385) = 0u;
      *(_OWORD *)(v9 + 401) = 0u;
      *(_OWORD *)(v9 + 353) = 0u;
      *(_OWORD *)(v9 + 369) = 0u;
      *(_OWORD *)(v9 + 321) = 0u;
      *(_OWORD *)(v9 + 337) = 0u;
      *(_OWORD *)(v9 + 289) = 0u;
      *(_OWORD *)(v9 + 305) = 0u;
    }
  }
  return result;
}

void ___NETRBClientStartService_block_invoke_2(uint64_t a1, void *a2)
{
}

@end