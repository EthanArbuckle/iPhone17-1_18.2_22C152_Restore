@interface ICURLRequestClass
@end

@implementation ICURLRequestClass

void __get_ICURLRequestClass_block_invoke(uint64_t a1)
{
  WorkflowKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_ICURLRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_ICURLRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_ICURLRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"VCVoiceShortcutClient.m", 41, @"Unable to find class %s", "_ICURLRequest");

    __break(1u);
  }
}

@end