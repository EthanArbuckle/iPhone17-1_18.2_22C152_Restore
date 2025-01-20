@interface AMFDRHttpRequestSendSyncNoRetry
@end

@implementation AMFDRHttpRequestSendSyncNoRetry

CFStringRef ___AMFDRHttpRequestSendSyncNoRetry_block_invoke()
{
  CFStringRef result = AMFDRSealingMapCallMGCopyAnswer(@"HWModelStr", 0);
  _AMFDRHttpRequestSendSyncNoRetry_hardwareModel = (uint64_t)result;
  if (!result)
  {
    return (const __CFString *)AMSupportLogInternal();
  }
  return result;
}

@end