@interface MTATimerCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)remainInMultipleTimerMode;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)singleTimerSectionSize;
- (MTATimerAddViewController)addEditTimerController;
- (MTATimerCollectionViewController)initWithTimerManager:(id)a3 dataSource:(id)a4;
- (MTATimerViewController)singleTimerVC;
- (MTSound)sound;
- (MTTimerDataSource)dataSource;
- (MTTimerManager)timerManager;
- (NSMutableArray)sections;
- (NSString)currentTitle;
- (NSUserActivity)userActivity;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC11MobileTimer18SiriTipsController)siriTipsController;
- (_UIContentUnavailableView)noItemsView;
- (double)cellHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentTone;
- (id)defaultEditLabel;
- (id)deferredAddingTimer;
- (id)singleTimerCell;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3;
- (void)_handleNumberOfItemsDidChange;
- (void)_presentAddEditForTimer:(id)a3 isNewTimer:(BOOL)a4;
- (void)_reloadUI:(id)a3;
- (void)_removeTimer:(id)a3;
- (void)addTimer:(id)a3;
- (void)cancelTimer:(id)a3;
- (void)cancelTimerForCell:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)confirmPickingSound;
- (void)dataSourceDidReload:(id)a3;
- (void)dataSourceDidReloadAllDurations:(id)a3;
- (void)dataSourceDidReloadRecentDurations:(id)a3;
- (void)dealloc;
- (void)deleteRecentSection;
- (void)deleteRecentTimerForCell:(id)a3;
- (void)didCancelTimerWithSender:(id)a3;
- (void)didReceiveStartTimerShortcutAction;
- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6;
- (void)dismissAddViewController:(id)a3;
- (void)dismissSoundPicker;
- (void)handleContentSizeChange:(id)a3;
- (void)handleOrientationChange;
- (void)pauseResumeTimer:(id)a3;
- (void)pauseResumeTimerForCell:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4;
- (void)prepareUIForState:(unint64_t)a3 inCell:(id)a4 forceRefresh:(BOOL)a5;
- (void)reloadSections;
- (void)reloadState;
- (void)reloadState:(id)a3;
- (void)setAddEditTimerController:(id)a3;
- (void)setCurrentTitle:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDeferredAddingTimer:(id)a3;
- (void)setNoItemsView:(id)a3;
- (void)setRemainInMultipleTimerMode:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSingleTimerVC:(id)a3;
- (void)setSiriTipsController:(id)a3;
- (void)setSound:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)setupAddButton;
- (void)showAddTimerViewWithTimer:(id)a3;
- (void)showAddView;
- (void)showAddViewForTimer:(id)a3;
- (void)showAddViewWithCompletion:(id)a3;
- (void)showSoundPicker:(id)a3;
- (void)startRecentTimerForCell:(id)a3;
- (void)startTimer:(id)a3;
- (void)startTimerForCell:(id)a3 withDuration:(double)a4;
- (void)startUpdatingSingleTimerUI;
- (void)startUpdatingTimerUI;
- (void)stopUpdatingTimerUI;
- (void)timerAddEditControllerDidCancel:(id)a3 reload:(BOOL)a4;
- (void)timerTick:(id)a3;
- (void)tipViewControllerDidBecomeAvailableWithSiriTipsController:(id)a3 tipView:(id)a4;
- (void)tipViewControllerWasInvalidatedWithSiriTipsController:(id)a3;
- (void)updateAddButton;
- (void)updateLatestDuration;
- (void)updateSelectedTone;
- (void)updateSelectedToneForCell:(id)a3;
- (void)updateStateAndReloadData;
- (void)updateTimerTick:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTATimerCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTATimerCollectionViewController)initWithTimerManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v20.receiver = self;
  v20.super_class = (Class)MTATimerCollectionViewController;
  v9 = [(MTATimerCollectionViewController *)&v20 initWithCollectionViewLayout:v8];

  if (v9)
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"TIMERS" value:&stru_1000A2560 table:0];
    [(MTATimerCollectionViewController *)v9 setTitle:v11];

    [(MTATimerCollectionViewController *)v9 setEdgesForExtendedLayout:4];
    v12 = +[UIImage systemImageNamed:@"timer"];
    v13 = [(MTATimerCollectionViewController *)v9 tabBarItem];
    [v13 setImage:v12];

    [(MTATimerCollectionViewController *)v9 setTimerManager:v6];
    [(MTATimerCollectionViewController *)v9 setDataSource:v7];
    v14 = [(MTATimerCollectionViewController *)v9 dataSource];
    [v14 registerObserver:v9];

    v15 = objc_opt_new();
    [(MTATimerCollectionViewController *)v9 setSections:v15];

    v16 = [(MTATimerCollectionViewController *)v9 title];
    uint64_t v17 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.timer" title:v16];
    userActivity = v9->_userActivity;
    v9->_userActivity = (NSUserActivity *)v17;

    v9->_cellHeight = -1.0;
  }

  return v9;
}

