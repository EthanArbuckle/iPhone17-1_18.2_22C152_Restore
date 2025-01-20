@interface NSURL(SSURLAdditions)
- (uint64_t)isStoreServicesURL;
@end

@implementation NSURL(SSURLAdditions)

- (uint64_t)isStoreServicesURL
{
  uint64_t result = [a1 scheme];
  if (result) {
    return objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", @"itms-services") == 0;
  }
  return result;
}

@end