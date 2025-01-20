@interface CHWorkoutsListViewController
- (CHWorkoutsListViewController)initWithDataProvider:(id)a3 healthStore:(id)a4 model:(id)a5 fitnessAppContext:(id)a6 workoutFormattingManager:(id)a7 workoutDataProvider:(id)a8 badgeImageFactory:(id)a9 friendListManager:(id)a10 achievementLocalizationProvider:(id)a11 pauseRingsCoordinator:(id)a12 achievementResourceProvider:(id)a13 formattingManager:(id)a14 awardsDataProvider:(id)a15;
- (CHWorkoutsListViewControllerDelegate)delegate;
- (id)_dateStringForComponents:(id)a3;
- (id)_filterMenu;
- (id)detailViewControllerForWorkout:(id)a3;
- (void)_addDataProviderUpdateHandlers;
- (void)_popViewControllerIfNeeded;
- (void)_presentDetailViewForWorkout:(id)a3;
- (void)_setupDataSource;
- (void)_setupTableView;
- (void)_stopActivityIndicator;
- (void)_updateFilterButtonTitleForWorkoutTypeKey:(id)a3;
- (void)_updateFiltersList;
- (void)loadView;
- (void)scrollToWorkoutAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)workoutsListDataSource:(id)a3 didEncounterReloadingException:(id)a4;
- (void)workoutsListDataSource:(id)a3 didScrollToSectionWithDateComponents:(id)a4;
- (void)workoutsListDataSource:(id)a3 didSelectWorkout:(id)a4 atIndexPath:(id)a5;
- (void)workoutsListDataSource:(id)a3 requestsDeleteConfirmationForWorkout:(id)a4 completion:(id)a5;
@end

@implementation CHWorkoutsListViewController

- (CHWorkoutsListViewController)initWithDataProvider:(id)a3 healthStore:(id)a4 model:(id)a5 fitnessAppContext:(id)a6 workoutFormattingManager:(id)a7 workoutDataProvider:(id)a8 badgeImageFactory:(id)a9 friendListManager:(id)a10 achievementLocalizationProvider:(id)a11 pauseRingsCoordinator:(id)a12 achievementResourceProvider:(id)a13 formattingManager:(id)a14 awardsDataProvider:(id)a15
{
  id v42 = a3;
  id v41 = a4;
  id v31 = a5;
  id v40 = a5;
  id v33 = a6;
  id v20 = a6;
  id v21 = a7;
  id v39 = v20;
  id v38 = a7;
  id v32 = a8;
  id v37 = a8;
  id v36 = a9;
  id v35 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  v43.receiver = self;
  v43.super_class = (Class)CHWorkoutsListViewController;
  v27 = [(CHWorkoutsListViewController *)&v43 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_dataProvider, a3);
    objc_storeStrong((id *)&v28->_healthStore, a4);
    objc_storeStrong((id *)&v28->_model, v31);
    objc_storeStrong((id *)&v28->_workoutDataProvider, v32);
    objc_storeStrong((id *)&v28->_workoutFormattingManager, v21);
    objc_storeStrong((id *)&v28->_fitnessAppContext, v33);
    objc_storeStrong((id *)&v28->_formattingManager, a14);
    objc_storeStrong((id *)&v28->_badgeImageFactory, a9);
    objc_storeStrong((id *)&v28->_friendListManager, a10);
    objc_storeStrong((id *)&v28->_achievementLocalizationProvider, a11);
    objc_storeStrong((id *)&v28->_pauseRingsCoordinator, a12);
    objc_storeStrong((id *)&v28->_achievementResourceProvider, a13);
    objc_storeStrong((id *)&v28->_awardsDataProvider, a15);
  }

  return v28;
}

- (void)_setupTableView
{
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(CHWorkoutsListViewController *)self view];
  [v4 bounds];
  v5 = [v3 initWithFrame:0 style:];
  tableView = self->_tableView;
  self->_tableView = v5;

  v7 = +[UIColor systemBackgroundColor];
  [(UITableView *)self->_tableView setBackgroundColor:v7];

  v8 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setSeparatorColor:v8];

  [(UITableView *)self->_tableView _setDrawsSeparatorAtTopOfSections:1];
  [(UITableView *)self->_tableView setSectionHeaderTopPadding:0.0];
  [(UITableView *)self->_tableView setTableHeaderViewShouldAutoHide:0];
  [(UITableView *)self->_tableView _setHeaderAndFooterViewsFloat:1];
  id v9 = [(CHWorkoutsListViewController *)self view];
  [v9 addSubview:self->_tableView];
}

