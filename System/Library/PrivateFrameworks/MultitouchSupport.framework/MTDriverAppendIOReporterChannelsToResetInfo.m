@interface MTDriverAppendIOReporterChannelsToResetInfo
@end

@implementation MTDriverAppendIOReporterChannelsToResetInfo

uint64_t ___MTDriverAppendIOReporterChannelsToResetInfo_block_invoke(uint64_t a1)
{
  ChannelName = (const void *)IOReportChannelGetChannelName();
  uint64_t valuePtr = IOReportSimpleGetIntegerValue();
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), ChannelName, v3);
    CFRelease(v4);
  }
  return 0;
}

@end