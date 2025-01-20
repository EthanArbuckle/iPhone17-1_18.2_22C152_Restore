@interface _UINavigationBarTVVisualStyle
- (UIEdgeInsets)buttonContentEdgeInsets;
- (double)barHeight;
- (double)buttonHeight;
- (double)buttonImagePadding;
- (double)headingFontSize;
- (double)interItemSpace;
- (double)leftTitleMargin;
- (double)navigationItemBaselineOffset;
- (double)topMargin;
- (id)buttonFontForStyle:(int64_t)a3;
- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4;
- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5;
@end

@implementation _UINavigationBarTVVisualStyle

- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:", *MEMORY[0x1E4F3A4A0], a4, a5);
}

- (double)headingFontSize
{
  v2 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleTitle2"];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (double)buttonHeight
{
  return 70.0;
}

- (double)barHeight
{
  [(_UINavigationBarTVVisualStyle *)self navigationItemBaselineOffset];
  return v2 + 111.0;
}

- (double)interItemSpace
{
  return 24.0;
}

- (double)leftTitleMargin
{
  return 35.0;
}

- (double)buttonImagePadding
{
  [(_UINavigationBarTVVisualStyle *)self leftTitleMargin];
  return v2 + v2;
}

- (double)navigationItemBaselineOffset
{
  [(_UINavigationBarTVVisualStyle *)self buttonContentEdgeInsets];
  double v4 = v3;
  [(_UINavigationBarTVVisualStyle *)self topMargin];
  return v4 + v5 + 2.0;
}

- (double)topMargin
{
  return 12.0;
}

- (UIEdgeInsets)buttonContentEdgeInsets
{
  double v2 = 40.0;
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (id)buttonFontForStyle:(int64_t)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  if (a3 == 2)
  {
    double v4 = 1.0;
    double v5 = 0.25;
  }
  else
  {
    double v5 = 0.4;
    double v4 = 0.0;
  }
  v6 = +[UIColor colorWithWhite:v4 alpha:v5];
  return v6;
}

@end