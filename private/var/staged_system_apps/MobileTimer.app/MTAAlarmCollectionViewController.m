@interface MTAAlarmCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTAAlarmCollectionViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4;
- (MTAAlarmEditViewController)addEditAlarmController;
- (MTAlarmDataSource)dataSource;
- (MTAlarmManager)alarmManager;
- (NSMutableArray)sections;
- (NSUserActivity)userActivity;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_UIContentUnavailableView)noItemsView;
- (double)cellHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)alarmsLoadedAction;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)deferredAddingAlarm;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3;
- (void)_handleNumberOfItemsDidChange;
- (void)_layoutNoItemsLabel;
- (void)_reloadUI:(id)a3;
- (void)_removeAlarm:(id)a3;
- (void)_showAddViewForAlarmAtRow:(unint64_t)a3;
- (void)_updateAlarm:(id)a3 reload:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)addAlarm:(id)a3;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4;
- (void)alarmEditControllerDidCancel:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dataSourceDidReload:(id)a3;
- (void)deleteCell:(id)a3;
- (void)dismissAddViewController:(id)a3;
- (void)handleContentSizeChange:(id)a3;
- (void)handleContentSizeTransitionFrom:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)reloadState;
- (void)reloadState:(id)a3;
- (void)removeAlarmAtIndexPath:(id)a3;
- (void)setAddEditAlarmController:(id)a3;
- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4;
- (void)setAlarmManager:(id)a3;
- (void)setAlarmsLoadedAction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDeferredAddingAlarm:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNoItemsView:(id)a3;
- (void)setSections:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)showAddAlarmViewPopUpWithAlarm:(id)a3;
- (void)showAddView;
- (void)showAddViewForAlarm:(id)a3;
- (void)showAddViewForAlarmWithID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAAlarmCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAAlarmCollectionViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v19.receiver = self;
  v19.super_class = (Class)MTAAlarmCollectionViewController;
  v9 = [(MTAAlarmCollectionViewController *)&v19 initWithCollectionViewLayout:v8];

  if (v9)
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"ALARMS_LIST" value:&stru_1000A2560 table:0];
    [(MTAAlarmCollectionViewController *)v9 setTitle:v11];

    [(MTAAlarmCollectionViewController *)v9 setEdgesForExtendedLayout:4];
    v12 = +[UIImage systemImageNamed:@"alarm.fill"];
    v13 = [(MTAAlarmCollectionViewController *)v9 tabBarItem];
    [v13 setImage:v12];

    [(MTAAlarmCollectionViewController *)v9 setAlarmManager:v6];
    [(MTAAlarmCollectionViewController *)v9 setDataSource:v7];
    v14 = [(MTAAlarmCollectionViewController *)v9 dataSource];
    [v14 registerObserver:v9];

    v15 = [(MTAAlarmCollectionViewController *)v9 title];
    uint64_t v16 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.alarm" title:v15];
    userActivity = v9->_userActivity;
    v9->_userActivity = (NSUserActivity *)v16;

    v9->_cellHeight = -1.0;
  }

  return v9;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)MTAAlarmCollectionViewController;
  [(MTAAlarmCollectionViewController *)&v19 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"NO_ALARMS" value:&stru_1000A2560 table:0];

  id v5 = [objc_alloc((Class)_UIContentUnavailableView) initWithFrame:v4 title:1 style:0 includeBackdrop:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MTAAlarmCollectionViewController *)self setNoItemsView:v5];

  id v6 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v6 setVibrantOptions:0];

  id v7 = [(MTAAlarmCollectionViewController *)self view];
  id v8 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v7 addSubview:v8];

  [(MTAAlarmCollectionViewController *)self reloadState];
  v9 = +[UIColor mtui_backgroundColor];
  v10 = [(MTAAlarmCollectionViewController *)self collectionView];
  [v10 setBackgroundColor:v9];

  v11 = [(MTAAlarmCollectionViewController *)self collectionView];
  [v11 setAllowsSelectionDuringEditing:1];

  v12 = [(MTAAlarmCollectionViewController *)self editButtonItem];
  v13 = [(MTAAlarmCollectionViewController *)self navigationItem];
  [v13 setLeftBarButtonItem:v12];

  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addAlarm:"];
  v15 = [(MTAAlarmCollectionViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];

  uint64_t v16 = [(MTAAlarmCollectionViewController *)self collectionView];
  [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];

  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"handleContentSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v18 = +[NSMutableArray arrayWithObject:&off_1000A4FE8];
  [(MTAAlarmCollectionViewController *)self setSections:v18];
}

