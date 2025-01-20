@interface MTATabBarController
- (BOOL)_canShowWhileLocked;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (MTATabBarController)initWithAlarmManager:(id)a3 alarmDataSource:(id)a4 timerManager:(id)a5 timerDataSource:(id)a6;
- (id)alarmTableViewController;
- (id)alarmViewController;
- (id)deferredEditingAction;
- (id)navigationControllerForHorizontalSizeClass:(int64_t)a3 verticalSizeClass:(int64_t)a4 atIndex:(unint64_t)a5;
- (id)navigationControllerForTab:(unint64_t)a3;
- (id)rootViewControllerForTab:(unint64_t)a3;
- (id)stopwatchViewController;
- (id)timerViewController;
- (id)topViewControllerForTab:(unint64_t)a3;
- (id)worldClockPadController;
- (id)worldClockTableViewController;
- (id)worldClockViewController;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)tabIndexForAppSection:(int64_t)a3;
- (void)invalidateViewControllersWithTraitCollection:(id)a3;
- (void)performActionForIntent:(id)a3;
- (void)performActionForShortcutItem:(id)a3;
- (void)populateShortcutItems;
- (void)populateTabIndexes;
- (void)prepareStateForUrlLaunch;
- (void)restoreAddNewAlarm;
- (void)restoreAlarmEditWithEvent:(id)a3;
- (void)restoreAlarmTabEditMode;
- (void)restoreSleepEdit;
- (void)restoreState;
- (void)restoreWorldClockAdd;
- (void)restoreWorldClockEdit;
- (void)restoreWorldClockTabWithEvent:(id)a3;
- (void)setDeferredEditingAction:(id)a3;
- (void)showAddView;
- (void)showSleepView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTATabBarController

- (void)restoreWorldClockTabWithEvent:(id)a3
{
  id v7 = a3;
  if (MTUIIsPadIdiom())
  {
    v4 = [v7 indexPath];

    if (v4)
    {
      v5 = [(MTATabBarController *)self worldClockPadController];
      v6 = [v7 indexPath];
      [v5 restoreIndexPath:v6];
    }
  }
}

- (void)restoreState
{
  v3 = +[MTAStateStore shared];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004E7C;
  v4[3] = &unk_1000A14E8;
  v4[4] = self;
  [v3 restoreLastEventWithCompletion:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTATabBarController;
  [(MTATabBarController *)&v5 viewWillAppear:a3];
  v4 = [(MTATabBarController *)self traitCollection];
  [(MTATabBarController *)self invalidateViewControllersWithTraitCollection:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATabBarController;
  [(MTATabBarController *)&v6 viewDidAppear:a3];
  v4 = [(MTATabBarController *)self deferredEditingAction];

  if (v4)
  {
    objc_super v5 = [(MTATabBarController *)self deferredEditingAction];
    v5[2]();

    [(MTATabBarController *)self setDeferredEditingAction:0];
  }
}

- (void)populateTabIndexes
{
  id v5 = (id)objc_opt_new();
  [v5 addObjectsFromArray:&off_1000A5020];
  v3 = (NSArray *)[v5 copy];
  tabIndexes = self->_tabIndexes;
  self->_tabIndexes = v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (MTUIIsPadIdiom()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (MTATabBarController)initWithAlarmManager:(id)a3 alarmDataSource:(id)a4 timerManager:(id)a5 timerDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MTATabBarController;
  v15 = [(MTATabBarController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alarmManager, a3);
    objc_storeStrong((id *)&v16->_alarmDataSource, a4);
    objc_storeStrong((id *)&v16->_timerManager, a5);
    objc_storeStrong((id *)&v16->_timerDataSource, a6);
    [(MTATabBarController *)v16 setDelegate:v16];
    v17 = objc_opt_new();
    [v17 configureWithTransparentBackground];
    v18 = [(MTATabBarController *)v16 tabBar];
    [v18 setScrollEdgeAppearance:v17];

    [(MTATabBarController *)v16 populateTabIndexes];
  }

  return v16;
}

- (void)invalidateViewControllersWithTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v4 horizontalSizeClass];
  id v7 = [v4 verticalSizeClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_tabIndexes;
  id v8 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = -[MTATabBarController navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:](self, "navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:", v6, v7, [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue]);
        [v5 na_safeAddObject:v12];
        id v13 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
        [(MTATabBarController *)self setOverrideTraitCollection:v13 forChildViewController:v12];
      }
      id v9 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(MTATabBarController *)self setViewControllers:v5 animated:0];
}

