@interface BLHelper
+ (id)bootArgs;
+ (id)buildVersion;
+ (id)deviceBatteryLevel;
+ (id)deviceSerialNumber;
+ (id)encryptData:(id)a3;
+ (id)numberForBootArg:(id)a3;
+ (id)numberFromDouble:(double)a3;
+ (id)numberFromFloat:(float)a3;
+ (id)objectOrNSNull:(id)a3;
+ (id)stringFromFrameType:(unsigned int)a3;
+ (id)stringFromSequenceType:(unsigned int)a3;
+ (void)displayUserPrompt:(unint64_t)a3 strings:(id)a4 completion:(id)a5;
+ (void)writeTailspinToFile:(id)a3;
@end

@implementation BLHelper

+ (id)stringFromSequenceType:(unsigned int)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_26466FAC0[a3];
  }
}

+ (id)stringFromFrameType:(unsigned int)a3
{
  if (a3 > 4) {
    return @"unknown";
  }
  else {
    return off_26466FAE0[a3];
  }
}

+ (id)deviceSerialNumber
{
  if (deviceSerialNumber_onceToken != -1) {
    dispatch_once(&deviceSerialNumber_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)deviceSerialNumber_serialNumberString;

  return v2;
}

void __30__BLHelper_deviceSerialNumber__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)deviceSerialNumber_serialNumberString;
  deviceSerialNumber_serialNumberString = v0;

  if (!deviceSerialNumber_serialNumberString)
  {
    deviceSerialNumber_serialNumberString = [MEMORY[0x263EFF9D0] null];
    MEMORY[0x270F9A758]();
  }
}

+ (id)deviceBatteryLevel
{
  v2 = [MEMORY[0x263EFF9D0] null];
  CFTypeRef v3 = IOPSCopyPowerSourcesInfo();
  if (!v3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "sources", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 88, 0);
    v11 = 0;
    v12 = 0;
    goto LABEL_14;
  }
  v4 = v3;
  CFArrayRef v5 = IOPSCopyPowerSourcesList(v3);
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "array", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 90, 0);
    v11 = 0;
    v12 = 0;
    goto LABEL_13;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
    CFRelease(v6);
    v11 = 0;
    v12 = 0;
LABEL_12:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "totalCapacity != 0", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 108, 0);
    goto LABEL_13;
  }
  CFIndex v8 = Count;
  v22 = v2;
  uint64_t v23 = 0;
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = @"Type";
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
    CFDictionaryRef v15 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
    Value = CFDictionaryGetValue(v15, v13);
    if (Value && CFEqual(Value, @"InternalBattery"))
    {
      CFDictionaryGetValue(v15, @"Max Capacity");
      v18 = v17 = v13;

      v19 = CFDictionaryGetValue(v15, @"Current Capacity");

      v10 += [v18 longLongValue];
      v23 += [v19 longLongValue];
      v12 = v18;
      v13 = v17;
      v11 = v19;
    }
    ++v9;
  }
  while (v8 != v9);
  CFRelease(v6);
  if (!v10)
  {
    v2 = v22;
    goto LABEL_12;
  }
  v2 = [NSNumber numberWithDouble:(double)v23 * 100.0 / (double)v10];

LABEL_13:
  CFRelease(v4);
LABEL_14:
  id v20 = v2;

  return v20;
}

+ (id)bootArgs
{
  if (bootArgs_onceToken != -1) {
    dispatch_once(&bootArgs_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)bootArgs_bootArgs;

  return v2;
}

void __20__BLHelper_bootArgs__block_invoke()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], "IODeviceTree:/options");
  if (!v0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "entry", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 130, 0);
    return;
  }
  io_registry_entry_t v1 = v0;
  CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "boot-args", 0x8000100u);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v1, v2, 0, 0);
  CFRelease(v2);
  IOObjectRelease(v1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = CFProperty;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_8;
    }
    id v3 = (id)[[NSString alloc] initWithData:CFProperty encoding:1];
  }
  v4 = v3;
LABEL_8:
  uint64_t v5 = [v4 componentsSeparatedByString:@" "];
  CFArrayRef v6 = (void *)bootArgs_bootArgs;
  bootArgs_bootArgs = v5;
}

+ (id)numberForBootArg:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [a1 bootArgs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    CFIndex v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v12 = [v11 objectAtIndexedSubscript:0];
        int v13 = [v12 isEqualToString:v4];

        if (v13 && [v11 count] == 2)
        {
          v14 = NSNumber;
          CFDictionaryRef v15 = [v11 objectAtIndexedSubscript:1];
          uint64_t v16 = [v14 numberWithInteger:[v15 integerValue]];

          CFIndex v8 = (void *)v16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    CFIndex v8 = 0;
  }

  return v8;
}

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_62);
  }
  CFStringRef v2 = (void *)buildVersion_version;

  return v2;
}

