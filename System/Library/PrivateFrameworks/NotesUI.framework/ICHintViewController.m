@interface ICHintViewController
+ (void)initialize;
- (BOOL)showsCloseButton;
- (ICHintViewController)initWithRootViewController:(id)a3 showsCloseButton:(BOOL)a4 hintTitle:(id)a5 hintSubtitle:(id)a6 buttonTitle:(id)a7 buttonAction:(id)a8;
- (NSString)buttonTitle;
- (NSString)hintSubtitle;
- (NSString)hintTitle;
- (UIButton)actionButton;
- (UIButton)closeButton;
- (UILabel)hintSubtitleLabel;
- (UILabel)hintTitleLabel;
- (UIStackView)actionButtonStackView;
- (UIStackView)contentStackView;
- (UIStackView)hintStackView;
- (UIView)actionButtonTopSpacerView;
- (UIView)actionButtonTrailingSpacerView;
- (id)buttonAction;
- (void)setActionButton:(id)a3;
- (void)setActionButtonStackView:(id)a3;
- (void)setActionButtonTopSpacerView:(id)a3;
- (void)setActionButtonTrailingSpacerView:(id)a3;
- (void)setButtonAction:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setHintStackView:(id)a3;
- (void)setHintSubtitle:(id)a3;
- (void)setHintSubtitleLabel:(id)a3;
- (void)setHintTitle:(id)a3;
- (void)setHintTitleLabel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICHintViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    ICHintViewControllerActionButtonInsetHorizontal = 0x4030000000000000;
    ICHintViewControllerActionButtonInsetVertical = 0x4028000000000000;
    ICHintViewControllerActionButtonSpacing = 0x4028000000000000;
    ICHintViewControllerCloseButtonDimension = 0x403A000000000000;
    ICHintViewControllerContentSpacing = 0x4028000000000000;
    ICHintViewControllerOffsetX = 0xC03A000000000000;
    ICHintViewControllerOffsetY = 0x4059800000000000;
    ICHintViewControllerPadding = 0x4034000000000000;
    ICHintViewControllerTitleSubtitleSpacing = 0x3FF0000000000000;
    ICHintViewControllerWidth = 0x4074400000000000;
  }
}

- (ICHintViewController)initWithRootViewController:(id)a3 showsCloseButton:(BOOL)a4 hintTitle:(id)a5 hintSubtitle:(id)a6 buttonTitle:(id)a7 buttonAction:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICHintViewController;
  v19 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v24, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 1.0, 0.0, 1.0, 0.0, *(double *)&ICHintViewControllerOffsetX, *(double *)&ICHintViewControllerOffsetY, 0.0);
  v20 = v19;
  if (v19)
  {
    v19->_showsCloseButton = a4;
    objc_storeStrong((id *)&v19->_hintTitle, a5);
    objc_storeStrong((id *)&v20->_hintSubtitle, a6);
    objc_storeStrong((id *)&v20->_buttonTitle, a7);
    v21 = _Block_copy(v18);
    id buttonAction = v20->_buttonAction;
    v20->_id buttonAction = v21;
  }
  return v20;
}

- (void)viewDidLoad
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)ICHintViewController;
  [(ICHintViewController *)&v29 viewDidLoad];
  v3 = [(ICPillOrnamentViewController *)self contentView];
  v4 = [(ICHintViewController *)self contentStackView];
  [v3 addSubview:v4];

  v5 = [(ICHintViewController *)self contentStackView];
  objc_msgSend(v5, "ic_addAnchorsToFillSuperviewWithPadding:", *(double *)&ICHintViewControllerPadding);

  if ([(ICHintViewController *)self showsCloseButton])
  {
    v6 = [(ICHintViewController *)self contentStackView];
    v7 = [(ICHintViewController *)self closeButton];
    [v6 addArrangedSubview:v7];
  }
  v8 = [(ICHintViewController *)self contentStackView];
  v9 = [(ICHintViewController *)self hintStackView];
  [v8 addArrangedSubview:v9];

  v10 = [(ICHintViewController *)self hintStackView];
  v11 = [(ICHintViewController *)self hintTitleLabel];
  [v10 addArrangedSubview:v11];

  v12 = [(ICHintViewController *)self hintStackView];
  v13 = [(ICHintViewController *)self hintSubtitleLabel];
  [v12 addArrangedSubview:v13];

  v14 = [(ICHintViewController *)self hintStackView];
  id v15 = [(ICHintViewController *)self actionButtonTopSpacerView];
  [v14 addArrangedSubview:v15];

  id v16 = [(ICHintViewController *)self actionButtonStackView];
  id v17 = [(ICHintViewController *)self actionButton];
  [v16 addArrangedSubview:v17];

  id v18 = [(ICHintViewController *)self actionButtonStackView];
  v19 = [(ICHintViewController *)self actionButtonTrailingSpacerView];
  [v18 addArrangedSubview:v19];

  v20 = [(ICHintViewController *)self hintStackView];
  v21 = [(ICHintViewController *)self actionButtonStackView];
  [v20 addArrangedSubview:v21];

  if ([(ICHintViewController *)self showsCloseButton])
  {
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(ICHintViewController *)self closeButton];
    objc_super v24 = [v23 centerYAnchor];
    v25 = [(ICHintViewController *)self hintTitleLabel];
    v26 = [v25 centerYAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v30[0] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v22 activateConstraints:v28];
  }
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)ICHintViewController;
  [(ICHintViewController *)&v10 viewDidLayoutSubviews];
  v3 = [(ICPillOrnamentViewController *)self contentView];
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)&ICHintViewControllerWidth, *(double *)(MEMORY[0x1E4FB2C68] + 8), v4, v5);
  double v7 = v6;
  double v9 = v8;

  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v9);
}

