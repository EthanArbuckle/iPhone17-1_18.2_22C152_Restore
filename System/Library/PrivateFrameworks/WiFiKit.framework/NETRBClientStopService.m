@interface NETRBClientStopService
@end

@implementation NETRBClientStopService

void ___NETRBClientStopService_block_invoke(uint64_t a1)
{
  if (!__NETRBClientValidateClient(*(unsigned char **)(a1 + 40))
    && *(unsigned char *)(*(void *)(a1 + 40) + 289)
    && (xpc_object_t v2 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EAuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 40) + 32));
    NETRBInfoLog();
    v4 = (_OWORD *)(*(void *)(a1 + 40) + 289);
    v4[14] = 0u;
    v4[15] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientStopService_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_83;
    v5 = *(NSObject **)(a1 + 48);
    v6[4] = *(void *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(v5, v3, (uint64_t)v6);
    xpc_release(v3);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      CFRetain(*(CFTypeRef *)(a1 + 40));
    }
  }
  else
  {
    NETRBErrorLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void ___NETRBClientStopService_block_invoke_2(uint64_t a1, void *a2)
{
}

@end