@interface RTTUIRecentMessageViewController
+ (id)viewControllerForCall:(id)a3;
- (BOOL)_canShowWhileLocked;
- (RTTConversation)conversation;
- (RTTUtterance)currentUtterance;
- (TUCall)call;
- (id)contactDisplayImage;
- (id)contactDisplayString;
- (id)currentContactPath;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_scrollToBottomIfNecessary;
- (void)addTranscriptionText:(id)a3 isNew:(BOOL)a4;
- (void)addUtterance:(id)a3;
- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4;
- (void)didSendString:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)setCall:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentUtterance:(id)a3;
- (void)setupUI;
- (void)updateContactUI;
- (void)updateMessageUI;
- (void)updateVoiceOverAnnouncement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RTTUIRecentMessageViewController

+ (id)viewControllerForCall:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RTTUIRecentMessageViewController);
  v5 = +[RTTUIConversationControllerCoordinator sharedInstance];
  [v5 addRecentMessageController:v4];

  [(RTTUIRecentMessageViewController *)v4 setCall:v3];
  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RTTUIRecentMessageViewController;
  [(RTTUIRecentMessageViewController *)&v6 viewDidLoad];
  [(RTTUIRecentMessageViewController *)self setupUI];
  id v3 = [(RTTUIRecentMessageViewController *)self view];
  [v3 setAccessibilityContainerType:4];

  v4 = [(RTTUIRecentMessageViewController *)self view];
  v5 = ttyLocString();
  [v4 setAccessibilityLabel:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT recent message controller will appear: %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)RTTUIRecentMessageViewController;
  [(RTTUIRecentMessageViewController *)&v10 viewWillAppear:v3];
  objc_super v6 = [MEMORY[0x263F62AE8] sharedInstance];
  [v6 setShouldSuppressIncomingNotification:1];

  v7 = [MEMORY[0x263F62AE8] sharedInstance];
  v8 = [(RTTUIRecentMessageViewController *)self call];
  v9 = [v8 callUUID];
  [v7 setViewControllerIsVisible:1 withCallID:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RTTUIRecentMessageViewController;
  [(RTTUIRecentMessageViewController *)&v4 viewDidAppear:a3];
  [(UITableView *)self->_recentMessageTableView reloadData];
  [(RTTUIRecentMessageViewController *)self _scrollToBottomIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT recent message controller will disappear: %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)RTTUIRecentMessageViewController;
  [(RTTUIRecentMessageViewController *)&v10 viewWillDisappear:v3];
  objc_super v6 = [MEMORY[0x263F62AE8] sharedInstance];
  [v6 setShouldSuppressIncomingNotification:0];

  v7 = [MEMORY[0x263F62AE8] sharedInstance];
  v8 = [(RTTUIRecentMessageViewController *)self call];
  v9 = [v8 callUUID];
  [v7 setViewControllerIsVisible:0 withCallID:v9];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupUI
{
  v85[2] = *MEMORY[0x263EF8340];
  v82 = [MEMORY[0x263F1C480] effectWithBlurRadius:100.0];
  v83[2] = xmmword_222994C9C;
  v83[3] = unk_222994CAC;
  v83[4] = xmmword_222994CBC;
  v83[0] = xmmword_222994C7C;
  v83[1] = unk_222994C8C;
  v81 = [MEMORY[0x263F1C558] _colorEffectCAMatrix:v83];
  BOOL v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:0];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v85[0] = v81;
  v85[1] = v82;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:2];
  [(UIVisualEffectView *)self->_backgroundView setBackgroundEffects:v5];

  objc_super v6 = [(UIVisualEffectView *)self->_backgroundView layer];
  [v6 setCornerRadius:16.0];

  [(UIVisualEffectView *)self->_backgroundView setClipsToBounds:1];
  [(UIVisualEffectView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(RTTUIRecentMessageViewController *)self view];
  [v7 addSubview:self->_backgroundView];

  v8 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
  mainStackView = self->_mainStackView;
  self->_mainStackView = v8;

  [(UIStackView *)self->_mainStackView setAxis:1];
  [(UIStackView *)self->_mainStackView setSpacing:8.0];
  [(UIStackView *)self->_mainStackView setLayoutMarginsRelativeArrangement:1];
  -[UIStackView setLayoutMargins:](self->_mainStackView, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  [(UIStackView *)self->_mainStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v10 = [(RTTUIRecentMessageViewController *)self view];
  [v10 addSubview:self->_mainStackView];

  v11 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
  contactImageAndNameView = self->_contactImageAndNameView;
  self->_contactImageAndNameView = v11;

  [(UIStackView *)self->_contactImageAndNameView setAxis:0];
  [(UIStackView *)self->_contactImageAndNameView setSpacing:8.0];
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_contactImageAndNameView];
  uint64_t v13 = (UITableView *)objc_alloc_init(MEMORY[0x263F1CA40]);
  recentMessageTableView = self->_recentMessageTableView;
  self->_recentMessageTableView = v13;

  [(UITableView *)self->_recentMessageTableView setShowsVerticalScrollIndicator:0];
  [(UITableView *)self->_recentMessageTableView setSeparatorStyle:0];
  [(UITableView *)self->_recentMessageTableView setBackgroundColor:0];
  [(UITableView *)self->_recentMessageTableView setDataSource:self];
  [(UITableView *)self->_recentMessageTableView setDelegate:self];
  v15 = self->_recentMessageTableView;
  uint64_t v16 = objc_opt_class();
  v17 = +[RTTUIRecentMessageCell reuseIdentifier];
  [(UITableView *)v15 registerClass:v16 forCellReuseIdentifier:v17];

  v80 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v80 lineHeight];
  double v19 = v18;
  [v80 pointSize];
  double v21 = (v19 - v20) * 0.5;
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_recentMessageTableView];
  id v22 = objc_alloc(MEMORY[0x263F1C6D0]);
  v23 = [MEMORY[0x263F1C6B0] systemImageNamed:@"teletype"];
  v24 = [MEMORY[0x263F1C550] systemWhiteColor];
  v25 = [v23 imageWithTintColor:v24 renderingMode:1];
  v26 = (void *)[v22 initWithImage:v25];

  v27 = v26;
  [v26 setContentMode:1];
  [v26 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  [v26 setMaximumContentSizeCategory:*MEMORY[0x263F1D160]];
  v28 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D308]];
  [v27 setPreferredSymbolConfiguration:v28];

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 setIsAccessibilityElement:1];
  [v27 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v29 = ttyLocString();
  [v27 setAccessibilityLabel:v29];

  v30 = [(RTTUIRecentMessageViewController *)self view];
  [v30 addSubview:v27];

  [(RTTUIRecentMessageViewController *)self updateContactUI];
  [(RTTUIRecentMessageViewController *)self updateMessageUI];
  v61 = (void *)MEMORY[0x263F08938];
  v78 = [(UIStackView *)self->_mainStackView topAnchor];
  v79 = [(RTTUIRecentMessageViewController *)self view];
  v77 = [v79 topAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v84[0] = v76;
  v74 = [(UIStackView *)self->_mainStackView leadingAnchor];
  v75 = [(RTTUIRecentMessageViewController *)self view];
  v73 = [v75 leadingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v84[1] = v72;
  v70 = [(UIStackView *)self->_mainStackView bottomAnchor];
  v71 = [(RTTUIRecentMessageViewController *)self view];
  v69 = [v71 bottomAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v84[2] = v68;
  v66 = [(UIStackView *)self->_mainStackView trailingAnchor];
  v67 = [(RTTUIRecentMessageViewController *)self view];
  v65 = [v67 trailingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v84[3] = v64;
  v63 = [(UILabel *)self->_contactNameLabel widthAnchor];
  v62 = [(UIStackView *)self->_mainStackView widthAnchor];
  v60 = [v63 constraintLessThanOrEqualToAnchor:v62 multiplier:0.75];
  v84[4] = v60;
  v59 = [(UITableView *)self->_recentMessageTableView heightAnchor];
  v58 = [v59 constraintEqualToConstant:v21 * 3.0 + v19 * 4.0];
  v84[5] = v58;
  v56 = [(UIVisualEffectView *)self->_backgroundView topAnchor];
  v57 = [(RTTUIRecentMessageViewController *)self view];
  v55 = [v57 topAnchor];
  v53 = [v56 constraintEqualToAnchor:v55];
  v84[6] = v53;
  v51 = [(UIVisualEffectView *)self->_backgroundView leadingAnchor];
  v52 = [(RTTUIRecentMessageViewController *)self view];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v84[7] = v49;
  v47 = [(UIVisualEffectView *)self->_backgroundView bottomAnchor];
  v48 = [(RTTUIRecentMessageViewController *)self view];
  v46 = [v48 bottomAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v84[8] = v45;
  v43 = [(UIVisualEffectView *)self->_backgroundView trailingAnchor];
  v44 = [(RTTUIRecentMessageViewController *)self view];
  v42 = [v44 trailingAnchor];
  v31 = [v43 constraintEqualToAnchor:v42];
  v84[9] = v31;
  v32 = v27;
  v54 = v27;
  v33 = [v27 topAnchor];
  v34 = [(RTTUIRecentMessageViewController *)self view];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:12.0];
  v84[10] = v36;
  v37 = [v32 trailingAnchor];
  v38 = [(RTTUIRecentMessageViewController *)self view];
  v39 = [v38 trailingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:-16.0];
  v84[11] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:12];
  [v61 activateConstraints:v41];
}

- (void)updateMessageUI
{
  v38[1] = *MEMORY[0x263EF8340];
  [(RTTUIRecentMessageViewController *)self loadViewIfNeeded];
  BOOL v3 = [(RTTConversation *)self->_conversation utterances];
  uint64_t v4 = [v3 count];

  noMessagesLabel = self->_noMessagesLabel;
  unint64_t v6 = 0x267F84000uLL;
  if (v4)
  {
    [(UILabel *)noMessagesLabel removeFromSuperview];
    v7 = self->_noMessagesLabel;
    self->_noMessagesLabel = 0;
  }
  else
  {
    if (noMessagesLabel) {
      goto LABEL_5;
    }
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    v9 = self->_noMessagesLabel;
    self->_noMessagesLabel = v8;

    objc_super v10 = self->_noMessagesLabel;
    v11 = [MEMORY[0x263F1C550] systemWhiteColor];
    [(UILabel *)v10 setTextColor:v11];

    [(UILabel *)self->_noMessagesLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_noMessagesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v12 = [(UILabel *)v35 fontDescriptor];
    v34 = [v12 fontDescriptorWithSymbolicTraits:1];

    uint64_t v13 = (void *)MEMORY[0x263F1C658];
    [(UILabel *)v35 pointSize];
    v33 = objc_msgSend(v13, "fontWithDescriptor:size:", v34);
    v14 = self->_noMessagesLabel;
    id v15 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v16 = ttyLocString();
    uint64_t v37 = *MEMORY[0x263F1C238];
    v38[0] = v33;
    v17 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    double v18 = (void *)[v15 initWithString:v16 attributes:v17];
    [(UILabel *)v14 setAttributedText:v18];

    [(UITableView *)self->_recentMessageTableView addSubview:self->_noMessagesLabel];
    v28 = (void *)MEMORY[0x263F08938];
    v32 = [(UILabel *)self->_noMessagesLabel centerYAnchor];
    v31 = [(UITableView *)self->_recentMessageTableView centerYAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v36[0] = v30;
    v29 = [(UILabel *)self->_noMessagesLabel centerXAnchor];
    double v19 = [(UITableView *)self->_recentMessageTableView centerXAnchor];
    double v20 = [v29 constraintEqualToAnchor:v19];
    v36[1] = v20;
    double v21 = [(UILabel *)self->_noMessagesLabel leadingAnchor];
    id v22 = [(UITableView *)self->_recentMessageTableView leadingAnchor];
    v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22];
    v36[2] = v23;
    v24 = [(UILabel *)self->_noMessagesLabel trailingAnchor];
    v25 = [(UITableView *)self->_recentMessageTableView trailingAnchor];
    v26 = [v24 constraintLessThanOrEqualToAnchor:v25];
    v36[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
    [v28 activateConstraints:v27];

    unint64_t v6 = 0x267F84000;
    v7 = v35;
  }

LABEL_5:
  [*(id *)((char *)&self->super.super.super.isa + *(int *)(v6 + 1528)) reloadData];
  [(RTTUIRecentMessageViewController *)self _scrollToBottomIfNecessary];
}

- (void)updateContactUI
{
  v22[2] = *MEMORY[0x263EF8340];
  [(RTTUIRecentMessageViewController *)self loadViewIfNeeded];
  BOOL v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  uint64_t v4 = [(RTTUIRecentMessageViewController *)self contactDisplayImage];
  if (v4)
  {
    contactImageView = self->_contactImageView;
    if (!contactImageView)
    {
      unint64_t v6 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
      v7 = self->_contactImageView;
      self->_contactImageView = v6;

      v8 = (void *)MEMORY[0x263F08938];
      v9 = [(UIImageView *)self->_contactImageView widthAnchor];
      [v3 lineHeight];
      objc_super v10 = objc_msgSend(v9, "constraintEqualToConstant:");
      v22[0] = v10;
      v11 = [(UIImageView *)self->_contactImageView heightAnchor];
      [v3 lineHeight];
      v12 = objc_msgSend(v11, "constraintEqualToConstant:");
      v22[1] = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      [v8 activateConstraints:v13];

      [(UIStackView *)self->_contactImageAndNameView insertArrangedSubview:self->_contactImageView atIndex:0];
      contactImageView = self->_contactImageView;
    }
    [(UIImageView *)contactImageView setImage:v4];
  }
  contactNameLabel = self->_contactNameLabel;
  if (!contactNameLabel)
  {
    id v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    uint64_t v16 = self->_contactNameLabel;
    self->_contactNameLabel = v15;

    v17 = self->_contactNameLabel;
    double v18 = [MEMORY[0x263F1C550] systemWhiteColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)self->_contactNameLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_contactNameLabel setFont:v3];
    [(UILabel *)self->_contactNameLabel setNumberOfLines:1];
    [(UIStackView *)self->_contactImageAndNameView addArrangedSubview:self->_contactNameLabel];
    contactImageAndNameView = self->_contactImageAndNameView;
    double v20 = objc_opt_new();
    [(UIStackView *)contactImageAndNameView addArrangedSubview:v20];

    contactNameLabel = self->_contactNameLabel;
  }
  if ([(TUCall *)self->_call isEmergency]) {
    ttyLocString();
  }
  else {
  double v21 = [(RTTUIRecentMessageViewController *)self contactDisplayString];
  }
  [(UILabel *)contactNameLabel setText:v21];
}

- (void)setCall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (TUCall *)a3;
  if (!self->_conversation)
  {
    v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "%@: No initial conversation, requesting conversation: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    unint64_t v6 = (void *)MEMORY[0x263F62AD8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__RTTUIRecentMessageViewController_setCall___block_invoke;
    v11[3] = &unk_264638798;
    objc_copyWeak(&v12, (id *)buf);
    [v6 conversationWithCall:v4 withCallback:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  call = self->_call;
  self->_call = v4;
  v8 = v4;

  v9 = +[RTTUIConversationControllerCoordinator sharedInstance];
  objc_super v10 = [(TUCall *)v8 callUUID];

  [v9 registerForCallUpdates:v10];
}

void __44__RTTUIRecentMessageViewController_setCall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

  objc_destroyWeak(&v5);
}

void __44__RTTUIRecentMessageViewController_setCall___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConversation:v2];

  id v5 = objc_loadWeakRetained(v3);
  [v5 updateContactUI];

  id v6 = objc_loadWeakRetained(v3);
  [v6 updateMessageUI];

  v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_loadWeakRetained(v3);
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_222978000, v7, OS_LOG_TYPE_INFO, "%@ Received conversation: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)contactDisplayString
{
  id v3 = [(RTTUIRecentMessageViewController *)self call];
  id v4 = [v3 displayName];

  if (![v4 length])
  {
    id v5 = (void *)MEMORY[0x263EFEA20];
    id v6 = (void *)MEMORY[0x263EFE9F8];
    v7 = [(RTTUIRecentMessageViewController *)self conversation];
    id v8 = [v7 otherContactPath];
    uint64_t v9 = [v6 contactForPhoneNumber:v8];
    uint64_t v10 = [v5 stringFromContact:v9 style:0];

    id v4 = (void *)v10;
  }
  if (![v4 length])
  {
    id v11 = [(RTTUIRecentMessageViewController *)self conversation];
    uint64_t v12 = [v11 otherContactPath];

    id v4 = (void *)v12;
  }
  return v4;
}

- (id)contactDisplayImage
{
  if ([(TUCall *)self->_call isEmergency])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithType:@"com.apple.graphic-icon.emergency-sos"];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 16.0, 16.0, 3.0);
    id v5 = [v3 prepareImageForDescriptor:v4];
    id v6 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:", objc_msgSend(v5, "CGImage"));

LABEL_6:
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x263EFE9F8];
  id v8 = [(RTTUIRecentMessageViewController *)self conversation];
  uint64_t v9 = [v8 otherContactPath];
  id v3 = [v7 contactForPhoneNumber:v9];

  if ([v3 imageDataAvailable])
  {
    uint64_t v10 = [v3 thumbnailImageData];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x263F1C6B0]);
      id v4 = [v3 thumbnailImageData];
      id v6 = (void *)[v11 initWithData:v4];
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)currentContactPath
{
  id v3 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  id v4 = [(RTTUIRecentMessageViewController *)self call];
  id v5 = [v3 contactPathForCall:v4];

  return v5;
}

- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412802;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_222978000, v8, OS_LOG_TYPE_INFO, "%@ TTY receive |%@|=%@", (uint8_t *)&v25, 0x20u);
  }

  uint64_t v9 = [(RTTUIRecentMessageViewController *)self conversation];
  uint64_t v10 = [v9 lastUtteranceForMe:0];

  uint64_t v11 = [v10 text];
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [v10 text];
  uint64_t v14 = [v13 stringByAppendingString:v6];
  int v15 = [v7 isEqualToString:v14];

  if (v15)
  {
    [v10 updateText:v7];
    uint64_t v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [v10 text];
      int v25 = 138413058;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2112;
      v32 = v10;
      double v18 = "%@ total utterance: %@, utterance text: %@, updated: %@";
      double v19 = v16;
      uint32_t v20 = 42;
      goto LABEL_13;
    }
  }
  else
  {
LABEL_7:
    double v21 = [(RTTUIRecentMessageViewController *)self conversation];
    uint64_t v16 = [v21 appendStringFromOtherContactPath:v6];

    id v22 = AXLogRTT();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412802;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v6;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_222978000, v22, OS_LOG_TYPE_INFO, "%@ Append utterance: %@ -> %@", (uint8_t *)&v25, 0x20u);
    }

    if (v7)
    {
      v23 = [v16 text];
      char v24 = [v23 isEqualToString:v7];

      if ((v24 & 1) == 0)
      {
        [v16 updateText:v7];
        uint64_t v17 = AXLogRTT();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
LABEL_14:

          goto LABEL_15;
        }
        int v25 = 138412546;
        v26 = self;
        __int16 v27 = 2112;
        v28 = v16;
        double v18 = "%@ updated utterance: %@";
        double v19 = v17;
        uint32_t v20 = 22;
LABEL_13:
        _os_log_impl(&dword_222978000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v25, v20);
        goto LABEL_14;
      }
    }
  }
