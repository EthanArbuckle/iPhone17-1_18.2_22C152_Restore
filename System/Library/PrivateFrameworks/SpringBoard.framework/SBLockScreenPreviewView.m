@interface SBLockScreenPreviewView
- (SBLockScreenPreviewView)initWithFrame:(CGRect)a3 wallpaperController:(id)a4 options:(unint64_t)a5 wallpaperImage:(id)a6;
- (id)_statusBarReusePool;
- (void)_layoutCallToActionLabel;
- (void)_layoutDateView;
- (void)_layoutHomeGrabberView;
- (void)_layoutPageControl;
- (void)_layoutProudLockIconView;
- (void)_layoutQuickActionsView;
- (void)_layoutStatusBar;
- (void)_layoutWallpaperView;
- (void)_setupCallToActionLabel;
- (void)_setupDateViewWithOptions:(unint64_t)a3;
- (void)_setupHomeGrabberView;
- (void)_setupPageControl;
- (void)_setupProudLockIconView;
- (void)_setupQuickActionView;
- (void)_setupStatusBar;
- (void)_setupWallpaperViewWithImage:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SBLockScreenPreviewView

- (SBLockScreenPreviewView)initWithFrame:(CGRect)a3 wallpaperController:(id)a4 options:(unint64_t)a5 wallpaperImage:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBLockScreenPreviewView;
  v16 = -[SBLockScreenPreviewView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wallpaperController, a4);
    if ((a5 & 0x400) != 0)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F43228]);
      uint64_t v20 = 2;
    }
    else
    {
      if ((a5 & 0x800) == 0)
      {
        uint64_t v18 = [v14 legibilitySettingsForVariant:0];
        goto LABEL_8;
      }
      id v19 = objc_alloc(MEMORY[0x1E4F43228]);
      uint64_t v20 = 1;
    }
    uint64_t v18 = [v19 initWithStyle:v20];
LABEL_8:
    legibilitySettings = v17->_legibilitySettings;
    v17->_legibilitySettings = (_UILegibilitySettings *)v18;

    if ((a5 & 0x40) == 0) {
      [(SBLockScreenPreviewView *)v17 _setupWallpaperViewWithImage:v15];
    }
    [(SBLockScreenPreviewView *)v17 _setupDateViewWithOptions:a5];
    if ((a5 & 1) == 0) {
      [(SBLockScreenPreviewView *)v17 _setupStatusBar];
    }
    if ((a5 & 0x22) == 0x20) {
      [(SBLockScreenPreviewView *)v17 _setupPageControl];
    }
    [(SBLockScreenPreviewView *)v17 _setupCallToActionLabel];
    if (SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_19;
    }
    if ((a5 & 8) != 0)
    {
      if ((a5 & 0x10) != 0) {
        goto LABEL_17;
      }
    }
    else
    {
      [(SBLockScreenPreviewView *)v17 _setupProudLockIconView];
      if ((a5 & 0x10) != 0)
      {
LABEL_17:
        if ((a5 & 0x20) != 0)
        {
LABEL_19:
          v22 = v17;
          goto LABEL_20;
        }
LABEL_18:
        [(SBLockScreenPreviewView *)v17 _setupHomeGrabberView];
        goto LABEL_19;
      }
    }
    [(SBLockScreenPreviewView *)v17 _setupQuickActionView];
    if ((a5 & 0x20) != 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (void)dealloc
{
  v3 = [(SBLockScreenPreviewView *)self _statusBarReusePool];
  [v3 recycleStatusBar:self->_statusBar];

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenPreviewView;
  [(SBLockScreenPreviewView *)&v4 dealloc];
}

- (void)_setupWallpaperViewWithImage:(id)a3
{
  id v4 = a3;
  if (v4) {
    goto LABEL_8;
  }
  v5 = [(SBWallpaperController *)self->_wallpaperController wallpaperConfigurationManager];
  v6 = [v5 wallpaperConfigurationForVariant:0 includingValuesForTypes:4];
  if (_os_feature_enabled_impl())
  {
    v7 = SBLogWallpaper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBLockScreenPreviewView _setupWallpaperViewWithImage:](v6, v7);
    }
  }
  else
  {
    v8 = [v6 proceduralWallpaperInfo];

    if (!v8)
    {

      goto LABEL_11;
    }
  }
  v9 = [v6 wallpaperThumbnailImage];
  objc_msgSend(v9, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_11:
    id v14 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:0 transformOptions:2];
    [(PBUIWallpaperEffectViewBase *)v14 setForcesOpaque:1];
    [(PBUIWallpaperEffectViewBase *)v14 setStyle:0];
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = &v14->super.super;
    goto LABEL_9;
  }
LABEL_8:
  v10 = (objc_class *)MEMORY[0x1E4F42AA0];
  wallpaperView = (UIView *)v4;
  v12 = (UIView *)[[v10 alloc] initWithImage:wallpaperView];
  v13 = self->_wallpaperView;
  self->_wallpaperView = v12;

  [(UIView *)self->_wallpaperView setContentMode:2];
