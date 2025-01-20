@interface PXSurveyQuestionsGadgetContentView
+ (CGSize)sizeThatFits:(CGSize)a3;
- (BOOL)contentHidden;
- (BOOL)isInvalid;
- (BOOL)isMultipleSelectionAnswerPresentation;
- (BOOL)isSelectionResponse;
- (CGRect)_contentFrameInBounds:(CGRect)a3;
- (CGRect)contentBoundsInCoordinateSpace:(id)a3;
- (CGRect)contentRect;
- (CGSize)_calculateLayoutWithInputSize:(CGSize)a3 apply:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXCapsuleButton)noButton;
- (PXCapsuleButton)skipButton;
- (PXCapsuleButton)yesButton;
- (PXSurveyQuestionConfiguration)configuration;
- (PXSurveyQuestionsGadgetContentView)initWithFrame:(CGRect)a3;
- (PXSurveyQuestionsGadgetContentViewDelegate)delegate;
- (UILabel)titleLabel;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 buttonColor:(id)a5 titleColor:(id)a6;
- (id)focusEffect;
- (id)keyCommands;
- (void)_askForAdditionalReasonForAnswer:(unint64_t)a3 completionBlock:(id)a4;
- (void)_didAnswer:(unint64_t)a3;
- (void)_didAnswerNo;
- (void)_didAnswerSkip;
- (void)_didAnswerYes;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConfiguration:(id)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setNoButton:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setYesButton:(id)a3;
- (void)updateButtonsWithAnswerState:(unint64_t)a3 reason:(id)a4;
@end

@implementation PXSurveyQuestionsGadgetContentView

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXSurveyQuestionsGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (sizeThatFits__onceToken != -1) {
    dispatch_once(&sizeThatFits__onceToken, &__block_literal_global_225866);
  }
  v5 = (void *)sizeThatFits__view;
  objc_msgSend(v5, "sizeThatFits:", width, height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  [(PXSurveyQuestionsGadgetContentView *)&v5 layoutSubviews];
  [(PXSurveyQuestionsGadgetContentView *)self bounds];
  -[PXSurveyQuestionsGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 1, v3, v4);
}

