@interface SFHighlightActivityNotificationViewController
- (CNContact)contact;
- (NSString)messageText;
- (NSString)titleText;
- (SFHighlightActivityNotificationViewController)initWithContact:(id)a3;
- (SFHighlightActivityNotificationViewController)initWithTitleText:(id)a3;
- (void)setMessageText:(id)a3;
- (void)viewDidLoad;
@end

@implementation SFHighlightActivityNotificationViewController

- (SFHighlightActivityNotificationViewController)initWithContact:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHighlightActivityNotificationViewController;
  v5 = [(SFHighlightActivityNotificationViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFHighlightActivityNotificationViewController)initWithTitleText:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHighlightActivityNotificationViewController;
  v5 = [(SFHighlightActivityNotificationViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v2 = self;
  v99[1] = *MEMORY[0x1E4F143B8];
  v95.receiver = self;
  v95.super_class = (Class)SFHighlightActivityNotificationViewController;
  [(SFHighlightActivityNotificationViewController *)&v95 viewDidLoad];
  v3 = [(SFHighlightActivityNotificationViewController *)v2 view];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  objc_msgSend(v3, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v5 = 0x1E4FB0000uLL;
  uint64_t v6 = *MEMORY[0x1E4FB28F0];
  v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09B8]];
  [v4 setFont:v7];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [v4 setTextColor:v8];

  [v4 setTextAlignment:1];
  LODWORD(v9) = 1132593152;
  [v4 setContentHuggingPriority:1 forAxis:v9];
  LODWORD(v10) = 1144913920;
  [v4 setContentCompressionResistancePriority:1 forAxis:v10];
  [v3 addSubview:v4];
  if (v2->_contact)
  {
    v11 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
    v12 = [v11 contactStore];

    v13 = [MEMORY[0x1E4F1BB50] settingsWithContactStore:v12];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1BB40]) initWithSettings:v13];
    contactViewController = v2->_contactViewController;
    v2->_contactViewController = (CNAvatarViewController *)v14;

    v99[0] = v2->_contact;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
    v17 = v16 = v2;
    [(CNAvatarViewController *)v16->_contactViewController setContacts:v17];

    v18 = [(CNAvatarViewController *)v16->_contactViewController view];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v18];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    v20 = [v19 stringFromContact:v16->_contact];
    [v4 setText:v20];

    v2 = v16;
    unint64_t v5 = 0x1E4FB0000;
  }
  else
  {
    [v4 setText:v2->_titleText];
    v18 = 0;
  }
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  subtitleLabel = v2->_subtitleLabel;
  v2->_subtitleLabel = v21;

  [(UILabel *)v2->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [*(id *)(v5 + 2272) _preferredFontForTextStyle:v6 weight:*MEMORY[0x1E4FB09D0]];
  [(UILabel *)v2->_subtitleLabel setFont:v23];

  v24 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v2->_subtitleLabel setTextColor:v24];

  [(UILabel *)v2->_subtitleLabel setTextAlignment:1];
  [(UILabel *)v2->_subtitleLabel setText:v2->_messageText];
  [v3 addSubview:v2->_subtitleLabel];
  id v25 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v25 setIdentifier:@"SFHighlightActivityNotificationText"];
  [v3 addLayoutGuide:v25];
  v26 = [v3 layoutMarginsGuide];
  unint64_t v27 = 0x1E4F28000uLL;
  v81 = (void *)MEMORY[0x1E4F28DC8];
  v93 = v4;
  v94 = v2;
  v91 = v18;
  v92 = v3;
  if (v18)
  {
    v85 = [v18 topAnchor];
    uint64_t v75 = [v26 topAnchor];
    v89 = [v85 constraintGreaterThanOrEqualToAnchor:v75];
    v98[0] = v89;
    v28 = [v18 centerYAnchor];
    uint64_t v69 = [v3 centerYAnchor];
    v87 = v28;
    v83 = [v28 constraintEqualToAnchor:v69];
    v98[1] = v83;
    v29 = [v18 leadingAnchor];
    v77 = [v26 leadingAnchor];
    v79 = v29;
    v73 = [v29 constraintEqualToAnchor:v77];
    v98[2] = v73;
    v71 = [v18 widthAnchor];
    v67 = [v71 constraintEqualToConstant:32.0];
    v98[3] = v67;
    v65 = [v18 heightAnchor];
    v63 = [v65 constraintEqualToConstant:32.0];
    v98[4] = v63;
    v30 = [v25 leadingAnchor];
    v31 = [v18 trailingAnchor];
    v32 = [v30 constraintEqualToSystemSpacingAfterAnchor:v31 multiplier:1.0];
    v98[5] = v32;
    v33 = [v26 trailingAnchor];
    [v25 trailingAnchor];
    v35 = v34 = v26;
    [v33 constraintEqualToAnchor:v35 constant:24.0];
    v37 = id v36 = v25;
    v98[6] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:7];
    [v81 activateConstraints:v38];

    v39 = (void *)v69;
    id v25 = v36;
    v40 = (void *)v75;

    v26 = v34;
    unint64_t v27 = 0x1E4F28000;

    v3 = v92;
    id v4 = v93;

    v2 = v94;
  }
  else
  {
    v41 = [v25 leadingAnchor];
    v40 = [v26 leadingAnchor];
    v85 = v41;
    v89 = [v41 constraintEqualToAnchor:v40 constant:16.0];
    v97[0] = v89;
    uint64_t v42 = [v26 trailingAnchor];
    uint64_t v43 = [v25 trailingAnchor];
    v87 = (void *)v42;
    v44 = (void *)v42;
    v39 = (void *)v43;
    v83 = [v44 constraintEqualToAnchor:v43 constant:16.0];
    v97[1] = v83;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
    objc_msgSend(v81, "activateConstraints:");
  }
  v61 = v26;

  v66 = *(void **)(v27 + 3528);
  v90 = [v25 topAnchor];
  v88 = [v26 topAnchor];
  v86 = [v90 constraintGreaterThanOrEqualToAnchor:v88];
  v96[0] = v86;
  v84 = [v25 centerYAnchor];
  v82 = [v3 centerYAnchor];
  v80 = [v84 constraintEqualToAnchor:v82];
  v96[1] = v80;
  v78 = [v4 leadingAnchor];
  v76 = [v25 leadingAnchor];
  v74 = [v78 constraintEqualToAnchor:v76];
  v96[2] = v74;
  v72 = [v4 widthAnchor];
  v70 = [v25 widthAnchor];
  v68 = [v72 constraintEqualToAnchor:v70];
  v96[3] = v68;
  v64 = [v4 topAnchor];
  v62 = [v25 topAnchor];
  v60 = [v64 constraintEqualToAnchor:v62];
  v96[4] = v60;
  v59 = [(UILabel *)v2->_subtitleLabel leadingAnchor];
  v58 = [v25 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v96[5] = v57;
  [(UILabel *)v2->_subtitleLabel widthAnchor];
  v56 = v45 = v25;
  v46 = [v25 widthAnchor];
  v47 = [v56 constraintEqualToAnchor:v46];
  v96[6] = v47;
  v48 = [(UILabel *)v2->_subtitleLabel topAnchor];
  v49 = [v4 bottomAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v96[7] = v50;
  v51 = [(UILabel *)v2->_subtitleLabel bottomAnchor];
  v52 = v45;
  v53 = [v45 bottomAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  v96[8] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:9];
  [v66 activateConstraints:v55];

  objc_msgSend(v92, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SFHighlightActivityNotificationViewController setPreferredContentSize:](v94, "setPreferredContentSize:");
}

- (void)setMessageText:(id)a3
{
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSString *)[v7 copy];
    messageText = self->_messageText;
    self->_messageText = v4;

    [(UILabel *)self->_subtitleLabel setText:v7];
    uint64_t v6 = [(SFHighlightActivityNotificationViewController *)self viewIfLoaded];
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[SFHighlightActivityNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_contactViewController, 0);
}

@end