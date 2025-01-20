@interface CarKeyboardModeController
- (BOOL)hidesStatusBanner;
- (BOOL)invalidAfterDisconnect;
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (BOOL)showsNavigationBar;
- (BOOL)suppressesStatusBannerAnimation;
- (CarKeyboardModeController)initWithRequestedInteractionModel:(unint64_t)a3 resultsProvider:(id)a4;
- (CarKeyboardResultsProviding)resultsProvider;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)fullscreenViewController;
- (int)currentUsageTarget;
- (int64_t)autohideBehavior;
- (unint64_t)requestedInteractionModel;
- (void)_ppt_selectKeyboardSearchButton;
- (void)_setPlaceholder;
- (void)configureFocusContainerGuideController:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)pptEndEditing;
- (void)pptHandleTextChange:(id)a3;
- (void)pptInvokeSearch:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setResultsProvider:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CarKeyboardModeController

- (CarKeyboardModeController)initWithRequestedInteractionModel:(unint64_t)a3 resultsProvider:(id)a4
{
  id v7 = a4;
  id v8 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:v7];
  v14.receiver = self;
  v14.super_class = (Class)CarKeyboardModeController;
  v9 = [(CarKeyboardModeController *)&v14 initWithSearchController:v8];
  if (v9)
  {
    if (!a3)
    {
      v10 = +[CarDisplayController sharedInstance];
      if ([v10 primaryInteractionModel])
      {
        v11 = +[CarDisplayController sharedInstance];
        a3 = (unint64_t)[v11 primaryInteractionModel];
      }
      else
      {
        a3 = 1;
      }
    }
    v9->_requestedInteractionModel = a3;
    objc_storeStrong((id *)&v9->_resultsProvider, a4);
    [(CarKeyboardResultsProviding *)v9->_resultsProvider setKeyboardMode:v9];
    [v8 _setRequestedInteractionModel:a3];
    [v8 setHidesNavigationBarDuringPresentation:0];
    [v8 setActive:1];
    [v8 setDelegate:v9];
    [v8 setSearchResultsUpdater:v9];
    v12 = [v8 searchBar];
    [v12 setSpellCheckingType:1];
  }
  return v9;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CarKeyboardModeController;
  [(CarKeyboardModeController *)&v17 viewDidLoad];
  [(CarKeyboardModeController *)self setDefinesPresentationContext:1];
  v3 = [(CarKeyboardModeController *)self searchController];
  v4 = [v3 searchBar];
  [v4 setDelegate:self];

  v5 = [(CarKeyboardModeController *)self searchController];
  v6 = [v5 searchBar];
  [v6 setShowsCancelButton:1];

  id v7 = [(CarKeyboardModeController *)self searchController];
  id v8 = [v7 searchBar];
  v9 = [(CarKeyboardModeController *)self navigationItem];
  [v9 setTitleView:v8];

  v10 = [(CarKeyboardModeController *)self navigationItem];
  [v10 setHidesBackButton:1];

  [(CarKeyboardModeController *)self setExtendedLayoutIncludesOpaqueBars:1];
  [(CarKeyboardModeController *)self setEdgesForExtendedLayout:1];
  v11 = [(CarKeyboardModeController *)self view];
  [v11 setAccessibilityIdentifier:@"CarKeyboardSearch"];

  v12 = [(CarKeyboardModeController *)self searchController];
  v13 = [v12 searchBar];
  [v13 setAccessibilityIdentifier:@"CarSearchBar"];

  objc_super v14 = +[UIColor tableBackgroundColor];
  v15 = [(CarKeyboardModeController *)self view];
  [v15 setBackgroundColor:v14];

  [(CarKeyboardModeController *)self _setPlaceholder];
  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_offlineSettingChangeHandler" name:@"UsingOfflineMapsStateChangedNotification" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarKeyboardModeController;
  [(CarKeyboardModeController *)&v8 viewWillAppear:a3];
  v4 = [(CarKeyboardModeController *)self resultsProvider];
  v5 = [(CarKeyboardModeController *)self searchController];
  [v4 updateForInteractionModel:[v5 _requestedInteractionModel]];

  v6 = sub_100018584();
  id v7 = [v6 oneInsights];
  [v7 preload];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarKeyboardModeController;
  [(CarKeyboardModeController *)&v7 viewDidAppear:a3];
  v4 = [(CarKeyboardModeController *)self searchController];
  v5 = [v4 searchBar];
  [v5 becomeFirstResponder];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"PPTTest_CarKeyboardModeController_DidDisplayKeyboard" object:0 userInfo:0];
}

