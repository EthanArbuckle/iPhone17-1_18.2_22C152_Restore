@interface SFAutomaticPasswordInputViewControllerClass
@end

@implementation SFAutomaticPasswordInputViewControllerClass

Class __get_SFAutomaticPasswordInputViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB25B2E8)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __SafariServicesLibraryCore_block_invoke_1;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E52F3C68;
    uint64_t v8 = 0;
    qword_1EB25B2E8 = _sl_dlopen();
  }
  if (!qword_1EB25B2E8)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *SafariServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UIInputViewController.m", 49, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("_SFAutomaticPasswordInputViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class get_SFAutomaticPasswordInputViewControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UIInputViewController.m", 50, @"Unable to find class %s", "_SFAutomaticPasswordInputViewController");

LABEL_10:
    __break(1u);
  }
  qword_1EB25B2E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end