@interface PNPHandwritingGesturesViewController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (UIStackView)bulletListView;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5;
- (void)addDeleteBulletItem;
- (void)addSpaceBulletItem;
- (void)setBulletListView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PNPHandwritingGesturesViewController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = [PNPHandwritingGesturesViewController alloc];
  v11 = PencilPairingUIBundle();
  v12 = [v11 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  v13 = PencilPairingUIBundle();
  v14 = [v13 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_DETAIL" value:&stru_26ECD9920 table:@"PencilSettings"];
  v15 = [(PNPHandwritingGesturesViewController *)v10 initWithTitle:v12 detailText:v14 icon:0 contentLayout:2];

  [(PNPWelcomeController *)v15 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v9];
  return v15;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PNPHandwritingGesturesViewController;
  [(OBBaseWelcomeController *)&v21 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBlueColor];
  v4 = [(PNPHandwritingGesturesViewController *)self view];
  [v4 setTintColor:v3];

  v5 = [(PNPHandwritingGesturesViewController *)self contentView];
  id v6 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v6 setAxis:1];
  [v6 setSpacing:48.0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v6];
  v7 = [v6 leadingAnchor];
  v8 = [v5 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:-18.0];
  [v9 setActive:1];

  v10 = [v6 trailingAnchor];
  v11 = [v5 trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:18.0];
  [v12 setActive:1];

  v13 = [v6 topAnchor];
  v14 = [v5 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v6 bottomAnchor];
  v17 = [v5 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  [(PNPHandwritingGesturesViewController *)self setBulletListView:v6];
  id v19 = objc_alloc(MEMORY[0x263F1CB60]);
  v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 addArrangedSubview:v20];

  [(PNPHandwritingGesturesViewController *)self addDeleteBulletItem];
  [(PNPHandwritingGesturesViewController *)self addSpaceBulletItem];
}

- (void)addDeleteBulletItem
{
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_DELETE_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_DELETE_DETAIL" value:&stru_26ECD9920 table:@"PencilSettings"];
  id v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_delete" renderingMode:1];
  [(PNPHandwritingGesturesViewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addSpaceBulletItem
{
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_SPACE_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"HANDWRITING_GESTURES_EDUCATION_PANEL_SPACE_DETAIL" value:&stru_26ECD9920 table:@"PencilSettings"];
  id v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_make_space" renderingMode:1];
  [(PNPHandwritingGesturesViewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F1C9B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v45 = objc_alloc_init(v8);
  [v45 setAxis:1];
  [v45 setSpacing:0.0];
  [v45 setAlignment:1];
  id v12 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v12 setText:v11];

  [v12 setNumberOfLines:0];
  v13 = (void *)MEMORY[0x263F81708];
  uint64_t v14 = *MEMORY[0x263F1D2C0];
  v15 = [(PNPHandwritingGesturesViewController *)self traitCollection];
  v16 = [v13 preferredFontForTextStyle:v14 compatibleWithTraitCollection:v15];

  v17 = [v16 fontDescriptor];
  v44 = [v17 fontDescriptorWithSymbolicTraits:2];

  v18 = (void *)MEMORY[0x263F81708];
  [v16 pointSize];
  id v19 = objc_msgSend(v18, "fontWithDescriptor:size:", v44);
  [v12 setFont:v19];

  v20 = [MEMORY[0x263F1C550] labelColor];
  [v12 setTextColor:v20];

  LODWORD(v21) = 1148846080;
  [v12 setContentHuggingPriority:1 forAxis:v21];
  LODWORD(v22) = 1144750080;
  [v12 setContentCompressionResistancePriority:1 forAxis:v22];
  [v45 addArrangedSubview:v12];
  id v23 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v23 setText:v10];

  [v23 setNumberOfLines:0];
  v24 = (void *)MEMORY[0x263F81708];
  v25 = [(PNPHandwritingGesturesViewController *)self traitCollection];
  v26 = [v24 preferredFontForTextStyle:v14 compatibleWithTraitCollection:v25];
  [v23 setFont:v26];

  v27 = [MEMORY[0x263F1C550] systemGrayColor];
  [v23 setTextColor:v27];

  LODWORD(v28) = 1148846080;
  [v23 setContentHuggingPriority:1 forAxis:v28];
  LODWORD(v29) = 1144750080;
  [v23 setContentCompressionResistancePriority:1 forAxis:v29];
  [v45 addArrangedSubview:v23];
  id v30 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v30 setAxis:0];
  [v30 setSpacing:18.0];
  [v30 setAlignment:3];
  v31 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
  [v9 size];
  double v33 = v32;
  [v9 size];
  double v35 = v34;

  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 setContentMode:1];
  [v30 addArrangedSubview:v31];
  [v30 addArrangedSubview:v45];
  v36 = [v31 widthAnchor];
  v37 = [v36 constraintGreaterThanOrEqualToConstant:105.0];
  [v37 setActive:1];

  v38 = [v31 heightAnchor];
  v39 = [v31 widthAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 multiplier:1.0 / (v33 / v35)];
  [v40 setActive:1];

  LODWORD(v41) = 1148846080;
  [v31 setContentCompressionResistancePriority:0 forAxis:v41];
  LODWORD(v42) = 1148846080;
  [v31 setContentHuggingPriority:0 forAxis:v42];
  v43 = [(PNPHandwritingGesturesViewController *)self bulletListView];
  [v43 addArrangedSubview:v30];
}

- (UIStackView)bulletListView
{
  return self->_bulletListView;
}

- (void)setBulletListView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end