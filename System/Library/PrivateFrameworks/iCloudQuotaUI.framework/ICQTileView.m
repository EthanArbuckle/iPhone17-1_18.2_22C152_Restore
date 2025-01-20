@interface ICQTileView
+ (BOOL)shouldShowForPremiumOffer:(id)a3;
- (BOOL)_launchFlowManagerWithLink:(id)a3;
- (BOOL)handleActionFromLink:(id)a3;
- (ICQAsyncImageView)iconImageView;
- (ICQPremiumButton)dismissButton;
- (ICQPremiumButton)primaryButton;
- (ICQPremiumButton)secondaryButton;
- (ICQPremiumOffer)premiumOffer;
- (ICQTileView)initWithPremiumOffer:(id)a3;
- (NSLayoutConstraint)titleLabelDismissButtonSpacingConstraint;
- (NSLayoutConstraint)titleLabelTrailingConstraint;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)actionButtonsStack;
- (UIView)separator;
- (_ICQOpportunityBubbleReportingSpecification)reportingDetails;
- (id)attributedText;
- (id)createLabelWithText:(id)a3;
- (id)detailAttributedText;
- (void)_startOnDeviceJourneyForSystemUpgrade;
- (void)actionButtonTapped:(id)a3;
- (void)configureSubviews;
- (void)createActionButtons;
- (void)createActionButtonsStack;
- (void)createButtonsFromBubbleDetails:(id)a3;
- (void)createOrUpdateImageViewFromImageDetails:(id)a3;
- (void)createOrUpdateMessageLabelWithMessage:(id)a3;
- (void)createOrUpdateTitleLabelWithTitle:(id)a3;
- (void)createSeparator;
- (void)dismissButtonTapped:(id)a3;
- (void)setActionButtonsStack:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setPremiumOffer:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setReportingDetails:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelDismissButtonSpacingConstraint:(id)a3;
- (void)setTitleLabelTrailingConstraint:(id)a3;
- (void)updateDismissButtonWithAction:(id)a3;
- (void)updatePrimaryButtonWithAction:(id)a3;
- (void)updateSecondaryButtonWithAction:(id)a3;
- (void)updateTileViewWithOffer:(id)a3;
@end

@implementation ICQTileView

+ (BOOL)shouldShowForPremiumOffer:(id)a3
{
  return 0;
}

- (ICQTileView)initWithPremiumOffer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQTileView;
  v5 = [(ICQTileView *)&v13 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  [(ICQTileView *)v5 configureSubviews];
  if (v4)
  {
    [(ICQTileView *)v6 setPremiumOffer:v4];
    v7 = [v4 opportunityBubble];
    v8 = [v7 reportingDetails];
    [(ICQTileView *)v6 setReportingDetails:v8];

    [(ICQTileView *)v6 _startOnDeviceJourneyForSystemUpgrade];
LABEL_4:
    v9 = v6;
    goto LABEL_8;
  }
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to initialize ICQTileView with a nil offer", v12, 2u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_startOnDeviceJourneyForSystemUpgrade
{
  v3 = [(ICQTileView *)self reportingDetails];
  if ([v3 displayRuleType] == 1)
  {
    id v4 = [(ICQTileView *)self premiumOffer];
    int v5 = [v4 shouldStartOnDeviceJourney];

    if (v5)
    {
      v6 = (void *)MEMORY[0x263F888E8];
      v7 = [(ICQTileView *)self premiumOffer];
      v8 = [v7 bundleIdentifier];
      [v6 sendEventFor:2 withBundleID:v8 link:0];

      v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        v10 = "Started on-device journey for device that was upgraded to Sky after a Premium offer CFU was seen in Azul device.";
        v11 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = 0;
    v10 = "No need to start on-device journey.";
    v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setPremiumOffer:(id)a3
{
  int v5 = (ICQPremiumOffer *)a3;
  if (self->_premiumOffer != v5)
  {
    objc_storeStrong((id *)&self->_premiumOffer, a3);
    if ([MEMORY[0x263F88930] shouldEnableUnifiedMessaging])
    {
      v6 = (void *)MEMORY[0x263F888E8];
      v7 = [(ICQPremiumOffer *)v5 bundleIdentifier];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __31__ICQTileView_setPremiumOffer___block_invoke;
      v11[3] = &unk_264922500;
      v11[4] = self;
      __int16 v12 = v5;
      [v6 fetchBubbleContentWithBundleID:v7 completion:v11];
    }
    else
    {
      v8 = [(ICQPremiumOffer *)v5 opportunityBubble];
      v9 = [v8 reportingDetails];
      reportingDetails = self->_reportingDetails;
      self->_reportingDetails = v9;

      [(ICQTileView *)self updateTileViewWithOffer:v5];
    }
  }
}

uint64_t __31__ICQTileView_setPremiumOffer___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 584) setOpportunityBubble:a2];
  }
  v3 = [*(id *)(a1 + 40) opportunityBubble];
  uint64_t v4 = [v3 reportingDetails];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 672);
  *(void *)(v5 + 672) = v4;

  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  return [v7 updateTileViewWithOffer:v8];
}