LABEL_15:

  [(RTTUIRecentMessageViewController *)self updateVoiceOverAnnouncement:v6];
  [(RTTUIRecentMessageViewController *)self updateMessageUI];
}

- (void)didSendString:(id)a3
{
  id v9 = a3;
  id v4 = [(RTTUIRecentMessageViewController *)self conversation];
  id v5 = [v4 lastUtteranceForMe:1];

  if (!v5 || ([v5 hasTimedOut] & 1) != 0 || (objc_msgSend(v5, "isComplete") & 1) != 0)
  {
    id v6 = (void *)MEMORY[0x263F62B08];
    v7 = ttyLocString();
    id v8 = [v6 utteranceWithContactPath:v7 andText:v9];

    [(RTTConversation *)self->_conversation addUtterance:v8];
  }
  else
  {
    [v5 updateText:v9];
  }
  [(RTTUIRecentMessageViewController *)self updateMessageUI];
}

- (void)addUtterance:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTUIRecentMessageViewController *)self conversation];
  [v5 addUtterance:v4];

  id v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_222978000, v6, OS_LOG_TYPE_INFO, "%@ Adding utterance: %@ ", (uint8_t *)&v7, 0x16u);
  }

  [(RTTUIRecentMessageViewController *)self updateMessageUI];
}

