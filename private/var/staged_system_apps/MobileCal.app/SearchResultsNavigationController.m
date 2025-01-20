@interface SearchResultsNavigationController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_todayLocalizedString;
- (BOOL)initialPresentationHasCompleted;
- (CUIKCalendarModel)model;
- (SearchResultsNavigationController)initWithModel:(id)a3 window:(id)a4;
- (SearchResultsViewController)searchResultsViewController;
- (UISearchBar)searchBar;
- (void)_hideSearchBar;
- (void)_setSearchBarEnabledState:(BOOL)a3;
- (void)_showSearchBar;
- (void)_updateTodayButtonPosition;
- (void)animateShowingSearchBarAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)hideSearchBarForNavigationTransitionAnimated:(BOOL)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setInitialPresentationHasCompleted:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchResultsViewController:(id)a3;
- (void)todayPressed;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SearchResultsNavigationController

- (SearchResultsNavigationController)initWithModel:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SearchResultsNavigationController;
  v8 = [(SearchResultsNavigationController *)&v19 init];
  v9 = v8;
  if (v8)
  {
    [(SearchResultsNavigationController *)v8 setModel:v6];
    v10 = [SearchResultsViewController alloc];
    v11 = [(SearchResultsNavigationController *)v9 model];
    v12 = [(SearchResultsViewController *)v10 initWithModel:v11 window:v7];
    [(SearchResultsNavigationController *)v9 setSearchResultsViewController:v12];

    [(SearchResultsNavigationController *)v9 setDelegate:v9];
    objc_initWeak(&location, v9);
    uint64_t v20 = objc_opt_class();
    v13 = +[NSArray arrayWithObjects:&v20 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011AC0C;
    v16[3] = &unk_1001D2620;
    objc_copyWeak(&v17, &location);
    id v14 = [(SearchResultsNavigationController *)v9 registerForTraitChanges:v13 withHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsNavigationController;
  [(SearchResultsNavigationController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  [(SearchResultsNavigationController *)self setToolbarHidden:1 animated:0];
  [(SearchResultsNavigationController *)self setNavigationBarHidden:1 animated:0];
  v3 = [(SearchResultsNavigationController *)self searchResultsViewController];
  [(SearchResultsNavigationController *)self pushViewController:v3 animated:0];

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsNavigationController;
  [(SearchResultsNavigationController *)&v4 viewDidLoad];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SearchResultsNavigationController;
  -[SearchResultsNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v23, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x4010000000;
  v20[3] = &unk_1001B5939;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [(SearchResultsNavigationController *)self searchBar];
  [v8 frame];
  *(void *)&long long v21 = v9;
  *((void *)&v21 + 1) = v10;
  *(void *)&long long v22 = v11;
  *((void *)&v22 + 1) = v12;

  v13 = [(SearchResultsNavigationController *)self searchBar];
  id v14 = [v13 superview];
  [v14 bounds];
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10011AFE4;
  v19[3] = &unk_1001D5BA0;
  *(double *)&v19[6] = width;
  *(double *)&v19[7] = height;
  v19[4] = self;
  v19[5] = v20;
  v19[8] = v16;
  v19[9] = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
  _Block_object_dispose(v20, 8);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchResultsNavigationController;
  id v4 = a3;
  [(SearchResultsNavigationController *)&v7 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(SearchResultsNavigationController *)self searchResultsViewController];

  if (v5 == v4)
  {
    id v6 = [(SearchResultsNavigationController *)self searchResultsViewController];
    [v6 preferredContentSize];
    -[SearchResultsNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v18 = a4;
  id v6 = [(SearchResultsNavigationController *)self searchResultsViewController];
  if (v6 == v18
    && [(SearchResultsNavigationController *)self initialPresentationHasCompleted])
  {
    objc_super v7 = [(SearchResultsNavigationController *)self traitCollection];
    id v8 = [v7 horizontalSizeClass];

    if (v8 == (id)1) {
      [(SearchResultsNavigationController *)self animateShowingSearchBarAnimated:1 withCompletion:0];
    }
  }
  else
  {
  }
  [(SearchResultsNavigationController *)self setInitialPresentationHasCompleted:1];
  id v9 = [(SearchResultsNavigationController *)self searchResultsViewController];
  BOOL v10 = v9 == v18;

  [(SearchResultsNavigationController *)self _setSearchBarEnabledState:v10];
  [(SearchResultsNavigationController *)self setNavigationBarHidden:v10 animated:1];
  uint64_t v11 = v18;
  if (v9 == v18)
  {
    uint64_t v12 = [(SearchResultsNavigationController *)self presentingViewController];
    v13 = [v12 view];
    id v14 = [v13 window];
    EKUIPushFallbackSizingContextWithViewHierarchy();

    [(SearchResultsNavigationController *)self _updateTodayButtonPosition];
    uint64_t v15 = [(SearchResultsNavigationController *)self presentingViewController];
    uint64_t v16 = [v15 view];
    uint64_t v17 = [v16 window];
    EKUIPopFallbackSizingContextWithViewHierarchy();

    uint64_t v11 = v18;
  }
}

- (void)hideSearchBarForNavigationTransitionAnimated:(BOOL)a3
{
  if (a3
    && ([(SearchResultsNavigationController *)self transitionCoordinator],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = [(SearchResultsNavigationController *)self transitionCoordinator];
    id v6 = [(SearchResultsNavigationController *)self searchBar];
    objc_super v7 = [v6 superview];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10011B6DC;
    v10[3] = &unk_1001D2E40;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10011B6E4;
    v9[3] = &unk_1001D2E40;
    [v5 animateAlongsideTransitionInView:v7 animation:v10 completion:v9];
  }
  else
  {
    [(SearchResultsNavigationController *)self _hideSearchBar];
    id v8 = [(SearchResultsNavigationController *)self searchBar];
    [v8 setHidden:1];
  }
}

- (void)animateShowingSearchBarAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if (v4)
  {
    objc_super v7 = [(SearchResultsNavigationController *)self transitionCoordinator];
    id v8 = [(SearchResultsNavigationController *)self searchBar];
    id v9 = [v8 superview];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10011B878;
    v12[3] = &unk_1001D2E40;
    v12[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10011B880;
    v10[3] = &unk_1001D2DC8;
    uint64_t v11 = v6;
    [v7 animateAlongsideTransitionInView:v9 animation:v12 completion:v10];
  }
  else
  {
    [(SearchResultsNavigationController *)self _showSearchBar];
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)_hideSearchBar
{
  v3 = [(SearchResultsNavigationController *)self searchBar];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  double v12 = v5 - CGRectGetWidth(v16);
  v13 = [(SearchResultsNavigationController *)self searchBar];
  [v13 setFrame:v12, v7, v9, v11];

  id v14 = [(SearchResultsNavigationController *)self searchBar];
  [v14 resignFirstResponder];
}

- (void)_showSearchBar
{
  v3 = [(SearchResultsNavigationController *)self searchBar];
  [v3 frame];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.double width = v9;
  v15.size.double height = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011BA70;
  v14[3] = &unk_1001D29C8;
  v14[4] = self;
  *(double *)&v14[5] = -CGRectGetWidth(v15);
  *(double *)&v14[6] = v7;
  *(double *)&v14[7] = v9;
  *(double *)&v14[8] = v11;
  +[UIView performWithoutAnimation:v14];
  double v12 = [(SearchResultsNavigationController *)self searchBar];
  [v12 setFrame:0.0, v7, v9, v11];

  v13 = [(SearchResultsNavigationController *)self searchBar];
  [v13 becomeFirstResponder];
}

- (void)setSearchBar:(id)a3
{
  p_searchBar = &self->_searchBar;
  id v5 = a3;
  objc_storeWeak((id *)p_searchBar, v5);
  id v6 = [(SearchResultsNavigationController *)self searchResultsViewController];
  [v6 setSearchBar:v5];
}

- (void)_updateTodayButtonPosition
{
  v3 = [(SearchResultsNavigationController *)self view];
  int IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy)
  {
    id v5 = [(SearchResultsNavigationController *)self searchBar];
    id v13 = [v5 _leftButton];

    id v6 = CalendarAppTintColor();
    [v13 setTitleColor:v6 forState:0];

    double v7 = [(id)objc_opt_class() _todayLocalizedString];
    [v13 setTitle:v7 forState:0];

    [v13 addTarget:self action:"todayPressed" forControlEvents:64];
    [(SearchResultsNavigationController *)self setToolbarHidden:1 animated:0];
  }
  else
  {
    id v8 = objc_alloc((Class)UIBarButtonItem);
    double v9 = [(id)objc_opt_class() _todayLocalizedString];
    id v10 = [v8 initWithTitle:v9 style:0 target:self action:"todayPressed"];

    double v11 = [(SearchResultsNavigationController *)self searchResultsViewController];
    id v14 = v10;
    double v12 = +[NSArray arrayWithObjects:&v14 count:1];
    [v11 setToolbarItems:v12 animated:1];

    [(SearchResultsNavigationController *)self setToolbarHidden:0 animated:0];
  }
}

- (void)_setSearchBarEnabledState:(BOOL)a3
{
  id v5 = [(SearchResultsNavigationController *)self transitionCoordinator];
  id v6 = [(SearchResultsNavigationController *)self searchBar];
  double v7 = [v6 superview];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011BE40;
  v8[3] = &unk_1001D2E18;
  v8[4] = self;
  BOOL v9 = a3;
  [v5 animateAlongsideTransitionInView:v7 animation:v8 completion:0];
}

- (void)todayPressed
{
  CalAnalyticsSendEvent();
  CUIKTodayDate();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(SearchResultsNavigationController *)self model];
  double v4 = [v3 eventStore];
  id v5 = [v4 timeZone];

  id v6 = [objc_alloc((Class)EKCalendarDate) initWithDate:v8 timeZone:v5];
  double v7 = [(SearchResultsNavigationController *)self searchResultsViewController];
  [v7 selectDate:v6 animated:1];
}

+ (id)_todayLocalizedString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];

  return v3;
}

- (SearchResultsViewController)searchResultsViewController
{
  return self->_searchResultsViewController;
}

- (void)setSearchResultsViewController:(id)a3
{
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)initialPresentationHasCompleted
{
  return self->_initialPresentationHasCompleted;
}

- (void)setInitialPresentationHasCompleted:(BOOL)a3
{
  self->_initialPresentationHasCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_searchBar);

  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
}

@end