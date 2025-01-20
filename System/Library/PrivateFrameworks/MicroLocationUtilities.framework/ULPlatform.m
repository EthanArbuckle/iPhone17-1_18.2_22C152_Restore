@interface ULPlatform
+ (BOOL)isInternalInstall;
+ (BOOL)isIpad;
+ (BOOL)isIphone;
+ (BOOL)isIpod;
+ (BOOL)isMac;
+ (BOOL)isMacBook;
+ (BOOL)isRunningInXCTestEnvironment;
+ (id)_mobileGestaltAnswerForQuestion:(__CFString *)a3;
+ (id)buildVersion;
+ (id)platformInfo;
@end

@implementation ULPlatform

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isMacBook
{
  return 0;
}

+ (BOOL)isIphone
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__ULPlatform_isIphone__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIphone_onceToken != -1) {
    dispatch_once(&isIphone_onceToken, block);
  }
  return [(id)isIphone_value isEqual:@"iPhone"];
}

uint64_t __22__ULPlatform_isIphone__block_invoke(uint64_t a1)
{
  isIphone_value = [*(id *)(a1 + 32) _mobileGestaltAnswerForQuestion:@"+3Uf0Pm5F8Xy7Onyvko0vA"];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)isIpad
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__ULPlatform_isIpad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIpad_onceToken != -1) {
    dispatch_once(&isIpad_onceToken, block);
  }
  return [(id)isIpad_value isEqual:@"iPad"];
}

uint64_t __20__ULPlatform_isIpad__block_invoke(uint64_t a1)
{
  isIpad_value = [*(id *)(a1 + 32) _mobileGestaltAnswerForQuestion:@"+3Uf0Pm5F8Xy7Onyvko0vA"];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)isIpod
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__ULPlatform_isIpod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIpod_onceToken != -1) {
    dispatch_once(&isIpod_onceToken, block);
  }
  return [(id)isIpod_value isEqual:@"iPod"];
}

uint64_t __20__ULPlatform_isIpod__block_invoke(uint64_t a1)
{
  isIpod_value = [*(id *)(a1 + 32) _mobileGestaltAnswerForQuestion:@"+3Uf0Pm5F8Xy7Onyvko0vA"];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_2);
  }
  return isInternalInstall_isInternalInstall;
}

uint64_t __31__ULPlatform_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isInternalInstall_isInternalInstall = result;
  return result;
}

+ (id)buildVersion
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__ULPlatform_buildVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, block);
  }
  v2 = (void *)buildVersion_value;

  return v2;
}

uint64_t __26__ULPlatform_buildVersion__block_invoke(uint64_t a1)
{
  buildVersion_value = [*(id *)(a1 + 32) _mobileGestaltAnswerForQuestion:@"BuildVersion"];

  return MEMORY[0x270F9A758]();
}

+ (id)platformInfo
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isMac"));
  [v6 appendFormat:@", isMac: %@", v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isMacBook"));
  [v6 appendFormat:@", isMacBook: %@", v8];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isIphone"));
  [v6 appendFormat:@", isIphone: %@", v9];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isIpad"));
  [v6 appendFormat:@", isIpad: %@", v10];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isIpod"));
  [v6 appendFormat:@", isIpod: %@", v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isInternalInstall"));
  [v6 appendFormat:@", isInternalInstall: %@", v12];

  v13 = [a1 buildVersion];
  [v6 appendFormat:@", buildVersion: %@", v13];

  [v6 appendString:@">"];
  v14 = (void *)[v6 copy];

  return v14;
}

+ (BOOL)isRunningInXCTestEnvironment
{
  if (isRunningInXCTestEnvironment_onceToken != -1) {
    dispatch_once(&isRunningInXCTestEnvironment_onceToken, &__block_literal_global_44);
  }
  return 0;
}

+ (id)_mobileGestaltAnswerForQuestion:(__CFString *)a3
{
  id v3 = (void *)MGCopyAnswer();
  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }

  return v4;
}

@end