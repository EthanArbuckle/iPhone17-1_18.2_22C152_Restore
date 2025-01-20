@interface ACM2SVTrustedDevicesViewController
- (ACM2SVTrustedDevicesViewController)initWithDelegate:(id)a3;
- (ACM2SVTrustedDevicesViewControllerDelegate)delegate;
- (BOOL)isLegacyStyle;
- (BOOL)shouldAutorotate;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)sizeOfString:(id)a3 withFont:(id)a4 widthConstraints:(double)a5;
- (NSArray)trustedDevicesArray;
- (NSLayoutConstraint)tableConstraint;
- (NSMutableArray)imageDownloadsInProgress;
- (UIButton)footerButton;
- (UIColor)backgroundColor;
- (UIColor)labelTextColor;
- (UIColor)textColor;
- (UILabel)emptyLabel;
- (UILabel)footerTextLabel;
- (UILabel)headerTextLabel;
- (UILabel)headerTitleLabel;
- (UINavigationController)navigationController;
- (UITableView)trustedDevicesListView;
- (double)navigationBarHeight;
- (double)tableHeight;
- (id)completionBlock;
- (id)footerButtonWithText:(id)a3;
- (id)labelWithText:(id)a3 font:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)selectedDeviceIndex;
- (int64_t)suggestedStatusBarStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)buildConstraints;
- (void)buildHorizontalConstraints;
- (void)buildVerticalConstraints;
- (void)cancelAction:(id)a3;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)loadView;
- (void)presentWithParentViewController:(id)a3 deviceList:(id)a4 completion:(id)a5;
- (void)reset;
- (void)resetWithDeviceList:(id)a3;
- (void)sendAction:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyLabel:(id)a3;
- (void)setFooterButton:(id)a3;
- (void)setFooterTextLabel:(id)a3;
- (void)setHeaderTextLabel:(id)a3;
- (void)setHeaderTitleLabel:(id)a3;
- (void)setImageDownloadsInProgress:(id)a3;
- (void)setLabelTextColor:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setSelectedDeviceIndex:(int64_t)a3;
- (void)setSuggestedStatusBarStyle:(int64_t)a3;
- (void)setTableConstraint:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTrustedDevicesArray:(id)a3;
- (void)setTrustedDevicesListView:(id)a3;
- (void)startIconDownloadForDevice:(id)a3 forIndexPath:(id)a4;
- (void)stopImageDownloads;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)unableReceiveMessagesTextDidTap:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACM2SVTrustedDevicesViewController

- (ACM2SVTrustedDevicesViewController)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACM2SVTrustedDevicesViewController;
  v4 = [(ACM2SVTrustedDevicesViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(ACM2SVTrustedDevicesViewController *)v4 setDelegate:a3];
    -[ACM2SVTrustedDevicesViewController setImageDownloadsInProgress:](v5, "setImageDownloadsInProgress:", [MEMORY[0x263EFF980] array]);
  }
  return v5;
}

