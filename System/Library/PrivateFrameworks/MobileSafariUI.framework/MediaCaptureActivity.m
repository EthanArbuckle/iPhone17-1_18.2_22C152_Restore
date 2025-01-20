@interface MediaCaptureActivity
- (BOOL)_wantsOriginalImageColor;
- (BOOL)canPerformWithTabDocument:(id)a3;
- (id)_activityStatusTintColor;
- (id)activityImageWithTabDocument:(id)a3;
- (id)activityTitleWithTabDocument:(id)a3;
- (id)activityType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation MediaCaptureActivity

- (id)activityTitleWithTabDocument:(id)a3
{
  if ([a3 mediaStateIcon])
  {
    SFTitleForTogglingMediaStateIcon();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1F3C268E8;
  }
  return v3;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return [a3 mediaStateIcon] != 0;
}

- (id)activityImageWithTabDocument:(id)a3
{
  [a3 mediaStateIcon];
  v3 = SFSystemImageNameForTogglingMediaStateIcon();
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
    if (v4)
    {
      v5 = [MEMORY[0x1E4FB1618] redColor];
      [v4 size];
      v6 = SFTintImage();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_wantsOriginalImageColor
{
  return 1;
}

- (id)_activityStatusTintColor
{
  return (id)[MEMORY[0x1E4FB1618] systemRedColor];
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F3B0E0];
}

- (void)performActivityWithTabDocument:(id)a3
{
  [a3 toggleMediaStateMuted];
  [(_SFActivity *)self activityDidFinish:1];
}

@end