- (UIButton)actionButton
{
  actionButton = self->_actionButton;
  if (actionButton)
  {
    v3 = actionButton;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB14D8] borderedProminentButtonConfiguration];
    double v6 = [(ICHintViewController *)self buttonTitle];
    [v5 setTitle:v6];

    objc_msgSend(v5, "setContentInsets:", *(double *)&ICHintViewControllerActionButtonInsetVertical, *(double *)&ICHintViewControllerActionButtonInsetHorizontal, *(double *)&ICHintViewControllerActionButtonInsetVertical, *(double *)&ICHintViewControllerActionButtonInsetHorizontal);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__ICHintViewController_actionButton__block_invoke;
    v11[3] = &unk_1E5FDBE98;
    v11[4] = self;
    double v7 = [MEMORY[0x1E4FB13F0] actionWithHandler:v11];
    double v8 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v5 primaryAction:v7];
    double v9 = self->_actionButton;
    self->_actionButton = v8;

    [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v3 = self->_actionButton;
  }
  return v3;
}

void __36__ICHintViewController_actionButton__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonAction];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) buttonAction];
    v3[2]();
  }
}

- (UIStackView)actionButtonStackView
{
  actionButtonStackView = self->_actionButtonStackView;
  if (!actionButtonStackView)
  {
    double v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    double v5 = self->_actionButtonStackView;
    self->_actionButtonStackView = v4;

    [(UIStackView *)self->_actionButtonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_actionButtonStackView setAxis:0];
    [(UIStackView *)self->_actionButtonStackView setSpacing:*(double *)&ICHintViewControllerActionButtonSpacing];
    actionButtonStackView = self->_actionButtonStackView;
  }
  double v6 = actionButtonStackView;
  return v6;
}

- (UIView)actionButtonTopSpacerView
{
  actionButtonTopSpacerView = self->_actionButtonTopSpacerView;
  if (!actionButtonTopSpacerView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v5 = self->_actionButtonTopSpacerView;
    self->_actionButtonTopSpacerView = v4;

    [(UIView *)self->_actionButtonTopSpacerView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(UIView *)self->_actionButtonTopSpacerView heightAnchor];
    double v7 = [v6 constraintEqualToConstant:*(double *)&ICHintViewControllerActionButtonSpacing];
    [v7 setActive:1];

    actionButtonTopSpacerView = self->_actionButtonTopSpacerView;
  }
  double v8 = actionButtonTopSpacerView;
  return v8;
}

- (UIView)actionButtonTrailingSpacerView
{
  actionButtonTrailingSpacerView = self->_actionButtonTrailingSpacerView;
  if (!actionButtonTrailingSpacerView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v5 = self->_actionButtonTrailingSpacerView;
    self->_actionButtonTrailingSpacerView = v4;

    [(UIView *)self->_actionButtonTrailingSpacerView setTranslatesAutoresizingMaskIntoConstraints:0];
    actionButtonTrailingSpacerView = self->_actionButtonTrailingSpacerView;
  }
  double v6 = actionButtonTrailingSpacerView;
  return v6;
}