- (void)dealloc
{
  [(ACM2SVTrustedDevicesViewController *)self setImageDownloadsInProgress:0];
  [(ACM2SVTrustedDevicesViewController *)self setTrustedDevicesArray:0];
  [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] setDataSource:0];
  [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] setDelegate:0];
  [(ACM2SVTrustedDevicesViewController *)self setTrustedDevicesListView:0];
  [(ACM2SVTrustedDevicesViewController *)self setTextColor:0];
  [(ACM2SVTrustedDevicesViewController *)self setBackgroundColor:0];
  [(ACM2SVTrustedDevicesViewController *)self setCompletionBlock:0];
  [(ACM2SVTrustedDevicesViewController *)self setEmptyLabel:0];
  [(ACM2SVTrustedDevicesViewController *)self setHeaderTitleLabel:0];
  [(ACM2SVTrustedDevicesViewController *)self setHeaderTextLabel:0];
  [(ACM2SVTrustedDevicesViewController *)self setFooterTextLabel:0];
  [(ACM2SVTrustedDevicesViewController *)self setFooterButton:0];
  [(UINavigationController *)[(ACM2SVTrustedDevicesViewController *)self navigationController] setDelegate:0];
  [(ACM2SVTrustedDevicesViewController *)self setNavigationController:0];
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVTrustedDevicesViewController;
  [(ACM2SVTrustedDevicesViewController *)&v3 dealloc];
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)ACM2SVTrustedDevicesViewController;
  [(ACM2SVTrustedDevicesViewController *)&v21 loadView];
  [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [[(id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice") userInterfaceIdiom];
    id v4 = +[ACMBaseLocale localizedString:@"Verify Identity"];
    if (v3)
    {
LABEL_6:
      [(ACM2SVTrustedDevicesViewController *)self setTitle:v4];
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = +[ACMBaseLocale localizedString:@"Verify Identity"];
  }
  if ((unint64_t)[v4 length] <= 0x11) {
    goto LABEL_6;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v5 setAdjustsFontSizeToFitWidth:1];
  [v5 setText:v4];
  [v5 setTextAlignment:1];
  v6 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  [v5 setFont:[v6 boldSystemFontOfSize:v7 + 1.0]];
  if ([(ACM2SVTrustedDevicesViewController *)self isLegacyStyle]) {
    v8 = (UIColor *)[MEMORY[0x263F1C550] whiteColor];
  }
  else {
    v8 = [(ACM2SVTrustedDevicesViewController *)self textColor];
  }
  [v5 setTextColor:v8];
  [v5 setLineBreakMode:0];
  [v5 setNumberOfLines:2];
  [v5 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  [v5 setFrame:0.0, 0.0, 400.0, 40.0];
  [(-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem")) setTitleView:v5];
LABEL_11:
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) setBackgroundColor:-[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor")];
  [(ACM2SVTrustedDevicesViewController *)self setEdgesForExtendedLayout:0];
  id v9 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction_];
  id v10 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Continue") style:0 target:self action:sel_sendAction_];
  [(-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem")) setLeftBarButtonItem:v9];
  [(-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem")) setRightBarButtonItem:v10];
  [((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem")) setRightBarButtonItem:nil];
  id v11 = objc_alloc(MEMORY[0x263F1CA40]);
  BOOL v12 = [(ACM2SVTrustedDevicesViewController *)self isLegacyStyle];
  id v13 = [(id)[v11 initWithFrame:!v12 style:*(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24)]
  [v13 setDataSource:self];
  [v13 setDelegate:self];
  [v13 setBackgroundColor:[self backgroundColor]];
  [v13 setScrollEnabled:0];
  [(ACM2SVTrustedDevicesViewController *)self setTrustedDevicesListView:v13];
  [-[ACM2SVTrustedDevicesViewController view](self, "view") addSubview:-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView")];
  v14 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  -[ACM2SVTrustedDevicesViewController setEmptyLabel:](self, "setEmptyLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", @"\n", [v14 boldSystemFontOfSize:]));
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self emptyLabel] setBackgroundColor:[(ACM2SVTrustedDevicesViewController *)self backgroundColor]];
  id v15 = +[ACMBaseLocale localizedString:@"Two-step verification is enabled for this Apple ID."];
  v16 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  -[ACM2SVTrustedDevicesViewController setHeaderTitleLabel:](self, "setHeaderTitleLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v15, [v16 boldSystemFontOfSize:]));
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTitleLabel] setBackgroundColor:[(ACM2SVTrustedDevicesViewController *)self backgroundColor]];
  id v17 = +[ACMBaseLocale localizedString:@"The device you select below will be sent a temporary code that you can use to verify your identity."];
  v18 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  -[ACM2SVTrustedDevicesViewController setHeaderTextLabel:](self, "setHeaderTextLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v17, [v18 systemFontOfSize:]));
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTextLabel] setBackgroundColor:[(ACM2SVTrustedDevicesViewController *)self backgroundColor]];
  uint64_t v19 = [NSString stringWithFormat:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"To manage your trusted devices visit %@ from a Mac or PC.", @"appleid.apple.com"];
  v20 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  -[ACM2SVTrustedDevicesViewController setFooterTextLabel:](self, "setFooterTextLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v19, objc_msgSend(v20, "systemFontOfSize:")));
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self footerTextLabel] setBackgroundColor:[(ACM2SVTrustedDevicesViewController *)self backgroundColor]];
  [(ACM2SVTrustedDevicesViewController *)self setFooterButton:[(ACM2SVTrustedDevicesViewController *)self footerButtonWithText:+[ACMBaseLocale localizedString:@"Unable to receive messages at any of your devices?"]]];
  [(UIButton *)[(ACM2SVTrustedDevicesViewController *)self footerButton] setBackgroundColor:[(ACM2SVTrustedDevicesViewController *)self backgroundColor]];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addSubview:(-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"))];
  [-[ACM2SVTrustedDevicesViewController view](self, "view") addSubview:-[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel")];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addSubview:][-ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel")];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addSubview:-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel")];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addSubview:-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton")];
  [(ACM2SVTrustedDevicesViewController *)self buildConstraints];
}

- (void)buildConstraints
{
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self emptyLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTitleLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTextLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self footerTextLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)[(ACM2SVTrustedDevicesViewController *)self footerButton] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ACM2SVTrustedDevicesViewController *)self buildHorizontalConstraints];

  [(ACM2SVTrustedDevicesViewController *)self buildVerticalConstraints];
}

- (double)navigationBarHeight
{
  [[(id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication") statusBarFrame];
  double v4 = v3 + 64.0;
  BOOL v5 = [(ACM2SVTrustedDevicesViewController *)self isLegacyStyle];
  double result = 44.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (BOOL)isLegacyStyle
{
  return floor(*MEMORY[0x263F080F8]) <= 993.0;
}

- (double)tableHeight
{
  if ([(NSArray *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesArray] count])
  {
    double v3 = [(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView];
    double v4 = -[UITableView cellForRowAtIndexPath:](v3, "cellForRowAtIndexPath:", [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0]);
    if (v4)
    {
      [(UITableViewCell *)v4 frame];
      double v6 = v5;
    }
    else
    {
      double v6 = 44.0;
    }
    double v7 = v6
       * (double)[(NSArray *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesArray] count];
  }
  else
  {
    double v7 = 44.0;
  }
  v8 = [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] headerViewForSection:0];
  if (v8) {
    [(UITableViewHeaderFooterView *)v8 frame];
  }
  else {
    double v9 = 55.5;
  }
  return v7 + v9;
}

- (void)buildHorizontalConstraints
{
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel") attribute:1 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:1 multiplier:1.0 constant:0.0]];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel") attribute:2 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:2 multiplier:1.0 constant:0.0]];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel") attribute:1 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:1 multiplier:1.0 constant:12.0]];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:-[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0)];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:(-[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel")) attribute:1 relatedBy:0 toItem:(-[ACM2SVTrustedDevicesViewController view](self, "view")) attribute:1 multiplier:1.0 constant:12.0)]
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0)];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView") attribute:1 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:1 multiplier:1.0 constant:0.0])];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView") attribute:2 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:2 multiplier:1.0 constant:0.0]];
  [((id)-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton") attribute:1 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:1 multiplier:1.0 constant:12.0]];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:(-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton")) attribute:2 relatedBy:0 toItem:(-[ACM2SVTrustedDevicesViewController view](self, "view")) attribute:2 multiplier:1.0 constant:-12.0)]
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel") attribute:1 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:1 multiplier:1.0 constant:12.0]];
  uint64_t v3 = [MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel") attribute:2 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:2 multiplier:1.0 constant:-12.0];
  double v4 = (void *)[(ACM2SVTrustedDevicesViewController *)self view];

  [v4 addConstraint:v3];
}

