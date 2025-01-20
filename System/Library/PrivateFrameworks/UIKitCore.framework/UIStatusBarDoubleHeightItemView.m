@interface UIStatusBarDoubleHeightItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraRightPadding;
- (id)contentsImage;
@end

@implementation UIStatusBarDoubleHeightItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  v5 = [a3 doubleHeightStatus];
  p_contentsString = &self->_contentsString;
  char v7 = [v5 isEqualToString:self->_contentsString];
  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentsString, v5);
    v8 = [(UIStatusBarItemView *)self textFont];
    [(NSString *)*p_contentsString _legacy_sizeWithFont:v8];
    self->_double letterSpacing = 0.0;
    self->_ellipsize = 0;
    if (v9 > 320.0)
    {
      while (1)
      {
        double letterSpacing = self->_letterSpacing;
        if (letterSpacing < -1.0) {
          break;
        }
        self->_double letterSpacing = letterSpacing + -0.25;
        -[NSString sizeWithFont:forWidth:lineBreakMode:letterSpacing:](*p_contentsString, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v8, 5, 3.40282347e38);
        if (v11 <= 320.0)
        {
          double letterSpacing = self->_letterSpacing;
          break;
        }
      }
      if (letterSpacing < -1.0)
      {
        self->_double letterSpacing = 0.0;
        self->_ellipsize = 1;
      }
    }
  }
  return v7 ^ 1;
}

- (id)contentsImage
{
  if ([(NSString *)self->_contentsString length])
  {
    if (self->_ellipsize) {
      double v3 = 320.0;
    }
    else {
      double v3 = 1.79769313e308;
    }
    v4 = [(UIStatusBarItemView *)self foregroundStyle];
    contentsString = self->_contentsString;
    double letterSpacing = self->_letterSpacing;
    int64_t v7 = [(UIStatusBarItemView *)self textAlignment];
    int64_t v8 = [(UIStatusBarItemView *)self textStyle];
    int64_t v9 = [(UIStatusBarItemView *)self legibilityStyle];
    [(UIStatusBarItemView *)self legibilityStrength];
    double v11 = [v4 imageWithText:contentsString ofItemType:23 forWidth:5 lineBreakMode:v7 letterSpacing:v8 textAlignment:v9 style:v3 withLegibilityStyle:letterSpacing legibilityStrength:v10];
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (double)extraRightPadding
{
  return 10.0;
}

- (void).cxx_destruct
{
}

@end