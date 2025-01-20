@interface MailTrackingProtectionOnboardingViewController
- (EFCancelable)buttonBoundsObserver;
- (EFCancelable)contentSizeObserver;
- (MailTrackingProtectionOnboardingViewControllerValues)values;
- (NSArray)viewModels;
- (NSIndexPath)selectedIndexPath;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSLayoutConstraint)collectionViewWidthConstraint;
- (OBTrayButton)continueButton;
- (OBWelcomeController)welcomeController;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_configuredCollectionView;
- (void)_appDidBecomeActive:(id)a3;
- (void)_configureCell:(id)a3 viewModel:(id)a4;
- (void)_configureChildViewController:(id)a3;
- (void)_configureOnboardingViewController;
- (void)_updateSelectionForCellAtIndexPath:(id)a3 isSelected:(BOOL)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setButtonBoundsObserver:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setCollectionViewWidthConstraint:(id)a3;
- (void)setContentSizeObserver:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setValues:(id)a3;
- (void)setViewModels:(id)a3;
- (void)setWelcomeController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MailTrackingProtectionOnboardingViewController

- (void)viewDidLoad
{
  [(MailTrackingProtectionOnboardingViewController *)self setModalInPresentation:1];
  [(MailTrackingProtectionOnboardingViewController *)self _configureOnboardingViewController];
  v3 = [MailTrackingProtectionOnboardingTableViewCellViewModel alloc];
  v4 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_PROTECT_TITLE");
  v5 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_PROTECT_DETAIL");
  v6 = +[UIImage systemImageNamed:MFImageGlyphProtectedEnvelope];
  v7 = [(MailTrackingProtectionOnboardingTableViewCellViewModel *)v3 initWithTitle:v4 detail:v5 image:v6 isSelected:0 preventTracking:1 accessibilityIdentifier:@"MAIL_PRIVACY_PROTECTION_ENABLE"];
  v18[0] = v7;
  v8 = [MailTrackingProtectionOnboardingTableViewCellViewModel alloc];
  v9 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_ALLOW_TRACKING_TITLE");
  v10 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_ALLOW_TRACKING_DETAIL");
  v11 = +[UIImage systemImageNamed:MFImageGlyphOpenEnvelope];
  v12 = [(MailTrackingProtectionOnboardingTableViewCellViewModel *)v8 initWithTitle:v9 detail:v10 image:v11 isSelected:0 preventTracking:0 accessibilityIdentifier:@"MAIL_PRIVACY_PROTECTION_DISABLE"];
  v18[1] = v12;
  v13 = +[NSArray arrayWithObjects:v18 count:2];
  [(MailTrackingProtectionOnboardingViewController *)self setViewModels:v13];

  id v14 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [v14 appendSectionsWithIdentifiers:&off_10062B420];
  [v14 appendItemsWithIdentifiers:&off_10062B438 intoSectionWithIdentifier:&off_10062A9C8];
  [v14 appendItemsWithIdentifiers:&off_10062B450 intoSectionWithIdentifier:&off_10062A9E0];
  v15 = [(MailTrackingProtectionOnboardingViewController *)self dataSource];
  [v15 applySnapshot:v14 animatingDifferences:0];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_appDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

  v17 = [(MailTrackingProtectionOnboardingViewController *)self welcomeController];
  [v17 setModalPresentationStyle:2];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MailTrackingProtectionOnboardingViewController;
  [(MailTrackingProtectionOnboardingViewController *)&v4 dealloc];
}

