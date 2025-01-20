@interface ICQInternetPrivacySheet
- (BOOL)_deviceIsiPad;
- (ICQInternetPrivacySheet)initWithIdentifier:(id)a3 viewModel:(id)a4;
- (ICQInternetPrivacyViewModel)viewModel;
- (NSString)bodyText;
- (NSString)headerText;
- (UIImageView)iconView;
- (UILabel)bodyLabel;
- (UILabel)heaerLabel;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (id)createTextViewWithText:(id)a3;
- (void)addBodyText;
- (void)addHeaderIcon;
- (void)addHeaderText;
- (void)doneButtonTapped:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setHeaerLabel:(id)a3;
- (void)setIconView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTextForIdentifier:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setupScrollView;
- (void)setupStack;
- (void)setupUI;
- (void)viewDidLoad;
@end

@implementation ICQInternetPrivacySheet

- (ICQInternetPrivacySheet)initWithIdentifier:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICQInternetPrivacySheet;
  v8 = [(ICQInternetPrivacySheet *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_viewModel, v7);
    [(ICQInternetPrivacySheet *)v9 setTextForIdentifier:v6];
  }

  return v9;
}

- (void)setTextForIdentifier:(id)a3
{
  id v17 = a3;
  if ([v17 isEqualToString:@"com.apple.icloud.privaterelay.learnmoresubscriber"])
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_SUBSCRIBER_HEADER" value:&stru_26DFF2C90 table:@"Localizable"];
    [(ICQInternetPrivacySheet *)self setHeaderText:v5];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_SUBSCRIBER_BODY" value:&stru_26DFF2C90 table:@"Localizable"];
LABEL_5:
    v10 = (void *)v7;
    [(ICQInternetPrivacySheet *)self setBodyText:v7];
LABEL_6:

    goto LABEL_7;
  }
  if ([v17 isEqualToString:@"com.apple.icloud.privaterelay.learnmoreunsupportednetwork"])
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_NETWORK_HEADER" value:&stru_26DFF2C90 table:@"Localizable"];
    [(ICQInternetPrivacySheet *)self setHeaderText:v9];

    id v6 = [(ICQInternetPrivacySheet *)self viewModel];
    uint64_t v7 = [v6 internetPrivacyLearnMoreMessage];
    goto LABEL_5;
  }
  if ([v17 isEqualToString:@"com.apple.icloud.privaterelay.learnmoreunsupportedregion"])
  {
    objc_super v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_REGION_HEADER" value:&stru_26DFF2C90 table:@"Localizable"];
    [(ICQInternetPrivacySheet *)self setHeaderText:v12];

    v13 = NSString;
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v6 localizedStringForKey:@"INTERNET_PRIVACY_LEARN_MORE_REGION_BODY" value:&stru_26DFF2C90 table:@"Localizable"];
    v14 = [(ICQInternetPrivacySheet *)self viewModel];
    v15 = [v14 country];
    v16 = objc_msgSend(v13, "stringWithFormat:", v10, v15);
    [(ICQInternetPrivacySheet *)self setBodyText:v16];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICQInternetPrivacySheet;
  [(ICQInternetPrivacySheet *)&v3 viewDidLoad];
  [(ICQInternetPrivacySheet *)self setupUI];
}

- (void)setupUI
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
  v4 = [(ICQInternetPrivacySheet *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(ICQInternetPrivacySheet *)self view];
  id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v5 setBackgroundColor:v6];

  [(ICQInternetPrivacySheet *)self setupScrollView];
  [(ICQInternetPrivacySheet *)self setupStack];
  [(ICQInternetPrivacySheet *)self addHeaderIcon];
  [(ICQInternetPrivacySheet *)self addHeaderText];
  [(ICQInternetPrivacySheet *)self addBodyText];
}

- (void)setupScrollView
{
  v24[4] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v3, "setContentInset:", 25.0, 0.0, 40.0, 0.0);
  v4 = [(ICQInternetPrivacySheet *)self view];
  [v4 addSubview:v3];

  v15 = (void *)MEMORY[0x263F08938];
  v22 = [v3 leadingAnchor];
  v23 = [(ICQInternetPrivacySheet *)self view];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v18 = [v3 trailingAnchor];
  v19 = [(ICQInternetPrivacySheet *)self view];
  id v17 = [v19 trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v16;
  v13 = [v3 topAnchor];
  v14 = [(ICQInternetPrivacySheet *)self view];
  v5 = [v14 safeAreaLayoutGuide];
  id v6 = [v5 topAnchor];
  uint64_t v7 = [v13 constraintEqualToAnchor:v6];
  v24[2] = v7;
  v8 = [v3 bottomAnchor];
  v9 = [(ICQInternetPrivacySheet *)self view];
  v10 = [v9 bottomAnchor];
  objc_super v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
  [v15 activateConstraints:v12];

  [(ICQInternetPrivacySheet *)self setScrollView:v3];
}

