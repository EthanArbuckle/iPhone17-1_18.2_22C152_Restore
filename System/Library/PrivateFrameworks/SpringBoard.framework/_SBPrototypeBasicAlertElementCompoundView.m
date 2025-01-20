@interface _SBPrototypeBasicAlertElementCompoundView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)leadingImage;
- (UIImage)trailingImage;
- (_SBPrototypeBasicAlertElementCompoundView)initWithFrame:(CGRect)a3;
- (unint64_t)layoutAxis;
- (void)layoutSubviews;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLeadingImage:(id)a3;
- (void)setTrailingImage:(id)a3;
@end

@implementation _SBPrototypeBasicAlertElementCompoundView

- (_SBPrototypeBasicAlertElementCompoundView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SBPrototypeBasicAlertElementCompoundView;
  result = -[_SBPrototypeBasicAlertElementCompoundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_layoutAxis = 1;
  }
  return result;
}

- (UIImage)leadingImage
{
  return [(UIImageView *)self->_leadingImageView image];
}

- (void)setLeadingImage:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(_SBPrototypeBasicAlertElementCompoundView *)self leadingImage];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v9;
    if (v9 && !self->_leadingImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
      leadingImageView = self->_leadingImageView;
      self->_leadingImageView = v7;

      [(_SBPrototypeBasicAlertElementCompoundView *)self addSubview:self->_leadingImageView];
      id v6 = v9;
    }
    [(UIImageView *)self->_leadingImageView setImage:v6];
    [(_SBPrototypeBasicAlertElementCompoundView *)self setNeedsLayout];
  }
}

- (UIImage)trailingImage
{
  return [(UIImageView *)self->_trailingImageView image];
}

- (void)setTrailingImage:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(_SBPrototypeBasicAlertElementCompoundView *)self trailingImage];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v9;
    if (v9 && !self->_trailingImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
      trailingImageView = self->_trailingImageView;
      self->_trailingImageView = v7;

      [(_SBPrototypeBasicAlertElementCompoundView *)self addSubview:self->_trailingImageView];
      id v6 = v9;
    }
    [(UIImageView *)self->_trailingImageView setImage:v6];
    [(_SBPrototypeBasicAlertElementCompoundView *)self setNeedsLayout];
  }
}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    [(_SBPrototypeBasicAlertElementCompoundView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_leadingImageView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  v10 = [(_SBPrototypeBasicAlertElementCompoundView *)self trailingImage];

  if (v10)
  {
    -[UIImageView sizeThatFits:](self->_trailingImageView, "sizeThatFits:", width, height);
    if (self->_layoutAxis == 2)
    {
      if (v7 < v11) {
        double v7 = v11;
      }
      double v9 = v9 + v12 + 4.0;
    }
    else
    {
      double v7 = v7 + v11 + 4.0;
      if (v9 < v12) {
        double v9 = v12;
      }
    }
  }
  double v13 = v7;
  double v14 = v9;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)_SBPrototypeBasicAlertElementCompoundView;
  [(_SBPrototypeBasicAlertElementCompoundView *)&v34 layoutSubviews];
  [(_SBPrototypeBasicAlertElementCompoundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_SBPrototypeBasicAlertElementCompoundView *)self traitCollection];
  [v7 displayScale];
  uint64_t v9 = v8;

  -[UIImageView sizeThatFits:](self->_leadingImageView, "sizeThatFits:", v4, v6);
  BSRectWithSize();
  UIRectRoundToScale();
  double x = v10;
  double y = v12;
  double width = v14;
  double height = v16;
  v18 = [(_SBPrototypeBasicAlertElementCompoundView *)self trailingImage];

  if (v18)
  {
    -[UIImageView sizeThatFits:](self->_trailingImageView, "sizeThatFits:", v4, v6);
    BSRectWithSize();
    CGFloat rect = v19;
    CGFloat rect_8 = v20;
    CGFloat v22 = v21;
    CGFloat rect_16 = v23;
    v24 = [(_SBPrototypeBasicAlertElementCompoundView *)self traitCollection];
    uint64_t v25 = [v24 layoutDirection];

    if (self->_layoutAxis == 2)
    {
      UIRectCenteredXInRectScale();
      double x = v35.origin.x;
      double y = v35.origin.y;
      double width = v35.size.width;
      double height = v35.size.height;
      CGRectGetMaxY(v35);
      UIRectCenteredXInRectScale();
      [(UIImageView *)self->_trailingImageView setFrame:v9];
    }
    else
    {
      UIRectCenteredYInRectScale();
      double x = v26;
      double y = v27;
      double width = v28;
      double v30 = v29;
      if (v25 == 1)
      {
        CGRectGetMinX(*(CGRect *)&v26);
        v36.origin.double x = rect;
        v36.origin.double y = v22;
        v36.size.double width = rect_8;
        v36.size.double height = rect_16;
        CGRectGetWidth(v36);
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v26);
      }
      UIRectCenteredYInRectScale();
      double height = v30;
      [(UIImageView *)self->_trailingImageView setFrame:v9];
    }
  }
  -[UIImageView setFrame:](self->_leadingImageView, "setFrame:", x, y, width, height);
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end