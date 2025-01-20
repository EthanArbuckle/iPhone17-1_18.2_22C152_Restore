@interface SFAppAutoFillPasswordViewControllerClass
@end

@implementation SFAppAutoFillPasswordViewControllerClass

void __get_SFAppAutoFillPasswordViewControllerClass_block_invoke(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_SFAppAutoFillPasswordViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SFAppAutoFillPasswordViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_SFAppAutoFillPasswordViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIKeyboardVCPresenter.m", 45, @"Unable to find class %s", "_SFAppAutoFillPasswordViewController");

    __break(1u);
  }
}

@end