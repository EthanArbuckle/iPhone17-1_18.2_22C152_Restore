@interface CarSearchCategoriesModeController
+ (id)_traitsForNavigation:(BOOL)a3;
+ (void)prepareNearby;
+ (void)prepareNearbySAR;
- (BOOL)isNavigating;
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (BrowseManager)browseManager;
- (CarSearchCategoriesCardViewController)categoriesCard;
- (CarSearchCategoriesModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)categories;
- (NSArray)preferredCarFocusEnvironments;
- (UIScrollView)pptTestScrollView;
- (id)desiredCards;
- (id)mapView;
- (int)currentUsageTarget;
- (int64_t)autohideBehavior;
- (void)_ppt_selectFirstCarplayBrowseCategory;
- (void)_ppt_selectKeyboardMode;
- (void)_updateCategories:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)checkFullTextSearchSupport;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureFocusContainerGuideController:(id)a3;
- (void)searchCategoriesCard:(id)a3 didSelectCategory:(id)a4;
- (void)searchCategoriesCardDidSelectKeyboardSearch:(id)a3 usingInteractionModel:(unint64_t)a4;
- (void)searchCategoriesCardDidSelectSiriSearch:(id)a3 usingInteractionModel:(unint64_t)a4;
- (void)setBrowseManager:(id)a3;
- (void)setCategories:(id)a3;
- (void)setCategoriesCard:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)updateCardViewTitle:(BOOL)a3;
@end

@implementation CarSearchCategoriesModeController

- (CarSearchCategoriesModeController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarSearchCategoriesModeController;
  v2 = [(CarSearchCategoriesModeController *)&v14 init];
  if (v2)
  {
    id v3 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
    v4 = +[CarDisplayController sharedInstance];
    v2->_isNavigating = [v4 isCarAppSceneHostingNavigation];

    unsigned int v5 = [(CarSearchCategoriesModeController *)v2 isNavigating];
    v6 = off_101300288;
    if (!v5) {
      v6 = off_101300280;
    }
    v7 = *v6;
    v8 = [[BrowseManager alloc] initWithCacheKey:v7];

    browseManager = v2->_browseManager;
    v2->_browseManager = v8;

    v10 = [(BrowseManager *)v2->_browseManager imageManager];
    [v10 setDesiredImageSize:29.0, 29.0];

    [(BrowseManager *)v2->_browseManager readCategoriesFromDiskIfNeeded];
    v11 = [(CarSearchCategoriesModeController *)v2 browseManager];
    v12 = [v11 cachedCategories];
    [(CarSearchCategoriesModeController *)v2 _updateCategories:v12];
  }
  return v2;
}

+ (id)_traitsForNavigation:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[CarDisplayController sharedInstance];
  unsigned int v5 = [v4 chromeViewController];
  v6 = [v5 currentTraits];

  [v6 setNavigating:v3];
  if ([v6 navigating])
  {
    v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v8 = [v7 BOOLForKey:@"EnableCarSARCategoryWorkaround"];

    if (v8)
    {
      [v6 setMapRegion:0];
      [v6 setHasCarHeadunitInteractionModel:0];
      [v6 setCarHeadunitModel:0];
      [v6 setHasCarHeadunitPixelWidth:0];
      [v6 setHasCarHeadunitPixelHeight:0];
      [v6 setCarHeadunitManufacturer:0];
      [v6 setHasCarHeadunitConnectionType:0];
    }
  }

  return v6;
}

- (id)mapView
{
  v2 = [(CarSearchCategoriesModeController *)self chromeViewController];
  BOOL v3 = [v2 mapView];

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [_traitsForNavigation:[self isNavigating]];
  v9 = [(CarSearchCategoriesModeController *)self browseManager];
  [v9 setTraits:v8];

  objc_initWeak(&location, self);
  v10 = [(CarSearchCategoriesModeController *)self browseManager];
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1009E1A08;
  v17 = &unk_1012E6E78;
  objc_copyWeak(&v18, &location);
  [v10 getCategoriesWithCompletion:&v14];

  v11 = [CarSearchCategoriesCardViewController alloc];
  v12 = [(CarSearchCategoriesModeController *)self categories];
  v13 = [(CarSearchCategoriesCardViewController *)v11 initWithCategories:v12 delegate:self];
  [(CarSearchCategoriesModeController *)self setCategoriesCard:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if (![a4 isEqualToString:@"primary"]) {
    goto LABEL_10;
  }
  id v7 = [(CarSearchCategoriesModeController *)self categoriesCard];
  [v6 setContent:v7];

  unsigned int v8 = +[MapsOfflineUIHelper sharedHelper];
  if (([v8 isUsingOfflineMaps] & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = [(CarSearchCategoriesModeController *)self categoriesCard];
  unsigned __int8 v10 = [v9 supportFullTextSearch];

  if (v10)
  {
LABEL_6:
    v11 = +[NSBundle mainBundle];
    v12 = v11;
    CFStringRef v13 = @"CarPlay_Search_Title";
    goto LABEL_7;
  }
  v11 = +[NSBundle mainBundle];
  v12 = v11;
  CFStringRef v13 = @"CarPlay_Search_Title_Browse_Mode";
LABEL_7:
  objc_super v14 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];
  [v6 setTitle:v14];

  HIDWORD(v30) = 0;
  *(_DWORD *)((char *)&v30 + 1) = 0;
  long long v20 = xmmword_100F6F1C0;
  long long v21 = xmmword_100F67600;
  uint64_t v22 = 3;
  uint64_t v23 = 1148846080;
  uint64_t v24 = 2;
  LODWORD(v25) = 1148846080;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v28 = _Q0;
  long long v29 = _Q0;
  LOBYTE(v30) = 1;
  uint64_t v31 = 8;
  LOBYTE(v32) = 0;
  if (v6) {
    [v6 setLayout:&v20];
  }
  [v6 setAccessory:1 v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32];
LABEL_10:
}

- (void)configureFocusContainerGuideController:(id)a3
{
}

- (void)checkFullTextSearchSupport
{
  BOOL v3 = [(CarSearchCategoriesModeController *)self categoriesCard];

  if (v3)
  {
    id v4 = [(CarSearchCategoriesModeController *)self categoriesCard];
    [v4 checkFullTextSearchSupport];
  }
}

- (void)_updateCategories:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 7) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  [v4 subarrayWithRange:0, v5];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(CarSearchCategoriesModeController *)self categories];
  unsigned __int8 v7 = [v10 isEqualToArray:v6];

  if ((v7 & 1) == 0)
  {
    [(CarSearchCategoriesModeController *)self setCategories:v10];
    unsigned int v8 = [(CarSearchCategoriesModeController *)self categoriesCard];
    v9 = [(CarSearchCategoriesModeController *)self categories];
    [v8 setCategories:v9];
  }
}

