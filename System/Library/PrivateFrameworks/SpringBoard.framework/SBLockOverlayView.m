@interface SBLockOverlayView
- (id)_legibilitySettingsForStyle:(unint64_t)a3;
@end

@implementation SBLockOverlayView

- (id)_legibilitySettingsForStyle:(unint64_t)a3
{
  if (a3 > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLockOverlayView;
    v6 = -[SBUILockOverlayView _legibilitySettingsForStyle:](&v8, sel__legibilitySettingsForStyle_);
  }
  else
  {
    v3 = +[SBWallpaperController sharedInstance];
    v4 = [v3 legibilitySettingsForVariant:0];

    if ([v4 style] == 2)
    {
      id v5 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:2];
    }
    else
    {
      id v5 = v4;
    }
    v6 = v5;
  }
  return v6;
}

@end