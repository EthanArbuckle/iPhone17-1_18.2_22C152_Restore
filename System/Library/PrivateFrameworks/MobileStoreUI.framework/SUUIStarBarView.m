@interface SUUIStarBarView
- (CGSize)sizeThatFits:(CGSize)result;
- (SUUIStarBarView)initWithFrame:(CGRect)a3;
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

@implementation SUUIStarBarView

- (SUUIStarBarView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIStarBarView;
  v3 = -[SUUIStarBarView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.05];
    emptyColor = v3->_emptyColor;
    v3->_emptyColor = (UIColor *)v4;

    uint64_t v6 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
    filledColor = v3->_filledColor;
    v3->_filledColor = (UIColor *)v6;

    [(SUUIStarBarView *)v3 setContentMode:3];
  }
  return v3;
}

- (void)setColoringUsingStyle:(id)a3
{
  id v4 = a3;
  v5 = [v4 ikBackgroundColor];
  id v12 = [v5 color];

  uint64_t v6 = [v4 ikColor];

  v7 = [v6 color];

  if (v12 && v7)
  {
    [(SUUIStarBarView *)self setEmptyColor:v12];
LABEL_7:
    [(SUUIStarBarView *)self setFilledColor:v7];
    goto LABEL_8;
  }
  if (v7)
  {
    unint64_t v8 = SUUIColorSchemeStyleForColor(v7);
    if (v8 <= 3)
    {
      objc_super v9 = [v7 colorWithAlphaComponent:dbl_2568A1938[v8]];
      [(SUUIStarBarView *)self setEmptyColor:v9];
    }
    goto LABEL_7;
  }
  v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.05];
  [(SUUIStarBarView *)self setEmptyColor:v10];

  v11 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
  [(SUUIStarBarView *)self setFilledColor:v11];

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

    [(SUUIStarBarView *)self setNeedsDisplay];
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

    [(SUUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfStars:(int64_t)a3
{
  if (self->_numberOfStars != a3)
  {
    self->_numberOfStars = a3;
    [(SUUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    [(SUUIStarBarView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(SUUIStarBarView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  emptyColor = self->_emptyColor;
  if (emptyColor)
  {
    v14 = emptyColor;
  }
  else
  {
    v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.05];
  }
  v48 = v14;
  filledColor = self->_filledColor;
  if (filledColor)
  {
    v16 = filledColor;
  }
  else
  {
    v16 = [MEMORY[0x263F825C8] colorWithWhite:0.517647059 alpha:1.0];
  }
  v17 = v16;
  if (!self->_emptyStarImage)
  {
    v18 = (void *)MEMORY[0x263F827E8];
    v19 = SUUIBundle();
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
    v50.origin.x = v5;
    v50.origin.y = v7;
    v50.size.width = v9;
    v50.size.height = v11;
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
  v41 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v37, v40, v38, 2.0, 2.0);
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
  result.height = v3;
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

@end