- (void)dealloc
{
  [(NSTimer *)self->_updateTimer invalidate];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTATimerCollectionViewController;
  [(MTATimerCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)MTATimerCollectionViewController;
  [(MTATimerCollectionViewController *)&v17 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"NO_TIMERS" value:&stru_1000A2560 table:0];

  [(MTATimerCollectionViewController *)self reloadState];
  v5 = +[UIColor mtui_backgroundColor];
  id v6 = [(MTATimerCollectionViewController *)self collectionView];
  [v6 setBackgroundColor:v5];

  id v7 = [(MTATimerCollectionViewController *)self collectionView];
  [v7 setAllowsSelectionDuringEditing:1];

  id v8 = [(MTATimerCollectionViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMTATimerActiveCollectionIdentifier"];

  v9 = [(MTATimerCollectionViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMTASingleTimerCellIdentifierNew"];

  v10 = [(MTATimerCollectionViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMTASingleTimerCellIdentifierActive"];

  v11 = [(MTATimerCollectionViewController *)self collectionView];
  [v11 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMTATimerRecentCollectionIdentifier"];

  v12 = [(MTATimerCollectionViewController *)self collectionView];
  [v12 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kMTATimerCollectionHeaderIdentifier"];

  v13 = [(MTATimerCollectionViewController *)self collectionView];
  [v13 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMTATimerTipCollectionViewCellIdentifier"];

  v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"handleContentSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"handleEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"handleOrientationChange" name:UIDeviceOrientationDidChangeNotification object:0];

  +[MTAUtilities updateTimerAppShortcuts];
}

- (void)updateAddButton
{
  if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    [(MTATimerCollectionViewController *)self setupAddButton];
  }
  else
  {
    id v3 = [(MTATimerCollectionViewController *)self navigationItem];
    [v3 setRightBarButtonItem:0];
  }
}

- (void)setupAddButton
{
  id v3 = [(MTATimerCollectionViewController *)self navigationItem];
  objc_super v4 = [v3 rightBarButtonItem];

  if (!v4)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addTimer:"];
    v5 = [(MTATimerCollectionViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
}

- (void)reloadSections
{
  id v3 = [(MTATimerCollectionViewController *)self sections];
  [v3 removeAllObjects];

  if (self->_siriTipView)
  {
    objc_super v4 = [(MTATimerCollectionViewController *)self sections];
    [v4 addObject:&off_1000A4F88];
  }
  if ((unint64_t)[(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] > 1
    || self->_remainInMultipleTimerMode)
  {
    if ((unint64_t)[(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] <= 1
      && ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] != (id)1
       || !self->_remainInMultipleTimerMode))
    {
      goto LABEL_11;
    }
    v5 = [(MTATimerCollectionViewController *)self sections];
    id v6 = v5;
    id v7 = &off_1000A4FB8;
  }
  else
  {
    v5 = [(MTATimerCollectionViewController *)self sections];
    id v6 = v5;
    id v7 = &off_1000A4FA0;
  }
  [v5 addObject:v7];

LABEL_11:
  if (![(MTTimerDataSource *)self->_dataSource numberOfActiveTimers]
    || (unint64_t)[(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] > 1
    || self->_remainInMultipleTimerMode)
  {
    id v8 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = [(MTATimerCollectionViewController *)self sections];
      [v10 addObject:&off_1000A4FD0];
    }
  }
}

- (void)handleContentSizeChange:(id)a3
{
  self->_cellHeight = -1.0;
  id v6 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v6)
  {
    objc_super v4 = [v6 controlsView];
    [v4 handleContentSizeChange];
  }
  v5 = [(MTATimerCollectionViewController *)self collectionViewLayout];
  [v5 invalidateLayout];
}

- (void)handleOrientationChange
{
  v2 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v2)
  {
    id v4 = v2;
    id v3 = [v2 controlsView];
    [v3 handleContentSizeChange];

    v2 = v4;
  }
}

- (double)cellHeight
{
  double result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTATimerBaseCollectionViewCell cellHeight];
    self->_cellHeight = result;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerCollectionViewController;
  [(MTATimerCollectionViewController *)&v6 viewWillAppear:a3];
  [(MTATimerCollectionViewController *)self reloadState];
  [(MTATimerCollectionViewController *)self startUpdatingTimerUI];
  id v4 = [(MTATimerCollectionViewController *)self siriTipsController];
  [v4 setDelegate:self];

  v5 = [(MTATimerCollectionViewController *)self siriTipsController];
  [v5 checkForSiriTips];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerCollectionViewController;
  [(MTATimerCollectionViewController *)&v7 viewDidAppear:a3];
  id v4 = [(MTATimerCollectionViewController *)self userActivity];
  [v4 becomeCurrent];

  v5 = [(MTATimerCollectionViewController *)self deferredAddingTimer];

  if (v5)
  {
    objc_super v6 = [(MTATimerCollectionViewController *)self deferredAddingTimer];
    v6[2]();

    [(MTATimerCollectionViewController *)self setDeferredAddingTimer:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
  [(NSUserActivity *)self->_userActivity resignCurrent];
  v5 = [(MTATimerCollectionViewController *)self siriTipsController];
  [v5 setDelegate:0];

  objc_super v6 = [(MTATimerCollectionViewController *)self siriTipsController];
  [v6 cancel];

  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerCollectionViewController;
  [(MTATimerCollectionViewController *)&v8 viewWillDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTATimerCollectionViewController;
  id v7 = a4;
  -[MTATimerCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054D70;
  v8[3] = &unk_1000A1400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)_removeTimer:(id)a3
{
  id v4 = a3;
  v5 = [(MTATimerCollectionViewController *)self dataSource];
  objc_super v6 = [v5 removeTimer:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054E88;
  v8[3] = &unk_1000A20B0;
  v8[4] = self;
  id v7 = [v6 addSuccessBlock:v8];
}

- (void)startUpdatingTimerUI
{
  if (self->_updateTimer) {
    [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
  }
  BOOL v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update timer collection UI", v9, 2u);
  }

  id v4 = objc_alloc((Class)NSTimer);
  v5 = +[NSDate date];
  objc_super v6 = (NSTimer *)[v4 initWithFireDate:v5 interval:self target:"updateTimerTick:" selector:0 userInfo:1 repeats:0.25];
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;

  objc_super v8 = +[NSRunLoop currentRunLoop];
  [v8 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];
}

- (void)startUpdatingSingleTimerUI
{
  if (self->_updateTimer) {
    [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
  }
  BOOL v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update timer collection UI", v9, 2u);
  }

  id v4 = objc_alloc((Class)NSTimer);
  v5 = +[NSDate date];
  objc_super v6 = (NSTimer *)[v4 initWithFireDate:v5 interval:self target:"timerTick:" selector:0 userInfo:1 repeats:0.25];
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;

  objc_super v8 = +[NSRunLoop currentRunLoop];
  [v8 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopUpdatingTimerUI
{
  BOOL v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating timer collection UI updating NSTimer", v5, 2u);
  }

  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void)updateTimerTick:(id)a3
{
  id v4 = [(MTATimerCollectionViewController *)self collectionView];
  v5 = [v4 indexPathsForVisibleItems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v11, "section", (void)v21));
        id v13 = [v12 integerValue];

        if (v13 == (id)1)
        {
          id v14 = [v11 row];
          v15 = [(MTATimerCollectionViewController *)self dataSource];
          id v16 = [v15 numberOfActiveTimers];

          if (v14 < v16)
          {
            objc_super v17 = [(MTATimerCollectionViewController *)self dataSource];
            v18 = [v17 activeTimerAtRow:[v11 row]];

            if ([v18 state] == (id)3)
            {
              v19 = [(MTATimerCollectionViewController *)self collectionView];
              objc_super v20 = [v19 cellForItemAtIndexPath:v11];

              [v20 refreshUI:v18 animated:1];
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)reloadState
{
}

- (void)reloadState:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading collection view", buf, 2u);
  }

  id v6 = [(MTTimerDataSource *)self->_dataSource reloadTimers];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100055468;
  v12 = &unk_1000A20D8;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = [v6 addCompletionBlock:&v9];

  [(MTTimerDataSource *)self->_dataSource reloadTimerDurations];
}

- (void)_reloadUI:(id)a3
{
  id v5 = a3;
  [(MTATimerCollectionViewController *)self _handleNumberOfItemsDidChange];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)dataSourceDidReload:(id)a3
{
  [(MTATimerCollectionViewController *)self _reloadUI:0];
  [(MTATimerCollectionViewController *)self updateStateAndReloadData];
  if ((unint64_t)[(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] > 1
    || self->_remainInMultipleTimerMode
    && [(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] == (id)1)
  {
    [(MTATimerCollectionViewController *)self startUpdatingTimerUI];
  }
  else if (![(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
  }
}

- (void)updateStateAndReloadData
{
  if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    if ((unint64_t)[(MTTimerDataSource *)self->_dataSource numberOfActiveTimers] < 2) {
      goto LABEL_6;
    }
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  self->_remainInMultipleTimerMode = v3;
LABEL_6:
  [(MTATimerCollectionViewController *)self reloadSections];
  [(MTATimerCollectionViewController *)self updateAddButton];
  id v4 = [(MTATimerCollectionViewController *)self collectionView];
  [v4 reloadData];
}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ dataSourceDidReloadRecentDurations reloading table", (uint8_t *)&v6, 0xCu);
  }

  [(MTATimerCollectionViewController *)self reloadSections];
  id v5 = [(MTATimerCollectionViewController *)self collectionView];
  [v5 reloadData];
}

- (void)dataSourceDidReloadAllDurations:(id)a3
{
}

- (void)updateLatestDuration
{
  BOOL v3 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 controlsView];
    id v5 = [(MTATimerCollectionViewController *)self dataSource];
    int v6 = [v5 getLatestDuration];
    [v6 duration];
    [v4 setCountDownDuration:];

    id v7 = [(MTATimerCollectionViewController *)self currentTone];
    [(MTATimerCollectionViewController *)self setSound:v7];

    [(MTATimerCollectionViewController *)self updateSelectedTone];
    BOOL v3 = v8;
  }
}

- (void)updateSelectedTone
{
  uint64_t v3 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v3) {
    [(MTATimerCollectionViewController *)self updateSelectedToneForCell:v3];
  }

  _objc_release_x1();
}

- (void)updateSelectedToneForCell:(id)a3
{
  id v13 = a3;
  id v4 = [(MTATimerCollectionViewController *)self currentTone];
  id v5 = [v4 toneIdentifier];

  int v6 = [(MTATimerCollectionViewController *)self sound];
  LODWORD(v4) = [v6 interruptAudio];

  if (v4)
  {
    id v7 = [v13 controlsView];
    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    uint64_t v10 = v7;
    v11 = v9;
  }
  else
  {
    id v7 = +[TLToneManager sharedToneManager];
    if (([v7 toneWithIdentifierIsValid:v5] & 1) == 0)
    {
      uint64_t v12 = [v7 defaultToneIdentifierForAlertType:13];

      id v5 = (void *)v12;
    }
    id v8 = [v7 nameForToneIdentifier:v5];
    uint64_t v10 = [v13 controlsView];
    uint64_t v9 = v10;
    v11 = v8;
  }
  [v10 setTimerToneName:v11];
}

- (id)singleTimerCell
{
  uint64_t v3 = [(MTATimerCollectionViewController *)self sections];
  id v4 = [v3 indexOfObject:&off_1000A4FA0];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    int v6 = [(MTATimerCollectionViewController *)self collectionView];
    id v7 = +[NSIndexPath indexPathForRow:0 inSection:v4];
    id v5 = [v6 cellForItemAtIndexPath:v7];
  }

  return v5;
}

- (void)_handleNumberOfItemsDidChange
{
  uint64_t v3 = [(MTATimerCollectionViewController *)self dataSource];
  id v4 = [v3 numberOfActiveTimers];

  if (!v4)
  {
    [(MTATimerCollectionViewController *)self setEditing:0];
  }
}

- (void)showAddView
{
  dispatch_time_t v3 = dispatch_time(0, 300000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055B14;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addTimer:(id)a3
{
}

- (void)showAddViewForTimer:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerCollectionViewController *)self view];
  int v6 = [v5 window];

  if ([(MTATimerCollectionViewController *)self isViewLoaded] && v6)
  {
    [(MTATimerCollectionViewController *)self showAddTimerViewWithTimer:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100055C94;
    v7[3] = &unk_1000A1B38;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [(MTATimerCollectionViewController *)self setDeferredAddingTimer:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)showAddTimerViewWithTimer:(id)a3
{
  id v14 = a3;
  [(MTATimerCollectionViewController *)self setEditing:0];
  if (v14)
  {
    id v4 = [(MTATimerCollectionViewController *)self dataSource];
    id v5 = [v4 rowForTimer:v14];

    [(MTATimerCollectionViewController *)self _presentAddEditForTimer:v14 isNewTimer:v5 == (id)0x7FFFFFFFFFFFFFFFLL];
    int v6 = +[MTAStateStore shared];
    id v7 = +[MTAStateStoreEvent eventWithType:9];
    [v6 pushEvent:v7];

    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = +[MTAStateStore shared];
      id v9 = [v14 timerID];
      uint64_t v10 = [v9 UUIDString];
      v11 = +[MTAStateStoreEvent eventWithType:10 identifier:v10];
      [v8 pushEvent:v11];

      goto LABEL_6;
    }
  }
  else
  {
    [(MTATimerCollectionViewController *)self _presentAddEditForTimer:0 isNewTimer:1];
    uint64_t v12 = +[MTAStateStore shared];
    id v13 = +[MTAStateStoreEvent eventWithType:9];
    [v12 pushEvent:v13];
  }
  id v8 = +[MTAStateStore shared];
  id v9 = +[MTAStateStoreEvent eventWithType:9];
  [v8 pushEvent:v9];
LABEL_6:
}

- (void)_presentAddEditForTimer:(id)a3 isNewTimer:(BOOL)a4
{
  id v5 = [(MTATimerCollectionViewController *)self navigationItem];
  int v6 = [v5 rightBarButtonItem];

  if (v6)
  {
    v19 = [[MTATimerAddViewController alloc] initWithDataSource:self->_dataSource timerManager:self->_timerManager delegate:self];
    [(MTATimerCollectionViewController *)self setAddEditTimerController:v19];
    id v7 = [MTAAddSheetNavigationController alloc];
    id v8 = [(MTATimerCollectionViewController *)self addEditTimerController];
    id v9 = [(MTAAddSheetNavigationController *)v7 initWithRootViewController:v8];

    uint64_t v10 = [(MTATimerCollectionViewController *)self addEditTimerController];
    [v10 preferredContentSize];
    -[MTAAddSheetNavigationController setPreferredContentSize:](v9, "setPreferredContentSize:");

    [(MTAAddSheetNavigationController *)v9 setModalPresentationStyle:7];
    v11 = [(MTATimerCollectionViewController *)self navigationItem];
    uint64_t v12 = [v11 rightBarButtonItem];
    id v13 = [(MTAAddSheetNavigationController *)v9 popoverPresentationController];
    [v13 setBarButtonItem:v12];

    id v14 = [(MTAAddSheetNavigationController *)v9 popoverPresentationController];
    [v14 setDelegate:self];

    v15 = +[UIColor mtui_backgroundColor];
    id v16 = [(MTAAddSheetNavigationController *)v9 popoverPresentationController];
    [v16 setBackgroundColor:v15];

    objc_super v17 = +[UIColor mtui_backgroundColor];
    v18 = [(MTAAddSheetNavigationController *)v9 view];
    [v18 setBackgroundColor:v17];

    [(MTATimerCollectionViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (void)dismissAddViewController:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 isSuspended] ^ 1;

  [(MTATimerCollectionViewController *)self dismissViewControllerAnimated:v5 completion:&stru_1000A20F8];
}

- (void)showAddViewWithCompletion:(id)a3
{
  id v5 = a3;
  [(MTATimerCollectionViewController *)self showAddViewForTimer:0];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [objc_alloc((Class)MTMutableTimer) initWithState:3 duration:a3];
  [v13 setSound:v11];
  [(MTATimerCollectionViewController *)self setSound:v11];

  [v13 setTitle:v12];
  +[MTTimerManager setDefaultDuration:a3];
  id v14 = [(MTATimerCollectionViewController *)self timerManager];
  v15 = [v14 addTimer:v13];
  id v16 = +[NAScheduler mtMainThreadScheduler];
  objc_super v17 = [v15 reschedule:v16];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100056328;
  v21[3] = &unk_1000A1EA8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v10;
  id v18 = v10;
  id v19 = v13;
  id v20 = [v17 addSuccessBlock:v21];
}

- (void)timerAddEditControllerDidCancel:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  [(MTATimerCollectionViewController *)self dismissAddViewController:a3];
  if (v4)
  {
    [(MTATimerCollectionViewController *)self reloadState];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v8 section]);
  id v10 = [v9 integerValue];

  if (v10 == (id)3)
  {
    [v7 bounds];
    +[MTATimerTipCollectionViewCell sizeThatFits:siriTipView:](MTATimerTipCollectionViewCell, "sizeThatFits:siriTipView:", self->_siriTipView, v13, v14);
    goto LABEL_5;
  }
  if (!v10)
  {
    [(MTATimerCollectionViewController *)self singleTimerSectionSize];
LABEL_5:
    CGFloat width = v11;
    double height = v12;
    goto LABEL_13;
  }
  [v7 bounds];
  CGFloat width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v17 != CGSizeZero.width || v18 != height)
  {
    float v20 = v17 / 250.0;
    unint64_t v21 = vcvtms_u32_f32(v20);
    double v22 = v17 + -30.0 + (double)(v21 - 1) * -15.0;
    UIFloorToViewScale();
    double v24 = v23;
    double v25 = v22 - v23 * (double)v21;
    unint64_t v26 = (unint64_t)[v8 row];
    double v27 = -0.0;
    if (!(v26 % v21)) {
      double v27 = v25;
    }
    double height = v24 + v27;
    CGFloat width = height;
  }
LABEL_13:

  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.CGFloat width = v28;
  return result;
}

- (CGSize)singleTimerSectionSize
{
  dispatch_time_t v3 = [(MTATimerCollectionViewController *)self collectionView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  if (+[MTAUtilities isLandscape]) {
    double v8 = 24.0;
  }
  else {
    double v8 = 8.0;
  }
  id v9 = [(MTATimerCollectionViewController *)self traitCollection];
  id v10 = [v9 horizontalSizeClass];

  double v11 = [(MTATimerCollectionViewController *)self collectionView];
  double v12 = [v11 window];
  [v12 size];
  double v14 = v13;

  switch(+[MTAUtilities estimatedSplitLayoutForWindowWidth:v14])
  {
    case 0:
      +[MTATimerControlsView estimatedViewHeight];
      double v14 = v15;
      goto LABEL_17;
    case 1:
      if (+[MTAUtilities isLandscape])
      {
        +[MTATimerControlsView estimatedViewHeight];
        double v14 = v21;
        if (v10 != (id)1) {
          goto LABEL_17;
        }
      }
      else
      {
        if (v10 != (id)1) {
          goto LABEL_17;
        }
        +[MTATimerControlsView estimatedNonCountdownElementHeightWithSpacing];
        double v14 = v14 + v22;
      }
LABEL_16:
      double v14 = v14 + 84.0;
LABEL_17:
      double v17 = v8;
LABEL_18:
      double v23 = v17 + v14;
      double v24 = v5;
      result.double height = v23;
      result.CGFloat width = v24;
      return result;
    case 2:
      +[MTATimerControlsView estimatedViewHeight];
      double v14 = v16;
      double v17 = 0.0;
      if (v10 != (id)1 || !+[MTAUtilities isLandscape]) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 3:
      +[MTATimerControlsView estimatedViewHeight];
      double v19 = v18;
      +[MTATimerControlsView estimatedTonePickerHeight];
      double v14 = v19 + v20;
      double v17 = 0.0;
      goto LABEL_18;
    default:
      double v17 = v8;
      double v14 = v7;
      goto LABEL_18;
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 15.0;
  double v7 = 0.0;
  double v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  [(MTATimerCollectionViewController *)self confirmPickingSound];
  id v5 = [(MTATimerCollectionViewController *)self navigationItem];
  double v4 = [v5 leftBarButtonItem];
  [v4 setEnabled:1];
}

- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(MTATimerCollectionViewController *)self addEditTimerController];

    if (!v4) {
      NSLog(@"Attempting to dismiss add or edit controller when there isn't one.");
    }
  }
  [(MTATimerCollectionViewController *)self setAddEditTimerController:0];
  id v6 = +[MTAStateStore shared];
  id v5 = +[MTAStateStoreEvent eventWithType:11];
  [v6 pushEvent:v5];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  dispatch_time_t v3 = [(MTATimerCollectionViewController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    double v8 = [(MTATimerCollectionViewController *)self dataSource];
    id v9 = [v8 numberOfActiveTimers];
LABEL_7:
    int64_t v10 = (int64_t)v9;

    return v10;
  }
  if (v6 == (id)2)
  {
    double v8 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
    id v9 = [v8 count];
    goto LABEL_7;
  }
  return v6 != (id)3 || self->_siriTipView != 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 isEqualToString:UICollectionElementKindSectionHeader]
    && (-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v9 section]), int64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "integerValue"), v10, v11 == (id)2))
  {
    double v12 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kMTATimerCollectionHeaderIdentifier" forIndexPath:v9];
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"TIMER_HEADER_RECENT" value:&stru_1000A2560 table:0];
    double v15 = [v12 headerTitle];
    [v15 setText:v14];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a5, a4);
  id v7 = [v6 integerValue];

  if (v7 == (id)3 || (unint64_t)v7 <= 1)
  {
    CGFloat width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else if (v7 == (id)2 {
         && MTUIShouldUseLargePadLayout()
  }
         && !+[MTAUtilities isLandscape]
         && ([(MTATimerCollectionViewController *)self dataSource],
             int64_t v10 = objc_claimAutoreleasedReturnValue(),
             id v11 = [v10 numberOfActiveTimers],
             v10,
             !v11))
  {
    double v15 = [(MTATimerCollectionViewController *)self collectionView];
    [v15 frame];
    CGFloat width = v16;

    double height = 114.0;
  }
  else
  {
    double v12 = [(MTATimerCollectionViewController *)self collectionView];
    [v12 frame];
    CGFloat width = v13;

    double height = 64.0;
  }
  double v14 = width;
  result.double height = height;
  result.CGFloat width = v14;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [v8 integerValue];

  switch((unint64_t)v9)
  {
    case 0uLL:
      int64_t v10 = [(MTATimerCollectionViewController *)self traitCollection];
      id v11 = [v10 horizontalSizeClass];
      double v12 = [(MTATimerCollectionViewController *)self collectionView];
      double v13 = [v12 window];
      [v13 frame];
      unsigned int v15 = +[MTAUtilities shouldUseCompactLayoutForSizeClass:v11 windowWidth:v14];

      double v16 = [(MTATimerCollectionViewController *)self dataSource];
      id v17 = [v16 numberOfActiveTimers];

      if (v17)
      {
        double v18 = [(MTATimerCollectionViewController *)self dataSource];
        id v19 = [v18 numberOfActiveTimers];

        if ((unint64_t)v19 >= 2)
        {
          double v20 = MTLogForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10006D2E8(self);
          }
        }
        double v21 = [v6 dequeueReusableCellWithReuseIdentifier:@"kMTASingleTimerCellIdentifierActive" forIndexPath:v7];
        double v22 = v21;
        if (v15) {
          uint64_t v23 = 5;
        }
        else {
          uint64_t v23 = 4;
        }
        double v24 = [v21 controlsView];
        [v24 setStyle:v23];

        double v25 = [(MTATimerCollectionViewController *)self dataSource];
        unint64_t v26 = [v25 activeTimerAtRow:0];
        -[MTATimerCollectionViewController prepareUIForState:inCell:forceRefresh:](self, "prepareUIForState:inCell:forceRefresh:", [v26 state], v22, 1);

        double v27 = [(MTTimerDataSource *)self->_dataSource activeTimerAtRow:0];
        double v28 = v27;
        if (v27)
        {
          [v27 remainingTime];
          double v30 = v29;
          v31 = [v22 controlsView];
          [v31 setTime:v30];

          v32 = [v28 title];
          [(MTATimerCollectionViewController *)self setCurrentTitle:v32];
        }
      }
      else
      {
        double v22 = [v6 dequeueReusableCellWithReuseIdentifier:@"kMTASingleTimerCellIdentifierNew" forIndexPath:v7];
        v41 = [v22 controlsView];
        [v41 setTimerControlState:0];

        if (v15) {
          uint64_t v42 = 2;
        }
        else {
          uint64_t v42 = 4;
        }
        v43 = [v22 controlsView];
        [v43 setStyle:v42];

        double v28 = [v22 controlsView];
        [v28 setState:1];
      }

      v44 = [v22 controlsView];
      v45 = [(MTATimerCollectionViewController *)self currentTitle];
      [v44 setCurrentLabel:v45];

      [v22 setAccessibilityIdentifier:@"single-timer-1"];
      v46 = [v22 controlsView];
      v47 = [(MTATimerCollectionViewController *)self dataSource];
      v48 = [v47 getLatestDuration];
      [v48 duration];
      [v46 setCountDownDuration:];

      [(MTATimerCollectionViewController *)self updateSelectedToneForCell:v22];
      v35 = [v22 controlsView];
      [v35 setControlsViewDelegate:self];
      goto LABEL_25;
    case 1uLL:
      double v22 = [v6 dequeueReusableCellWithReuseIdentifier:@"kMTATimerActiveCollectionIdentifier" forIndexPath:v7];
      v34 = [(MTATimerCollectionViewController *)self dataSource];
      v35 = [v34 activeTimerAtRow:[v7 row]];

      v36 = [v35 timerIDString];
      v37 = +[NSString stringWithFormat:@"active-timer-%@", v36];
      [v22 setAccessibilityIdentifier:v37];

      [v22 refreshUI:v35 animated:0];
LABEL_25:

      break;
    case 2uLL:
      double v22 = [v6 dequeueReusableCellWithReuseIdentifier:@"kMTATimerRecentCollectionIdentifier" forIndexPath:v7];
      v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"recent-timer-%ld", [v7 row]);
      [v22 setAccessibilityIdentifier:v38];

      v39 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
      v40 = [v39 objectAtIndexedSubscript:[v7 row]];

      if (v40) {
        [v22 updateWithDuration:v40];
      }

      break;
    case 3uLL:
      double v22 = [v6 dequeueReusableCellWithReuseIdentifier:@"kMTATimerTipCollectionViewCellIdentifier" forIndexPath:v7];
      [v22 setSiriTipView:self->_siriTipView];
      break;
    default:
      v33 = MTLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10006D280();
      }

      double v22 = 0;
      break;
  }

  return v22;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [a5 section]);
  id v8 = [v7 integerValue];

  if (v8) {
    BOOL v9 = v8 == (id)3;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [v10 setDelegate:self];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setDelegate:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = MTLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(MTATimerCollectionViewController *)self singleTimerVC];
        int v11 = 138543618;
        double v12 = self;
        __int16 v13 = 2114;
        double v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ didEndDisplayingCell, current vc: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      BOOL v9 = [(MTATimerCollectionViewController *)self singleTimerVC];
      [v9 stopUpdatingTimerUI];

      id v10 = [(MTATimerCollectionViewController *)self singleTimerVC];
      [v10 removeNotificationObserver];
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = [self->_sections objectAtIndexedSubscript:[a4 section]];
  id v5 = [v4 integerValue];

  return v5 == (id)1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MTATimerCollectionViewController *)self dataSource];
  id v7 = [v5 row];

  id v10 = [v6 activeTimerAtRow:v7];

  id v8 = [[MTATimerViewController alloc] initWithTimer:v10 timerManager:self->_timerManager dataSource:self->_dataSource delegate:self];
  BOOL v9 = [(MTATimerCollectionViewController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (void)startTimerForCell:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  id v7 = [(MTATimerCollectionViewController *)self collectionView];
  id v8 = [v7 indexPathForCell:v6];

  BOOL v9 = [(MTATimerCollectionViewController *)self dataSource];
  id v10 = [v9 activeTimerAtRow:[v8 row]];
  id v11 = [v10 mutableCopy];

  [v11 setDuration:a4];
  [v11 setState:3];
  double v12 = [(MTATimerCollectionViewController *)self timerManager];
  __int16 v13 = [v12 updateTimer:v11];
  double v14 = +[NAScheduler mtMainThreadScheduler];
  unsigned int v15 = [v13 reschedule:v14];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100057690;
  v18[3] = &unk_1000A1680;
  v18[4] = self;
  id v19 = v11;
  id v16 = v11;
  id v17 = [v15 addSuccessBlock:v18];
}

- (void)cancelTimerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  id v7 = [(MTATimerCollectionViewController *)self dataSource];
  id v8 = [v7 activeTimerAtRow:[v6 row]];
  BOOL v9 = [v8 timerByUpdatingWithState:1];

  id v10 = MTLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 timerID];
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2114;
    double v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);
  }
  double v12 = [(MTATimerCollectionViewController *)self timerManager];
  __int16 v13 = [v12 updateTimer:v9];
  double v14 = +[NAScheduler mtMainThreadScheduler];
  unsigned int v15 = [v13 reschedule:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100057990;
  v17[3] = &unk_1000A20B0;
  v17[4] = self;
  id v16 = [v15 addSuccessBlock:v17];
}