- (id)navigationControllerForHorizontalSizeClass:(int64_t)a3 verticalSizeClass:(int64_t)a4 atIndex:(unint64_t)a5
{
  switch(a5)
  {
    case 0uLL:
      if (a3 == 1)
      {
        worldClockNavControllerSmall = self->_worldClockNavControllerSmall;
        if (!worldClockNavControllerSmall)
        {
          id v8 = objc_alloc_init(MTAWorldClockTableViewController);
          id v9 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
          uint64_t v10 = self->_worldClockNavControllerSmall;
          self->_worldClockNavControllerSmall = v9;

          worldClockNavControllerSmall = self->_worldClockNavControllerSmall;
        }
        id v11 = worldClockNavControllerSmall;
        id v12 = [(UINavigationController *)v11 navigationBar];
        [v12 setPrefersLargeTitles:1];

        id v13 = [(UINavigationController *)v11 navigationItem];
        [v13 setLargeTitleDisplayMode:1];
        goto LABEL_32;
      }
      worldClockNavController = self->_worldClockNavController;
      if (!worldClockNavController)
      {
        v32 = objc_alloc_init(MTAWorldClockPadViewController);
        v33 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v32];
        v34 = self->_worldClockNavController;
        self->_worldClockNavController = v33;

        worldClockNavController = self->_worldClockNavController;
      }
      id v11 = worldClockNavController;
      break;
    case 1uLL:
      if (a3 == 1)
      {
        p_alarmNavControllerSmall = (id *)&self->_alarmNavControllerSmall;
        alarmNavControllerSmall = self->_alarmNavControllerSmall;
        if (!alarmNavControllerSmall)
        {
          long long v16 = [[MTAAlarmTableViewController alloc] initWithAlarmManager:self->_alarmManager dataSource:self->_alarmDataSource];
          id v17 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v16];
          id v18 = *p_alarmNavControllerSmall;
          id *p_alarmNavControllerSmall = v17;

          alarmNavControllerSmall = (UINavigationController *)*p_alarmNavControllerSmall;
        }
        id v11 = alarmNavControllerSmall;
        v19 = [(UINavigationController *)v11 navigationBar];
        [v19 setPrefersLargeTitles:1];

        objc_super v20 = [(UINavigationController *)v11 navigationItem];
        [v20 setLargeTitleDisplayMode:1];

        v21 = &OBJC_IVAR___MTATabBarController__alarmNavController;
      }
      else
      {
        p_alarmNavControllerSmall = (id *)&self->_alarmNavController;
        alarmNavController = self->_alarmNavController;
        if (!alarmNavController)
        {
          v36 = [[MTAAlarmCollectionViewController alloc] initWithAlarmManager:self->_alarmManager dataSource:self->_alarmDataSource];
          id v37 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v36];
          id v38 = *p_alarmNavControllerSmall;
          id *p_alarmNavControllerSmall = v37;

          alarmNavController = (UINavigationController *)*p_alarmNavControllerSmall;
        }
        id v11 = alarmNavController;
        v21 = &OBJC_IVAR___MTATabBarController__alarmNavControllerSmall;
      }
      v39 = [*(id *)((char *)&self->super.super.super.super.isa + *v21) viewControllers];
      id v13 = [v39 firstObject];

      v40 = [*p_alarmNavControllerSmall viewControllers];
      v41 = [v40 firstObject];

      if ([v13 conformsToProtocol:&OBJC_PROTOCOL___MTAAlarmEditViewControllerDelegate]
        && [v41 conformsToProtocol:&OBJC_PROTOCOL___MTAAlarmEditViewControllerDelegate])
      {
        [v41 handleContentSizeTransitionFrom:v13];
      }

      goto LABEL_32;
    case 2uLL:
      stopwatchNavController = self->_stopwatchNavController;
      if (!stopwatchNavController)
      {
        v23 = objc_alloc_init(MTAStopwatchViewController);
        v24 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v23];
        v25 = self->_stopwatchNavController;
        self->_stopwatchNavController = v24;

        stopwatchNavController = self->_stopwatchNavController;
      }
      BOOL v26 = a3 == 1;
      id v11 = stopwatchNavController;
      [(UINavigationController *)v11 setNavigationBarHidden:v26];
      break;
    case 3uLL:
      if (!self->_siriTipsController)
      {
        v27 = objc_alloc_init(_TtC11MobileTimer18SiriTipsController);
        siriTipsController = self->_siriTipsController;
        self->_siriTipsController = v27;
      }
      timerNavController = self->_timerNavController;
      if (timerNavController)
      {
        uint64_t v30 = 0;
      }
      else
      {
        int v42 = MTIdiomIpad();
        v43 = off_1000A0B90;
        if (!v42) {
          v43 = &off_1000A0B98;
        }
        id v44 = [objc_alloc(*v43) initWithTimerManager:self->_timerManager dataSource:self->_timerDataSource];
        [v44 setSiriTipsController:self->_siriTipsController];
        uint64_t v30 = v42 ^ 1u;
        v45 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v44];
        v46 = self->_timerNavController;
        self->_timerNavController = v45;

        timerNavController = self->_timerNavController;
      }
      id v11 = timerNavController;
      id v13 = [(UINavigationController *)v11 navigationBar];
      [v13 setPrefersLargeTitles:v30];
