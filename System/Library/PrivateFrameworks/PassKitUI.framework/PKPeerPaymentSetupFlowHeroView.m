@interface PKPeerPaymentSetupFlowHeroView
- (BOOL)_bubbleIsOnLeftSide;
- (BOOL)_shouldShowBubbleView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentSetupFlowHeroView)initWithPeerPaymentPassSnapShot:(id)a3 peerPaymentCredential:(id)a4;
- (id)_defaultCurrencyAmount;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateImageViewDynamicColors;
- (void)layoutSubviews;
- (void)startAnimation;
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentSetupFlowHeroView

- (PKPeerPaymentSetupFlowHeroView)initWithPeerPaymentPassSnapShot:(id)a3 peerPaymentCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  v8 = [(PKPeerPaymentSetupFlowHeroView *)&v22 init];
  v9 = v8;
  if (v8)
  {
    p_credential = (id *)&v8->_credential;
    objc_storeStrong((id *)&v8->_credential, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    passSnapshotView = v9->_passSnapshotView;
    v9->_passSnapshotView = (UIImageView *)v11;

    [(UIImageView *)v9->_passSnapshotView setContentMode:1];
    [(UIImageView *)v9->_passSnapshotView setAccessibilityIgnoresInvertColors:1];
    [(PKPeerPaymentSetupFlowHeroView *)v9 addSubview:v9->_passSnapshotView];
    v13 = [(UIImageView *)v9->_passSnapshotView layer];
    [v13 setShouldRasterize:1];
    [v13 setRasterizationScale:PKUIScreenScale()];
    id v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.25 alpha:1.0];
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    LODWORD(v15) = 1041865114;
    [v13 setShadowOpacity:v15];
    objc_msgSend(v13, "setShadowOffset:", 0.0, 4.0);
    [v13 setShadowRadius:4.0];
    [(PKPeerPaymentSetupFlowHeroView *)v9 _updateImageViewDynamicColors];
    if ([(PKPeerPaymentSetupFlowHeroView *)v9 _shouldShowBubbleView])
    {
      v16 = [*p_credential amount];
      if (!v16)
      {
        v16 = [(PKPeerPaymentSetupFlowHeroView *)v9 _defaultCurrencyAmount];
      }
      v17 = -[PKPeerPaymentHeroBubbleView initWithCurrencyAmount:regitrationFlowState:]([PKPeerPaymentHeroBubbleView alloc], "initWithCurrencyAmount:regitrationFlowState:", v16, [*p_credential flowState]);
      bubbleView = v9->_bubbleView;
      v9->_bubbleView = v17;

      [(PKPeerPaymentHeroBubbleView *)v9->_bubbleView sizeToFit];
      [(PKPeerPaymentSetupFlowHeroView *)v9 addSubview:v9->_bubbleView];
    }
    v9->_animationState = [*p_credential flowState] == 2;
    v19 = [(PKPeerPaymentHeroBubbleView *)v9->_bubbleView layer];
    objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);

    v20 = [(UIImageView *)v9->_passSnapshotView layer];
    objc_msgSend(v20, "setAnchorPoint:", 0.0, 0.0);
  }
  return v9;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  [(PKPeerPaymentSetupFlowHeroView *)&v34 layoutSubviews];
  [(PKPeerPaymentSetupFlowHeroView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIImageView *)self->_passSnapshotView frame];
  [(PKPeerPaymentHeroBubbleView *)self->_bubbleView frame];
  CGFloat rect = v11;
  CGFloat rect_16 = v12;
  CGFloat rect_24 = v13;
  CGFloat v32 = v14;
  UIRectCenteredYInRect();
  double v17 = v16;
  CGFloat rect_8 = v15;
  double v33 = v18;
  if (self->_bubbleView)
  {
    if ([(PKPeerPaymentSetupFlowHeroView *)self _bubbleIsOnLeftSide])
    {
      double v19 = 0.0;
      double v20 = 15.0;
      double v22 = rect_24;
      double v21 = v32;
      CGFloat v23 = rect_16;
    }
    else
    {
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      double MaxX = CGRectGetMaxX(v35);
      v36.origin.x = rect;
      CGFloat v23 = rect_16;
      double v22 = rect_24;
      v36.origin.y = rect_16;
      double v21 = v32;
      v36.size.width = v32;
      v36.size.height = rect_24;
      double v19 = MaxX - CGRectGetWidth(v36);
      double v20 = 0.0;
    }
    v37.origin.x = 0.0;
    v37.origin.y = v17;
    double v25 = rect_8;
    v37.size.width = rect_8;
    v37.size.height = v33;
    double MaxY = CGRectGetMaxY(v37);
    v38.origin.x = v19;
    v38.origin.y = v23;
    v38.size.width = v21;
    v38.size.height = v22;
    double v24 = MaxY - CGRectGetHeight(v38);
    double v17 = v17 + -2.0;
  }
  else
  {
    double v20 = 0.0;
    double v22 = rect_24;
    double v21 = v32;
    double v25 = v15;
    double v24 = rect_16;
    double v19 = rect;
  }
  if (self->_animationState != 2)
  {
    -[PKPeerPaymentHeroBubbleView setFrame:](self->_bubbleView, "setFrame:", v19, v24, v21, v22);
    -[UIImageView setFrame:](self->_passSnapshotView, "setFrame:", v20, v17, v25, v33);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImageView *)self->_passSnapshotView frame];
  double v6 = v4 + 15.0;
  if (!self->_bubbleView) {
    double v6 = v4;
  }
  double v7 = v5 + 2.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  [(PKPeerPaymentSetupFlowHeroView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKPeerPaymentSetupFlowHeroView *)self _updateImageViewDynamicColors];
}

