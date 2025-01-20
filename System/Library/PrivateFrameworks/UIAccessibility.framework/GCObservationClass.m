@interface GCObservationClass
@end

@implementation GCObservationClass

Class __get_GCObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!GameControllerLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __GameControllerLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E59B9840;
    uint64_t v5 = 0;
    GameControllerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!GameControllerLibraryCore_frameworkLibrary_0) {
    __get_GCObservationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_GCObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_GCObservationClass_block_invoke_cold_2();
  }
  get_GCObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_GCObservationClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *GameControllerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIAccessibilityGamepadEventSource.m", 16, @"%s", *a1);

  __break(1u);
}

void __get_GCObservationClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_GCObservationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityGamepadEventSource.m", 17, @"Unable to find class %s", "_GCObservation");

  __break(1u);
}

@end