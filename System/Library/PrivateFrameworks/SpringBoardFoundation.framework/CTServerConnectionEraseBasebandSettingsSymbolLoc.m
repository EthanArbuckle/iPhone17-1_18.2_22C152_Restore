@interface CTServerConnectionEraseBasebandSettingsSymbolLoc
@end

@implementation CTServerConnectionEraseBasebandSettingsSymbolLoc

void *__get_CTServerConnectionEraseBasebandSettingsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionEraseBasebandSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end