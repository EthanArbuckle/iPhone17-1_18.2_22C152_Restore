@interface SHSHeadphoneNotificationsController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UIView)descriptionLabel;
- (id)bluetoothSettingsLinkText;
- (id)createDescriptionLabel;
- (id)createScrollView;
- (id)createTitleLabel;
- (id)descriptionText;
- (id)healthLinkText;
- (id)linkText:(id)a3 withLink:(id)a4;
- (id)titleText;
- (void)setDescriptionLabel:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation SHSHeadphoneNotificationsController

- (void)viewDidLoad
{
  v51[8] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)SHSHeadphoneNotificationsController;
  [(SHSHeadphoneNotificationsController *)&v50 loadView];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(SHSHeadphoneNotificationsController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(SHSHeadphoneNotificationsController *)self createScrollView];
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  v7 = [(SHSHeadphoneNotificationsController *)self view];
  [v7 addSubview:self->_scrollView];

  v8 = [(SHSHeadphoneNotificationsController *)self createTitleLabel];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  v10 = [(SHSHeadphoneNotificationsController *)self createDescriptionLabel];
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v10;

  [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  [(UIScrollView *)self->_scrollView addSubview:self->_descriptionLabel];
  v49 = [MEMORY[0x263EFF980] array];
  v47 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v48 = [(SHSHeadphoneNotificationsController *)self view];
  v46 = [v48 safeAreaLayoutGuide];
  v45 = [v46 leadingAnchor];
  v44 = [v47 constraintEqualToAnchor:v45];
  v51[0] = v44;
  v42 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v43 = [(SHSHeadphoneNotificationsController *)self view];
  v41 = [v43 safeAreaLayoutGuide];
  v40 = [v41 trailingAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v51[1] = v39;
  v37 = [(UIScrollView *)self->_scrollView topAnchor];
  v38 = [(SHSHeadphoneNotificationsController *)self view];
  v36 = [v38 safeAreaLayoutGuide];
  v35 = [v36 topAnchor];
  v34 = [v37 constraintEqualToAnchor:v35];
  v51[2] = v34;
  v32 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v33 = [(SHSHeadphoneNotificationsController *)self view];
  v31 = [v33 safeAreaLayoutGuide];
  v30 = [v31 bottomAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v51[3] = v29;
  v28 = [(UILabel *)self->_titleLabel widthAnchor];
  v27 = [(UIScrollView *)self->_scrollView widthAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 multiplier:0.9];
  v51[4] = v26;
  v25 = [(UILabel *)self->_titleLabel centerXAnchor];
  v12 = [(UIScrollView *)self->_scrollView centerXAnchor];
  v13 = [v25 constraintEqualToAnchor:v12];
  v51[5] = v13;
  v14 = [(UIView *)self->_descriptionLabel widthAnchor];
  v15 = [(UIScrollView *)self->_scrollView widthAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 multiplier:0.9];
  v51[6] = v16;
  v17 = [(UIView *)self->_descriptionLabel centerXAnchor];
  v18 = [(UIScrollView *)self->_scrollView centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v51[7] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:8];
  [v49 addObjectsFromArray:v20];

  v21 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabelmarg.isa, &unk_26EA46BA8, &unk_26EA46BB8, 0);
  v22 = (void *)MEMORY[0x263F08938];
  v23 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelDesc.isa, self->_titleLabel, self->_descriptionLabel, 0);
  v24 = [v22 constraintsWithVisualFormat:@"V:|-(titleLabelMargin)-[_titleLabel]-(descriptionLabelMargin)-[_descriptionLabel]-|" options:0 metrics:v21 views:v23];
  [v49 addObjectsFromArray:v24];

  [MEMORY[0x263F08938] activateConstraints:v49];
}

- (id)titleText
{
  return SHS_LocalizedStringForSounds(@"ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_TITLE");
}

- (id)linkText:(id)a3 withLink:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F089B8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithString:v7 attributes:0];

  uint64_t v9 = [v8 length];
  v10 = [MEMORY[0x263F5FBC0] appearance];
  v11 = [v10 footerHyperlinkColor];

  uint64_t v16 = *MEMORY[0x263F81500];
  v17[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  objc_msgSend(v8, "setAttributes:range:", v12, 0, v9);
  uint64_t v13 = *MEMORY[0x263F81520];
  v14 = [NSURL URLWithString:v6];

  objc_msgSend(v8, "addAttribute:value:range:", v13, v14, 0, v9);
  return v8;
}