- (void)configureSubviews
{
  v106[22] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [(ICQTileView *)self setBackgroundColor:v3];

  uint64_t v4 = [(ICQTileView *)self layer];
  [v4 setCornerRadius:12.0];

  uint64_t v5 = *MEMORY[0x263F15A20];
  v6 = [(ICQTileView *)self layer];
  [v6 setCornerCurve:v5];

  [(ICQTileView *)self createOrUpdateTitleLabelWithTitle:0];
  [(ICQTileView *)self createOrUpdateMessageLabelWithMessage:0];
  [(ICQTileView *)self createOrUpdateImageViewFromImageDetails:0];
  [(ICQTileView *)self createSeparator];
  [(ICQTileView *)self createActionButtons];
  [(ICQTileView *)self createActionButtonsStack];
  v7 = [(ICQTileView *)self titleLabel];
  uint64_t v8 = [v7 trailingAnchor];
  v9 = [(ICQTileView *)self trailingAnchor];
  v10 = [v8 constraintLessThanOrEqualToAnchor:v9 constant:-14.0];
  titleLabelTrailingConstraint = self->_titleLabelTrailingConstraint;
  self->_titleLabelTrailingConstraint = v10;

  LODWORD(v12) = 1144750080;
  [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setPriority:v12];
  __int16 v13 = [(ICQTileView *)self titleLabel];
  v14 = [v13 trailingAnchor];
  v15 = [(ICQTileView *)self dismissButton];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintLessThanOrEqualToAnchor:v16 constant:-10.0];
  titleLabelDismissButtonSpacingConstraint = self->_titleLabelDismissButtonSpacingConstraint;
  self->_titleLabelDismissButtonSpacingConstraint = v17;

  LODWORD(v19) = 1144913920;
  [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setPriority:v19];
  v71 = (void *)MEMORY[0x263F08938];
  v105 = [(ICQTileView *)self iconImageView];
  v104 = [v105 leadingAnchor];
  v103 = [(ICQTileView *)self leadingAnchor];
  v102 = [v104 constraintEqualToAnchor:v103 constant:14.0];
  v106[0] = v102;
  v101 = [(ICQTileView *)self iconImageView];
  v99 = [v101 topAnchor];
  v100 = [(ICQTileView *)self messageLabel];
  v98 = [v100 topAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v106[1] = v97;
  v96 = [(ICQTileView *)self iconImageView];
  v95 = [v96 widthAnchor];
  v94 = [v95 constraintEqualToConstant:60.0];
  v106[2] = v94;
  v93 = [(ICQTileView *)self iconImageView];
  v92 = [v93 heightAnchor];
  v91 = [v92 constraintEqualToConstant:60.0];
  v106[3] = v91;
  v90 = [(ICQTileView *)self titleLabel];
  v88 = [v90 leadingAnchor];
  v89 = [(ICQTileView *)self iconImageView];
  v87 = [v89 trailingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87 constant:10.0];
  v106[4] = v86;
  v85 = [(ICQTileView *)self titleLabel];
  v84 = [v85 topAnchor];
  v83 = [(ICQTileView *)self topAnchor];
  v82 = [v84 constraintEqualToAnchor:v83 constant:14.0];
  v20 = self->_titleLabelTrailingConstraint;
  v106[5] = v82;
  v106[6] = v20;
  v106[7] = self->_titleLabelDismissButtonSpacingConstraint;
  v81 = [(ICQTileView *)self messageLabel];
  v79 = [v81 leadingAnchor];
  v80 = [(ICQTileView *)self titleLabel];
  v78 = [v80 leadingAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v106[8] = v77;
  v76 = [(ICQTileView *)self messageLabel];
  v74 = [v76 topAnchor];
  v75 = [(ICQTileView *)self titleLabel];
  v73 = [v75 bottomAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 constant:5.0];
  v106[9] = v72;
  v70 = [(ICQTileView *)self messageLabel];
  v69 = [v70 trailingAnchor];
  v68 = [(ICQTileView *)self trailingAnchor];
  v67 = [v69 constraintEqualToAnchor:v68 constant:-14.0];
  v106[10] = v67;
  v66 = [(ICQTileView *)self separator];
  v64 = [v66 leadingAnchor];
  v65 = [(ICQTileView *)self titleLabel];
  v63 = [v65 leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v106[11] = v62;
  v61 = [(ICQTileView *)self separator];
  v59 = [v61 topAnchor];
  v60 = [(ICQTileView *)self messageLabel];
  v58 = [v60 bottomAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:10.0];
  v106[12] = v57;
  v56 = [(ICQTileView *)self separator];
  v55 = [v56 trailingAnchor];
  v54 = [(ICQTileView *)self trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v106[13] = v53;
  v52 = [(ICQTileView *)self separator];
  v51 = [v52 heightAnchor];
  v50 = [v51 constraintEqualToConstant:0.5];
  v106[14] = v50;
  v49 = [(ICQTileView *)self actionButtonsStack];
  v47 = [v49 leadingAnchor];
  v48 = [(ICQTileView *)self titleLabel];
  v46 = [v48 leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v106[15] = v45;
  v44 = [(ICQTileView *)self actionButtonsStack];
  v42 = [v44 topAnchor];
  v43 = [(ICQTileView *)self separator];
  v41 = [v43 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:10.0];
  v106[16] = v40;
  v39 = [(ICQTileView *)self actionButtonsStack];
  v38 = [v39 trailingAnchor];
  v37 = [(ICQTileView *)self trailingAnchor];
  v36 = [v38 constraintLessThanOrEqualToAnchor:v37 constant:-14.0];
  v106[17] = v36;
  v35 = [(ICQTileView *)self actionButtonsStack];
  v34 = [v35 bottomAnchor];
  v33 = [(ICQTileView *)self bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:-14.0];
  v106[18] = v32;
  v31 = [(ICQTileView *)self widthAnchor];
  v21 = [v31 constraintLessThanOrEqualToConstant:400.0];
  v106[19] = v21;
  v22 = [(ICQTileView *)self dismissButton];
  v23 = [v22 topAnchor];
  v24 = [(ICQTileView *)self topAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:14.0];
  v106[20] = v25;
  v26 = [(ICQTileView *)self dismissButton];
  v27 = [v26 trailingAnchor];
  v28 = [(ICQTileView *)self trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:-14.0];
  v106[21] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:22];
  [v71 activateConstraints:v30];
}

- (void)createSeparator
{
  v3 = [(ICQTileView *)self separator];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    id v6 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v5 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [v6 setBackgroundColor:v5];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICQTileView *)self addSubview:v6];
    [(ICQTileView *)self setSeparator:v6];
  }
}

