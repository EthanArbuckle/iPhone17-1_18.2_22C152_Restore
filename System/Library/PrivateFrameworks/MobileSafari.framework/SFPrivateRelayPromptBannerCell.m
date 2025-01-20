@interface SFPrivateRelayPromptBannerCell
+ (NSString)reuseIdentifier;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSString)message;
- (NSString)title;
- (SFPrivateRelayPromptBannerCell)initWithCoder:(id)a3;
- (SFPrivateRelayPromptBannerCell)initWithFrame:(CGRect)a3;
- (UIButton)turnOnButton;
- (id)_attributedStringForMessage:(id)a3;
- (id)dismissHandler;
- (id)focusEffect;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_dismiss:(id)a3;
- (void)_turnOnPrivateRelay:(id)a3;
- (void)_updateTurnOnButtonConfiguration;
- (void)configureUsingBanner:(id)a3;
- (void)layoutSubviews;
- (void)setDismissHandler:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTurnOnButton:(id)a3;
@end

@implementation SFPrivateRelayPromptBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"PrivateRelayPromptBanner";
}

- (SFPrivateRelayPromptBannerCell)initWithFrame:(CGRect)a3
{
  v91[2] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)SFPrivateRelayPromptBannerCell;
  v3 = -[SFPrivateRelayPromptBannerCell initWithFrame:](&v86, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:0];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFBannerBackgroundView *)v4;

    [(SFBannerBackgroundView *)v3->_backgroundView setBannerStyle:1];
    [(SFBannerBackgroundView *)v3->_backgroundView _setGroupName:0];
    [(SFBannerBackgroundView *)v3->_backgroundView _setContinuousCornerRadius:8.0];
    [(SFPrivateRelayPromptBannerCell *)v3 setBackgroundView:v3->_backgroundView];
    -[SFPrivateRelayPromptBannerCell setLayoutMargins:](v3, "setLayoutMargins:", 30.0, 30.0, 30.0, 30.0);
    v85 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2998], 2);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1930], "sf_startPageBannerTitleLabelWithFont:", v85);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivateRelayPromptBannerCell *)v3 addSubview:v3->_titleLabel];
    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v8;

    [(UITextView *)v3->_messageLabel setDelegate:v3];
    [(UITextView *)v3->_messageLabel setEditable:0];
    [(UITextView *)v3->_messageLabel setSelectable:1];
    [(UITextView *)v3->_messageLabel setScrollEnabled:0];
    v10 = [(UITextView *)v3->_messageLabel textContainer];
    [v10 setLineFragmentPadding:0.0];

    [(UITextView *)v3->_messageLabel _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v3->_messageLabel, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)v3->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v3->_messageLabel setBackgroundColor:v11];

    [(UITextView *)v3->_messageLabel setTextAlignment:1];
    [(UITextView *)v3->_messageLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v88 = *MEMORY[0x1E4FB0700];
    v12 = [MEMORY[0x1E4FB1618] linkColor];
    v89 = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    [(UITextView *)v3->_messageLabel setLinkTextAttributes:v13];

    LODWORD(v14) = 1148846080;
    [(UITextView *)v3->_messageLabel setContentHuggingPriority:1 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UITextView *)v3->_messageLabel setContentCompressionResistancePriority:1 forAxis:v15];
    [(SFPrivateRelayPromptBannerCell *)v3 addSubview:v3->_messageLabel];
    v16 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v16 setButtonSize:3];
    objc_msgSend(v16, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    [v16 setImage:v17];

    v18 = [MEMORY[0x1E4FB1830] configurationWithWeight:9];
    [v16 setPreferredSymbolConfigurationForImage:v18];

    v19 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v16 primaryAction:0];
    v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIButton *)v19 setTintColor:v20];

    [(UIButton *)v19 setPointerStyleProvider:&__block_literal_global_14];
    [(UIButton *)v19 setTintAdjustmentMode:1];
    -[UIButton _setTouchInsets:](v19, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(UIButton *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    dismissButton = v3->_dismissButton;
    v3->_dismissButton = v19;

    [(UIButton *)v3->_dismissButton addTarget:v3 action:sel__dismiss_ forControlEvents:0x2000];
    [(SFPrivateRelayPromptBannerCell *)v3 addSubview:v3->_dismissButton];
    v22 = [MEMORY[0x1E4FB14D8] borderedProminentButtonConfiguration];
    [v22 setCornerStyle:4];
    [v22 setButtonSize:0];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v23 setAlignment:1];
    [v23 setLineBreakStrategy:1];
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    v25 = _WBSLocalizedString();
    v90[0] = *MEMORY[0x1E4FB06F8];
    v26 = turnOnButtonFont();
    v90[1] = *MEMORY[0x1E4FB0738];
    v91[0] = v26;
    v91[1] = v23;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
    v28 = (void *)[v24 initWithString:v25 attributes:v27];
    [v22 setAttributedTitle:v28];

    v29 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v22 primaryAction:0];
    v30 = [(UIButton *)v29 titleLabel];
    [v30 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v29 _sf_setMatchesIntrinsicContentSize];

    turnOnButton = v3->_turnOnButton;
    v3->_turnOnButton = v29;

    [(UIButton *)v3->_turnOnButton addTarget:v3 action:sel__turnOnPrivateRelay_ forControlEvents:0x2000];
    [(SFPrivateRelayPromptBannerCell *)v3 addSubview:v3->_turnOnButton];
    uint64_t v32 = [(UIButton *)v3->_turnOnButton bottomAnchor];
    v33 = [(SFPrivateRelayPromptBannerCell *)v3 readableContentGuide];
    v66 = (void *)MEMORY[0x1E4F28DC8];
    v84 = [(UILabel *)v3->_titleLabel topAnchor];
    v83 = [v33 topAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v87[0] = v82;
    v81 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v80 = [v33 leadingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v87[1] = v79;
    v78 = [v33 trailingAnchor];
    v77 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v87[2] = v76;
    v75 = [(UILabel *)v3->_titleLabel centerXAnchor];
    v74 = [(SFPrivateRelayPromptBannerCell *)v3 centerXAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v87[3] = v73;
    v72 = [(UITextView *)v3->_messageLabel topAnchor];
    v71 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:8.0];
    v87[4] = v70;
    v69 = [(UITextView *)v3->_messageLabel leadingAnchor];
    v68 = [v33 leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v87[5] = v67;
    v65 = [v33 trailingAnchor];
    v64 = [(UITextView *)v3->_messageLabel trailingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v87[6] = v63;
    v62 = [(UITextView *)v3->_messageLabel centerXAnchor];
    v61 = [(SFPrivateRelayPromptBannerCell *)v3 centerXAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v87[7] = v60;
    v57 = [(UIButton *)v3->_turnOnButton topAnchor];
    v56 = [(UITextView *)v3->_messageLabel bottomAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:16.0];
    v87[8] = v55;
    v54 = [(UIButton *)v3->_turnOnButton centerXAnchor];
    v53 = [v33 centerXAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v87[9] = v52;
    v51 = [(UIButton *)v3->_turnOnButton leadingAnchor];
    v59 = v33;
    v50 = [v33 leadingAnchor];
    v49 = [v51 constraintGreaterThanOrEqualToAnchor:v50];
    v87[10] = v49;
    v48 = [(UIButton *)v3->_dismissButton leadingAnchor];
    v47 = [(SFPrivateRelayPromptBannerCell *)v3 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:10.0];
    v87[11] = v46;
    v34 = [(UIButton *)v3->_dismissButton topAnchor];
    v35 = [(SFPrivateRelayPromptBannerCell *)v3 topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:10.0];
    v87[12] = v36;
    v37 = [v33 bottomAnchor];
    v58 = (void *)v32;
    v38 = [v37 constraintGreaterThanOrEqualToAnchor:v32];
    v87[13] = v38;
    v39 = [v33 bottomAnchor];
    v40 = [v39 constraintEqualToAnchor:v32];
    LODWORD(v41) = 1132068864;
    v42 = objc_msgSend(v40, "sf_withPriority:", v41);
    v87[14] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:15];
    [v66 activateConstraints:v43];

    v44 = v3;
  }

  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SFPrivateRelayPromptBannerCell;
  uint64_t v4 = [(SFPrivateRelayPromptBannerCell *)&v13 preferredLayoutAttributesFittingAttributes:a3];
  [(SFPrivateRelayPromptBannerCell *)self layoutIfNeeded];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFPrivateRelayPromptBannerCell *)self bounds];
  -[SFPrivateRelayPromptBannerCell systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", CGRectGetWidth(v15), *(double *)(MEMORY[0x1E4FB2C68] + 8));
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v11);

  return v4;
}

- (SFPrivateRelayPromptBannerCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivateRelayPromptBannerCell;
  return [(SFPrivateRelayPromptBannerCell *)&v4 initWithCoder:a3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFPrivateRelayPromptBannerCell;
  [(SFPrivateRelayPromptBannerCell *)&v3 layoutSubviews];
  [(UILabel *)self->_titleLabel frame];
  [(UILabel *)self->_titleLabel setPreferredMaxLayoutWidth:CGRectGetWidth(v4)];
  [(UITextView *)self->_messageLabel frame];
  [(UITextView *)self->_messageLabel _setPreferredMaxLayoutWidth:CGRectGetWidth(v5)];
  [(SFPrivateRelayPromptBannerCell *)self _updateTurnOnButtonConfiguration];
}

- (id)focusEffect
{
  v2 = (void *)MEMORY[0x1E4FB1788];
  [(SFPrivateRelayPromptBannerCell *)self bounds];
  uint64_t v3 = *MEMORY[0x1E4F39EA8];

  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", v3);
}

- (void)_dismiss:(id)a3
{
  CGRect v4 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3);
  [v4 reportPrivateRelayModulePromptEvent:@"Dismiss"];

  CGRect v5 = (void (*)(void))*((void *)self->_dismissHandler + 2);

  v5();
}

- (void)_turnOnPrivateRelay:(id)a3
{
  CGRect v4 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3);
  [v4 reportPrivateRelayModulePromptEvent:@"Turn On Private Relay"];

  CGRect v5 = [MEMORY[0x1E4F98CF0] sharedManager];
  [v5 setPrivacyProxyEnabled:1 completionHandler:0];

  double v6 = (void (*)(void))*((void *)self->_dismissHandler + 2);

  v6();
}

