@interface CHTrophyCaseViewController
- (AAUIAchievementDetailTransitionAnimator)transitionAnimator;
- (AAUIAchievementsDataProvider)dataProvider;
- (AAUIBadgeImageFactory)badgeImageFactory;
- (ACHAchievement)initialAchievement;
- (ACHAchievementLocalizationProvider)localizationProvider;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)initialAchievementPresented;
- (BOOL)observerSetupComplete;
- (BOOL)shouldShowCelebration;
- (CHAchievementsDataSource)mainSectionDataSource;
- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource;
- (CHTrophyCaseViewController)initWithBadgeImageFactory:(id)a3 formattingManager:(id)a4 localizationProvider:(id)a5 initialAchievement:(id)a6 shouldShowCelebration:(BOOL)a7;
- (CHTrophyCaseViewControllerDelegate)delegate;
- (FIUIFormattingManager)formattingManager;
- (UIActivityIndicatorView)spinner;
- (UICollectionView)mainCollectionView;
- (UICollectionView)recentAndRelevantCollectionView;
- (UIView)loadingView;
- (UIView)overlayView;
- (UIViewController)transitionAnimatorFromViewController;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_presentInitialAchievementIfNeeded;
- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3;
- (void)dealloc;
- (void)detachPalette;
- (void)presentDetailForAchievement:(id)a3 badgeRect:(CGRect)a4 conversionView:(id)a5 cell:(id)a6;
- (void)setBadgeImageFactory:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setInitialAchievement:(id)a3;
- (void)setInitialAchievementPresented:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setLocalizationProvider:(id)a3;
- (void)setMainCollectionView:(id)a3;
- (void)setMainSectionDataSource:(id)a3;
- (void)setObserverSetupComplete:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setRecentAndRelevantCollectionView:(id)a3;
- (void)setRecentAndRelevantDataSource:(id)a3;
- (void)setShouldShowCelebration:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setTransitionAnimator:(id)a3;
- (void)setTransitionAnimatorFromViewController:(id)a3;
- (void)setWheelchairUseCache:(id)a3;
- (void)unitPreferencesDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation CHTrophyCaseViewController

- (CHTrophyCaseViewController)initWithBadgeImageFactory:(id)a3 formattingManager:(id)a4 localizationProvider:(id)a5 initialAchievement:(id)a6 shouldShowCelebration:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CHTrophyCaseViewController;
  v17 = [(CHTrophyCaseViewController *)&v27 initWithNibName:0 bundle:0];
  if (v17)
  {
    +[NSBundle mainBundle];
    v18 = BOOL v26 = a7;
    [v18 localizedStringForKey:@"AWARDS" value:&stru_1008D8AB8 table:@"Localizable"];
    id obj = a6;
    id v19 = v16;
    id v20 = v15;
    id v21 = v14;
    v23 = id v22 = v13;
    [(CHTrophyCaseViewController *)v17 setTitle:v23];

    id v13 = v22;
    id v14 = v21;
    id v15 = v20;
    id v16 = v19;

    objc_storeStrong((id *)&v17->_badgeImageFactory, a3);
    objc_storeStrong((id *)&v17->_formattingManager, a4);
    objc_storeStrong((id *)&v17->_localizationProvider, a5);
    objc_storeStrong((id *)&v17->_initialAchievement, obj);
    v17->_shouldShowCelebration = v26;
  }

  return v17;
}