- (id)_filterMenu
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  workoutTypeIDs = self->_workoutTypeIDs;
  v5 = [(CHWorkoutDataProvider *)self->_dataProvider currentFilteredTypeIdentifier];
  id v6 = [(NSArray *)workoutTypeIDs indexOfObject:v5];

  workoutTypeNames = self->_workoutTypeNames;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100170F30;
  v12[3] = &unk_1008AE1B8;
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    v8 = 0;
  }
  else {
    v8 = v6;
  }
  v14[1] = v8;
  v12[4] = self;
  objc_copyWeak(v14, &location);
  id v9 = v3;
  id v13 = v9;
  [(NSArray *)workoutTypeNames enumerateObjectsUsingBlock:v12];
  v10 = +[UIMenu menuWithChildren:v9];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_addDataProviderUpdateHandlers
{
  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100171330;
  v10[3] = &unk_1008AB8D8;
  objc_copyWeak(&v11, &location);
  [(CHWorkoutDataProvider *)dataProvider addUpdateHandler:v10];
  v4 = self->_dataProvider;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001713A4;
  v8[3] = &unk_1008AB8D8;
  objc_copyWeak(&v9, &location);
  [(CHWorkoutDataProvider *)v4 addAnimatedUpdateHandler:v8];
  v5 = self->_dataProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100171404;
  v6[3] = &unk_1008AB8D8;
  objc_copyWeak(&v7, &location);
  [(CHWorkoutDataProvider *)v5 addFilterActionFinishedHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_popViewControllerIfNeeded
{
  if (![(CHWorkoutDataProvider *)self->_dataProvider hasWorkouts])
  {
    _HKInitializeLogging();
    id v3 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Data provider doesn't have any workouts; popping view controller",
        v6,
        2u);
    }
    v4 = [(CHWorkoutsListViewController *)self navigationController];
    id v5 = [v4 popViewControllerAnimated:1];
  }
}

- (void)_setupDataSource
{
  id v3 = [[CHWorkoutsListDataSource alloc] initWithTableView:self->_tableView dataProvider:self->_dataProvider fitnessAppContext:self->_fitnessAppContext formattingManager:self->_workoutFormattingManager badgeImageFactory:self->_badgeImageFactory awardsDataProvider:self->_awardsDataProvider];
  dataSource = self->_dataSource;
  self->_dataSource = v3;

  id v5 = [(CHWorkoutsListViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  id v7 = [v6 _backdropViewLayerGroupName];
  [(CHWorkoutsListDataSource *)self->_dataSource setNavBarBackdropGroupName:v7];

  v8 = self->_dataSource;

  [(CHWorkoutsListDataSource *)v8 setDelegate:self];
}

- (void)_stopActivityIndicator
{
}

- (void)scrollToWorkoutAtIndexPath:(id)a3 animated:(BOOL)a4
{
}

- (void)_updateFiltersList
{
  id v3 = +[CHWorkoutTypeKey emptyKey];
  v44 = v3;
  v4 = +[NSArray arrayWithObjects:&v44 count:1];
  id v5 = [(CHWorkoutDataProvider *)self->_dataProvider sortedTypeIdentifiers];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  workoutTypeIDs = self->_workoutTypeIDs;
  self->_workoutTypeIDs = v6;

  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = self->_workoutTypeIDs;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[CHWorkoutDataProvider localizedNameForWorkoutTypeKey:](CHWorkoutDataProvider, "localizedNameForWorkoutTypeKey:", *(void *)(*((void *)&v39 + 1) + 8 * (void)v13), (void)v39);
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v11);
  }

  v15 = (NSArray *)[v8 copy];
  workoutTypeNames = self->_workoutTypeNames;
  self->_workoutTypeNames = v15;

  v17 = [(CHWorkoutsListViewController *)self _filterMenu];
  v18 = [(CHWorkoutsListViewController *)self navigationItem];
  v19 = [v18 rightBarButtonItem];
  [v19 setMenu:v17];

  id v20 = [(CHWorkoutDataProvider *)self->_dataProvider currentFilteredTypeIdentifier];
  [(CHWorkoutsListViewController *)self _updateFilterButtonTitleForWorkoutTypeKey:v20];

  id v21 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
  id v22 = [v21 count];

  id v23 = [(CHWorkoutsListViewController *)self navigationController];
  id v24 = [v23 navigationBar];
  id v25 = v24;
  if (v22)
  {
    [v24 setUserInteractionEnabled:1];

    id v26 = +[UIApplication sharedApplication];
    v27 = [v26 windows];
    v28 = [v27 firstObject];
    v29 = [v28 tintColor];
    v30 = [(CHWorkoutsListViewController *)self navigationController];
    id v31 = [v30 navigationBar];
    [v31 setTintColor:v29];

    id v32 = [(CHWorkoutsListViewController *)self navigationController];
    id v33 = [v32 interactivePopGestureRecognizer];
    v34 = v33;
    uint64_t v35 = 1;
  }
  else
  {
    [v24 setUserInteractionEnabled:0];

    id v36 = +[UIColor darkGrayColor];
    id v37 = [(CHWorkoutsListViewController *)self navigationController];
    id v38 = [v37 navigationBar];
    [v38 setTintColor:v36];

    id v32 = [(CHWorkoutsListViewController *)self navigationController];
    id v33 = [v32 interactivePopGestureRecognizer];
    v34 = v33;
    uint64_t v35 = 0;
  }
  [v33 setEnabled:v35, (void)v39];
}