- (void)buildVerticalConstraints
{
  [((id)-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel") attribute:3 relatedBy:0 toItem:-[ACM2SVTrustedDevicesViewController view](self, "view") attribute:3 multiplier:1.0 constant:0.0]];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), 8, 0, 0, 8, 1.0, 10.0)];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 3, 1.0, 10.0)];
  uint64_t v3 = (void *)MEMORY[0x263F08938];
  double v4 = [(ACM2SVTrustedDevicesViewController *)self headerTitleLabel];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTitleLabel] frame];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 8, 1.0, v5)];
  [((id)-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 4, 1.0, 10.0)];
  double v6 = (void *)MEMORY[0x263F08938];
  double v7 = [(ACM2SVTrustedDevicesViewController *)self headerTextLabel];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self headerTextLabel] frame];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:[v6 constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v8]];
  double v9 = (void *)MEMORY[0x263F08938];
  id v10 = [(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView];
  id v11 = [(ACM2SVTrustedDevicesViewController *)self headerTextLabel];
  if ([(ACM2SVTrustedDevicesViewController *)self isLegacyStyle]) {
    double v12 = 10.0;
  }
  else {
    double v12 = -18.0;
  }
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:[v9 constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v11 attribute:4 multiplier:1.0 constant:v12]];
  id v13 = (void *)MEMORY[0x263F08938];
  v14 = [(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView];
  [(ACM2SVTrustedDevicesViewController *)self tableHeight];
  v16 = (void *)[v13 constraintWithItem:v14 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v15];
  LODWORD(v17) = 1112014848;
  [v16 setPriority:v17];
  [(ACM2SVTrustedDevicesViewController *)self setTableConstraint:v16];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:v16];
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 3, 0, -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), 4, 1.0, 24.0)];
  v18 = [MEMORY[0x263F08938] constraintWithItem:-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton") attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:10.0];
  LODWORD(v19) = 1112014848;
  [v18 setPriority:v19];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:v18];
  [(-[ACM2SVTrustedDevicesViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 4, 1.0, 18.0)];
  v20 = (void *)MEMORY[0x263F08938];
  objc_super v21 = [(ACM2SVTrustedDevicesViewController *)self footerTextLabel];
  [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self footerTextLabel] frame];
  uint64_t v23 = [v20 constraintWithItem:v21 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v22];
  v24 = (void *)[(ACM2SVTrustedDevicesViewController *)self view];

  [v24 addConstraint:v23];
}