- (void)_configureOnboardingViewController
{
  objc_super v4 = objc_alloc_init(MailTrackingProtectionOnboardingViewControllerValues);
  [(MailTrackingProtectionOnboardingViewController *)self setValues:v4];

  v5 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v43 = [v5 icon];

  id v6 = objc_alloc((Class)OBWelcomeController);
  v7 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_TITLE");
  v8 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_DETAIL");
  id v9 = [v6 initWithTitle:v7 detailText:v8 icon:v43 contentLayout:2];

  v46 = v9;
  [(MailTrackingProtectionOnboardingViewController *)self setWelcomeController:v9];
  v10 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v44 = [v10 learnMoreButton];

  v11 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_LEARN_MORE");
  [v44 setTitle:v11 forState:0];

  v12 = [v9 headerView];
  [v12 addAccessoryButton:v44];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1001293BC;
  v56[3] = &unk_1006070F8;
  objc_copyWeak(&v57, &location);
  v13 = +[UIAction actionWithHandler:v56];
  [v44 addAction:v13 forControlEvents:64];

  v45 = +[OBBoldTrayButton boldButton];
  [v45 setEnabled:0];
  id v14 = sub_1001288FC(@"MAIL_TRACKING_PROTECTION_CONTINUE");
  [v45 setTitle:v14 forState:0];

  [(MailTrackingProtectionOnboardingViewController *)self setContinueButton:v45];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001295C8;
  v54[3] = &unk_100608F90;
  objc_copyWeak(v55, &location);
  v55[1] = (id)a2;
  v15 = +[UIAction actionWithHandler:v54];
  [v45 addAction:v15 forControlEvents:0x2000];

  v16 = [v9 buttonTray];
  [v16 addButton:v45];

  v47 = [(MailTrackingProtectionOnboardingViewController *)self _configuredCollectionView];
  v17 = [v9 contentView];
  [v17 addSubview:v47];

  [(MailTrackingProtectionOnboardingViewController *)self setCollectionView:v47];
  v18 = [v47 heightAnchor];
  v19 = [v18 constraintEqualToConstant:50.0];
  [(MailTrackingProtectionOnboardingViewController *)self setCollectionViewHeightConstraint:v19];

  v20 = [v47 widthAnchor];
  v21 = [(MailTrackingProtectionOnboardingViewController *)self values];
  [v21 widthConstant];
  v22 = [v20 constraintEqualToConstant:];
  [(MailTrackingProtectionOnboardingViewController *)self setCollectionViewWidthConstraint:v22];

  v23 = [v47 topAnchor];
  v24 = [v46 contentView];
  v25 = [v24 topAnchor];
  v26 = [(MailTrackingProtectionOnboardingViewController *)self values];
  [v26 topConstant];
  v41 = [v23 constraintEqualToAnchor:v25];

  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  v59[0] = v41;
  v42 = [v47 bottomAnchor];
  v40 = [v46 contentView];
  v39 = [v40 bottomAnchor];
  v27 = [v42 constraintEqualToAnchor:-50.0];
  v59[1] = v27;
  v28 = [v47 centerXAnchor];
  v29 = [v46 contentView];
  v30 = [v29 centerXAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v59[2] = v31;
  v32 = [(MailTrackingProtectionOnboardingViewController *)self collectionViewHeightConstraint];
  v59[3] = v32;
  v33 = [(MailTrackingProtectionOnboardingViewController *)self collectionViewWidthConstraint];
  v59[4] = v33;
  v34 = +[NSArray arrayWithObjects:v59 count:5];
  +[NSLayoutConstraint activateConstraints:v34];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10012984C;
  v51[3] = &unk_100604B20;
  objc_copyWeak(&v53, &location);
  id v35 = v47;
  id v52 = v35;
  v36 = [v35 ef_observeKeyPath:@"contentSize" options:1 autoCancelToken:1 usingBlock:v51];
  [(MailTrackingProtectionOnboardingViewController *)self setContentSizeObserver:v36];

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10012998C;
  v48[3] = &unk_100604B20;
  objc_copyWeak(&v50, &location);
  id v37 = v45;
  id v49 = v37;
  v38 = [v37 ef_observeKeyPath:@"bounds" options:1 autoCancelToken:1 usingBlock:v48];
  [(MailTrackingProtectionOnboardingViewController *)self setButtonBoundsObserver:v38];

  [(MailTrackingProtectionOnboardingViewController *)self _configureChildViewController:v46];
  objc_destroyWeak(&v50);

  objc_destroyWeak(&v53);
  objc_destroyWeak(v55);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
}

- (void)_configureChildViewController:(id)a3
{
  id v4 = a3;
  [(MailTrackingProtectionOnboardingViewController *)self addChildViewController:v4];
  v5 = [(MailTrackingProtectionOnboardingViewController *)self view];
  id v6 = [v4 view];
  [v5 addSubview:v6];

  [v4 didMoveToParentViewController:self];
  v7 = [v4 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [v4 view];
  v28 = [v25 topAnchor];
  v24 = [(MailTrackingProtectionOnboardingViewController *)self view];
  v23 = [v24 topAnchor];
  v22 = [v28 constraintEqualToAnchor:];
  v29[0] = v22;
  v21 = [v4 view];
  v27 = [v21 leadingAnchor];
  v20 = [(MailTrackingProtectionOnboardingViewController *)self view];
  v19 = [v20 leadingAnchor];
  v18 = [v27 constraintEqualToAnchor:];
  v29[1] = v18;
  v17 = [v4 view];
  v26 = [v17 bottomAnchor];
  v16 = [(MailTrackingProtectionOnboardingViewController *)self view];
  v8 = [v16 bottomAnchor];
  id v9 = [v26 constraintEqualToAnchor:v8];
  v29[2] = v9;
  v10 = [v4 view];
  v11 = [v10 trailingAnchor];
  v12 = [(MailTrackingProtectionOnboardingViewController *)self view];
  v13 = [v12 trailingAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v29[3] = v14;
  v15 = +[NSArray arrayWithObjects:v29 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (id)_configuredCollectionView
{
  id v3 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:&stru_100608FD0];
  id v4 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setScrollEnabled:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = objc_opt_class();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_10012A270;
  v18[3] = &unk_100608FF8;
  objc_copyWeak(&v19, &location);
  id v6 = +[UICollectionViewCellRegistration registrationWithCellClass:v5 configurationHandler:v18];
  id v7 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10012A304;
  v15 = &unk_100609020;
  id v8 = v6;
  id v16 = v8;
  v17 = self;
  id v9 = [v7 initWithCollectionView:v4 cellProvider:&v12];
  -[MailTrackingProtectionOnboardingViewController setDataSource:](self, "setDataSource:", v9, v12, v13, v14, v15);

  v10 = [(MailTrackingProtectionOnboardingViewController *)self dataSource];
  [v4 setDataSource:v10];

  [v4 setDelegate:self];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v4;
}

- (void)_configureCell:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSelected]) {
    +[UIColor tintColor];
  }
  else {
  id v8 = +[UIColor systemGray5Color];
  }
  id v9 = [v8 CGColor];
  v10 = [v6 layer];
  [v10 setBorderColor:v9];

  LODWORD(v8) = [v7 isSelected];
  v11 = [v6 layer];
  v12 = v11;
  double v13 = 1.0;
  if (v8) {
    double v13 = 2.0;
  }
  [v11 setBorderWidth:v13];

  id v14 = objc_alloc_init((Class)_UICellAccessoryConfigurationMultiselect);
  id v40 = v14;
  v15 = +[NSArray arrayWithObjects:&v40 count:1];
  [v6 setTrailingAccessoryConfigurations:v15];

  id v16 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v17 = [v16 cellConfiguration];

  v18 = [v7 title];
  [v17 setText:v18];

  id v19 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v20 = [v19 primaryTextFont];
  v21 = [v17 textProperties];
  [v21 setFont:v20];

  v22 = [v7 detail];
  [v17 setSecondaryText:v22];

  v23 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v24 = [v23 secondaryTextPropertiesColor];
  v25 = [v17 secondaryTextProperties];
  [v25 setColor:v24];

  v26 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v27 = [v26 secondaryTextPropertiesFont];
  v28 = [v17 secondaryTextProperties];
  [v28 setFont:v27];

  v29 = [v7 image];
  [v17 setImage:v29];

  v30 = [(MailTrackingProtectionOnboardingViewController *)self values];
  v31 = [v30 imageSymbolConfiguration];
  v32 = [v17 imageProperties];
  [v32 setPreferredSymbolConfiguration:v31];

  [v17 setImageToTextPadding:28.0];
  [v17 directionalLayoutMargins];
  [v17 setDirectionalLayoutMargins:14.0, 26.0, 14.0];
  [v17 setTextToSecondaryTextVerticalPadding:2.0];
  [v6 setContentConfiguration:v17];
  v33 = [v7 accessibilityIdentifier];
  [v6 setAccessibilityIdentifier:v33];

  v34 = [v6 backgroundConfiguration];
  id v35 = [v34 copy];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id v37 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  }
  v38 = v37;

  v39 = +[UIColor systemBackgroundColor];
  [v38 setBackgroundColor:v39];

  [v6 setBackgroundConfiguration:v38];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(MailTrackingProtectionOnboardingViewController *)self selectedIndexPath];

  if (v5)
  {
    id v6 = [(MailTrackingProtectionOnboardingViewController *)self selectedIndexPath];
    [(MailTrackingProtectionOnboardingViewController *)self _updateSelectionForCellAtIndexPath:v6 isSelected:0];
  }
  [(MailTrackingProtectionOnboardingViewController *)self setSelectedIndexPath:v8];
  [(MailTrackingProtectionOnboardingViewController *)self _updateSelectionForCellAtIndexPath:v8 isSelected:1];
  id v7 = [(MailTrackingProtectionOnboardingViewController *)self continueButton];
  [v7 setEnabled:1];
}

