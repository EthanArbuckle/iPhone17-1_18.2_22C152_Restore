@interface UserProfileContaineeViewController
- (ACAccount)account;
- (UserProfileContaineeViewController)initWithAccount:(id)a3 delegate:(id)a4;
- (UserProfileHeaderView)userProfileHeaderView;
- (double)_calculateHeight;
- (double)heightForLayout:(unint64_t)a3;
- (int64_t)floatingControlsOptions;
- (int64_t)numberOfRows;
- (void)_proceedToFavorites;
- (void)_proceedToLibrary;
- (void)_proceedToMyGuides;
- (void)_proceedToOfflineMaps;
- (void)_proceedToRatings;
- (void)_proceedToReports;
- (void)_proceedToTravelPreferences;
- (void)_proceedToVirtualGarage;
- (void)_retrieveUserInformation;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)handleDismissAction:(id)a3;
- (void)headerViewLinkTapped:(id)a3;
- (void)profileContentDidUpdate;
- (void)setAccount:(id)a3;
- (void)setNumberOfRows:(int64_t)a3;
- (void)setUserProfileHeaderView:(id)a3;
- (void)userDataDidUpdate;
- (void)userProfileLinkTapped:(id)a3 availableActions:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UserProfileContaineeViewController

- (UserProfileContaineeViewController)initWithAccount:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UserProfileContaineeViewController;
  v9 = [(UserProfileContaineeViewController *)&v16 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    v11 = [[UserProfileCollectionViewController alloc] initWithAccount:v10->_account contentViewDelegate:v10];
    contentViewController = v10->_contentViewController;
    v10->_contentViewController = v11;

    v13 = -[UserProfileHeaderView initWithFrame:]([UserProfileHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    userProfileHeaderView = v10->_userProfileHeaderView;
    v10->_userProfileHeaderView = v13;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UserProfileContaineeViewController;
  [(ContaineeViewController *)&v6 viewDidLoad];
  v3 = +[UserInformationManager sharedInstance];
  v4 = [v3 observers];
  [v4 registerObserver:self];

  [(UserProfileContaineeViewController *)self setAccessibilityIdentifier:@"UserProfileView"];
  [(UserProfileContaineeViewController *)self _retrieveUserInformation];
  [(UserProfileContaineeViewController *)self _setupViews];
  [(UserProfileContaineeViewController *)self _setupConstraints];
  v5 = +[UserInformationManager sharedInstance];
  +[MapsAnalyticStateProvider setUserProfileUserIsLoggedIntoICloud:](MapsAnalyticStateProvider, "setUserProfileUserIsLoggedIntoICloud:", [v5 loggedIn]);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UserProfileContaineeViewController;
  [(UserProfileContaineeViewController *)&v3 viewDidAppear:a3];
}

- (void)_setupViews
{
  if (sub_1000BBB44(self) == 5)
  {
    objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
    [v3 setAllowResizeInFloatingStyle:1];
  }
  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setPresentedModally:1];

  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setDefaultContaineeLayout:5];

  objc_super v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setTakesAvailableHeight:1];

  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 setHideGrabber:1];

  id v8 = [(ContaineeViewController *)self cardPresentationController];
  [v8 setUseDefaultLayoutWhenCalculatingBottomInsetForFloatingControls:1];

  v9 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
  [v9 setDelegate:self];

  v10 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v12 = [[UserProfileCollectionViewController alloc] initWithAccount:self->_account contentViewDelegate:self];
    v13 = self->_contentViewController;
    self->_contentViewController = v12;

    contentViewController = self->_contentViewController;
  }
  v14 = [(UserProfileCollectionViewController *)contentViewController view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(UserProfileContaineeViewController *)self addChildViewController:self->_contentViewController];
  [(UserProfileCollectionViewController *)self->_contentViewController didMoveToParentViewController:self];
  if (sub_1000BBB44(self) == 5)
  {
    v15 = [(ContaineeViewController *)self headerView];
    objc_super v16 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    [v15 addSubview:v16];

    v17 = [(ContaineeViewController *)self contentView];
    v18 = [(UserProfileCollectionViewController *)self->_contentViewController view];
    v19 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    [v17 insertSubview:v18 belowSubview:v19];

    v45 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    v43 = [v45 leadingAnchor];
    v44 = [(ContaineeViewController *)self headerView];
    v53 = [v44 leadingAnchor];
    v52 = [v43 constraintEqualToAnchor:];
    v55[0] = v52;
    v51 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    v20 = [v51 topAnchor];
    v49 = [(ContaineeViewController *)self headerView];
    [v49 topAnchor];
    v48 = v50 = v20;
    v47 = [v20 constraintEqualToAnchor:];
    v55[1] = v47;
    v46 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    v21 = [v46 trailingAnchor];
    v22 = [(ContaineeViewController *)self headerView];
    v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v55[2] = v24;
    v25 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    v26 = [v25 bottomAnchor];
    v27 = [(ContaineeViewController *)self headerView];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v55[3] = v29;
    v30 = +[NSArray arrayWithObjects:v55 count:4];
    +[NSLayoutConstraint activateConstraints:v30];

    v31 = v43;
    v32 = v45;

    v33 = v44;
  }
  else
  {
    v34 = [[ContainerHeaderView alloc] initWithCardButtonType:0];
    headerView = self->_headerView;
    self->_headerView = v34;

    [(ContainerHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v36) = 1148846080;
    [(ContainerHeaderView *)self->_headerView setContentCompressionResistancePriority:1 forAxis:v36];
    [(ContainerHeaderView *)self->_headerView setDelegate:self];
    [(ContainerHeaderView *)self->_headerView setHairLineAlpha:0.0];
    [(ContainerHeaderView *)self->_headerView setHeaderSize:2];
    v37 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    [(ContainerHeaderView *)self->_headerView setTitleView:v37];

    v38 = [(ContaineeViewController *)self headerView];
    [v38 addSubview:self->_headerView];

    v39 = [(ContaineeViewController *)self contentView];
    v40 = [(UserProfileCollectionViewController *)self->_contentViewController view];
    [v39 addSubview:v40];

    v32 = [(ContainerHeaderView *)self->_headerView leadingAnchor];
    v31 = [(ContaineeViewController *)self headerView];
    v33 = [v31 leadingAnchor];
    v53 = [v32 constraintEqualToAnchor:v33];
    v54[0] = v53;
    v41 = [(ContainerHeaderView *)self->_headerView topAnchor];
    v51 = [(ContaineeViewController *)self headerView];
    [v51 topAnchor];
    v50 = v52 = v41;
    v49 = [v41 constraintEqualToAnchor:];
    v54[1] = v49;
    v42 = [(ContainerHeaderView *)self->_headerView trailingAnchor];
    v47 = [(ContaineeViewController *)self headerView];
    [v47 trailingAnchor];
    v46 = v48 = v42;
    v21 = [v42 constraintEqualToAnchor:];
    v54[2] = v21;
    v22 = [(ContainerHeaderView *)self->_headerView bottomAnchor];
    v23 = [(ContaineeViewController *)self headerView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v54[3] = v25;
    v26 = +[NSArray arrayWithObjects:v54 count:4];
    +[NSLayoutConstraint activateConstraints:v26];
  }
}

- (void)_setupConstraints
{
  v23 = [(UserProfileCollectionViewController *)self->_contentViewController view];
  v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(UserProfileCollectionViewController *)self->_contentViewController view];
  objc_super v16 = [v18 leadingAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  v13 = [(UserProfileCollectionViewController *)self->_contentViewController view];
  objc_super v3 = [v13 trailingAnchor];
  v4 = [(ContaineeViewController *)self contentView];
  v5 = [v4 trailingAnchor];
  objc_super v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  id v7 = [(UserProfileCollectionViewController *)self->_contentViewController view];
  id v8 = [v7 bottomAnchor];
  v9 = [(ContaineeViewController *)self contentView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_retrieveUserInformation
{
  objc_super v3 = +[UserInformationManager sharedInstance];
  v4 = [v3 userIcon];
  v5 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
  [v5 setUserIcon:v4];

  objc_super v6 = +[UserInformationManager sharedInstance];
  LODWORD(v4) = [v6 loggedIn];

  if (v4)
  {
    id v7 = +[UserInformationManager sharedInstance];
    id v8 = [v7 userName];
    v9 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    [v9 setUserName:v8];

    id v15 = +[UserInformationManager sharedInstance];
    [v15 userEmail];
  }
  else
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"[User Profile] Apple Account - logged out state" value:@"localized string not found" table:0];
    v12 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
    [v12 setUserName:v11];

    id v15 = +[NSBundle mainBundle];
    [v15 localizedStringForKey:@"[User Profile] Sign in to your account - logged out state" value:@"localized string not found" table:0];
  v13 = };
  v14 = [(UserProfileContaineeViewController *)self userProfileHeaderView];
  [v14 setUserEmail:v13];
}

- (double)heightForLayout:(unint64_t)a3
{
  v5 = [(UserProfileContaineeViewController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
LABEL_2:
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 availableHeight];
    double v10 = v9;

    return v10;
  }
  if (sub_1000BBB44(self) != 5)
  {
    if (a3 == 5 || (double v10 = -1.0, a3 == 3))
    {
      [(UserProfileContaineeViewController *)self _calculateHeight];
      double v10 = v12;
    }
    v13 = [(ContaineeViewController *)self cardPresentationController];
    unint64_t v14 = (unint64_t)[v13 containerStyle];
    if (v14 <= 7 && ((1 << v14) & 0xE3) != 0)
    {

      return v10;
    }

    goto LABEL_2;
  }
  double v10 = -1.0;
  if (a3 != 2) {
    return v10;
  }

  [(UserProfileContaineeViewController *)self _calculateHeight];
  return result;
}

- (double)_calculateHeight
{
  int64_t numberOfRows = self->_numberOfRows;
  if (sub_1000BBB44(self) == 5) {
    double v4 = 66.0;
  }
  else {
    -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  }
  double v5 = (double)numberOfRows * 52.0 + 12.0 + -1.0;
  if (!numberOfRows) {
    double v5 = 271.0;
  }
  double v6 = v5 + v4;
  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 bottomSafeOffset];
  double v9 = v6 + v8;

  return v9;
}