void __51__PXSurveyQuestionsGadgetContentView_sizeThatFits___block_invoke()
{
  v0 = [PXSurveyQuestionsGadgetContentView alloc];
  uint64_t v1 = -[PXSurveyQuestionsGadgetContentView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = (void *)sizeThatFits__view;
  sizeThatFits__view = v1;
}

- (PXSurveyQuestionsGadgetContentView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  double v3 = -[PXSurveyQuestionsGadgetContentView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = (PXSurveyQuestionConfiguration *)v4;

    double v6 = [(PXSurveyQuestionsGadgetContentView *)v3 contentView];
    double v7 = [(PXSurveyQuestionsGadgetContentView *)v3 titleLabel];
    [v6 addSubview:v7];

    v8 = [(PXSurveyQuestionsGadgetContentView *)v3 contentView];
    v9 = [(PXSurveyQuestionsGadgetContentView *)v3 yesButton];
    [v8 addSubview:v9];

    v10 = [(PXSurveyQuestionsGadgetContentView *)v3 contentView];
    v11 = [(PXSurveyQuestionsGadgetContentView *)v3 skipButton];
    [v10 addSubview:v11];

    v12 = [(PXSurveyQuestionsGadgetContentView *)v3 contentView];
    v13 = [(PXSurveyQuestionsGadgetContentView *)v3 noButton];
    [v12 addSubview:v13];

    v14 = [(PXSurveyQuestionsGadgetContentView *)v3 layer];
    [v14 setCornerRadius:4.0];

    [(PXSurveyQuestionsGadgetContentView *)v3 setClipsToBounds:1];
    v15 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [(PXSurveyQuestionsGadgetContentView *)v3 setBackgroundColor:v15];

    v16 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    selectionFeedbackGenerator = v3->_selectionFeedbackGenerator;
    v3->_selectionFeedbackGenerator = v16;
  }
  return v3;
}

- (void)setConfiguration:(id)a3
{
  objc_super v5 = (PXSurveyQuestionConfiguration *)a3;
  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (configuration != v5)
  {
    v20 = v5;
    v8 = [(PXSurveyQuestionConfiguration *)configuration contentView];
    [v8 removeFromSuperview];

    objc_storeStrong((id *)&self->_configuration, a3);
    v9 = [(PXSurveyQuestionConfiguration *)*p_configuration title];
    v10 = [(PXSurveyQuestionsGadgetContentView *)self titleLabel];
    [v10 setText:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v20;
      v12 = [(PXSurveyQuestionsGadgetContentView *)self traitCollection];
      [v12 displayScale];
      v13 = -[PXSurveyQuestionConfiguration contentViewForDisplayScale:](v11, "contentViewForDisplayScale:");
    }
    else
    {
      v13 = [(PXSurveyQuestionConfiguration *)*p_configuration contentView];
    }
    v14 = [v13 layer];
    [v14 setCornerRadius:4.0];

    [v13 setClipsToBounds:1];
    [(PXSurveyQuestionsGadgetContentView *)self addSubview:v13];
    if ([(PXSurveyQuestionsGadgetContentView *)self isSelectionResponse])
    {
      [(PXCapsuleButton *)self->_noButton removeFromSuperview];
    }
    else
    {
      v15 = [(PXSurveyQuestionsGadgetContentView *)self noButton];
      v16 = [v15 superview];

      if (!v16)
      {
        v17 = [(PXSurveyQuestionsGadgetContentView *)self noButton];
        [(PXSurveyQuestionsGadgetContentView *)self addSubview:v17];
      }
    }
    if ([(PXSurveyQuestionsGadgetContentView *)self isSelectionResponse]) {
      v18 = @"PXInternalPhotosChallengeSelect";
    }
    else {
      v18 = @"PXInternalPhotosChallengeYes";
    }
    objc_super v19 = PXLocalizedStringFromTable(v18, @"PhotosUICore");
    [(PXCapsuleButton *)self->_yesButton setTitle:v19 forState:0];

    objc_super v5 = v20;
  }
}

- (BOOL)isSelectionResponse
{
  v2 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
  unsigned int v3 = [v2 questionType];

  return (v3 < 0x1F) & (0x2000100u >> v3);
}

- (PXSurveyQuestionsGadgetContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSurveyQuestionsGadgetContentViewDelegate *)WeakRetained;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    objc_super v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    double v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v7];

    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_titleLabel setBackgroundColor:v8];

    v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 2, 1);
    [(UILabel *)self->_titleLabel setFont:v9];

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (PXCapsuleButton)yesButton
{
  yesButton = self->_yesButton;
  if (!yesButton)
  {
    id v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeYes", @"PhotosUICore");
    objc_super v5 = [MEMORY[0x1E4FB1618] clearColor];
    double v6 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    double v7 = [(PXSurveyQuestionsGadgetContentView *)self _actionButtonWithTitle:v4 action:sel__didAnswerYes buttonColor:v5 titleColor:v6];
    v8 = self->_yesButton;
    self->_yesButton = v7;

    v9 = self->_yesButton;
    v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(PXCapsuleButton *)v9 setColor:v10 forState:0];

    v11 = self->_yesButton;
    v12 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    [(PXCapsuleButton *)v11 setColor:v12 forState:4];

    v13 = self->_yesButton;
    v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(PXCapsuleButton *)v13 setTitleColor:v14 forState:4];

    yesButton = self->_yesButton;
  }
  return yesButton;
}

- (PXCapsuleButton)noButton
{
  noButton = self->_noButton;
  if (!noButton)
  {
    id v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeNo", @"PhotosUICore");
    objc_super v5 = [MEMORY[0x1E4FB1618] clearColor];
    double v6 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    double v7 = [(PXSurveyQuestionsGadgetContentView *)self _actionButtonWithTitle:v4 action:sel__didAnswerNo buttonColor:v5 titleColor:v6];
    v8 = self->_noButton;
    self->_noButton = v7;

    v9 = self->_noButton;
    v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(PXCapsuleButton *)v9 setColor:v10 forState:0];

    v11 = self->_noButton;
    v12 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    [(PXCapsuleButton *)v11 setColor:v12 forState:4];

    v13 = self->_noButton;
    v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(PXCapsuleButton *)v13 setTitleColor:v14 forState:4];

    noButton = self->_noButton;
  }
  return noButton;
}

