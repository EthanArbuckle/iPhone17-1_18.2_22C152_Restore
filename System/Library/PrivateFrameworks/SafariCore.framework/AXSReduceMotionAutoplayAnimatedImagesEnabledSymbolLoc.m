@interface AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc
@end

@implementation AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc

void *__get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v4 = 0;
  v2 = (void *)libAccessibilityLibraryCore();
  if (!v2) {
    __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke_cold_1(&v4);
  }
  result = dlsym(v2, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *libAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSAccessibilityUtilities.m", 11, @"%s", *a1);

  __break(1u);
}

@end