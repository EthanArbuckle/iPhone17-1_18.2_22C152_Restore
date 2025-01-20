@interface TPInComingCallUISnapshotViewController
+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6;
+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6;
+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (id)posterDisplayNameComponentsForContact:(id)a3;
- (CNContact)contact;
- (PRPosterLabel)mobileLabel;
- (PRSPosterConfiguration)configuration;
- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5;
- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 avatarImage:(id)a6;
- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 fallbackText:(id)a6;
- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5;
- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5 avatarImage:(id)a6;
- (UIButton)acceptButton;
- (UIButton)callDetailsViewButton;
- (UIButton)declineButton;
- (UIButton)messageButton;
- (UIButton)remindMeButton;
- (UIImage)customAvatar;
- (UIImageView)avatarView;
- (UILabel)fakeLabel;
- (UILabel)nameLabel;
- (UIView)overlaysContainerView;
- (id)attachmentIdentifiersForStyle;
- (id)attachmentsForStyle;
- (id)generateOverlaysSnapshot;
- (id)identifierForStyle;
- (id)nameString;
- (int64_t)style;
- (void)capCallDetailsViewButtonSize;
- (void)hideElementsBasedOn:(int64_t)a3;
- (void)identifierForStyle;
- (void)moveMobileLabelToBeYAxisCenteredWithInfoButton;
- (void)setAcceptButton:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setBackroundColor:(id)a3;
- (void)setCallDetailsViewButton:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContact:(id)a3;
- (void)setCustomAvatar:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setFakeLabel:(id)a3;
- (void)setLabelsColor:(id)a3;
- (void)setMessageButton:(id)a3;
- (void)setMobileLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameLabelFont:(id)a3;
- (void)setNameLabelTextColor:(id)a3;
- (void)setOverlaysContainerView:(id)a3;
- (void)setRemindMeButton:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUpButton:(int64_t)a3;
- (void)setUpConstraints;
- (void)setUpOverlayContentIfNeeded;
- (void)setUpOverlaysContainer;
- (void)setupAvatarViewIfNeeded;
- (void)setupLabels;
- (void)snapshotWithOptions:(unint64_t)a3 completionBlock:(id)a4;
- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 completionBlock:(id)a5;
- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 useAttachmentConfiguration:(BOOL)a5 completionBlock:(id)a6;
- (void)viewDidLoad;
@end

@implementation TPInComingCallUISnapshotViewController

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5
{
  return [(TPInComingCallUISnapshotViewController *)self initWithConfiguration:a3 style:a4 nameString:a5 avatarImage:0];
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5 avatarImage:(id)a6
{
  id v10 = a3;
  v11 = (__CFString *)a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TPInComingCallUISnapshotViewController;
  v13 = [(TPInComingCallUISnapshotViewController *)&v19 init];
  v14 = v13;
  if (v13)
  {
    [(TPInComingCallUISnapshotViewController *)v13 setConfiguration:v10];
    [(TPInComingCallUISnapshotViewController *)v14 setStyle:a4];
    v15 = objc_opt_new();
    v16 = v15;
    if (v11) {
      v17 = v11;
    }
    else {
      v17 = &stru_1F1E807C8;
    }
    [v15 setGivenName:v17];
    [(TPInComingCallUISnapshotViewController *)v14 setContact:v16];
    [(TPInComingCallUISnapshotViewController *)v14 setCustomAvatar:v12];
  }
  return v14;
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5
{
  return [(TPInComingCallUISnapshotViewController *)self initWithConfiguration:a3 style:a4 contact:a5 avatarImage:0];
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 avatarImage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TPInComingCallUISnapshotViewController;
  v13 = [(TPInComingCallUISnapshotViewController *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(TPInComingCallUISnapshotViewController *)v13 setConfiguration:v10];
    [(TPInComingCallUISnapshotViewController *)v14 setStyle:a4];
    [(TPInComingCallUISnapshotViewController *)v14 setContact:v11];
    [(TPInComingCallUISnapshotViewController *)v14 setCustomAvatar:v12];
  }

  return v14;
}

- (id)nameString
{
  v3 = [(TPInComingCallUISnapshotViewController *)self configuration];

  v4 = [(TPInComingCallUISnapshotViewController *)self contact];
  if (v3) {
    +[TPIncomingCallMetricsProvider posterDisplayNameForContact:v4];
  }
  else {
  v5 = [v4 displayName];
  }

  return v5;
}

+ (id)posterDisplayNameComponentsForContact:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28F30] componentsForContact:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v5 setStyle:1];
  v6 = [v5 stringFromPersonNameComponents:v4];
  v7 = [v3 nickname];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [v3 nickname];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v11 = [v3 nickname];
      v28[0] = v11;
      id v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = (void **)v28;