- (void)reloadState
{
}

- (void)reloadState:(id)a3
{
  id v4 = a3;
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading collection view", buf, 2u);
  }

  id v6 = [(MTAlarmDataSource *)self->_dataSource reloadAlarms];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005BFCC;
  v9[3] = &unk_1000A20D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  id v8 = [v6 addCompletionBlock:v9];
}

- (void)_reloadUI:(id)a3
{
  id v5 = a3;
  [(MTAAlarmCollectionViewController *)self _handleNumberOfItemsDidChange];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)dataSourceDidReload:(id)a3
{
  [(MTAAlarmCollectionViewController *)self _reloadUI:0];
  id v4 = [(MTAAlarmCollectionViewController *)self collectionView];
  [v4 reloadData];

  alarmsLoadedAction = (void (**)(void))self->_alarmsLoadedAction;
  if (alarmsLoadedAction)
  {
    alarmsLoadedAction[2]();
    id v6 = self->_alarmsLoadedAction;
    self->_alarmsLoadedAction = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmCollectionViewController;
  [(MTAAlarmCollectionViewController *)&v4 viewWillAppear:a3];
  [(MTAAlarmCollectionViewController *)self reloadState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmCollectionViewController;
  [(MTAAlarmCollectionViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(MTAAlarmCollectionViewController *)self userActivity];
  [v4 becomeCurrent];

  id v5 = [(MTAAlarmCollectionViewController *)self deferredAddingAlarm];

  if (v5)
  {
    id v6 = [(MTAAlarmCollectionViewController *)self deferredAddingAlarm];
    v6[2]();

    [(MTAAlarmCollectionViewController *)self setDeferredAddingAlarm:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTAAlarmCollectionViewController;
  id v7 = a4;
  -[MTAAlarmCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C278;
  v8[3] = &unk_1000A1400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController setEditing:animated:](&v20, "setEditing:animated:");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(MTAAlarmCollectionViewController *)self collectionView];
  id v8 = [v7 visibleCells];

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) setEditing:[self isEditing] animated:v4];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  v13 = +[MTAStateStore shared];
  if (v5) {
    uint64_t v14 = 7;
  }
  else {
    uint64_t v14 = 6;
  }
  v15 = +[MTAStateStoreEvent eventWithType:v14];
  [v13 pushEvent:v15];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmCollectionViewController;
  [(MTAAlarmCollectionViewController *)&v3 viewDidLayoutSubviews];
  [(MTAAlarmCollectionViewController *)self _layoutNoItemsLabel];
}

- (void)_layoutNoItemsLabel
{
  objc_super v3 = [(MTAAlarmCollectionViewController *)self noItemsView];
  BOOL v4 = [v3 _titleLabel];
  [v4 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v6 = v5;
  double v8 = v7;

  id v9 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v14 setFrame:v11, v13, v6 + 60.0, v8 + 60.0];

  id v20 = [(MTAAlarmCollectionViewController *)self collectionView];
  [v20 center];
  double v16 = v15;
  double v18 = v17;
  long long v19 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v19 setCenter:v16, v18];
}

- (void)_handleNumberOfItemsDidChange
{
  objc_super v3 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v4 = [v3 numberOfAlarms];

  double v5 = [(MTAAlarmCollectionViewController *)self editButtonItem];
  double v6 = v5;
  if (v4) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [v5 setEnabled:v4 != 0];

  double v8 = [(MTAAlarmCollectionViewController *)self noItemsView];
  [v8 setAlpha:v7];

  if (!v4)
  {
    [(MTAAlarmCollectionViewController *)self setEditing:0];
  }
}

- (void)addAlarm:(id)a3
{
}

- (void)showAddViewForAlarm:(id)a3
{
  id v4 = a3;
  double v5 = [(MTAAlarmCollectionViewController *)self view];
  double v6 = [v5 window];

  if (v6)
  {
    [(MTAAlarmCollectionViewController *)self showAddAlarmViewPopUpWithAlarm:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005C7A4;
    v7[3] = &unk_1000A1B38;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [(MTAAlarmCollectionViewController *)self setDeferredAddingAlarm:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)showAddAlarmViewPopUpWithAlarm:(id)a3
{
  id v25 = a3;
  [(MTAAlarmCollectionViewController *)self setEditing:0];
  if (v25)
  {
    id v4 = [(MTAAlarmCollectionViewController *)self dataSource];
    BOOL v5 = [v4 rowForAlarm:v25] == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 1;
  }
  double v6 = [[MTAAlarmEditViewController alloc] initWithAlarm:v25 isNewAlarm:v5];
  [(MTAAlarmCollectionViewController *)self setAddEditAlarmController:v6];

  double v7 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  [v7 setDelegate:self];

  id v8 = [MTAAddSheetNavigationController alloc];
  id v9 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  double v10 = [(MTAAddSheetNavigationController *)v8 initWithRootViewController:v9];

  double v11 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  [v11 preferredContentSize];
  -[MTAAddSheetNavigationController setPreferredContentSize:](v10, "setPreferredContentSize:");

  [(MTAAddSheetNavigationController *)v10 setModalPresentationStyle:7];
  double v12 = [(MTAAlarmCollectionViewController *)self navigationItem];
  double v13 = [v12 rightBarButtonItem];
  uint64_t v14 = [(MTAAddSheetNavigationController *)v10 popoverPresentationController];
  [v14 setBarButtonItem:v13];

  double v15 = [(MTAAddSheetNavigationController *)v10 popoverPresentationController];
  [v15 setDelegate:self];

  double v16 = +[UIColor mtui_backgroundColor];
  double v17 = [(MTAAddSheetNavigationController *)v10 popoverPresentationController];
  [v17 setBackgroundColor:v16];

  double v18 = +[UIColor mtui_backgroundColor];
  long long v19 = [(MTAAddSheetNavigationController *)v10 view];
  [v19 setBackgroundColor:v18];

  [(MTAAlarmCollectionViewController *)self presentViewController:v10 animated:1 completion:0];
  id v20 = +[MTAStateStore shared];
  v21 = +[MTAStateStoreEvent eventWithType:1];
  [v20 pushEvent:v21];

  v22 = +[MTAStateStore shared];
  if (v5)
  {
    v23 = +[MTAStateStoreEvent eventWithType:1];
    [v22 pushEvent:v23];
  }
  else
  {
    v23 = [v25 alarmIDString];
    v24 = +[MTAStateStoreEvent eventWithType:2 identifier:v23];
    [v22 pushEvent:v24];
  }
}

- (void)showAddViewForAlarmWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v6 = [v5 rowForAlarmWithID:v4];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(MTAAlarmCollectionViewController *)self _showAddViewForAlarmAtRow:v6];
  }
}

- (void)_showAddViewForAlarmAtRow:(unint64_t)a3
{
  id v6 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v34 = [v6 alarmAtRow:a3];

  id v7 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4FE8];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"MTAAlarmCollectionViewController.m" lineNumber:346 description:@"Invalid section for Alarm"];
  }
  id v8 = [(MTAAlarmCollectionViewController *)self collectionView];
  id v9 = +[NSIndexPath indexPathForRow:a3 inSection:v7];
  double v10 = [v8 cellForItemAtIndexPath:v9];

  double v11 = [[MTAAlarmEditViewController alloc] initWithAlarm:v34 isNewAlarm:0];
  [(MTAAlarmCollectionViewController *)self setAddEditAlarmController:v11];

  double v12 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  [v12 setDelegate:self];

  double v13 = [MTAAddSheetNavigationController alloc];
  uint64_t v14 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  double v15 = [(MTAAddSheetNavigationController *)v13 initWithRootViewController:v14];

  double v16 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  [v16 preferredContentSize];
  -[MTAAddSheetNavigationController setPreferredContentSize:](v15, "setPreferredContentSize:");

  [(MTAAddSheetNavigationController *)v15 setModalPresentationStyle:7];
  double v17 = [(MTAAddSheetNavigationController *)v15 popoverPresentationController];
  [v17 setSourceView:v10];

  [v10 editingPopoverSourceRect];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(MTAAddSheetNavigationController *)v15 popoverPresentationController];
  [v26 setSourceRect:v19, v21, v23, v25];

  v27 = [(MTAAddSheetNavigationController *)v15 popoverPresentationController];
  [v27 setPermittedArrowDirections:3];

  v28 = [(MTAAddSheetNavigationController *)v15 popoverPresentationController];
  [v28 setDelegate:self];

  v29 = +[UIColor mtui_backgroundColor];
  v30 = [(MTAAddSheetNavigationController *)v15 popoverPresentationController];
  [v30 setBackgroundColor:v29];

  v31 = +[UIColor mtui_backgroundColor];
  v32 = [(MTAAddSheetNavigationController *)v15 view];
  [v32 setBackgroundColor:v31];

  [(MTAAlarmCollectionViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)handleContentSizeChange:(id)a3
{
  self->_cellHeight = -1.0;
  id v3 = [(MTAAlarmCollectionViewController *)self collectionViewLayout];
  [v3 invalidateLayout];
}

- (double)cellHeight
{
  double result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTAAlarmCollectionViewCell cellHeight];
    self->_cellHeight = result;
  }
  return result;
}