LABEL_32:

      break;
    default:
      id v11 = 0;
      break;
  }

  return v11;
}

- (id)topViewControllerForTab:(unint64_t)a3
{
  v3 = [(MTATabBarController *)self navigationControllerForTab:a3];
  id v4 = [v3 topViewController];

  return v4;
}

- (id)timerViewController
{
  return [(MTATabBarController *)self topViewControllerForTab:3];
}

- (id)navigationControllerForTab:(unint64_t)a3
{
  tabIndexes = self->_tabIndexes;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(NSArray *)tabIndexes indexOfObject:v5];

  id v7 = [(MTATabBarController *)self viewControllers];
  id v8 = [v7 count];

  if ((uint64_t)v6 >= (uint64_t)v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v9 = [(MTATabBarController *)self viewControllers];
    uint64_t v10 = [v9 objectAtIndex:v6];
  }

  return v10;
}

- (id)stopwatchViewController
{
  return [(MTATabBarController *)self topViewControllerForTab:2];
}

- (id)deferredEditingAction
{
  return self->_deferredEditingAction;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATabBarController;
  id v7 = a4;
  [(MTATabBarController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013AB8;
  v9[3] = &unk_1000A13D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateAlongsideTransition:v9 completion:0];
}

- (void)showSleepView
{
  v3 = [(MTATabBarController *)self alarmViewController];
  id v4 = v3;
  if (v3)
  {
    [v3 showSleepView:0];
  }
  else
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013BB0;
    v5[3] = &unk_1000A1498;
    objc_copyWeak(&v6, &location);
    [(MTATabBarController *)self setDeferredEditingAction:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)showAddView
{
  uint64_t v2 = [(MTATabBarController *)self rootViewControllerForTab:3];
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v3 showAddView];
    }
  }

  _objc_release_x2();
}

- (id)rootViewControllerForTab:(unint64_t)a3
{
  v3 = [(MTATabBarController *)self navigationControllerForTab:a3];
  id v4 = [v3 viewControllers];
  id v5 = [v4 firstObject];

  return v5;
}

- (unint64_t)tabIndexForAppSection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1000825D8[a3 - 1];
  }
  tabIndexes = self->_tabIndexes;
  id v5 = +[NSNumber numberWithUnsignedInteger:v3];
  NSUInteger v6 = [(NSArray *)tabIndexes indexOfObject:v5];

  return v6;
}

