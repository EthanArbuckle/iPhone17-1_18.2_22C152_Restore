@interface _UINavigationBarPhonePadVisualStyle
- (double)_legacyButtonFontSize;
- (double)_legacyButtonImagePadding;
- (double)_legacyLeftTitleMargin;
- (double)_legacyRightTitleMargin;
- (double)backIndicatorBottomMargin;
- (double)barHeight;
- (double)barPromptHeight;
- (double)buttonHeight;
- (double)navigationItemBaselineOffset;
- (double)topBackMargin;
- (double)topMargin;
- (double)topTitleMargin;
- (id)_legacyButtonFontForStyle:(int64_t)a3;
- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5;
@end

@implementation _UINavigationBarPhonePadVisualStyle

- (double)buttonHeight
{
  int64_t metrics = self->super._metrics;
  double result = 24.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 buttonHeight];
  }
  return result;
}

- (double)barHeight
{
  int64_t metrics = self->super._metrics;
  double result = 32.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 barHeight];
  }
  return result;
}

- (double)barPromptHeight
{
  int64_t metrics = self->super._metrics;
  double result = 54.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 barPromptHeight];
  }
  return result;
}

- (double)topMargin
{
  double result = 9.0;
  if (!self->super._inPopover)
  {
    int64_t metrics = self->super._metrics;
    double result = 4.0;
    if (metrics != 1 && metrics != 102)
    {
      v4.receiver = self;
      v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
      [(_UINavigationBarVisualStyle *)&v4 topMargin];
    }
  }
  return result;
}

- (double)topTitleMargin
{
  int64_t metrics = self->super._metrics;
  double result = 1.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 topTitleMargin];
  }
  return result;
}

- (double)topBackMargin
{
  int64_t metrics = self->super._metrics;
  double result = 5.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 topBackMargin];
  }
  return result;
}

- (double)navigationItemBaselineOffset
{
  int64_t metrics = self->super._metrics;
  double result = 11.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 navigationItemBaselineOffset];
  }
  return result;
}

- (double)backIndicatorBottomMargin
{
  int64_t metrics = self->super._metrics;
  double result = 7.5;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    [(_UINavigationBarVisualStyle *)&v4 backIndicatorBottomMargin];
  }
  return result;
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v8 = (unint64_t)(a4 - 3) < 2;
  id v9 = a3;
  if (_UIUseMiniHeightInLandscape(v8)) {
    int64_t v10 = a4;
  }
  else {
    int64_t v10 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
  id v11 = [(_UINavigationBarVisualStyle *)&v13 navigationBar:v9 metricsForOrientation:v10 hasPrompt:v5];

  return (int64_t)v11;
}

- (double)_legacyLeftTitleMargin
{
  return 12.0;
}

- (double)_legacyRightTitleMargin
{
  return 8.0;
}

- (double)_legacyButtonFontSize
{
  return 12.0;
}

- (id)_legacyButtonFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:", a3, 12.0);
}

- (double)_legacyButtonImagePadding
{
  return 20.0;
}

@end