- (void)alarmEditControllerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005CF40;
  v3[3] = &unk_1000A1428;
  v3[4] = self;
  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  id v5 = a4;
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 alarmID];
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding alarm %{public}@", buf, 0xCu);
  }
  id v8 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v9 = [v8 addAlarm:v5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005D0F4;
  v12[3] = &unk_1000A20B0;
  v12[4] = self;
  id v10 = [v9 addSuccessBlock:v12];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005D100;
  v11[3] = &unk_1000A1428;
  v11[4] = self;
  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:1 completion:v11];
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  [(MTAAlarmCollectionViewController *)self _updateAlarm:a4 reload:1 withCompletionBlock:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D19C;
  v5[3] = &unk_1000A1428;
  v5[4] = self;
  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:1 completion:v5];
}

- (void)_updateAlarm:(id)a3 reload:(BOOL)a4 withCompletionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = MTLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 alarmID];
    *(_DWORD *)buf = 138543362;
    double v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating alarm %{public}@", buf, 0xCu);
  }
  double v11 = [(MTAAlarmCollectionViewController *)self dataSource];
  double v12 = [v11 updateAlarm:v7];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005D35C;
  v15[3] = &unk_1000A1AB0;
  v15[4] = self;
  id v16 = v8;
  id v13 = v8;
  id v14 = [v12 addSuccessBlock:v15];
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  [(MTAAlarmCollectionViewController *)self _removeAlarm:a4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D3F0;
  v5[3] = &unk_1000A1428;
  v5[4] = self;
  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:1 completion:v5];
}

