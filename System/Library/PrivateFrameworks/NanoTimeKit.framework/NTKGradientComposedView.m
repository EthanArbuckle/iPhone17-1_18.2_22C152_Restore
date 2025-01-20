@interface NTKGradientComposedView
- (BOOL)filterOn;
- (BOOL)showForegroundGradient;
- (NTKGradientComposedView)initWithDevice:(id)a3;
- (NTKGradientView)backgroundGradientTransitionView;
- (NTKGradientView)backgroundGradientView;
- (NTKGradientView)filterGradientView;
- (NTKRoundedCornerOverlayView)cornerOverlayView;
- (UIImageView)backgroundImageView;
- (UIView)backgroundDimmingView;
- (UIView)composedView;
- (UIView)cornerMaskView;
- (UIView)rootContainerView;
- (void)applyBackgroundGradientColorsFromPalette:(id)a3;
- (void)applyEditingComplicationsFraction:(double)a3;
- (void)applyForegroundGradientWithTopColor:(id)a3 centerColor:(id)a4 bottomColor:(id)a5;
- (void)applyGossamerColorPalette:(id)a3;
- (void)applyGradientColorsFromColorPalette:(id)a3 toView:(id)a4;
- (void)applyImageViewTransitionFraction:(double)a3;
- (void)setFilterOn:(BOOL)a3;
- (void)setRootContainerView:(id)a3;
- (void)setShowForegroundGradient:(BOOL)a3;
@end

@implementation NTKGradientComposedView

- (NTKGradientComposedView)initWithDevice:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 screenBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v44.receiver = self;
  v44.super_class = (Class)NTKGradientComposedView;
  v13 = -[NTKGradientComposedView initWithFrame:](&v44, sel_initWithFrame_);
  if (v13)
  {
    v14 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundGradientView = v13->_backgroundGradientView;
    v13->_backgroundGradientView = v14;

    v16 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundGradientTransitionView = v13->_backgroundGradientTransitionView;
    v13->_backgroundGradientTransitionView = v16;

    v18 = -[NTKGradientView initWithFrame:]([NTKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
    filterGradientView = v13->_filterGradientView;
    v13->_filterGradientView = v18;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v45[0] = v13->_backgroundGradientView;
    v45[1] = v13->_backgroundGradientTransitionView;
    v45[2] = v13->_filterGradientView;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      uint64_t v24 = *MEMORY[0x1E4F3A390];
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = [*(id *)(*((void *)&v40 + 1) + 8 * i) gradientLayer];
          [v26 setType:v24];
          objc_msgSend(v26, "setStartPoint:", 0.0, 0.0);
          objc_msgSend(v26, "setEndPoint:", 0.0, 1.0);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v22);
    }

    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v8, v10, v12);
    composedView = v13->_composedView;
    v13->_composedView = (UIView *)v27;

    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v8, v10, v12);
    cornerMaskView = v13->_cornerMaskView;
    v13->_cornerMaskView = (UIView *)v29;

    v31 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:]([NTKRoundedCornerOverlayView alloc], "initWithFrame:forDeviceCornerRadius:", v4, v6, v8, v10, v12);
    cornerOverlayView = v13->_cornerOverlayView;
    v13->_cornerOverlayView = v31;

    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v6, v8, v10, v12);
    backgroundImageView = v13->_backgroundImageView;
    v13->_backgroundImageView = (UIImageView *)v33;

    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v8, v10, v12);
    backgroundDimmingView = v13->_backgroundDimmingView;
    v13->_backgroundDimmingView = (UIView *)v35;

    v37 = v13->_backgroundDimmingView;
    v38 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v37 setBackgroundColor:v38];

    [(UIView *)v13->_backgroundDimmingView setAlpha:0.0];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_backgroundGradientView];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_backgroundGradientTransitionView];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_backgroundImageView];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_backgroundDimmingView];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_composedView];
    [(UIView *)v13->_cornerMaskView addSubview:v13->_cornerOverlayView];
    [(UIView *)v13->_composedView addSubview:v13->_filterGradientView];
    [(NTKGradientComposedView *)v13 addSubview:v13->_cornerMaskView];
    [(NTKGradientComposedView *)v13 setFilterOn:1];
  }

  return v13;
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
  id v4 = (UIView *)a3;
  rootContainerView = self->_rootContainerView;
  double v10 = v4;
  if (rootContainerView)
  {
    [(UIView *)rootContainerView removeFromSuperview];
    double v6 = [(UIView *)self->_rootContainerView layer];
    [v6 setCompositingFilter:0];

    id v4 = v10;
  }
  self->_rootContainerView = v4;
  if (v4)
  {
    [(UIView *)self->_composedView addSubview:v10];
    double v7 = [(UIView *)self->_rootContainerView layer];
    double v8 = v7;
    if (self->_filterOn) {
      uint64_t v9 = *MEMORY[0x1E4F3A298];
    }
    else {
      uint64_t v9 = 0;
    }
    [v7 setCompositingFilter:v9];

    id v4 = v10;
  }
}

- (void)setFilterOn:(BOOL)a3
{
  if (self->_filterOn != a3)
  {
    self->_filterOn = a3;
    id v4 = [(UIView *)self->_rootContainerView layer];
    double v5 = v4;
    if (self->_filterOn) {
      uint64_t v6 = *MEMORY[0x1E4F3A298];
    }
    else {
      uint64_t v6 = 0;
    }
    [v4 setCompositingFilter:v6];

    filterGradientView = self->_filterGradientView;
    BOOL v8 = !self->_filterOn;
    [(NTKGradientView *)filterGradientView setHidden:v8];
  }
}

