@interface SFPinnableBanner
+ (BOOL)omitsBottomSeparator;
+ (double)pinAnimationDelay;
+ (double)unpinAnimationDelay;
+ (double)unpinAnimationDuration;
- (BOOL)isInitiallyBehindNavigationBar;
- (BOOL)isPinnedToTop;
- (BOOL)separableFromStatusBar;
- (BOOL)shouldUsePlainTheme;
- (BOOL)showsBottomSeparator;
- (BOOL)showsTopSeparator;
- (NSNumber)pinnedOffset;
- (SFBannerTheme)theme;
- (SFOverlayProvider)overlayProvider;
- (SFPinnableBanner)initWithFrame:(CGRect)a3;
- (void)_setUpSeparators;
- (void)setInitiallyBehindNavigationBar:(BOOL)a3;
- (void)setPinnedOffset:(id)a3;
- (void)setPinnedToTop:(BOOL)a3;
- (void)setSeparableFromStatusBar:(BOOL)a3;
- (void)setShowsBottomSeparator:(BOOL)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 animated:(BOOL)a4;
@end

@implementation SFPinnableBanner

+ (double)unpinAnimationDuration
{
  return 0.25;
}

+ (double)unpinAnimationDelay
{
  return 6.0;
}

+ (double)pinAnimationDelay
{
  return 0.0;
}

+ (BOOL)omitsBottomSeparator
{
  return 0;
}

- (SFPinnableBanner)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFPinnableBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_separableFromStatusBar = 1;
    [(SFPinnableBanner *)v3 _setUpSeparators];
    v5 = v4;
  }

  return v4;
}

- (void)_setUpSeparators
{
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  topSeparator = self->_topSeparator;
  self->_topSeparator = v3;

  v5 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_topSeparator setBackgroundColor:v5];

  [(SFPinnableBanner *)self bounds];
  double Width = CGRectGetWidth(v16);
  -[UIView setFrame:](self->_topSeparator, "setFrame:", 0.0, 0.0, Width, _SFOnePixel());
  [(UIView *)self->_topSeparator setAutoresizingMask:34];
  [(SFPinnableBanner *)self addSubview:self->_topSeparator];
  if (([(id)objc_opt_class() omitsBottomSeparator] & 1) == 0)
  {
    objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineOutlineColor");
    [(UIView *)self->_topSeparator setBackgroundColor:v7];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomSeparator = self->_bottomSeparator;
    self->_bottomSeparator = v8;

    v10 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)self->_bottomSeparator setBackgroundColor:v10];

    [(SFPinnableBanner *)self bounds];
    double Height = CGRectGetHeight(v17);
    double v12 = Height - _SFOnePixel();
    [(SFPinnableBanner *)self bounds];
    double v13 = CGRectGetWidth(v18);
    -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, v12, v13, _SFOnePixel());
    [(UIView *)self->_bottomSeparator setAutoresizingMask:10];
    v14 = self->_bottomSeparator;
    [(SFPinnableBanner *)self addSubview:v14];
  }
}

- (void)setShowsTopSeparator:(BOOL)a3
{
}

- (BOOL)showsTopSeparator
{
  topSeparator = self->_topSeparator;
  if (topSeparator) {
    LOBYTE(topSeparator) = ![(UIView *)topSeparator isHidden];
  }
  return (char)topSeparator;
}

- (void)setShowsBottomSeparator:(BOOL)a3
{
}

- (BOOL)showsBottomSeparator
{
  bottomSeparator = self->_bottomSeparator;
  if (bottomSeparator) {
    LOBYTE(bottomSeparator) = ![(UIView *)bottomSeparator isHidden];
  }
  return (char)bottomSeparator;
}

- (BOOL)shouldUsePlainTheme
{
  return 0;
}

- (void)setTheme:(id)a3
{
}

- (void)setTheme:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__SFPinnableBanner_setTheme_animated___block_invoke;
    aBlock[3] = &unk_1E54E9858;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:50331650 animations:v8 completion:0];
    }
    else {
      (*((void (**)(void *))v8 + 2))(v8);
    }
  }
}

void __38__SFPinnableBanner_setTheme_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 440) traitCollection];
  [*(id *)(a1 + 32) _setLocalOverrideTraitCollection:v2];

  v3 = [*(id *)(*(void *)(a1 + 32) + 440) overrideTintColor];
  [*(id *)(a1 + 32) setTintColor:v3];

  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 440) separatorColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineOutlineColor");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  [*(id *)(*(void *)(a1 + 32) + 408) setBackgroundColor:v7];
  [*(id *)(*(void *)(a1 + 32) + 416) setBackgroundColor:v7];
  [*(id *)(a1 + 32) themeDidChange];
}

- (BOOL)isPinnedToTop
{
  return self->_pinnedToTop;
}

- (void)setPinnedToTop:(BOOL)a3
{
  self->_pinnedToTop = a3;
}

- (NSNumber)pinnedOffset
{
  return self->_pinnedOffset;
}

- (void)setPinnedOffset:(id)a3
{
}

- (BOOL)separableFromStatusBar
{
  return self->_separableFromStatusBar;
}

- (void)setSeparableFromStatusBar:(BOOL)a3
{
  self->_separableFromStatusBar = a3;
}

- (BOOL)isInitiallyBehindNavigationBar
{
  return self->_initiallyBehindNavigationBar;
}

- (void)setInitiallyBehindNavigationBar:(BOOL)a3
{
  self->_initiallyBehindNavigationBar = a3;
}

- (SFBannerTheme)theme
{
  return self->_theme;
}

- (SFOverlayProvider)overlayProvider
{
  return self->_overlayProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayProvider, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_pinnedOffset, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);

  objc_storeStrong((id *)&self->_topSeparator, 0);
}

@end