@interface SUIShareActivity
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming;
- (BOOL)ss_shouldExecuteInShareSheet;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)_defaultSortGroup;
@end

@implementation SUIShareActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.Share";
}

- (int64_t)_defaultSortGroup
{
  return 2;
}

- (id)_systemImageName
{
  return @"square.and.arrow.up";
}

- (id)activityTitle
{
  v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Share[Activity]" value:@"Share" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 0;
}

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

@end