- (void)headerViewLinkTapped:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=ROOT"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = +[UIApplication sharedApplication];
  [v3 _maps_openURL:v4];

  +[UserProfileAnalyticsManager captureICloudSignInTapAction];
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    double v5 = +[UIApplication sharedMapsDelegate];
    id v6 = [v5 appKitBundleClass];

    [v6 dismissCurrentToolbarPopover];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UserProfileContaineeViewController;
    [(ContaineeViewController *)&v7 handleDismissAction:v4];
  }
  +[UserProfileAnalyticsManager captureExitAccountTapAction];
}

- (void)profileContentDidUpdate
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 updateHeightForCurrentLayout];

  if (sub_1000BBB44(self) == 5)
  {
    [(UserProfileContaineeViewController *)self heightForLayout:2];
    double v5 = v4;
    if ([(UserProfileContaineeViewController *)self isViewLoaded])
    {
      id v6 = [(UserProfileContaineeViewController *)self view];
      objc_super v7 = [v6 window];
      double v8 = [v7 windowScene];
      double v9 = [v8 sizeRestrictions];
      [v9 setMinimumSize:320.0, v5];

      id v13 = [(UserProfileContaineeViewController *)self view];
      double v10 = [v13 window];
      v11 = [v10 windowScene];
      double v12 = [v11 sizeRestrictions];
      [v12 setMaximumSize:320.0, v5];
    }
  }
}

