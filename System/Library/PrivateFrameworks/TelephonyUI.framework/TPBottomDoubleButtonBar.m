@interface TPBottomDoubleButtonBar
- (double)_buttonWidth;
- (id)button2;
- (void)_layoutButtons;
- (void)layoutSubviews;
- (void)setButton2:(id)a3 andStyle:(BOOL)a4;
- (void)setButton:(id)a3 andStyle:(BOOL)a4;
@end

@implementation TPBottomDoubleButtonBar

- (double)_buttonWidth
{
  unint64_t style = self->super.super._style;
  if (style < 2)
  {
    [(TPBottomDoubleButtonBar *)self bounds];
    float v5 = v4 * 0.5;
    return roundf(v5);
  }
  else if (style == 2)
  {
    return 128.0;
  }
  else
  {
    double result = 0.0;
    if (style == 3) {
      return 201.0;
    }
  }
  return result;
}

- (void)setButton:(id)a3 andStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (TPButton *)a3;
  button = self->super._button;
  v9 = v7;
  v10 = v7;
  if (button != v7)
  {
    [(TPButton *)button removeFromSuperview];
    objc_storeStrong((id *)&self->super._button, a3);
    v9 = self->super._button;
  }
  if (v9 && v4)
  {
    -[TPBottomDoubleButtonBar addSubview:](self, "addSubview:");
    [(TPBottomDoubleButtonBar *)self layoutSubviews];
  }
}

- (void)setButton2:(id)a3 andStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (TPButton *)a3;
  button2 = self->_button2;
  v9 = v7;
  v10 = v7;
  if (button2 != v7)
  {
    [(TPButton *)button2 removeFromSuperview];
    objc_storeStrong((id *)&self->_button2, a3);
    v9 = self->_button2;
  }
  if (v9 && v4)
  {
    -[TPBottomDoubleButtonBar addSubview:](self, "addSubview:");
    [(TPBottomDoubleButtonBar *)self layoutSubviews];
  }
}

- (id)button2
{
  return self->_button2;
}

- (void)_layoutButtons
{
  if (self->super._button)
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", -[TPButton buttonColor](self->super._button, "buttonColor"));
    double v4 = v3;
    [(TPBottomDoubleButtonBar *)self bounds];
    -[TPButton setFrame:](self->super._button, "setFrame:", 0.0, 0.0, v5 * 0.5, v4);
  }
  if (self->_button2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", -[TPButton buttonColor](self->_button2, "buttonColor"));
    double v7 = v6;
    [(TPBottomDoubleButtonBar *)self bounds];
    double v9 = v8 * 0.5;
    [(TPBottomDoubleButtonBar *)self bounds];
    button2 = self->_button2;
    double v12 = v11 * 0.5;
    -[TPButton setFrame:](button2, "setFrame:", v9, 0.0, v12, v7);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TPBottomDoubleButtonBar;
  [(TPBottomDoubleButtonBar *)&v3 layoutSubviews];
  [(TPBottomDoubleButtonBar *)self _layoutButtons];
}

- (void).cxx_destruct
{
}

@end