LABEL_13:
      v18 = [v12 arrayWithObjects:v13 count:1];
      goto LABEL_18;
    }
  }
  [v5 setStyle:2];
  id v11 = [v3 givenName];
  if ([v11 length])
  {
    v14 = [v3 familyName];
    uint64_t v15 = [v14 length];

    if (!v15) {
      goto LABEL_11;
    }
    id v11 = [v5 stringFromPersonNameComponents:v4];
    objc_super v16 = [v3 givenName];
    if ([v11 rangeOfString:v16] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = [v3 familyName];
      if ([v11 rangeOfString:v17] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = [v11 rangeOfString:@" "];

        if (v23 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = [v3 givenName];
          v27[0] = v21;
          v24 = [v3 familyName];
          v27[1] = v24;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

          goto LABEL_16;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_10:

LABEL_11:
  [v5 setStyle:1];
  id v11 = [v5 stringFromPersonNameComponents:v4];
  if ([v11 length])
  {
    v26 = v11;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v26;
    goto LABEL_13;
  }
  objc_super v19 = [v3 organizationName];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    v21 = [v3 organizationName];
    v25 = v21;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
LABEL_16:

    goto LABEL_18;
  }
  v18 = 0;
LABEL_18:

  return v18;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TPInComingCallUISnapshotViewController;
  [(TPInComingCallUISnapshotViewController *)&v3 viewDidLoad];
  [(TPInComingCallUISnapshotViewController *)self setUpOverlayContentIfNeeded];
}

- (void)setUpOverlayContentIfNeeded
{
  objc_super v3 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];

  if (!v3)
  {
    [(TPInComingCallUISnapshotViewController *)self setUpOverlaysContainer];
    v4 = [(TPInComingCallUISnapshotViewController *)self view];
    id v5 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    [v4 addSubview:v5];

    [(TPInComingCallUISnapshotViewController *)self setupLabels];
    [(TPInComingCallUISnapshotViewController *)self setUpButton:1];
    [(TPInComingCallUISnapshotViewController *)self setUpButton:2];
    [(TPInComingCallUISnapshotViewController *)self setUpButton:3];
    [(TPInComingCallUISnapshotViewController *)self setUpButton:4];
    [(TPInComingCallUISnapshotViewController *)self setUpButton:5];
    [(TPInComingCallUISnapshotViewController *)self setupAvatarViewIfNeeded];
    [(TPInComingCallUISnapshotViewController *)self setUpConstraints];
    int64_t v6 = [(TPInComingCallUISnapshotViewController *)self style];
    [(TPInComingCallUISnapshotViewController *)self hideElementsBasedOn:v6];
  }
}

- (void)setUpOverlaysContainer
{
  if ([(TPInComingCallUISnapshotViewController *)self isViewLoaded]) {
    [(TPInComingCallUISnapshotViewController *)self view];
  }
  else {
  objc_super v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v7, v9, v11);
  [(TPInComingCallUISnapshotViewController *)self setOverlaysContainerView:v12];

  id v13 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v13 setAutoresizingMask:18];
}

- (void)setUpConstraints
{
  v153[2] = *MEMORY[0x1E4F143B8];
  +[TPIncomingCallMetricsProvider incomingCallAndInCallControlsBottomPadding];
  double v4 = v3;
  +[TPIncomingCallMetricsProvider sideMarginForDoubleButton];
  double v6 = v5;
  +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTop_ForSnapshot];
  double v8 = v7;
  +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrail_ForSnapshot];
  double v10 = v9;
  double v11 = [MEMORY[0x1E4F1CA48] array];
  v145 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
  v137 = [v145 topAnchor];
  v141 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  id v12 = [v141 topAnchor];
  id v13 = [v137 constraintEqualToAnchor:v12 constant:v8];
  v153[0] = v13;
  v14 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
  uint64_t v15 = [v14 trailingAnchor];
  objc_super v16 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-v10];
  v153[1] = v18;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:2];
  v149 = v11;
  [v11 addObjectsFromArray:v19];

  uint64_t v20 = [(TPInComingCallUISnapshotViewController *)self avatarView];

  if (v20)
  {
    v146 = [(TPInComingCallUISnapshotViewController *)self avatarView];
    v134 = [v146 topAnchor];
    v142 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v138 = [v142 safeAreaLayoutGuide];
    v131 = [v138 topAnchor];
    +[TPIncomingCallMetricsProvider twelvePercentOfDeviceHeight];
    v128 = objc_msgSend(v134, "constraintEqualToAnchor:constant:", v131);
    v152[0] = v128;
    v125 = [(TPInComingCallUISnapshotViewController *)self avatarView];
    v119 = [v125 leadingAnchor];
    v122 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v116 = [v122 safeAreaLayoutGuide];
    v113 = [v116 leadingAnchor];
    v110 = [v119 constraintEqualToAnchor:v113 constant:v6];
    v152[1] = v110;
    v107 = [(TPInComingCallUISnapshotViewController *)self avatarView];
    v104 = [v107 widthAnchor];
    +[TPUIConfiguration defaultHeight];
    v102 = objc_msgSend(v104, "constraintEqualToConstant:");
    v152[2] = v102;
    v100 = [(TPInComingCallUISnapshotViewController *)self avatarView];
    v98 = [v100 heightAnchor];
    +[TPUIConfiguration defaultHeight];
    v96 = objc_msgSend(v98, "constraintEqualToConstant:");
    v152[3] = v96;
    v94 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v88 = [v94 topAnchor];
    v92 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v90 = [v92 safeAreaLayoutGuide];
    v86 = [v90 topAnchor];
    +[TPIncomingCallMetricsProvider twelvePercentOfDeviceHeight];
    v84 = [v88 constraintEqualToAnchor:v86 constant:v21 + 4.0];
    v152[4] = v84;
    v82 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v78 = [v82 leadingAnchor];
    v80 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v76 = [v80 safeAreaLayoutGuide];
    v74 = [v76 leadingAnchor];
    v72 = [v78 constraintEqualToAnchor:v74];
    v152[5] = v72;
    v70 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v67 = [v70 topAnchor];
    v68 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v66 = [v68 bottomAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v152[6] = v65;
    v64 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v63 = [v64 leadingAnchor];
    v22 = [(TPInComingCallUISnapshotViewController *)self avatarView];
    uint64_t v23 = [v22 trailingAnchor];
    v24 = [v63 constraintEqualToAnchor:v23 constant:16.0];
    v152[7] = v24;
    v25 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v26 = [v25 trailingAnchor];
    v27 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v28 = [v27 trailingAnchor];
    double v29 = -v6;
    v30 = [v26 constraintEqualToAnchor:v28 constant:-v6];
    v152[8] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:9];
    [v149 addObjectsFromArray:v31];
  }
  else
  {
    v147 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v135 = [v147 topAnchor];
    v143 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v139 = [v143 safeAreaLayoutGuide];
    v132 = [v139 topAnchor];
    +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight];
    v129 = objc_msgSend(v135, "constraintEqualToAnchor:constant:", v132);
    v151[0] = v129;
    v126 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v120 = [v126 centerXAnchor];
    v123 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v117 = [v123 safeAreaLayoutGuide];
    v114 = [v117 centerXAnchor];
    v111 = [v120 constraintEqualToAnchor:v114];
    v151[1] = v111;
    v108 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v105 = [v108 topAnchor];
    v32 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v33 = [v32 bottomAnchor];
    v34 = [v105 constraintEqualToAnchor:v33 constant:2.0];
    v151[2] = v34;
    v35 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
    v36 = [v35 centerXAnchor];
    v37 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    v38 = [v37 centerXAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    v151[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:4];
    [v149 addObjectsFromArray:v40];

    double v29 = -v6;
  }
  v148 = [(TPInComingCallUISnapshotViewController *)self declineButton];
  v41 = [v148 bottomAnchor];
  v140 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v140 bottomAnchor];
  double v42 = -v4;
  v136 = v144 = v41;
  v133 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);
  v150[0] = v133;
  v130 = [(TPInComingCallUISnapshotViewController *)self declineButton];
  v43 = [v130 leadingAnchor];
  v124 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v124 leadingAnchor];
  v121 = v127 = v43;
  v118 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v6);
  v150[1] = v118;
  v115 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
  v44 = [v115 bottomAnchor];
  v109 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v109 bottomAnchor];
  v106 = v112 = v44;
  v103 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v42);
  v150[2] = v103;
  v101 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
  v45 = [v101 trailingAnchor];
  v97 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v97 trailingAnchor];
  v95 = v99 = v45;
  v93 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v29);
  v150[3] = v93;
  v91 = [(TPInComingCallUISnapshotViewController *)self messageButton];
  v46 = [v91 centerXAnchor];
  v87 = [(TPInComingCallUISnapshotViewController *)self declineButton];
  [v87 centerXAnchor];
  v85 = v89 = v46;
  v83 = objc_msgSend(v46, "constraintEqualToAnchor:");
  v150[4] = v83;
  v81 = [(TPInComingCallUISnapshotViewController *)self messageButton];
  v47 = [v81 bottomAnchor];
  v77 = [(TPInComingCallUISnapshotViewController *)self declineButton];
  uint64_t v48 = [v77 topAnchor];
  unint64_t v49 = +[TPUIConfiguration inCallBottomBarSpacing];
  float v50 = 30.0;
  LODWORD(v51) = 30.0;
  if (v49 != 6)
  {
    unint64_t v52 = +[TPUIConfiguration inCallBottomBarSpacing];
    LODWORD(v51) = 24.0;
    if (v52 == 3) {
      *(float *)&double v51 = 30.0;
    }
  }
  v79 = v47;
  v75 = (void *)v48;
  v73 = [v47 constraintEqualToAnchor:v48 constant:(float)-*(float *)&v51];
  v150[5] = v73;
  v71 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
  v53 = [v71 centerXAnchor];
  v54 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
  v55 = [v54 centerXAnchor];
  v69 = v53;
  v56 = [v53 constraintEqualToAnchor:v55];
  v150[6] = v56;
  v57 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
  v58 = [v57 bottomAnchor];
  v59 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
  v60 = [v59 topAnchor];
  if (+[TPUIConfiguration inCallBottomBarSpacing] != 6)
  {
    if (+[TPUIConfiguration inCallBottomBarSpacing] == 3) {
      float v50 = 30.0;
    }
    else {
      float v50 = 24.0;
    }
  }
  v61 = [v58 constraintEqualToAnchor:v60 constant:(float)-v50];
  v150[7] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:8];
  [v149 addObjectsFromArray:v62];

  [MEMORY[0x1E4F28DC8] activateConstraints:v149];
}

