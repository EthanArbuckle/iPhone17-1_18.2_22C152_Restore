@interface SearchUIBackgroundColorView
- (BOOL)showsPlaceholderPlatterView;
- (SFColor)color;
- (SFImage)backgroundImage;
- (SearchUIBackgroundColorView)initWithFrame:(CGRect)a3;
- (SearchUIBackgroundColorViewProtocol)delegate;
- (SearchUIGradientView)colorBlendView;
- (SearchUIGradientView)gradientView;
- (SearchUIGradientView)gradientViewMaskView;
- (SearchUIImageView)backgroundImageView;
- (TLKProminenceView)prominenceView;
- (UIView)platterView;
- (id)viewsToOverrideAppearance;
- (unint64_t)maskedCorners;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setColor:(id)a3;
- (void)setColorBlendView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setGradientViewMaskView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setPlatterView:(id)a3;
- (void)setProminenceView:(id)a3;
- (void)setShowsPlaceholderPlatterView:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearance:(id)a3 withColors:(id)a4;
- (void)updateWithSFCard:(id)a3;
@end

@implementation SearchUIBackgroundColorView

- (void)setColor:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    [(SearchUIBackgroundColorView *)self updateAppearance:0 withColors:0];
    id v5 = 0;
  }
  if (([v5 isEqual:self->_color] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(SearchUIBackgroundColorView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SearchUIBackgroundColorView;
  [(SearchUIBackgroundColorView *)&v28 tlk_updateForAppearance:v4];
  id v5 = [(SearchUIBackgroundColorView *)self prominenceView];
  [v5 setCustomColorAlpha:0.0];

  double v6 = (double)[(SearchUIBackgroundColorView *)self showsPlaceholderPlatterView];
  v7 = [(SearchUIBackgroundColorView *)self platterView];
  [v7 setAlpha:v6];

  v8 = [(SearchUIBackgroundColorView *)self colorBlendView];
  [v8 setAlpha:0.0];

  v9 = [(SearchUIBackgroundColorView *)self gradientView];
  [v9 setAlpha:0.0];

  v10 = [(SearchUIBackgroundColorView *)self color];
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && [v10 gradientType] == 0;
  v12 = [(SearchUIBackgroundColorView *)self gradientView];
  v13 = [v12 layer];

  if (v11) {
    double v14 = 0.0;
  }
  else {
    double v14 = 0.5;
  }
  if (v11) {
    double v15 = 0.5;
  }
  else {
    double v15 = 0.0;
  }
  if (v11) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.5;
  }
  if (v11) {
    double v17 = 0.5;
  }
  else {
    double v17 = 1.0;
  }
  objc_msgSend(v13, "setStartPoint:", v14, v15);
  objc_msgSend(v13, "setEndPoint:", v16, v17);
  if (v10)
  {
    v18 = objc_opt_new();
    [v18 setSfColor:v10];
    [v18 setAppearance:v4];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke;
    v23[3] = &unk_1E6E747E8;
    dispatch_semaphore_t v24 = v19;
    id v25 = v10;
    v26 = self;
    BOOL v27 = v11;
    v20 = v19;
    +[SearchUIBackgroundColorUtilities resolvedColoringForColorRequest:v18 completionHandler:v23];
    dispatch_semaphore_signal(v20);

LABEL_20:
    goto LABEL_21;
  }
  [(SearchUIBackgroundColorView *)self updateAppearance:0 withColors:0];
  v21 = [(SearchUIBackgroundColorView *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v18 = [(SearchUIBackgroundColorView *)self delegate];
    [v18 backgroundColorView:self didFinishColorUpdate:0];
    goto LABEL_20;
  }
LABEL_21:
}

- (SearchUIGradientView)gradientView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 456, 1);
}

- (id)viewsToOverrideAppearance
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUIBackgroundColorView *)self gradientView];
  v10[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v5 = (void *)[(id)v4 mutableCopy];

  double v6 = [(SearchUIBackgroundColorView *)self delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    v7 = [(SearchUIBackgroundColorView *)self delegate];
    v8 = [v7 viewContainingContent];
    [v5 addObject:v8];
  }
  return v5;
}

- (SearchUIBackgroundColorViewProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIBackgroundColorViewProtocol *)WeakRetained;
}

- (UIView)platterView
{
  return (UIView *)objc_getProperty(self, a2, 440, 1);
}

- (BOOL)showsPlaceholderPlatterView
{
  return self->_showsPlaceholderPlatterView;
}

- (TLKProminenceView)prominenceView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 448, 1);
}

- (SFColor)color
{
  return self->_color;
}

- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIBackgroundColorView;
  id v6 = a4;
  [(SearchUIBackgroundColorView *)&v10 tlks_setCornerRadius:v6 withStyle:a3];
  v7 = [(SearchUIBackgroundColorView *)self platterView];
  objc_msgSend(v7, "tlks_setCornerRadius:withStyle:", v6, a3);

  v8 = [(SearchUIBackgroundColorView *)self gradientView];
  objc_msgSend(v8, "tlks_setCornerRadius:withStyle:", v6, a3);

  v9 = [(SearchUIBackgroundColorView *)self colorBlendView];
  objc_msgSend(v9, "tlks_setCornerRadius:withStyle:", v6, a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (void)setShowsPlaceholderPlatterView:(BOOL)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (self->_showsPlaceholderPlatterView != a3)
  {
    self->_showsPlaceholderPlatterView = a3;
    if (a3
      || (v3 = (void *)0x1E4FAE000, ([MEMORY[0x1E4FAE198] isSiri] & 1) != 0)
      || ([MEMORY[0x1E4FAE198] isIpad] & 1) == 0
      && ![MEMORY[0x1E4FAE198] isMacOS])
    {
      id v5 = [MEMORY[0x1E4FB1618] blackColor];
      double v15 = v5;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      int v8 = 0;
    }
    else
    {
      v3 = [MEMORY[0x1E4FB1618] blackColor];
      v16[0] = v3;
      uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
      v16[1] = v4;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      int v8 = 1;
    }
    v9 = [(SearchUIBackgroundColorView *)self colorBlendView];
    [v9 setColors:v7];

    if (v8)
    {

      v3 = [(SearchUIBackgroundColorView *)self gradientViewMaskView];
      uint64_t v4 = [v3 layer];
      objc_super v10 = [v4 locations];
    }
    else
    {

      objc_super v10 = 0;
    }
    BOOL v11 = [(SearchUIBackgroundColorView *)self colorBlendView];
    v12 = [v11 layer];
    [v12 setLocations:v10];

    if (v8)
    {

      v13 = [(SearchUIBackgroundColorView *)self gradientViewMaskView];
    }
    else
    {
      v13 = 0;
    }
    double v14 = [(SearchUIBackgroundColorView *)self gradientView];
    [v14 setMaskView:v13];

    if (v8) {
  }
    }
}

- (SearchUIGradientView)colorBlendView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDelegate:(id)a3
{
}

- (SearchUIBackgroundColorView)initWithFrame:(CGRect)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SearchUIBackgroundColorView;
  v3 = -[SearchUIBackgroundColorView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FAE120] viewWithProminence:3];
    [(SearchUIBackgroundColorView *)v3 setProminenceView:v4];
    [(SearchUIBackgroundColorView *)v3 setPlatterView:v4];
    [(SearchUIBackgroundColorView *)v3 addSubview:v4];
    +[SearchUIAutoLayout fillContainerWithView:v4];
    id v5 = objc_opt_new();
    uint64_t v6 = *MEMORY[0x1E4F39FF8];
    v7 = [v5 layer];
    [v7 setCompositingFilter:v6];

    [(SearchUIBackgroundColorView *)v3 setColorBlendView:v5];
    int v8 = [(SearchUIBackgroundColorView *)v3 colorBlendView];
    [(SearchUIBackgroundColorView *)v3 addSubview:v8];

    v9 = [(SearchUIBackgroundColorView *)v3 colorBlendView];
    +[SearchUIAutoLayout fillContainerWithView:v9];

    objc_super v10 = objc_opt_new();
    BOOL v11 = [MEMORY[0x1E4FB1618] blackColor];
    v22[0] = v11;
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    v22[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v10 setColors:v13];

    double v14 = [v10 layer];
    [v14 setLocations:&unk_1F404B028];

    [(SearchUIBackgroundColorView *)v3 setGradientViewMaskView:v10];
    double v15 = objc_opt_new();
    [(SearchUIBackgroundColorView *)v3 setGradientView:v15];

    double v16 = [(SearchUIBackgroundColorView *)v3 gradientView];
    [(SearchUIBackgroundColorView *)v3 addSubview:v16];

    double v17 = [(SearchUIBackgroundColorView *)v3 gradientView];
    +[SearchUIAutoLayout fillContainerWithView:v17];

    v18 = [(SearchUIBackgroundColorView *)v3 layer];
    [v18 setAllowsGroupOpacity:0];

    dispatch_semaphore_t v19 = [(SearchUIBackgroundColorView *)v3 layer];
    [v19 setAllowsGroupBlending:0];

    [(SearchUIBackgroundColorView *)v3 setShowsPlaceholderPlatterView:1];
  }
  return v3;
}