- (id)worldClockViewController
{
  return [(MTATabBarController *)self topViewControllerForTab:0];
}

- (id)alarmViewController
{
  return [(MTATabBarController *)self topViewControllerForTab:1];
}

- (void)populateShortcutItems
{
  id v12 = (id)objc_opt_new();
  uint64_t v3 = objc_opt_class();
  id v4 = [(MTATabBarController *)self stopwatchViewController];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6)
    {
      id v7 = +[NSAssertionHandler currentHandler];
      id v8 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v6 = 0;
  }

  id v9 = [v6 defaultShortcutItem];
  [v12 na_safeAddObject:v9];

  if (MTUIIsPhoneIdiom())
  {
    id v10 = +[MTAUtilities startTimerShortcutItem];
    [v12 na_safeAddObject:v10];
  }
  objc_super v11 = +[UIApplication sharedApplication];
  [v11 setShortcutItems:v12];
}

- (void)performActionForShortcutItem:(id)a3
{
  id v46 = a3;
  id v4 = [(MTATabBarController *)self view];
  id v5 = [v4 window];
  id v6 = [v5 rootViewController];
  [v6 dismissViewControllerAnimated:0 completion:0];

  id v7 = [v46 type];
  LODWORD(v5) = [v7 isEqualToString:@"com.apple.mobiletimer.add-alarm"];

  if (v5)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E20]];
    id v8 = [(MTATabBarController *)self alarmViewController];
    unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___MTAAddItemController];

    if (!v9) {
      goto LABEL_47;
    }
    id v10 = [(MTATabBarController *)self alarmViewController];
    [v10 showAddView];
    goto LABEL_4;
  }
  objc_super v11 = [v46 type];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.mobiletimer.start-stopwatch"];

  if (v12)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E38]];
    uint64_t v13 = objc_opt_class();
    id v14 = [(MTATabBarController *)self stopwatchViewController];
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
      id v16 = v15;
      if (!v16)
      {
        id v17 = +[NSAssertionHandler currentHandler];
        id v18 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v16 = 0;
    }

    [v16 handleStartStopwatchShortcutAction];
LABEL_46:

    goto LABEL_47;
  }
  v19 = [v46 type];
  unsigned int v20 = [v19 isEqualToString:@"com.apple.mobiletimer.stop-stopwatch"];

  if (v20)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E38]];
    uint64_t v21 = objc_opt_class();
    id v22 = [(MTATabBarController *)self stopwatchViewController];
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v16 = v23;
      if (!v16)
      {
        v24 = +[NSAssertionHandler currentHandler];
        v25 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v24 handleFailureInFunction:v25, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v21, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v16 = 0;
    }

    [v16 handleStopStopwatchShortcutAction];
    goto LABEL_46;
  }
  BOOL v26 = [v46 type];
  unsigned int v27 = [v26 isEqualToString:@"com.apple.mobiletimer.lap-stopwatch"];

  if (v27)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E38]];
    uint64_t v28 = objc_opt_class();
    id v29 = [(MTATabBarController *)self stopwatchViewController];
    if (v29)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = 0;
      }
      id v16 = v30;
      if (!v16)
      {
        v31 = +[NSAssertionHandler currentHandler];
        v32 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v31 handleFailureInFunction:v32, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v28, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v16 = 0;
    }

    [v16 handleLapStopwatchShortcutAction];
    goto LABEL_46;
  }
  v33 = [v46 type];
  unsigned int v34 = [v33 isEqualToString:@"com.apple.mobiletimer.reset-stopwatch"];

  if (v34)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E38]];
    uint64_t v35 = objc_opt_class();
    id v36 = [(MTATabBarController *)self stopwatchViewController];
    if (v36)
    {
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }
      id v16 = v37;
      if (!v16)
      {
        id v38 = +[NSAssertionHandler currentHandler];
        v39 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v38 handleFailureInFunction:v39, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v35, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v16 = 0;
    }

    [v16 handleResetStopwatchShortcutAction];
    goto LABEL_46;
  }
  v40 = [v46 type];
  unsigned int v41 = [v40 isEqualToString:kStartTimerActionID];

  if (v41)
  {
    [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E50]];
    int v42 = [(MTATabBarController *)self timerViewController];
    char v43 = objc_opt_respondsToSelector();

    if (v43)
    {
      id v10 = [(MTATabBarController *)self timerViewController];
      [v10 performSelector:"handleStartTimerShortcutAction"];
LABEL_4:
    }
  }
  else
  {
    id v44 = [v46 type];
    unsigned int v45 = [v44 isEqualToString:kStopTimerActionID];

    if (v45) {
      [(MTATabBarController *)self setSelectedIndex:[(NSArray *)self->_tabIndexes indexOfObject:&off_1000A4E50]];
    }
  }