- (void)presentWithParentViewController:(id)a3 deviceList:(id)a4 completion:(id)a5
{
  if ([(ACM2SVTrustedDevicesViewController *)self completionBlock])
  {
    double v9 = (void (*)(id, void))*((void *)a5 + 2);
    v9(a5, 0);
  }
  else
  {
    if (a4) {
      [(ACM2SVTrustedDevicesViewController *)self resetWithDeviceList:a4];
    }
    [(ACM2SVTrustedDevicesViewController *)self setCompletionBlock:a5];
    -[ACM2SVTrustedDevicesViewController setNavigationController:](self, "setNavigationController:", [objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self]);
    [(UINavigationController *)[(ACM2SVTrustedDevicesViewController *)self navigationController] setDelegate:self];
    [(UINavigationBar *)[(UINavigationController *)[(ACM2SVTrustedDevicesViewController *)self navigationController] navigationBar] setTranslucent:0];
    id v10 = [(ACM2SVTrustedDevicesViewController *)self navigationController];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __92__ACM2SVTrustedDevicesViewController_presentWithParentViewController_deviceList_completion___block_invoke;
    v11[3] = &unk_265043CC8;
    v11[4] = a4;
    v11[5] = self;
    [a3 presentViewController:v10 animated:1 completion:v11];
  }
}

uint64_t __92__ACM2SVTrustedDevicesViewController_presentWithParentViewController_deviceList_completion___block_invoke(uint64_t result)
{
  if (!*(void *)(result + 32))
  {
    uint64_t v1 = result;
    v2 = (void *)[*(id *)(result + 40) delegate];
    uint64_t v3 = *(void *)(v1 + 40);
    return [v2 trustedDevicesViewControllerNeedsRefresh:v3];
  }
  return result;
}

- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v5 = a3;
  [(ACM2SVTrustedDevicesViewController *)self setCompletionBlock:0];
  double v7 = (void *)[(ACM2SVTrustedDevicesViewController *)self presentingViewController];

  [v7 dismissViewControllerAnimated:v5 completion:a4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACM2SVTrustedDevicesViewController;
  [(ACM2SVTrustedDevicesViewController *)&v4 viewDidAppear:a3];
  [(ACM2SVTrustedDevicesViewController *)self reset];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACM2SVTrustedDevicesViewController *)self stopImageDownloads];
  v5.receiver = self;
  v5.super_class = (Class)ACM2SVTrustedDevicesViewController;
  [(ACM2SVTrustedDevicesViewController *)&v5 viewWillDisappear:v3];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    [(ACM2SVTrustedDevicesViewController *)self stopImageDownloads];
    self->_delegate = (ACM2SVTrustedDevicesViewControllerDelegate *)a3;
  }
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (CGSize)sizeOfString:(id)a3 withFont:(id)a4 widthConstraints:(double)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double v8 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v9 = (void *)[a3 componentsSeparatedByString:@"\n"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(__CFString **)(*((void *)&v20 + 1) + 8 * i);
        if ([(__CFString *)v14 length]) {
          double v15 = v14;
        }
        else {
          double v15 = @"A";
        }
        -[__CFString sizeWithFont:constrainedToSize:lineBreakMode:](v15, "sizeWithFont:constrainedToSize:lineBreakMode:", a4, 0, a5, 300.0);
        if (v8 < v16) {
          double v8 = v16;
        }
        double v7 = v7 + v17;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  double v18 = v8;
  double v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)labelWithText:(id)a3 font:(id)a4
{
  [[-[ACM2SVTrustedDevicesViewController view](self, "view") bounds];
  [(ACM2SVTrustedDevicesViewController *)self sizeOfString:a3 withFont:a4 widthConstraints:v7];
  id v10 = (id)[objc_alloc(MEMORY[0x263F1C768]) initWithFrame:0.0, 0.0, v9, v8 + 18.0];
  [v10 setText:a3];
  [v10 setFont:a4];
  if ([(ACM2SVTrustedDevicesViewController *)self isLegacyStyle]) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v10 setNumberOfLines:v11];
  [v10 setTextColor:-[ACM2SVTrustedDevicesViewController labelTextColor](self, "labelTextColor")];
  [v10 setLineBreakMode:0];
  [v10 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  return v10;
}

- (id)footerButtonWithText:(id)a3
{
  BOOL v5 = [(ACM2SVTrustedDevicesViewController *)self isLegacyStyle];
  double v6 = (void *)[MEMORY[0x263F1C488] buttonWithType:!v5];
  if ([(ACM2SVTrustedDevicesViewController *)self isLegacyStyle])
  {
    [v6 setTitleColor:[MEMORY[0x263F1C550] colorWithRed:0.09 green:0.52 blue:1.0 alpha:1.0] forState:0];
    [v6 setTitleColor:[MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0] forState:1];
  }
  [v6 setTitle:a3 forState:0];
  [v6 addTarget:self action:sel_unableReceiveMessagesTextDidTap_ forControlEvents:64];
  [((id)objc_msgSend(v6, "titleLabel")) setNumberOfLines:0];
  [((id)objc_msgSend(v6, "titleLabel")) setLineBreakMode:0];
  [((id)objc_msgSend(v6, "titleLabel")) setTextAlignment:1];
  double v7 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  [((id)objc_msgSend(v6, "titleLabel")) setFont:[v7 systemFontOfSize:x0]];
  return v6;
}

- (void)reset
{
  [(ACM2SVTrustedDevicesViewController *)self setSelectedDeviceIndex:-1];
  [(ACM2SVTrustedDevicesViewController *)self disableControls:0];
  [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] reloadData];
  [(ACM2SVTrustedDevicesViewController *)self tableHeight];
  if (v3 > 0.0)
  {
    double v4 = v3;
    [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] frame];
    double v6 = v4 - v5;
    [[-[ACM2SVTrustedDevicesViewController view](self, "view") frame];
    double v8 = v7;
    [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self footerTextLabel] frame];
    double v10 = v9;
    [(UILabel *)[(ACM2SVTrustedDevicesViewController *)self footerTextLabel] frame];
    double v12 = v8 - (v10 + v11 + 10.0);
    if (v6 <= v12) {
      double v13 = v6;
    }
    else {
      double v13 = v8 - (v10 + v11 + 10.0);
    }
    [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] setScrollEnabled:v6 > v12];
    [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] frame];
    [(NSLayoutConstraint *)[(ACM2SVTrustedDevicesViewController *)self tableConstraint] setConstant:v14 + v13];
    double v15 = (void *)[(ACM2SVTrustedDevicesViewController *)self view];
    [v15 setNeedsUpdateConstraints];
  }
}

