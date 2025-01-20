@interface SFLockdownStatusBar
- (BOOL)shouldAnimateNavigationBarItemChanges;
- (BOOL)showsSquishedContent;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredSize;
- (SFLockdownStatusBar)initWithFrame:(CGRect)a3;
- (SFNavigationBarItem)navigationBarItem;
- (double)preferredBottomSpacing;
- (double)preferredSquishedBottomSpacing;
- (double)preferredTopSpacing;
- (double)titleBaselineInsetFromBottom;
- (double)titleCapHeightInsetFromTop;
- (double)topSquishedSpacingAdjustment;
- (void)_updateLabelWithLockdownStatus:(int64_t)a3;
- (void)_updateLockdownStatusLabel;
- (void)_updateLockdownStatusLabelAnimated:(BOOL)a3;
- (void)setNavigationBarItem:(id)a3;
- (void)setShouldAnimateNavigationBarItemChanges:(BOOL)a3;
@end

@implementation SFLockdownStatusBar

- (SFLockdownStatusBar)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFLockdownStatusBar;
  v3 = -[SFLockdownStatusBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    lockdownModeStatusLabel = v3->_lockdownModeStatusLabel;
    v3->_lockdownModeStatusLabel = v4;

    [(UILabel *)v3->_lockdownModeStatusLabel setAdjustsFontSizeToFitWidth:0];
    v6 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v7 = *MEMORY[0x1E4FB2950];
    v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D8]];
    v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];
    [(UILabel *)v3->_lockdownModeStatusLabel setFont:v9];

    [(SFLockdownStatusBar *)v3 bounds];
    -[UILabel setFrame:](v3->_lockdownModeStatusLabel, "setFrame:");
    [(UILabel *)v3->_lockdownModeStatusLabel setAutoresizingMask:18];
    [(UILabel *)v3->_lockdownModeStatusLabel setTextAlignment:1];
    [(SFLockdownStatusBar *)v3 _updateLockdownStatusLabel];
    [(SFLockdownStatusBar *)v3 addSubview:v3->_lockdownModeStatusLabel];
    v10 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_lockdownModeStatusLabel intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)titleCapHeightInsetFromTop
{
  [(UILabel *)self->_lockdownModeStatusLabel _capOffsetFromBoundsTop];
  return result;
}

- (double)titleBaselineInsetFromBottom
{
  [(UILabel *)self->_lockdownModeStatusLabel _baselineOffsetFromBottom];
  return result;
}

- (void)_updateLockdownStatusLabel
{
}

- (void)_updateLockdownStatusLabelAnimated:(BOOL)a3
{
  int64_t v5 = [(SFNavigationBarItem *)self->_navigationBarItem lockdownModeAnnotation];
  if (self->_currentLockdownStatus != v5)
  {
    if (a3)
    {
      lockdownModeStatusLabel = self->_lockdownModeStatusLabel;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__SFLockdownStatusBar__updateLockdownStatusLabelAnimated___block_invoke;
      v7[3] = &unk_1E54E9DC8;
      v7[4] = self;
      v7[5] = v5;
      [MEMORY[0x1E4FB1EB0] transitionWithView:lockdownModeStatusLabel duration:5242880 options:v7 animations:0 completion:0.3];
    }
    else
    {
      [(SFLockdownStatusBar *)self _updateLabelWithLockdownStatus:v5];
    }
  }
}

uint64_t __58__SFLockdownStatusBar__updateLockdownStatusLabelAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLabelWithLockdownStatus:*(void *)(a1 + 40)];
}

- (void)_updateLabelWithLockdownStatus:(int64_t)a3
{
  int64_t v5 = WBSAnnotationStringForLockdownModeStatus();
  [(UILabel *)self->_lockdownModeStatusLabel setText:v5];

  if (a3 == 2) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  [(UILabel *)self->_lockdownModeStatusLabel setTextColor:v6];

  self->_currentLockdownStatus = a3;
}

- (void)setNavigationBarItem:(id)a3
{
  int64_t v5 = (SFNavigationBarItem *)a3;
  navigationBarItem = self->_navigationBarItem;
  if (navigationBarItem != v5)
  {
    uint64_t v7 = v5;
    [(SFNavigationBarItem *)navigationBarItem removeObserver:self];
    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    [(SFNavigationBarItem *)self->_navigationBarItem addObserver:self];
    [(SFLockdownStatusBar *)self _updateLockdownStatusLabelAnimated:self->_shouldAnimateNavigationBarItemChanges];
    int64_t v5 = v7;
  }
}

- (CGSize)preferredSize
{
  [(UILabel *)self->_lockdownModeStatusLabel intrinsicContentSize];
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)preferredSquishedBottomSpacing
{
  +[SFUnifiedBarMetrics defaultSquishedContentSpacing];
  double v4 = v3;
  [(SFLockdownStatusBar *)self titleBaselineInsetFromBottom];
  double v6 = v5;
  +[SFUnifiedBarMetrics minimumSquishScale];
  return v4 - v6 * v7;
}

- (BOOL)showsSquishedContent
{
  return 1;
}

- (double)preferredTopSpacing
{
  [(SFLockdownStatusBar *)self titleCapHeightInsetFromTop];
  return 10.0 - v2;
}

- (double)preferredBottomSpacing
{
  [(SFLockdownStatusBar *)self titleBaselineInsetFromBottom];
  return 10.0 - v2;
}

- (double)topSquishedSpacingAdjustment
{
  [(SFLockdownStatusBar *)self titleCapHeightInsetFromTop];
  double v3 = v2;
  +[SFUnifiedBarMetrics minimumSquishScale];
  return v3 * v4;
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (BOOL)shouldAnimateNavigationBarItemChanges
{
  return self->_shouldAnimateNavigationBarItemChanges;
}

- (void)setShouldAnimateNavigationBarItemChanges:(BOOL)a3
{
  self->_shouldAnimateNavigationBarItemChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarItem, 0);

  objc_storeStrong((id *)&self->_lockdownModeStatusLabel, 0);
}

@end