- (void)createActionButtons
{
  v3 = [(ICQTileView *)self dismissButton];

  if (!v3)
  {
    id v4 = +[ICQPremiumButton buttonWithType:1 link:0];
    [v4 setAccessibilityLabel:@"Dismiss bubble"];
    uint64_t v5 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [v4 setTintColor:v5];

    id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark"];
    [v4 setImage:v6 forState:0];

    [v4 addTarget:self action:sel_dismissButtonTapped_ forControlEvents:64];
    LODWORD(v7) = 1144913920;
    [v4 setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1132593152;
    [v4 setContentHuggingPriority:0 forAxis:v8];
    [(ICQTileView *)self addSubview:v4];
    [(ICQTileView *)self setDismissButton:v4];
  }
  v9 = [(ICQTileView *)self primaryButton];

  if (!v9)
  {
    v10 = +[ICQPremiumButton buttonWithType:1 link:0];
    [v10 addTarget:self action:sel_actionButtonTapped_ forControlEvents:64];
    [(ICQTileView *)self setPrimaryButton:v10];
  }
  v11 = [(ICQTileView *)self secondaryButton];

  if (!v11)
  {
    id v12 = +[ICQPremiumButton buttonWithType:1 link:0];
    [v12 addTarget:self action:sel_actionButtonTapped_ forControlEvents:64];
    [(ICQTileView *)self setSecondaryButton:v12];
  }
}

- (void)createActionButtonsStack
{
  v3 = [(ICQTileView *)self actionButtonsStack];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82BF8]);
    id v5 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v5 setAxis:0];
    [v5 setSpacing:15.0];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICQTileView *)self addSubview:v5];
    [(ICQTileView *)self setActionButtonsStack:v5];
  }
}