- (void)userProfileLinkTapped:(id)a3 availableActions:(id)a4
{
  id v6 = a4;
  id v7 = [a3 userProfileLinkType];
  switch((unint64_t)v7)
  {
    case 0uLL:
      [(UserProfileContaineeViewController *)self _proceedToLibrary];
      break;
    case 1uLL:
      [(UserProfileContaineeViewController *)self _proceedToFavorites];
      break;
    case 2uLL:
      [(UserProfileContaineeViewController *)self _proceedToMyGuides];
      break;
    case 3uLL:
      [(UserProfileContaineeViewController *)self _proceedToReports];
      break;
    case 4uLL:
      [(UserProfileContaineeViewController *)self _proceedToRatings];
      break;
    case 5uLL:
      [(UserProfileContaineeViewController *)self _proceedToVirtualGarage];
      break;
    case 6uLL:
      [(UserProfileContaineeViewController *)self _proceedToTravelPreferences];
      break;
    case 7uLL:
      [(UserProfileContaineeViewController *)self _proceedToOfflineMaps];
      break;
    default:
      break;
  }
  id v8 = +[UserInformationManager sharedInstance];
  +[UserProfileAnalyticsManager captureTapActionWithUserProfileLinkType:availableActions:signedIntoICloud:](UserProfileAnalyticsManager, "captureTapActionWithUserProfileLinkType:availableActions:signedIntoICloud:", v7, v6, [v8 loggedIn]);
}