+ (void)prepareNearby
{
  id v4 = [[BrowseManager alloc] initWithCacheKey:@"Stark"];
  v2 = [(BrowseManager *)v4 imageManager];
  [v2 setDesiredImageSize:29.0, 29.0];

  BOOL v3 = [(id)objc_opt_class() _traitsForNavigation:0];
  [(BrowseManager *)v4 preCacheWithTraits:v3];
}

+ (void)prepareNearbySAR
{
  id v4 = [[BrowseManager alloc] initWithCacheKey:@"Stark-SAR"];
  v2 = [(BrowseManager *)v4 imageManager];
  [v2 setDesiredImageSize:29.0, 29.0];

  BOOL v3 = [(id)objc_opt_class() _traitsForNavigation:1];
  [(BrowseManager *)v4 preCacheWithTraits:v3];
}

- (void)searchCategoriesCardDidSelectSiriSearch:(id)a3 usingInteractionModel:(unint64_t)a4
{
  uint64_t v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "searchCategoriesCardDidSelectSiriSearch, showing siri usingIneractionModel: %ld", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[CarChromeModeCoordinator sharedInstance];
  [v6 displaySearchWithInteractionModel:a4];
}

- (void)searchCategoriesCardDidSelectKeyboardSearch:(id)a3 usingInteractionModel:(unint64_t)a4
{
  uint64_t v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "searchCategoriesCardDidSelectKeyboardSearch, showing keyboard usingIneractionModel: %ld", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[CarChromeModeCoordinator sharedInstance];
  [v6 displayKeyboardSearchWithInteractionModel:a4];
}

- (void)searchCategoriesCard:(id)a3 didSelectCategory:(id)a4
{
  id v5 = a4;
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchCategoriesCard:didSelectCategory: %@", (uint8_t *)&v13, 0xCu);
  }

  int v7 = [(CarSearchCategoriesModeController *)self categories];
  unint64_t v8 = sub_100099700(v7, &stru_101313A40);

  v9 = [(CarSearchCategoriesModeController *)self chromeViewController];
  id v10 = [v5 category];
  [v9 captureUserActionSelectedSearchCategory:v10 categoriesDisplayed:v8];

  LODWORD(v9) = [(CarSearchCategoriesModeController *)self isNavigating];
  v11 = +[CarChromeModeCoordinator sharedInstance];
  v12 = v11;
  if (v9) {
    [v11 displaySearchAlongTheRouteForCategory:v5];
  }
  else {
    [v11 displaySearchResultsWithCategory:v5];
  }
}

- (void)updateCardViewTitle:(BOOL)a3
{
  id v3 = [(CarSearchCategoriesModeController *)self chromeViewController];
  [v3 setNeedsUpdateComponent:@"cards" animated:0];
}

- (NSArray)preferredCarFocusEnvironments
{
  id v3 = [(CarSearchCategoriesModeController *)self categoriesCard];
  if (v3)
  {
    id v4 = [(CarSearchCategoriesModeController *)self categoriesCard];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    unint64_t v8 = v5;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)carFocusOrderSequences
{
  id v3 = [(CarSearchCategoriesModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  id v5 = [(CarSearchCategoriesModeController *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  int v7 = +[NSArray arrayWithObjects:v11 count:2];
  unint64_t v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
  v12 = v8;
  v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int)currentUsageTarget
{
  if ([(CarSearchCategoriesModeController *)self isNavigating]) {
    return 1010;
  }
  else {
    return 1009;
  }
}

- (UIScrollView)pptTestScrollView
{
  v2 = [(CarSearchCategoriesModeController *)self categoriesCard];
  id v3 = [v2 pptTestScrollView];

  return (UIScrollView *)v3;
}

- (void)_ppt_selectFirstCarplayBrowseCategory
{
  id v2 = [(CarSearchCategoriesModeController *)self categoriesCard];
  [v2 _ppt_selectFirstCarplayBrowseCategory];
}

- (void)_ppt_selectKeyboardMode
{
  id v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displayKeyboardSearchWithInteractionModel:1];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (CarSearchCategoriesCardViewController)categoriesCard
{
  return self->_categoriesCard;
}

- (void)setCategoriesCard:(id)a3
{
}

- (BrowseManager)browseManager
{
  return self->_browseManager;
}

- (void)setBrowseManager:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_categoriesCard, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end