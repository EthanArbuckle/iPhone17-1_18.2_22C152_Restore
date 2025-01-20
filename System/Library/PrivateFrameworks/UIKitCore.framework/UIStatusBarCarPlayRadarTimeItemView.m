@interface UIStatusBarCarPlayRadarTimeItemView
- (BOOL)_showRadarButtonForInternalInstalls;
- (BOOL)allowsUserInteraction;
- (BOOL)usesAdvancedActions;
- (UIStatusBarCarPlayRadarTimeItemView)initWithFrame:(CGRect)a3;
- (id)_timeImageSet;
- (id)contentsImage;
- (id)highlightImage;
- (int64_t)buttonType;
- (void)_gatheringLogsDidChangeStatusNotification:(id)a3;
- (void)dealloc;
@end

@implementation UIStatusBarCarPlayRadarTimeItemView

- (UIStatusBarCarPlayRadarTimeItemView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_char isInternalInstall = os_variant_has_internal_diagnostics();
    if (CFPreferencesGetAppBooleanValue(@"UIStatusBarRadarTimeItemEnabled", @"com.apple.UIKit", 0))
    {
      char isInternalInstall = 1;
    }
    else
    {
      char isInternalInstall = v3->_isInternalInstall;
      if (isInternalInstall)
      {
        if (_UIInternalPreferencesRevisionOnce != -1) {
          dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
        }
        if (_UIInternalPreferencesRevisionVar < 1
          || (int v9 = _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled,
              _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled))
        {
          BOOL v5 = 1;
        }
        else
        {
          int v10 = _UIInternalPreferencesRevisionVar;
          do
          {
            BOOL v5 = v10 >= v9;
            if (v10 < v9) {
              break;
            }
            _UIInternalPreferenceSync(v10, &_UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled, @"UIStatusBarInternalRadarTimeItemEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
            int v9 = _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled;
          }
          while (v10 != _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled);
        }
        if (byte_1E8FD543C) {
          char isInternalInstall = 1;
        }
        else {
          char isInternalInstall = v5;
        }
      }
    }
    v3->_radarItemEnabled = isInternalInstall;
    if (v3->_isInternalInstall)
    {
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v3 selector:sel__gatheringLogsDidChangeStatusNotification_ name:@"UIStatusBarCarPlayDiagnosticsStartedNotification" object:0];

      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v3 selector:sel__gatheringLogsDidChangeStatusNotification_ name:@"UIStatusBarCarPlayDiagnosticsCompletedNotification" object:0];
    }
  }
  return v3;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIStatusBarCarPlayDiagnosticsStartedNotification";
  v6[1] = @"UIStatusBarCarPlayDiagnosticsCompletedNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
  [(UIStatusBarItemView *)&v5 dealloc];
}

- (id)highlightImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = NSString;
  [v2 scale];
  objc_super v5 = objc_msgSend(v3, "stringWithFormat:", @"_internal_radar_time_highlight_%ix.png", (int)v4);
  v6 = (void *)MEMORY[0x1E4F28B50];
  v7 = _UIKitResourceBundlePath(@"CarPlayArtwork.bundle");
  v8 = [v6 bundleWithPath:v7];

  id v9 = +[UIImage imageNamed:v5 inBundle:v8];
  uint64_t v10 = [v9 CGImage];
  [v2 scale];
  objc_super v11 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 0);

  v12 = +[_UILegibilityImageSet imageFromImage:v11 withShadowImage:0];

  return v12;
}

- (int64_t)buttonType
{
  return 1;
}

- (BOOL)allowsUserInteraction
{
  return self->_radarItemEnabled;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (id)contentsImage
{
  if ([(UIStatusBarCarPlayRadarTimeItemView *)self _showRadarButtonForInternalInstalls]&& [(UIView *)self isFocused])
  {
    v3 = [(UIStatusBarItemView *)self foregroundStyle];
    double v4 = NSString;
    [v3 scale];
    v6 = objc_msgSend(v4, "stringWithFormat:", @"_internal_radar_time_%ix.png", (int)v5);
    v7 = (void *)MEMORY[0x1E4F28B50];
    v8 = _UIKitResourceBundlePath(@"CarPlayArtwork.bundle");
    id v9 = [v7 bundleWithPath:v8];

    id v10 = +[UIImage imageNamed:v6 inBundle:v9];
    uint64_t v11 = [v10 CGImage];
    [v3 scale];
    v12 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v11, 0);

    v13 = +[_UILegibilityImageSet imageFromImage:v12 withShadowImage:0];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
    v13 = [(UIStatusBarCarPlayTimeItemView *)&v15 contentsImage];
  }
  return v13;
}

- (id)_timeImageSet
{
  if (self->_currentlyGatheringLogs)
  {
    v3 = +[UIColor systemPurpleColor];
    double v4 = [(UIStatusBarCarPlayTimeItemView *)self _timeImageSetForColor:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
    double v4 = [(UIStatusBarCarPlayTimeItemView *)&v6 _timeImageSet];
  }
  return v4;
}

- (void)_gatheringLogsDidChangeStatusNotification:(id)a3
{
  double v4 = [a3 name];
  int v5 = [v4 isEqualToString:@"UIStatusBarCarPlayDiagnosticsStartedNotification"];

  if (self->_currentlyGatheringLogs != v5)
  {
    self->_currentlyGatheringLogs = v5;
    [(UIStatusBarButtonActionItemView *)self updateContentsAndWidth];
  }
}

- (BOOL)_showRadarButtonForInternalInstalls
{
  return self->_isInternalInstall && self->_radarItemEnabled;
}

@end