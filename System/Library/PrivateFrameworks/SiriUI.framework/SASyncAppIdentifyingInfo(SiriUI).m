@interface SASyncAppIdentifyingInfo(SiriUI)
- (__CFString)siriui_bundleId;
- (uint64_t)siriui_isSurfAppInfo;
@end

@implementation SASyncAppIdentifyingInfo(SiriUI)

- (uint64_t)siriui_isSurfAppInfo
{
  v1 = [a1 bundleId];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.ApplePayDisambiguationItem"];

  return v2;
}

- (__CFString)siriui_bundleId
{
  if (objc_msgSend(a1, "siriui_isSurfAppInfo"))
  {
    uint64_t v2 = @"com.apple.MobileSMS";
  }
  else
  {
    uint64_t v2 = [a1 bundleId];
  }
  return v2;
}

@end