- (void)setupLabels
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  double v3 = (void *)getPRPosterLabelClass_softClass;
  uint64_t v28 = getPRPosterLabelClass_softClass;
  if (!getPRPosterLabelClass_softClass)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __getPRPosterLabelClass_block_invoke;
    v24[3] = &unk_1E647C010;
    v24[4] = &v25;
    __getPRPosterLabelClass_block_invoke((uint64_t)v24);
    double v3 = (void *)v26[3];
  }
  double v4 = v3;
  _Block_object_dispose(&v25, 8);
  id v5 = objc_alloc_init(v4);
  [(TPInComingCallUISnapshotViewController *)self setMobileLabel:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(TPInComingCallUISnapshotViewController *)self setNameLabel:v6];

  double v7 = [(TPInComingCallUISnapshotViewController *)self nameString];
  double v8 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v8 setText:v7];

  double v9 = TelephonyUIBundle();
  double v10 = [v9 localizedStringForKey:@"MOBILE" value:&stru_1F1E807C8 table:@"General"];
  double v11 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  [v11 setText:v10];

  id v12 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  id v13 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  [v12 addSubview:v13];

  v14 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  uint64_t v15 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v14 addSubview:v15];

  objc_super v16 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v18 setMarqueeEnabled:1];

  objc_super v19 = [(TPInComingCallUISnapshotViewController *)self avatarView];
  if (v19) {
    +[TPIncomingCallMetricsProvider nameLabelFontWithAvatar];
  }
  else {
  uint64_t v20 = +[TPIncomingCallMetricsProvider nameLabelFont];
  }
  double v21 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v21 setFont:v20];

  v22 = +[TPIncomingCallMetricsProvider mobileLabelFont];
  uint64_t v23 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  [v23 setFont:v22];
}

