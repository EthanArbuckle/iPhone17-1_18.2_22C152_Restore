@interface SFMoreMenuButton
- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState;
- (BOOL)_shouldShowProgressView;
- (BOOL)isIconFilled;
- (NSDirectionalEdgeInsets)contentInsets;
- (SFMoreMenuButton)initWithFrame:(CGRect)a3;
- (UIColor)progressTintColor;
- (double)_progressViewRadius;
- (double)_progressViewTrackWidth;
- (double)downloadProgress;
- (int64_t)progressStyle;
- (int64_t)symbolScale;
- (void)_setShowsProgressView:(BOOL)a3;
- (void)_updateContentsAnimated:(BOOL)a3;
- (void)_updateImage;
- (void)_updateImageAllowingDissolve:(BOOL)a3;
- (void)_updateProgressViewMetrics;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4;
- (void)setIconFilled:(BOOL)a3;
- (void)setNeedsPulseOnView:(id)a3;
- (void)setProgressStyle:(int64_t)a3;
- (void)setProgressTintColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSymbolScale:(int64_t)a3;
- (void)tintColorDidChange;
- (void)updateContents;
@end

@implementation SFMoreMenuButton

- (SFMoreMenuButton)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SFMoreMenuButton;
  v3 = -[SFMoreMenuButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_downloadProgress = -2.0;
    [(SFMoreMenuButton *)v3 _updateImage];
    v5 = _SFAccessibilityIdentifierForBarItem(5uLL);
    [(SFMoreMenuButton *)v4 setAccessibilityIdentifier:v5];

    [(_SFDimmingButton *)v4 setNormalImageAlpha:1.0];
    [(_SFDimmingButton *)v4 setHighlightedImageAlpha:0.2];
    [(SFMoreMenuButton *)v4 setSymbolScale:2];
    [(SFMoreMenuButton *)v4 setAutomaticallyUpdatesConfiguration:0];
    [(SFClickableButton *)v4 setClickEnabled:1];
    v11[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v7 = (id)[(SFMoreMenuButton *)v4 registerForTraitChanges:v6 withTarget:v4 action:sel__updateProgressViewMetrics];

    v8 = v4;
  }

  return v4;
}

- (void)setProgressStyle:(int64_t)a3
{
  if (self->_progressStyle != a3)
  {
    self->_progressStyle = a3;
    [(SFMoreMenuButton *)self _updateImage];
  }
}

- (void)setDownloadProgress:(double)a3
{
}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  if (self->_downloadProgress != a3)
  {
    self->_downloadProgress = a3;
    [(SFMoreMenuButton *)self _updateContentsAnimated:a4];
  }
}

- (void)setNeedsPulseOnView:(id)a3
{
  if (self->_isShowingArrowDown) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "_sf_performLinkAnimation:onView:", 1, a3);
  }
  else {
    objc_storeWeak((id *)&self->_viewPendingPulse, a3);
  }
}

- (void)setSymbolScale:(int64_t)a3
{
  if (self->_symbolScale != a3)
  {
    self->_symbolScale = a3;
    [(SFMoreMenuButton *)self _updateImage];
    [(SFMoreMenuButton *)self _updateProgressViewMetrics];
  }
}

- (BOOL)isIconFilled
{
  if (self->_iconFilled) {
    return 1;
  }
  else {
    return [(SFMoreMenuButton *)self isSelected];
  }
}

- (void)setIconFilled:(BOOL)a3
{
  if (self->_iconFilled != a3)
  {
    self->_iconFilled = a3;
    [(SFMoreMenuButton *)self _updateContentsAnimated:0];
  }
}

- (UIColor)progressTintColor
{
  progressTintColor = self->_progressTintColor;
  if (progressTintColor)
  {
    v3 = progressTintColor;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }

  return v3;
}

