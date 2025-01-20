@interface NETRBClientDestroy
@end

@implementation NETRBClientDestroy

void ___NETRBClientDestroy_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 48)))
  {
    NETRBErrorLog();
LABEL_3:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    return;
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 288) = 0;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    NETRBErrorLog();
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    goto LABEL_3;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F4uLL);
  xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
  NETRBInfoLog();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___NETRBClientDestroy_block_invoke_2;
  v4[3] = &unk_26478FC78;
  long long v5 = *(_OWORD *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v4);
  xpc_release(v3);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
}

void ___NETRBClientDestroy_block_invoke_2(uint64_t a1, void *a2)
{
  NETRBInfoLog();
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
  }
  __NETRBClientRemoveFromList(*(const void **)(a1 + 40));
  v4 = *(const void **)(a1 + 40);
  CFRelease(v4);
}

@end