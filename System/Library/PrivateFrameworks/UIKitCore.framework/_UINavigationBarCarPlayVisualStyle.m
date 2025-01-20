@interface _UINavigationBarCarPlayVisualStyle
- (double)backIndicatorBottomMargin;
- (double)buttonHeight;
- (double)horizontalMarginAdjustment;
- (double)imageButtonMarginInNavigationBar:(id)a3;
- (double)leftBackTitleMargin;
- (double)leftTitleMargin;
- (double)textButtonMarginInNavigationBar:(id)a3;
- (double)topMargin;
- (double)topTitleMargin;
- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5;
@end

@implementation _UINavigationBarCarPlayVisualStyle

- (double)buttonHeight
{
  return 36.0;
}

- (double)leftTitleMargin
{
  return 16.0;
}

- (double)leftBackTitleMargin
{
  return 22.0;
}

- (double)backIndicatorBottomMargin
{
  return 14.5;
}

- (double)topMargin
{
  return 3.5;
}

- (double)horizontalMarginAdjustment
{
  return 12.0;
}

- (double)topTitleMargin
{
  return 1.5;
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  return 0;
}

- (double)textButtonMarginInNavigationBar:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarCarPlayVisualStyle;
  [(_UINavigationBarVisualStyle *)&v5 textButtonMarginInNavigationBar:a3];
  return v3 * 0.5;
}

- (double)imageButtonMarginInNavigationBar:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarCarPlayVisualStyle;
  [(_UINavigationBarVisualStyle *)&v5 imageButtonMarginInNavigationBar:a3];
  return v3 * 0.5;
}

@end