- (id)bluetoothSettingsLinkText
{
  v3 = SHS_LocalizedStringForSounds(@"CLASSIFY_BLUETOOTH_DEVICES_IN_SETTINGS_LINK");
  v4 = [(SHSHeadphoneNotificationsController *)self linkText:v3 withLink:@"prefs:root=Bluetooth"];

  return v4;
}

- (id)healthLinkText
{
  v3 = SHS_LocalizedStringForSounds(@"LEARN_MORE_IN_HEALTH_LINK");
  v4 = [(SHSHeadphoneNotificationsController *)self linkText:v3 withLink:@"x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening"];

  return v4;
}

- (id)descriptionText
{
  v26 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v32 = [v26 fontDescriptor];
  v3 = (void *)MEMORY[0x263F81708];
  v4 = [v32 fontDescriptorWithSymbolicTraits:2];
  v31 = [v3 fontWithDescriptor:v4 size:0.0];

  id v5 = objc_alloc(MEMORY[0x263F086A0]);
  id v6 = SHS_LocalizedStringForSounds(@"ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_1");
  v30 = (void *)[v5 initWithString:v6];

  id v7 = objc_alloc(MEMORY[0x263F086A0]);
  v8 = SHS_LocalizedStringForSounds(@"ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_SUBTITLE");
  uint64_t v9 = (void *)[v7 initWithString:v8];

  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  v11 = SHS_LocalizedStringForSounds(@"ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_2");
  v29 = (void *)[v10 initWithString:v11];

  v28 = [(SHSHeadphoneNotificationsController *)self bluetoothSettingsLinkText];
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v13 = SHS_LocalizedStringForSounds(@"ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_3");
  v27 = (void *)[v12 initWithString:v13];

  v14 = [(SHSHeadphoneNotificationsController *)self healthLinkText];
  v15 = objc_opt_new();
  [v15 appendAttributedString:v30];
  [v15 appendAttributedString:v9];
  [v15 appendAttributedString:v29];
  [v15 appendAttributedString:v28];
  [v15 appendAttributedString:v27];
  [v15 appendAttributedString:v14];
  uint64_t v16 = [v15 length];
  v17 = [MEMORY[0x263F5FBC0] appearance];
  v18 = [v17 textColor];

  uint64_t v19 = *MEMORY[0x263F814F0];
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F814F0], v26, 0, v16);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F81500], v18, 0, v16);
  v20 = [v15 string];
  v21 = [v9 string];
  uint64_t v22 = [v20 rangeOfString:v21];
  uint64_t v24 = v23;

  objc_msgSend(v15, "addAttribute:value:range:", v19, v31, v22, v24);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F815F8], MEMORY[0x263EFFA80], 0, v16);

  return v15;
}

- (id)createScrollView
{
  id v3 = objc_alloc(MEMORY[0x263F82B88]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setContentInsetAdjustmentBehavior:2];
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  [v4 setScrollEnabled:1];
  [v4 setShowsVerticalScrollIndicator:1];
  id v5 = [(SHSHeadphoneNotificationsController *)self view];
  [v5 frame];
  double v7 = v6;
  [v4 contentSize];
  [v4 setContentSize:v7];

  return v4;
}

- (id)createTitleLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(SHSHeadphoneNotificationsController *)self titleText];
  [v3 setText:v4];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:0];
  LODWORD(v5) = 1036831949;
  [v3 _setHyphenationFactor:v5];
  [v3 setLineBreakMode:0];
  double v6 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83610] variant:1024];
  [v3 setFont:v6];

  return v3;
}

- (id)createDescriptionLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v3 setEditable:0];
  [v3 setSelectable:1];
  [v3 setScrollEnabled:0];
  [v3 _setInteractiveTextSelectionDisabled:1];
  v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [(SHSHeadphoneNotificationsController *)self descriptionText];
  [v3 setAttributedText:v5];

  [v3 setTextAlignment:4];
  [v3 setDelegate:self];
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  v8 = v7;
  if (!a6)
  {
    uint64_t v9 = [v7 scheme];
    if ([v9 isEqualToString:@"prefs"])
    {
    }
    else
    {
      id v10 = [v8 scheme];
      int v11 = [v10 isEqualToString:@"x-apple-health"];

      if (!v11)
      {
        id v12 = [MEMORY[0x263F82438] sharedApplication];
        [v12 openURL:v8 withCompletionHandler:0];
        goto LABEL_7;
      }
    }
    id v12 = [MEMORY[0x263F01880] defaultWorkspace];
    [v12 openSensitiveURL:v8 withOptions:0];
LABEL_7:
  }
  return 0;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end