LABEL_9:

  [(SBLockScreenPreviewView *)self addSubview:self->_wallpaperView];
}

- (void)_setupDateViewWithOptions:(unint64_t)a3
{
  char v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E4FA5F60]);
    dateViewController = self->_dateViewController;
    self->_dateViewController = v5;

    v7 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4FA5F58]);
    v7 = (SBFLockScreenDateView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  dateView = self->_dateView;
  self->_dateView = v7;

  v10 = self->_dateView;
  if ((v3 & 4) != 0)
  {
    v11 = [MEMORY[0x1E4F1C9C8] date];
    [(SBFLockScreenDateView *)v10 setDate:v11];
  }
  else
  {
    v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:190057260.0];
    v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
    [(SBFLockScreenDateView *)v10 _setDate:v11 inTimeZone:v12];
  }
  v13 = [MEMORY[0x1E4F5E408] rootSettings];
  id v18 = [v13 lookSettings];

  if ([v18 useSettingsDateTime] && objc_msgSend(v18, "customizesDateTime"))
  {
    id v14 = self->_dateView;
    id v15 = [v18 customTimeFont];
    [(SBFLockScreenDateView *)v14 setCustomTimeFont:v15];

    -[SBFLockScreenDateView setSubtitleOnTop:](self->_dateView, "setSubtitleOnTop:", [v18 subtitleAboveTime]);
  }
  v16 = self->_dateView;
  v17 = [MEMORY[0x1E4FA5F58] timeFont];
  [(SBFLockScreenDateView *)v16 setCustomTimeFont:v17];

  [(SBFLockScreenDateView *)self->_dateView setLegibilitySettings:self->_legibilitySettings];
  [(SBLockScreenPreviewView *)self addSubview:self->_dateView];
}

- (void)_setupStatusBar
{
  char v3 = [(SBLockScreenPreviewView *)self _statusBarReusePool];
  [(SBLockScreenPreviewView *)self bounds];
  objc_msgSend(v3, "getReusableStatusBarWithReason:withFrame:", @"Lock Screen Preview Status Bar", 0.0, 0.0);
  id v4 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
  statusBar = self->_statusBar;
  self->_statusBar = v4;

  [(UIStatusBar *)self->_statusBar setOrientation:1];
  [(UIStatusBar *)self->_statusBar setLegibilityStyle:[(_UILegibilitySettings *)self->_legibilitySettings style]];
  v6 = self->_statusBar;
  v7 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UIStatusBar *)v6 setForegroundColor:v7];

  [(UIStatusBar *)self->_statusBar requestStyle:[(_UILegibilitySettings *)self->_legibilitySettings style] != 2];
  [(UIStatusBar *)self->_statusBar sb_setSnapshotOverridesWithTimeEnabled:0 overriddenDate:0];
  id v8 = self->_statusBar;
  [(SBLockScreenPreviewView *)self addSubview:v8];
}

- (void)_setupPageControl
{
  id v3 = objc_alloc(MEMORY[0x1E4F5E430]);
  id v4 = (CSPageControl *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dashBoardPageControl = self->_dashBoardPageControl;
  self->_dashBoardPageControl = v4;

  [(CSPageControl *)self->_dashBoardPageControl setLegibilitySettings:self->_legibilitySettings];
  [(CSPageControl *)self->_dashBoardPageControl setCameraPageIndex:2];
  [(CSPageControl *)self->_dashBoardPageControl setNumberOfPages:3];
  [(CSPageControl *)self->_dashBoardPageControl setCurrentPage:1];
  v6 = self->_dashBoardPageControl;
  [(SBLockScreenPreviewView *)self addSubview:v6];
}

- (void)_setupCallToActionLabel
{
  id v3 = (SBUICallToActionLabel *)objc_opt_new();
  callToActionLabel = self->_callToActionLabel;
  self->_callToActionLabel = v3;

  [(SBUICallToActionLabel *)self->_callToActionLabel setVisible:1 animated:0];
  [(SBUICallToActionLabel *)self->_callToActionLabel setLegibilitySettings:self->_legibilitySettings];
  v5 = self->_callToActionLabel;
  [(SBLockScreenPreviewView *)self addSubview:v5];
}

- (void)_setupProudLockIconView
{
  id v3 = (SBUIProudLockIconView *)objc_alloc_init(MEMORY[0x1E4FA7D18]);
  proudLockIconView = self->_proudLockIconView;
  self->_proudLockIconView = v3;

  [(SBUIProudLockIconView *)self->_proudLockIconView setLegibilitySettings:self->_legibilitySettings];
  [(SBUIProudLockIconView *)self->_proudLockIconView setState:1];
  v5 = self->_proudLockIconView;
  [(SBLockScreenPreviewView *)self addSubview:v5];
}

- (void)_setupQuickActionView
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5E460]);
  id v3 = [v5 view];
  quickActionsView = self->_quickActionsView;
  self->_quickActionsView = v3;

  [(CSQuickActionsView *)self->_quickActionsView setLegibilitySettings:self->_legibilitySettings];
  [(SBLockScreenPreviewView *)self addSubview:self->_quickActionsView];
}