- (void)pauseResumeTimerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  id v7 = [(MTATimerCollectionViewController *)self dataSource];
  id v8 = [v7 activeTimerAtRow:[v6 row]];
  id v9 = [v8 mutableCopy];

  if ([v9 state] == (id)3) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  [v9 setState:v10];
  id v11 = [(MTATimerCollectionViewController *)self timerManager];
  double v12 = [v11 updateTimer:v9];
  __int16 v13 = +[NAScheduler mtMainThreadScheduler];
  double v14 = [v12 reschedule:v13];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100057BF0;
  v17[3] = &unk_1000A1680;
  v17[4] = self;
  id v18 = v9;
  id v15 = v9;
  id v16 = [v14 addSuccessBlock:v17];
}

- (void)deleteRecentTimerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerCollectionViewController *)self collectionView];
  id v13 = [v5 indexPathForCell:v4];

  id v6 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
  id v7 = [v6 objectAtIndexedSubscript:[v13 row]];

  if (v7)
  {
    id v8 = [(MTATimerCollectionViewController *)self timerManager];
    id v9 = [v8 removeRecentDuration:v7];

    uint64_t v10 = +[NAScheduler mainThreadScheduler];
    id v11 = [v9 reschedule:v10];
    id v12 = [v11 addCompletionBlock:&stru_1000A2118];
  }
}

