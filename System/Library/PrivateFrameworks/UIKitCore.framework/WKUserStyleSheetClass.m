@interface WKUserStyleSheetClass
@end

@implementation WKUserStyleSheetClass

void __get_WKUserStyleSheetClass_block_invoke(uint64_t a1)
{
  WebKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_WKUserStyleSheet");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_5_5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_WKUserStyleSheetClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIReferenceLibraryViewController.m", 53, @"Unable to find class %s", "_WKUserStyleSheet");

    __break(1u);
  }
}

@end