- (void)_updateTurnOnButtonConfiguration
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIButton *)self->_turnOnButton titleLabel];
  CGRect v4 = turnOnButtonFont();
  CGRect v5 = [v3 text];
  [v3 frame];
  double v7 = v6;
  uint64_t v18 = *MEMORY[0x1E4FB06F8];
  v19[0] = v4;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v7, 1.79769313e308);
  double v10 = v9;

  [v4 lineHeight];
  double v12 = round(v10 / v11);
  if (v12 > 1.0) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 4;
  }
  double v14 = [(UIButton *)self->_turnOnButton configuration];
  uint64_t v15 = [v14 cornerStyle];

  if (v13 != v15)
  {
    v16 = [(UIButton *)self->_turnOnButton configuration];
    [v16 setCornerStyle:v13];
    if (v12 > 1.0)
    {
      v17 = [v16 background];
      [v17 setCornerRadius:8.0];
    }
    [(UIButton *)self->_turnOnButton setConfiguration:v16];
  }
}

- (void)configureUsingBanner:(id)a3
{
  id v23 = a3;
  CGRect v4 = [v23 image];
  if (v4)
  {
    CGRect v5 = (void *)MEMORY[0x1E4F28B18];
    double v6 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v4];
    double v7 = [v5 attributedStringWithAttachment:v6];

    double v8 = [v23 title];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      if ([(UIView *)self _sf_usesLeftToRightLayout])
      {
        [v9 appendAttributedString:v7];
        double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v9 appendAttributedString:v10];

        id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
        double v12 = [v23 title];
        uint64_t v13 = (void *)[v11 initWithString:v12];
        [v9 appendAttributedString:v13];
      }
      else
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v15 = [v23 title];
        v16 = (void *)[v14 initWithString:v15];
        [v9 appendAttributedString:v16];

        v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v9 appendAttributedString:v17];

        [v9 appendAttributedString:v7];
      }
      [(UILabel *)self->_titleLabel setAttributedText:v9];
    }
    else
    {
      [(UILabel *)self->_titleLabel setAttributedText:v7];
    }
  }
  else
  {
    double v7 = [v23 title];
    [(UILabel *)self->_titleLabel setText:v7];
  }

  uint64_t v18 = [v23 message];
  v19 = [(SFPrivateRelayPromptBannerCell *)self _attributedStringForMessage:v18];

  v20 = _WBSLocalizedString();
  objc_msgSend(v19, "safari_replaceOccurrenceOfString:withString:link:", @"{learn-more-link}", v20, @"learn-more://");

  [(UITextView *)self->_messageLabel setAttributedText:v19];
  v21 = [v23 dismissHandler];
  id dismissHandler = self->_dismissHandler;
  self->_id dismissHandler = v21;

  -[SFPrivateRelayPromptBannerCell setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v23 userInterfaceStyle]);
  [(SFPrivateRelayPromptBannerCell *)self setNeedsLayout];
}