- (void)setupAvatarViewIfNeeded
{
  double v3 = [(TPInComingCallUISnapshotViewController *)self customAvatar];

  if (v3)
  {
    double v4 = [(TPInComingCallUISnapshotViewController *)self customAvatar];
  }
  else
  {
    id v5 = [(TPInComingCallUISnapshotViewController *)self contact];
    id v6 = [v5 thumbnailImageData];

    if (v6)
    {
      double v7 = (void *)MEMORY[0x1E4FB1818];
      double v8 = [(TPInComingCallUISnapshotViewController *)self contact];
      double v9 = [v8 thumbnailImageData];
      double v4 = [v7 imageWithData:v9];
    }
    else
    {
      double v4 = 0;
    }
  }
  if ([(TPInComingCallUISnapshotViewController *)self style] != 6) {
    goto LABEL_16;
  }
  double v10 = [(TPInComingCallUISnapshotViewController *)self avatarView];

  if (v10 || !v4) {
    goto LABEL_16;
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
  [(TPInComingCallUISnapshotViewController *)self setAvatarView:v11];

  id v12 = [(TPInComingCallUISnapshotViewController *)self avatarView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  +[TPUIConfiguration defaultHeight];
  double v14 = v13 * 0.5;
  uint64_t v15 = [(TPInComingCallUISnapshotViewController *)self avatarView];
  objc_super v16 = [v15 layer];
  [v16 setCornerRadius:v14];

  v17 = [(TPInComingCallUISnapshotViewController *)self avatarView];
  v18 = [v17 layer];
  [v18 setMasksToBounds:1];

  objc_super v19 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  uint64_t v20 = [(TPInComingCallUISnapshotViewController *)self avatarView];
  [v19 addSubview:v20];

  double v21 = [(TPInComingCallUISnapshotViewController *)self customAvatar];
  if (v21)
  {
  }
  else
  {
    double v29 = [(TPInComingCallUISnapshotViewController *)self contact];
    v30 = [v29 contactImageBackgroundColors];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      v32 = [(TPInComingCallUISnapshotViewController *)self contact];
      v33 = [v32 contactImageBackgroundColors];

      if (!v33) {
        goto LABEL_16;
      }
      v24 = [(TPInComingCallUISnapshotViewController *)self contact];
      v34 = [v24 contactImageBackgroundColors];
      uint64_t v25 = [v34 firstObject];

      goto LABEL_14;
    }
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  v22 = (void *)getCNImageDerivedColorGeneratorClass_softClass;
  uint64_t v39 = getCNImageDerivedColorGeneratorClass_softClass;
  if (!getCNImageDerivedColorGeneratorClass_softClass)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __getCNImageDerivedColorGeneratorClass_block_invoke;
    v35[3] = &unk_1E647C010;
    v35[4] = &v36;
    __getCNImageDerivedColorGeneratorClass_block_invoke((uint64_t)v35);
    v22 = (void *)v37[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v36, 8);
  v24 = objc_msgSend(v23, "colorsForImageRef:", objc_msgSend(v4, "CGImage"));
  uint64_t v25 = [v24 firstObject];
LABEL_14:

  if (v25)
  {
    v26 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v27 = [v26 colorWithAlphaComponent:0.1];
    uint64_t v28 = [v25 _colorBlendedWithColor:v27];

    [(TPInComingCallUISnapshotViewController *)self setBackroundColor:v28];
  }
LABEL_16:
}

- (void)setUpButton:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      double v4 = [TPInComingCallBottomBarSupplementalButton alloc];
      id v5 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TPInComingCallUISnapshotViewController *)self setRemindMeButton:v5];

      id v6 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
      double v7 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v6 addSubview:v7];

      double v8 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v56 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:39 textStyle:*MEMORY[0x1E4FB2998] scale:-1 isStaticSize:1];
      double v9 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v9 setImage:v56 forState:0];

      double v10 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      double v11 = TelephonyUIBundle();
      id v12 = v11;
      double v13 = @"CALL_BACK_LATER";
      goto LABEL_4;
    case 2:
      double v14 = [TPInComingCallBottomBarSupplementalButton alloc];
      uint64_t v15 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TPInComingCallUISnapshotViewController *)self setMessageButton:v15];

      objc_super v16 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
      v17 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v16 addSubview:v17];

      v18 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v56 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:14 textStyle:*MEMORY[0x1E4FB2998] scale:-1 isStaticSize:1];
      objc_super v19 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v19 setImage:v56 forState:0];

      double v10 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      double v11 = TelephonyUIBundle();
      id v12 = v11;
      double v13 = @"SEND_MESSAGE";
LABEL_4:
      uint64_t v20 = [v11 localizedStringForKey:v13 value:&stru_1F1E807C8 table:@"General"];
      [v10 setTitle:v20 forState:0];

      goto LABEL_8;
    case 3:
      double v21 = objc_alloc_init(TPInComingCallBottomBarButton);
      [(TPInComingCallUISnapshotViewController *)self setDeclineButton:v21];

      v22 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
      id v23 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v22 addSubview:v23];

      v24 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v56 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:2 textStyle:*MEMORY[0x1E4FB2988] scale:3 isStaticSize:1];
      uint64_t v25 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v25 setImage:v56 forState:0];

      v26 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      uint64_t v27 = TelephonyUIBundle();
      uint64_t v28 = [v27 localizedStringForKey:@"DECLINE" value:&stru_1F1E807C8 table:@"General"];
      [v26 setTitle:v28 forState:0];

      double v29 = [MEMORY[0x1E4FB1618] systemRedColor];
      v30 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v30 setBackgroundColor:v29];

      uint64_t v31 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      v32 = [v31 titleLabel];
      [v32 setAdjustsFontSizeToFitWidth:0];

      v33 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      v34 = [v33 titleLabel];
      [v34 setPreferredMaxLayoutWidth:105.0];

      v35 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      goto LABEL_7;
    case 4:
      uint64_t v36 = objc_alloc_init(TPInComingCallBottomBarButton);
      [(TPInComingCallUISnapshotViewController *)self setAcceptButton:v36];

      v37 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
      uint64_t v38 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v37 addSubview:v38];

      uint64_t v39 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v56 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:1 textStyle:*MEMORY[0x1E4FB2988] scale:3 isStaticSize:1];
      v40 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v40 setImage:v56 forState:0];

      v41 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      double v42 = TelephonyUIBundle();
      v43 = [v42 localizedStringForKey:@"ACCEPT" value:&stru_1F1E807C8 table:@"General"];
      [v41 setTitle:v43 forState:0];

      v44 = [MEMORY[0x1E4FB1618] systemGreenColor];
      v45 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v45 setBackgroundColor:v44];

      v46 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      v47 = [v46 titleLabel];
      [v47 setAdjustsFontSizeToFitWidth:0];

      uint64_t v48 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      unint64_t v49 = [v48 titleLabel];
      [v49 setPreferredMaxLayoutWidth:105.0];

      v35 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