- (void)_proceedToLibrary
{
  if (sub_1000BBB44(self) == 5) {
    [(UserProfileContaineeViewController *)self handleDismissAction:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerShowLibraryRootView:self];
  }
}

- (void)_proceedToFavorites
{
  uint64_t v3 = sub_1000BBB44(self);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v3 == 5)
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 presentMacToolTipForLinkType:1];
  }
  else
  {
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 viewControllerShowMyShortcuts:self];
  }
}

- (void)_proceedToMyGuides
{
  if (sub_1000BBB44(self) != 5)
  {
    id v12 = +[CollectionManager sharedManager];
    char v6 = [v12 currentCollectionsForiOSHome];
    id v7 = [v6 count];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v7)
    {
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 viewControllerShowCollections:self];
    }
    else
    {
      uint64_t v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_11;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 viewController:self createNewCollectionWithSession:0];
    }

    goto LABEL_11;
  }
  p_delegate = &self->_delegate;
  id v4 = objc_loadWeakRetained((id *)p_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return;
  }
  id v12 = objc_loadWeakRetained((id *)p_delegate);
  [v12 presentMacToolTipForLinkType:2];
LABEL_11:
}

- (void)_proceedToOfflineMaps
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 viewControllerShowOfflineMaps:self];
  }
}

- (void)_proceedToReports
{
  if (sub_1000BBB44(self) == 5) {
    [(UserProfileContaineeViewController *)self handleDismissAction:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerShowReports:self];
  }
}

- (void)_proceedToRatings
{
  if (sub_1000BBB44(self) == 5) {
    [(UserProfileContaineeViewController *)self handleDismissAction:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerPresentRatingsHistory:self];
  }
}

- (void)_proceedToVirtualGarage
{
  if (sub_1000BBB44(self) == 5) {
    [(UserProfileContaineeViewController *)self handleDismissAction:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerPresentVirtualGarage:self];
  }
}

- (void)_proceedToTravelPreferences
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 viewControllerPresentUserProfilePreferences:self withTabType:1];
  }
}

- (void)userDataDidUpdate
{
  [(UserProfileContaineeViewController *)self _retrieveUserInformation];

  [(UserProfileContaineeViewController *)self _setupConstraints];
}

- (int64_t)floatingControlsOptions
{
  return 51;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(int64_t)a3
{
  self->_int64_t numberOfRows = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (UserProfileHeaderView)userProfileHeaderView
{
  return self->_userProfileHeaderView;
}

- (void)setUserProfileHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end