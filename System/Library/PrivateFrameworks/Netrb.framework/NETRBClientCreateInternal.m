@interface NETRBClientCreateInternal
@end

@implementation NETRBClientCreateInternal

void ___NETRBClientCreateInternal_block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 48);
  v3 = (__CFArray *)__netrbClientList;
  if (!__netrbClientList)
  {
    v7 = *(NSObject **)(a1 + 56);
    v6 = *(NSObject **)(a1 + 64);
    __netrbClientList = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
    if (!__netrbClientList)
    {
      v8 = __error();
      strerror(*v8);
      goto LABEL_12;
    }
    if (NETRBXPCCreate(v7, (uint64_t)v6))
    {
      if (NETRBXPCEndPointCreate(v6))
      {
        v3 = (__CFArray *)__netrbClientList;
        goto LABEL_2;
      }
      NETRBErrorLog();
      NETRBXPCCleanup();
    }
    else
    {
      NETRBErrorLog();
    }
    CFRelease((CFTypeRef)__netrbClientList);
    __netrbClientList = 0;
    goto LABEL_16;
  }
LABEL_2:
  CFArrayAppendValue(v3, v2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
LABEL_12:
    NETRBErrorLog();
LABEL_16:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    return;
  }
  v5 = v4;
  xpc_dictionary_set_uint64(v4, netrbXPCKey, 0x3E8uLL);
  NETRBInfoLog();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___NETRBClientCreateInternal_block_invoke_2;
  v9[3] = &unk_264240A18;
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 72);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v5, (uint64_t)v9);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
  }
  xpc_release(v5);
}

void ___NETRBClientCreateInternal_block_invoke_2(uint64_t a1, void *a2)
{
  NETRBInfoLog();
  if (!a2) {
    goto LABEL_6;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
  if (*(void *)(a1 + 48)) {
    **(_DWORD **)(a1 + 48) = xpc_dictionary_get_uint64(a2, netrbXPCErrorCode);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 2001
    || (xpc_object_t v4 = (char *)(*(void *)(a1 + 40) + 32),
        string = xpc_dictionary_get_string(a2, netrbXPCClientID),
        snprintf(v4, 0x100uLL, "%s", string),
        *(unsigned char *)(*(void *)(a1 + 40) + 288) = 1,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 2001))
  {
LABEL_6:
    v6 = *(const void **)(a1 + 40);
    __NETRBClientRemoveFromList(v6);
  }
}

@end