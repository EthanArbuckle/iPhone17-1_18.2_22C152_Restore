@interface NETRBClientGetDynamicStoreKey
@end

@implementation NETRBClientGetDynamicStoreKey

uint64_t ___NETRBClientGetDynamicStoreKey_block_invoke(uint64_t a1)
{
  uint64_t result = __NETRBClientValidateClient(*(unsigned char **)(a1 + 40));
  if (result) {
    return NETRBErrorLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

@end