- (void)startRecentTimerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerCollectionViewController *)self collectionView];
  id v12 = [v5 indexPathForCell:v4];

  id v6 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));

  if (v7)
  {
    [v7 duration];
    double v9 = v8;
    uint64_t v10 = [v7 title];
    id v11 = [v7 sound];
    [(MTATimerCollectionViewController *)self didStartTimerWithDuration:v10 title:v11 sound:0 sender:v9];
  }
}

- (void)didCancelTimerWithSender:(id)a3
{
  id v4 = [(MTATimerCollectionViewController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  [(MTATimerCollectionViewController *)self reloadState];
}

- (void)didReceiveStartTimerShortcutAction
{
  dispatch_time_t v3 = [(MTATimerCollectionViewController *)self navigationController];
  id v4 = [v3 popViewControllerAnimated:1];

  [(MTATimerCollectionViewController *)self handleStartTimerShortcutAction];
}

- (id)defaultEditLabel
{
  v2 = +[NSBundle mainBundle];
  dispatch_time_t v3 = [v2 localizedStringForKey:@"Timer" value:&stru_1000A2560 table:0];

  return v3;
}

- (void)startTimer:(id)a3
{
  id v4 = [(MTATimerCollectionViewController *)self singleTimerCell];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 controlsView];
    [v6 countDownDuration];
    double v8 = v7;

    if (v8 > 0.0)
    {
      id v9 = [objc_alloc((Class)MTMutableTimer) initWithState:3 duration:v8];
      uint64_t v10 = [v5 controlsView];
      id v11 = [v10 getCurrentLabel];

      if ([v11 length]) {
        [v9 setTitle:v11];
      }
      id v12 = [(MTATimerCollectionViewController *)self sound];
      if (v12)
      {
        [v9 setSound:v12];
      }
      else
      {
        id v13 = +[MTSound defaultSoundForCategory:1];
        [v9 setSound:v13];
      }
      double v14 = MTLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v9 timerID];
        *(_DWORD *)buf = 138543618;
        double v25 = self;
        __int16 v26 = 2114;
        double v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);
      }
      id v16 = [(MTATimerCollectionViewController *)self dataSource];
      id v17 = [v16 addTimer:v9 reload:1];
      id v18 = +[NAScheduler mtMainThreadScheduler];
      id v19 = [v17 reschedule:v18];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000582B4;
      v22[3] = &unk_1000A2140;
      v22[4] = self;
      id v23 = v9;
      id v20 = v9;
      id v21 = [v19 addCompletionBlock:v22];
    }
  }
}

