@interface SFActivityNotificationViewController
- (NSString)messageText;
- (NSString)titleText;
- (SFActivityNotificationViewController)initWithTitleText:(id)a3 messageText:(id)a4;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (void)_arrangeAndConfigureLeadingAccessoryView;
- (void)_arrangeAndConfigureTrailingAccessoryView;
- (void)setLeadingAccessoryView:(id)a3;
- (void)setTrailingAccessoryView:(id)a3;
- (void)viewDidLoad;
@end

@implementation SFActivityNotificationViewController

- (SFActivityNotificationViewController)initWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFActivityNotificationViewController;
  v8 = [(SFActivityNotificationViewController *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    titleText = v8->_titleText;
    v8->_titleText = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    messageText = v8->_messageText;
    v8->_messageText = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)SFActivityNotificationViewController;
  [(SFActivityNotificationViewController *)&v35 viewDidLoad];
  v3 = [(SFActivityNotificationViewController *)self view];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  objc_msgSend(v3, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
  v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  containerStackView = self->_containerStackView;
  self->_containerStackView = v4;

  [(UIStackView *)self->_containerStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_containerStackView setAlignment:3];
  [(UIStackView *)self->_containerStackView setSpacing:8.0];
  v31 = v3;
  [v3 addSubview:self->_containerStackView];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v6 setAxis:1];
  [v6 setAlignment:3];
  LODWORD(v7) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v7];
  [(UIStackView *)self->_containerStackView addArrangedSubview:v6];
  id v34 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v8 = *MEMORY[0x1E4FB28F0];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09B8]];
  [v34 setFont:v9];

  v10 = [MEMORY[0x1E4FB1618] labelColor];
  [v34 setTextColor:v10];

  [v34 setText:self->_titleText];
  v33 = v6;
  [v6 addArrangedSubview:v34];
  id v32 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v11 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v8 weight:*MEMORY[0x1E4FB09D0]];
  [v32 setFont:v11];

  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v32 setTextColor:v12];

  [v32 setText:self->_messageText];
  [v6 addArrangedSubview:v32];
  v13 = [v3 layoutMarginsGuide];
  v14 = [(UIStackView *)self->_containerStackView leadingAnchor];
  objc_super v15 = [v13 leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:24.0];
  containerLeadingConstraint = self->_containerLeadingConstraint;
  self->_containerLeadingConstraint = v16;

  v18 = [v13 trailingAnchor];
  v19 = [(UIStackView *)self->_containerStackView trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:24.0];
  containerTrailingContraint = self->_containerTrailingContraint;
  self->_containerTrailingContraint = v20;

  v30 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(UIStackView *)self->_containerStackView topAnchor];
  v23 = [v13 topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v36[0] = v24;
  v25 = [(UIStackView *)self->_containerStackView bottomAnchor];
  v26 = [v13 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v28 = self->_containerLeadingConstraint;
  v36[1] = v27;
  v36[2] = v28;
  v36[3] = self->_containerTrailingContraint;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  [v30 activateConstraints:v29];

  [(SFActivityNotificationViewController *)self _arrangeAndConfigureLeadingAccessoryView];
  [(SFActivityNotificationViewController *)self _arrangeAndConfigureTrailingAccessoryView];
  objc_msgSend(v31, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SFActivityNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setLeadingAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView != v5)
  {
    double v7 = v5;
    if (leadingAccessoryView) {
      -[UIStackView removeArrangedSubview:](self->_containerStackView, "removeArrangedSubview:");
    }
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    [(SFActivityNotificationViewController *)self _arrangeAndConfigureLeadingAccessoryView];
    v5 = v7;
  }
}

- (void)setTrailingAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView != v5)
  {
    double v7 = v5;
    if (trailingAccessoryView) {
      -[UIStackView removeArrangedSubview:](self->_containerStackView, "removeArrangedSubview:");
    }
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    [(SFActivityNotificationViewController *)self _arrangeAndConfigureTrailingAccessoryView];
    v5 = v7;
  }
}

- (void)_arrangeAndConfigureLeadingAccessoryView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  if (!self->_leadingAccessoryView) {
    double v3 = 24.0;
  }
  [(NSLayoutConstraint *)self->_containerLeadingConstraint setConstant:v3];
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    id v6 = [(UIView *)leadingAccessoryView widthAnchor];
    double v7 = [v6 constraintEqualToConstant:32.0];
    v11[0] = v7;
    uint64_t v8 = [(UIView *)self->_leadingAccessoryView heightAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:32.0];
    v11[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [v5 activateConstraints:v10];

    [(UIStackView *)self->_containerStackView insertArrangedSubview:self->_leadingAccessoryView atIndex:0];
  }
}

- (void)_arrangeAndConfigureTrailingAccessoryView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  if (!self->_trailingAccessoryView) {
    double v3 = 24.0;
  }
  [(NSLayoutConstraint *)self->_containerTrailingContraint setConstant:v3];
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    id v6 = [(UIView *)trailingAccessoryView widthAnchor];
    double v7 = [v6 constraintEqualToConstant:32.0];
    v11[0] = v7;
    uint64_t v8 = [(UIView *)self->_trailingAccessoryView heightAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:32.0];
    v11[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [v5 activateConstraints:v10];

    [(UIStackView *)self->_containerStackView addArrangedSubview:self->_trailingAccessoryView];
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_containerTrailingContraint, 0);
  objc_storeStrong((id *)&self->_containerLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_containerStackView, 0);
}

@end