- (void)addTranscriptionText:(id)a3 isNew:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(RTTUIRecentMessageViewController *)self conversation];
  id v8 = v7;
  if (v4) {
    id v9 = (id)[v7 addTranscriptionFromOtherContactPath:v6];
  }
  else {
    id v10 = (id)[v7 updateTranscriptionFromOtherContactPath:v6];
  }

  uint64_t v11 = AXLogRTT();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_222978000, v11, OS_LOG_TYPE_INFO, "%@ Adding transcription: %@", (uint8_t *)&v12, 0x16u);
  }

  [(RTTUIRecentMessageViewController *)self updateMessageUI];
}

- (void)updateVoiceOverAnnouncement:(id)a3
{
  id v4 = a3;
  voAnnouncementTimer = self->_voAnnouncementTimer;
  if (!voAnnouncementTimer)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    int v7 = (AXDispatchTimer *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    id v8 = self->_voAnnouncementTimer;
    self->_voAnnouncementTimer = v7;

    id v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    voAnnouncementBuffer = self->_voAnnouncementBuffer;
    self->_voAnnouncementBuffer = v9;

    voAnnouncementTimer = self->_voAnnouncementTimer;
  }
  [(AXDispatchTimer *)voAnnouncementTimer cancel];
  if ([v4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 8)
  {
    if ([(NSMutableString *)self->_voAnnouncementBuffer length]) {
      -[NSMutableString deleteCharactersInRange:](self->_voAnnouncementBuffer, "deleteCharactersInRange:", [(NSMutableString *)self->_voAnnouncementBuffer length] - 1, 1);
    }
  }
  else
  {
    [(NSMutableString *)self->_voAnnouncementBuffer appendString:v4];
  }
  uint64_t v11 = [(NSMutableString *)self->_voAnnouncementBuffer trimmedString];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = self->_voAnnouncementTimer;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__RTTUIRecentMessageViewController_updateVoiceOverAnnouncement___block_invoke;
    v14[3] = &unk_264638690;
    v14[4] = self;
    [(AXDispatchTimer *)v13 afterDelay:v14 processBlock:4.0];
  }
}

