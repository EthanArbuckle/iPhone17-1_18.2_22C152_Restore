@interface PKPassShareActivationShareActivationCodeView
- (BOOL)showPhoneCallButton;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)activationCode;
- (PKPassShareActivationShareActivationCodeView)init;
- (PKPassShareActivationShareActivationCodeView)initWithDelegate:(id)a3;
- (void)_copyActivationCode;
- (void)_copyButtonPressed;
- (void)_phoneButtonPressed;
- (void)_shareButtonPressed;
- (void)_showCopyMenu;
- (void)layoutSubviews;
- (void)setActivationCode:(id)a3;
- (void)setShowPhoneCallButton:(BOOL)a3;
@end

@implementation PKPassShareActivationShareActivationCodeView

- (PKPassShareActivationShareActivationCodeView)init
{
  return 0;
}

- (PKPassShareActivationShareActivationCodeView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPassShareActivationShareActivationCodeView;
  v5 = [(PKPassShareActivationShareActivationCodeView *)&v32 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_showPhoneCallButton = 1;
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    activationCodeBackgroundView = v6->_activationCodeBackgroundView;
    v6->_activationCodeBackgroundView = v7;

    v9 = v6->_activationCodeBackgroundView;
    v10 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(UIView *)v6->_activationCodeBackgroundView _setContinuousCornerRadius:10.0];
    [(PKPassShareActivationShareActivationCodeView *)v6 addSubview:v6->_activationCodeBackgroundView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    activationCodeLabel = v6->_activationCodeLabel;
    v6->_activationCodeLabel = v11;

    [(UILabel *)v6->_activationCodeLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v6->_activationCodeLabel setTextAlignment:1];
    v13 = v6->_activationCodeLabel;
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v6->_activationCodeLabel setNumberOfLines:1];
    [(UILabel *)v6->_activationCodeLabel pkui_setExcludedFromScreenCapture:1 andBroadcasting:1];
    v15 = v6->_activationCodeLabel;
    v16 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    [(UILabel *)v15 setFont:v16];

    [(PKPassShareActivationShareActivationCodeView *)v6 addSubview:v6->_activationCodeLabel];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v6 action:sel__showCopyMenu];
    [(UIView *)v6->_activationCodeBackgroundView addGestureRecognizer:v17];
    v18 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB27D8]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__PKPassShareActivationShareActivationCodeView_initWithDelegate___block_invoke;
    v29[3] = &unk_1E59DC8D8;
    id v30 = v18;
    v19 = v6;
    v31 = v19;
    id v20 = v18;
    v21 = (void (**)(void *, __CFString *, char *, __CFString *))_Block_copy(v29);
    uint64_t v22 = v21[2](v21, @"phone.fill", sel__phoneButtonPressed, @"SHARE_ACTIVATION_OVERVIEW_CALL_BUTTON_TITLE");
    phoneButton = v19->_phoneButton;
    v19->_phoneButton = (PKContinuousButton *)v22;

    uint64_t v24 = v21[2](v21, @"square.and.arrow.up.fill", sel__shareButtonPressed, @"SHARE_ACTIVATION_OVERVIEW_SHARE_BUTTON_TITLE");
    shareButton = v19->_shareButton;
    v19->_shareButton = (PKContinuousButton *)v24;

    uint64_t v26 = v21[2](v21, @"doc.on.doc.fill", sel__copyButtonPressed, @"SHARE_ACTIVATION_OVERVIEW_COPY_BUTTON_TITLE");
    copyButton = v19->_copyButton;
    v19->_copyButton = (PKContinuousButton *)v26;
  }
  return v6;
}

PKContinuousButton *__65__PKPassShareActivationShareActivationCodeView_initWithDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v7 = a4;
  id v8 = a2;
  uint64_t v19 = 0x4024000000000000;
  long long v20 = xmmword_1A040E960;
  int64x2_t v21 = vdupq_n_s64(2uLL);
  v9 = [[PKContinuousButton alloc] initWithConfiguration:&v19];
  v10 = (void *)MEMORY[0x1E4FB14D8];
  v11 = PKLocalizedShareableCredentialString(v7);

  v12 = objc_msgSend(v10, "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v11, *(void *)(a1 + 32), 4, 1);

  objc_msgSend(v12, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v12 setTitleAlignment:2];
  [v12 setImagePlacement:1];
  [v12 setImagePadding:10.0];
  v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v8];

  [v12 setImage:v13];
  v14 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
  [v12 setPreferredSymbolConfigurationForImage:v14];

  v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v12 setBaseBackgroundColor:v15];

  v16 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v12 setBaseForegroundColor:v16];

  v17 = [v12 background];
  [v17 setCornerRadius:0.0];

  [(PKContinuousButton *)v9 setConfiguration:v12];
  [(PKContinuousButton *)v9 addTarget:*(void *)(a1 + 40) action:a3 forControlEvents:64];
  [*(id *)(a1 + 40) addSubview:v9];

  return v9;
}

