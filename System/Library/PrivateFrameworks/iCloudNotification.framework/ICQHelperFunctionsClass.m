@interface ICQHelperFunctionsClass
@end

@implementation ICQHelperFunctionsClass

Class __get_ICQHelperFunctionsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __iCloudQuotaLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264713678;
    uint64_t v5 = 0;
    iCloudQuotaLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudQuotaLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __get_ICQHelperFunctionsClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("_ICQHelperFunctions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  get_ICQHelperFunctionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_ICQHelperFunctionsClass_block_invoke_cold_1()
{
  v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
}

@end