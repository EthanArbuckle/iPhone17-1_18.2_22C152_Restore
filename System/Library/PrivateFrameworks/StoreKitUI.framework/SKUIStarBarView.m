@interface SKUIStarBarView
- (CGSize)sizeThatFits:(CGSize)result;
- (SKUIStarBarView)initWithFrame:(CGRect)a3;
- (UIColor)emptyColor;
- (UIColor)filledColor;
- (double)value;
- (int64_t)numberOfStars;
- (void)drawRect:(CGRect)a3;
- (void)setColoringUsingStyle:(id)a3;
- (void)setEmptyColor:(id)a3;
- (void)setFilledColor:(id)a3;
- (void)setNumberOfStars:(int64_t)a3;
- (void)setValue:(double)a3;
@end

@implementation SKUIStarBarView

- (SKUIStarBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStarBarView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIStarBarView;
  v8 = -[SKUIStarBarView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
    emptyColor = v8->_emptyColor;
    v8->_emptyColor = (UIColor *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
    filledColor = v8->_filledColor;
    v8->_filledColor = (UIColor *)v11;

    [(SKUIStarBarView *)v8 setContentMode:3];
  }
  return v8;
}

- (void)setColoringUsingStyle:(id)a3
{
  id v4 = a3;
  v5 = [v4 ikBackgroundColor];
  id v12 = [v5 color];

  v6 = [v4 ikColor];

  v7 = [v6 color];

  if (v12 && v7)
  {
    [(SKUIStarBarView *)self setEmptyColor:v12];
LABEL_7:
    [(SKUIStarBarView *)self setFilledColor:v7];
    goto LABEL_8;
  }
  if (v7)
  {
    unint64_t v8 = SKUIColorSchemeStyleForColor(v7);
    if (v8 <= 3)
    {
      uint64_t v9 = [v7 colorWithAlphaComponent:dbl_1C1CCC240[v8]];
      [(SKUIStarBarView *)self setEmptyColor:v9];
    }
    goto LABEL_7;
  }
  v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
  [(SKUIStarBarView *)self setEmptyColor:v10];

  uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
  [(SKUIStarBarView *)self setFilledColor:v11];

LABEL_8:
}

- (void)setEmptyColor:(id)a3
{
  if (self->_emptyColor != a3)
  {
    id v4 = (UIColor *)[a3 copy];
    emptyColor = self->_emptyColor;
    self->_emptyColor = v4;

    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = 0;

    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = 0;

    [(SKUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)setFilledColor:(id)a3
{
  if (self->_filledColor != a3)
  {
    id v4 = (UIColor *)[a3 copy];
    filledColor = self->_filledColor;
    self->_filledColor = v4;

    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = 0;

    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = 0;

    [(SKUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfStars:(int64_t)a3
{
  if (self->_numberOfStars != a3)
  {
    self->_numberOfStars = a3;
    [(SKUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    [(SKUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(SKUIStarBarView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  emptyColor = self->_emptyColor;
  if (emptyColor)
  {
    objc_super v14 = emptyColor;
  }
  else
  {
    objc_super v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.05];
  }
  v48 = v14;
  filledColor = self->_filledColor;
  if (filledColor)
  {
    v16 = filledColor;
  }
  else
  {
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.517647059 alpha:1.0];
  }
  v17 = v16;
  if (!self->_emptyStarImage)
  {
    v18 = (void *)MEMORY[0x1E4FB1818];
    v19 = SKUIBundle();
    v20 = [v18 imageNamed:@"SmallStarFull" inBundle:v19];

    v21 = [v20 _flatImageWithColor:v48];
    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = v21;

    v23 = [v20 _flatImageWithColor:v17];
    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = v23;
  }
  double v25 = 0.0;
  if (ShouldReverseLayoutDirection)
  {
    v50.origin.double x = v5;
    v50.origin.double y = v7;
    v50.size.double width = v9;
    v50.size.double height = v11;
    double Width = CGRectGetWidth(v50);
    [(UIImage *)self->_emptyStarImage size];
    double v25 = Width - v27;
  }
  uint64_t v28 = -5;
  do
  {
    v29 = self->_emptyStarImage;
    if (v28 + 6 > 5 - self->_numberOfStars)
    {
      v30 = self->_filledStarImage;

      v29 = v30;
    }
    [(UIImage *)v29 size];
    double v32 = v31;
    *(float *)&double v31 = (v11 - v33) * 0.5;
    -[UIImage drawAtPoint:](v29, "drawAtPoint:", v25, floorf(*(float *)&v31));
    if (__CFADD__(v28++, 1)) {
      double v35 = 0.0;
    }
    else {
      double v35 = v32;
    }
    double v36 = -v35;
    if (!ShouldReverseLayoutDirection) {
      double v36 = v32;
    }
    double v25 = v25 + v36;
  }
  while (v28);
  double v37 = 0.0;
  if (ShouldReverseLayoutDirection)
  {
    double v38 = v25 + -9.0;
  }
  else
  {
    double v37 = v25 + 9.0;
    double v38 = v9 - (v25 + 9.0);
  }
  float v39 = (v11 + -2.0) * 0.5;
  double v40 = floorf(v39);
  v41 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v37, v40, v38, 2.0, 2.0);
  [(UIColor *)v48 set];
  [v41 fill];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double value = self->_value;
  double v44 = v25 + -9.0 - (v25 + -9.0) * value;
  if (!ShouldReverseLayoutDirection) {
    double v44 = v25 + 9.0;
  }
  double v45 = v38 * value;
  double v46 = 2.0;
  double v47 = v40;
  CGContextClipToRect(CurrentContext, *(CGRect *)&v44);
  [(UIColor *)v17 set];
  [v41 fill];
  CGContextRestoreGState(CurrentContext);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 14.0;
  result.double height = v3;
  return result;
}

- (UIColor)emptyColor
{
  return self->_emptyColor;
}

- (int64_t)numberOfStars
{
  return self->_numberOfStars;
}

- (double)value
{
  return self->_value;
}

- (UIColor)filledColor
{
  return self->_filledColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledStarImage, 0);
  objc_storeStrong((id *)&self->_filledColor, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);

  objc_storeStrong((id *)&self->_emptyColor, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStarBarView initWithFrame:]";
}

@end