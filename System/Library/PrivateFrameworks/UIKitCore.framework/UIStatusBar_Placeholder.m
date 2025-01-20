@interface UIStatusBar_Placeholder
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7;
- (double)defaultDoubleHeight;
- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)currentStyle;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8;
- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)setForegroundColor:(id)a3 animationParameters:(id)a4;
- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)setStyleRequest:(id)a3 animationParameters:(id)a4;
@end

@implementation UIStatusBar_Placeholder

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar_Placeholder;
  id v6 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v12, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v9 = _UIInternalPreference_UIStatusBarPlaceholderHasColor;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIStatusBarPlaceholderHasColor)
      {
        while (v7 >= v9)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_UIStatusBarPlaceholderHasColor, @"UIStatusBarPlaceholderHasColor", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v9 = _UIInternalPreference_UIStatusBarPlaceholderHasColor;
          if (v7 == _UIInternalPreference_UIStatusBarPlaceholderHasColor) {
            return v6;
          }
        }
        if (byte_1E8FD54B4)
        {
          v10 = +[UIColor systemGreenColor];
          v11 = [v10 colorWithAlphaComponent:0.5];
          [v6 setBackgroundColor:v11];
        }
      }
    }
  }
  return v6;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  v8 = __UIStatusBarManagerForWindow(a6);
  int v9 = v8;
  if (v8)
  {
    [v8 defaultStatusBarHeightInOrientation:a4];
    double v11 = v10;
  }
  else
  {
    objc_super v12 = +[UIDevice currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    double v11 = 20.0;
    if (!v13)
    {
      if (+[UIDevice _hasHomeButton]) {
        double v14 = 20.0;
      }
      else {
        double v14 = 44.0;
      }
      if ((unint64_t)(a4 - 3) >= 2) {
        double v11 = v14;
      }
      else {
        double v11 = 0.0;
      }
    }
  }

  return v11;
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &_requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced____s_category)+ 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Changing the style on the status bar instance directly is not supported anymore, please update your app.", v9, 2u);
  }
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar_Placeholder;
  id v6 = a4;
  id v7 = a3;
  [(UIStatusBar_Base *)&v11 setStyleRequest:v7 animationParameters:v6];
  uint64_t v8 = objc_msgSend(v7, "style", v11.receiver, v11.super_class);
  uint64_t v9 = [v7 legibilityStyle];
  double v10 = [v7 foregroundColor];

  [(UIStatusBar_Placeholder *)self _requestStyle:v8 partStyles:0 legibilityStyle:v9 foregroundColor:v10 animationParameters:v6 forced:0];
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Placeholder;
  id v6 = a4;
  id v7 = a3;
  [(UIStatusBar_Base *)&v8 setForegroundColor:v7 animationParameters:v6];
  [(UIStatusBar_Placeholder *)self _requestStyle:[(UIStatusBar_Base *)self _requestStyle] partStyles:0 legibilityStyle:[(UIStatusBar_Base *)self legibilityStyle] foregroundColor:v7 animationParameters:v6 forced:0];
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar_Placeholder;
  id v6 = a4;
  [(UIStatusBar_Base *)&v9 setLegibilityStyle:a3 animationParameters:v6];
  int64_t v7 = [(UIStatusBar_Base *)self _requestStyle];
  objc_super v8 = [(UIStatusBar_Base *)self foregroundColor];
  [(UIStatusBar_Placeholder *)self _requestStyle:v7 partStyles:0 legibilityStyle:a3 foregroundColor:v8 animationParameters:v6 forced:0];
}

- (int64_t)currentStyle
{
  v2 = _UIStatusBarManagerForNoWindow();
  int64_t v3 = [v2 statusBarStyle];

  return v3;
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBar_Placeholder;
  [(UIStatusBar_Base *)&v6 _setHidden:a3 animationParameters:a4];
  v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &_setHidden_animationParameters____s_category) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Hiding the status bar instance directly is not supported anymore, please update your app.", v5, 2u);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end