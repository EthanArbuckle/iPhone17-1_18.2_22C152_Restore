@interface WFAssistantServicesWrapper
+ (BOOL)deviceSupportsSystemAssistantExperience;
@end

@implementation WFAssistantServicesWrapper

+ (BOOL)deviceSupportsSystemAssistantExperience
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  v10 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke;
    v6[3] = &unk_1E6558B78;
    v6[4] = &v7;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke(v6);
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v2) {
    return v2();
  }
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"BOOL soft_AFDeviceSupportsSystemAssistantExperience(void)"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFAssistantServicesWrapper.m", 14, @"%s", dlerror());

  __break(1u);
  return result;
}

@end