- (void)viewDidLoad
{
  v111.receiver = self;
  v111.super_class = (Class)CHTrophyCaseViewController;
  [(CHTrophyCaseViewController *)&v111 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(CHTrophyCaseViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v107 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v5 = [v107 _rowAlignmentOptions];
  id v106 = [v5 mutableCopy];

  [v106 setObject:&off_1008DE820 forKeyedSubscript:UIFlowLayoutRowVerticalAlignmentKey];
  id v6 = [v106 copy];
  [v107 _setRowAlignmentsOptions:v6];

  id v7 = objc_alloc((Class)UICollectionView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v11 = [v7 initWithFrame:v107 origin:CGPointMake(0, 0) size:CGSizeMake(width, height)];
  [(CHTrophyCaseViewController *)self setMainCollectionView:v11];

  v12 = +[UIColor systemBackgroundColor];
  id v13 = [(CHTrophyCaseViewController *)self mainCollectionView];
  [v13 setBackgroundColor:v12];

  id v14 = [(CHTrophyCaseViewController *)self mainCollectionView];
  [v14 setPrefetchingEnabled:1];

  id v15 = [(CHTrophyCaseViewController *)self mainCollectionView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v16 = [(CHTrophyCaseViewController *)self view];
  v17 = [(CHTrophyCaseViewController *)self mainCollectionView];
  [v16 addSubview:v17];

  v105 = objc_alloc_init(CHRecentAndRelevantAchievementsCollectionViewFlowLayout);
  id v18 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHTrophyCaseViewController *)self setRecentAndRelevantCollectionView:v18];

  id v19 = +[UIColor systemBackgroundColor];
  id v20 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  [v20 setBackgroundColor:v19];

  id v21 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  [v21 setPrefetchingEnabled:1];

  id v22 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  [v23 setShowsHorizontalScrollIndicator:0];

  [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)v105 setSectionHeadersPinToVisibleBounds:1];
  v24 = [CHAchievementsRecentAndRelevantDataSource alloc];
  v25 = [(CHTrophyCaseViewController *)self dataProvider];
  BOOL v26 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  objc_super v27 = [(CHTrophyCaseViewController *)self localizationProvider];
  v28 = [(CHTrophyCaseViewController *)self badgeImageFactory];
  v29 = [(CHAchievementsRecentAndRelevantDataSource *)v24 initWithDataProvider:v25 collectionView:v26 localizationProvider:v27 badgeImageFactory:v28];
  [(CHTrophyCaseViewController *)self setRecentAndRelevantDataSource:v29];

  v30 = [CHAchievementsDataSource alloc];
  v31 = [(CHTrophyCaseViewController *)self dataProvider];
  v32 = [(CHTrophyCaseViewController *)self mainCollectionView];
  v33 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  v34 = [(CHTrophyCaseViewController *)self recentAndRelevantDataSource];
  v35 = [(CHTrophyCaseViewController *)self localizationProvider];
  v36 = [(CHTrophyCaseViewController *)self badgeImageFactory];
  v37 = [(CHAchievementsDataSource *)v30 initWithDataProvider:v31 collectionView:v32 recentAndRelevantCollectionView:v33 recentAndRelevantDataSource:v34 localizationProvider:v35 badgeImageFactory:v36];
  [(CHTrophyCaseViewController *)self setMainSectionDataSource:v37];

  v38 = [(CHTrophyCaseViewController *)self mainCollectionView];
  v39 = [v38 topAnchor];
  v40 = [(CHTrophyCaseViewController *)self view];
  v41 = [v40 topAnchor];
  v103 = [v39 constraintEqualToAnchor:v41];

  v42 = [(CHTrophyCaseViewController *)self mainCollectionView];
  v43 = [v42 bottomAnchor];
  v44 = [(CHTrophyCaseViewController *)self view];
  v45 = [v44 bottomAnchor];
  v102 = [v43 constraintEqualToAnchor:v45];

  v46 = [(CHTrophyCaseViewController *)self mainCollectionView];
  v47 = [v46 leadingAnchor];
  v48 = [(CHTrophyCaseViewController *)self view];
  v49 = [v48 leadingAnchor];
  v101 = [v47 constraintEqualToAnchor:v49];

  v50 = [(CHTrophyCaseViewController *)self mainCollectionView];
  v51 = [v50 trailingAnchor];
  v52 = [(CHTrophyCaseViewController *)self view];
  v53 = [v52 trailingAnchor];
  v100 = [v51 constraintEqualToAnchor:v53];

  v113[0] = v103;
  v113[1] = v102;
  v113[2] = v101;
  v113[3] = v100;
  v54 = +[NSArray arrayWithObjects:v113 count:4];
  +[NSLayoutConstraint activateConstraints:v54];

  objc_initWeak(&location, self);
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_10015A2E0;
  v108[3] = &unk_1008ADD20;
  objc_copyWeak(&v109, &location);
  v104 = objc_retainBlock(v108);
  v55 = [(CHTrophyCaseViewController *)self mainSectionDataSource];
  [v55 setAchievementTappedHandler:v104];

  v56 = [(CHTrophyCaseViewController *)self recentAndRelevantDataSource];
  [v56 setAchievementTappedHandler:v104];

  id v57 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHTrophyCaseViewController *)self setLoadingView:v57];

  v58 = [(CHTrophyCaseViewController *)self loadingView];
  [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

  v59 = +[UIColor systemBackgroundColor];
  v60 = [(CHTrophyCaseViewController *)self loadingView];
  [v60 setBackgroundColor:v59];

  v61 = [(CHTrophyCaseViewController *)self view];
  v62 = [(CHTrophyCaseViewController *)self loadingView];
  [v61 addSubview:v62];

  v63 = [(CHTrophyCaseViewController *)self loadingView];
  v64 = [v63 centerXAnchor];
  v65 = [(CHTrophyCaseViewController *)self view];
  v66 = [v65 centerXAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];

  v68 = [(CHTrophyCaseViewController *)self loadingView];
  v69 = [v68 centerYAnchor];
  v70 = [(CHTrophyCaseViewController *)self view];
  v71 = [v70 centerYAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];

  v73 = [(CHTrophyCaseViewController *)self loadingView];
  v74 = [v73 widthAnchor];
  v75 = [(CHTrophyCaseViewController *)self view];
  v76 = [v75 widthAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];

  v78 = [(CHTrophyCaseViewController *)self loadingView];
  v79 = [v78 heightAnchor];
  v80 = [(CHTrophyCaseViewController *)self view];
  v81 = [v80 heightAnchor];
  v82 = [v79 constraintEqualToAnchor:v81];

  v112[0] = v67;
  v112[1] = v72;
  v112[2] = v77;
  v112[3] = v82;
  v83 = +[NSArray arrayWithObjects:v112 count:4];
  +[NSLayoutConstraint activateConstraints:v83];

  id v84 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [(CHTrophyCaseViewController *)self setSpinner:v84];

  v85 = [(CHTrophyCaseViewController *)self spinner];
  [v85 setTranslatesAutoresizingMaskIntoConstraints:0];

  v86 = [(CHTrophyCaseViewController *)self loadingView];
  v87 = [(CHTrophyCaseViewController *)self spinner];
  [v86 addSubview:v87];

  v88 = [(CHTrophyCaseViewController *)self spinner];
  v89 = [v88 centerXAnchor];
  v90 = [(CHTrophyCaseViewController *)self loadingView];
  v91 = [v90 centerXAnchor];
  v92 = [v89 constraintEqualToAnchor:v91];
  [v92 setActive:1];

  v93 = [(CHTrophyCaseViewController *)self spinner];
  v94 = [v93 centerYAnchor];
  v95 = [(CHTrophyCaseViewController *)self loadingView];
  v96 = [v95 centerYAnchor];
  v97 = [v94 constraintEqualToAnchor:v96];
  [v97 setActive:1];

  v98 = [(CHTrophyCaseViewController *)self spinner];
  [v98 startAnimating];

  v99 = +[NSNotificationCenter defaultCenter];
  [v99 addObserver:self selector:"unitPreferencesDidChange:" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];

  objc_destroyWeak(&v109);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CHTrophyCaseViewController;
  [(CHTrophyCaseViewController *)&v8 viewWillAppear:a3];
  if (!self->_observerSetupComplete)
  {
    self->_observerSetupComplete = 1;
    v4 = [(CHTrophyCaseViewController *)self dataProvider];
    [v4 addInitialLoadObserver:self];
  }
  v5 = [(CHTrophyCaseViewController *)self navigationController];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController];

  if (v6)
  {
    id v7 = [(CHTrophyCaseViewController *)self navigationController];
    [v7 detachPalette];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHTrophyCaseViewController;
  [(CHTrophyCaseViewController *)&v5 viewDidAppear:a3];
  v4 = [(CHTrophyCaseViewController *)self navigationController];
  [v4 setDelegate:self];

  [(CHTrophyCaseViewController *)self setTransitionAnimator:0];
  [(CHTrophyCaseViewController *)self _presentInitialAchievementIfNeeded];
}

