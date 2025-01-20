@interface PKPaymentSetupFieldFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupFieldFooterViewDelegate)delegate;
- (PKPaymentSetupFieldLabel)field;
- (void)_buttonTapped;
- (void)_updateDisplayForFieldTypeLabel;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setField:(id)a3;
@end

@implementation PKPaymentSetupFieldFooterView

- (void)setField:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_field, a3);
    [(PKPaymentSetupFieldFooterView *)self _updateDisplayForFieldTypeLabel];
  }
}

- (void)_updateDisplayForFieldTypeLabel
{
  v3 = [(PKPaymentSetupFieldFooterView *)self textLabel];
  id v4 = (id)*MEMORY[0x1E4FB28F0];
  if ([(PKPaymentSetupFieldLabel *)self->_field isFieldTypeFooter])
  {
    id v5 = [(PKPaymentSetupFieldLabel *)self->_field footerFieldObject];
    uint64_t v6 = [v5 fontScale];

    if (v6 == 1)
    {
      id v7 = (id)*MEMORY[0x1E4FB2950];

      id v4 = v7;
    }
  }
  v8 = (NSString *)*MEMORY[0x1E4FB2778];
  v9 = PKFontForDefaultDesign((NSString *)v4, (NSString *)*MEMORY[0x1E4FB2778]);
  [v3 setFont:v9];

  v10 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v3 setTextColor:v10];

  [v3 setNumberOfLines:0];
  v11 = [(PKPaymentSetupFieldLabel *)self->_field title];
  v12 = PKFontForDefaultDesign((NSString *)v4, v8);
  v13 = PKAttributedStringByParsingEmphasisInString(v11, v12, 0);

  [v3 setAttributedText:v13];
  uint64_t v14 = [(PKPaymentSetupFieldLabel *)self->_field alingment];
  if (v14 == 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    if (v14 != 2) {
      goto LABEL_9;
    }
    uint64_t v15 = 1;
  }
  [v3 setTextAlignment:v15];
LABEL_9:
  v16 = [(PKPaymentSetupFieldLabel *)self->_field buttonTitle];
  uint64_t v17 = [v16 length];
  button = self->_button;
  if (v17)
  {
    if (!button)
    {
      v19 = (void *)MEMORY[0x1E4FB14D8];
      v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
      v21 = objc_msgSend(v19, "pkui_plainConfigurationWithTitle:font:", v16, v20);

      objc_initWeak(&location, self);
      v22 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke;
      v30 = &unk_1E59CBEE0;
      objc_copyWeak(&v31, &location);
      v23 = [v22 actionWithHandler:&v27];
      objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v21, v23, v27, v28, v29, v30);
      v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v25 = self->_button;
      self->_button = v24;

      [(UIButton *)self->_button setConfigurationUpdateHandler:&__block_literal_global_187];
      [(PKPaymentSetupFieldFooterView *)self addSubview:self->_button];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(UIButton *)button removeFromSuperview];
    v26 = self->_button;
    self->_button = 0;
  }
  [(PKPaymentSetupFieldFooterView *)self setNeedsLayout];
}

void __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _buttonTapped];
}

void __64__PKPaymentSetupFieldFooterView__updateDisplayForFieldTypeLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];

  [v3 setTextAlignment:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  PKFloatCeilToPixel();
  double v7 = v6;
  double v8 = width + PKTableViewCellTextInset() * -2.0;
  v9 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v9 layoutMargins];
  v10 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v10 layoutMargins];

  v11 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v11 layoutMargins];
  double v13 = v12;
  uint64_t v14 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v14 layoutMargins];
  double v16 = height - (v13 + v15);

  uint64_t v17 = [(PKPaymentSetupFieldFooterView *)self textLabel];
  objc_msgSend(v17, "pkui_sizeThatFits:forceWordWrap:", 1, v8, v16);

  PKFloatCeilToPixel();
  double v19 = v18 + 10.0 + 12.0;
  button = self->_button;
  if (button)
  {
    double v21 = v19 + 25.0;
    -[UIButton sizeThatFits:](button, "sizeThatFits:", v8, 1.79769313e308);
    PKFloatCeilToPixel();
    double v19 = v21 + v22;
  }
  double v23 = v7;
  result.double height = v19;
  result.double width = v23;
  return result;
}

- (void)layoutSubviews
{
  *(void *)&recta.size.double width = self;
  *(void *)&recta.size.double height = PKPaymentSetupFieldFooterView;
  [(CGSize *)(objc_super *)&recta.size layoutSubviews];
  id v3 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v3 frame];
  CGFloat v5 = v4;
  recta.origin.x = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(PKPaymentSetupFieldFooterView *)self bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.double width = v9;
  v39.size.double height = v11;
  double MinX = CGRectGetMinX(v39);
  v40.origin.x = v13;
  v40.origin.y = v15;
  v40.size.double width = v17;
  v40.size.double height = v19;
  recta.origin.y = MinX - CGRectGetMinX(v40);
  v41.origin.x = v13;
  v41.origin.y = v15;
  v41.size.double width = v17;
  v41.size.double height = v19;
  double MaxX = CGRectGetMaxX(v41);
  v42.origin.x = recta.origin.x;
  v42.origin.y = v7;
  v42.size.double width = v9;
  v42.size.double height = v11;
  double v22 = MaxX - CGRectGetMaxX(v42);
  double v23 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v23 bounds];
  double v25 = v22 + recta.origin.y + v24 + PKTableViewCellTextInset() * -2.0;

  double v26 = PKTableViewCellTextInset();
  uint64_t v27 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v27 frame];
  double v29 = v26 - v28;

  v30 = [(PKPaymentSetupFieldFooterView *)self textLabel];
  [v30 frame];
  id v31 = [(PKPaymentSetupFieldFooterView *)self contentView];
  [v31 bounds];
  objc_msgSend(v30, "pkui_sizeThatFits:forceWordWrap:", 1, v25, CGRectGetHeight(v43) + 10.0 + 12.0);

  PKFloatCeilToPixel();
  CGFloat v33 = v32;
  objc_msgSend(v30, "setFrame:", v29, 10.0, v25, v32);
  button = self->_button;
  if (button)
  {
    [(UIButton *)button frame];
    double v35 = PKTableViewCellTextInset();
    v44.origin.y = 10.0;
    v44.origin.x = v29;
    v44.size.double width = v25;
    v44.size.double height = v33;
    CGFloat v36 = CGRectGetMaxY(v44) + 12.0 + 25.0;
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v25, 1.79769313e308);
    PKFloatCeilToPixel();
    -[UIButton setFrame:](self->_button, "setFrame:", v35, v36, v25, v37);
  }
}

- (void)_buttonTapped
{
  id v3 = [(PKPaymentSetupFieldFooterView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 fieldFooterViewDidTapButton:self->_field];
  }
}

- (PKPaymentSetupFieldLabel)field
{
  return self->_field;
}

- (PKPaymentSetupFieldFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupFieldFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_field, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end