- (void)_setPlaceholder
{
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  v5 = +[NSBundle mainBundle];
  id v10 = v5;
  if (v4) {
    CFStringRef v6 = @"[Offline CarPlay Search] Search Offline Maps";
  }
  else {
    CFStringRef v6 = @"[CarPlay Search] Search";
  }
  objc_super v7 = [v5 localizedStringForKey:v6 value:@"localized string not found" table:0];
  objc_super v8 = [(CarKeyboardModeController *)self searchController];
  v9 = [v8 searchBar];
  [v9 setPlaceholder:v7];
}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)showsNavigationBar
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (id)fullscreenViewController
{
  wrapperNavigationController = self->_wrapperNavigationController;
  if (!wrapperNavigationController)
  {
    unsigned int v4 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self];
    v5 = self->_wrapperNavigationController;
    self->_wrapperNavigationController = v4;

    [(UINavigationController *)self->_wrapperNavigationController loadViewIfNeeded];
    wrapperNavigationController = self->_wrapperNavigationController;
  }

  return wrapperNavigationController;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (BOOL)hidesStatusBanner
{
  return 1;
}

- (BOOL)suppressesStatusBannerAnimation
{
  return 1;
}

- (void)configureFocusContainerGuideController:(id)a3
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = [(CarKeyboardModeController *)self resultsProvider];
  [v5 updateSearchResultsForSearchController:v4];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  id v6 = [(CarKeyboardModeController *)self resultsProvider];
  id v5 = [v4 text];

  [v6 handleSearchButtonPressedWithText:v5];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = [(CarKeyboardModeController *)self chromeViewController];
  [v4 captureUserAction:2002];

  id v5 = [(CarKeyboardModeController *)self resultsProvider];
  [v5 handleCancelButtonPressed];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(CarKeyboardModeController *)self resultsProvider];
  [v6 handleSearchTextDidChange:v5];
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = +[CarChromeModeCoordinator sharedInstance];
  [v4 popFromContext:self];
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (int)currentUsageTarget
{
  return 1023;
}

- (void)_ppt_selectKeyboardSearchButton
{
  v3 = [(CarKeyboardModeController *)self searchController];
  id v4 = [v3 searchBar];
  id v5 = [v4 text];
  id v6 = [v5 length];

  if (v6)
  {
    id v10 = [(CarKeyboardModeController *)self resultsProvider];
    objc_super v7 = [(CarKeyboardModeController *)self searchController];
    objc_super v8 = [v7 searchBar];
    v9 = [v8 text];
    [v10 handleSearchButtonPressedWithText:v9];
  }
}

- (void)pptHandleTextChange:(id)a3
{
  id v4 = a3;
  id v6 = [(CarKeyboardModeController *)self searchController];
  id v5 = [v6 searchBar];
  [v5 setText:v4];
}

- (void)pptEndEditing
{
  id v3 = [(CarKeyboardModeController *)self searchController];
  v2 = [v3 searchBar];
  [v2 resignFirstResponder];
}

- (void)pptInvokeSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CarKeyboardModeController *)self resultsProvider];
  [v5 handleSearchButtonPressedWithText:v4];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (CarKeyboardResultsProviding)resultsProvider
{
  return self->_resultsProvider;
}

- (void)setResultsProvider:(id)a3
{
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsProvider, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);

  objc_storeStrong((id *)&self->_wrapperNavigationController, 0);
}

@end