- (void)dealloc
{
  v3 = [(CHTrophyCaseViewController *)self dataProvider];
  [v3 removeInitialLoadObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHTrophyCaseViewController;
  [(CHTrophyCaseViewController *)&v4 dealloc];
}

- (void)unitPreferencesDidChange:(id)a3
{
  objc_super v4 = [(CHTrophyCaseViewController *)self recentAndRelevantCollectionView];
  [v4 reloadData];

  id v5 = [(CHTrophyCaseViewController *)self mainCollectionView];
  [v5 reloadData];
}

- (void)presentDetailForAchievement:(id)a3 badgeRect:(CGRect)a4 conversionView:(id)a5 cell:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = ACHLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v34.origin.double x = x;
    v34.origin.double y = y;
    v34.size.double width = width;
    v34.size.double height = height;
    v17 = NSStringFromCGRect(v34);
    *(_DWORD *)buf = 138543874;
    id v29 = v13;
    __int16 v30 = 2114;
    v31 = v17;
    __int16 v32 = 2114;
    id v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Presenting detail for achievement %{public}@ badgeRect %{public}@ conversionView %{public}@", buf, 0x20u);
  }
  id v18 = [CHAchievementDetailViewController alloc];
  id v19 = [(CHTrophyCaseViewController *)self localizationProvider];
  id v20 = [(CHAchievementDetailViewController *)v18 initWithAchievement:v13 locProvider:v19 formatsForFriend:0 forDayView:0 forModalPresentation:0 shouldShowCelebration:0];

  uint64_t v21 = [v13 unearned] ^ 1;
  id v22 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10015A804;
  v26[3] = &unk_1008ACA80;
  id v27 = v15;
  id v23 = v15;
  id v24 = [v22 initWithPresentingViewController:self detailViewController:v20 shouldPlayFlipInAnimation:v21 initialBadgeFrame:&stru_1008ADD60 conversionView:&stru_1008ADD80 presentAlongsideBlock:x, y, width, height, v26];
  [(CHTrophyCaseViewController *)self setTransitionAnimator:v24];

  v25 = [(CHTrophyCaseViewController *)self navigationController];
  [v25 pushViewController:v20 animated:1];
}

