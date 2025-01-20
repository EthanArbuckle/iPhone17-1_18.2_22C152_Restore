@interface VUIProgressBarLayout
+ (id)defaultProgressBarLayout;
- (BOOL)shouldProgressBarUseRoundCorner;
- (BOOL)useMaterial;
- (UIColor)fillColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)tintColor;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (double)cornerRadius;
- (double)height;
- (void)setCornerRadius:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setHeight:(double)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setUseMaterial:(BOOL)a3;
@end

@implementation VUIProgressBarLayout

+ (id)defaultProgressBarLayout
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 2)
  {
    [v2 setHeight:10.0];
    objc_msgSend(v2, "setPadding:", 2.0, 2.0, 2.0, 2.0);
    v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_progressBarFillColor");
    [v2 setFillColor:v5];

    [v2 setCornerRadius:5.0];
    [v2 setShouldProgressBarUseRoundCorner:1];
    [v2 setUseMaterial:1];
    [v2 setTintColor:0];
  }
  else
  {
    [v2 setHeight:2.0];
    [v2 setCornerRadius:5.0];
    v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.847058824 green:0.847058824 blue:0.847058824 alpha:0.4];
    [v2 setTintColor:v6];

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [v2 setFillColor:v7];

    [v2 setShouldProgressBarUseRoundCorner:1];
    [v2 setUseMaterial:0];
  }
  return v2;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  self->_shouldProgressBarUseRoundCorner = a3;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (void)setUseMaterial:(BOOL)a3
{
  self->_useMaterial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end