@interface CHWorkoutDetailViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (CHWorkoutDetailViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 model:(id)a6 fitnessAppContext:(id)a7 workoutFormattingManager:(id)a8 workoutDataProvider:(id)a9 badgeImageFactory:(id)a10 friendListManager:(id)a11 achievementLocalizationProvider:(id)a12 pauseRingsCoordinator:(id)a13 achievementResourceProvider:(id)a14 formattingManager:(id)a15 awardsDataProvider:(id)a16 shouldExposeDeepLinkToTrainingLoadFromEffort:(BOOL)a17;
- (CHWorkoutFormattingManager)workoutFormattingManager;
- (FIUIFormattingManager)formattingManager;
- (HKWorkout)workout;
- (HKWorkoutActivity)workoutActivity;
- (UIImage)sharingImage;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_presentActivityViewControllerForItems:(id)a3;
- (void)_presentConfigurationData:(id)a3;
- (void)_presentShareSheetWithTitle:(id)a3 image:(id)a4 workoutData:(id)a5;
- (void)_shareSeymourWorkout;
- (void)_shareWorkout;
- (void)_workoutWasDeleted:(id)a3;
- (void)annotateView;
- (void)completedFetchWithLocationReadings:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)navigateToSection:(int64_t)a3;
- (void)presentAchievement:(id)a3 badgeRect:(CGRect)a4 cell:(id)a5;
- (void)presentViewController:(id)a3 completion:(id)a4;
- (void)pushViewController:(id)a3;
- (void)pushWorkoutActivity:(id)a3;
- (void)refreshWorkoutLocations;
- (void)setFormattingManager:(id)a3;
- (void)setSharingImage:(id)a3;
- (void)setWorkout:(id)a3;
- (void)setWorkoutActivity:(id)a3;
- (void)setWorkoutFormattingManager:(id)a3;
- (void)shareTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHWorkoutDetailViewController

- (CHWorkoutDetailViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 model:(id)a6 fitnessAppContext:(id)a7 workoutFormattingManager:(id)a8 workoutDataProvider:(id)a9 badgeImageFactory:(id)a10 friendListManager:(id)a11 achievementLocalizationProvider:(id)a12 pauseRingsCoordinator:(id)a13 achievementResourceProvider:(id)a14 formattingManager:(id)a15 awardsDataProvider:(id)a16 shouldExposeDeepLinkToTrainingLoadFromEffort:(BOOL)a17
{
  id v48 = a3;
  id v47 = a4;
  id v46 = a5;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  id v40 = a11;
  id v39 = a12;
  id v38 = a13;
  id v37 = a14;
  id v36 = a15;
  id v35 = a16;
  v49.receiver = self;
  v49.super_class = (Class)CHWorkoutDetailViewController;
  v22 = [(CHWorkoutDetailViewController *)&v49 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_healthStore, a5);
    objc_storeStrong((id *)&v23->_workout, a3);
    objc_storeStrong((id *)&v23->_workoutActivity, a4);
    objc_storeStrong((id *)&v23->_model, a6);
    objc_storeStrong((id *)&v23->_fitnessAppContext, a7);
    objc_storeStrong((id *)&v23->_workoutFormattingManager, a8);
    objc_storeStrong((id *)&v23->_workoutDataProvider, a9);
    objc_storeStrong((id *)&v23->_badgeImageFactory, a10);
    objc_storeStrong((id *)&v23->_friendListManager, a11);
    objc_storeStrong((id *)&v23->_achievementLocalizationProvider, a12);
    objc_storeStrong((id *)&v23->_pauseRingsCoordinator, a13);
    objc_storeStrong((id *)&v23->_achievementResourceProvider, a14);
    objc_storeStrong((id *)&v23->_formattingManager, a15);
    objc_storeStrong((id *)&v23->_awardsDataProvider, a16);
    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v23 selector:"_workoutWasDeleted:" name:@"FitnessWorkoutWasDeletedNotification" object:0];

    v25 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = v23->_tableView;
    v23->_tableView = v25;

    v27 = +[UIColor systemBackgroundColor];
    [(UITableView *)v23->_tableView setBackgroundColor:v27];

    v28 = +[UIColor clearColor];
    [(UITableView *)v23->_tableView setSeparatorColor:v28];

    [(UITableView *)v23->_tableView setAllowsSelection:0];
    [(UITableView *)v23->_tableView _setHeaderAndFooterViewsFloat:0];
    v23->_shouldExposeDeepLinkToTrainingLoadFromEffort = a17;
    LOBYTE(v32) = a17;
    v29 = [[CHWorkoutDetailDataSource alloc] initWithTableView:v23->_tableView workout:v23->_workout workoutActivity:v23->_workoutActivity healthStore:v23->_healthStore model:v23->_model fitnessAppContext:v23->_fitnessAppContext formattingManager:v23->_workoutFormattingManager badgeImageFactory:v23->_badgeImageFactory achievementLocalizationProvider:v23->_achievementLocalizationProvider awardsDataProvider:v23->_awardsDataProvider fiuiFormattingManager:v23->_formattingManager showCurrentWorkloadButton:v32];
    dataSource = v23->_dataSource;
    v23->_dataSource = v29;

    [(CHWorkoutDetailDataSource *)v23->_dataSource setDelegate:v23];
    [(CHWorkoutDetailDataSource *)v23->_dataSource setLocationFetcherObserver:v23];
  }

  return v23;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v6 loadView];
  v3 = [(CHWorkoutDetailViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  v4 = [(CHWorkoutDetailViewController *)self view];
  [v4 addSubview:self->_tableView];

  v5 = +[CHWorkoutDetailAnalyticsTracker sharedInstance];
  [v5 startTrackingWorkout:self->_workout workoutActivity:self->_workoutActivity];
}

- (void)dealloc
{
  v3 = +[CHWorkoutDetailAnalyticsTracker sharedInstance];
  [v3 stopTrackingWorkout:self->_workout workoutActivity:self->_workoutActivity];

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v4 dealloc];
}