- (void)setActivationCode:(id)a3
{
  id v5 = a3;
  activationCode = self->_activationCode;
  v9 = (NSString *)v5;
  v7 = activationCode;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_activationCode, a3);
    [(UILabel *)self->_activationCodeLabel setText:self->_activationCode];
    [(PKPassShareActivationShareActivationCodeView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setShowPhoneCallButton:(BOOL)a3
{
  if (self->_showPhoneCallButton != a3)
  {
    self->_showPhoneCallButton = a3;
    if (a3) {
      [(PKPassShareActivationShareActivationCodeView *)self addSubview:self->_phoneButton];
    }
    else {
      [(PKContinuousButton *)self->_phoneButton removeFromSuperview];
    }
    [(PKPassShareActivationShareActivationCodeView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 192.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v26[3] = *MEMORY[0x1E4F143B8];
  [(PKPassShareActivationShareActivationCodeView *)self bounds];
  double width = v27.size.width;
  double height = v27.size.height;
  CGRect remainder = v27;
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v27, &slice, &remainder, 90.0, CGRectMinYEdge);
  -[UIView setFrame:](self->_activationCodeBackgroundView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel sizeThatFits:](self->_activationCodeLabel, "sizeThatFits:", width, height);
  activationCodeLabel = self->_activationCodeLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](activationCodeLabel, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 32.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, 60.0, CGRectMinYEdge);
  CGRect v22 = slice;
  if (self->_showPhoneCallButton)
  {
    shareButton = self->_shareButton;
    v26[0] = self->_phoneButton;
    v26[1] = shareButton;
    v26[2] = self->_copyButton;
    v7 = (void *)MEMORY[0x1E4F1C978];
    BOOL v8 = v26;
    uint64_t v9 = 3;
  }
  else
  {
    copyButton = self->_copyButton;
    v25[0] = self->_shareButton;
    v25[1] = copyButton;
    v7 = (void *)MEMORY[0x1E4F1C978];
    BOOL v8 = v25;
    uint64_t v9 = 2;
  }
  v11 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, *(_OWORD *)&v22.origin);
  uint64_t v12 = [v11 count];
  PKFloatRoundToPixel();
  if (v12)
  {
    CGFloat v14 = v13;
    for (uint64_t i = 0; i != v12; ++i)
    {
      CGFloat v16 = v22.size.width;
      if (i)
      {
        CGPoint origin = v22.origin;
        CGFloat v18 = v22.size.height;
        CGRectDivide(*(CGRect *)(&v16 - 2), &slice, &v22, 11.0, CGRectMinXEdge);
        CGFloat v16 = v22.size.width;
      }
      CGPoint v19 = v22.origin;
      CGFloat v20 = v22.size.height;
      CGRectDivide(*(CGRect *)(&v16 - 2), &slice, &v22, v14, CGRectMinXEdge);
      int64x2_t v21 = [v11 objectAtIndexedSubscript:i];
      objc_msgSend(v21, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
  }
}

- (void)_phoneButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationCodeViewDidSelectPhone:self];
}

- (void)_shareButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationCodeViewDidSelectShare:self];
}

- (void)_copyButtonPressed
{
  [(PKContinuousButton *)self->_copyButton setUserInteractionEnabled:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationCodeViewDidSelectCopy:self];

  id v4 = [(PKContinuousButton *)self->_copyButton configuration];
  id v5 = (void *)[v4 copy];

  v6 = (void *)[v5 copy];
  v7 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_6.isa);
  [v6 setTitle:v7];

  [v6 setImage:0];
  BOOL v8 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke;
  v14[3] = &unk_1E59CA870;
  v14[4] = self;
  id v15 = v6;
  id v9 = v6;
  objc_msgSend(v8, "pkui_animateUsingOptions:delay:animations:completion:", 4, v14, 0, 0.0);
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_2;
  v12[3] = &unk_1E59CA870;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  dispatch_after(v10, MEMORY[0x1E4F14428], v12);
}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setConfiguration:*(void *)(a1 + 40)];
}

void __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_3;
  v5[3] = &unk_1E59CA870;
  double v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_4;
  v4[3] = &unk_1E59CB6D8;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "pkui_animateUsingOptions:delay:animations:completion:", 4, v5, v4, 0.0);
}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setConfiguration:*(void *)(a1 + 40)];
}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setUserInteractionEnabled:1];
}

- (void)_showCopyMenu
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1990]);
  id v4 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  id v5 = (void *)[v3 initWithTitle:v4 action:sel__copyActivationCode];

  id v6 = [MEMORY[0x1E4FB1978] sharedMenuController];
  v8[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 setMenuItems:v7];

  [(UILabel *)self->_activationCodeLabel frame];
  objc_msgSend(v6, "showMenuFromView:rect:", self);
}

- (void)_copyActivationCode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationCodeViewDidSelectCopy:self];
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (BOOL)showPhoneCallButton
{
  return self->_showPhoneCallButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_copyButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_activationCodeLabel, 0);
  objc_storeStrong((id *)&self->_activationCodeBackgroundView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end