- (void)startAnimation
{
}

- (void)startAnimationWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(void))a3;
  int64_t animationState = self->_animationState;
  double v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (animationState == 1)
  {
    if (v7)
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Starting message bubble animation.", (uint8_t *)&buf, 2u);
    }

    [(UIImageView *)self->_passSnapshotView frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(PKPeerPaymentHeroBubbleView *)self->_bubbleView frame];
    CGRectGetWidth(v36);
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    CGRectGetMaxX(v37);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    CGRectGetMinY(v38);
    PKFloatRoundToPixel();
    CGFloat v17 = v16;
    PKFloatRoundToPixel();
    CGFloat v19 = v18;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, 0.25, 0.25);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeTranslation(&v33, v17, v19);
    CGAffineTransform t1 = buf;
    CGAffineTransform t2 = v33;
    memset(&v32, 0, sizeof(v32));
    CGAffineTransformConcat(&v32, &t1, &t2);
    PKFloatRoundToPixel();
    CGFloat v21 = v20;
    PKFloatRoundToPixel();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v21, v22);
    self->_int64_t animationState = 2;
    CGFloat v23 = (void *)MEMORY[0x1E4FB1EB0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    CGAffineTransform v28 = v32;
    v27[2] = __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke;
    v27[3] = &unk_1E59DBAA8;
    v27[4] = self;
    CGAffineTransform v29 = t1;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke_2;
    v25[3] = &unk_1E59CF408;
    v25[4] = self;
    v26 = v4;
    [v23 animateWithDuration:0x10000 delay:v27 usingSpringWithDamping:v25 initialSpringVelocity:0.7 options:0.0 animations:1.0 completion:1.0];
  }
  else
  {
    if (v7)
    {
      [(PKPeerPaymentCredential *)self->_credential flowState];
      double v24 = PKPeerPaymentRegistrationFlowStateToString();
      LODWORD(buf.a) = 138412290;
      *(void *)((char *)&buf.a + 4) = v24;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Cannot animate the message bubble when the registration flow state is %@", (uint8_t *)&buf, 0xCu);
    }
    if (v4) {
      v4[2](v4);
    }
  }
}

void __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 72);
  [v2 setAffineTransform:&v7];

  double v4 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 88);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 120);
  [v4 setAffineTransform:&v7];

  double v6 = [*(id *)(*(void *)(a1 + 32) + 416) pluginBalloonView];
  [v6 setAlpha:0.0];
}

uint64_t __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(*(void *)(result + 32) + 432) = 3;
    CGSize result = *(void *)(result + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_updateImageViewDynamicColors
{
  long long v3 = [(PKPeerPaymentSetupFlowHeroView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PKPeerPaymentSetupFlowHeroView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __63__PKPeerPaymentSetupFlowHeroView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (id)_defaultCurrencyAmount
{
  id v2 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"28"];
  long long v3 = PKCurrencyAmountCreate(v2, &cfstr_Usd.isa);

  return v3;
}

- (BOOL)_shouldShowBubbleView
{
  uint64_t v3 = [(PKPeerPaymentCredential *)self->_credential flowState];
  if ((unint64_t)(v3 - 3) < 3) {
    return 1;
  }
  if (v3 == 2) {
    return [(PKPeerPaymentCredential *)self->_credential paymentMode] != 2;
  }
  return 0;
}

- (BOOL)_bubbleIsOnLeftSide
{
  return (unint64_t)([(PKPeerPaymentCredential *)self->_credential flowState] - 6) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_bubbleView, 0);

  objc_storeStrong((id *)&self->_passSnapshotView, 0);
}

@end