- (PXCapsuleButton)skipButton
{
  skipButton = self->_skipButton;
  if (!skipButton)
  {
    id v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSkip", @"PhotosUICore");
    objc_super v5 = [MEMORY[0x1E4FB1618] clearColor];
    double v6 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    double v7 = [(PXSurveyQuestionsGadgetContentView *)self _actionButtonWithTitle:v4 action:sel__didAnswerSkip buttonColor:v5 titleColor:v6];
    v8 = self->_skipButton;
    self->_skipButton = v7;

    v9 = self->_skipButton;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXCapsuleButton *)v9 setColor:v10 forState:0];

    v11 = self->_skipButton;
    v12 = [(PXSurveyQuestionsGadgetContentView *)self tintColor];
    [(PXCapsuleButton *)v11 setColor:v12 forState:4];

    v13 = self->_skipButton;
    v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(PXCapsuleButton *)v13 setTitleColor:v14 forState:4];

    skipButton = self->_skipButton;
  }
  return skipButton;
}

- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 buttonColor:(id)a5 titleColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [[PXCapsuleButton alloc] initWithColor:v11];

  [(PXCapsuleButton *)v13 setMaxContentSizeCategory:*MEMORY[0x1E4FB2790]];
  [(PXCapsuleButton *)v13 setTitle:v12 forState:0];

  [(PXCapsuleButton *)v13 setTitleColor:v10 forState:0];
  [(PXCapsuleButton *)v13 addTarget:self action:a4 forControlEvents:0x2000];
  return v13;
}

- (CGSize)_calculateLayoutWithInputSize:(CGSize)a3 apply:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v9 = [(PXSurveyQuestionsGadgetContentView *)self traitCollection];
  [v9 displayScale];

  -[PXSurveyQuestionsGadgetContentView _contentFrameInBounds:](self, "_contentFrameInBounds:", v8, v7, width, height);
  CGRectGetMaxY(v11);
  v12.origin.x = v8;
  v12.origin.y = v7;
  v12.size.double width = width;
  v12.size.double height = height;
  CGRectGetMaxX(v12);
  PXScaledValueForTextStyleWithSymbolicTraits();
}

- (CGRect)_contentFrameInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = round(a3.size.width * 0.666666667);
  CGFloat MinX = CGRectGetMinX(a3);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v13);
  double v10 = MinX;
  double v11 = width;
  double v12 = v7;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = MinY;
  result.origin.CGFloat x = v10;
  return result;
}

- (PXSurveyQuestionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_noButton, 0);
  objc_storeStrong((id *)&self->_yesButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_currentReason, 0);
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSkipButton:(id)a3
{
}

- (void)setNoButton:(id)a3
{
}