LABEL_47:
}

- (void)performActionForIntent:(id)a3
{
  id v44 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v44;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      id v7 = v6;
      if (!v7)
      {
        id v8 = +[NSAssertionHandler currentHandler];
        unsigned int v9 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v7 = 0;
    }

    [(MTATabBarController *)self setSelectedIndex:1];
    long long v15 = [(MTATabBarController *)self alarmViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v17 = [v7 time];

      if (!v17)
      {
        id v18 = [v7 dateComponents];

        if (v18)
        {
          v19 = [v7 dateComponents];
          id v20 = [v19 hour];

          uint64_t v21 = [v7 dateComponents];
          id v22 = [v21 minute];

          v23 = +[MTMutableAlarm alarmWithHour:v20 minute:v22];
          v24 = [v7 label];
          [v23 setTitle:v24];

          v25 = [(MTATabBarController *)self alarmViewController];
          [v25 showAddViewForAlarm:v23];
        }
        else
        {
          v23 = [(MTATabBarController *)self alarmViewController];
          [v23 showAddView];
        }
        goto LABEL_25;
      }
    }
    else
    {
      BOOL v26 = [(MTATabBarController *)self alarmViewController];
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v28 = [v7 time];

      if (!v28)
      {
        v23 = [(MTATabBarController *)self alarmViewController];
        [v23 showAddViewForAlarm:0];
        goto LABEL_25;
      }
    }
    id v29 = [v7 time];
    uint64_t v30 = [v29 identifier];
    [v30 doubleValue];
    v23 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    v31 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    v32 = [MTMutableAlarm alarmWithHour:[v31 component:32 fromDate:v23] minute:[v31 component:64 fromDate:v23]];
    v33 = [v7 label];
    [v32 setTitle:v33];

    unsigned int v34 = [(MTATabBarController *)self alarmViewController];
    [v34 showAddViewForAlarm:v32];

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v10 = [v44 alarmID];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      id v10 = [v44 alarm];
    }
    objc_super v11 = v10;
    unsigned int v12 = [v10 identifier];

LABEL_14:
    uint64_t v13 = self;
    uint64_t v14 = 1;
LABEL_15:
    [(MTATabBarController *)v13 setSelectedIndex:v14];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = objc_opt_class();
    id v36 = v44;
    if (v36)
    {
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }
      id v7 = v37;
      if (!v7)
      {
        id v38 = +[NSAssertionHandler currentHandler];
        v39 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v38 handleFailureInFunction:v39, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v35, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v7 = 0;
    }

    v40 = [v7 alarmID];
    v23 = [v40 identifier];

    [(MTATabBarController *)self setSelectedIndex:1];
    if (!v23) {
      goto LABEL_25;
    }
    unsigned int v41 = [(MTATabBarController *)self alarmViewController];
    objc_opt_class();
    char v42 = objc_opt_isKindOfClass();

    v31 = [(MTATabBarController *)self alarmViewController];
    if ((v42 & 1) == 0)
    {
      objc_opt_class();
      char v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) == 0) {
        goto LABEL_25;
      }
      v31 = [(MTATabBarController *)self alarmViewController];
    }
    [v31 showAddViewForAlarmWithID:v23];
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = self;
    uint64_t v14 = 3;
    goto LABEL_15;
  }
