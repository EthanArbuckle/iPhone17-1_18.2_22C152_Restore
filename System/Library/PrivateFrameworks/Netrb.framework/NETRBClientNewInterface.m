@interface NETRBClientNewInterface
@end

@implementation NETRBClientNewInterface

unsigned char *___NETRBClientNewInterface_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(unsigned char **)(a1 + 48))) {
    return (unsigned char *)NETRBErrorLog();
  }
  if (*(unsigned char *)(*(void *)(a1 + 48) + 545))
  {
    return (unsigned char *)NETRBErrorLog();
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCKey, 0x3F6uLL);
  xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCOpMode, *(unsigned int *)(a1 + 80));
  xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32));
  if (*(unsigned char *)(a1 + 88))
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 56))) {
      xpc_dictionary_set_uuid(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCMACUUID, *(const unsigned __int8 **)(a1 + 56));
    }
  }
  else
  {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCAllocateMACAddress, 0);
  }
  v3 = *(const char **)(a1 + 64);
  if (v3) {
    xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCExtName, v3);
  }
  if (*(unsigned char *)(a1 + 89)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCEnableTSO, 1);
  }
  if (*(unsigned char *)(a1 + 90)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCEnableMACNAT, 1);
  }
  if (*(unsigned char *)(a1 + 91)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCEnableIsolation, 1);
  }
  if (*(unsigned char *)(a1 + 92)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCEnableChecksumOffload, 1);
  }
  uint64_t v4 = *(int *)(a1 + 84);
  if (v4) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), netrbXPCInterfaceMTU, v4);
  }
  NETRBInfoLog();
  uint64_t v5 = *(void *)(a1 + 48);
  *(unsigned char *)(v5 + 545) = 1;
  v6 = *(NSObject **)(a1 + 72);
  v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___NETRBClientNewInterface_block_invoke_2;
  v9[3] = &__block_descriptor_tmp_150;
  v9[4] = v5;
  BOOL v8 = NETRBXPCSetupAndSend(v6, v7, (uint64_t)v9);
  result = *(unsigned char **)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return CFRetain(result);
  }
  result[545] = 0;
  return result;
}

void ___NETRBClientNewInterface_block_invoke_2(uint64_t a1, void *a2)
{
}

@end