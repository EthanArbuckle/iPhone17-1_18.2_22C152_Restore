@interface CarShareTripKeyboardSearchController
- (CarKeyboardModeController)keyboardMode;
- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4;
- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4 searchHandler:(id)a5;
- (NSArray)focusOrderSubItems;
- (id)dismissHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_attemptToStartShareWithContact:(id)a3;
- (void)_cancelCapabilitiesForUpdatedMatches:(id)a3 previousMatches:(id)a4;
- (void)_cancelDismiss;
- (void)_commitPendingShares;
- (void)_commitShareForCellAtIndexPath:(id)a3;
- (void)_dismissAfterDelay;
- (void)_toggleSharingForContactAtIndexPath:(id)a3;
- (void)_updateSearchResults:(id)a3;
- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4;
- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3;
- (void)handleCancelButtonPressed;
- (void)handleSearchButtonPressedWithText:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setKeyboardMode:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4;
- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateForInteractionModel:(unint64_t)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarShareTripKeyboardSearchController

- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4
{
  return [(CarShareTripKeyboardSearchController *)self initWithContactSearchResults:a3 dataSource:a4 searchHandler:0];
}

- (CarShareTripKeyboardSearchController)initWithContactSearchResults:(id)a3 dataSource:(id)a4 searchHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)CarShareTripKeyboardSearchController;
  v11 = [(CarShareTripKeyboardSearchController *)&v38 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a4);
    id v13 = [v10 copy];
    id searchHandler = v12->_searchHandler;
    v12->_id searchHandler = v13;

    uint64_t v15 = +[NSOrderedSet orderedSetWithArray:v8];
    matches = v12->_matches;
    v12->_matches = (NSOrderedSet *)v15;

    id v17 = objc_alloc((Class)NSSet);
    v18 = +[MSPSharedTripService sharedInstance];
    v19 = [v18 receivers];
    v20 = sub_100099700(v19, &stru_101317050);
    v21 = (NSSet *)[v17 initWithArray:v20];
    alreadySharingHandles = v12->_alreadySharingHandles;
    v12->_alreadySharingHandles = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v12->_cellsByContactStringValue;
    v12->_cellsByContactStringValue = v23;

    objc_initWeak(&location, v12);
    v25 = [MapsThrottler alloc];
    id v26 = &_dispatch_main_q;
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_100AE524C;
    v35 = &unk_101317078;
    objc_copyWeak(&v36, &location);
    v27 = [(MapsThrottler *)v25 initWithInitialValue:0 throttlingInterval:&_dispatch_main_q queue:&v32 updateHandler:1.0];
    inputThrottler = v12->_inputThrottler;
    v12->_inputThrottler = v27;

    v29 = +[MSPSharedTripService sharedInstance];
    [v29 addSendingObserver:v12];

    v30 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v30 registerObserver:v12];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)CarShareTripKeyboardSearchController;
  [(CarShareTripKeyboardSearchController *)&v15 viewDidLoad];
  v3 = [CarTableView alloc];
  v4 = [(CarShareTripKeyboardSearchController *)self view];
  [v4 bounds];
  v5 = -[CarTableView initWithFrame:style:](v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarTableView *)self->_tableView setDelegate:self];
  [(CarTableView *)self->_tableView setDataSource:self];
  v7 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v7];

  [(CarTableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  [(CarTableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"ContactCell"];
  id v8 = [(CarShareTripKeyboardSearchController *)self view];
  [v8 addSubview:self->_tableView];

  id v9 = self->_tableView;
  id v10 = [(CarShareTripKeyboardSearchController *)self view];
  v11 = [v10 safeAreaLayoutGuide];
  LODWORD(v12) = 1148846080;
  id v13 = [(CarTableView *)v9 _maps_constraintsEqualToEdgesOfLayoutGuide:v11 priority:v12];
  v14 = [v13 allConstraints];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarShareTripKeyboardSearchController;
  [(CarShareTripKeyboardSearchController *)&v8 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = +[MSPSharedTripService sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AE5568;
  v5[3] = &unk_1012EC650;
  objc_copyWeak(&v6, &location);
  [v4 refreshSharingIdentityWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarShareTripKeyboardSearchController;
  [(CarShareTripKeyboardSearchController *)&v4 viewWillDisappear:a3];
  [(CarShareTripKeyboardSearchController *)self _commitPendingShares];
  [(CarShareTripKeyboardSearchController *)self _cancelDismiss];
}

- (void)updateForInteractionModel:(unint64_t)a3
{
  [(CarTableView *)self->_tableView setScrollEnabled:a3 != 1];
}

- (void)handleSearchButtonPressedWithText:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(CarShareTripKeyboardSearchController *)self keyboardMode];
  v5 = [v4 chromeViewController];
  [v5 captureUserAction:2014];

  id searchHandler = self->_searchHandler;
  if (searchHandler)
  {
    v7 = (void (**)(id, id, void *))objc_retainBlock(searchHandler);
    objc_super v8 = [(NSOrderedSet *)self->_matches array];
    v7[2](v7, v9, v8);
  }
}

- (void)handleCancelButtonPressed
{
  id v3 = [(CarShareTripKeyboardSearchController *)self keyboardMode];
  v2 = [v3 chromeViewController];
  [v2 captureUserAction:2003];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  if ([v4 isActive])
  {
    v5 = [v4 searchBar];
    id v6 = [v5 text];

    [(MapsThrottler *)self->_inputThrottler setValue:v6];
    v7 = sub_100576A9C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      inputThrottler = self->_inputThrottler;
      int v9 = 138478083;
      id v10 = v6;
      __int16 v11 = 2112;
      double v12 = inputThrottler;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updating input to '%{private}@' (throttler: %@)", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_updateSearchResults:(id)a3
{
  id v4 = a3;
  v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138477827;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Searching for '%{private}@'", (uint8_t *)&v9, 0xCu);
  }

  -[CarTableView scrollRectToVisible:animated:](self->_tableView, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
  if ([v4 length])
  {
    id v6 = +[MSPSharedTripContact _maps_contactsMatchingQuery:v4];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }
  v7 = +[NSOrderedSet orderedSetWithArray:v6];
  matches = self->_matches;
  self->_matches = v7;

  [(CarTableView *)self->_tableView reloadData];
}

- (void)_cancelCapabilitiesForUpdatedMatches:(id)a3 previousMatches:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = +[NSMutableSet setWithArray:v5];
    if ([v10 count])
    {
      v7 = +[NSSet setWithArray:v10];
      [v6 minusSet:v7];
    }
    if ([v6 count])
    {
      objc_super v8 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      int v9 = [v6 allObjects];
      [v8 cancelCapabilityLevelRequestForContacts:v9];
    }
  }
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  id v5 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = self;
  id v6 = self->_matches;
  id v7 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
        __int16 v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v12 = [v11 stringValue:v19];
        if ([v5 containsObject:v12])
        {
          cellsByContactStringValue = v19->_cellsByContactStringValue;
          v14 = [v11 stringValue];
          objc_super v15 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v14];

          v16 = +[MSPSharedTripService sharedInstance];
          id v20 = 0;
          id v17 = [v16 capabilityTypeForContact:v11 serviceName:&v20 isActiveReceiver:0];
          id v18 = v20;

          [v15 setCapabilityType:v17 serviceName:v18];
        }
      }
      id v8 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)_toggleSharingForContactAtIndexPath:(id)a3
{
  id v4 = -[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", [a3 row]);
  if (v4)
  {
    id v5 = v4;
    [(SharedTripSuggestionsDataSource *)self->_dataSource toggleContact:v4];
    [(CarShareTripKeyboardSearchController *)self _dismissAfterDelay];
    id v4 = v5;
  }
}

- (void)_dismissAfterDelay
{
  [(CarShareTripKeyboardSearchController *)self _cancelDismiss];
  id v3 = [(CarShareTripKeyboardSearchController *)self dismissHandler];

  if (v3)
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100AE5E24;
    v6[3] = &unk_1012E73C8;
    objc_copyWeak(&v7, &location);
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v6 block:7.0];
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelDismiss
{
  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    [(NSTimer *)dismissTimer invalidate];
    id v4 = self->_dismissTimer;
    self->_dismissTimer = 0;
  }
}

- (void)_commitPendingShares
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 sharingState] == (id)1)
        {
          [v8 setDelegate:0];
          uint64_t v9 = [(CarTableView *)self->_tableView indexPathForCell:v8];
          [(CarShareTripKeyboardSearchController *)self _commitShareForCellAtIndexPath:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSOrderedSet *)self->_matches count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = -[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  cellsByContactStringValue = self->_cellsByContactStringValue;
  id v7 = [v5 stringValue];
  id v8 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v7];

  if (v8)
  {
    unint64_t v9 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v5];
    long long v10 = v8;
    uint64_t v11 = 1;
  }
  else
  {
    long long v12 = [v5 stringValue];
    id v13 = [v12 length];

    id v8 = [(CarShareTripContactCell *)[CarShareTripContactSearchResultCell alloc] initWithStyle:0 reuseIdentifier:0];
    if (!v13) {
      goto LABEL_6;
    }
    v14 = self->_cellsByContactStringValue;
    objc_super v15 = [v5 stringValue];
    [(NSMutableDictionary *)v14 setObject:v8 forKey:v15];

    [(CarShareTripContactCell *)v8 setDelegate:self];
    [(CarShareTripContactSearchResultCell *)v8 configureWithMSPSharedTripContact:v5];
    unint64_t v9 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v5];
    long long v10 = v8;
    uint64_t v11 = 0;
  }
  [(CarShareTripContactCell *)v10 setSharingState:v9 animated:v11];
