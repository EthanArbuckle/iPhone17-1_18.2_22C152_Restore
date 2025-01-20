@interface SBLockScreenTemperatureWarningView
- (BOOL)_statusBarOrientationIsPortrait;
- (SBLockScreenTemperatureWarningView)initWithFrame:(CGRect)a3;
- (double)_iconYPosition;
- (double)_subtitleBaseline;
- (double)_titleBaseline;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)layoutSubviews;
@end

@implementation SBLockScreenTemperatureWarningView

- (SBLockScreenTemperatureWarningView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBLockScreenTemperatureWarningView;
  v3 = -[SBUILockOverlayView initWithFrame:style:](&v11, sel_initWithFrame_style_, 3, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBUILockOverlayView *)v3 titleLabel];
    [(SBLockScreenTemperatureWarningView *)v4 addSubview:v5];

    v6 = [(SBUILockOverlayView *)v4 subtitleLabel];
    [(SBLockScreenTemperatureWarningView *)v4 addSubview:v6];

    v7 = +[SBDashBoardThermalStatusProvider thermometerGlyphForThermalStatus:1];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7];
    warningIconView = v4->_warningIconView;
    v4->_warningIconView = (UIImageView *)v8;

    [(SBLockScreenTemperatureWarningView *)v4 addSubview:v4->_warningIconView];
  }
  return v4;
}

- (id)_titleFont
{
  v3 = (void *)MEMORY[0x1E4F42A30];
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    BOOL v6 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v6 = [v2 userInterfaceIdiom] == 1;
  }
  double v7 = 36.0;
  if (v6) {
    double v7 = 48.0;
  }
  uint64_t v8 = [v3 _thinSystemFontOfSize:v7];
  if ((v5 & 1) == 0) {

  }
  return v8;
}

- (id)_subtitleFont
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
      goto LABEL_6;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      goto LABEL_3;
    }
  }
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:24.0];
LABEL_6:
  return v2;
}

- (double)_titleBaseline
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return 114.0;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      return 114.0;
    }
  }
  BOOL v6 = [(SBLockScreenTemperatureWarningView *)self _statusBarOrientationIsPortrait];
  double result = 241.0;
  if (v6) {
    return 256.0;
  }
  return result;
}

- (double)_subtitleBaseline
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return 320.0;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      return 320.0;
    }
  }
  BOOL v6 = [(SBLockScreenTemperatureWarningView *)self _statusBarOrientationIsPortrait];
  double result = 446.0;
  if (v6) {
    return 560.0;
  }
  return result;
}

- (double)_iconYPosition
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return 220.5;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      return 220.5;
    }
  }
  BOOL v6 = [(SBLockScreenTemperatureWarningView *)self _statusBarOrientationIsPortrait];
  double result = 296.0;
  if (v6) {
    return 410.0;
  }
  return result;
}

- (void)layoutSubviews
{
  [(SBLockScreenTemperatureWarningView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v37 = [(SBUILockOverlayView *)self titleLabel];
  objc_super v11 = [(SBLockScreenTemperatureWarningView *)self _titleFont];
  [v37 sizeToFit];
  [v37 frame];
  UIRectCenteredXInRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(SBLockScreenTemperatureWarningView *)self _titleBaseline];
  objc_msgSend(v37, "sb_yPositionForLabelWithContainerBounds:baselineOffset:font:", v11, v4, v6, v8, v10, v18);
  objc_msgSend(v37, "setFrame:", v13, v19, v15, v17);
  v20 = [(SBUILockOverlayView *)self subtitleLabel];
  v21 = [(SBLockScreenTemperatureWarningView *)self _subtitleFont];
  [v20 sizeToFit];
  [v20 frame];
  UIRectCenteredXInRectScale();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(SBLockScreenTemperatureWarningView *)self _subtitleBaseline];
  objc_msgSend(v20, "sb_yPositionForLabelWithContainerBounds:baselineOffset:font:", v21, v4, v6, v8, v10, v28);
  objc_msgSend(v20, "setFrame:", v23, v29, v25, v27);
  [(UIImageView *)self->_warningIconView frame];
  double v31 = v30;
  double v33 = v32;
  float v34 = (v8 - v30) * 0.5;
  double v35 = floorf(v34);
  [(SBLockScreenTemperatureWarningView *)self _iconYPosition];
  -[UIImageView setFrame:](self->_warningIconView, "setFrame:", v35, v36, v31, v33);
}

- (BOOL)_statusBarOrientationIsPortrait
{
  v2 = [(UIView *)self _sbWindowScene];
  double v3 = [v2 statusBarManager];

  LOBYTE(v2) = (unint64_t)([v3 statusBarOrientation] - 1) < 2;
  return (char)v2;
}

- (void).cxx_destruct
{
}

@end