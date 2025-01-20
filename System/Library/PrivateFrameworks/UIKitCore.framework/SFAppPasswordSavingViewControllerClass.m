@interface SFAppPasswordSavingViewControllerClass
@end

@implementation SFAppPasswordSavingViewControllerClass

Class __get_SFAppPasswordSavingViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB261FB0)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __SafariServicesLibraryCore_block_invoke_2;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E52FED58;
    uint64_t v8 = 0;
    qword_1EB261FB0 = _sl_dlopen();
  }
  if (!qword_1EB261FB0)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *SafariServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UIKBAutofillController.m", 144, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("_SFAppPasswordSavingViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class get_SFAppPasswordSavingViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UIKBAutofillController.m", 145, @"Unable to find class %s", "_SFAppPasswordSavingViewController");

LABEL_10:
    __break(1u);
  }
  qword_1EB261FA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFAppPasswordSavingViewControllerClass_block_invoke_0(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_SFAppPasswordSavingViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SFAppPasswordSavingViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_SFAppPasswordSavingViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIKeyboardVCPresenter.m", 46, @"Unable to find class %s", "_SFAppPasswordSavingViewController");

    __break(1u);
  }
}

@end