@interface PKPaymentMoreInformationViewController
- (BOOL)_shouldShowBusinessChatButton;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSString)businessChatButtonTitle;
- (NSString)businessChatIdentifier;
- (NSString)businessChatIntentName;
- (NSString)detailBody;
- (NSString)detailSubtitle;
- (NSString)detailTitle;
- (PKPaymentMoreInformationViewController)initWithContext:(int64_t)a3;
- (PKPaymentMoreInformationViewControllerDelegate)delegate;
- (void)_businessChatButtonTapped;
- (void)doneButtonTapped;
- (void)loadView;
- (void)setBusinessChatButtonTitle:(id)a3;
- (void)setBusinessChatIdentifier:(id)a3;
- (void)setBusinessChatIntentName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailBody:(id)a3;
- (void)setDetailSubtitle:(id)a3;
- (void)setDetailTitle:(id)a3;
- (void)setupBusinessChatButton;
- (void)setupDetailTextView;
- (void)setupSubtitleLabel;
- (void)setupTitleLabel;
- (void)setupViewAndScrollView;
- (void)viewDidLayoutSubviews;
@end

@implementation PKPaymentMoreInformationViewController

- (PKPaymentMoreInformationViewController)initWithContext:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMoreInformationViewController;
  v4 = [(PKPaymentMoreInformationViewController *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v4 action:sel_doneButtonTapped];
    v7 = [(PKPaymentMoreInformationViewController *)v5 navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
  return v5;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentMoreInformationViewController;
  [(PKPaymentMoreInformationViewController *)&v3 loadView];
  [(PKPaymentMoreInformationViewController *)self setupViewAndScrollView];
  [(PKPaymentMoreInformationViewController *)self setupTitleLabel];
  [(PKPaymentMoreInformationViewController *)self setupSubtitleLabel];
  [(PKPaymentMoreInformationViewController *)self setupBusinessChatButton];
  [(PKPaymentMoreInformationViewController *)self setupDetailTextView];
}

- (void)setupViewAndScrollView
{
  id v7 = [(PKPaymentMoreInformationViewController *)self view];
  objc_super v3 = PKProvisioningBackgroundColor();
  [v7 setBackgroundColor:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  v5 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [v7 addSubview:self->_scrollView];
}

- (void)setupTitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = self->_titleLabel;
  id v7 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
  [(UILabel *)v6 setFont:v7];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setText:self->_detailTitle];
  [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  v8 = self->_titleLabel;
  uint64_t v9 = *MEMORY[0x1E4F85AB8];

  [(UILabel *)v8 setAccessibilityIdentifier:v9];
}

- (void)setupSubtitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  v6 = self->_subtitleLabel;
  id v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], (NSString *)*MEMORY[0x1E4FB27F0]);
  [(UILabel *)v6 setFont:v7];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setText:self->_detailSubtitle];
  [(UIScrollView *)self->_scrollView addSubview:self->_subtitleLabel];
  v8 = self->_subtitleLabel;
  uint64_t v9 = *MEMORY[0x1E4F85A60];

  [(UILabel *)v8 setAccessibilityIdentifier:v9];
}

- (void)setupBusinessChatButton
{
  if ([(PKPaymentMoreInformationViewController *)self _shouldShowBusinessChatButton])
  {
    id v3 = (void *)MEMORY[0x1E4FB14D8];
    businessChatButtonTitle = self->_businessChatButtonTitle;
    v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    v6 = objc_msgSend(v3, "pkui_plainConfigurationWithTitle:font:", businessChatButtonTitle, v5);

    objc_initWeak(&location, self);
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke;
    v14 = &unk_1E59CBEE0;
    objc_copyWeak(&v15, &location);
    v8 = [v7 actionWithHandler:&v11];
    objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v6, v8, v11, v12, v13, v14);
    uint64_t v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
    businessChatButton = self->_businessChatButton;
    self->_businessChatButton = v9;

    [(UIButton *)self->_businessChatButton setConfigurationUpdateHandler:&__block_literal_global_165];
    [(UIScrollView *)self->_scrollView addSubview:self->_businessChatButton];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _businessChatButtonTapped];
}

void __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];

  [v3 setTextAlignment:1];
}