- (void)setProminenceView:(id)a3
{
}

- (void)setPlatterView:(id)a3
{
}

- (void)setGradientViewMaskView:(id)a3
{
}

- (void)setGradientView:(id)a3
{
}

- (void)setColorBlendView:(id)a3
{
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SearchUIBackgroundColorView;
  [(SearchUIBackgroundColorView *)&v20 layoutSubviews];
  v3 = [(SearchUIBackgroundColorView *)self gradientView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SearchUIBackgroundColorView *)self gradientViewMaskView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(SearchUIBackgroundColorView *)self backgroundImageView];
  [v13 intrinsicContentSize];
  double v15 = v14;
  double v17 = v16;

  double v18 = 0.0;
  if ([MEMORY[0x1E4FAE100] isLTR])
  {
    [(SearchUIBackgroundColorView *)self bounds];
    double v18 = CGRectGetWidth(v21) - v15;
  }
  dispatch_semaphore_t v19 = [(SearchUIBackgroundColorView *)self backgroundImageView];
  objc_msgSend(v19, "setFrame:", v18, 0.0, v15, v17);
}

- (SearchUIGradientView)gradientViewMaskView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 464, 1);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIBackgroundColorView;
  [(SearchUIBackgroundColorView *)&v3 didMoveToWindow];
  [(SearchUIBackgroundColorView *)self tlk_updateWithCurrentAppearance];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBackgroundColorView;
  [(SearchUIBackgroundColorView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(SearchUIBackgroundColorView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIBackgroundColorView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUIBackgroundColorView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)updateAppearance:(id)a3 withColors:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [(SearchUIBackgroundColorView *)self viewsToOverrideAppearance];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        if ([v7 count]) {
          +[SearchUIBackgroundColorUtilities overrideAppearance:v6 onView:v13];
        }
        else {
          [MEMORY[0x1E4FAE060] disableAppearanceOverrideForView:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  double v14 = [(SearchUIBackgroundColorView *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(SearchUIBackgroundColorView *)self delegate];
    [v16 backgroundColorView:self updatedAppearance:v6];
  }
}

- (void)updateWithSFCard:(id)a3
{
  id v4 = a3;
  double v5 = [v4 backgroundImage];
  [(SearchUIBackgroundColorView *)self setBackgroundImage:v5];

  id v6 = [v4 backgroundColor];

  [(SearchUIBackgroundColorView *)self setColor:v6];
}

- (void)setBackgroundImage:(id)a3
{
  uint64_t v12 = (SFImage *)a3;
  if (self->_backgroundImage != v12)
  {
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    double v5 = [(SearchUIBackgroundColorView *)self backgroundImageView];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [v6 setShadowDisabled:1];
      [v6 setPlaceholderVisibility:2];
      [(SearchUIBackgroundColorView *)self setBackgroundImageView:v6];
      id v7 = [(SearchUIBackgroundColorView *)self gradientView];
      [v7 addSubview:v6];
    }
    uint64_t v8 = [(SearchUIBackgroundColorView *)self backgroundImageView];
    [v8 updateWithImage:v12];

    uint64_t v9 = [(SearchUIBackgroundColorView *)self backgroundImageView];
    [v9 setHidden:v12 == 0];

    uint64_t v10 = [(SearchUIBackgroundColorView *)self gradientView];
    uint64_t v11 = [v10 layer];
    [v11 setMasksToBounds:v12 != 0];

    if (v12) {
      [(SearchUIBackgroundColorView *)self setNeedsLayout];
    }
  }
}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0) == 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_2;
  v8[3] = &unk_1E6E747C0;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  char v12 = *(unsigned char *)(a1 + 56);
  BOOL v13 = v4;
  id v7 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v8];
}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) tintedUIColors];
  id v3 = *(void **)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 48) color];
  if (![v3 isEqual:v4])
  {

    goto LABEL_17;
  }
  uint64_t v5 = [v2 count];

  if (!v5)
  {
LABEL_17:
    if (![v2 count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = [*(id *)(a1 + 40) applicationBundleIdentifier];

        if (!v18)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_4;
          v24[3] = &unk_1E6E72730;
          v24[4] = *(void *)(a1 + 48);
          +[SearchUIUtilities performAnimatableChanges:v24];
        }
      }
    }
    goto LABEL_25;
  }
  if (*(unsigned char *)(a1 + 56) && ([MEMORY[0x1E4FAE100] isLTR] & 1) == 0)
  {
    uint64_t v6 = [v2 reverseObjectEnumerator];
    uint64_t v7 = [v6 allObjects];

    v2 = (void *)v7;
  }
  uint64_t v8 = [*(id *)(a1 + 48) gradientView];
  [v8 setColors:v2];

  id v9 = *(void **)(a1 + 48);
  id v10 = [*(id *)(a1 + 32) bestForegroundAppearanceForBackgroundColors];
  [v9 updateAppearance:v10 withColors:v2];

  if ([*(id *)(a1 + 32) tintStyle] == 3)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = [*(id *)(a1 + 32) originalUIColors];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          double v27 = 0.0;
          [v16 getHue:0 saturation:&v27 brightness:0 alpha:0];
          if (v27 > 0.1)
          {
            char v17 = 1;
            goto LABEL_23;
          }
        }
        uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v27);
        if (v13) {
          continue;
        }
        break;
      }
    }
    char v17 = 0;
