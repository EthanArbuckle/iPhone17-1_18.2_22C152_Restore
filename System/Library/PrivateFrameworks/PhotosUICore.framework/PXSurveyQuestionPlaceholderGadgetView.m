@interface PXSurveyQuestionPlaceholderGadgetView
- (PXSurveyQuestionPlaceholderGadgetView)initWithFrame:(CGRect)a3;
- (PXSurveyQuestionPlaceholderGadgetViewDelegate)delegate;
- (UIContentUnavailableConfiguration)loadingContentUnavailableConfiguration;
- (UIContentUnavailableConfiguration)placeholderContentUnavailableConfiguration;
- (void)_performContentUnavailableButtonAction;
- (void)_restorePlaceholderContentUnavailableConfiguration;
- (void)setDelegate:(id)a3;
- (void)setLoadingContentUnavailableConfiguration:(id)a3;
- (void)setPlaceholderContentUnavailableConfiguration:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXSurveyQuestionPlaceholderGadgetView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingContentUnavailableConfiguration, 0);
  objc_storeStrong((id *)&self->_placeholderContentUnavailableConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

- (void)setLoadingContentUnavailableConfiguration:(id)a3
{
}

- (UIContentUnavailableConfiguration)loadingContentUnavailableConfiguration
{
  return self->_loadingContentUnavailableConfiguration;
}

- (UIContentUnavailableConfiguration)placeholderContentUnavailableConfiguration
{
  return self->_placeholderContentUnavailableConfiguration;
}

- (void)setDelegate:(id)a3
{
}

- (PXSurveyQuestionPlaceholderGadgetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSurveyQuestionPlaceholderGadgetViewDelegate *)WeakRetained;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PXSurveyQuestionPlaceholderGadgetView;
  id v4 = a3;
  [(PXSurveyQuestionPlaceholderGadgetView *)&v9 traitCollectionDidChange:v4];
  v5 = [(PXSurveyQuestionPlaceholderGadgetView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    v8 = [(PXSurveyQuestionPlaceholderGadgetView *)self delegate];
    if (!v8) {
      PXAssertGetLog();
    }
    [v8 placeholderGadgetViewSizeThatFitsDidChange:self];
  }
}

- (void)_restorePlaceholderContentUnavailableConfiguration
{
  id v3 = [(PXSurveyQuestionPlaceholderGadgetView *)self placeholderContentUnavailableConfiguration];
  [(UIContentUnavailableView *)self->_contentUnavailableView setConfiguration:v3];
}

- (void)_performContentUnavailableButtonAction
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = [(PXSurveyQuestionPlaceholderGadgetView *)self delegate];
  if (!v3) {
    PXAssertGetLog();
  }
  id v4 = [(PXSurveyQuestionPlaceholderGadgetView *)self loadingContentUnavailableConfiguration];
  if (v4) {
    [(UIContentUnavailableView *)self->_contentUnavailableView setConfiguration:v4];
  }
  objc_initWeak(location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke;
  v6[3] = &unk_1E5DD2120;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, location);
  [v3 placeholderGadgetView:self invokeActionWithCompletionHandler:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(location);
}

void __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke_2;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v4);
  }
}

void __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restorePlaceholderContentUnavailableConfiguration];
}

- (void)setPlaceholderContentUnavailableConfiguration:(id)a3
{
  id v5 = (UIContentUnavailableConfiguration *)a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSurveyQuestionPlaceholderGadgetView.m", 41, @"Invalid parameter not satisfying: %@", @"placeholderContentUnavailableConfiguration" object file lineNumber description];
  }
  v6 = self->_placeholderContentUnavailableConfiguration;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(UIContentUnavailableConfiguration *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = (UIContentUnavailableConfiguration *)[(UIContentUnavailableConfiguration *)v5 copy];
      placeholderContentUnavailableConfiguration = self->_placeholderContentUnavailableConfiguration;
      self->_placeholderContentUnavailableConfiguration = v9;

      v11 = [(UIContentUnavailableConfiguration *)self->_placeholderContentUnavailableConfiguration buttonProperties];
      v12 = [v11 configuration];
      v13 = [v12 title];

      if (v13)
      {
        objc_initWeak(&location, self);
        v14 = (void *)MEMORY[0x1E4FB13F0];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __87__PXSurveyQuestionPlaceholderGadgetView_setPlaceholderContentUnavailableConfiguration___block_invoke;
        v17[3] = &unk_1E5DD2930;
        objc_copyWeak(&v18, &location);
        v15 = [v14 actionWithHandler:v17];
        [v11 setPrimaryAction:v15];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      [(UIContentUnavailableView *)self->_contentUnavailableView setConfiguration:self->_placeholderContentUnavailableConfiguration];
    }
  }
}

void __87__PXSurveyQuestionPlaceholderGadgetView_setPlaceholderContentUnavailableConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performContentUnavailableButtonAction];
}

- (PXSurveyQuestionPlaceholderGadgetView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXSurveyQuestionPlaceholderGadgetView;
  id v3 = -[PXSurveyQuestionPlaceholderGadgetView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PXSurveyQuestionPlaceholderGadgetView *)v3 setBackgroundColor:v4];

    [(PXSurveyQuestionPlaceholderGadgetView *)v3 _setCornerRadius:10.0];
    id v5 = objc_msgSend(MEMORY[0x1E4FB1658], "px_containerized_defaultConfiguration");
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1670]) initWithConfiguration:v5];
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = (UIContentUnavailableView *)v6;

    char v8 = [(PXSurveyQuestionPlaceholderGadgetView *)v3 contentView];
    [v8 bounds];
    -[UIContentUnavailableView setFrame:](v3->_contentUnavailableView, "setFrame:");
    [(UIContentUnavailableView *)v3->_contentUnavailableView setAutoresizingMask:18];
    [v8 addSubview:v3->_contentUnavailableView];
  }
  return v3;
}

@end