LABEL_7:
      double v10 = v35;
      [v35 setClipsToBounds:0];
LABEL_8:

      break;
    case 5:
      float v50 = [MEMORY[0x1E4FB14D0] buttonWithType:4];
      [(TPInComingCallUISnapshotViewController *)self setCallDetailsViewButton:v50];

      double v51 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      unint64_t v52 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v52 setTintColor:v51];

      v53 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

      v54 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
      v55 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v54 addSubview:v55];

      [(TPInComingCallUISnapshotViewController *)self capCallDetailsViewButtonSize];
      break;
    default:
      return;
  }
}

- (void)capCallDetailsViewButtonSize
{
  id v3 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
  v2 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
  [v3 setMaximumContentSizeCategory:v2];
}

- (void)hideElementsBasedOn:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v12 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v12 setHidden:1];

      double v13 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v13 setHidden:1];

      double v14 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v14 setHidden:1];

      uint64_t v15 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v15 setHidden:1];

      objc_super v16 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v16 setHidden:1];

      v17 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
      [v17 setHidden:1];

      v18 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
      goto LABEL_6;
    case 1:
    case 2:
      id v5 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v5 setHidden:1];

      id v6 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v6 setHidden:1];

      double v7 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v7 setHidden:1];

      double v8 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v8 setHidden:1];

      double v9 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v9 setHidden:1];

      goto LABEL_3;
    case 3:
LABEL_3:
      double v10 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
      [v10 setHidden:1];

      double v11 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
      goto LABEL_7;
    case 4:
      objc_super v19 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
      [v19 setHidden:1];

      uint64_t v20 = [(TPInComingCallUISnapshotViewController *)self declineButton];
      [v20 setHidden:1];

      double v21 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
      [v21 setHidden:1];

      v22 = [(TPInComingCallUISnapshotViewController *)self messageButton];
      [v22 setHidden:1];

      id v23 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
      [v23 setHidden:1];

      v18 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
LABEL_6:
      v24 = v18;
      [v18 setHidden:1];

      double v11 = [(TPInComingCallUISnapshotViewController *)self fakeLabel];
LABEL_7:
      id v25 = v11;
      [v11 setHidden:1];

      break;
    default:
      return;
  }
}

- (void)setNameLabelFont:(id)a3
{
  id v4 = a3;
  id v5 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v5 setFont:v4];

  id v6 = [(TPInComingCallUISnapshotViewController *)self fakeLabel];
  [v6 setFont:v4];
}

- (void)setNameLabelTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TPInComingCallUISnapshotViewController *)self nameLabel];
  [v5 setTextColor:v4];

  id v6 = [(TPInComingCallUISnapshotViewController *)self fakeLabel];
  [v6 setTextColor:v4];
}

- (void)setBackroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v5 setBackgroundColor:v4];

  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 _colorDifferenceFromColor:v6];
  double v8 = v7;

  if (v8 > 0.5) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  }
  [(TPInComingCallUISnapshotViewController *)self setLabelsColor:v9];
}

- (void)setLabelsColor:(id)a3
{
  id v4 = a3;
  [(TPInComingCallUISnapshotViewController *)self setNameLabelTextColor:v4];
  id v5 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  [v5 setTextColor:v4];

  id v6 = [(TPInComingCallUISnapshotViewController *)self acceptButton];
  [v6 setTitleColor:v4 forState:0];

  double v7 = [(TPInComingCallUISnapshotViewController *)self declineButton];
  [v7 setTitleColor:v4 forState:0];

  double v8 = [(TPInComingCallUISnapshotViewController *)self messageButton];
  [v8 setTitleColor:v4 forState:0];

  id v9 = [(TPInComingCallUISnapshotViewController *)self remindMeButton];
  [v9 setTitleColor:v4 forState:0];
}

- (id)generateOverlaysSnapshot
{
  [(TPInComingCallUISnapshotViewController *)self setUpOverlayContentIfNeeded];
  uint64_t v3 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  id v4 = [v3 layer];

  id v5 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v18.width = v7;
  v18.height = v9;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  double v14 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
  [v14 frame];
  CGContextClipToRect(CurrentContext, v19);

  [v4 renderInContext:UIGraphicsGetCurrentContext()];
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)identifierForStyle
{
  int64_t v2 = [(TPInComingCallUISnapshotViewController *)self style];
  if (v2 == 1)
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v3 = (void **)getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr;
    uint64_t v12 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr)
    {
      id v5 = (void *)PosterBoardUIServicesLibrary();
      v10[3] = (uint64_t)dlsym(v5, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView");
      getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr = v10[3];
      uint64_t v3 = (void **)v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v3) {
      -[TPInComingCallUISnapshotViewController identifierForStyle]();
    }
  }
  else if (v2)
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v3 = (void **)getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr;
    uint64_t v12 = getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr)
    {
      double v6 = (void *)PosterBoardUIServicesLibrary();
      v10[3] = (uint64_t)dlsym(v6, "PRPosterSnapshotDefinitionIdentifierIncomingCallComposite");
      getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr = v10[3];
      uint64_t v3 = (void **)v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v3) {
      -[TPInComingCallUISnapshotViewController identifierForStyle]();
    }
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v3 = (void **)getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr;
    uint64_t v12 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr)
    {
      id v4 = (void *)PosterBoardUIServicesLibrary();
      v10[3] = (uint64_t)dlsym(v4, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly");
      getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr = v10[3];
      uint64_t v3 = (void **)v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v3) {
      -[TPInComingCallUISnapshotViewController identifierForStyle]();
    }
  }
  CGFloat v7 = *v3;
  return v7;
}

