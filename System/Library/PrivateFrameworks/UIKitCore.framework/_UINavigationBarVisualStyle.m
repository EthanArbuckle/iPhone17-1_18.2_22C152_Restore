@interface _UINavigationBarVisualStyle
+ (id)visualStyleForIdiom:(int64_t)a3;
- (BOOL)inPopover;
- (BOOL)metricsHasPrompt;
- (BOOL)metricsIsMini;
- (BOOL)shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:(id)a3;
- (UIEdgeInsets)buttonContentEdgeInsets;
- (UIFont)promptFont;
- (_UINavigationBarVisualStyle)initWithIdiom:(int64_t)a3;
- (double)_legacyButtonFontSize;
- (double)_legacyButtonImagePadding;
- (double)_legacyLeftTitleMargin;
- (double)backButtonAnimationClippingPadding;
- (double)backButtonIndicatorSpacing;
- (double)backIndicatorBottomMargin;
- (double)barHeight;
- (double)barHeightForMetrics:(int64_t)a3;
- (double)barPromptHeight;
- (double)bottomButtonMargin;
- (double)bottomImageMargin;
- (double)buttonHeight;
- (double)buttonImagePadding;
- (double)headingFontSize;
- (double)horizontalMarginAdjustment;
- (double)imageButtonMarginInNavigationBar:(id)a3;
- (double)interBlockSpace;
- (double)interItemSpace;
- (double)leftBackTitleMargin;
- (double)leftBackTitleMarginForCustomBackButtonBackground:(id)a3;
- (double)leftTextMargin;
- (double)leftTitleMargin;
- (double)maxBackButtonProportion;
- (double)minBackImageWidth;
- (double)minBackTextWidth;
- (double)minButtonWidth;
- (double)minTitleWidth;
- (double)navigationItemBaselineOffset;
- (double)promptFontSize;
- (double)promptInset;
- (double)promptTextOffset;
- (double)textButtonMarginInNavigationBar:(id)a3;
- (double)topBackMargin;
- (double)topImageMargin;
- (double)topMargin;
- (double)topTitleMargin;
- (id)_legacyButtonFontForStyle:(int64_t)a3;
- (id)buttonFontForStyle:(int64_t)a3;
- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4;
- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5;
- (int64_t)idiom;
- (int64_t)metrics;
- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5;
- (void)setInPopover:(BOOL)a3;
- (void)setMetrics:(int64_t)a3;
@end

@implementation _UINavigationBarVisualStyle

+ (id)visualStyleForIdiom:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 == -1)
  {
    v4 = +[UIDevice currentDevice];
    int64_t v3 = [v4 userInterfaceIdiom];
  }
  if ((unint64_t)(v3 - 2) > 6) {
    v5 = off_1E52D5B18;
  }
  else {
    v5 = off_1E52DE3B0[v3 - 2];
  }
  v6 = (void *)[objc_alloc(*v5) initWithIdiom:v3];
  return v6;
}

- (_UINavigationBarVisualStyle)initWithIdiom:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualStyle;
  result = [(_UINavigationBarVisualStyle *)&v5 init];
  if (result) {
    result->_idiom = a3;
  }
  return result;
}

- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5
{
  id v7 = a3;
  if ([a4 isEqualToString:@"opacity"])
  {
    [v7 alpha];
    HIDWORD(v11) = 1068079513;
    if (v8 < 0.05
      || (objc_opt_respondsToSelector() & 1) != 0 && [v7 _isFadingInFromCustomAlpha])
    {
      v12 = (void *)MEMORY[0x1E4F39C10];
      LODWORD(v11) = 1036831949;
      LODWORD(v8) = 0.75;
      LODWORD(v9) = 0.75;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F39C10];
      LODWORD(v11) = 1063675494;
      LODWORD(v8) = 0.25;
      LODWORD(v9) = 0.25;
    }
    LODWORD(v10) = LODWORD(v11);
    uint64_t v14 = [v12 functionWithControlPoints:v8 :v11 :v9 :v10];
  }
  else
  {
    if (a5) {
      v13 = (void *)MEMORY[0x1E4F3A4A0];
    }
    else {
      v13 = (void *)MEMORY[0x1E4F3A480];
    }
    uint64_t v14 = [MEMORY[0x1E4F39C10] functionWithName:*v13];
  }
  v15 = (void *)v14;

  return v15;
}

- (BOOL)metricsIsMini
{
  int64_t metrics = self->_metrics;
  return metrics == 1 || metrics == 102;
}

- (BOOL)metricsHasPrompt
{
  return (unint64_t)(self->_metrics - 101) < 2;
}

