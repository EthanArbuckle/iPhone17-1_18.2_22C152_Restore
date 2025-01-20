@interface PXSurveyQuestionsCongratulationsGadgetContentView
- (CGSize)sizeThatFits:(CGSize)result;
- (PXCapsuleButton)actionButton;
- (PXRoundedCornerOverlayView)roundedOverlayView;
- (PXSurveyQuestionCongratulationsGadgetContentViewDelegate)delegate;
- (PXSurveyQuestionsCongratulationsGadgetContentView)initWithDetailMessage:(id)a3 buttonTitle:(id)a4;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UILabel)congratulationsLabel;
- (UILabel)messageLabel;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (_PXCKFullscreenEffectView)effectView;
- (void)_didSelectActionButton;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)startConfettiAnimation;
@end

@implementation PXSurveyQuestionsCongratulationsGadgetContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_roundedOverlayView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_congratulationsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (_PXCKFullscreenEffectView)effectView
{
  return self->_effectView;
}

- (PXRoundedCornerOverlayView)roundedOverlayView
{
  return self->_roundedOverlayView;
}

- (PXCapsuleButton)actionButton
{
  return self->_actionButton;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UILabel)congratulationsLabel
{
  return self->_congratulationsLabel;
}

- (void)setDelegate:(id)a3
{
}

- (PXSurveyQuestionCongratulationsGadgetContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSurveyQuestionCongratulationsGadgetContentViewDelegate *)WeakRetained;
}

