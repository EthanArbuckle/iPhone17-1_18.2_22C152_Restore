@interface NSURLSessionConfiguration(SafariCoreExtras)
+ (id)safari_ephemeralSessionConfiguration;
@end

@implementation NSURLSessionConfiguration(SafariCoreExtras)

+ (id)safari_ephemeralSessionConfiguration
{
  v0 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  objc_msgSend(v0, "set_loggingPrivacyLevel:", 3);
  return v0;
}

@end