LABEL_6:
  v16 = +[MSPSharedTripService sharedInstance];
  id v20 = 0;
  id v17 = [v16 capabilityTypeForContact:v5 serviceName:&v20 isActiveReceiver:0];
  id v18 = v20;

  [(CarShareTripContactCell *)v8 setCapabilityType:v17 serviceName:v18];

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = [a4 contactValue:a3];
  if (v5)
  {
    uint64_t v6 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    id v8 = v5;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [v6 requestCapabilityLevelsForContacts:v7];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  [a4 contactValue:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v5 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v5 cancelCapabilityLevelRequestForContact:v6];
  }
}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  id v4 = [(CarTableView *)self->_tableView indexPathForCell:a3];
  [(CarShareTripKeyboardSearchController *)self _commitShareForCellAtIndexPath:v4];
}

- (void)_commitShareForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = -[NSOrderedSet objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", [v4 row]);
    if (![(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v5]) {
      [(CarShareTripKeyboardSearchController *)self _toggleSharingForContactAtIndexPath:v6];
    }

    id v4 = v6;
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(CarShareTripKeyboardSearchController *)self _cancelDismiss];
  uint64_t v11 = [v10 nextFocusedIndexPath];

  long long v12 = [(char *)[v8 numberOfRowsInSection:[v11 section]]];
  if ([v11 row] == v12 - 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100AE6534;
    v13[3] = &unk_1012E5D08;
    id v14 = v8;
    [v9 addCoordinatedAnimations:0 completion:v13];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a4;
  self->_userInteracted = 1;
  id v6 = a3;
  [(CarShareTripKeyboardSearchController *)self _cancelDismiss];
  [v6 deselectRowAtIndexPath:v15 animated:1];

  id v7 = [v15 row];
  if (v7 < (id)[(NSOrderedSet *)self->_matches count])
  {
    id v8 = [(NSOrderedSet *)self->_matches objectAtIndexedSubscript:v7];
    cellsByContactStringValue = self->_cellsByContactStringValue;
    id v10 = [v8 stringValue];
    uint64_t v11 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v10];

    id v12 = [v11 sharingState];
    if (v12 == (id)1)
    {
      [v11 setSharingState:[self->_dataSource sharingStateForContact:v8] animated:0];
    }
    else
    {
      if (!v12)
      {
        [(CarShareTripKeyboardSearchController *)self _attemptToStartShareWithContact:v8];
LABEL_8:

        goto LABEL_9;
      }
      [(CarShareTripKeyboardSearchController *)self _toggleSharingForContactAtIndexPath:v15];
    }
    id v13 = [(CarShareTripKeyboardSearchController *)self keyboardMode];
    id v14 = [v13 chromeViewController];
    [v14 captureUserAction:9026];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_attemptToStartShareWithContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AE6914;
  v19[3] = &unk_1012E6690;
  objc_copyWeak(&v21, &location);
  id v5 = v4;
  id v20 = v5;
  id v6 = objc_retainBlock(v19);
  id v7 = [(CarShareTripKeyboardSearchController *)self keyboardMode];
  id v8 = [v7 chromeViewController];

  id v9 = self->_sharingIdentity;
  id v10 = +[MSPSharedTripService sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100AE69E4;
  v14[3] = &unk_1013170C8;
  objc_copyWeak(&v18, &location);
  v14[4] = self;
  uint64_t v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  id v13 = v6;
  id v17 = v13;
  [v10 fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  id v8 = a4;
  objc_storeStrong((id *)&self->_sharingIdentity, a4);
  if (([v8 hasValidAccount] & 1) == 0)
  {
    id v6 = +[CarChromeModeCoordinator sharedInstance];
    id v7 = [(CarShareTripKeyboardSearchController *)self keyboardMode];
    [v6 popFromContext:v7];
  }
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
}

- (NSArray)focusOrderSubItems
{
  if ([(CarShareTripKeyboardSearchController *)self isViewLoaded])
  {
    id v3 = [(CarTableView *)self->_tableView _car_visibleCells];
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (CarKeyboardModeController)keyboardMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardMode);

  return (CarKeyboardModeController *)WeakRetained;
}

- (void)setKeyboardMode:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_destroyWeak((id *)&self->_keyboardMode);
  objc_storeStrong((id *)&self->_inputThrottler, 0);
  objc_storeStrong(&self->_searchHandler, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alreadySharingHandles, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_matches, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end