- (void)updateTileViewWithOffer:(id)a3
{
  id v11 = [a3 opportunityBubble];
  id v4 = [v11 bubbleDetails];
  id v5 = [v4 title];
  [(ICQTileView *)self createOrUpdateTitleLabelWithTitle:v5];

  id v6 = [v11 bubbleDetails];
  double v7 = [v6 message];
  [(ICQTileView *)self createOrUpdateMessageLabelWithMessage:v7];

  double v8 = [v11 bubbleDetails];
  v9 = [v8 imageDetails];
  [(ICQTileView *)self createOrUpdateImageViewFromImageDetails:v9];

  v10 = [v11 bubbleDetails];
  [(ICQTileView *)self createButtonsFromBubbleDetails:v10];
}

- (void)createOrUpdateImageViewFromImageDetails:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82B60];
  id v5 = a3;
  id v6 = [v4 mainScreen];
  [v6 scale];
  double v8 = v7;

  id v11 = [v5 getURLForScale:(uint64_t)v8];

  v9 = [(ICQTileView *)self iconImageView];

  if (v9)
  {
    v10 = [(ICQTileView *)self iconImageView];
    [(ICQAsyncImageView *)v10 updateToImageFromURL:v11];
  }
  else
  {
    v10 = [[ICQAsyncImageView alloc] initWithURL:v11];
    [(ICQAsyncImageView *)v10 setContentMode:1];
    [(ICQAsyncImageView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICQTileView *)self addSubview:v10];
    [(ICQTileView *)self setIconImageView:v10];
  }
}

- (id)createLabelWithText:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setAdjustsFontForContentSizeCategory:1];
  [v6 setText:v4];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v6;
}

- (void)createOrUpdateTitleLabelWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQTileView *)self titleLabel];

  if (v5)
  {
    id v7 = [(ICQTileView *)self titleLabel];
    [v7 setText:v4];
  }
  else
  {
    id v7 = [(ICQTileView *)self createLabelWithText:v4];
    [v7 setText:v4];

    [v7 setNumberOfLines:0];
    id v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [v7 setFont:v6];

    [(ICQTileView *)self addSubview:v7];
    [(ICQTileView *)self setTitleLabel:v7];
  }
}

- (void)createOrUpdateMessageLabelWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQTileView *)self messageLabel];

  if (v5)
  {
    id v8 = [(ICQTileView *)self messageLabel];
    [v8 setText:v4];
  }
  else
  {
    id v8 = [(ICQTileView *)self createLabelWithText:v4];
    [v8 setText:v4];

    [v8 setNumberOfLines:0];
    id v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    [v8 setFont:v6];

    id v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v8 setTextColor:v7];

    [(ICQTileView *)self addSubview:v8];
    [(ICQTileView *)self setMessageLabel:v8];
  }
}

