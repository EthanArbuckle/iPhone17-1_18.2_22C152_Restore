@interface HOUtilities
+ (double)buttonPaddingToViewBottomForViewSizeSubclass:(int64_t)a3;
+ (double)viewMarginInsetForViewSizeSubclass:(int64_t)a3 withViewWidth:(double)a4;
+ (id)onboardingStatesForRestrictedGuestInvitation:(id)a3;
@end

@implementation HOUtilities

+ (double)viewMarginInsetForViewSizeSubclass:(int64_t)a3 withViewWidth:(double)a4
{
  double result = (a4 + -288.0) * 0.5;
  if (a3 > 2) {
    return 74.0;
  }
  return result;
}

+ (double)buttonPaddingToViewBottomForViewSizeSubclass:(int64_t)a3
{
  double result = 60.0;
  if (a3 != 3) {
    return 24.0;
  }
  return result;
}

+ (id)onboardingStatesForRestrictedGuestInvitation:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 isInviteeRestrictedGuest])
  {
    v5 = [v3 restrictedGuestSchedule];

    if (v5) {
      [v4 addObject:&off_1000CB6A0];
    }
    [v4 addObject:&off_1000CB6B8];
    [v4 addObject:&off_1000CB6D0];
  }
  id v6 = [v4 copy];

  return v6;
}

@end