- (id)attachmentIdentifiersForStyle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(TPInComingCallUISnapshotViewController *)self style];
  id v4 = @"TPUI_MobileLabel";
  if (v3 != 2) {
    id v4 = 0;
  }
  if (v3 == 3) {
    id v4 = @"TPUI_MobileLabelAndBottomBarAndInfoLabel";
  }
  id v5 = v4;
  double v6 = 0;
  if ((unint64_t)([(TPInComingCallUISnapshotViewController *)self style] - 1) <= 2)
  {
    if (v5)
    {
      double v13 = v5;
      CGFloat v7 = getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel();
      double v14 = v7;
      double v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = &v13;
      uint64_t v10 = 2;
    }
    else
    {
      CGFloat v7 = getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel();
      uint64_t v12 = v7;
      double v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = (__CFString **)&v12;
      uint64_t v10 = 1;
    }
    double v6 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v12, v13, v14);
  }
  return v6;
}

- (id)attachmentsForStyle
{
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2050000000;
  int64_t v3 = (void *)getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass;
  uint64_t v73 = getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass;
  if (!getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass)
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke;
    v69[3] = &unk_1E647C010;
    v69[4] = &v70;
    __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke((uint64_t)v69);
    int64_t v3 = (void *)v71[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v70, 8);
  id v5 = [v4 alloc];
  double v6 = [(TPInComingCallUISnapshotViewController *)self configuration];
  CGFloat v7 = (void *)[v5 initWithPRSConfiguration:v6];

  int64_t v8 = [(TPInComingCallUISnapshotViewController *)self style];
  int64_t v9 = [(TPInComingCallUISnapshotViewController *)self style];
  if ((unint64_t)(v9 - 2) >= 2)
  {
    if (v9 != 1)
    {
      uint64_t v10 = 0;
      goto LABEL_29;
    }
    [(TPInComingCallUISnapshotViewController *)self setUpOverlayContentIfNeeded];
  }
  else
  {
    [(TPInComingCallUISnapshotViewController *)self setUpOverlayContentIfNeeded];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v11 = [v7 overlayContentView];
    uint64_t v12 = [v7 overlayContentView];
    double v13 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    [v12 addSubview:v13];

    [v11 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(TPInComingCallUISnapshotViewController *)self overlaysContainerView];
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    id v23 = [v7 overlayContentAttachment];
    if (v23) {
      [v10 addObject:v23];
    }

    [(TPInComingCallUISnapshotViewController *)self setUpOverlayContentIfNeeded];
    if (v10) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
LABEL_11:
  v24 = [v7 vibrantObscurableContentView];
  if (v8 == 1)
  {
    id v25 = 0;
  }
  else
  {
    v26 = TelephonyUIBundle();
    id v25 = [v26 localizedStringForKey:@"MOBILE" value:&stru_1F1E807C8 table:@"General"];
  }
  unint64_t v27 = 0x1E647B000uLL;
  uint64_t v28 = [(TPInComingCallUISnapshotViewController *)self contact];
  double v29 = +[TPIncomingCallMetricsProvider appropriateCallerNameViewForContact:v28 callStatus:v25 callIsActive:0 optionalBackupName:0];

  [v7 applyPosterAppearanceToObserver:v29];
  if ([v29 layout] != 1 || (objc_msgSend(v29, "statusIsSuitableForVerticalLayout") & 1) != 0 || v8 == 1)
  {
    v43 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v68[0] = *MEMORY[0x1E4F1DAB8];
    v68[1] = v44;
    v68[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v43 setTransform:v68];

    v45 = +[TPIncomingCallMetricsProvider mobileLabelFont];
    v46 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    [v46 setFont:v45];

    v40 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v41 = v40;
    uint64_t v42 = 1;
  }
  else
  {
    [(TPInComingCallUISnapshotViewController *)self moveMobileLabelToBeYAxisCenteredWithInfoButton];
    v30 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
    uint64_t v31 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
    [v30 setMaximumContentSizeCategory:v31];

    v32 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    [v7 applyPosterAppearanceToObserver:v32];

    v33 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v34 = [v33 font];
    [v34 fontWithSize:22.0];
    v35 = v10;
    uint64_t v36 = v25;
    uint64_t v38 = v37 = v24;
    uint64_t v39 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    [v39 setFont:v38];

    v24 = v37;
    id v25 = v36;
    uint64_t v10 = v35;
    unint64_t v27 = 0x1E647B000;

    v40 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
    v41 = v40;
    uint64_t v42 = 0;
  }
  [v40 setHidden:v42];

  [*(id *)(v27 + 2704) addCallerNameView:v29 toContainerView:v24];
  v47 = [v29 emojiViewController];

  if (v47)
  {
    uint64_t v48 = [v7 obscurableOverlayView];
    unint64_t v49 = [v29 emojiViewController];
    float v50 = [v49 view];
    [v48 addSubview:v50];
  }
  if (objc_opt_respondsToSelector())
  {
    double v51 = [v7 vibrantObscurableContentView];
    [v51 setNeedsLayout];

    unint64_t v52 = [v7 vibrantObscurableContentView];
    [v52 layoutIfNeeded];

    v53 = [v29 emojiViewController];

    if (v53)
    {
      v54 = [v29 viewController];
      v55 = [v54 view];
      [v55 frame];
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;

      v64 = [v29 emojiViewController];
      v65 = [v64 view];
      objc_msgSend(v65, "setFrame:", v57, v59, v61, v63);
    }
    [v29 tightFrame];
    objc_msgSend(v7, "setPrimaryContentTightFrame:");
  }
  v66 = [v7 obscurableContentAttachment];
  if (v66) {
    [v10 addObject:v66];
  }

LABEL_29:
  return v10;
}

- (void)moveMobileLabelToBeYAxisCenteredWithInfoButton
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v13 = (void *)MEMORY[0x1E4F28DC8];
  double v14 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  int64_t v3 = [v14 topAnchor];
  id v4 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
  id v5 = [v4 topAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5 constant:0.0];
  v15[0] = v6;
  CGFloat v7 = [(TPInComingCallUISnapshotViewController *)self mobileLabel];
  int64_t v8 = [v7 centerYAnchor];
  int64_t v9 = [(TPInComingCallUISnapshotViewController *)self callDetailsViewButton];
  uint64_t v10 = [v9 centerYAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10 constant:0.0];
  v15[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v13 activateConstraints:v12];
}