LABEL_27:
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 selectedViewController];
  if (v6 != v5)
  {
LABEL_2:

    goto LABEL_7;
  }
  int v7 = MTUIIsPhoneIdiom();

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 topViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 scrollToTop];
      }
      goto LABEL_2;
    }
  }
LABEL_7:

  return 1;
}

- (id)worldClockPadController
{
  uint64_t v2 = [(UINavigationController *)self->_worldClockNavController viewControllers];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)worldClockTableViewController
{
  uint64_t v2 = [(UINavigationController *)self->_worldClockNavControllerSmall viewControllers];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)alarmTableViewController
{
  uint64_t v2 = [(UINavigationController *)self->_alarmNavControllerSmall viewControllers];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (void)restoreWorldClockAdd
{
  if (MTUIIsPadIdiom())
  {
    uint64_t v3 = [(MTATabBarController *)self worldClockPadController];
    objc_initWeak(&location, v3);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100014E44;
    v6[3] = &unk_1000A1498;
    objc_copyWeak(&v7, &location);
    id v4 = objc_loadWeakRetained(&location);
    [v4 setViewLoadedAction:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(MTATabBarController *)self worldClockTableViewController];
    [v5 showAddView];
  }
}

- (void)restoreAddNewAlarm
{
  uint64_t v3 = [(MTATabBarController *)self alarmViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(MTATabBarController *)self alarmsCollectionViewController];
  }
  else {
  id v5 = [(MTATabBarController *)self alarmTableViewController];
  }
  [v5 showAddView];
}

- (void)restoreAlarmEditWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATabBarController *)self alarmViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [v4 identifier];

    if (v7)
    {
      id v8 = [(MTATabBarController *)self alarmTableViewController];
      unsigned int v9 = [v4 identifier];
      [v8 showAddViewForAlarmWithID:v9];
    }
    else
    {
      id v10 = MTLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10006C664((uint64_t)self, v10);
      }
    }
  }
}

- (void)restoreSleepEdit
{
  id v2 = [(MTATabBarController *)self alarmTableViewController];
  [v2 showSleepView:0];
}

- (void)restoreWorldClockEdit
{
  if (MTUIIsPadIdiom())
  {
    uint64_t v3 = [(MTATabBarController *)self worldClockPadController];
    objc_initWeak(&location, v3);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001516C;
    v6[3] = &unk_1000A1498;
    objc_copyWeak(&v7, &location);
    id v4 = objc_loadWeakRetained(&location);
    [v4 setViewLoadedAction:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(MTATabBarController *)self worldClockTableViewController];
    [v5 setEditing:1 animated:0];
  }
}

- (void)restoreAlarmTabEditMode
{
  uint64_t v3 = [(MTATabBarController *)self alarmViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(MTATabBarController *)self alarmsCollectionViewController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015334;
    v11[3] = &unk_1000A1428;
    v11[4] = self;
    [v5 setAlarmsLoadedAction:v11];
  }
  else
  {
    id v6 = [(MTATabBarController *)self alarmTableViewController];
    objc_initWeak(&location, v6);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001537C;
    v8[3] = &unk_1000A1498;
    objc_copyWeak(&v9, &location);
    id v7 = objc_loadWeakRetained(&location);
    [v7 setAlarmsLoadedAction:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)prepareStateForUrlLaunch
{
  if (MTUIIsPadIdiom())
  {
    id v3 = [(MTATabBarController *)self worldClockPadController];
    [v3 prepareStateForUrlLaunch];
  }
}

- (void)setDeferredEditingAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredEditingAction, 0);
  objc_storeStrong((id *)&self->_tabIndexes, 0);
  objc_storeStrong((id *)&self->_timerDataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_worldClockNavController, 0);
  objc_storeStrong((id *)&self->_worldClockNavControllerSmall, 0);
  objc_storeStrong((id *)&self->_alarmNavController, 0);
  objc_storeStrong((id *)&self->_alarmNavControllerSmall, 0);
  objc_storeStrong((id *)&self->_timerNavController, 0);

  objc_storeStrong((id *)&self->_stopwatchNavController, 0);
}

@end