- (void)deleteRecentSection
{
  dispatch_time_t v3 = [(MTATimerCollectionViewController *)self sections];
  id v4 = [v3 indexOfObject:&off_1000A4FD0];

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(MTATimerCollectionViewController *)self sections];
    [v5 removeObjectAtIndex:v4];

    id v7 = [(MTATimerCollectionViewController *)self collectionView];
    id v6 = +[NSIndexSet indexSetWithIndex:v4];
    [v7 deleteSections:v6];
  }
}

- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v7) {
    [(MTATimerCollectionViewController *)self prepareUIForState:a3 inCell:v7 forceRefresh:v4];
  }

  _objc_release_x1();
}

- (void)prepareUIForState:(unint64_t)a3 inCell:(id)a4 forceRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = MTLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing UI for state %lu", buf, 0x16u);
  }

  if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    uint64_t v10 = [(MTTimerDataSource *)self->_dataSource activeTimerAtRow:0];
    id v11 = [v8 controlsView];
    [v10 remainingTime];
    double v13 = v12;
    [v10 duration];
    double v15 = v14;
    if ([v10 isCurrentTimer])
    {
      [v11 setRemainingTime:a3 duration:0 state:v5 title:v13 forceRefresh:v15];
    }
    else
    {
      id v16 = [v10 title];
      [v11 setRemainingTime:a3 duration:v16 state:v5 title:v13 forceRefresh:v15];
    }
    [(MTATimerCollectionViewController *)self updateAddButton];
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
        NSLog(@"Unexpected timer state %ld", a3);
        break;
      case 1uLL:
        [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
        break;
      case 2uLL:
        [(MTATimerCollectionViewController *)self stopUpdatingTimerUI];
        [(MTATimerCollectionViewController *)self timerTick:0];
        break;
      case 3uLL:
        [(MTATimerCollectionViewController *)self timerTick:0];
        [(MTATimerCollectionViewController *)self startUpdatingSingleTimerUI];
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v10 = MTLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006D42C();
    }
  }
}

