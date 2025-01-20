@interface ReloadActivity
- (id)activityTitleWithTabDocument:(id)a3;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation ReloadActivity

- (id)activityTitleWithTabDocument:(id)a3
{
  [a3 canStopLoading];
  v3 = _WBSLocalizedString();
  return v3;
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  if ([a3 canStopLoading]) {
    v3 = @"xmark";
  }
  else {
    v3 = @"arrow.clockwise";
  }
  return v3;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F3B0E8];
}

- (int64_t)actionType
{
  return 1;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = a3;
  if ([v4 canStopLoading]) {
    [v4 stopLoadingUserInitiated];
  }
  else {
    [v4 reloadUserInitiated];
  }

  [(_SFActivity *)self activityDidFinish:1];
}

@end