- (void)applyGossamerColorPalette:(id)a3
{
  id v13 = a3;
  id v4 = [v13 imageViewFraction];
  [v4 doubleValue];
  -[NTKGradientComposedView applyImageViewTransitionFraction:](self, "applyImageViewTransitionFraction:");

  [(NTKGradientComposedView *)self applyBackgroundGradientColorsFromPalette:v13];
  if (self->_showForegroundGradient)
  {
    double v5 = [v13 foregroundGradientFraction];
    [v5 doubleValue];
    double v7 = v6;
    BOOL v8 = v6 > 0.0;

    [(NTKGradientComposedView *)self setFilterOn:v8];
    if (v7 > 0.0)
    {
      uint64_t v9 = [v13 topAccentColor];
      double v10 = [v13 centerAccentColor];
      double v11 = [v13 bottomAccentColor];
      [(NTKGradientComposedView *)self applyForegroundGradientWithTopColor:v9 centerColor:v10 bottomColor:v11];
    }
  }
  else
  {
    [(NTKGradientComposedView *)self setFilterOn:0];
  }
  double v12 = [v13 editingComplicationsFraction];
  [v12 doubleValue];
  -[NTKGradientComposedView applyEditingComplicationsFraction:](self, "applyEditingComplicationsFraction:");
}

- (void)applyEditingComplicationsFraction:(double)a3
{
  CLKInterpolateBetweenFloatsClipped();
  backgroundDimmingView = self->_backgroundDimmingView;
  -[UIView setAlpha:](backgroundDimmingView, "setAlpha:");
}

- (void)applyImageViewTransitionFraction:(double)a3
{
  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  if (a3 > 0.0)
  {
    double v5 = [(UIImageView *)self->_backgroundImageView image];

    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v6 = [MEMORY[0x1E4FB1818] imageNamed:@"multicolorBackground" inBundle:v7 withConfiguration:0];
      [(UIImageView *)self->_backgroundImageView setImage:v6];
    }
  }
}

- (void)applyBackgroundGradientColorsFromPalette:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v12;
    double v5 = [v4 fromPalette];
    [(NTKGradientComposedView *)self applyGradientColorsFromColorPalette:v5 toView:self->_backgroundGradientView];

    double v6 = [v4 toPalette];
    [(NTKGradientComposedView *)self applyGradientColorsFromColorPalette:v6 toView:self->_backgroundGradientTransitionView];

    backgroundGradientTransitionView = self->_backgroundGradientTransitionView;
    [v4 transitionFraction];
    double v9 = v8;

    double v10 = backgroundGradientTransitionView;
    double v11 = v9;
  }
  else
  {
    [(NTKGradientComposedView *)self applyGradientColorsFromColorPalette:v12 toView:self->_backgroundGradientView];
    double v10 = self->_backgroundGradientTransitionView;
    double v11 = 0.0;
  }
  [(NTKGradientView *)v10 setAlpha:v11];
}

- (void)applyGradientColorsFromColorPalette:(id)a3 toView:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [a3 backgroundGradientColors];
  if ((unint64_t)[v6 count] <= 1)
  {
    id v7 = [v6 firstObject];
    double v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4FB1618] blackColor];
    }
    double v10 = v9;

    v26[0] = v10;
    v26[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];

    double v6 = (void *)v11;
  }
  id v12 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "CGColor", (void)v21);
        [v12 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  v20 = [v5 gradientLayer];
  [v20 setColors:v12];
}

- (void)applyForegroundGradientWithTopColor:(id)a3 centerColor:(id)a4 bottomColor:(id)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  filterGradientView = self->_filterGradientView;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(NTKGradientView *)filterGradientView gradientLayer];
  id v12 = v10;
  uint64_t v13 = [v12 CGColor];

  id v14 = v9;
  uint64_t v15 = objc_msgSend(v14, "CGColor", v13);

  v19[1] = v15;
  id v16 = v8;
  uint64_t v17 = [v16 CGColor];

  v19[2] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  [v11 setColors:v18];
}

- (BOOL)filterOn
{
  return self->_filterOn;
}

- (BOOL)showForegroundGradient
{
  return self->_showForegroundGradient;
}

- (void)setShowForegroundGradient:(BOOL)a3
{
  self->_showForegroundGradient = a3;
}

- (NTKGradientView)backgroundGradientView
{
  return self->_backgroundGradientView;
}

- (NTKGradientView)backgroundGradientTransitionView
{
  return self->_backgroundGradientTransitionView;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (UIView)backgroundDimmingView
{
  return self->_backgroundDimmingView;
}

- (UIView)cornerMaskView
{
  return self->_cornerMaskView;
}

- (NTKRoundedCornerOverlayView)cornerOverlayView
{
  return self->_cornerOverlayView;
}

- (UIView)composedView
{
  return self->_composedView;
}

- (NTKGradientView)filterGradientView
{
  return self->_filterGradientView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterGradientView, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_cornerMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundGradientTransitionView, 0);
  objc_storeStrong((id *)&self->_backgroundGradientView, 0);
}

@end