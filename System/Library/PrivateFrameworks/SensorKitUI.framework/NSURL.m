@interface NSURL
+ (uint64_t)sk_PreferencesMotionAndFitness;
@end

@implementation NSURL

+ (uint64_t)sk_PreferencesMotionAndFitness
{
  self;
  v0 = NSURL;
  return [v0 URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/MOTION"];
}

@end