- (void)_removeAlarm:(id)a3
{
  id v4 = a3;
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 alarmID];
    *(_DWORD *)buf = 138543362;
    double v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing alarm %{public}@", buf, 0xCu);
  }
  id v7 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v8 = [v7 removeAlarm:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D54C;
  v10[3] = &unk_1000A20B0;
  v10[4] = self;
  id v9 = [v8 addSuccessBlock:v10];
}

- (void)handleContentSizeTransitionFrom:(id)a3
{
  id v4 = [a3 currentAlarmEditController];
  [(MTAAlarmCollectionViewController *)self setAddEditAlarmController:v4];

  id v5 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
  [v5 setDelegate:self];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(MTAAlarmCollectionViewController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v5 = [v4 numberOfAlarms];

  return (int64_t)v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  id v8 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v9 = [v6 row];

  id v10 = [v8 alarmAtRow:v9];

  [v7 refreshUI:v10 animated:0];

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 setEditing:[self isEditing]];
  [v6 setDelegate:self];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  [a4 row:a3];

  [(MTAAlarmCollectionViewController *)self _showAddViewForAlarmAtRow:v5];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v7 bounds];
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v9 != CGSizeZero.width || v10 != height)
  {
    float v14 = v9 / 250.0;
    unint64_t v15 = vcvtms_u32_f32(v14);
    double v16 = v9 + -30.0 + (double)(v15 - 1) * -15.0;
    UIFloorToViewScale();
    double v18 = v17;
    double v19 = v16 - v17 * (double)v15;
    unint64_t v20 = (unint64_t)[v8 row];
    double v21 = -0.0;
    if (!(v20 % v15)) {
      double v21 = v19;
    }
    double width = v18 + v21;
    [(MTAAlarmCollectionViewController *)self cellHeight];
    double height = v22;
  }

  double v23 = width;
  double v24 = height;
  result.double height = v24;
  result.double width = v23;
  return result;
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
}

- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];

    if (!v4) {
      NSLog(@"Attempting to dismiss add or edit controller when there isn't one.");
    }
    double v5 = [(MTAAlarmCollectionViewController *)self addEditAlarmController];
    [v5 saveAlarmOnlyIfEdited:1];
  }
  [(MTAAlarmCollectionViewController *)self setAddEditAlarmController:0];
  id v7 = +[MTAStateStore shared];
  double v6 = +[MTAStateStoreEvent eventWithType:6];
  [v7 pushEvent:v6];
}

- (void)deleteCell:(id)a3
{
  id v4 = a3;
  double v5 = [(MTAAlarmCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  [(MTAAlarmCollectionViewController *)self removeAlarmAtIndexPath:v6];
}

- (void)removeAlarmAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(MTAAlarmCollectionViewController *)self dataSource];
  id v6 = [v4 row];

  id v7 = [v5 alarmAtRow:v6];

  [(MTAAlarmCollectionViewController *)self _removeAlarm:v7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005DAF8;
  v8[3] = &unk_1000A1428;
  v8[4] = self;
  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:1 completion:v8];
}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MTAAlarmCollectionViewController *)self collectionView];
  double v8 = [v7 indexPathForCell:v6];

  double v9 = [(MTAAlarmCollectionViewController *)self dataSource];
  double v10 = [v9 alarmAtRow:[v8 row]];
  id v11 = [v10 mutableCopy];

  [v11 setEnabled:v4];
  double v12 = MTLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 alarmID];
    *(_DWORD *)buf = 138543618;
    double v21 = v13;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting alarm %{public}@ to enabled: %d", buf, 0x12u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005DCE8;
  v16[3] = &unk_1000A1B60;
  id v17 = v11;
  id v18 = v6;
  BOOL v19 = v4;
  id v14 = v6;
  id v15 = v11;
  [(MTAAlarmCollectionViewController *)self _updateAlarm:v15 reload:1 withCompletionBlock:v16];
}

- (void)showAddView
{
}

- (void)dismissAddViewController:(id)a3
{
  BOOL v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 isSuspended] ^ 1;

  [(MTAAlarmCollectionViewController *)self dismissViewControllerAnimated:v5 completion:&stru_1000A21A0];
}

- (id)alarmsLoadedAction
{
  return self->_alarmsLoadedAction;
}

- (void)setAlarmsLoadedAction:(id)a3
{
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (MTAlarmDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MTAAlarmEditViewController)addEditAlarmController
{
  return self->_addEditAlarmController;
}

- (void)setAddEditAlarmController:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
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

- (id)deferredAddingAlarm
{
  return self->_deferredAddingAlarm;
}

- (void)setDeferredAddingAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredAddingAlarm, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_addEditAlarmController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);

  objc_storeStrong(&self->_alarmsLoadedAction, 0);
}

@end