- (void)startConfettiAnimation
{
  [(UIImpactFeedbackGenerator *)self->_impactFeedbackGenerator impactOccurredWithIntensity:1.0];
  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PXSurveyQuestionsCongratulationsGadgetContentView_startConfettiAnimation__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PXSurveyQuestionsCongratulationsGadgetContentView_startConfettiAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) startAnimation];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PXSurveyQuestionsCongratulationsGadgetContentView;
  [(PXSurveyQuestionsCongratulationsGadgetContentView *)&v25 layoutSubviews];
  [(PXSurveyQuestionsCongratulationsGadgetContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGFloat v23 = CGRectGetMidX(v26) - v12 * 0.5;
  CGFloat v24 = v12;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  CGFloat v15 = CGRectGetMidY(v27) - v14 * 0.5;
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", v23, v15, v12, v14);
  -[UILabel sizeThatFits:](self->_congratulationsLabel, "sizeThatFits:", v8, v10);
  double v17 = v16;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  -[UILabel setFrame:](self->_congratulationsLabel, "setFrame:", CGRectGetMidX(v28) - v17 * 0.5, v15 - v14 + -12.0, v17, v14);
  -[PXCapsuleButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v8, v10);
  double v19 = v18;
  double v22 = v20;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGFloat v21 = CGRectGetMidX(v29) - v19 * 0.5;
  v30.origin.x = v23;
  v30.size.width = v24;
  v30.origin.y = v15;
  v30.size.height = v14;
  -[PXCapsuleButton setFrame:](self->_actionButton, "setFrame:", v21, CGRectGetMaxY(v30) + 24.0, v19, v22);
  -[_PXCKFullscreenEffectView setFrame:](self->_effectView, "setFrame:", v4, v6, v8, v10);
  -[PXRoundedCornerOverlayView setFrame:](self->_roundedOverlayView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width = result.width;
  result.height = width;
  return result;
}

- (void)_didSelectActionButton
{
  double v3 = [(PXSurveyQuestionsCongratulationsGadgetContentView *)self selectionFeedbackGenerator];
  [v3 selectionChanged];

  id v4 = [(PXSurveyQuestionsCongratulationsGadgetContentView *)self delegate];
  [v4 congratulationsGadgetContentViewDidSelectActionButton:self];
}

- (PXSurveyQuestionsCongratulationsGadgetContentView)initWithDetailMessage:(id)a3 buttonTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PXSurveyQuestionsCongratulationsGadgetContentView;
  double v8 = [(PXSurveyQuestionsCongratulationsGadgetContentView *)&v50 init];
  if (v8)
  {
    double v9 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 setBackgroundColor:v9];

    id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    congratulationsLabel = v8->_congratulationsLabel;
    v8->_congratulationsLabel = (UILabel *)v15;

    [(UILabel *)v8->_congratulationsLabel setTextAlignment:1];
    [(UILabel *)v8->_congratulationsLabel setAdjustsFontSizeToFitWidth:1];
    double v17 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeCongratulationsTitle", @"PhotosUICore");
    [(UILabel *)v8->_congratulationsLabel setText:v17];

    double v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8->_congratulationsLabel setBackgroundColor:v18];

    double v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB2988], 2, 1);
    [(UILabel *)v8->_congratulationsLabel setFont:v19];

    [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 addSubview:v8->_congratulationsLabel];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    messageLabel = v8->_messageLabel;
    v8->_messageLabel = (UILabel *)v20;

    [(UILabel *)v8->_messageLabel setTextAlignment:1];
    [(UILabel *)v8->_messageLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v8->_messageLabel setText:v6];
    double v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8->_messageLabel setBackgroundColor:v22];

    [(UILabel *)v8->_messageLabel setNumberOfLines:2];
    CGFloat v23 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 0, 1);
    [(UILabel *)v8->_messageLabel setFont:v23];

    [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 addSubview:v8->_messageLabel];
    if (v7)
    {
      CGFloat v24 = [PXCapsuleButton alloc];
      objc_super v25 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      uint64_t v26 = [(PXCapsuleButton *)v24 initWithColor:v25];
      actionButton = v8->_actionButton;
      v8->_actionButton = (PXCapsuleButton *)v26;

      [(PXCapsuleButton *)v8->_actionButton setMaxContentSizeCategory:*MEMORY[0x1E4FB2790]];
      [(PXCapsuleButton *)v8->_actionButton setTitle:v7 forState:0];
      CGRect v28 = v8->_actionButton;
      CGRect v29 = [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 tintColor];
      [(PXCapsuleButton *)v28 setTitleColor:v29 forState:0];

      [(PXCapsuleButton *)v8->_actionButton addTarget:v8 action:sel__didSelectActionButton forControlEvents:64];
      [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 addSubview:v8->_actionButton];
    }
    CGRect v30 = -[PXRoundedCornerOverlayView initWithFrame:]([PXRoundedCornerOverlayView alloc], "initWithFrame:", v11, v12, v13, v14);
    roundedOverlayView = v8->_roundedOverlayView;
    v8->_roundedOverlayView = v30;

    [(PXSurveyQuestionsCongratulationsGadgetContentView *)v8 addSubview:v8->_roundedOverlayView];
    v32 = v8->_roundedOverlayView;
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __87__PXSurveyQuestionsCongratulationsGadgetContentView_initWithDetailMessage_buttonTitle___block_invoke;
    v48 = &unk_1E5DBAB68;
    v33 = v8;
    v49 = v33;
    [(PXRoundedCornerOverlayView *)v32 performChanges:&v45];
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2050000000;
    v34 = (void *)getCKFullScreenEffectManagerClass_softClass;
    uint64_t v55 = getCKFullScreenEffectManagerClass_softClass;
    if (!getCKFullScreenEffectManagerClass_softClass)
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __getCKFullScreenEffectManagerClass_block_invoke;
      v51[3] = &unk_1E5DD2B08;
      v51[4] = &v52;
      __getCKFullScreenEffectManagerClass_block_invoke((uint64_t)v51);
      v34 = (void *)v53[3];
    }
    v35 = v34;
    _Block_object_dispose(&v52, 8);
    id v36 = objc_alloc_init(v35);
    v37 = objc_msgSend(v36, "effectForIdentifier:", @"com.apple.messages.effect.CKConfettiEffect", v45, v46, v47, v48);
    if (objc_opt_respondsToSelector())
    {
      v38 = (_PXCKFullscreenEffectView *)objc_alloc_init((Class)[v37 effectViewClass]);
      effectView = v33->_effectView;
      v33->_effectView = v38;

      [(_PXCKFullscreenEffectView *)v33->_effectView setUserInteractionEnabled:0];
      [(PXSurveyQuestionsCongratulationsGadgetContentView *)v33 addSubview:v33->_effectView];
    }
    v40 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    selectionFeedbackGenerator = v33->_selectionFeedbackGenerator;
    v33->_selectionFeedbackGenerator = v40;

    uint64_t v42 = [objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:2];
    impactFeedbackGenerator = v33->_impactFeedbackGenerator;
    v33->_impactFeedbackGenerator = (UIImpactFeedbackGenerator *)v42;
  }
  return v8;
}

void __87__PXSurveyQuestionsCongratulationsGadgetContentView_initWithDetailMessage_buttonTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setCornerRadius:4.0];
  id v4 = [*(id *)(a1 + 32) traitCollection];
  [v4 displayScale];
  objc_msgSend(v3, "setDisplayScale:");

  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setOverlayColor:v5];
}

@end