void __64__RTTUIRecentMessageViewController_updateVoiceOverAnnouncement___block_invoke(uint64_t a1)
{
  id argument = [MEMORY[0x263F21660] stringWithString:*(void *)(*(void *)(a1 + 32) + 984)];
  [argument setAttribute:&unk_26D522898 forKey:*MEMORY[0x263F216D8]];
  [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F218B8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  [*(id *)(*(void *)(a1 + 32) + 984) setString:&stru_26D51E848];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(RTTConversation *)self->_conversation utterances];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[RTTUIRecentMessageCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  unint64_t v10 = [v6 row];
  uint64_t v11 = [(RTTConversation *)self->_conversation utterances];
  unint64_t v12 = [v11 count];

  if (v10 < v12)
  {
    uint64_t v13 = [(RTTConversation *)self->_conversation utterances];
    __int16 v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));

    if (![v6 row]) {
      goto LABEL_5;
    }
    id v15 = [(RTTConversation *)self->_conversation utterances];
    uint64_t v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row") - 1);
    int v17 = [v16 isMe];
    int v18 = [v14 isMe];

    if (v17 != v18) {
      goto LABEL_5;
    }
    if (!UIAccessibilityIsVoiceOverRunning()) {
      BOOL ShouldDifferentiateWithoutColor = UIAccessibilityShouldDifferentiateWithoutColor();
    }
    else {
LABEL_5:
    }
      BOOL ShouldDifferentiateWithoutColor = 1;
    uint32_t v20 = [(RTTUIRecentMessageViewController *)self contactDisplayString];
    [v9 configureWithUtterance:v14 needsPrefix:ShouldDifferentiateWithoutColor otherContactDisplayName:v20];
  }
  return v9;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_msgSend(MEMORY[0x263EFF910], "date", a3, a4);
  self->_lastUserScroll = (NSDate *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x270F9A758]();
}

