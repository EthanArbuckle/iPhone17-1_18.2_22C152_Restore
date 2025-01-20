@interface PKPeerPaymentMessagesNumberPadView
+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3;
+ (double)buttonHorizontalPaddingForSizeCategory:(unint64_t)a3;
+ (double)buttonVerticalPaddingForSizeCategory:(unint64_t)a3;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentMessagesNumberPadView)initWithSizeCategory:(unint64_t)a3;
- (id)_buttonForAction:(unint64_t)a3;
- (id)actionHandler;
- (unint64_t)style;
- (void)_handleActionButton:(id)a3;
- (void)layoutSubviews;
- (void)setActionHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSizeCategory:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation PKPeerPaymentMessagesNumberPadView

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  objc_msgSend(a1, "buttonHorizontalPaddingForSizeCategory:");
  double v6 = v5;
  [a1 buttonVerticalPaddingForSizeCategory:a3];
  double v8 = v7;
  +[PKPeerPaymentNumberPadActionButton referenceSizeForSizeCategory:a3];
  double v10 = v6 + v6 + v9 * 3.0;
  double v12 = v8 * 3.0 + v11 * 4.0 + 16.0 + 16.0;
  result.height = v12;
  result.width = v10;
  return result;
}

+ (double)buttonVerticalPaddingForSizeCategory:(unint64_t)a3
{
  if (PKIsVision())
  {
    if (a3 - 1 < 3) {
      return dbl_1A04441C0[a3 - 1];
    }
  }
  else
  {
    char v5 = PKIsPad();
    if (a3 == 3 && (v5 & 1) != 0) {
      return 48.0;
    }
  }

  +[PKPeerPaymentNumberPadActionButton adjustSize:a3 forSizeCategory:12.0];
  return result;
}

+ (double)buttonHorizontalPaddingForSizeCategory:(unint64_t)a3
{
  char v4 = PKIsPad();
  if (a3 == 3 && (v4 & 1) != 0) {
    return 36.0;
  }

  +[PKPeerPaymentNumberPadActionButton adjustSize:a3 forSizeCategory:24.0];
  return result;
}

- (PKPeerPaymentMessagesNumberPadView)initWithSizeCategory:(unint64_t)a3
{
  +[PKPeerPaymentMessagesNumberPadView referenceSizeForSizeCategory:](PKPeerPaymentMessagesNumberPadView, "referenceSizeForSizeCategory:");
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentMessagesNumberPadView;
  double v11 = -[PKPeerPaymentMessagesNumberPadView initWithFrame:](&v22, sel_initWithFrame_, v9, v10, v6, v8);
  if (v11)
  {
    double v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPeerPaymentMessagesNumberPadView *)v11 setBackgroundColor:v12];

    uint64_t v13 = 1;
    [(PKPeerPaymentMessagesNumberPadView *)v11 setClipsToBounds:1];
    v11->_enabled = 1;
    v11->_sizeCategory = a3;
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    buttonContainerView = v11->_buttonContainerView;
    v11->_buttonContainerView = v14;

    [(PKPeerPaymentMessagesNumberPadView *)v11 addSubview:v11->_buttonContainerView];
    uint64_t v16 = 0;
    v17 = v11;
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v19 = [(PKPeerPaymentMessagesNumberPadView *)v11 _buttonForAction:v13 + i];
        v20 = v17->_buttons[0][i];
        v17->_buttons[0][i] = (PKPeerPaymentNumberPadActionButton *)v19;

        [(UIView *)v11->_buttonContainerView addSubview:v17->_buttons[0][i]];
      }
      ++v16;
      v17 = (PKPeerPaymentMessagesNumberPadView *)((char *)v17 + 24);
      v13 += 3;
    }
    while (v16 != 4);
  }
  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  char v4 = objc_opt_class();
  unint64_t sizeCategory = self->_sizeCategory;

  [v4 referenceSizeForSizeCategory:sizeCategory];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentMessagesNumberPadView;
  [(PKPeerPaymentMessagesNumberPadView *)&v21 layoutSubviews];
  [(id)objc_opt_class() buttonVerticalPaddingForSizeCategory:self->_sizeCategory];
  double v4 = v3;
  [(id)objc_opt_class() buttonHorizontalPaddingForSizeCategory:self->_sizeCategory];
  double v6 = v5;
  +[PKPeerPaymentNumberPadActionButton referenceSizeForSizeCategory:self->_sizeCategory];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = 0;
  buttons = self->_buttons;
  double v13 = v6 + v7;
  double v14 = v4 + v9;
  double v15 = 0.0;
  do
  {
    uint64_t v16 = 0;
    double v17 = v6;
    do
    {
      -[PKPeerPaymentNumberPadActionButton setFrame:]((*buttons)[v16], "setFrame:", v17, v15, v8, v10);
      double v17 = v13 + v17;
      ++v16;
    }
    while (v16 != 3);
    double v15 = v14 + v15;
    ++v11;
    ++buttons;
  }
  while (v11 != 4);
  [(PKPeerPaymentMessagesNumberPadView *)self bounds];
  CGRect remainder = v22;
  CGRectDivide(v22, &v19, &remainder, 16.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v19, &remainder, 16.0, CGRectMaxYEdge);
  buttonContainerView = self->_buttonContainerView;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](buttonContainerView, "setFrame:");
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    uint64_t v4 = 0;
    self->_unint64_t sizeCategory = a3;
    buttons = self->_buttons;
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
        [(PKPeerPaymentNumberPadActionButton *)(*buttons)[i] setSizeCategory:self->_sizeCategory];
      ++v4;
      ++buttons;
    }
    while (v4 != 4);
    [(PKPeerPaymentMessagesNumberPadView *)self setNeedsLayout];
  }
}

- (id)_buttonForAction:(unint64_t)a3
{
  double v5 = [[PKPeerPaymentNumberPadActionButton alloc] initWithSizeCategory:self->_sizeCategory];
  [(PKPeerPaymentNumberPadActionButton *)v5 addTarget:self action:sel__handleActionButton_ forControlEvents:64];
  [(PKPeerPaymentNumberPadActionButton *)v5 setAction:a3];
  double v6 = +[PKPeerPaymentTheme primaryTextColor];
  [(PKPeerPaymentNumberPadActionButton *)v5 setTitleColor:v6 forState:0];

  double v7 = +[PKPeerPaymentTheme disabledTextColor];
  [(PKPeerPaymentNumberPadActionButton *)v5 setTitleColor:v7 forState:2];

  return v5;
}

- (void)_handleActionButton:(id)a3
{
  id v4 = a3;
  actionHandler = (void (**)(id, PKPeerPaymentMessagesNumberPadView *, uint64_t))self->_actionHandler;
  if (actionHandler && self->_enabled)
  {
    id v6 = v4;
    actionHandler[2](actionHandler, self, [v4 action]);
    id v4 = v6;
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  for (uint64_t i = 11; i != -1; --i)
    objc_storeStrong((id *)&self->_buttons[0][i], 0);

  objc_storeStrong((id *)&self->_buttonContainerView, 0);
}

@end