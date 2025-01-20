@interface CardCustomBorderView
- (CardCustomBorderView)initWithFrame:(CGRect)a3;
- (unint64_t)cardCustomBorder;
- (void)layoutSubviews;
- (void)setButtonCard:(BOOL)a3;
- (void)setCardCustomBorder:(unint64_t)a3;
@end

@implementation CardCustomBorderView

- (unint64_t)cardCustomBorder
{
  return self->_cardCustomBorder;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CardCustomBorderView;
  [(CardCustomBorderView *)&v3 layoutSubviews];
  [(CardCustomBorderView *)self bounds];
  -[CardShadowView setFrame:](self->_cardShadowView, "setFrame:");
}

- (void)setCardCustomBorder:(unint64_t)a3
{
  if (self->_cardCustomBorder != a3)
  {
    self->_cardCustomBorder = a3;
    [(CardShadowView *)self->_cardShadowView setShouldCropBottomEdge:a3 == 3];
    double v4 = 1.0;
    if (!self->_cardCustomBorder) {
      double v4 = 0.0;
    }
    [(CardShadowView *)self->_cardShadowView setAlpha:v4];
    [(CardCustomBorderView *)self setNeedsLayout];
  }
}

- (void)setButtonCard:(BOOL)a3
{
}

- (CardCustomBorderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CardCustomBorderView;
  objc_super v3 = -[CardCustomBorderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(CardCustomBorderView *)v3 setUserInteractionEnabled:0];
    v4->_cardCustomBorder = 0;
    v5 = -[CardShadowView initWithFrame:]([CardShadowView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(CardShadowView *)v5 setAlpha:0.0];
    [(CardCustomBorderView *)v4 addSubview:v5];
    cardShadowView = v4->_cardShadowView;
    v4->_cardShadowView = v5;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end