@interface COSMLCaptureDisclosureController
+ (BOOL)disclosureEffectivelyAccepted;
+ (unint64_t)disclosureState;
+ (void)clearDisclosure;
+ (void)setUserAcceptedDisclosure:(BOOL)a3;
@end

@implementation COSMLCaptureDisclosureController

+ (unint64_t)disclosureState
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"COSMLCaptureDenied", @"com.apple.Bridge", &keyExistsAndHasValidFormat);
  unint64_t v3 = 1;
  if (AppBooleanValue) {
    unint64_t v3 = 2;
  }
  if (keyExistsAndHasValidFormat) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (BOOL)disclosureEffectivelyAccepted
{
  return (unint64_t)[a1 disclosureState] < 2;
}

+ (void)setUserAcceptedDisclosure:(BOOL)a3
{
  unint64_t v3 = +[NSNumber numberWithInt:!a3];

  CFPreferencesSetAppValue(@"COSMLCaptureDenied", v3, @"com.apple.Bridge");
}

+ (void)clearDisclosure
{
}

@end