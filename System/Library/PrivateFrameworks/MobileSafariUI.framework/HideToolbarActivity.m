@interface HideToolbarActivity
- (id)activityTitle;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation HideToolbarActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return @"SafariActivityTypeHideToolbar";
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return @"arrow.up.left.and.arrow.down.right";
}

- (int64_t)actionType
{
  return 17;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = a3;
  [(_SFActivity *)self activityDidFinish:1];
  id v5 = [v4 browserController];

  [v5 setKeepBarsMinimized:1];
}

@end