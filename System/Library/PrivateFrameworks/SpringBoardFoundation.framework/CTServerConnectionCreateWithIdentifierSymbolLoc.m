@interface CTServerConnectionCreateWithIdentifierSymbolLoc
@end

@implementation CTServerConnectionCreateWithIdentifierSymbolLoc

void *__get_CTServerConnectionCreateWithIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionCreateWithIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end