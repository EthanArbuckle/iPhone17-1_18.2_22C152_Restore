@interface BestEffortSymbolLoc
@end

@implementation BestEffortSymbolLoc

void *__getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __SecurityLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E548C990;
    uint64_t v6 = 0;
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary) {
    __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "SOSCCBailFromCircle_BestEffort");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *SecurityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFObliterationController.m", 35, @"%s", *a1);

  __break(1u);
}

@end