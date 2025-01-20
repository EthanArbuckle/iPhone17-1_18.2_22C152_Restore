@interface UIKitGetTextEffectsCatalogSymbolLoc
@end

@implementation UIKitGetTextEffectsCatalogSymbolLoc

void *__get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55CE070;
    uint64_t v6 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary) {
    __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "_UIKitGetTextEffectsCatalog");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_UIKitGetTextEffectsCatalogSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *UIKitLibrary(void)"), @"__NSTextAppearanceInterface.m", 16, @"%s", *a1);
  __break(1u);
}

@end