- (void)setupDetailTextView
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  detailTextView = self->_detailTextView;
  self->_detailTextView = v4;

  v6 = self->_detailTextView;
  id v7 = PKAttributedStringCreateProvisioningBulletedParagraph(self->_detailBody, (void *)*MEMORY[0x1E4FB27F0]);
  [(UITextView *)v6 setAttributedText:v7];

  [(UITextView *)self->_detailTextView setDataDetectorTypes:3];
  [(UITextView *)self->_detailTextView setDelegate:self];
  -[UITextView setTextContainerInset:](self->_detailTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(UITextView *)self->_detailTextView setEditable:0];
  [(UITextView *)self->_detailTextView setSelectable:1];
  [(UITextView *)self->_detailTextView _setInteractiveTextSelectionDisabled:1];
  v8 = self->_detailTextView;
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  if (PKPaymentSetupContextIsBridge()) {
    BPSBridgeTintColor();
  }
  else {
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(UITextView *)v8 setLinkTextAttributes:v10];

  [(UIScrollView *)self->_scrollView addSubview:self->_detailTextView];
  [(UITextView *)self->_detailTextView setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(PKPaymentMoreInformationViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v5 + -48.0, 1.79769313e308);
  CGFloat v9 = v8;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 24.0, 30.0, v5 + -48.0, v8);
  v23.origin.x = 24.0;
  v23.origin.y = 30.0;
  v23.size.width = v5 + -48.0;
  v23.size.height = v9;
  CGFloat v10 = CGRectGetMaxY(v23) + 20.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v5 + -48.0, 1.79769313e308);
  CGFloat v12 = v11;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 24.0, v10, v5 + -48.0, v11);
  v24.origin.x = 24.0;
  v24.origin.y = v10;
  v24.size.width = v5 + -48.0;
  v24.size.height = v12;
  double v13 = CGRectGetMaxY(v24) + 30.0;
  -[UITextView sizeThatFits:](self->_detailTextView, "sizeThatFits:", v5 + -48.0, 1.79769313e308);
  CGFloat v15 = v14;
  -[UITextView setFrame:](self->_detailTextView, "setFrame:", 24.0, v13, v5 + -48.0, v14);
  v25.origin.x = 24.0;
  v25.origin.y = v13;
  v25.size.width = v5 + -48.0;
  v25.size.height = v15;
  double MaxY = CGRectGetMaxY(v25);
  if (self->_businessChatButton)
  {
    v26.origin.x = 24.0;
    v26.origin.y = v13;
    v26.size.width = v5 + -48.0;
    v26.size.height = v15;
    CGFloat v17 = CGRectGetMaxY(v26) + 20.0;
    -[UIButton sizeThatFits:](self->_businessChatButton, "sizeThatFits:", v5 + -20.0, 1.79769313e308);
    PKFloatCeilToPixel();
    CGFloat v19 = v18;
    -[UIButton setFrame:](self->_businessChatButton, "setFrame:", 10.0, v17, v5 + -20.0, v18);
    v27.origin.x = 10.0;
    v27.origin.y = v17;
    v27.size.width = v5 + -20.0;
    v27.size.height = v19;
    double MaxY = CGRectGetMaxY(v27);
  }
  double v20 = MaxY + 20.0;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v5, v7);
  scrollView = self->_scrollView;

  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v5, v20);
}

- (void)doneButtonTapped
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKPaymentMoreInformationViewController *)self dismissViewControllerWithTransition:9 completion:0];
  }
  else
  {
    [(PKPaymentMoreInformationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_businessChatButtonTapped
{
  if (!self->_businessChatController)
  {
    id v3 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v3;
  }
  double v5 = [[PKBuinessChatApplyContext alloc] initWithIdentifier:self->_businessChatIdentifier intent:PKBusinessChatApplyIntentFromString(self->_businessChatIntentName)];
  objc_initWeak(&location, self);
  double v6 = self->_businessChatController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke;
  v7[3] = &unk_1E59CB240;
  objc_copyWeak(&v8, &location);
  [(PKBusinessChatController *)v6 openBusinessChatWithContext:v5 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      double v5 = WeakRetained;
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 presentViewController:v4 animated:1 completion:0];

      id WeakRetained = v5;
    }
  }
}

- (BOOL)_shouldShowBusinessChatButton
{
  if (![(NSString *)self->_businessChatIdentifier length]
    || ![(NSString *)self->_businessChatButtonTitle length]
    || ![(NSString *)self->_businessChatIntentName length])
  {
    return 0;
  }

  return +[PKBusinessChatController deviceSupportsBusinessChat];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  char IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  if ((IsSetupAssistant & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 moreInformationViewController:self didInteractWithURL:v7];
    }
  }

  return IsSetupAssistant ^ 1;
}

- (PKPaymentMoreInformationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentMoreInformationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(id)a3
{
}

- (NSString)detailBody
{
  return self->_detailBody;
}

- (void)setDetailBody:(id)a3
{
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailBody, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_businessChatButton, 0);
  objc_storeStrong((id *)&self->_detailTextView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end