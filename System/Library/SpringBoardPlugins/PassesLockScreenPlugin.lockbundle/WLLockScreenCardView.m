@interface WLLockScreenCardView
- (BOOL)modallyPresented;
- (PKPass)pass;
- (PKPassView)passView;
- (WLLockScreenCardView)initWithFrame:(CGRect)a3;
- (unint64_t)index;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDiff:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setModallyPresented:(BOOL)a3;
- (void)setPass:(id)a3;
@end

@implementation WLLockScreenCardView

- (WLLockScreenCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WLLockScreenCardView;
  v3 = -[WLLockScreenCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(WLLockScreenCardView *)v3 setClipsToBounds:0];
  }
  return v4;
}

- (void)dealloc
{
  [(PKPassView *)self->_passView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WLLockScreenCardView;
  [(WLLockScreenCardView *)&v3 dealloc];
}

- (void)prepareForReuse
{
  [(WLLockScreenCardView *)self setPass:0];

  [(WLLockScreenCardView *)self setModallyPresented:0];
}

- (void)setPass:(id)a3
{
  id v10 = a3;
  passView = self->_passView;
  if (passView)
  {
    id v6 = [(PKPassView *)passView pass];

    if (v6 != v10)
    {
      [(PKPassView *)self->_passView setModallyPresented:0];
      [(PKPassView *)self->_passView removeFromSuperview];
      [(PKPassView *)self->_passView invalidate];
      v7 = self->_passView;
      self->_passView = 0;
    }
  }
  objc_storeStrong((id *)&self->_pass, a3);
  if (!self->_passView && self->_pass)
  {
    v8 = (PKPassView *)[objc_alloc((Class)PKPassView) initWithPass:v10 content:5 suppressedContent:275];
    v9 = self->_passView;
    self->_passView = v8;

    [(PKPassView *)self->_passView setContentMode:5];
    [(PKPassView *)self->_passView setModallyPresented:self->_modallyPresented];
    [(WLLockScreenCardView *)self addSubview:self->_passView];
  }
}

- (void)setDiff:(id)a3
{
}

- (void)layoutSubviews
{
  [(PKPassView *)self->_passView frame];
  [(WLLockScreenCardView *)self bounds];
  UIRectCenteredIntegralRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKPassView *)self->_passView pass];
  int v12 = PKValueAddedServicesEnabledForPass();

  passView = self->_passView;
  if (v12) {
    double v14 = 0.0;
  }
  else {
    double v14 = v6;
  }

  -[PKPassView setFrame:](passView, "setFrame:", v4, v14, v8, v10);
}

- (PKPassView)passView
{
  return self->_passView;
}

- (void)setModallyPresented:(BOOL)a3
{
  if (self->_modallyPresented != a3)
  {
    self->_modallyPresented = a3;
    -[PKPassView setModallyPresented:](self->_passView, "setModallyPresented:");
  }
}

- (PKPass)pass
{
  return self->_pass;
}

- (BOOL)modallyPresented
{
  return self->_modallyPresented;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end