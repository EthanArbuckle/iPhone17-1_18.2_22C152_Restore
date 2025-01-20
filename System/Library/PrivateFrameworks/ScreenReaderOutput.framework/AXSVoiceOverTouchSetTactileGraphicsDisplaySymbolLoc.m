@interface AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc
@end

@implementation AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc

void *__get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSVoiceOverTouchSetTactileGraphicsDisplay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

@end