LABEL_23:
  }
  else
  {
    char v17 = 1;
  }
  long long v19 = *(void **)(a1 + 40);
  long long v20 = +[SearchUIBackgroundColorUtilities disambiguationInnerPlatterColor];
  LOBYTE(v19) = [v19 isEqual:v20];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_3;
  v25[3] = &unk_1E6E72758;
  v25[4] = *(void *)(a1 + 48);
  char v26 = v17 & (v19 ^ 1);
  +[SearchUIUtilities performAnimatableChanges:v25 animated:*(unsigned __int8 *)(a1 + 57)];
LABEL_25:
  CGRect v21 = [*(id *)(a1 + 48) delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [*(id *)(a1 + 48) delegate];
    [v23 backgroundColorView:*(void *)(a1 + 48) didFinishColorUpdate:*(void *)(a1 + 40)];
  }
}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_3(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  BOOL v4 = [*(id *)(a1 + 32) colorBlendView];
  [v4 setAlpha:v3];

  uint64_t v5 = [*(id *)(a1 + 32) gradientView];
  [v5 setAlpha:1.0];

  id v6 = [*(id *)(a1 + 32) platterView];
  [v6 setAlpha:0.0];
}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) prominenceView];
  [v1 setCustomColorAlpha:0.13];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SearchUIBackgroundColorView *)self isHidden] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SearchUIBackgroundColorView;
    [(SearchUIBackgroundColorView *)&v5 setHidden:v3];
    if (v3) {
      [(SearchUIBackgroundColorView *)self updateAppearance:0 withColors:0];
    }
    else {
      [(SearchUIBackgroundColorView *)self tlk_updateWithCurrentAppearance];
    }
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  unint64_t v3 = a3;
  self->_maskedCorners = a3;
  unint64_t v5 = +[SearchUIUtilities flippedCornerMaskFromCornerMask:](SearchUIUtilities, "flippedCornerMaskFromCornerMask:");
  id v6 = [(SearchUIBackgroundColorView *)self layer];
  [v6 setMaskedCorners:v3];

  uint64_t v7 = [(SearchUIBackgroundColorView *)self platterView];
  uint64_t v8 = [v7 layer];
  int v9 = [v8 isGeometryFlipped];
  id v10 = [(SearchUIBackgroundColorView *)self layer];
  if (v9 != [v10 isGeometryFlipped]) {
    unint64_t v11 = v5;
  }
  else {
    unint64_t v11 = v3;
  }
  uint64_t v12 = [(SearchUIBackgroundColorView *)self platterView];
  uint64_t v13 = [v12 layer];
  [v13 setMaskedCorners:v11];

  uint64_t v14 = [(SearchUIBackgroundColorView *)self gradientView];
  char v15 = [v14 layer];
  int v16 = [v15 isGeometryFlipped];
  char v17 = [(SearchUIBackgroundColorView *)self layer];
  if (v16 != [v17 isGeometryFlipped]) {
    unint64_t v18 = v5;
  }
  else {
    unint64_t v18 = v3;
  }
  long long v19 = [(SearchUIBackgroundColorView *)self gradientView];
  long long v20 = [v19 layer];
  [v20 setMaskedCorners:v18];

  id v26 = [(SearchUIBackgroundColorView *)self colorBlendView];
  CGRect v21 = [v26 layer];
  int v22 = [v21 isGeometryFlipped];
  v23 = [(SearchUIBackgroundColorView *)self layer];
  if (v22 != [v23 isGeometryFlipped]) {
    unint64_t v3 = v5;
  }
  dispatch_semaphore_t v24 = [(SearchUIBackgroundColorView *)self colorBlendView];
  id v25 = [v24 layer];
  [v25 setMaskedCorners:v3];
}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (SearchUIImageView)backgroundImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setBackgroundImageView:(id)a3
{
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_colorBlendView, 0);
  objc_storeStrong((id *)&self->_gradientViewMaskView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_prominenceView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end