- (double)backButtonIndicatorSpacing
{
  int v2 = dyld_program_sdk_at_least();
  double result = 7.5;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (double)backButtonAnimationClippingPadding
{
  return 0.0;
}

- (double)buttonHeight
{
  return 30.0;
}

- (double)barHeight
{
  return 44.0;
}

- (double)barPromptHeight
{
  return 74.0;
}

- (double)barHeightForMetrics:(int64_t)a3
{
  int64_t metrics = self->_metrics;
  self->_int64_t metrics = a3;
  if ((unint64_t)(a3 - 101) >= 2) {
    [(_UINavigationBarVisualStyle *)self barHeight];
  }
  else {
    [(_UINavigationBarVisualStyle *)self barPromptHeight];
  }
  self->_int64_t metrics = metrics;
  return result;
}

- (double)topMargin
{
  return 7.0;
}

- (double)horizontalMarginAdjustment
{
  return 8.0;
}

- (double)topTitleMargin
{
  return 3.0;
}

- (double)topBackMargin
{
  return 8.0;
}

- (double)headingFontSize
{
  [off_1E52D39B8 defaultFontSize];
  return result;
}

- (double)leftTitleMargin
{
  return 0.0;
}

- (double)leftBackTitleMargin
{
  return 19.0;
}

- (double)leftTextMargin
{
  return 8.0;
}

- (double)topImageMargin
{
  return 2.0;
}

- (double)bottomImageMargin
{
  [(_UINavigationBarVisualStyle *)self topImageMargin];
  return v2 + 1.0;
}

- (double)bottomButtonMargin
{
  return 7.0;
}

- (double)promptInset
{
  return 10.0;
}

- (double)interItemSpace
{
  return 8.0;
}

- (double)interBlockSpace
{
  return 6.0;
}

- (double)maxBackButtonProportion
{
  return 0.5;
}

- (double)minBackTextWidth
{
  return 28.0;
}

- (double)minBackImageWidth
{
  return 28.0;
}

- (double)minButtonWidth
{
  return 56.0;
}

- (double)minTitleWidth
{
  return 75.0;
}

- (double)buttonImagePadding
{
  return 22.0;
}

- (double)promptFontSize
{
  return 13.0;
}

- (UIFont)promptFont
{
  return (UIFont *)[off_1E52D39B8 systemFontOfSize:13.0];
}

- (double)promptTextOffset
{
  return 10.0;
}

- (double)navigationItemBaselineOffset
{
  return 16.0;
}

- (double)backIndicatorBottomMargin
{
  return 11.5;
}

- (UIEdgeInsets)buttonContentEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)buttonFontForStyle:(int64_t)a3
{
  [(_UINavigationBarVisualStyle *)self buttonFontSize];
  if (a3 == 2) {
    objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
  }
  else {
  double v4 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  return v4;
}

- (BOOL)shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:(id)a3
{
  return a3 != 0;
}

- (double)leftBackTitleMarginForCustomBackButtonBackground:(id)a3
{
  id v4 = a3;
  if ([(_UINavigationBarVisualStyle *)self shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:v4])
  {
    [(_UINavigationBarVisualStyle *)self _legacyLeftTitleMargin];
  }
  else
  {
    [(_UINavigationBarVisualStyle *)self leftBackTitleMargin];
  }
  double v6 = v5;
  [v4 capInsets];
  double v8 = v7;

  return fmax(v6, v8);
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  int64_t v5 = 101;
  if ((unint64_t)(a4 - 1) >= 2) {
    int64_t v5 = 102;
  }
  if (a5) {
    return v5;
  }
  else {
    return (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
}

- (double)textButtonMarginInNavigationBar:(id)a3
{
  [a3 _textButtonMargin];
  return result;
}

- (double)imageButtonMarginInNavigationBar:(id)a3
{
  [a3 _imageButtonMargin];
  return result;
}

- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  if ((unint64_t)(a4 - 3) > 0xFFFFFFFFFFFFFFFDLL) {
    +[UIColor whiteColor];
  }
  else {
  id v4 = +[UIColor blackColor];
  }
  return v4;
}

- (double)_legacyLeftTitleMargin
{
  return 0.0;
}

- (double)_legacyButtonFontSize
{
  return 0.0;
}

- (id)_legacyButtonFontForStyle:(int64_t)a3
{
  return 0;
}

- (double)_legacyButtonImagePadding
{
  return 0.0;
}

- (int64_t)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(int64_t)a3
{
  self->_int64_t metrics = a3;
}

- (BOOL)inPopover
{
  return self->_inPopover;
}

- (void)setInPopover:(BOOL)a3
{
  self->_inPopover = a3;
}

- (int64_t)idiom
{
  return self->_idiom;
}

@end