- (void)_scrollToBottomIfNecessary
{
  id v11 = [(RTTConversation *)self->_conversation utterances];
  if ([v11 count])
  {
    [(UITableView *)self->_recentMessageTableView contentSize];
    double v4 = v3;
    [(UITableView *)self->_recentMessageTableView frame];
    if (v4 > v5)
    {
      lastUserScroll = self->_lastUserScroll;
      if (lastUserScroll)
      {
        [(NSDate *)lastUserScroll timeIntervalSinceNow];
        double v8 = fabs(v7);

        if (v8 <= 3.0) {
          return;
        }
      }
      else
      {
      }
      id v9 = (void *)MEMORY[0x263F088C8];
      unint64_t v10 = [(RTTConversation *)self->_conversation utterances];
      objc_msgSend(v9, "indexPathForRow:inSection:", objc_msgSend(v10, "count") - 1, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [(UITableView *)self->_recentMessageTableView scrollToRowAtIndexPath:v11 atScrollPosition:3 animated:1];
    }
  }
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (RTTUtterance)currentUtterance
{
  return self->_currentUtterance;
}

- (void)setCurrentUtterance:(id)a3
{
}

- (TUCall)call
{
  return self->_call;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_currentUtterance, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_noMessagesLabel, 0);
  objc_storeStrong((id *)&self->_recentMessageTableView, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
  objc_storeStrong((id *)&self->_contactImageAndNameView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_lastUserScroll, 0);
  objc_storeStrong((id *)&self->_voAnnouncementBuffer, 0);
  objc_storeStrong((id *)&self->_voAnnouncementTimer, 0);
}

@end