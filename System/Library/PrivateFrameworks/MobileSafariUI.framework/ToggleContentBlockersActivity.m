@interface ToggleContentBlockersActivity
- (BOOL)canPerformWithTabDocument:(id)a3;
- (id)activityTitleWithTabDocument:(id)a3;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation ToggleContentBlockersActivity

- (id)activityType
{
  return @"SafariActivityTypeToggleContentBlockers";
}

- (id)activityTitleWithTabDocument:(id)a3
{
  [a3 wasLoadedWithContentBlockersEnabled];
  v3 = _WBSLocalizedString();
  return v3;
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  if ([a3 wasLoadedWithContentBlockersEnabled]) {
    v3 = @"shield.slash";
  }
  else {
    v3 = @"checkmark.shield";
  }
  return v3;
}

- (int64_t)actionType
{
  return 19;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3 = a3;
  if ([v3 isShowingReader])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v3 browserController];
    v6 = [v5 perSitePreferencesVendor];
    v7 = [v6 contentBlockersPreferenceManager];
    char v4 = [v7 hasEnabledContentBlockers];
  }
  return v4;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "reloadDisablingContentBlockers:", objc_msgSend(v4, "wasLoadedWithContentBlockersEnabled") ^ 1);

  [(_SFActivity *)self activityDidFinish:1];
}

@end