- (void)_updateSelectionForCellAtIndexPath:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = sub_1001297AC(self, v9);
  [v6 setSelected:v4];
  id v7 = [(MailTrackingProtectionOnboardingViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v9];

  [(MailTrackingProtectionOnboardingViewController *)self _configureCell:v8 viewModel:v6];
}

- (void)_appDidBecomeActive:(id)a3
{
  id v5 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v4 = [v5 shouldPresentRemoteContentOptionsSheet];

  if ((v4 & 1) == 0)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"MailTrackingProtectionOnboardingViewControllerDidCompleteNotification" object:self];
  }
}

- (OBWelcomeController)welcomeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_welcomeController);

  return (OBWelcomeController *)WeakRetained;
}

- (void)setWelcomeController:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (OBTrayButton)continueButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButton);

  return (OBTrayButton *)WeakRetained;
}

- (void)setContinueButton:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)collectionViewWidthConstraint
{
  return self->_collectionViewWidthConstraint;
}

- (void)setCollectionViewWidthConstraint:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (EFCancelable)contentSizeObserver
{
  return self->_contentSizeObserver;
}

- (void)setContentSizeObserver:(id)a3
{
}

- (EFCancelable)buttonBoundsObserver
{
  return self->_buttonBoundsObserver;
}

- (void)setButtonBoundsObserver:(id)a3
{
}

- (MailTrackingProtectionOnboardingViewControllerValues)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_buttonBoundsObserver, 0);
  objc_storeStrong((id *)&self->_contentSizeObserver, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_collectionView);

  objc_destroyWeak((id *)&self->_welcomeController);
}

@end