- (void)_updateFilterButtonTitleForWorkoutTypeKey:(id)a3
{
  id v6 = +[CHWorkoutDataProvider localizedShortNameForWorkoutTypeKey:a3];
  v4 = [(CHWorkoutsListViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setTitle:v6];
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)CHWorkoutsListViewController;
  [(CHWorkoutsListViewController *)&v19 loadView];
  id v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"WORKOUTS" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHWorkoutsListViewController *)self setTitle:v4];

  id v5 = [(CHWorkoutsListViewController *)self _filterMenu];
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:0 menu:v5];
  id v7 = [(CHWorkoutsListViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  [(CHWorkoutsListViewController *)self _updateFiltersList];
  [(CHWorkoutsListViewController *)self _setupTableView];
  id v8 = [(CHWorkoutsListViewController *)self _filterMenu];
  [(CHWorkoutsListViewController *)self _addDataProviderUpdateHandlers];
  [(CHWorkoutsListViewController *)self _setupDataSource];
  id v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(UIActivityIndicatorView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)v9 setHidesWhenStopped:1];
  id v10 = [(CHWorkoutsListViewController *)self view];
  [v10 addSubview:v9];

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;
  uint64_t v12 = v9;

  id v13 = [(CHWorkoutsListViewController *)self view];
  v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];

  v15 = [(CHWorkoutsListViewController *)self view];
  v16 = +[NSLayoutConstraint constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v15 attribute:10 multiplier:1.0 constant:0.0];

  v17 = [(CHWorkoutsListViewController *)self view];
  v20[0] = v14;
  v20[1] = v16;
  v18 = +[NSArray arrayWithObjects:v20 count:2];

  [v17 addConstraints:v18];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutsListViewController;
  [(CHWorkoutsListViewController *)&v3 viewDidLoad];
  if (![(CHWorkoutDataProvider *)self->_dataProvider dataAvailable]) {
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  [(CHWorkoutsListViewController *)&v4 viewWillAppear:a3];
  if ([(CHWorkoutDataProvider *)self->_dataProvider dataAvailable]) {
    [(CHWorkoutsListViewController *)self _updateFiltersList];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  [(CHWorkoutsListViewController *)&v4 viewWillDisappear:a3];
  [(UITableView *)self->_tableView setEditing:0 animated:1];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  [(CHWorkoutsListViewController *)&v4 viewWillLayoutSubviews];
  objc_super v3 = [(CHWorkoutsListViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (void)_presentDetailViewForWorkout:(id)a3
{
  id v4 = a3;
  id v5 = [(CHWorkoutsListViewController *)self detailViewControllerForWorkout:v4];
  _HKInitializeLogging();
  id v6 = (void *)HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 startDate];
    id v9 = [v4 fiui_activityType];
    id v10 = [v9 localizedName];
    id v11 = [v4 UUID];
    int v13 = 138412802;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WLVC] Selected workout: %@, %@ %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v12 = [(CHWorkoutsListViewController *)self navigationController];
  [v12 pushViewController:v5 animated:1];
}

- (id)_dateStringForComponents:(id)a3
{
  uint64_t v3 = qword_10096B658;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10096B658, &stru_1008AE1D8);
  }
  id v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 dateFromComponents:v4];

  id v7 = [(id)qword_10096B650 stringFromDate:v6];

  return v7;
}

- (void)workoutsListDataSource:(id)a3 didSelectWorkout:(id)a4 atIndexPath:(id)a5
{
}

