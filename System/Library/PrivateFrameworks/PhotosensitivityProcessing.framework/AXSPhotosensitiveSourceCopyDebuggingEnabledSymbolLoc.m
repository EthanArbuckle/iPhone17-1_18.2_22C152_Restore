@interface AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc
@end

@implementation AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc

void *__get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSPhotosensitiveSourceCopyDebuggingEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

@end