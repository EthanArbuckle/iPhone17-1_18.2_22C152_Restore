@interface SFExternalPasswordCredentialViewControllerClass
@end

@implementation SFExternalPasswordCredentialViewControllerClass

void __get_SFExternalPasswordCredentialViewControllerClass_block_invoke(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_SFExternalPasswordCredentialViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SFExternalPasswordCredentialViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_SFExternalPasswordCredentialViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIKeyboardVCPresenter.m", 47, @"Unable to find class %s", "_SFExternalPasswordCredentialViewController");

    __break(1u);
  }
}

@end