- (void)disableControls:(BOOL)a3
{
  BOOL v5 = !a3;
  [(UITableView *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesListView] setAllowsSelection:v5];
  [objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "leftBarButtonItem"), "setEnabled:", v5];
  [objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v5];
  if (!a3)
  {
    BOOL v6 = [(ACM2SVTrustedDevicesViewController *)self selectedDeviceIndex] != -1;
    double v7 = [[-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem") rightBarButtonItem];
    [v7 setEnabled:v6];
  }
}

- (void)resetWithDeviceList:(id)a3
{
  if (a3) {
    -[ACM2SVTrustedDevicesViewController setTrustedDevicesArray:](self, "setTrustedDevicesArray:");
  }

  [(ACM2SVTrustedDevicesViewController *)self reset];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(ACM2SVTrustedDevicesViewController *)self trustedDevicesArray];

  return [(NSArray *)v4 count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return +[ACMBaseLocale localizedString:@"TRUSTED DEVICES", a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (id)[a3 dequeueReusableCellWithIdentifier:@"ACM2SVTrustedDeviceCellIdentifier"];
  if (!v6) {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:3 reuseIdentifier:@"ACM2SVTrustedDeviceCellIdentifier"];
  }
  id v7 = -[NSArray objectAtIndex:](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray"), "objectAtIndex:", [a4 row]);
  [((id)objc_msgSend(v6, "textLabel")) setFont:[MEMORY[0x263F1C658] boldSystemFontOfSize:15.0]];
  uint64_t v8 = [a4 row];
  if (v8 == [(ACM2SVTrustedDevicesViewController *)self selectedDeviceIndex]) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  [v6 setAccessoryType:v9];
  [objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v7, "deviceDisplayDescription"));
  if ([v7 isSMSDevice])
  {
    double v10 = @"SMS to Phone Number";
LABEL_10:
    id v11 = +[ACMBaseLocale localizedString:v10];
    goto LABEL_12;
  }
  if ([v7 isTOTPDevice])
  {
    double v10 = @"Generate TOTP code";
    goto LABEL_10;
  }
  id v11 = (id)[v7 deviceModelName];
LABEL_12:
  [((id)objc_msgSend(v6, "detailTextLabel")) setText:v11];
  if (![(ACM2SVTrustedDevicesViewController *)self isLegacyStyle])
  {
    [v6 setBackgroundColor:[self backgroundColor]];
    [((id)objc_msgSend(v6, "textLabel")) setTextColor:-[ACM2SVTrustedDevicesViewController textColor](self, "textColor")];
    [((id)objc_msgSend(v6, "detailTextLabel")) setTextColor:-[ACM2SVTrustedDevicesViewController textColor](self, "textColor")];
  }
  [((id)objc_msgSend(v6, "imageView")) setContentMode:1];
  if ([v7 deviceIcon])
  {
    id v12 = [ACMUIImageUtilities cropServerImage:bySize:](ACMUIImageUtilities, objc_msgSend(MEMORY[0x263F1C6B0], "imageWithData:", objc_msgSend(v7, "deviceIcon")), 10.0, 0.0);
  }
  else
  {
    if ([v7 isSMSDevice])
    {
      double v13 = @"sms.png";
    }
    else
    {
      if (![v7 isTOTPDevice])
      {
        [((id)objc_msgSend(v6, "imageView")) setImage:+[ACMUIImageUtilities transparentImageWithSize:](ACMUIImageUtilities, "transparentImageWithSize:", 30.0, 44.0)];
        [(ACM2SVTrustedDevicesViewController *)self startIconDownloadForDevice:v7 forIndexPath:a4];
        return v6;
      }
      double v13 = @"totp.png";
    }
    id v12 = (id)ACMImageWithName((uint64_t)v13);
  }
  [((id)objc_msgSend(v6, "imageView")) setImage:v12];
  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[ACM2SVTrustedDevicesViewController setSelectedDeviceIndex:](self, "setSelectedDeviceIndex:", [a4 row]);
  [((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem")) rightBarButtonItem setEnabled:1];
  [a3 deselectRowAtIndexPath:a4 animated:1];

  [a3 reloadData];
}

- (void)startIconDownloadForDevice:(id)a3 forIndexPath:(id)a4
{
  if ((-[NSMutableArray containsObject:](-[ACM2SVTrustedDevicesViewController imageDownloadsInProgress](self, "imageDownloadsInProgress"), "containsObject:", [a3 deviceID]) & 1) == 0)
  {
    -[NSMutableArray addObject:](-[ACM2SVTrustedDevicesViewController imageDownloadsInProgress](self, "imageDownloadsInProgress"), "addObject:", [a3 deviceID]);
    uint64_t v7 = [a3 imageURL];
    if (v7)
    {
      uint64_t v8 = v7;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 589, 0, "Download image from URL %@ for device: %@", v8, a3);
        }
      }
      uint64_t v9 = [(ACM2SVTrustedDevicesViewController *)self delegate];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __78__ACM2SVTrustedDevicesViewController_startIconDownloadForDevice_forIndexPath___block_invoke;
      v10[3] = &unk_265044220;
      v10[4] = self;
      v10[5] = a4;
      v10[6] = a3;
      [(ACM2SVTrustedDevicesViewControllerDelegate *)v9 downloadImageWithURL:v8 completionBlock:v10];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 620, 0, "Couldn't create URL for device %@", a3);
    }
  }
}