- (void)timerTick:(id)a3
{
  BOOL v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    double v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timerTick", (uint8_t *)&v13, 0xCu);
  }

  if ([(MTATimerCollectionViewController *)self isViewLoaded])
  {
    if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
    {
      BOOL v5 = [(MTATimerCollectionViewController *)self singleTimerCell];
      if (v5)
      {
        id v6 = [(MTTimerDataSource *)self->_dataSource activeTimerAtRow:0];
        [v6 remainingTime];
        double v8 = v7;
        switch((unint64_t)[v6 state])
        {
          case 0uLL:
          case 4uLL:
            id v9 = MTLogForCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              sub_10006D494((uint64_t)self, v6);
            }
            goto LABEL_16;
          case 1uLL:
            [(MTATimerCollectionViewController *)self prepareUIForState:1 forceRefresh:0];
            id v11 = [v5 controlsView];
            id v9 = v11;
            double v12 = 0.0;
            goto LABEL_15;
          case 2uLL:
          case 3uLL:
            uint64_t v10 = MTLogForCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              int v13 = 138543618;
              double v14 = self;
              __int16 v15 = 2048;
              double v16 = v8;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ remainingTime: %f", (uint8_t *)&v13, 0x16u);
            }

            id v11 = [v5 controlsView];
            id v9 = v11;
            double v12 = v8;
LABEL_15:
            [v11 setTime:v12];
LABEL_16:

            break;
          default:
            break;
        }
      }
    }
    else
    {
      BOOL v5 = MTLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10006D42C();
      }
    }
  }
}