- (void)_setupHomeGrabberView
{
  id v3 = [SBHomeGrabberView alloc];
  id v4 = -[SBHomeGrabberView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  homeGrabberView = self->_homeGrabberView;
  self->_homeGrabberView = v4;

  if ([(_UILegibilitySettings *)self->_legibilitySettings style] == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(SBHomeGrabberView *)self->_homeGrabberView setColorBias:v6];
  v7 = self->_homeGrabberView;
  [(SBLockScreenPreviewView *)self addSubview:v7];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenPreviewView;
  [(SBLockScreenPreviewView *)&v3 layoutSubviews];
  [(SBLockScreenPreviewView *)self _layoutWallpaperView];
  [(SBLockScreenPreviewView *)self _layoutStatusBar];
  [(SBLockScreenPreviewView *)self _layoutDateView];
  [(SBLockScreenPreviewView *)self _layoutPageControl];
  [(SBLockScreenPreviewView *)self _layoutCallToActionLabel];
  [(SBLockScreenPreviewView *)self _layoutProudLockIconView];
  [(SBLockScreenPreviewView *)self _layoutQuickActionsView];
  [(SBLockScreenPreviewView *)self _layoutHomeGrabberView];
}

- (void)_layoutStatusBar
{
  [(SBLockScreenPreviewView *)self bounds];
  statusBar = self->_statusBar;
  -[UIStatusBar setFrame:](statusBar, "setFrame:", 0.0, 0.0);
}

- (void)_layoutDateView
{
  [(SBFLockScreenDateView *)self->_dateView layoutIfNeeded];
  [(SBLockScreenPreviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4FA5EE0];
    [(SBLockScreenPreviewView *)self bounds];
    objc_msgSend(v11, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  dateView = self->_dateView;
  -[SBFLockScreenDateView setFrame:](dateView, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutWallpaperView
{
  [(SBLockScreenPreviewView *)self bounds];
  wallpaperView = self->_wallpaperView;
  -[UIView setFrame:](wallpaperView, "setFrame:");
}

- (void)_layoutPageControl
{
  [(CSPageControl *)self->_dashBoardPageControl sizeForNumberOfPages:[(CSPageControl *)self->_dashBoardPageControl numberOfPages]];
  double v3 = (void *)MEMORY[0x1E4F5E430];
  [(SBLockScreenPreviewView *)self bounds];
  objc_msgSend(v3, "suggestedFrameForPageBounds:desiredSize:");
  dashBoardPageControl = self->_dashBoardPageControl;
  -[CSPageControl setFrame:](dashBoardPageControl, "setFrame:");
}

- (void)_layoutCallToActionLabel
{
  [(SBLockScreenPreviewView *)self bounds];
  double MaxY = CGRectGetMaxY(v15);
  [(CSPageControl *)self->_dashBoardPageControl frame];
  double v5 = MaxY - (v4 + 5.0);
  [(SBUICallToActionLabel *)self->_callToActionLabel baselineOffset];
  double v7 = v6 + v5;
  callToActionLabel = self->_callToActionLabel;
  double v9 = (void *)MEMORY[0x1E4FA5EE0];
  [(SBLockScreenPreviewView *)self bounds];
  objc_msgSend(v9, "suggestedFrameForCallToActionLabel:yOffset:inBounds:", callToActionLabel, v7, v10, v11, v12, v13);
  -[SBUICallToActionLabel setFrame:](callToActionLabel, "setFrame:");
}

- (void)_layoutProudLockIconView
{
  [(SBLockScreenPreviewView *)self bounds];
  proudLockIconView = self->_proudLockIconView;
  -[SBUIProudLockIconView setFrame:](proudLockIconView, "setFrame:");
}

- (void)_layoutQuickActionsView
{
  [(SBLockScreenPreviewView *)self bounds];
  quickActionsView = self->_quickActionsView;
  -[CSQuickActionsView setFrame:](quickActionsView, "setFrame:");
}

- (void)_layoutHomeGrabberView
{
  [(SBLockScreenPreviewView *)self bounds];
  homeGrabberView = self->_homeGrabberView;
  -[SBHomeGrabberView setFrame:](homeGrabberView, "setFrame:");
}

- (id)_statusBarReusePool
{
  v2 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  double v3 = [v2 reusePool];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_quickActionsView, 0);
  objc_storeStrong((id *)&self->_proudLockIconView, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_dashBoardPageControl, 0);
  objc_storeStrong((id *)&self->_slideToUnlockView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_slideToUnlockLegibilityLabel, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

- (void)_setupWallpaperViewWithImage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 debugDescription];
  int v4 = 138543362;
  double v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "WooP is on, using wallpaper thumbnail image from lock screen wallpaper configuration: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end