- (UIButton)closeButton
{
  v20[2] = *MEMORY[0x1E4F143B8];
  closeButton = self->_closeButton;
  if (closeButton)
  {
    v3 = closeButton;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB14D8] borderedProminentButtonConfiguration];
    id v18 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v18];
    [v5 setImage:v6];

    double v7 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setBaseForegroundColor:v7];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__ICHintViewController_closeButton__block_invoke;
    v19[3] = &unk_1E5FDBE98;
    v19[4] = self;
    double v8 = [MEMORY[0x1E4FB13F0] actionWithHandler:v19];
    double v9 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v5 primaryAction:v8];
    objc_super v10 = self->_closeButton;
    self->_closeButton = v9;

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = [(UIButton *)self->_closeButton widthAnchor];
    v13 = [v12 constraintEqualToConstant:*(double *)&ICHintViewControllerCloseButtonDimension];
    v20[0] = v13;
    v14 = [(UIButton *)self->_closeButton heightAnchor];
    id v15 = [v14 constraintEqualToConstant:*(double *)&ICHintViewControllerCloseButtonDimension];
    v20[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v11 activateConstraints:v16];

    v3 = self->_closeButton;
  }
  return v3;
}

uint64_t __35__ICHintViewController_closeButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

- (UIStackView)contentStackView
{
  contentStackView = self->_contentStackView;
  if (!contentStackView)
  {
    double v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    double v5 = self->_contentStackView;
    self->_contentStackView = v4;

    [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_contentStackView setSpacing:*(double *)&ICHintViewControllerContentSpacing];
    [(UIStackView *)self->_contentStackView setAxis:0];
    [(UIStackView *)self->_contentStackView setAlignment:1];
    contentStackView = self->_contentStackView;
  }
  double v6 = contentStackView;
  return v6;
}

- (UIStackView)hintStackView
{
  hintStackView = self->_hintStackView;
  if (!hintStackView)
  {
    double v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    double v5 = self->_hintStackView;
    self->_hintStackView = v4;

    [(UIStackView *)self->_hintStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_hintStackView setSpacing:*(double *)&ICHintViewControllerTitleSubtitleSpacing];
    [(UIStackView *)self->_hintStackView setAxis:1];
    hintStackView = self->_hintStackView;
  }
  double v6 = hintStackView;
  return v6;
}

- (UILabel)hintTitleLabel
{
  hintTitleLabel = self->_hintTitleLabel;
  if (!hintTitleLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v5 = self->_hintTitleLabel;
    self->_hintTitleLabel = v4;

    [(UILabel *)self->_hintTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)self->_hintTitleLabel setFont:v6];

    [(UILabel *)self->_hintTitleLabel setNumberOfLines:0];
    double v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_hintTitleLabel setTintColor:v7];

    double v8 = [(ICHintViewController *)self hintTitle];
    [(UILabel *)self->_hintTitleLabel setText:v8];

    hintTitleLabel = self->_hintTitleLabel;
  }
  double v9 = hintTitleLabel;
  return v9;
}

- (UILabel)hintSubtitleLabel
{
  hintSubtitleLabel = self->_hintSubtitleLabel;
  if (!hintSubtitleLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v5 = self->_hintSubtitleLabel;
    self->_hintSubtitleLabel = v4;

    [(UILabel *)self->_hintSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)self->_hintSubtitleLabel setFont:v6];

    [(UILabel *)self->_hintSubtitleLabel setNumberOfLines:0];
    double v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_hintSubtitleLabel setTintColor:v7];

    double v8 = [(ICHintViewController *)self hintSubtitle];
    [(UILabel *)self->_hintSubtitleLabel setText:v8];

    hintSubtitleLabel = self->_hintSubtitleLabel;
  }
  double v9 = hintSubtitleLabel;
  return v9;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (NSString)hintTitle
{
  return self->_hintTitle;
}

- (void)setHintTitle:(id)a3
{
}

- (NSString)hintSubtitle
{
  return self->_hintSubtitle;
}

- (void)setHintSubtitle:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
}

- (void)setContentStackView:(id)a3
{
}

- (void)setHintStackView:(id)a3
{
}

- (void)setActionButtonStackView:(id)a3
{
}

- (void)setActionButtonTopSpacerView:(id)a3
{
}

- (void)setActionButtonTrailingSpacerView:(id)a3
{
}

- (void)setCloseButton:(id)a3
{
}

- (void)setHintTitleLabel:(id)a3
{
}

- (void)setHintSubtitleLabel:(id)a3
{
}

- (void)setActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_hintSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_hintTitleLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButtonTrailingSpacerView, 0);
  objc_storeStrong((id *)&self->_actionButtonTopSpacerView, 0);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_hintStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_hintSubtitle, 0);
  objc_storeStrong((id *)&self->_hintTitle, 0);
}

@end