- (void)createButtonsFromBubbleDetails:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v28 = a3;
  id v4 = [v28 actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v29 = 0;
    char v30 = 0;
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = *MEMORY[0x263F88810];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(NSObject **)(*((void *)&v31 + 1) + 8 * i);
        id v11 = [v10 parameters];

        if (v11)
        {
          id v12 = [v10 parameters];
          __int16 v13 = [v12 objectForKeyedSubscript:v8];

          if ([v13 isEqualToString:@"closeBtnId"])
          {
            [(ICQTileView *)self updateDismissButtonWithAction:v10];
            char v30 = 1;
          }
          else if ([v13 isEqualToString:@"bubblePrimaryBtnId"])
          {
            [(ICQTileView *)self updatePrimaryButtonWithAction:v10];
            BYTE4(v29) = 1;
          }
          else if ([v13 isEqualToString:@"bubbleSecondaryBtnId"])
          {
            [(ICQTileView *)self updateSecondaryButtonWithAction:v10];
            LOBYTE(v29) = 1;
          }
          else
          {
            v14 = _ICQGetLogSystem();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v13;
              _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Invalid action id %@ for button", buf, 0xCu);
            }
          }
        }
        else
        {
          __int16 v13 = _ICQGetLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v10;
            _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Missing parameters from action: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v29 = 0;
    char v30 = 0;
  }

  v15 = [(ICQTileView *)self dismissButton];
  [v15 setHidden:(v30 & 1) == 0];

  v16 = [(ICQTileView *)self titleLabelDismissButtonSpacingConstraint];
  [v16 setActive:v30 & 1];

  v17 = [(ICQTileView *)self primaryButton];
  if (!v17) {
    -[ICQTileView createButtonsFromBubbleDetails:]();
  }

  v18 = [(ICQTileView *)self primaryButton];
  double v19 = v18;
  if ((v29 & 0x100000000) != 0)
  {
    v20 = [v18 superview];

    if (v20)
    {
      v21 = [(ICQTileView *)self primaryButton];
      [v21 removeFromSuperview];
    }
    double v19 = [(ICQTileView *)self actionButtonsStack];
    v22 = [(ICQTileView *)self primaryButton];
    [v19 addArrangedSubview:v22];
  }
  else
  {
    [v18 removeFromSuperview];
  }

  v23 = [(ICQTileView *)self secondaryButton];
  v24 = v23;
  if (v29)
  {
    v25 = [v23 superview];

    if (v25)
    {
      v26 = [(ICQTileView *)self secondaryButton];
      [v26 removeFromSuperview];
    }
    v24 = [(ICQTileView *)self actionButtonsStack];
    v27 = [(ICQTileView *)self secondaryButton];
    [v24 addArrangedSubview:v27];
  }
  else
  {
    [v23 removeFromSuperview];
  }
}

- (void)updateDismissButtonWithAction:(id)a3
{
  id v7 = a3;
  id v4 = [(ICQTileView *)self dismissButton];

  if (v4)
  {
    uint64_t v5 = [(ICQTileView *)self dismissButton];
    [v5 setLink:v7];

    uint64_t v6 = [(ICQTileView *)self dismissButton];
    [v6 setHidden:v7 == 0];
  }
}

- (void)updatePrimaryButtonWithAction:(id)a3
{
  id v8 = a3;
  id v4 = [(ICQTileView *)self primaryButton];

  if (v4)
  {
    uint64_t v5 = [(ICQTileView *)self primaryButton];
    uint64_t v6 = [v8 text];
    [v5 setTitle:v6 forState:0];

    id v7 = [(ICQTileView *)self primaryButton];
    [v7 setLink:v8];
  }
}

- (void)updateSecondaryButtonWithAction:(id)a3
{
  id v8 = a3;
  id v4 = [(ICQTileView *)self secondaryButton];

  if (v4)
  {
    uint64_t v5 = [(ICQTileView *)self secondaryButton];
    uint64_t v6 = [v8 text];
    [v5 setTitle:v6 forState:0];

    id v7 = [(ICQTileView *)self secondaryButton];
    [v7 setLink:v8];
  }
}

- (void)dismissButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss button was tapped", v20, 2u);
  }

  uint64_t v6 = [(ICQLegacyBannerView *)self delegate];
  [v6 tileView:self performAction:1 parameters:0];

  id v7 = (void *)MEMORY[0x263F88908];
  id v8 = [v4 link];
  v9 = [v8 parameters];
  [v7 performAction:123 parameters:v9 options:0];

  reportingDetails = self->_reportingDetails;
  if (reportingDetails
    && [(_ICQOpportunityBubbleReportingSpecification *)reportingDetails dismissRuleType] == 2)
  {
    id v11 = (void *)MEMORY[0x263F88908];
    id v12 = [(_ICQOpportunityBubbleReportingSpecification *)self->_reportingDetails dimissServerParam];
    [v11 performAction:123 parameters:v12 options:0];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x263F888E8];
    id v12 = [(ICQPremiumOffer *)self->_premiumOffer bundleIdentifier];
    v14 = [v4 link];
    v15 = [v14 serverUIURL];
    [v13 sendEventFor:1 withBundleID:v12 link:v15];
  }
  v16 = [(ICQTileView *)self premiumOffer];
  [v16 setDismissed:1];

  v17 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v18 = *MEMORY[0x263F88848];
  double v19 = [(ICQTileView *)self premiumOffer];
  [v17 postNotificationName:v18 object:v19];
}

