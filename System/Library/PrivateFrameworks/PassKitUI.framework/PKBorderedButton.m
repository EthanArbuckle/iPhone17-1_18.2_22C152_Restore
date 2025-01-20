@interface PKBorderedButton
+ (id)borderedButtonWithConfiguration:(id)a3 primaryAction:(id)a4;
- (void)_updateForConfigurationChange;
- (void)layoutSubviews;
- (void)setBorderConfiguration:(id)a3;
@end

@implementation PKBorderedButton

+ (id)borderedButtonWithConfiguration:(id)a3 primaryAction:(id)a4
{
  v4 = [a1 buttonWithConfiguration:a3 primaryAction:a4];
  [v4 _updateForConfigurationChange];

  return v4;
}

- (void)setBorderConfiguration:(id)a3
{
  [(PKBorderedButton *)self setConfiguration:a3];

  [(PKBorderedButton *)self _updateForConfigurationChange];
}

- (void)_updateForConfigurationChange
{
  v3 = [(PKBorderedButton *)self borderConfiguration];
  if (v3)
  {
    id v22 = v3;
    char v4 = [v3 border];
    v5 = [v22 borderColor];
    topBorder = self->_topBorder;
    if (v4)
    {
      if (!topBorder)
      {
        v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v9 = self->_topBorder;
        self->_topBorder = v8;

        [(UIView *)self->_topBorder setBackgroundColor:v5];
        [(PKBorderedButton *)self addSubview:self->_topBorder];
      }
    }
    else
    {
      [(UIView *)topBorder removeFromSuperview];
      v7 = self->_topBorder;
      self->_topBorder = 0;
    }
    bottomBorder = self->_bottomBorder;
    if ((v4 & 2) != 0)
    {
      if (!bottomBorder)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v13 = self->_bottomBorder;
        self->_bottomBorder = v12;

        [(UIView *)self->_bottomBorder setBackgroundColor:v5];
        [(PKBorderedButton *)self addSubview:self->_bottomBorder];
      }
    }
    else
    {
      [(UIView *)bottomBorder removeFromSuperview];
      v11 = self->_bottomBorder;
      self->_bottomBorder = 0;
    }
    trailingBorder = self->_trailingBorder;
    if ((v4 & 4) != 0)
    {
      if (!trailingBorder)
      {
        v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v17 = self->_trailingBorder;
        self->_trailingBorder = v16;

        [(UIView *)self->_trailingBorder setBackgroundColor:v5];
        [(PKBorderedButton *)self addSubview:self->_trailingBorder];
      }
    }
    else
    {
      [(UIView *)trailingBorder removeFromSuperview];
      v15 = self->_trailingBorder;
      self->_trailingBorder = 0;
    }
    leadingBorder = self->_leadingBorder;
    if ((v4 & 8) != 0)
    {
      if (!leadingBorder)
      {
        v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v21 = self->_leadingBorder;
        self->_leadingBorder = v20;

        [(UIView *)self->_leadingBorder setBackgroundColor:v5];
        [(PKBorderedButton *)self addSubview:self->_leadingBorder];
      }
    }
    else
    {
      [(UIView *)leadingBorder removeFromSuperview];
      v19 = self->_leadingBorder;
      self->_leadingBorder = 0;
    }
    v3 = v22;
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKBorderedButton;
  [(PKBorderedButton *)&v10 layoutSubviews];
  [(PKBorderedButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PKBorderedButton *)self borderConfiguration];
  [v7 borderWidth];
  double v9 = v8;

  -[UIView setFrame:](self->_topBorder, "setFrame:", 0.0, 0.0, v4, v9);
  -[UIView setFrame:](self->_bottomBorder, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_trailingBorder, "setFrame:", v4 - v9, 0.0, v9, v6);
  -[UIView setFrame:](self->_leadingBorder, "setFrame:", 0.0, 0.0, v9, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingBorder, 0);
  objc_storeStrong((id *)&self->_trailingBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);

  objc_storeStrong((id *)&self->_topBorder, 0);
}

@end