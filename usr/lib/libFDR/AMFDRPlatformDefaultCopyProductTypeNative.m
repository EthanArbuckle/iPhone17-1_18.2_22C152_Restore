@interface AMFDRPlatformDefaultCopyProductTypeNative
@end

@implementation AMFDRPlatformDefaultCopyProductTypeNative

CFStringRef ___AMFDRPlatformDefaultCopyProductTypeNative_block_invoke()
{
  CFStringRef result = AMFDRSealingMapCallMGCopyAnswer(@"ProductType", 0);
  _AMFDRPlatformDefaultCopyProductTypeNative_productType = (uint64_t)result;
  return result;
}

@end