void __24__BLHelper_buildVersion__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFF9D0] null];
  io_registry_entry_t v1 = (void *)buildVersion_version;
  buildVersion_version = v0;

  size_t v9 = 0;
  *(void *)uint64_t v10 = 0x4100000001;
  int v2 = sysctl(v10, 2u, 0, &v9, 0, 0);
  if (v2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0 ", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 195, v2);
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x263EFF990]);
    id v4 = (id) [v3 initWithLength:v9];
    int v5 = sysctl(v10, 2u, (void *)[v4 mutableBytes], &v9, 0, 0);
    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0 ", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 200, v5);
    }
    else
    {
      uint64_t v6 = NSString;
      id v4 = v4;
      uint64_t v7 = [v6 stringWithUTF8String:[v4 mutableBytes]];
      CFIndex v8 = (void *)buildVersion_version;
      buildVersion_version = v7;
    }
  }
}

+ (id)encryptData:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:biolog_cert_pem length:1631 freeWhenDone:0];
  if (!v4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "certData", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 217, 0);
    id v5 = 0;
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  id v5 = (id)SecCertificateCreateWithPEM();
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "cert", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 220, 0);
    goto LABEL_10;
  }
  uint64_t v6 = [MEMORY[0x263EFF990] data];
  int v7 = SecCMSCreateEnvelopedData();
  if (v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0 ", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 224, v7);
    id v5 = 0;
  }
  else
  {
    id v5 = v6;
    uint64_t v6 = v5;
  }
LABEL_5:

  return v5;
}

+ (void)displayUserPrompt:(unint64_t)a3 strings:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  NSLog(&cfstr_Displayuserpro.isa, a3, v7 != 0, v8 != 0);
  if (v7)
  {
    if ([v7 count])
    {
      if ((displayUserPrompt_strings_completion__displaying & 1) == 0)
      {
        displayUserPrompt_strings_completion__displaying = 1;
        size_t v9 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__BLHelper_displayUserPrompt_strings_completion___block_invoke;
        block[3] = &unk_26466FAA0;
        id v11 = v7;
        unint64_t v13 = a3;
        id v12 = v8;
        dispatch_async(v9, block);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "[strings count] >= 1", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 238, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "strings", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 237, 0);
  }
}

uint64_t __49__BLHelper_displayUserPrompt_strings_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];

  id v3 = 0;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] < 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2];
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] < 4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:3];
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] < 5)
  {
    otherButtonTitle = 0;
  }
  else
  {
    otherButtonTitle = [*(id *)(a1 + 32) objectAtIndexedSubscript:4];
  }
  CFOptionFlags v9 = 0;
  NSLog(&cfstr_Displayuserpro_0.isa, v2, v3);
  SInt32 v7 = CFUserNotificationDisplayAlert(0.0, *(void *)(a1 + 48), 0, 0, 0, v2, v3, v4, v5, otherButtonTitle, &v9);
  if (v7)
  {
    uint64_t result = fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == 0 ", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLHelper.m", 264, v7);
  }
  else
  {
    NSLog(&cfstr_Displayuserpro_1.isa, v9);
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  displayUserPrompt_strings_completion__displaying = 0;
  return result;
}

+ (void)writeTailspinToFile:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 514, 384);
  if (v4 != -1)
  {
    int v5 = v4;
    uint64_t v8 = *MEMORY[0x263F8C828];
    v9[0] = MEMORY[0x263EFFA88];
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    char v7 = tailspin_dump_output_with_options_sync();

    if ((v7 & 1) == 0)
    {
      NSLog(&cfstr_Writetailspint.isa, v3);
      unlink((const char *)[v3 fileSystemRepresentation]);
    }
    close(v5);
  }
}

+ (id)numberFromFloat:(float)a3
{
  [NSNumber numberWithFloat:];
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v4 = [MEMORY[0x263F087B0] notANumber];
  int v5 = [(__CFString *)v3 isEqualToNumber:v4];

  if (v5)
  {

    id v3 = @"(NaN)";
  }

  return v3;
}

+ (id)numberFromDouble:(double)a3
{
  id v3 = [NSNumber numberWithDouble:a3];
  int v4 = [MEMORY[0x263F087B0] notANumber];
  int v5 = [(__CFString *)v3 isEqualToNumber:v4];

  if (v5)
  {

    id v3 = @"(NaN)";
  }

  return v3;
}

+ (id)objectOrNSNull:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }

  return v3;
}

@end