- (id)_attributedStringForMessage:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  CGRect v5 = (void *)[[v3 alloc] initWithString:v4];

  double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  uint64_t v7 = [v5 length];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v6, 0, v7);
  id v8 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v8 setAlignment:1];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v8, 0, v7);
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  objc_msgSend(v5, "addAttribute:value:range:", v9, v10, 0, v7);

  return v5;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(SFPrivateRelayPromptBannerCell *)self setNeedsLayout];
}

- (NSString)message
{
  return [(UITextView *)self->_messageLabel text];
}

- (void)setMessage:(id)a3
{
  [(UITextView *)self->_messageLabel setText:a3];

  [(SFPrivateRelayPromptBannerCell *)self setNeedsLayout];
}

- (void)setTurnOnButton:(id)a3
{
  objc_storeStrong((id *)&self->_turnOnButton, a3);

  [(SFPrivateRelayPromptBannerCell *)self setNeedsLayout];
}

- (void)setDismissHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id dismissHandler = self->_dismissHandler;
  self->_id dismissHandler = v4;

  [(SFPrivateRelayPromptBannerCell *)self setNeedsLayout];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  double v6 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4, a5.location, a5.length, a6);
  [v6 reportPrivateRelayModulePromptEvent:@"Learn More"];

  [MEMORY[0x1E4F98CF0] openPrivateRelayICloudSettings];
  return 0;
}

- (UIButton)turnOnButton
{
  return self->_turnOnButton;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_turnOnButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end