- (void)snapshotWithOptions:(unint64_t)a3 completionBlock:(id)a4
{
}

- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 completionBlock:(id)a5
{
}

- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 useAttachmentConfiguration:(BOOL)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unint64_t v11 = [(TPInComingCallUISnapshotViewController *)self style];
  if (v11 < 4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_2;
    v13[3] = &unk_1E647BFE8;
    v13[4] = self;
    BOOL v16 = a5;
    uint64_t v12 = &v14;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v13);

LABEL_5:
    goto LABEL_6;
  }
  if (v11 - 4 <= 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke;
    block[3] = &unk_1E647BF48;
    block[4] = self;
    uint64_t v12 = &v18;
    id v18 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_5;
  }
LABEL_6:
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
  [v2 updateTraitsIfNeeded];

  id v3 = [*(id *)(a1 + 32) generateOverlaysSnapshot];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
    id v3 = [v2 superview];
    id v4 = [*(id *)(a1 + 32) viewIfLoaded];
    BOOL v5 = v3 == v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  double v6 = [*(id *)(a1 + 32) overlaysContainerView];
  [v6 removeFromSuperview];

  objc_msgSend(*(id *)(a1 + 32), "hideElementsBasedOn:", objc_msgSend(*(id *)(a1 + 32), "style"));
  CGFloat v7 = [*(id *)(a1 + 32) nameLabel];
  int64_t v8 = [v7 text];

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2050000000;
  id v9 = (void *)getPRUISIncomingCallPosterContextClass_softClass;
  uint64_t v85 = getPRUISIncomingCallPosterContextClass_softClass;
  if (!getPRUISIncomingCallPosterContextClass_softClass)
  {
    uint64_t v77 = MEMORY[0x1E4F143A8];
    uint64_t v78 = 3221225472;
    v79 = __getPRUISIncomingCallPosterContextClass_block_invoke;
    v80 = &unk_1E647C010;
    v81 = &v82;
    __getPRUISIncomingCallPosterContextClass_block_invoke((uint64_t)&v77);
    id v9 = (void *)v83[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v82, 8);
  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:v8 window:0];
  double v65 = v11;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:v8 window:0];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = [v10 alloc];
  unint64_t v27 = [*(id *)(a1 + 32) nameLabel];
  uint64_t v28 = [v27 text];
  uint64_t v29 = objc_msgSend(v26, "initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v28, 0, 1, v65, v13, v15, v17, v19, v21, v23, v25);

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2050000000;
  v30 = (void *)getPRUISIncomingCallSnapshotDefinitionClass_softClass;
  uint64_t v85 = getPRUISIncomingCallSnapshotDefinitionClass_softClass;
  if (!getPRUISIncomingCallSnapshotDefinitionClass_softClass)
  {
    uint64_t v77 = MEMORY[0x1E4F143A8];
    uint64_t v78 = 3221225472;
    v79 = __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke;
    v80 = &unk_1E647C010;
    v81 = &v82;
    __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke((uint64_t)&v77);
    v30 = (void *)v83[3];
  }
  uint64_t v31 = v30;
  _Block_object_dispose(&v82, 8);
  id v32 = [v31 alloc];
  v33 = [*(id *)(a1 + 32) identifierForStyle];
  v34 = [*(id *)(a1 + 32) attachmentIdentifiersForStyle];
  v35 = (void *)[v32 initWithBaseIdentifier:v33 context:v29 attachmentUniqueIdentifiers:v34];

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2050000000;
  uint64_t v36 = (void *)getPRUISMutablePosterSnapshotRequestClass_softClass;
  uint64_t v85 = getPRUISMutablePosterSnapshotRequestClass_softClass;
  if (!getPRUISMutablePosterSnapshotRequestClass_softClass)
  {
    uint64_t v77 = MEMORY[0x1E4F143A8];
    uint64_t v78 = 3221225472;
    v79 = __getPRUISMutablePosterSnapshotRequestClass_block_invoke;
    v80 = &unk_1E647C010;
    v81 = &v82;
    __getPRUISMutablePosterSnapshotRequestClass_block_invoke((uint64_t)&v77);
    uint64_t v36 = (void *)v83[3];
  }
  id v37 = v36;
  _Block_object_dispose(&v82, 8);
  uint64_t v38 = [*(id *)(a1 + 32) configuration];
  uint64_t v39 = [v37 snapshotRequestForPRSPosterConfiguration:v38 definition:v35 interfaceOrientation:1];

  if (*(unsigned char *)(a1 + 56) && *(void *)(a1 + 40))
  {
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2050000000;
    v40 = (void *)getPRUISPosterAttachmentConfigurationClass_softClass;
    uint64_t v85 = getPRUISPosterAttachmentConfigurationClass_softClass;
    if (!getPRUISPosterAttachmentConfigurationClass_softClass)
    {
      uint64_t v77 = MEMORY[0x1E4F143A8];
      uint64_t v78 = 3221225472;
      v79 = __getPRUISPosterAttachmentConfigurationClass_block_invoke;
      v80 = &unk_1E647C010;
      v81 = &v82;
      __getPRUISPosterAttachmentConfigurationClass_block_invoke((uint64_t)&v77);
      v40 = (void *)v83[3];
    }
    id v41 = v40;
    _Block_object_dispose(&v82, 8);
    uint64_t v42 = *(void *)(a1 + 40);
    uint64_t v43 = [*(id *)(a1 + 32) attachmentsForStyle];
    long long v44 = (void *)v43;
    if (v43) {
      uint64_t v45 = v43;
    }
    else {
      uint64_t v45 = MEMORY[0x1E4F1CBF0];
    }
    v46 = [v41 attachmentConfigurationWithHostWindowScene:v42 attachments:v45];

    [v39 setAttachmentConfiguration:v46];
  }
  else
  {
    v46 = [*(id *)(a1 + 32) attachmentsForStyle];
    [v39 setAttachments:v46];
  }

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2050000000;
  v47 = (void *)getPRUISPosterSnapshotControllerClass_softClass;
  uint64_t v85 = getPRUISPosterSnapshotControllerClass_softClass;
  if (!getPRUISPosterSnapshotControllerClass_softClass)
  {
    uint64_t v77 = MEMORY[0x1E4F143A8];
    uint64_t v78 = 3221225472;
    v79 = __getPRUISPosterSnapshotControllerClass_block_invoke;
    v80 = &unk_1E647C010;
    v81 = &v82;
    __getPRUISPosterSnapshotControllerClass_block_invoke((uint64_t)&v77);
    v47 = (void *)v83[3];
  }
  uint64_t v64 = a1;
  v66 = (void *)v29;
  id v48 = v47;
  _Block_object_dispose(&v82, 8);
  unint64_t v49 = [v48 sharedIncomingCallSnapshotController];
  id v76 = 0;
  float v50 = [v49 latestSnapshotBundleForRequest:v39 error:&v76];
  id v51 = v76;
  if (!v50) {
    goto LABEL_24;
  }
  [v35 levelSets];
  unint64_t v52 = v49;
  v53 = v39;
  id v54 = v51;
  v55 = v35;
  double v56 = v8;
  v58 = BOOL v57 = v5;
  double v59 = [v58 firstObject];
  double v60 = [v50 snapshotForLevelSet:v59];

  BOOL v5 = v57;
  int64_t v8 = v56;
  v35 = v55;
  id v51 = v54;
  uint64_t v39 = v53;
  unint64_t v49 = v52;
  if (v60)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_3;
    block[3] = &unk_1E647BF70;
    BOOL v75 = v5;
    block[4] = *(void *)(v64 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    (*(void (**)(void))(*(void *)(v64 + 48) + 16))();
  }
  else
  {
LABEL_24:
    double v61 = dispatch_get_global_queue(-32768, 0);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_4;
    v67[3] = &unk_1E647BFC0;
    id v68 = v49;
    id v69 = v39;
    id v62 = *(id *)(v64 + 48);
    BOOL v73 = v5;
    uint64_t v63 = *(void *)(v64 + 32);
    id v72 = v62;
    uint64_t v70 = v63;
    id v71 = v35;
    dispatch_async(v61, v67);

    double v60 = v68;
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) view];
    int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
    [v3 addSubview:v2];
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_4(uint64_t a1)
{
  int64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_5;
  v7[3] = &unk_1E647BF98;
  id v4 = *(id *)(a1 + 64);
  char v10 = *(unsigned char *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  double v6 = *(void **)(a1 + 56);
  id v9 = v4;
  v7[4] = v5;
  id v8 = v6;
  [v2 executeSnapshotRequest:v3 completion:v7];
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = [a3 snapshotBundle];
    uint64_t v5 = [*(id *)(a1 + 40) levelSets];
    double v6 = [v5 firstObject];
    CGFloat v7 = [v4 snapshotForLevelSet:v6];

    uint64_t v8 = *(void *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(void, void *, void))(v8 + 16))(*(void *)(a1 + 48), v7, 0);
      id v9 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      char v10 = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_7;
    }
    else
    {
      double v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"Snapshot generation returned nil snapshot";
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      double v13 = [v11 errorWithDomain:@"com.apple.TPInComingCallUISnapshotViewController" code:-1 userInfo:v12];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v13);

      id v9 = v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      char v10 = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_8;
    }
    v9[2] = v10;
    v9[3] = &unk_1E647BF70;
    *((unsigned char *)v9 + 40) = *(unsigned char *)(a1 + 56);
    v9[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_6;
    block[3] = &unk_1E647BF70;
    char v17 = *(unsigned char *)(a1 + 56);
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) view];
    int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
    [v3 addSubview:v2];
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) view];
    int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
    [v3 addSubview:v2];
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) view];
    int64_t v2 = [*(id *)(a1 + 32) overlaysContainerView];
    [v3 addSubview:v2];
  }
}

