@interface RatingRequestHomeAvailability
+ (BOOL)shouldShowRatingRequestDiscoveryBanner;
+ (BOOL)shouldShowRatingRequestSuggestionsOnProactiveTray;
+ (void)setHasShownTipKitAlertOnProactiveTray;
@end

@implementation RatingRequestHomeAvailability

+ (BOOL)shouldShowRatingRequestDiscoveryBanner
{
  return 0;
}

+ (BOOL)shouldShowRatingRequestSuggestionsOnProactiveTray
{
  return MKGetHasUserConsentedToAddingContributions() != 2;
}

+ (void)setHasShownTipKitAlertOnProactiveTray
{
}

@end