- (void)setProgressTintColor:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    v5 = [(SFMoreMenuButton *)self progressTintColor];
    [(SFProgressView *)self->_progressView setTintColor:v5];
  }
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_contentInsets.leading != a3.leading
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.trailing != a3.trailing
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SFMoreMenuButton *)self _updateImage];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFMoreMenuButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFMoreMenuButton;
    [(SFMoreMenuButton *)&v5 setSelected:v3];
    [(SFMoreMenuButton *)self updateContents];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SFMoreMenuButton;
  [(_SFDimmingButton *)&v5 layoutSubviews];
  [(SFProgressView *)self->_progressView intrinsicContentSize];
  BOOL v3 = [(SFMoreMenuButton *)self _imageView];
  [v3 bounds];
  UIRectGetCenter();
  v4 = [(SFMoreMenuButton *)self traitCollection];
  [v4 displayScale];
  UIRectCenteredAboutPointScale();
  -[SFProgressView setFrame:](self->_progressView, "setFrame:");
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)SFMoreMenuButton;
  [(SFMoreMenuButton *)&v4 didMoveToWindow];
  SFDeferrableUpdateViewDidMoveToWindow(self);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_movedToWindowTime = v3;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFMoreMenuButton;
  [(SFMoreMenuButton *)&v3 tintColorDidChange];
  if ([(SFMoreMenuButton *)self _shouldShowProgressView]) {
    [(SFMoreMenuButton *)self _updateImage];
  }
}

- (void)_updateContentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  double movedToWindowTime = self->_movedToWindowTime;
  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents(self))
  {
    [(SFMoreMenuButton *)self _updateImageAllowingDissolve:v6 > movedToWindowTime + 1.0];
    BOOL v8 = [(SFMoreMenuButton *)self _shouldShowProgressView];
    [(SFMoreMenuButton *)self _setShowsProgressView:v8];
    if (v8)
    {
      double downloadProgress = self->_downloadProgress;
      if (downloadProgress == -1.0) {
        double downloadProgress = 0.0;
      }
      [(SFProgressView *)self->_progressView setProgress:v3 animated:0 completion:downloadProgress];
      [(SFMoreMenuButton *)self _updateProgressViewMetrics];
    }
  }
}

- (void)_updateImage
{
}

- (void)_updateImageAllowingDissolve:(BOOL)a3
{
  BOOL v3 = a3;
  v32[2] = *MEMORY[0x1E4F143B8];
  p_viewPendingPulse = &self->_viewPendingPulse;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewPendingPulse);
  int64_t progressStyle = self->_progressStyle;
  if (progressStyle != 2)
  {
    if (progressStyle == 1)
    {
      BOOL v13 = [(SFMoreMenuButton *)self _shouldShowProgressView];
      v14 = (void *)MEMORY[0x1E4FB1818];
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E4FB1830];
        v16 = [(SFMoreMenuButton *)self tintColor];
        v31[0] = v16;
        v17 = [MEMORY[0x1E4FB1618] clearColor];
        v31[1] = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        v19 = [v15 _configurationWithHierarchicalColors:v18];
        v20 = @"arrow.down.circle";
LABEL_18:
        objc_super v10 = [v14 systemImageNamed:v20 withConfiguration:v19];

LABEL_22:
        BOOL v11 = 0;
        BOOL v12 = 0;
        goto LABEL_23;
      }
      v9 = @"arrow.down.circle.fill";
    }
    else
    {
      if (progressStyle)
      {
        BOOL v11 = 0;
        BOOL v12 = 0;
        objc_super v10 = 0;
        goto LABEL_23;
      }
      if ([(SFMoreMenuButton *)self isIconFilled])
      {
        BOOL v8 = (void *)MEMORY[0x1E4FB1818];
        v9 = @"ellipsis.circle.fill";
LABEL_21:
        objc_super v10 = [v8 systemImageNamed:v9];
        goto LABEL_22;
      }
      BOOL v21 = [(SFMoreMenuButton *)self _shouldShowProgressView];
      v14 = (void *)MEMORY[0x1E4FB1818];
      if (v21)
      {
        v22 = (void *)MEMORY[0x1E4FB1830];
        v16 = [(SFMoreMenuButton *)self tintColor];
        v32[0] = v16;
        v17 = [MEMORY[0x1E4FB1618] clearColor];
        v32[1] = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
        v19 = [v22 _configurationWithHierarchicalColors:v18];
        v20 = @"ellipsis.circle";
        goto LABEL_18;
      }
      v9 = @"ellipsis.circle";
    }
    BOOL v8 = v14;
    goto LABEL_21;
  }
  if ([(SFMoreMenuButton *)self _shouldShowProgressView])
  {
    objc_super v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down"];
    BOOL v11 = 0;
    BOOL v12 = !self->_isShowingArrowDown && v3;
    self->_isShowingArrowDown = 1;
  }
  else
  {
    objc_super v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
    BOOL v12 = 0;
    BOOL v11 = WeakRetained != 0;
    self->_isShowingArrowDown = 0;
  }
