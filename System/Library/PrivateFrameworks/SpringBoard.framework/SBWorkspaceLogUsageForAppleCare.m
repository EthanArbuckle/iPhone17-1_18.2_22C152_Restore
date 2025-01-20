@interface SBWorkspaceLogUsageForAppleCare
@end

@implementation SBWorkspaceLogUsageForAppleCare

void ___SBWorkspaceLogUsageForAppleCare_block_invoke(uint64_t a1)
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Library/Logs/AppleSupport/general.log"];

  v4 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v3];
  if (v4)
  {
    unsigned int valuePtr = -1;
    unsigned int v15 = -1;
    CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
    if (v5)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v5);
      if (MatchingService)
      {
        io_registry_entry_t v7 = MatchingService;
        CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, @"AppleRawBatteryVoltage", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
        CFNumberRef v10 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, @"Amperage", v8, 0);
        if (CFProperty)
        {
          CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
          CFRelease(CFProperty);
        }
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberIntType, &v15);
          CFRelease(v10);
        }
        IOObjectRelease(v7);
      }
    }
    v11 = NSString;
    v12 = [MEMORY[0x1E4F1C9C8] date];
    v13 = [v11 stringWithFormat:@"%@,%d,%f,%f,%d,%d,%d\n", v12, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52), valuePtr, v15];

    v14 = [v13 dataUsingEncoding:4 allowLossyConversion:0];
    if (v14)
    {
      [v4 seekToEndOfFile];
      [v4 writeData:v14];
    }
    [v4 closeFile];
  }
  else
  {
    v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_1();
    }
  }
}

void ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Failed to write usage to %{public}@", v2, v3, v4, v5, v6);
}

void ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Failed to write usage to %{public}@: %{public}@");
}

@end