@interface NSString
@end

@implementation NSString

uint64_t __60__NSString_MobileBackup__mb_stringByAppendingGreenteaSuffix__block_invoke(uint64_t a1)
{
  v2 = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", 5);
  if (!v2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"NSString+MobileBackup.m" lineNumber:60 description:@"Unable to dlopen IOKit!"];
  }
  v3 = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 5);
  if (!v3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"NSString+MobileBackup.m" lineNumber:62 description:@"Unable top dlopen AppSupport!"];
  }
  mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode = (uint64_t (*)(void))dlsym(v3, "CPGetDeviceRegionCode");
  mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService = dlsym(v2, "IOServiceGetMatchingService");
  mb_stringByAppendingGreenteaSuffix_IOServiceMatching = dlsym(v2, "IOServiceMatching");
  v4 = (unsigned int *)dlsym(v2, "kIOMainPortDefault");
  mb_stringByAppendingGreenteaSuffix_kIOMainPortDefault = (uint64_t)v4;
  if (!mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode
    || (v5 = (uint64_t (*)(uint64_t, uint64_t))mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService) == 0
    || (v6 = (uint64_t (*)(const char *))mb_stringByAppendingGreenteaSuffix_IOServiceMatching) == 0
    || !v4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"NSString+MobileBackup.m" lineNumber:68 description:@"Unable to setup soft linking!"];

    v5 = (uint64_t (*)(uint64_t, uint64_t))mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService;
    v4 = (unsigned int *)mb_stringByAppendingGreenteaSuffix_kIOMainPortDefault;
    v6 = (uint64_t (*)(const char *))mb_stringByAppendingGreenteaSuffix_IOServiceMatching;
  }
  uint64_t v7 = *v4;
  uint64_t v8 = v6("AppleBaseband");
  uint64_t v9 = v5(v7, v8);
  unsigned int v10 = v9 - 1;
  if ((v9 - 1) <= 0xFFFFFFFD) {
    uint64_t v9 = mach_port_deallocate(*MEMORY[0x1E4F14960], v9);
  }
  uint64_t result = [(id)mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode(v9) isEqualToString:@"CH"];
  if (v10 < 0xFFFFFFFE) {
    char v12 = result;
  }
  else {
    char v12 = 0;
  }
  mb_stringByAppendingGreenteaSuffix_isGreenTea = v12;
  return result;
}

@end