- (void)setupStack
{
  v29[5] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  [v3 setAxis:1];
  BOOL v4 = [(ICQInternetPrivacySheet *)self _deviceIsiPad];
  double v5 = 25.0;
  if (v4) {
    double v5 = 30.0;
  }
  [v3 setSpacing:v5];
  [v3 setAlignment:3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(ICQInternetPrivacySheet *)self scrollView];
  [v6 addSubview:v3];

  v20 = (void *)MEMORY[0x263F08938];
  v27 = [v3 leadingAnchor];
  v28 = [(ICQInternetPrivacySheet *)self scrollView];
  v26 = [v28 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v23 = [v3 trailingAnchor];
  v24 = [(ICQInternetPrivacySheet *)self scrollView];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v21;
  v18 = [v3 topAnchor];
  v19 = [(ICQInternetPrivacySheet *)self scrollView];
  id v17 = [v19 topAnchor];
  v16 = [v18 constraintGreaterThanOrEqualToAnchor:v17];
  v29[2] = v16;
  v15 = [v3 bottomAnchor];
  uint64_t v7 = [(ICQInternetPrivacySheet *)self scrollView];
  v8 = [v7 bottomAnchor];
  v9 = [v15 constraintLessThanOrEqualToAnchor:v8];
  v29[3] = v9;
  v10 = [v3 widthAnchor];
  objc_super v11 = [(ICQInternetPrivacySheet *)self scrollView];
  v12 = [v11 widthAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v29[4] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:5];
  [v20 activateConstraints:v14];

  [(ICQInternetPrivacySheet *)self setStackView:v3];
}

- (void)addHeaderIcon
{
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  BOOL v4 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"PrivateRelayLargeIcon"];
  id v6 = (id)[v3 initWithImage:v4];

  double v5 = [(ICQInternetPrivacySheet *)self stackView];
  [v5 addArrangedSubview:v6];

  [(ICQInternetPrivacySheet *)self setIconView:v6];
}

- (id)createTextViewWithText:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  [v5 setText:v4];

  [v5 setTextAlignment:1];
  [v5 setScrollEnabled:0];
  [v5 setEditable:0];
  BOOL v6 = [(ICQInternetPrivacySheet *)self _deviceIsiPad];
  double v7 = 20.0;
  if (v6) {
    double v7 = 40.0;
  }
  objc_msgSend(v5, "setTextContainerInset:", 0.0, v7, 0.0, v7);
  return v5;
}

- (void)addHeaderText
{
  id v3 = [(ICQInternetPrivacySheet *)self headerText];
  id v8 = [(ICQInternetPrivacySheet *)self createTextViewWithText:v3];

  id v4 = [MEMORY[0x263F81708] systemFontOfSize:34.0 weight:*MEMORY[0x263F81800]];
  double v5 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835E0]];
  BOOL v6 = [v5 scaledFontForFont:v4];
  [v8 setFont:v6];

  double v7 = [(ICQInternetPrivacySheet *)self stackView];
  [v7 addArrangedSubview:v8];
}

- (void)addBodyText
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = [(ICQInternetPrivacySheet *)self bodyText];
  id v4 = [(ICQInternetPrivacySheet *)self createTextViewWithText:v3];

  double v5 = objc_opt_new();
  [v5 setParagraphSpacing:25.0];
  [v5 setAlignment:1];
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  double v7 = [(ICQInternetPrivacySheet *)self bodyText];
  id v8 = (void *)[v6 initWithString:v7];

  v13[0] = *MEMORY[0x263F81500];
  v9 = [MEMORY[0x263F825C8] labelColor];
  v14[0] = v9;
  v13[1] = *MEMORY[0x263F814F0];
  v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v13[2] = *MEMORY[0x263F81540];
  v14[1] = v10;
  v14[2] = v5;
  objc_super v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  objc_msgSend(v8, "addAttributes:range:", v11, 0, objc_msgSend(v8, "length"));

  [v4 setAttributedText:v8];
  v12 = [(ICQInternetPrivacySheet *)self stackView];
  [v12 addArrangedSubview:v4];
}

- (void)doneButtonTapped:(id)a3
{
}

- (BOOL)_deviceIsiPad
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (UILabel)heaerLabel
{
  return self->_heaerLabel;
}

- (void)setHeaerLabel:(id)a3
{
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (ICQInternetPrivacyViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (ICQInternetPrivacyViewModel *)WeakRetained;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_heaerLabel, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end