- (void)cancelTimer:(id)a3
{
  BOOL v4 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v4 && [(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    BOOL v5 = [(MTTimerDataSource *)self->_dataSource activeTimerAtRow:0];
    id v6 = [v5 timerByUpdatingWithState:1];

    double v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [v6 timerID];
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);
    }
    id v9 = [(MTATimerCollectionViewController *)self dataSource];
    uint64_t v10 = [v9 updateTimer:v6];
    id v11 = +[NAScheduler mtMainThreadScheduler];
    double v12 = [v10 reschedule:v11];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100058BAC;
    v14[3] = &unk_1000A1680;
    v14[4] = self;
    id v15 = v4;
    id v13 = [v12 addSuccessBlock:v14];
  }
}

- (void)pauseResumeTimer:(id)a3
{
  BOOL v4 = [(MTATimerCollectionViewController *)self singleTimerCell];
  if (v4 && [(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    BOOL v5 = [(MTTimerDataSource *)self->_dataSource activeTimerAtRow:0];
    if ([v5 state] == (id)3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    double v7 = [v5 timerByUpdatingWithState:v6];
    double v8 = MTLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 timerID];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = self;
      __int16 v19 = 2114;
      unint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing a timer: %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [(MTTimerDataSource *)self->_dataSource updateTimer:v7 reload:0];
    id v11 = +[NAScheduler mtMainThreadScheduler];
    double v12 = [v10 reschedule:v11];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100058EE8;
    v16[3] = &unk_1000A2168;
    v16[4] = self;
    v16[5] = v6;
    id v13 = [v12 addSuccessBlock:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100058FCC;
    v15[3] = &unk_1000A17B0;
    v15[4] = self;
    id v14 = [v12 addFailureBlock:v15];
  }
}

- (void)showSoundPicker:(id)a3
{
  id v34 = a3;
  if (!self->_tonePickerViewController)
  {
    BOOL v4 = (TKTonePickerViewController *)[objc_alloc((Class)TKTonePickerViewController) _initWithAlertType:13 tableViewStyle:2];
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v4;

    uint64_t v6 = +[TLToneManager sharedToneManager];
    double v7 = [v6 defaultToneIdentifierForAlertType:14];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDefaultToneIdentifier:v7];

    double v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    [(TKTonePickerViewController *)self->_tonePickerViewController setNoneString:v9];

    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsNone:1];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:self];
    uint64_t v10 = objc_opt_new();
    [(TKTonePickerViewController *)self->_tonePickerViewController setStyleProvider:v10];

    id v11 = [(TKTonePickerViewController *)self->_tonePickerViewController navigationItem];
    double v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
    [v11 setTitle:v13];

    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"dismissSoundPicker"];
    [v11 setLeftBarButtonItem:v14];

    id v15 = objc_alloc((Class)UIBarButtonItem);
    double v16 = +[NSBundle mainBundle];
    id v17 = [v16 localizedStringForKey:@"SET" value:&stru_1000A2560 table:0];
    id v18 = [v15 initWithTitle:v17 style:2 target:self action:"confirmPickingSound"];
    [v11 setRightBarButtonItem:v18];
  }
  __int16 v19 = [(MTATimerCollectionViewController *)self currentTone];
  unint64_t v20 = [v19 toneIdentifier];
  [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedToneIdentifier:v20];

  [(TKTonePickerViewController *)self->_tonePickerViewController setShowsToneStore:MTShouldAllowToneStore()];
  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"confirmPickingSound" name:UIApplicationSuspendedNotification object:0];

  id v22 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_tonePickerViewController];
  [v22 setDelegate:self];
  [v22 setModalPresentationStyle:2];
  id v23 = [v22 popoverPresentationController];
  [v23 setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v34;
    [v24 bounds];
    double x = v25;
    double y = v27;
    double width = v29;
    double height = v31;
  }
  else
  {
    id v24 = 0;
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  [v23 setSourceView:v24];
  [v23 setSourceRect:x, y, width, height];
  v33 = +[UIColor mtui_backgroundColor];
  [v23 setBackgroundColor:v33];

  [(MTATimerCollectionViewController *)self presentViewController:v22 animated:1 completion:0];
}

