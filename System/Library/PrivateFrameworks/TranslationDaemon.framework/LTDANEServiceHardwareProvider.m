@interface LTDANEServiceHardwareProvider
@end

@implementation LTDANEServiceHardwareProvider

uint64_t __45___LTDANEServiceHardwareProvider_isAvailable__block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  isAvailable_uint64_t result = result;
  return result;
}

void __41___LTDANEServiceHardwareProvider_subType__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAvailable])
  {
    SEL v1 = NSSelectorFromString(&cfstr_Anesubtype.isa);
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2050000000;
    v2 = (void *)get_ANEDeviceInfoClass_softClass;
    uint64_t v10 = get_ANEDeviceInfoClass_softClass;
    if (!get_ANEDeviceInfoClass_softClass)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __get_ANEDeviceInfoClass_block_invoke;
      v6[3] = &unk_2655461D0;
      v6[4] = &v7;
      __get_ANEDeviceInfoClass_block_invoke((uint64_t)v6);
      v2 = (void *)v8[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v7, 8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = ((void (*)(id, SEL))[v3 methodForSelector:v1])(v3, v1);
      v5 = (void *)subType_result;
      subType_uint64_t result = v4;
    }
  }
}

@end