LABEL_23:
  v23 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v24 = [MEMORY[0x1E4FB1618] clearColor];
  v25 = [v23 background];
  [v25 setBackgroundColor:v24];

  v26 = objc_msgSend(v10, "imageWithAlignmentRectInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v23 setImage:v26];

  v27 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:self->_symbolScale];
  [v23 setPreferredSymbolConfigurationForImage:v27];

  objc_msgSend(v23, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.leading, self->_contentInsets.bottom, self->_contentInsets.trailing);
  if (v12)
  {
    v28 = (void *)MEMORY[0x1E4FB1EB0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__SFMoreMenuButton__updateImageAllowingDissolve___block_invoke;
    v29[3] = &unk_1E54E9A60;
    v29[4] = self;
    id v30 = v23;
    [v28 transitionWithView:self duration:5242882 options:v29 animations:0 completion:0.3];

    if (!v11) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  [(SFMoreMenuButton *)self setConfiguration:v23];
  if (v11)
  {
LABEL_27:
    [(SFMoreMenuButton *)self layoutIfNeeded];
    objc_msgSend(MEMORY[0x1E4FB1EB0], "_sf_performLinkAnimation:onView:", 1, WeakRetained);
    objc_storeWeak((id *)p_viewPendingPulse, 0);
  }
LABEL_28:
}

uint64_t __49__SFMoreMenuButton__updateImageAllowingDissolve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

- (BOOL)_shouldShowProgressView
{
  return self->_downloadProgress != -2.0;
}

- (void)_setShowsProgressView:(BOOL)a3
{
  progressView = self->_progressView;
  if ((((progressView == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      v9 = [(SFMoreMenuButton *)self imageView];
      [(SFProgressView *)v9 setClipsToBounds:0];
      double v5 = objc_alloc_init(SFProgressView);
      double v6 = self->_progressView;
      self->_progressView = v5;

      [(SFProgressView *)self->_progressView setStyle:self->_progressStyle];
      id v7 = [(SFMoreMenuButton *)self progressTintColor];
      [(SFProgressView *)self->_progressView setTintColor:v7];

      [(SFProgressView *)v9 addSubview:self->_progressView];
      [(SFMoreMenuButton *)self _updateProgressViewMetrics];
      BOOL v8 = v9;
    }
    else
    {
      [(SFProgressView *)progressView removeFromSuperview];
      BOOL v8 = self->_progressView;
      self->_progressView = 0;
    }
  }
}

- (void)_updateProgressViewMetrics
{
  [(SFMoreMenuButton *)self _progressViewRadius];
  -[SFProgressView setRadius:](self->_progressView, "setRadius:");
  [(SFMoreMenuButton *)self _progressViewTrackWidth];
  progressView = self->_progressView;

  -[SFProgressView setTrackWidth:](progressView, "setTrackWidth:");
}

- (double)_progressViewRadius
{
  int64_t symbolScale = self->_symbolScale;
  if ((unint64_t)(symbolScale - 1) >= 2)
  {
    if (symbolScale != 3) {
      return 0.0;
    }
    BOOL v4 = ![(SFMoreMenuButton *)self isIconFilled];
    double v5 = 11.5;
    double v6 = 15.5;
  }
  else
  {
    BOOL v4 = ![(SFMoreMenuButton *)self isIconFilled];
    double v5 = 9.0;
    double v6 = 12.0;
  }
  if (v4) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  BOOL v8 = objc_msgSend(MEMORY[0x1E4FB17A8], "defaultMetrics", v5);
  v9 = [(SFMoreMenuButton *)self traitCollection];
  [v8 scaledValueForValue:v9 compatibleWithTraitCollection:v7];
  double v11 = v10;

  return v11;
}

- (double)_progressViewTrackWidth
{
  unint64_t v2 = self->_symbolScale - 1;
  double result = 0.0;
  if (v2 <= 2) {
    return dbl_18C70EE10[v2];
  }
  return result;
}

- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState
{
  return ($A17CE7BAAAAB13D21F74688DC5009C79 *)&self->_deferrableUpdateViewState;
}

- (void)updateContents
{
}

- (int64_t)progressStyle
{
  return self->_progressStyle;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewPendingPulse);

  objc_storeStrong((id *)&self->_progressTintColor, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end