- (void)navigateToSection:(int64_t)a3
{
  v3 = [(CHWorkoutDetailDataSource *)self->_dataSource navigationActionForHeaderInSection:a3];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, 1);
    v3 = (void (**)(void, void))v4;
  }
}

- (void)pushViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CHWorkoutDetailViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)presentViewController:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100147DC0;
  v7[3] = &unk_1008AD668;
  id v8 = a4;
  id v6 = v8;
  [(CHWorkoutDetailViewController *)self presentViewController:a3 animated:1 completion:v7];
}

- (void)presentAchievement:(id)a3 badgeRect:(CGRect)a4 cell:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [v12 unearned] ^ 1;
  if (AAUIShouldUseNewTrophyCase())
  {
    BYTE3(v22) = 0;
    BYTE2(v22) = v13;
    LOWORD(v22) = 0;
    v14 = -[TrophyCaseAwardDetailViewController initWithAchievement:healthStore:friendListManager:achievementDataProvider:badgeImageFactory:resourceProvider:formattingManager:localizationProvider:pauseRingsCoordinator:fitnessAppContext:workoutFormattingManager:workoutDataProvider:forModalPresentation:shouldShowCelebration:shouldShowEarned:shouldShowAssociatedWorkout:]([_TtC10FitnessApp35TrophyCaseAwardDetailViewController alloc], "initWithAchievement:healthStore:friendListManager:achievementDataProvider:badgeImageFactory:resourceProvider:formattingManager:localizationProvider:pauseRingsCoordinator:fitnessAppContext:workoutFormattingManager:workoutDataProvider:forModalPresentation:shouldShowCelebration:shouldShowEarned:shouldShowAssociatedWorkout:", v12, self->_healthStore, self->_friendListManager, self->_awardsDataProvider, self->_badgeImageFactory, self->_achievementResourceProvider, self->_formattingManager, self->_achievementLocalizationProvider, self->_pauseRingsCoordinator, self->_fitnessAppContext, self->_workoutFormattingManager, self->_workoutDataProvider, v22);
  }
  else
  {
    v14 = [[CHAchievementDetailViewController alloc] initWithAchievement:v12 locProvider:self->_achievementLocalizationProvider formatsForFriend:0 forDayView:1 forModalPresentation:0 shouldShowCelebration:0];
  }
  v15 = v14;

  id v16 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v17 = [v11 insetView];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10014807C;
  v25[3] = &unk_1008ABA78;
  id v26 = v11;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100148088;
  v23[3] = &unk_1008ABA78;
  id v24 = v26;
  id v18 = v26;
  v19 = [v16 initWithPresentingViewController:self detailViewController:v15 shouldPlayFlipInAnimation:v13 initialBadgeFrame:v17 conversionView:v25 didStartAnimationBlock:x y:width height:v23];
  achievementTransitionAnimator = self->_achievementTransitionAnimator;
  self->_achievementTransitionAnimator = v19;

  v21 = [(CHWorkoutDetailViewController *)self navigationController];
  [v21 pushViewController:v15 animated:1];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (UIViewController *)a6;
  uint64_t v13 = v12;
  if (a4 != 2)
  {
    if (a4 != 1
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v14 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, a5);
    goto LABEL_9;
  }
  if (self->_transitionAnimatorFromViewController == v12)
  {
LABEL_9:
    achievementTransitionAnimator = self->_achievementTransitionAnimator;
    goto LABEL_10;
  }
  achievementTransitionAnimator = 0;