- (void)detachPalette
{
  v3 = [(CHTrophyCaseViewController *)self navigationController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController];

  if (v4)
  {
    id v5 = [(CHTrophyCaseViewController *)self navigationController];
    [v5 detachPalette];
  }
}

- (void)_presentInitialAchievementIfNeeded
{
  if (self->_initialAchievement && !self->_initialAchievementPresented)
  {
    self->_initialAchievementPresented = 1;
    v3 = [CHAchievementDetailViewController alloc];
    initialAchievement = self->_initialAchievement;
    id v5 = [(CHTrophyCaseViewController *)self localizationProvider];
    unsigned int v6 = [(CHAchievementDetailViewController *)v3 initWithAchievement:initialAchievement locProvider:v5 formatsForFriend:0 forDayView:0 forModalPresentation:1 shouldShowCelebration:self->_shouldShowCelebration];

    id v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pushing achievement detail sheet for initial achievement", v10, 2u);
    }

    objc_super v8 = [(CHTrophyCaseViewController *)self navigationController];
    [v8 pushViewController:v6 animated:0];

    v9 = [(CHTrophyCaseViewController *)self delegate];
    [v9 trophyCaseDidBeginCelebration:self];
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 2)
  {
    id v14 = [(CHTrophyCaseViewController *)self transitionAnimatorFromViewController];
    if (v14 == v12)
    {
      id v13 = [(CHTrophyCaseViewController *)self transitionAnimator];
    }
    else
    {
      id v13 = 0;
    }
  }
  else if (a4 == 1)
  {
    [(CHTrophyCaseViewController *)self setTransitionAnimatorFromViewController:v11];
    id v13 = [(CHTrophyCaseViewController *)self transitionAnimator];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  v3 = [(CHTrophyCaseViewController *)self navigationController];
  unsigned int v4 = [v3 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AB8C;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setWheelchairUseCache:(id)a3
{
  p_wheelchairUseCache = &self->_wheelchairUseCache;
  objc_storeStrong((id *)&self->_wheelchairUseCache, a3);
  id v6 = a3;
  [(_HKWheelchairUseCharacteristicCache *)*p_wheelchairUseCache addObserver:self];
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(CHTrophyCaseViewController *)self localizationProvider];
  [v5 setWheelchairUser:v4];
}

- (CHTrophyCaseViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHTrophyCaseViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache
{
  return self->_wheelchairUseCache;
}

- (UICollectionView)mainCollectionView
{
  return self->_mainCollectionView;
}

- (void)setMainCollectionView:(id)a3
{
}

- (UICollectionView)recentAndRelevantCollectionView
{
  return self->_recentAndRelevantCollectionView;
}

- (void)setRecentAndRelevantCollectionView:(id)a3
{
}

- (CHAchievementsDataSource)mainSectionDataSource
{
  return self->_mainSectionDataSource;
}

- (void)setMainSectionDataSource:(id)a3
{
}

- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource
{
  return self->_recentAndRelevantDataSource;
}

- (void)setRecentAndRelevantDataSource:(id)a3
{
}

- (AAUIAchievementDetailTransitionAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
}

- (UIViewController)transitionAnimatorFromViewController
{
  return self->_transitionAnimatorFromViewController;
}

- (void)setTransitionAnimatorFromViewController:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (ACHAchievementLocalizationProvider)localizationProvider
{
  return self->_localizationProvider;
}

- (void)setLocalizationProvider:(id)a3
{
}

- (ACHAchievement)initialAchievement
{
  return self->_initialAchievement;
}

- (void)setInitialAchievement:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)observerSetupComplete
{
  return self->_observerSetupComplete;
}

- (void)setObserverSetupComplete:(BOOL)a3
{
  self->_observerSetupComplete = a3;
}

- (BOOL)initialAchievementPresented
{
  return self->_initialAchievementPresented;
}

- (void)setInitialAchievementPresented:(BOOL)a3
{
  self->_initialAchievementPresented = a3;
}

- (BOOL)shouldShowCelebration
{
  return self->_shouldShowCelebration;
}

- (void)setShouldShowCelebration:(BOOL)a3
{
  self->_shouldShowCelebration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_initialAchievement, 0);
  objc_storeStrong((id *)&self->_localizationProvider, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, 0);
  objc_storeStrong((id *)&self->_mainSectionDataSource, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, 0);
  objc_storeStrong((id *)&self->_mainCollectionView, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCache, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end