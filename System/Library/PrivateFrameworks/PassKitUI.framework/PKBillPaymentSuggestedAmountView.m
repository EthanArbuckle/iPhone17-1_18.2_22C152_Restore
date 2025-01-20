@interface PKBillPaymentSuggestedAmountView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKBillPaymentSuggestedAmount)suggestedAmount;
- (PKBillPaymentSuggestedAmountView)initWithSuggestedAmount:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation PKBillPaymentSuggestedAmountView

- (PKBillPaymentSuggestedAmountView)initWithSuggestedAmount:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKBillPaymentSuggestedAmountView;
  v6 = [(PKBillPaymentSuggestedAmountView *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestedAmount, a3);
    v8 = [(PKBillPaymentSuggestedAmountView *)v7 layer];
    [v8 setAllowsGroupOpacity:0];
    [v8 setAllowsGroupBlending:0];
    v9 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E4F39B40]);
    background = v7->_background;
    v7->_background = v9;

    [(CABackdropLayer *)v7->_background setAllowsInPlaceFiltering:1];
    v11 = v7->_background;
    v12 = PKLayerNullActions();
    [(CABackdropLayer *)v11 setActions:v12];

    [(CABackdropLayer *)v7->_background setAllowsGroupOpacity:0];
    [(CABackdropLayer *)v7->_background setMasksToBounds:1];
    [v8 addSublayer:v7->_background];
    v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.6 alpha:1.0];
    v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.05];
    v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A368]];
    id v16 = v13;
    objc_msgSend(v15, "setValue:forKey:", objc_msgSend(v16, "CGColor"), @"inputColor0");
    id v17 = v14;
    objc_msgSend(v15, "setValue:forKey:", objc_msgSend(v17, "CGColor"), @"inputColor1");
    [v15 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputReversed"];
    v18 = v7->_background;
    v22[0] = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(CABackdropLayer *)v18 setFilters:v19];
  }
  return v7;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKBillPaymentSuggestedAmountView;
  [(PKBillPaymentSuggestedAmountView *)&v9 layoutSubviews];
  [(PKBillPaymentSuggestedAmountView *)self bounds];
  if (v3 >= v4) {
    double v5 = v4;
  }
  else {
    double v5 = v3;
  }
  double v6 = v5 * 0.5;
  background = self->_background;
  PKSizeAlignedInRect();
  -[CABackdropLayer setFrame:](background, "setFrame:");
  [(CABackdropLayer *)self->_background cornerRadius];
  if (v8 != v6) {
    [(CABackdropLayer *)self->_background setCornerRadius:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 16.0;
  double v4 = 16.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (PKBillPaymentSuggestedAmount)suggestedAmount
{
  return self->_suggestedAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAmount, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end