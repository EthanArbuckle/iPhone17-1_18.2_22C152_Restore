@interface CTServerConnectionGetCellularDataIsEnabledSymbolLoc
@end

@implementation CTServerConnectionGetCellularDataIsEnabledSymbolLoc

void *__get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionGetCellularDataIsEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

@end