- (void)workoutsListDataSource:(id)a3 requestsDeleteConfirmationForWorkout:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = [a4 _activityMoveMode];
  id v8 = +[NSBundle mainBundle];
  id v9 = v8;
  if (v7 == (id)2)
  {
    CFStringRef v10 = @"Localizable-tinker";
    id v11 = [v8 localizedStringForKey:@"DELETE_WORKOUT_ALERT_TITLE_TINKER" value:&stru_1008D8AB8 table:@"Localizable-tinker"];

    uint64_t v12 = +[NSBundle mainBundle];
    int v13 = v12;
    CFStringRef v14 = @"DELETE_WORKOUT_ALERT_DESCRIPTION_TINKER";
  }
  else
  {
    CFStringRef v10 = @"Localizable";
    id v11 = [v8 localizedStringForKey:@"DELETE_WORKOUT_ALERT_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

    uint64_t v12 = +[NSBundle mainBundle];
    int v13 = v12;
    CFStringRef v14 = @"DELETE_WORKOUT_ALERT_DESCRIPTION";
  }
  __int16 v15 = [v12 localizedStringForKey:v14 value:&stru_1008D8AB8 table:v10];

  v16 = +[UIAlertController alertControllerWithTitle:v11 message:v15 preferredStyle:1];
  __int16 v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"DELETE_WORKOUT_ALERT_CANCEL" value:&stru_1008D8AB8 table:@"Localizable"];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1001724E4;
  v36[3] = &unk_1008AD850;
  id v19 = v6;
  id v37 = v19;
  id v20 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v36];
  [v16 addAction:v20];

  id v21 = +[NSBundle mainBundle];
  id v22 = v21;
  if (v7 == (id)2)
  {
    CFStringRef v23 = @"DELETE_WORKOUT_ALERT_YES_TINKER";
    CFStringRef v24 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v23 = @"DELETE_WORKOUT_ALERT_YES";
    CFStringRef v24 = @"Localizable";
  }
  id v25 = [v21 localizedStringForKey:v23 value:&stru_1008D8AB8 table:v24];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1001724FC;
  v34[3] = &unk_1008AD850;
  id v26 = v19;
  id v35 = v26;
  v27 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v34];
  [v16 addAction:v27];

  if (v7 != (id)2)
  {
    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"DELETE_WORKOUT_ALERT_WORKOUT_ONLY" value:&stru_1008D8AB8 table:@"Localizable"];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100172514;
    v32[3] = &unk_1008AD850;
    id v33 = v26;
    v30 = +[UIAlertAction actionWithTitle:v29 style:0 handler:v32];
    [v16 addAction:v30];
  }
  [(CHWorkoutsListViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)workoutsListDataSource:(id)a3 didScrollToSectionWithDateComponents:(id)a4
{
  id v5 = a4;
  id v6 = [(CHWorkoutsListViewController *)self delegate];
  [v6 workoutsListViewController:self didScrollToDateComponents:v5];
}

- (void)workoutsListDataSource:(id)a3 didEncounterReloadingException:(id)a4
{
  [(UITableView *)self->_tableView removeFromSuperview];
  [(CHWorkoutsListViewController *)self _setupTableView];
  [(CHWorkoutsListViewController *)self _setupDataSource];
  id v5 = [(CHWorkoutsListViewController *)self view];
  [v5 layoutIfNeeded];
}

- (id)detailViewControllerForWorkout:(id)a3
{
  id v4 = a3;
  LOBYTE(v7) = 1;
  id v5 = [[CHWorkoutDetailViewController alloc] initWithWorkout:v4 workoutActivity:0 healthStore:self->_healthStore model:self->_model fitnessAppContext:self->_fitnessAppContext workoutFormattingManager:self->_workoutFormattingManager workoutDataProvider:self->_workoutDataProvider badgeImageFactory:self->_badgeImageFactory friendListManager:self->_friendListManager achievementLocalizationProvider:self->_achievementLocalizationProvider pauseRingsCoordinator:self->_pauseRingsCoordinator achievementResourceProvider:self->_achievementResourceProvider formattingManager:self->_formattingManager awardsDataProvider:self->_awardsDataProvider shouldExposeDeepLinkToTrainingLoadFromEffort:v7];

  return v5;
}

- (CHWorkoutsListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHWorkoutsListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementResourceProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_workoutTypeNames, 0);
  objc_storeStrong((id *)&self->_workoutTypeIDs, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end