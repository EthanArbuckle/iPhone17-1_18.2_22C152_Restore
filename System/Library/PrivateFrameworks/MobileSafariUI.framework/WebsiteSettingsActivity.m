@interface WebsiteSettingsActivity
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation WebsiteSettingsActivity

- (id)activityType
{
  return @"SafariActivityTypeWebsiteSettings";
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"gear";
}

- (int64_t)actionType
{
  return 24;
}

- (void)performActivityWithTabDocument:(id)a3
{
  [a3 perSiteSettingsUIPresentSettings];
  [(_SFActivity *)self activityDidFinish:1];
}

@end