- (void)actionButtonTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 link];
    id v7 = [v6 text];
    int v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Button with label \"%@\" was tapped", (uint8_t *)&v13, 0xCu);
  }
  id v8 = [v4 link];
  [(ICQTileView *)self handleActionFromLink:v8];

  v9 = (void *)MEMORY[0x263F888E8];
  v10 = [(ICQPremiumOffer *)self->_premiumOffer bundleIdentifier];
  id v11 = [v4 link];
  id v12 = [v11 serverUIURL];
  [v9 sendEventFor:2 withBundleID:v10 link:v12];
}

- (BOOL)handleActionFromLink:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "ICQTile: action was nil, bailing", (uint8_t *)&v14, 2u);
    }
    goto LABEL_10;
  }
  uint64_t v5 = [(ICQLegacyBannerView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v7 = -[ICQTileView _delegateActionForAction:](self, "_delegateActionForAction:", [v4 action]);
  id v8 = [(ICQLegacyBannerView *)self delegate];
  v9 = [v4 parameters];
  LOBYTE(v7) = [v8 tileView:self performAction:v7 parameters:v9];

  if ((v7 & 1) == 0)
  {
LABEL_4:
    if (([(ICQTileView *)self _performLink:v4] & 1) == 0)
    {
      id v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [v4 action];
        id v12 = _ICQStringForAction();
        int v14 = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "ICQTile: action %{public}@ not handled by delegate nor ICQTileView", (uint8_t *)&v14, 0xCu);
      }
LABEL_10:

      BOOL v10 = 0;
      goto LABEL_11;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)attributedText
{
  return 0;
}

- (id)detailAttributedText
{
  return 0;
}

- (BOOL)_launchFlowManagerWithLink:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICQLegacyBannerView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v7 = [(ICQLegacyBannerView *)self delegate];
  uint64_t v8 = [v7 presentingViewControllerForTileView:self];

  v9 = _ICQGetLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
LABEL_9:
      [v4 action];
      uint64_t v18 = _ICQStringForAction();
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "ICQ Tile: not performing action %{public}@ since ICQTileViewDelegate did not provide presentingViewController", (uint8_t *)&v20, 0xCu);
    }
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  if (v10)
  {
    [v4 action];
    id v11 = _ICQStringForAction();
    int v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "ICQ Tile: perform action %{public}@", (uint8_t *)&v20, 0xCu);
  }
  id v12 = [ICQPremiumFlowManager alloc];
  int v13 = [(ICQTileView *)self premiumOffer];
  int v14 = [(ICQUpgradeFlowManager *)v12 initWithOffer:v13];

  [(ICQUpgradeFlowManager *)v14 setDelegate:self];
  uint64_t v15 = [(ICQLegacyBannerView *)self flowOptions];
  [(ICQUpgradeFlowManager *)v14 setFlowOptions:v15];

  uint64_t v16 = [v4 serverUIURL];
  [(ICQPremiumFlowManager *)v14 beginPremiumFlowWithURL:v16];

  [(ICQTileView *)self setLocalFlowManager:v14];
  BOOL v17 = 1;
  v9 = v8;
LABEL_11:

  return v17;
}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (ICQAsyncImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (ICQPremiumButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (ICQPremiumButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (ICQPremiumButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (UIStackView)actionButtonsStack
{
  return self->_actionButtonsStack;
}

- (void)setActionButtonsStack:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelDismissButtonSpacingConstraint
{
  return self->_titleLabelDismissButtonSpacingConstraint;
}

- (void)setTitleLabelDismissButtonSpacingConstraint:(id)a3
{
}

- (_ICQOpportunityBubbleReportingSpecification)reportingDetails
{
  return self->_reportingDetails;
}

- (void)setReportingDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDetails, 0);
  objc_storeStrong((id *)&self->_titleLabelDismissButtonSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonsStack, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_premiumOffer, 0);
}

- (void)createButtonsFromBubbleDetails:.cold.1()
{
}

@end