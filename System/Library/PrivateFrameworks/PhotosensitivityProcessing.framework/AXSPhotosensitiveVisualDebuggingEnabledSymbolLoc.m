@interface AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc
@end

@implementation AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc

void *__get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSPhotosensitiveVisualDebuggingEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end