uint64_t __78__ACM2SVTrustedDevicesViewController_startIconDownloadForDevice_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 length])
  {
    double v4 = [[objc_msgSend(*(id *)(a1 + 32), "trustedDevicesListView") cellForRowAtIndexPath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setDeviceIcon:a2];
    uint64_t v5 = [MEMORY[0x263F1C6B0] imageWithData:[*(id *)(a1 + 48) deviceIcon]];
    if (v5)
    {
      [((id)objc_msgSend(v4, "imageView")) setImage:+[ACMUIImageUtilities cropServerImage:bySize:](ACMUIImageUtilities, "cropServerImage:bySize:", v5, 10.0, 0.0)];
      [v4 setNeedsLayout];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 606, 0, "Failed to create image for device: %@", *(void *)(a1 + 48));
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
  {
    ACFLog(6, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 611, 0, "Image not found for device: %@", *(void *)(a1 + 48));
  }
  id v6 = (void *)[*(id *)(a1 + 32) imageDownloadsInProgress];
  uint64_t v7 = [*(id *)(a1 + 48) deviceID];

  return [v6 removeObject:v7];
}

- (void)stopImageDownloads
{
  [(ACM2SVTrustedDevicesViewControllerDelegate *)[(ACM2SVTrustedDevicesViewController *)self delegate] cancelInProgressImageDownloads];
  double v3 = [(ACM2SVTrustedDevicesViewController *)self imageDownloadsInProgress];

  [(NSMutableArray *)v3 removeAllObjects];
}

- (void)sendAction:(id)a3
{
  [(ACM2SVTrustedDevicesViewController *)self disableControls:1];
  double v4 = [(ACM2SVTrustedDevicesViewController *)self completionBlock];
  id v5 = [(NSArray *)[(ACM2SVTrustedDevicesViewController *)self trustedDevicesArray] objectAtIndexedSubscript:[(ACM2SVTrustedDevicesViewController *)self selectedDeviceIndex]];
  id v6 = (void (*)(void *, id))v4[2];

  v6(v4, v5);
}

- (void)cancelAction:(id)a3
{
  double v4 = [(ACM2SVTrustedDevicesViewController *)self completionBlock];
  v4[2](v4, 0);

  [(ACM2SVTrustedDevicesViewController *)self setCompletionBlock:0];
}

- (void)unableReceiveMessagesTextDidTap:(id)a3
{
  double v4 = [(ACM2SVTrustedDevicesViewController *)self delegate];

  [(ACM2SVTrustedDevicesViewControllerDelegate *)v4 trustedDevicesViewControllerDidSelectUnableReceiveMessages:self];
}

- (ACM2SVTrustedDevicesViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSArray)trustedDevicesArray
{
  return (NSArray *)objc_getProperty(self, a2, 984, 1);
}

- (void)setTrustedDevicesArray:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (void)setLabelTextColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (int64_t)suggestedStatusBarStyle
{
  return self->_suggestedStatusBarStyle;
}

- (void)setSuggestedStatusBarStyle:(int64_t)a3
{
  self->_suggestedStatusBarStyle = a3;
}

- (UILabel)emptyLabel
{
  return self->_emptyLabel;
}

- (void)setEmptyLabel:(id)a3
{
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
}

- (UILabel)headerTextLabel
{
  return self->_headerTextLabel;
}

- (void)setHeaderTextLabel:(id)a3
{
}

- (UILabel)footerTextLabel
{
  return self->_footerTextLabel;
}

- (void)setFooterTextLabel:(id)a3
{
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
}

- (NSLayoutConstraint)tableConstraint
{
  return self->_tableConstraint;
}

- (void)setTableConstraint:(id)a3
{
}

- (UITableView)trustedDevicesListView
{
  return self->_trustedDevicesListView;
}

- (void)setTrustedDevicesListView:(id)a3
{
}

- (int64_t)selectedDeviceIndex
{
  return self->_selectedDeviceIndex;
}

- (void)setSelectedDeviceIndex:(int64_t)a3
{
  self->_selectedDeviceIndex = a3;
}

- (NSMutableArray)imageDownloadsInProgress
{
  return self->_imageDownloadsInProgress;
}

- (void)setImageDownloadsInProgress:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

@end