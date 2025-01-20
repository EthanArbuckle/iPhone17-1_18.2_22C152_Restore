@interface AXSPhotosensitiveMitigationEnabledSymbolLoc
@end

@implementation AXSPhotosensitiveMitigationEnabledSymbolLoc

void *__get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSPhotosensitiveMitigationEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end