- (id)currentTone
{
  dispatch_time_t v3 = [(MTATimerCollectionViewController *)self sound];

  if (v3)
  {
    uint64_t v4 = [(MTATimerCollectionViewController *)self sound];
LABEL_3:
    BOOL v5 = (void *)v4;
    goto LABEL_6;
  }
  uint64_t v6 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
  double v7 = [v6 sound];

  if (!v7)
  {
    uint64_t v4 = +[MTSound defaultSoundForCategory:1];
    goto LABEL_3;
  }
  double v8 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
  BOOL v5 = [v8 sound];

LABEL_6:

  return v5;
}

- (void)confirmPickingSound
{
  uint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController selectedToneIdentifier];
  if (!v3)
  {
    uint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController defaultToneIdentifier];
  }
  id v9 = (id)v3;
  uint64_t v4 = [(MTATimerCollectionViewController *)self sound];
  BOOL v5 = [v4 vibrationIdentifier];
  uint64_t v6 = [(MTATimerCollectionViewController *)self sound];
  double v7 = [v6 soundVolume];
  double v8 = +[MTSound toneSoundWithIdentifier:v9 vibrationIdentifer:v5 volume:v7];
  [(MTATimerCollectionViewController *)self setSound:v8];

  [(MTATimerCollectionViewController *)self updateSelectedTone];
  [(MTATimerCollectionViewController *)self dismissSoundPicker];
}

- (void)dismissSoundPicker
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSuspendedNotification object:0];

  uint64_t v4 = [(MTATimerCollectionViewController *)self presentedViewController];
  BOOL v5 = [v4 popoverPresentationController];

  if (v5)
  {
    uint64_t v6 = [(MTATimerCollectionViewController *)self navigationItem];
    double v7 = [v6 leftBarButtonItem];
    [v7 setEnabled:1];
  }
  id v8 = +[UIApplication sharedApplication];
  -[MTATimerCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", [v8 isSuspended] ^ 1, 0);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (MTUIIsPadIdiom()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)tipViewControllerDidBecomeAvailableWithSiriTipsController:(id)a3 tipView:(id)a4
{
  double v7 = (_TtC11MobileTimer18SiriTipsController *)a3;
  id v8 = a4;
  if (self->_siriTipsController != v7)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MTATimerCollectionViewController.m" lineNumber:1422 description:@"Unexpected Siri tips controller instance"];
  }
  id v9 = MTLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri tip became available", v12, 2u);
  }

  objc_storeStrong((id *)&self->_siriTipView, a4);
  if (([(NSMutableArray *)self->_sections containsObject:&off_1000A4F88] & 1) == 0)
  {
    [(NSMutableArray *)self->_sections insertObject:&off_1000A4F88 atIndex:0];
    uint64_t v10 = [(MTATimerCollectionViewController *)self collectionView];
    [v10 reloadData];
  }
}

- (void)tipViewControllerWasInvalidatedWithSiriTipsController:(id)a3
{
  BOOL v5 = (_TtC11MobileTimer18SiriTipsController *)a3;
  if (self->_siriTipsController != v5)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MTATimerCollectionViewController.m" lineNumber:1440 description:@"Unexpected Siri tips controller instance"];
  }
  if (self->_siriTipView)
  {
    uint64_t v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing Siri tip section", v11, 2u);
    }

    siriTipView = self->_siriTipView;
    self->_siriTipView = 0;

    id v8 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4F88];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_sections removeObjectAtIndex:v8];
      id v9 = [(MTATimerCollectionViewController *)self collectionView];
      [v9 reloadData];
    }
  }
}

- (MTSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (_TtC11MobileTimer18SiriTipsController)siriTipsController
{
  return self->_siriTipsController;
}

- (void)setSiriTipsController:(id)a3
{
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MTATimerAddViewController)addEditTimerController
{
  return self->_addEditTimerController;
}

- (void)setAddEditTimerController:(id)a3
{
}

- (_UIContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (MTATimerViewController)singleTimerVC
{
  return self->_singleTimerVC;
}

- (void)setSingleTimerVC:(id)a3
{
}

- (id)deferredAddingTimer
{
  return self->_deferredAddingTimer;
}

- (void)setDeferredAddingTimer:(id)a3
{
}

- (BOOL)remainInMultipleTimerMode
{
  return self->_remainInMultipleTimerMode;
}

- (void)setRemainInMultipleTimerMode:(BOOL)a3
{
  self->_remainInMultipleTimerMode = a3;
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)setCurrentTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_storeStrong(&self->_deferredAddingTimer, 0);
  objc_storeStrong((id *)&self->_singleTimerVC, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_addEditTimerController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_siriTipView, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);

  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end