LABEL_10:
  v14 = achievementTransitionAnimator;
LABEL_11:

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)pushWorkoutActivity:(id)a3
{
  id v4 = a3;
  id v5 = [CHWorkoutDetailViewController alloc];
  LOBYTE(v7) = self->_shouldExposeDeepLinkToTrainingLoadFromEffort;
  id v8 = [(CHWorkoutDetailViewController *)v5 initWithWorkout:self->_workout workoutActivity:v4 healthStore:self->_healthStore model:self->_model fitnessAppContext:self->_fitnessAppContext workoutFormattingManager:self->_workoutFormattingManager workoutDataProvider:self->_workoutDataProvider badgeImageFactory:self->_badgeImageFactory friendListManager:self->_friendListManager achievementLocalizationProvider:self->_achievementLocalizationProvider pauseRingsCoordinator:self->_pauseRingsCoordinator achievementResourceProvider:self->_achievementResourceProvider formattingManager:self->_formattingManager awardsDataProvider:self->_awardsDataProvider shouldExposeDeepLinkToTrainingLoadFromEffort:v7];

  id v6 = [(CHWorkoutDetailViewController *)self navigationController];
  [v6 pushViewController:v8 animated:1];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v8 viewDidLoad];
  v3 = [(CHWorkoutFormattingManager *)self->_workoutFormattingManager formattedDateForWorkout:self->_workout context:@"WorkoutDetailDisplayContext"];
  id v4 = [v3 string];
  [(CHWorkoutDetailViewController *)self setTitle:v4];

  id v5 = [(CHWorkoutDetailViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareTapped:"];
  uint64_t v7 = [(CHWorkoutDetailViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(CHWorkoutDetailViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v9 viewWillAppear:a3];
  objc_super v4 = [(CHWorkoutDetailViewController *)self navigationController];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController];

  if (v5)
  {
    id v6 = [(CHWorkoutDetailViewController *)self navigationController];
    [v6 detachPalette];
  }
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"refreshWorkoutLocations" name:UIApplicationDidBecomeActiveNotification object:0];

  objc_super v8 = [(CHWorkoutDetailViewController *)self navigationController];
  [v8 setDelegate:self];

  [(CHWorkoutDetailViewController *)self annotateView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailViewController;
  [(CHWorkoutDetailViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];
}

- (void)refreshWorkoutLocations
{
}

- (void)shareTapped:(id)a3
{
  objc_super v4 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
  unsigned int v5 = [v4 isSeymourWorkout:self->_workout];

  if (v5)
  {
    [(CHWorkoutDetailViewController *)self _shareSeymourWorkout];
  }
  else
  {
    [(CHWorkoutDetailViewController *)self _shareWorkout];
  }
}

- (void)_shareWorkout
{
  workoutFormattingManager = self->_workoutFormattingManager;
  workout = self->_workout;
  unsigned int v5 = [(CHWorkoutDetailDataSource *)self->_dataSource routeImageForSharing];
  id v6 = [(CHWorkoutFormattingManager *)workoutFormattingManager shareImageForWorkout:workout routeImage:v5];

  if (v6)
  {
    [(CHWorkoutDetailViewController *)self setSharingImage:v6];
    v8[0] = v6;
    v8[1] = self;
    uint64_t v7 = +[NSArray arrayWithObjects:v8 count:2];
    [(CHWorkoutDetailViewController *)self _presentActivityViewControllerForItems:v7];
  }
}

- (void)_shareSeymourWorkout
{
  fitnessAppContext = self->_fitnessAppContext;
  workout = self->_workout;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001487C8;
  v4[3] = &unk_1008AD450;
  v4[4] = self;
  [(CHFitnessAppContext *)fitnessAppContext shareSheetActivityItemsWithWorkout:workout completion:v4];
}

- (void)_presentActivityViewControllerForItems:(id)a3
{
  id v4 = a3;
  id v11 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v4 applicationActivities:0];

  unsigned int v5 = sub_1000FCD04();
  [v11 setExcludedActivityTypes:v5];

  id v6 = [(CHWorkoutDetailViewController *)self navigationController];

  if (v6)
  {
    [(CHWorkoutDetailViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    uint64_t v7 = +[UIApplication sharedApplication];
    objc_super v8 = [v7 windows];
    objc_super v9 = [v8 firstObject];
    id v10 = [v9 rootViewController];

    [v10 presentViewController:v11 animated:1 completion:0];
  }
}

- (void)_presentConfigurationData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100148A74;
  v6[3] = &unk_1008AD690;
  id v5 = (id)objc_opt_new();
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [v5 presentRemoteViewControllerOnHostController:self workoutPlanData:v4 dismissHandler:v6 completionHandler:&stru_1008AD6B0];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1008D8AB8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = [(CHWorkoutDetailViewController *)self sharingImage];

  if (v4)
  {
    id v5 = [(HKWorkout *)self->_workout metadata];
    id v6 = [v5 objectForKeyedSubscript:HKMetadataKeyWorkoutBrandName];

    if (![v6 length])
    {
      [(HKWorkout *)self->_workout workoutActivityType];
      [(HKWorkout *)self->_workout fi_swimmingLocationType];
      id v7 = [(HKWorkout *)self->_workout metadata];
      id v8 = [v7 objectForKeyedSubscript:HKMetadataKeyIndoorWorkout];
      [v8 BOOLValue];

      uint64_t v9 = FILocalizedNameForActivityType();

      id v6 = (void *)v9;
    }
    id v10 = objc_alloc_init((Class)LPLinkMetadata);
    [v10 setTitle:v6];
    id v11 = [(CHWorkoutDetailDataSource *)self->_dataSource routeImageForSharing];

    if (v11)
    {
      id v12 = objc_alloc_init((Class)LPAppStoreStoryMetadata);
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"WORKOUT_SHARING_SUBTITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      [v12 setSubtitle:v14];

      [v10 setSpecialization:v12];
    }
    else
    {
      id v15 = objc_alloc((Class)LPImage);
      id v16 = [(CHWorkoutDetailViewController *)self sharingImage];
      id v12 = [v15 initWithPlatformImage:v16];

      id v17 = objc_alloc_init((Class)LPFileMetadata);
      [v17 setName:v6];
      [v17 setThumbnail:v12];
      [v10 setSpecialization:v17];
    }
    id v18 = objc_alloc((Class)LPImage);
    v19 = [(CHWorkoutDetailViewController *)self sharingImage];
    v20 = UIImagePNGRepresentation(v19);
    id v21 = [v18 initWithData:v20 MIMEType:@"image/png"];
    [v10 setImage:v21];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_workoutWasDeleted:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"CHDeletedWorkoutKey"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v28;
    *(void *)&long long v8 = 138543362;
    long long v24 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) UUID:v24];
        uint64_t v13 = [(HKWorkout *)self->_workout UUID];
        unsigned int v14 = [v12 isEqual:v13];

        if (v14)
        {
          _HKInitializeLogging();
          id v15 = (void *)HKLogActivity;
          if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
          {
            workout = self->_workout;
            id v17 = v15;
            id v18 = [(HKWorkout *)workout UUID];
            *(_DWORD *)buf = v24;
            uint64_t v32 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Workout %{public}@ was deleted while in workout detail view.", buf, 0xCu);
          }
          v19 = [(CHWorkoutDetailViewController *)self navigationController];
          v20 = [v19 viewControllers];

          uint64_t v21 = (uint64_t)[v20 indexOfObjectPassingTest:&stru_1008AD6F0];
          if (v21 >= 1)
          {
            uint64_t v22 = [v20 objectAtIndex:v21 - 1];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100149060;
            block[3] = &unk_1008ABB38;
            block[4] = self;
            id v26 = v22;
            id v23 = v22;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }
}

- (void)completedFetchWithLocationReadings:(id)a3
{
  id v4 = a3;
  if (+[_HKBehavior isAppleInternalInstall]
    && _os_feature_enabled_impl())
  {
    id v5 = objc_opt_new();
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareTapped:"];
    [v5 addObject:v6];
    objc_initWeak(&location, self);
    id v7 = objc_opt_new();
    long long v8 = [(HKWorkout *)self->_workout serializedConfigurationDataIncludingRoute:0];
    if (v8)
    {
      id v9 = +[UIImage _systemImageNamed:@"doc.text.magnifyingglass"];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10014997C;
      v59[3] = &unk_1008AD718;
      objc_copyWeak(&v61, &location);
      id v60 = v8;
      uint64_t v10 = +[UIAction actionWithTitle:@"Preview Configuration" image:v9 identifier:@"preview.configuration" handler:v59];
      [v7 addObject:v10];

      if (_os_feature_enabled_impl())
      {
        if ([(HKWorkout *)self->_workout serializedConfigurationContainsRoute])
        {
          id v11 = [(HKWorkout *)self->_workout serializedConfigurationDataIncludingRoute:1];
          id v43 = [(HKWorkout *)self->_workout serializedConfigurationRouteSnapshotData];
          id v41 = v11;
          if (v11 && v43)
          {
            id v12 = [objc_alloc((Class)UIImage) initWithData:v43];
            if (v12)
            {
              id v34 = v12;
              id v36 = +[UIImage _systemImageNamed:@"route"];
              id v39 = +[UIImage _systemImageNamed:@"doc.text.magnifyingglass"];
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_1001499CC;
              v56[3] = &unk_1008AD718;
              objc_copyWeak(&v58, &location);
              id v13 = v11;
              id v57 = v13;
              uint64_t v14 = +[UIAction actionWithTitle:@"Preview Configuration with Embedded Route" image:v39 identifier:@"embedded.route.preview.configuration" handler:v56];
              v64[0] = v14;
              id v37 = +[UIImage _systemImageNamed:@"square.and.arrow.up"];
              v33 = (id *)v14;
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_100149A1C;
              v52[3] = &unk_1008AD740;
              uint64_t v32 = &v55;
              objc_copyWeak(&v55, &location);
              id v53 = v34;
              id v54 = v13;
              id v15 = +[UIAction actionWithTitle:@"Share Configuration with Embedded Route" image:v37 identifier:@"embedded.route.share.configuration" handler:v52];
              v64[1] = v15;
              id v16 = +[NSArray arrayWithObjects:v64 count:2];
              id v17 = +[UIMenu menuWithTitle:@"Embedded Route" image:v36 identifier:@"menu.embedded.route" options:0 children:v16];

              [v7 addObject:v17];
              objc_destroyWeak(&v55);

              objc_destroyWeak(&v58);
              id v12 = v34;
            }
          }
        }
        id v18 = [(CHWorkoutDetailDataSource *)self->_dataSource routeImageForSharing];
        v19 = v18;
        if (v18)
        {
          workout = self->_workout;
          uint64_t v21 = UIImagePNGRepresentation(v18);
          id v44 = [(HKWorkout *)workout serializedConfigurationWithEmbedding:v4 snapshot:v21];

          if (v44)
          {
            id v38 = +[UIImage _systemImageNamed:@"location.circle"];
            id v42 = +[UIImage _systemImageNamed:@"doc.text.magnifyingglass"];
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_100149A74;
            v49[3] = &unk_1008AD718;
            objc_copyWeak(&v51, &location);
            id v22 = v44;
            id v50 = v22;
            uint64_t v23 = +[UIAction actionWithTitle:@"Preview Configuration with Completed Route" image:v42 identifier:@"completed.route.preview.configuration" handler:v49];
            v63[0] = v23;
            id v40 = +[UIImage _systemImageNamed:@"square.and.arrow.up"];
            id v35 = (id)v23;
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_100149AC4;
            v45[3] = &unk_1008AD740;
            objc_copyWeak(&v48, &location);
            id v46 = v19;
            id v47 = v22;
            long long v24 = +[UIAction actionWithTitle:@"Share Configuration with Completed Route" image:v40 identifier:@"completed.route.share.configuration" handler:v45];
            v63[1] = v24;
            v25 = +[NSArray arrayWithObjects:v63 count:2];
            id v26 = +[UIMenu menuWithTitle:@"Completed Route" image:v38 identifier:@"menu.completed.route" options:0 children:v25];

            [v7 addObject:v26];
            objc_destroyWeak(&v48);

            objc_destroyWeak(&v51);
          }
        }
      }

      objc_destroyWeak(&v61);
    }
    if ([v7 count])
    {
      long long v27 = +[UIMenu menuWithTitle:@"[Internal Only] Debug Options" children:v7];
      id v28 = objc_alloc((Class)UIBarButtonItem);
      long long v29 = +[UIImage systemImageNamed:@"ellipsis.circle"];
      id v30 = [v28 initWithImage:v29 menu:v27];

      [v5 addObject:v30];
    }
    v31 = [(CHWorkoutDetailViewController *)self navigationItem];
    [v31 setRightBarButtonItems:v5];

    objc_destroyWeak(&location);
  }
}

- (void)_presentShareSheetWithTitle:(id)a3 image:(id)a4 workoutData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSTemporaryDirectory();
  id v12 = +[NSURL fileURLWithPath:v11 isDirectory:1];

  id v13 = [v12 URLByAppendingPathComponent:@"Workout.workout"];
  LODWORD(v11) = [v10 writeToURL:v13 atomically:1];

  if (v11)
  {
    id v14 = objc_alloc((Class)UIActivityViewController);
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v13;
    id v15 = +[NSArray arrayWithObjects:v22 count:3];
    id v16 = [v14 initWithActivityItems:v15 applicationActivities:0];

    id v17 = [(CHWorkoutDetailViewController *)self navigationController];

    if (v17)
    {
      [(CHWorkoutDetailViewController *)self presentViewController:v16 animated:1 completion:0];
    }
    else
    {
      id v18 = +[UIApplication sharedApplication];
      v19 = [v18 windows];
      v20 = [v19 firstObject];
      uint64_t v21 = [v20 rootViewController];

      [v21 presentViewController:v16 animated:1 completion:0];
    }
  }
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (void)setWorkoutActivity:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return self->_workoutFormattingManager;
}

- (void)setWorkoutFormattingManager:(id)a3
{
}

- (UIImage)sharingImage
{
  return self->_sharingImage;
}

- (void)setSharingImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, 0);
  objc_storeStrong((id *)&self->_achievementTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_achievementResourceProvider, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)annotateView
{
  v2 = self;
  sub_1002C1920();
}

@end