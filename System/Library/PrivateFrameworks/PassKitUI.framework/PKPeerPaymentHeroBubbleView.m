@interface PKPeerPaymentHeroBubbleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentHeroBubbleView)initWithCurrencyAmount:(id)a3 regitrationFlowState:(unint64_t)a4;
- (UILabel)bubbleAmountLabel;
- (UIView)pluginBalloonView;
- (id)_bubbleAmountLabelTextAttributes;
- (id)_bubbleAmountLabelTextWithAmount:(id)a3;
- (unint64_t)_bubbleStateForRegistrationState:(unint64_t)a3;
- (void)layoutSubviews;
@end

@implementation PKPeerPaymentHeroBubbleView

- (PKPeerPaymentHeroBubbleView)initWithCurrencyAmount:(id)a3 regitrationFlowState:(unint64_t)a4
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKPeerPaymentHeroBubbleView;
  v7 = [(PKPeerPaymentHeroBubbleView *)&v38 init];
  v8 = v7;
  if (v7)
  {
    v7->_unint64_t bubbleState = [(PKPeerPaymentHeroBubbleView *)v7 _bubbleStateForRegistrationState:a4];
    v9 = [PKPeerPaymentBubbleView alloc];
    unint64_t bubbleState = v8->_bubbleState;
    if (a4 == 2)
    {
      uint64_t v11 = [(PKPeerPaymentBubbleView *)v9 initWithCurrencyAmount:0 state:bubbleState];
      peerPaymentBubbleView = v8->_peerPaymentBubbleView;
      v8->_peerPaymentBubbleView = (PKPeerPaymentBubbleView *)v11;

      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      bubbleAmountLabel = v8->_bubbleAmountLabel;
      v8->_bubbleAmountLabel = v13;

      v15 = v8->_bubbleAmountLabel;
      v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
      [(UILabel *)v15 setFont:v16];

      v17 = v8->_bubbleAmountLabel;
      v18 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)v17 setTextColor:v18];

      [(UILabel *)v8->_bubbleAmountLabel setTextAlignment:1];
      [(UILabel *)v8->_bubbleAmountLabel setNumberOfLines:1];
      [(UILabel *)v8->_bubbleAmountLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)v8->_bubbleAmountLabel setMinimumScaleFactor:0.5];
      [(UILabel *)v8->_bubbleAmountLabel setBaselineAdjustment:1];
      v19 = [(PKPeerPaymentHeroBubbleView *)v8 _bubbleAmountLabelTextWithAmount:v6];
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      v21 = [(PKPeerPaymentHeroBubbleView *)v8 _bubbleAmountLabelTextAttributes];
      v22 = (void *)[v20 initWithString:v19 attributes:v21];

      [(UILabel *)v8->_bubbleAmountLabel setAttributedText:v22];
      [(UILabel *)v8->_bubbleAmountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
      [(PKPeerPaymentHeroBubbleView *)v8 addSubview:v8->_bubbleAmountLabel];
    }
    else
    {
      uint64_t v23 = [(PKPeerPaymentBubbleView *)v9 initWithCurrencyAmount:v6 state:bubbleState];
      v19 = v8->_peerPaymentBubbleView;
      v8->_peerPaymentBubbleView = (PKPeerPaymentBubbleView *)v23;
    }

    [(PKPeerPaymentBubbleView *)v8->_peerPaymentBubbleView setDisplaysApplePayLogo:1];
    [(PKPeerPaymentBubbleView *)v8->_peerPaymentBubbleView setLiveRenderingEnabled:0];
    id v24 = objc_alloc_init(_MergedGlobals_3_14());
    [v24 setCanUseOpaqueMask:0];
    [v24 setOrientation:1];
    [v24 setHasTail:1];
    unint64_t v25 = a4 - 3;
    [v24 setOrientation:a4 - 3 < 0xFFFFFFFFFFFFFFFELL];
    double v26 = *MEMORY[0x1E4FB2848];
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    objc_msgSend(v24, "setTextAlignmentInsets:", *MEMORY[0x1E4FB2848], v27, v28, v29);
    [v24 setPluginView:v8->_peerPaymentBubbleView];
    [v24 sizeToFit];
    [v24 prepareForDisplay];
    objc_storeStrong((id *)&v8->_pluginBalloonView, v24);
    [(PKPeerPaymentHeroBubbleView *)v8 addSubview:v8->_pluginBalloonView];
    v30 = [(objc_class *)off_1EC34A0B0() sharedBehaviors];
    v31 = v30;
    v32 = v8->_peerPaymentBubbleView;
    if (v30)
    {
      [v30 pluginBalloonInsetsForMessageFromMe:v25 < 0xFFFFFFFFFFFFFFFELL];
      double v26 = v33;
      double v27 = v34;
      double v28 = v35;
      double v29 = v36;
    }
    -[PKPeerPaymentBubbleView setContentInset:](v32, "setContentInset:", v26, v27, v28, v29);
    if (v8->_bubbleAmountLabel) {
      -[PKPeerPaymentHeroBubbleView bringSubviewToFront:](v8, "bringSubviewToFront:");
    }
  }
  return v8;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)PKPeerPaymentHeroBubbleView;
  [(PKPeerPaymentHeroBubbleView *)&v48 layoutSubviews];
  [(PKPeerPaymentHeroBubbleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  pluginBalloonView = self->_pluginBalloonView;
  if (pluginBalloonView)
  {
    [(UIView *)pluginBalloonView frame];
    UIRectCenteredIntegralRect();
    -[UIView setFrame:](self->_pluginBalloonView, "setFrame:");
  }
  if (self->_bubbleAmountLabel)
  {
    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView contentInset];
    double v13 = v12;
    double v15 = v14;
    double v17 = v14 + v16;
    double v18 = v8 - (v14 + v16);
    double v20 = v12 + v19;
    double v21 = v10 - (v12 + v19);
    CGFloat v22 = v4 + v14 + 14.0;
    CGFloat v23 = v6 + v12 + 12.0;
    CGFloat v24 = v18 + -28.0;
    CGFloat v25 = v21 + -24.0;
    [(PKPeerPaymentBubbleView *)self->_peerPaymentBubbleView referenceBounds];
    CGFloat v45 = v13 + v27 + 12.0;
    CGFloat v46 = v15 + v26 + 14.0;
    CGFloat v30 = v28 - v17 + -28.0;
    CGFloat v31 = v29 - v20 + -24.0;
    -[UILabel pkui_sizeThatFits:](self->_bubbleAmountLabel, "pkui_sizeThatFits:", v24, v25);
    double v33 = v32;
    double v47 = v34;
    v49.origin.x = v22;
    v49.origin.y = v23;
    v49.size.width = v24;
    v49.size.height = v25;
    double MinX = CGRectGetMinX(v49);
    v50.origin.x = v22;
    v50.origin.y = v23;
    v50.size.width = v24;
    v50.size.height = v25;
    double v36 = MinX + (CGRectGetWidth(v50) - v33) * 0.5 + -1.0;
    v51.origin.x = v46;
    v51.origin.y = v45;
    v51.size.width = v30;
    v51.size.height = v31;
    double MinY = CGRectGetMinY(v51);
    v52.origin.x = v46;
    v52.origin.y = v45;
    v52.size.width = v30;
    v52.size.height = v31;
    CGFloat Height = CGRectGetHeight(v52);
    v39.n128_f64[0] = v47;
    v40.n128_f64[0] = MinY + (Height - v47) * 0.5;
    bubbleAmountLabel = self->_bubbleAmountLabel;
    v42.n128_f64[0] = v36;
    v43.n128_f64[0] = v33;
    PKRectRoundToPixel(v42, v40, v43, v39, v44);
    -[UILabel setFrame:](bubbleAmountLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 160.0;
  double v4 = 115.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_bubbleAmountLabelTextWithAmount:(id)a3
{
  if (a3)
  {
    double v3 = (objc_class *)MEMORY[0x1E4F1CA20];
    id v4 = a3;
    double v5 = (void *)[[v3 alloc] initWithLocaleIdentifier:@"en_US"];
    double v6 = [v4 minimalFormattedStringValueInLocale:v5];
  }
  else
  {
    double v6 = &stru_1EF1B5B50;
  }

  return v6;
}

- (id)_bubbleAmountLabelTextAttributes
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  id v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  double v5 = (void *)[v2 copy];

  return v5;
}

- (unint64_t)_bubbleStateForRegistrationState:(unint64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  else {
    return 2;
  }
}

- (UILabel)bubbleAmountLabel
{
  return self->_bubbleAmountLabel;
}

- (UIView)pluginBalloonView
{
  return self->_pluginBalloonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleAmountLabel, 0);
  objc_storeStrong((id *)&self->_peerPaymentBubbleView, 0);

  objc_storeStrong((id *)&self->_pluginBalloonView, 0);
}

@end