- (UIView)overlaysContainerView
{
  return self->_overlaysContainerView;
}

- (void)setOverlaysContainerView:(id)a3
{
}

- (PRPosterLabel)mobileLabel
{
  return self->_mobileLabel;
}

- (void)setMobileLabel:(id)a3
{
}

- (UIButton)remindMeButton
{
  return self->_remindMeButton;
}

- (void)setRemindMeButton:(id)a3
{
}

- (UIButton)messageButton
{
  return self->_messageButton;
}

- (void)setMessageButton:(id)a3
{
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
}

- (UIButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
}

- (UIButton)callDetailsViewButton
{
  return self->_callDetailsViewButton;
}

- (void)setCallDetailsViewButton:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UILabel)fakeLabel
{
  return self->_fakeLabel;
}

- (void)setFakeLabel:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (UIImage)customAvatar
{
  return self->_customAvatar;
}

- (void)setCustomAvatar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAvatar, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_fakeLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_remindMeButton, 0);
  objc_storeStrong((id *)&self->_mobileLabel, 0);
  objc_storeStrong((id *)&self->_overlaysContainerView, 0);
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 fallbackText:(id)a6
{
  id v10 = a6;
  if (a5)
  {
    id v11 = a3;
    double v12 = [(TPInComingCallUISnapshotViewController *)self initWithConfiguration:v11 style:a4 contact:a5];

    double v13 = v12;
  }
  else
  {
    double v14 = (objc_class *)MEMORY[0x1E4F1BA40];
    id v15 = a3;
    id v16 = objc_alloc_init(v14);
    [v16 setGivenName:v10];
    char v17 = [(TPInComingCallUISnapshotViewController *)self initWithConfiguration:v15 style:a4 contact:v16];

    double v13 = v17;
  }

  return v13;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:a3 caption:0 window:a4 preferredTitleFont:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:a3 caption:a4 window:a5 preferredTitleFont:a6];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:a3 caption:0 window:a4 preferredTitleFont:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:a3 caption:a4 window:a5 preferredTitleFont:a6];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)identifierForStyle
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"PRPosterSnapshotDefinitionIdentifier getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 68, @"%s", dlerror());

  __break(1u);
}

@end