- (void)setYesButton:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (BOOL)contentHidden
{
  return self->_contentHidden;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void)_askForAdditionalReasonForAnswer:(unint64_t)a3 completionBlock:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
    double v10 = [v9 gadgetContentView:self additionalReasonsForAnswer:a3];
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v10 count])
  {
    double v11 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      CGRect v13 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
      v14 = [v13 gadgetContentView:self additionalReasonTitleForAnswer:a3];
    }
    else
    {
      v14 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonTitle", @"PhotosUICore");
    }
    v15 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
      v18 = [v17 gadgetContentView:self additionalReasonMessageForAnswer:a3];
    }
    else
    {
      v18 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonMessage", @"PhotosUICore");
    }
    if ([(PXSurveyQuestionsGadgetContentView *)self isMultipleSelectionAnswerPresentation])
    {
      objc_super v19 = [[PXSurveyQuestionsMultipleAnswerSelectionController alloc] initWithTitle:v14 message:v18 reasons:v10 currentlySelectedReasons:self->_currentReason completion:v6];
    }
    else
    {
      v42 = v14;
      v41 = v18;
      v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v18 preferredStyle:0];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v43 = v10;
      id obj = v10;
      uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v54 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x1E4FB1410];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke;
            v49[3] = &unk_1E5DD1040;
            id v27 = v20;
            id v50 = v27;
            id v28 = v6;
            uint64_t v51 = v25;
            id v52 = v28;
            v29 = [v26 actionWithTitle:v25 style:0 handler:v49];
            [v27 addAction:v29];
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v22);
      }

      v30 = (void *)MEMORY[0x1E4FB1410];
      v31 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_2;
      v46[3] = &unk_1E5DC7010;
      id v32 = v20;
      id v47 = v32;
      id v48 = v6;
      v33 = [v30 actionWithTitle:v31 style:1 handler:v46];

      [v32 addAction:v33];
      objc_super v19 = (PXSurveyQuestionsMultipleAnswerSelectionController *)v32;

      double v10 = v43;
      v18 = v41;
      v14 = v42;
    }
    v34 = [(PXSurveyQuestionsGadgetContentView *)self configuration];
    v35 = [v34 handlers];
    v36 = [v35 presentViewControllerHandler];

    if (v36)
    {
      v37 = [(PXSurveyQuestionsGadgetContentView *)self configuration];
      v38 = [v37 handlers];
      v39 = [v38 presentViewControllerHandler];
      ((void (**)(void, PXSurveyQuestionsMultipleAnswerSelectionController *))v39)[2](v39, v19);
    }
    else
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_3;
      v45[3] = &unk_1E5DC7038;
      v45[4] = self;
      id v40 = +[PXAlert show:v45];
    }
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 1);
  }
}

uint64_t __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:@"⚠️ Please File a Radar"];
  [v3 setMessage:@"We are trying to track down a hard to reproduce bug. Please file a radar. Thanks!"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_4;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = *(void *)(a1 + 32);
  [v3 addActionWithTitle:@"File Radar" style:0 action:v4];
  [v3 addActionWithTitle:@"Cancel" style:1 action:&__block_literal_global_288_225783];
}

void __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) delegate];
  v2 = @"Yes";
  if (!v1) {
    v2 = @"No";
  }
  id v3 = v2;

  objc_super v5 = [NSString stringWithFormat:@"PLEASE DO NOT MODIFY\n\nDoes delegate exist: %@", v3];

  LOWORD(v4) = 1;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", @"Photos Challenge Multi Select Menu Presentation Error", v5, @"Other Bug", @"1064134", @"Photos Personalization", @"all", 0, 0, 0, v4, 0, 0);
}

- (void)_didAnswer:(unint64_t)a3
{
  [(PXSurveyQuestionsGadgetContentView *)self updateButtonsWithAnswerState:a3 reason:self->_currentReason];
  objc_super v5 = [(PXSurveyQuestionsGadgetContentView *)self selectionFeedbackGenerator];
  [v5 selectionChanged];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PXSurveyQuestionsGadgetContentView__didAnswer___block_invoke;
  v6[3] = &unk_1E5DC6FE8;
  v6[4] = self;
  v6[5] = a3;
  [(PXSurveyQuestionsGadgetContentView *)self _askForAdditionalReasonForAnswer:a3 completionBlock:v6];
}

void __49__PXSurveyQuestionsGadgetContentView__didAnswer___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v9 = a2;
  id v6 = (id *)(*(void *)(a1 + 32) + 640);
  if (a3)
  {
    objc_storeStrong(v6, a2);
    double v7 = [*(id *)(a1 + 32) delegate];
    [v7 gadgetContentView:*(void *)(a1 + 32) didAnswer:*(void *)(a1 + 40) withReason:v9];
  }
  else
  {
    id v8 = *v6;
    *id v6 = 0;

    [*(id *)(a1 + 32) updateButtonsWithAnswerState:0 reason:0];
  }
}

- (void)_didAnswerSkip
{
}

- (void)_didAnswerNo
{
}

- (void)_didAnswerYes
{
}

- (id)focusEffect
{
  id v3 = +[PXFocusInfo focusInfoWithView:self];
  uint64_t v4 = [v3 makeHaloEffectForSourceView:self];

  return v4;
}

- (void)setContentHidden:(BOOL)a3
{
  if (self->_contentHidden != a3)
  {
    BOOL v3 = a3;
    self->_contentHidden = a3;
    id v5 = [(PXSurveyQuestionsGadgetContentView *)self configuration];
    uint64_t v4 = [v5 contentView];
    [v4 setHidden:v3];
  }
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(PXSurveyQuestionsGadgetContentView *)self bounds];
  -[PXSurveyQuestionsGadgetContentView _contentFrameInBounds:](self, "_contentFrameInBounds:");
  -[PXSurveyQuestionsGadgetContentView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  [(PXSurveyQuestionsGadgetContentView *)&v4 prepareForReuse];
  BOOL v3 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  [(PXSurveyQuestionsGadgetContentView *)self setConfiguration:v3];

  [(PXSurveyQuestionsGadgetContentView *)self updateButtonsWithAnswerState:0 reason:0];
}

- (id)keyCommands
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1C978];
  objc_super v4 = [(PXSurveyQuestionsGadgetContentView *)self yesButton];
  double v5 = [(PXSurveyQuestionsGadgetContentView *)self noButton];
  double v6 = [(PXSurveyQuestionsGadgetContentView *)self skipButton];
  double v7 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);

  double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v15 = [v14 titleForState:0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __49__PXSurveyQuestionsGadgetContentView_keyCommands__block_invoke;
        v18[3] = &unk_1E5DC6FC0;
        id v19 = v15;
        id v20 = v8;
        id v16 = v15;
        [v14 enumerateEventHandlers:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v8;
}

void __49__PXSurveyQuestionsGadgetContentView_keyCommands__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, __int16 a5)
{
  id v14 = a2;
  id v9 = a3;
  if ((a5 & 0x2000) != 0 && [*(id *)(a1 + 32) length])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FB18D0];
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) substringToIndex:1];
    double v13 = [v10 keyCommandWithInput:v12 modifierFlags:0 action:a4];
    [v11 addObject:v13];
  }
}

- (void)updateButtonsWithAnswerState:(unint64_t)a3 reason:(id)a4
{
  id v15 = a4;
  objc_storeStrong((id *)&self->_currentReason, a4);
  uint64_t v7 = 0;
  double v8 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__skipButton;
  uint64_t v9 = 1;
  uint64_t v10 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
  uint64_t v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      [(PXCapsuleButton *)self->_yesButton setSelected:1];
      [(PXCapsuleButton *)self->_noButton setSelected:0];
      [(PXCapsuleButton *)self->_skipButton setSelected:0];
      if (![(PXSurveyQuestionsGadgetContentView *)self isSelectionResponse]) {
        goto LABEL_11;
      }
      yesButton = self->_yesButton;
      double v13 = @"PXInternalPhotosChallengeSelected";
      goto LABEL_10;
    case 2uLL:
      uint64_t v10 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
      uint64_t v7 = 1;
      uint64_t v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
      goto LABEL_6;
    case 3uLL:
      double v8 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
      uint64_t v10 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
      uint64_t v7 = 1;
      uint64_t v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__skipButton;
LABEL_6:
      [*(id *)((char *)&self->super.super.super.super.super.isa + *v11) setSelected:v7];
      [*(id *)((char *)&self->super.super.super.super.super.isa + *v10) setSelected:0];
      uint64_t v9 = 0;
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      [*(id *)((char *)&self->super.super.super.super.super.isa + *v8) setSelected:v9];
      break;
    default:
      break;
  }
  if ([(PXSurveyQuestionsGadgetContentView *)self isSelectionResponse])
  {
    yesButton = self->_yesButton;
    double v13 = @"PXInternalPhotosChallengeSelect";
LABEL_10:
    id v14 = PXLocalizedStringFromTable(v13, @"PhotosUICore");
    [(PXCapsuleButton *)yesButton setTitle:v14 forState:0];
  }
LABEL_11:
}

- (BOOL)isMultipleSelectionAnswerPresentation
{
  v2 = [(PXSurveyQuestionsGadgetContentView *)self delegate];
  BOOL v3 = [v2 questionType] == 25;

  return v3;
}

@end