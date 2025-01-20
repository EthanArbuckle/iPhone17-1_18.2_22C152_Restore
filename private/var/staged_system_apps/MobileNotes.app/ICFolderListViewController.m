@interface ICFolderListViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (ICFolderCreationController)folderCreationController;
- (ICFolderDataSource)folderDataSource;
- (ICFolderListCollectionView)collectionView;
- (ICFolderListViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 overrideContainerIdentifier:(id)a5;
- (ICItemIdentifier)overrideContainerIdentifier;
- (ICManagedObjectContextChangeController)managedObjectContextChangeController;
- (ICOutlineParentCollectionViewCell)tagHeadingCell;
- (ICToolbarSummaryView)summaryView;
- (NSManagedObjectID)recentlyCreatedFolderObjectID;
- (UIBarButtonItem)addFolderButton;
- (UISpringLoadedInteractionContext)currentSpringLoadedInteractionContext;
- (double)availableWidthForSummaryView;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (id)noteContainerWithItemIdentifier:(id)a3;
- (void)addFolderButtonAction:(id)a3;
- (void)addNoteButtonPressed:(id)a3 event:(id)a4;
- (void)addPermanentObservers;
- (void)checkIfShouldShowOrHideAllowNotificationsView;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)confirmFocusedCellSelection;
- (void)confirmSelection;
- (void)dataSourceDataUpdateDidRender:(id)a3;
- (void)dealloc;
- (void)debugButtonPressed:(id)a3;
- (void)folderWasCreated:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForTraitChanges;
- (void)reloadListWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)scrollToContainerWithObjectID:(id)a3;
- (void)scrollToRecentlyCreatedFolderIfNeeded;
- (void)selectItemWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setAddFolderButton:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCurrentSpringLoadedInteractionContext:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolderCreationController:(id)a3;
- (void)setFolderDataSource:(id)a3;
- (void)setManagedObjectContextChangeController:(id)a3;
- (void)setRecentlyCreatedFolderObjectID:(id)a3;
- (void)setSummaryView:(id)a3;
- (void)updateAppearanceStyle;
- (void)updateContainerSelection;
- (void)updateNavigationBar;
- (void)updateNavigationTitle;
- (void)updateSummaryView;
- (void)updateTagHeadingCell;
- (void)updateTagOperatorPosition;
- (void)updateToolbarAnimated:(BOOL)a3;
- (void)userNotificationRegistrationCompleted:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICFolderListViewController

- (void)updateNavigationTitle
{
  unsigned int v4 = [(ICBaseViewController *)self isShowingActiveSearch];
  char v5 = v4;
  if (v4)
  {
    [(ICBaseViewController *)self searchNavigationTitle];
  }
  else
  {
    v2 = +[NSBundle mainBundle];
    [v2 localizedStringForKey:@"Folders" value:&stru_10063F3D8 table:0];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(ICFolderListViewController *)self navigationItem];
  [v6 setTitle:v7];

  if ((v5 & 1) == 0)
  {

    id v7 = v2;
  }
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableSet set];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v43;
    v40 = self;
    do
    {
      v10 = 0;
      v39 = "hostApplicationIdentifier";
      do
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 objectID];
          [v6 addObject:v13];

          v14 = [v12 noteContainerAccount];

          if (v14)
          {
            id v15 = [v12 noteContainerAccount];
            v16 = [v15 objectID];
            [v6 ic_addNonNilObject:v16];

            goto LABEL_28;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (id v19 = v11) != 0)
              {
                id v12 = v19;
                id v15 = [v19 store];
                v20 = [v12 store];
                v21 = [v20 account];
                v22 = [v21 defaultStore];
                v23 = [v22 objectID];
                [v6 ic_addNonNilObject:v23];

                self = v40;
                if (!v15) {
                  goto LABEL_28;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  id v15 = 0;
                  id v12 = 0;
                  goto LABEL_28;
                }
                id v15 = v11;
                id v12 = 0;
                if (!v15)
                {
LABEL_28:

                  goto LABEL_29;
                }
              }
              v24 = [v15 objectID:v39];
              [v6 ic_addNonNilObject:v24];

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_28;
              }
              v25 = v15;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_30;
              }
              id v28 = v11;
              v29 = [v28 owner];
              v30 = [v29 store];
              v31 = [v30 objectID];
              [v6 ic_addNonNilObject:v31];

              id v12 = [v28 owner];

              v25 = [v12 store];
              id v15 = v25;
            }
            v32 = [v25 account];
            v33 = [v32 objectID];
            [v6 ic_addNonNilObject:v33];

            goto LABEL_28;
          }
          v17 = [v11 changedValues];
          id v12 = [v17 allKeys];

          v18 = ICKeyPathFromSelector();
          if ([v12 containsObject:v18])
          {

LABEL_23:
            [v11 objectID:v39];
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            [v6 ic_addNonNilObject:v15];
            goto LABEL_28;
          }
          v26 = ICKeyPathFromSelector();
          unsigned int v27 = [v12 containsObject:v26];

          self = v40;
          if (v27) {
            goto LABEL_23;
          }
        }
LABEL_29:

LABEL_30:
        v34 = [(ICFolderListViewController *)self folderDataSource];
        v35 = [v34 allSmartFolderObjectIDs];
        v36 = [v35 allObjects];
        [v6 ic_addObjectsFromNonNilArray:v36];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v8);
  }

  id v37 = [v6 copy];

  return v37;
}

- (void)sceneDidActivate:(id)a3
{
  unsigned int v4 = [a3 object];
  id v5 = [(ICFolderListViewController *)self viewIfLoaded];
  v6 = [v5 window];
  id v7 = [v6 windowScene];
  unsigned int v8 = [v4 isEqual:v7];

  if (v8)
  {
    if ([(ICFolderListViewController *)self ic_isViewVisible])
    {
      uint64_t v9 = [(ICFolderListViewController *)self eventReporter];
      [v9 startFolderListViewEventDurationTracking];
    }
    [(ICFolderListViewController *)self checkIfShouldShowOrHideAllowNotificationsView];
  }
}

- (void)reloadListWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(ICFolderListViewController *)self dataSource];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032A10;
  v10[3] = &unk_100625B40;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 reloadDataAnimated:0 dataIndexedBlock:v7 dataRenderedBlock:v10];
}

- (void)updateAppearanceStyle
{
  v3 = [(ICFolderListViewController *)self traitCollection];
  unsigned int v4 = (char *)[v3 _splitViewControllerContext];

  unint64_t v5 = (unint64_t)(v4 - 3);
  BOOL v6 = (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL;
  id v7 = [(ICFolderListViewController *)self folderDataSource];
  [v7 setHasGroupInset:v6];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    if (v5 > 0xFFFFFFFFFFFFFFFDLL) {
      +[UIColor secondarySystemBackgroundColor];
    }
    else {
    id v9 = +[UIColor ICGroupedBackgroundColor];
    }
    unsigned int v8 = [(ICFolderListViewController *)self collectionView];
    [v8 setBackgroundColor:v9];
  }
}

- (ICFolderListViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 overrideContainerIdentifier:(id)a5
{
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICFolderListViewController;
  v10 = [(ICBaseViewController *)&v29 initWithViewMode:a3 viewControllerManager:a4 viewControllerType:2];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_overrideContainerIdentifier, a5);
    id v12 = [(ICBaseViewController *)v11 legacyViewContext];
    v13 = [(ICBaseViewController *)v11 modernViewContext];
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, 0);

    id v15 = (ICManagedObjectContextChangeController *)[objc_alloc((Class)ICManagedObjectContextChangeController) initWithManagedObjectContexts:v14 delegate:v11];
    managedObjectContextChangeController = v11->_managedObjectContextChangeController;
    v11->_managedObjectContextChangeController = v15;

    v17 = [[ICFolderCreationController alloc] initWithViewController:v11 noteContainer:0 creationApproach:1];
    folderCreationController = v11->_folderCreationController;
    v11->_folderCreationController = v17;

    id v19 = [ICFolderListCollectionView alloc];
    v20 = [(ICBaseViewController *)v11 legacyViewContext];
    v21 = [(ICBaseViewController *)v11 modernViewContext];
    v22 = [(ICBaseViewController *)v11 viewControllerManager];
    v23 = [(ICFolderListCollectionView *)v19 initWithPresentingViewController:v11 legacyManagedObjectContext:v20 modernManagedObjectContext:v21 viewControllerManager:v22];
    collectionView = v11->_collectionView;
    v11->_collectionView = v23;

    v25 = [(ICFolderListViewController *)v11 folderDataSource];
    v26 = [v25 collectionViewDiffableDataSource];
    [(ICCollectionView *)v11->_collectionView setDiffableDataSource:v26];

    [(ICFolderListCollectionView *)v11->_collectionView setDelegate:v11];
    [(ICFolderListCollectionView *)v11->_collectionView setContentInsetAdjustmentBehavior:0];
    [(ICFolderListViewController *)v11 updateAppearanceStyle];
    unsigned int v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v11 selector:"sceneDidActivate:" name:UISceneDidActivateNotification object:0];
    [v27 addObserver:v11 selector:"sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:0];
    [v27 addObserver:v11 selector:"userNotificationRegistrationCompleted:" name:ICUserNotificationRegistrationCompleted object:0];
    [v27 addObserver:v11 selector:"keyboardWillShow:" name:UIKeyboardDidShowNotification object:0];
    [(ICFolderListViewController *)v11 updateNavigationTitle];
  }
  return v11;
}

- (ICFolderDataSource)folderDataSource
{
  folderDataSource = self->_folderDataSource;
  if (folderDataSource)
  {
    v3 = folderDataSource;
  }
  else
  {
    unint64_t v5 = [(ICBaseViewController *)self viewControllerManager];
    BOOL v6 = [v5 persistenceConfiguration];
    v22 = [v6 legacyViewContext];

    id v7 = [(ICBaseViewController *)self viewControllerManager];
    unsigned int v8 = [v7 persistenceConfiguration];
    v21 = [v8 modernBackgroundContext];

    objc_initWeak(location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005F864;
    v29[3] = &unk_100626718;
    objc_copyWeak(&v30, location);
    id v9 = objc_retainBlock(v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005FAB8;
    v27[3] = &unk_1006253D8;
    objc_copyWeak(&v28, location);
    v10 = objc_retainBlock(v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10005FB9C;
    v25[3] = &unk_100625938;
    objc_copyWeak(&v26, location);
    id v11 = objc_retainBlock(v25);
    id v12 = [ICFolderDataSource alloc];
    v13 = [(ICFolderListViewController *)self collectionView];
    v14 = [(ICFolderListViewController *)self overrideContainerIdentifier];
    id v15 = [(ICBaseViewController *)self unsupportedFolderInfoButtonTapHandler];
    v16 = [(ICFolderDataSource *)v12 initWithCollectionView:v13 presentingViewController:self legacyManagedObjectContext:v22 modernManagedObjectContext:v21 overrideContainerIdentifier:v14 unsupportedFolderInfoButtonTapHandler:v15 accountUpgradeButtonTapHandlerProvider:v9 tagSelectionDidChangeHandler:v10 allowNotificationsCloseHandler:v11];
    v17 = self->_folderDataSource;
    self->_folderDataSource = v16;

    v18 = +[ICNoteContext sharedContext];
    id v19 = [v18 workerManagedObjectContext];
    [(ICFolderDataSource *)self->_folderDataSource setApplySnapshotModernManagedObjectContext:v19];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10005FC24;
    v23[3] = &unk_100626740;
    objc_copyWeak(&v24, location);
    [(ICFolderDataSource *)self->_folderDataSource setWillExpandItemHandler:v23];
    v3 = self->_folderDataSource;
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }

  return v3;
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  return self->_overrideContainerIdentifier;
}

- (ICFolderListCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  unsigned int v4 = +[ICAppDelegate sharedInstance];
  unint64_t v5 = [v4 cloudContextDelegate];
  BOOL v6 = ICKeyPathFromSelector();
  [v5 ic_removeObserver:self forKeyPath:v6 context:&off_100698DC0];

  id v7 = [(ICBaseViewController *)self viewControllerManager];
  [v7 ic_removeObserver:self forKeyPath:@"selectedContainerIdentifiers" context:&off_100698DC0];

  unsigned int v8 = [(ICBaseViewController *)self viewControllerManager];
  [v8 ic_removeObserver:self forKeyPath:@"selectedContainerItemID" context:&off_100698DC0];

  v9.receiver = self;
  v9.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v9 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)ICFolderListViewController;
  [(ICFolderListViewController *)&v4 loadView];
  v3 = [(ICFolderListViewController *)self collectionView];
  [(ICFolderListViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v3 viewDidLoad];
  [(ICFolderListViewController *)self updateNavigationTitle];
  [(ICFolderListViewController *)self addPermanentObservers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v19 viewWillAppear:a3];
  objc_super v4 = [(ICFolderListViewController *)self managedObjectContextChangeController];
  [v4 performUpdatesIfNeeded];

  unint64_t v5 = [(ICFolderListViewController *)self transitionCoordinator];
  if (v5)
  {
    BOOL v6 = [(ICFolderListViewController *)self transitionCoordinator];
    if ([v6 isInteractive])
    {
      [(ICFolderListViewController *)self updateToolbarAnimated:0];
    }
    else
    {
      id v7 = [(ICFolderListViewController *)self transitionCoordinator];
      -[ICFolderListViewController updateToolbarAnimated:](self, "updateToolbarAnimated:", [v7 isCancelled] ^ 1);
    }
  }
  else
  {
    [(ICFolderListViewController *)self updateToolbarAnimated:0];
  }

  [(ICFolderListViewController *)self updateNavigationBar];
  [(ICFolderListViewController *)self updateTagOperatorPosition];
  [(ICFolderListViewController *)self updateContainerSelection];
  [(ICFolderListViewController *)self updateAppearanceStyle];
  if ([(ICFolderListViewController *)self ic_isBeingRevealedFromPoppingViewController])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005DED4;
    v18[3] = &unk_100625AF0;
    v18[4] = self;
    unsigned int v8 = objc_retainBlock(v18);
    objc_super v9 = [(ICFolderListViewController *)self transitionCoordinator];
    unsigned int v10 = [v9 isInteractive];

    if (v10)
    {
      id v11 = [(ICFolderListViewController *)self transitionCoordinator];
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_10005DFFC;
      v16 = &unk_100625E18;
      v17 = v8;
      [v11 notifyWhenInteractionChangesUsingBlock:&v13];
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
  [(ICFolderListViewController *)self checkIfShouldShowOrHideAllowNotificationsView];
  [(ICFolderListViewController *)self updateTagHeadingCell];
  id v12 = +[NotesApp sharedNotesApp];
  [v12 refreshStoresListIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ICFolderListViewController;
  [(ICFolderListViewController *)&v5 viewDidLayoutSubviews];
  objc_super v3 = +[UIApplication sharedApplication];
  if ([v3 isRunningTest])
  {
    unsigned int v4 = [(ICFolderListViewController *)self _appearState];

    if (v4 != 1) {
      return;
    }
    objc_super v3 = +[ICAppDelegate sharedInstance];
    [v3 folderListDidLayoutSubviews];
  }
}

- (void)sceneWillDeactivate:(id)a3
{
  unsigned int v4 = [a3 object];
  objc_super v5 = [(ICFolderListViewController *)self viewIfLoaded];
  BOOL v6 = [v5 window];
  id v7 = [v6 windowScene];
  unsigned int v8 = [v4 isEqual:v7];

  if (v8 && [(ICFolderListViewController *)self ic_isViewVisible])
  {
    id v9 = [(ICFolderListViewController *)self eventReporter];
    [v9 submitFolderListViewEvent];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICFolderListViewController;
  [(ICFolderListViewController *)&v5 viewWillDisappear:a3];
  unsigned int v4 = [(ICFolderListViewController *)self eventReporter];
  [v4 submitFolderListViewEvent];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v9 viewDidAppear:a3];
  if ([(ICFolderListViewController *)self canBecomeFirstResponder]) {
    [(ICFolderListViewController *)self becomeFirstResponder];
  }
  unsigned int v4 = +[ICAppDelegate sharedInstance];
  [v4 didFinishExtendedLaunch];

  objc_super v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 isRunningTest];

  if (v6)
  {
    id v7 = +[ICAppDelegate sharedInstance];
    [v7 didShowFolderList];
  }
  unsigned int v8 = [(ICFolderListViewController *)self eventReporter];
  [v8 startFolderListViewEventDurationTracking];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(ICFolderListViewController *)self isEditing] != a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)ICFolderListViewController;
    [(ICBaseViewController *)&v28 setEditing:v5 animated:v4];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [(ICFolderListViewController *)self collectionView];
    unsigned int v8 = [v7 indexPathsForVisibleItems];

    id obj = v8;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v12);
          objc_opt_class();
          uint64_t v14 = [(ICFolderListViewController *)self collectionView];
          id v15 = [v14 cellForItemAtIndexPath:v13];
          v16 = ICDynamicCast();

          if (([v16 allowsEditing] & 1) == 0) {
            [v16 setEditing:v5];
          }
          if (v5) {
            [v16 setSelected:0];
          }
          [v16 setNeedsUpdateConfiguration];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    v17 = [(ICFolderListViewController *)self dataSource];
    v18 = [v17 collectionViewDiffableDataSource];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005E590;
    v22[3] = &unk_100625D18;
    v22[4] = self;
    BOOL v23 = v5;
    [v18 _performBatchApplyUsingReloadData:v22];

    objc_super v19 = [(ICFolderListViewController *)self collectionView];
    [v19 setEditing:v5];

    if (v5)
    {
      v20 = +[NSNotificationCenter defaultCenter];
      [v20 postNotificationName:@"ICFolderListViewControllerDidStartEditingNotification" object:self];
    }
    else
    {
      [(ICFolderListViewController *)self updateContainerSelection];
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ICFolderListViewController *)self dataSource];
  id v10 = [v9 collectionViewDiffableDataSource];

  uint64_t v11 = [v10 itemIdentifierForIndexPath:v8];

  id v12 = [v10 snapshot];
  uint64_t v13 = [v12 sectionIdentifierForSectionContainingItemIdentifier:v11];

  uint64_t v14 = [v10 snapshotForSection:v13];
  id v15 = [v14 childrenOfParent:v11];
  if (![v15 count])
  {

    goto LABEL_5;
  }
  unsigned __int8 v16 = [v14 isExpanded:v11];

  if (v16)
  {
LABEL_5:
    [(ICFolderListViewController *)self setCurrentSpringLoadedInteractionContext:0];
    BOOL v18 = 0;
    goto LABEL_6;
  }
  [(ICFolderListViewController *)self setCurrentSpringLoadedInteractionContext:v7];
  v17 = [(ICFolderListViewController *)self currentSpringLoadedInteractionContext];
  [v17 setTargetItem:v11];

  BOOL v18 = 1;
LABEL_6:

  return v18;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = [(ICFolderListViewController *)self dataSource];
  id v9 = [v8 collectionViewDiffableDataSource];
  id v10 = [v9 itemIdentifierForIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    id v12 = [(ICFolderListViewController *)self traitCollection];
    uint64_t v13 = (uint64_t)[v12 _splitViewControllerContext];

    if (v13 >= 1)
    {
      uint64_t v14 = [(ICBaseViewController *)self viewControllerManager];
      id v15 = [v14 selectedContainerItemID];
      if ([v11 isEqual:v15])
      {
        unsigned __int8 v16 = [(ICFolderListViewController *)self isEditing];

        if ((v16 & 1) == 0) {
          [v22 setSelected:1];
        }
      }
      else
      {
      }
    }
    objc_super v19 = [(ICFolderListViewController *)self recentlyCreatedFolderObjectID];
    unsigned int v20 = [v11 isEqual:v19];

    if (v20)
    {
      objc_opt_class();
      v21 = ICDynamicCast();
      [v21 setRecentlyCreated:1];

      [(ICFolderListViewController *)self setRecentlyCreatedFolderObjectID:0];
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 sectionType] != (id)8) {
      goto LABEL_18;
    }
LABEL_15:
    objc_opt_class();
    ICDynamicCast();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v17 = [(ICBaseViewController *)self viewControllerManager];
    BOOL v18 = [v17 tagSelection];
    [v11 setTagSelection:v18];
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v17 = [(ICBaseViewController *)self viewControllerManager];
  BOOL v18 = [v17 tagSelection];
  [v11 selectTagsWithTagSelection:v18 animated:0];
LABEL_16:

LABEL_17:
LABEL_18:
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(ICFolderListViewController *)self dataSource];
  id v7 = [v6 collectionViewDiffableDataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(ICFolderListViewController *)self dataSource];
  id v7 = [v6 collectionViewDiffableDataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v5];

  id v9 = [(ICFolderListViewController *)self currentSpringLoadedInteractionContext];
  id v10 = [v9 targetItem];
  if ([v10 isEqual:v8])
  {
    id v11 = [(ICFolderListViewController *)self currentSpringLoadedInteractionContext];
    id v12 = [v11 state];

    if (v12 == (id)3)
    {
      [(ICFolderListViewController *)self setCurrentSpringLoadedInteractionContext:0];
      uint64_t v13 = [(ICFolderListViewController *)self folderDataSource];
      v21 = v8;
      uint64_t v14 = +[NSArray arrayWithObjects:&v21 count:1];
      [v13 expandItemsWithIdentifiers:v14 completion:0];

      BOOL v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_opt_class();
  unsigned __int8 v16 = ICDynamicCast();
  if (!objc_msgSend(v16, "ic_isModernFolderType")) {
    goto LABEL_8;
  }
  uint64_t v17 = +[ICNoteContext sharedContext];
  BOOL v18 = [(id)v17 managedObjectContext];
  objc_super v19 = [v18 ic_existingObjectWithID:v16];

  LOBYTE(v17) = [v19 isUnsupported];
  if (v17) {
    BOOL v15 = 0;
  }
  else {
LABEL_8:
  }
    BOOL v15 = 1;

LABEL_10:
  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  [(ICFolderListViewController *)self becomeFirstResponder];
  unsigned int v6 = [(ICFolderListViewController *)self dataSource];
  id v7 = [v6 collectionViewDiffableDataSource];
  id v11 = [v7 itemIdentifierForIndexPath:v5];

  if (v11)
  {
    id v8 = [(ICBaseViewController *)self viewControllerManager];
    id v9 = +[NSSet setWithObject:v11];
    id v10 = +[NSSet set];
    [v8 selectContainerWithIdentifiers:v9 excludingIdentifiers:v10 usingRootViewController:1 deferUntilDataLoaded:1 animated:1];

    [(ICFolderListViewController *)self updateTagHeadingCell];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if ([v6 count] == (id)1)
  {
    id v7 = [(ICFolderListViewController *)self collectionView];
    id v8 = [v7 contextMenuConfigurationForItemsAtIndexPaths:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ICFolderListViewController *)self collectionView];
  id v10 = [v9 contextMenuPreviewForHighlightingMenuWithConfiguration:v8 indexPath:v7];

  return v10;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ICFolderListViewController *)self collectionView];
  id v10 = [v9 contextMenuPreviewForDismissingContextMenuWithConfiguration:v8 indexPath:v7];

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ICFolderListViewController *)self collectionView];
  [v9 contextMenuWillPerformPreviewActionForMenuWithConfiguration:v8 animator:v7];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICFolderListViewController *)self collectionView];
  unsigned __int8 v7 = [v6 canFocusItemAtIndexPath:v5];

  return v7;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (![v9 isEditing] || objc_msgSend(v9, "hasActiveDrag"))
  {
    id v12 = v11;
    goto LABEL_14;
  }
  uint64_t v13 = [(ICFolderListViewController *)self dataSource];
  uint64_t v14 = [v13 collectionViewDiffableDataSource];

  BOOL v15 = [v14 itemIdentifierForIndexPath:v10];
  unsigned __int8 v16 = [v14 itemIdentifierForIndexPath:v11];
  objc_opt_class();
  uint64_t v17 = ICDynamicCast();
  BOOL v18 = [(ICFolderListViewController *)self noteContainerWithItemIdentifier:v15];
  objc_super v19 = [(ICFolderListViewController *)self noteContainerWithItemIdentifier:v16];
  if (objc_msgSend(v17, "ic_isModernFolderType"))
  {
    long long v27 = v14;
    objc_super v28 = v15;
    uint64_t v20 = [v19 noteContainerAccount];

    objc_super v19 = (void *)v20;
LABEL_9:
    id v21 = objc_alloc((Class)ICMoveDecision);
    objc_super v29 = v18;
    id v22 = +[NSArray arrayWithObjects:&v29 count:1];
    BOOL v23 = v18;
    id v24 = [v21 initWithSourceObjects:v22 destination:v19];

    if ([v24 shouldMove]) {
      long long v25 = v11;
    }
    else {
      long long v25 = v10;
    }
    id v12 = v25;

    BOOL v18 = v23;
    uint64_t v14 = v27;
    BOOL v15 = v28;
    goto LABEL_13;
  }
  if (!objc_msgSend(v17, "ic_isLegacyFolderType"))
  {
    long long v27 = v14;
    objc_super v28 = v15;
    goto LABEL_9;
  }
  id v12 = v10;
LABEL_13:

LABEL_14:

  return v12;
}

- (void)addPermanentObservers
{
  objc_super v3 = +[ICAppDelegate sharedInstance];
  BOOL v4 = [v3 cloudContextDelegate];
  id v5 = ICKeyPathFromSelector();
  [v4 ic_addObserver:self forKeyPath:v5 context:&off_100698DC0];

  id v6 = [(ICBaseViewController *)self viewControllerManager];
  [v6 ic_addObserver:self forKeyPath:@"selectedContainerItemID" context:&off_100698DC0];

  unsigned __int8 v7 = [(ICBaseViewController *)self viewControllerManager];
  [v7 ic_addObserver:self forKeyPath:@"selectedContainerIdentifiers" context:&off_100698DC0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"folderWasCreated:" name:@"ICFolderCreationControllerFolderWasCreatedNotification" object:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(ICFolderListViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Folder/ICFolderListViewController.m"])
  {
    unsigned __int8 v13 = [(ICFolderListViewController *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];

    if (a6 == &off_100698DC0 && (v13 & 1) == 0)
    {
      uint64_t v14 = +[ICAppDelegate sharedInstance];
      id v15 = [v14 cloudContextDelegate];

      if (v15 == v11)
      {
        uint64_t v17 = ICKeyPathFromSelector();
        unsigned int v18 = [v10 isEqualToString:v17];

        if (v18) {
          [(ICFolderListViewController *)self updateSummaryView];
        }
      }
      else
      {
        id v16 = [(ICBaseViewController *)self viewControllerManager];

        if (v16 == v11)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10005F4FC;
          block[3] = &unk_100625AF0;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICFolderListViewController;
    [(ICFolderListViewController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)registerForTraitChanges
{
  v14.receiver = self;
  v14.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v14 registerForTraitChanges];
  objc_initWeak(&location, self);
  uint64_t v17 = objc_opt_class();
  objc_super v3 = +[NSArray arrayWithObjects:&v17 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005F768;
  v11[3] = &unk_100625EB8;
  objc_copyWeak(&v12, &location);
  id v4 = [(ICFolderListViewController *)self registerForTraitChanges:v3 withHandler:v11];

  uint64_t v16 = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:&v16 count:1];
  id v6 = [(ICFolderListViewController *)self registerForTraitChanges:v5 withAction:"updateTagOperatorPosition"];

  uint64_t v15 = objc_opt_class();
  unsigned __int8 v7 = +[NSArray arrayWithObjects:&v15 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F820;
  v9[3] = &unk_100625EB8;
  objc_copyWeak(&v10, &location);
  id v8 = [(ICFolderListViewController *)self registerForTraitChanges:v7 withHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)noteContainerWithItemIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10005FF04;
  uint64_t v16 = sub_10005FF14;
  id v17 = 0;
  if (objc_msgSend(v5, "ic_isModernContainerType"))
  {
    id v6 = [(ICBaseViewController *)self modernViewContext];
    unsigned __int8 v7 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005FF1C;
    v11[3] = &unk_100625700;
    v11[6] = &v12;
    void v11[4] = self;
    v11[5] = v5;
    [v6 performBlockAndWait:v11];
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "ic_isLegacyContainerType"))
  {
    id v6 = [(ICBaseViewController *)self legacyViewContext];
    unsigned __int8 v7 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005FF88;
    v10[3] = &unk_100625700;
    v10[6] = &v12;
    v10[4] = self;
    void v10[5] = v5;
    [v6 performBlockAndWait:v10];
    goto LABEL_7;
  }
LABEL_8:
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

LABEL_9:

  return v8;
}

- (void)updateNavigationBar
{
  objc_super v3 = [(ICFolderListViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:1];

  id v5 = [(ICFolderListViewController *)self editButtonItem];
  id v4 = [(ICFolderListViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

- (void)updateToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICFolderListViewController *)self navigationController];
  id v6 = [v5 topViewController];

  if (v6 == self)
  {
    unsigned __int8 v7 = [(ICFolderListViewController *)self navigationItem];
    id v8 = [v7 searchController];
    id v9 = [v8 isActive];

    id v10 = [(ICFolderListViewController *)self navigationController];
    [v10 setToolbarHidden:v9 animated:v3];
  }
  id v54 = +[NSMutableArray array];
  id v11 = [(ICFolderListViewController *)self folderDataSource];
  id v12 = [v11 countOfModernAccounts];

  if (v12)
  {
    unsigned __int8 v13 = [(ICFolderListViewController *)self addFolderButton];

    if (!v13)
    {
      uint64_t v14 = +[UIImage systemImageNamed:@"folder.badge.plus"];
      id v15 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v14 menu:0];
      [(ICFolderListViewController *)self setAddFolderButton:v15];

      uint64_t v16 = +[NSBundle mainBundle];
      id v17 = [v16 localizedStringForKey:@"Create a folder" value:&stru_10063F3D8 table:0];
      unsigned int v18 = [(ICFolderListViewController *)self addFolderButton];
      [v18 setTitle:v17];

      objc_super v19 = +[NSBundle mainBundle];
      objc_super v20 = [v19 localizedStringForKey:@"New folder" value:&stru_10063F3D8 table:0];
      id v21 = [(ICFolderListViewController *)self addFolderButton];
      [v21 setAccessibilityLabel:v20];

      id v22 = +[NSBundle mainBundle];
      BOOL v23 = [v22 localizedStringForKey:@"Double tap to add a new folder" value:&stru_10063F3D8 table:0];
      id v24 = [(ICFolderListViewController *)self addFolderButton];
      [v24 setAccessibilityHint:v23];
    }
    long long v25 = [(ICFolderListViewController *)self folderDataSource];
    id v26 = [v25 countOfModernAccounts];

    long long v27 = [(ICFolderListViewController *)self addFolderButton];
    objc_super v28 = v27;
    if ((unint64_t)v26 < 2)
    {
      [v27 setTarget:self];

      id v30 = [(ICFolderListViewController *)self addFolderButton];
      [v30 setAction:"addFolderButtonAction:"];
    }
    else
    {
      [v27 setTarget:0];

      objc_super v29 = [(ICFolderListViewController *)self addFolderButton];
      [v29 setAction:0];

      id v30 = [(ICFolderListViewController *)self folderCreationController];
      v31 = [v30 menu];
      v32 = [(ICFolderListViewController *)self addFolderButton];
      [v32 setMenu:v31];
    }
    v33 = [(ICFolderListViewController *)self addFolderButton];
    [v54 addObject:v33];
  }
  v34 = +[UIBarButtonItem ic_itemWithFlexibleSpace];
  [v54 addObject:v34];
  v35 = [(ICBaseViewController *)self viewControllerManager];
  unsigned int v36 = [v35 hasCompactWidth];

  if (v36)
  {
    id v37 = -[ICToolbarSummaryView initWithFrame:]([ICToolbarSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(ICFolderListViewController *)self setSummaryView:v37];

    v38 = [(ICFolderListViewController *)self summaryView];
    [v38 setCountsHidden:1];

    id v39 = objc_alloc((Class)UIBarButtonItem);
    v40 = [(ICFolderListViewController *)self summaryView];
    id v41 = [v39 initWithCustomView:v40];

    [v54 addObject:v41];
    [(ICFolderListViewController *)self updateSummaryView];
    long long v42 = +[UIBarButtonItem ic_itemWithFlexibleSpace];
    [v54 addObject:v42];
  }
  if (ICDebugModeEnabled())
  {
    long long v43 = +[UIImage systemImageNamed:@"gear"];
    id v44 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v43 style:0 target:self action:"debugButtonPressed:"];
    [v44 setTitle:@"Debug"];
    [v54 addObject:v44];
  }
  long long v45 = [(ICBaseViewController *)self viewControllerManager];
  unsigned int v46 = [v45 hasCompactWidth];

  if (v46)
  {
    v47 = +[UIImage systemImageNamed:@"square.and.pencil"];
    id v48 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v47 style:0 target:self action:"addNoteButtonPressed:event:"];
    v49 = +[NSBundle mainBundle];
    v50 = [v49 localizedStringForKey:@"New note" value:&stru_10063F3D8 table:0];
    [v48 setAccessibilityLabel:v50];

    v51 = +[NSBundle mainBundle];
    v52 = [v51 localizedStringForKey:@"Double tap to compose a new note." value:&stru_10063F3D8 table:0];
    [v48 setAccessibilityHint:v52];

    [v54 addObject:v48];
  }
  id v53 = [v54 copy];
  [(ICFolderListViewController *)self setToolbarItems:v53 animated:v3];
}

- (void)addFolderButtonAction:(id)a3
{
  id v3 = [(ICFolderListViewController *)self folderCreationController];
  [v3 promptToAddFolderAllowingSmartFolder:1 withCompletionHandler:0];
}

- (void)updateTagOperatorPosition
{
  uint64_t v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  id v4 = [(ICFolderListViewController *)self folderDataSource];
  [v4 setShouldShowTagOperatorOnSeparateLine:v3];
}

- (void)updateContainerSelection
{
  uint64_t v3 = [(ICFolderListViewController *)self traitCollection];
  uint64_t v4 = (uint64_t)[v3 _splitViewControllerContext];

  if (v4 >= 1)
  {
    id v5 = [(ICBaseViewController *)self viewControllerManager];
    id v6 = [v5 searchController];
    unsigned int v7 = [v6 isActive];

    if (v7)
    {
      id v8 = [(ICFolderListViewController *)self collectionView];
      [v8 ic_deselectAllItems];

      id v29 = [(ICFolderListViewController *)self collectionView];
      [v29 deselectAllTagsAnimated:0];
    }
    else
    {
      id v9 = [(ICBaseViewController *)self viewControllerManager];
      id v10 = [v9 selectedContainerItemID];

      id v11 = [(ICBaseViewController *)self viewControllerManager];
      id v12 = [v11 tagSelection];

      if (v10)
      {
        unsigned __int8 v13 = [(ICFolderListViewController *)self collectionView];
        [v13 deselectAllTagsAnimated:0];

        uint64_t v14 = [(ICFolderListViewController *)self dataSource];
        id v15 = [v14 collectionViewDiffableDataSource];
        uint64_t v16 = [v15 indexPathForItemIdentifier:v10];

        id v17 = [(ICFolderListViewController *)self collectionView];
        id v18 = v17;
        if (v16)
        {
          objc_super v19 = [v17 indexPathsForSelectedItems];

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v18 = v19;
          id v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v31;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v31 != v22) {
                  objc_enumerationMutation(v18);
                }
                id v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if (([v24 isEqual:v16] & 1) == 0)
                {
                  long long v25 = [(ICFolderListViewController *)self collectionView];
                  [v25 deselectItemAtIndexPath:v24 animated:0];
                }
              }
              id v21 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
            }
            while (v21);
          }

          if (([v18 containsObject:v16] & 1) == 0)
          {
            id v26 = [(ICFolderListViewController *)self collectionView];
            [v26 selectItemAtIndexPath:v16 animated:0 scrollPosition:0];
          }
        }
        else
        {
          [v17 ic_deselectAllItems];
        }
      }
      else if ([v12 isNonEmpty])
      {
        long long v27 = [(ICFolderListViewController *)self collectionView];
        [v27 ic_deselectAllItems];

        objc_super v28 = [(ICFolderListViewController *)self collectionView];
        [v28 selectTagsWithTagSelection:v12 animated:0];
      }
    }
  }
}

- (void)updateTagHeadingCell
{
  id v5 = [(ICBaseViewController *)self viewControllerManager];
  uint64_t v3 = [v5 tagSelection];
  uint64_t v4 = [(ICFolderListViewController *)self folderDataSource];
  [v4 setTagSelection:v3];
}

- (void)scrollToRecentlyCreatedFolderIfNeeded
{
  uint64_t v3 = [(ICFolderListViewController *)self recentlyCreatedFolderObjectID];

  if (v3)
  {
    id v4 = [(ICFolderListViewController *)self recentlyCreatedFolderObjectID];
    [(ICFolderListViewController *)self scrollToContainerWithObjectID:v4];
  }
}

- (void)scrollToContainerWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICFolderListViewController *)self dataSource];
  id v6 = [v5 collectionViewDiffableDataSource];
  id v8 = [v6 indexPathForItemIdentifier:v4];

  if (v8)
  {
    unsigned int v7 = [(ICFolderListViewController *)self collectionView];
    [v7 scrollToItemAtIndexPath:v8 atScrollPosition:2 animated:1];
  }
}

- (void)keyboardWillShow:(id)a3
{
  id v10 = [a3 userInfo];
  id v4 = [v10 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;

  unsigned int v7 = [(ICFolderListViewController *)self firstResponder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(ICFolderListViewController *)self collectionView];
    [v9 setContentInset:0.0, 0.0, v6, 0.0];
  }
}

- (void)checkIfShouldShowOrHideAllowNotificationsView
{
  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICFolderListViewController checkIfShouldShowOrHideAllowNotificationsView]", 1, 0, @"Unexpected call from background thread");
  }
  objc_initWeak(&location, self);
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"DidDismissAllowNotificationsView"];

  if (v4)
  {
    double v5 = [(ICFolderListViewController *)self collectionView];
    [v5 setShouldShowAllowNotificationsView:0];
  }
  else
  {
    double v6 = +[ICAppDelegate sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100060E14;
    v7[3] = &unk_100626790;
    objc_copyWeak(&v8, &location);
    [v6 checkIfUserNotificationsAllowed:v7];

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (void)userNotificationRegistrationCompleted:(id)a3
{
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICFolderListViewController;
  [(ICBaseViewController *)&v4 dataSourceDataUpdateDidRender:a3];
  [(ICFolderListViewController *)self updateContainerSelection];
  [(ICFolderListViewController *)self updateToolbarAnimated:0];
  [(ICFolderListViewController *)self scrollToRecentlyCreatedFolderIfNeeded];
  [(ICFolderListViewController *)self updateTagHeadingCell];
}

- (ICOutlineParentCollectionViewCell)tagHeadingCell
{
  uint64_t v3 = [(ICFolderListViewController *)self dataSource];
  objc_super v4 = [v3 collectionViewDiffableDataSource];

  double v5 = [v4 snapshot];
  double v6 = [v5 itemIdentifiers];
  unsigned int v7 = [v6 ic_objectPassingTest:&stru_1006267B0];

  id v8 = [v4 indexPathForItemIdentifier:v7];
  objc_opt_class();
  id v9 = [(ICFolderListViewController *)self collectionView];
  id v10 = [v9 cellForItemAtIndexPath:v8];
  id v11 = ICDynamicCast();

  return (ICOutlineParentCollectionViewCell *)v11;
}

- (void)folderWasCreated:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [v4 object];

  double v6 = ICDynamicCast();
  [(ICFolderListViewController *)self setRecentlyCreatedFolderObjectID:v6];

  unsigned int v7 = [(ICBaseViewController *)self modernViewContext];
  id v8 = [(ICFolderListViewController *)self recentlyCreatedFolderObjectID];
  id v9 = [v7 ic_existingObjectWithID:v8];

  id v10 = [v9 ancestorFolderObjectIDs];
  id v11 = [v10 mutableCopy];

  id v12 = [objc_alloc((Class)ICFolderListSectionIdentifier) initWithObject:v9];
  [v11 ic_addNonNilObject:v12];

  unsigned __int8 v13 = [(ICFolderListViewController *)self folderDataSource];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100061548;
  v14[3] = &unk_100625AF0;
  v14[4] = self;
  [v13 expandItemsWithIdentifiers:v11 completion:v14];
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    double v6 = [(ICFolderListViewController *)self dataSource];
    unsigned int v7 = [v6 collectionViewDiffableDataSource];
    id v8 = [v7 snapshot];
    id v9 = [v8 itemIdentifiers];
    id v10 = [v9 ic_objectsOfClass:objc_opt_class()];
    id v11 = +[NSSet setWithArray:v10];

    id v12 = +[NSMutableSet set];
    [v12 unionSet:v5];
    [v12 unionSet:v11];
    unsigned __int8 v13 = [(ICFolderListViewController *)self dataSource];
    uint64_t v14 = [v13 associatedCellsForItemIdentifiers:v12];

    id v15 = [v14 ic_objectsOfClass:objc_opt_class()];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v20 updateSubfolderCount];
          [v20 updateNoteCount];
          [v20 updateTextAndStatus];
        }
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }
}

- (double)availableWidthForSummaryView
{
  v2 = [(ICFolderListViewController *)self view];
  [v2 bounds];
  double v4 = v3 + -150.0;

  return v4;
}

- (void)updateSummaryView
{
  [(ICFolderListViewController *)self availableWidthForSummaryView];
  double v4 = v3;
  id v5 = [(ICFolderListViewController *)self summaryView];
  [v5 setAvailableWidth:v4];

  double v6 = +[ICAppDelegate sharedInstance];
  unsigned int v7 = [v6 cloudContextDelegate];
  id v8 = [v7 syncMessage];
  id v9 = [(ICFolderListViewController *)self summaryView];
  [v9 setSyncMessage:v8];

  id v10 = [(ICFolderListViewController *)self summaryView];
  [v10 update];
}

- (void)addNoteButtonPressed:(id)a3 event:(id)a4
{
  id v7 = a4;
  if ([(ICFolderListViewController *)self isEditing]) {
    [(ICFolderListViewController *)self setEditing:0 animated:1];
  }
  id v5 = [(ICBaseViewController *)self viewControllerManager];
  id v6 = [v5 showNewNoteWithApproach:13 sender:v7 animated:1];
}

- (void)debugButtonPressed:(id)a3
{
}

- (void)confirmSelection
{
  id v6 = [(ICFolderListViewController *)self collectionView];
  double v3 = [(ICFolderListViewController *)self collectionView];
  double v4 = [v3 indexPathsForSelectedItems];
  id v5 = [v4 firstObject];
  [(ICFolderListViewController *)self collectionView:v6 didSelectItemAtIndexPath:v5];
}

- (void)confirmFocusedCellSelection
{
  double v3 = [(ICFolderListViewController *)self collectionView];
  double v4 = [v3 indexPathsForFocusedItems];
  id v6 = [v4 firstObject];

  if (v6)
  {
    id v5 = [(ICFolderListViewController *)self collectionView];
    [(ICFolderListViewController *)self collectionView:v5 didSelectItemAtIndexPath:v6];
  }
}

- (BOOL)canBecomeFirstResponder
{
  double v3 = [(ICBaseViewController *)self viewControllerManager];
  double v4 = [v3 keyboardHandler];
  unsigned int v5 = [v4 isInHardwareKeyboardMode];

  if (v5)
  {
    id v6 = [(ICBaseViewController *)self viewControllerManager];
    id v7 = [v6 activeEditorController];
    unsigned int v8 = [v7 wantsToRemainFirstResponder] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)selectItemWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  id v6 = [(ICFolderListViewController *)self collectionView];

  if (v6)
  {
    id v7 = [(ICFolderListViewController *)self dataSource];
    unsigned int v8 = [v7 collectionViewDiffableDataSource];
    id v9 = [v8 indexPathForItemIdentifier:v14];

    if (v9)
    {
      id v10 = [(ICFolderListViewController *)self collectionView];
      [v10 selectItemAtIndexPath:v9 animated:v4 scrollPosition:0];

      id v11 = [(ICFolderListViewController *)self collectionView];
      id v12 = [v11 delegate];
      unsigned __int8 v13 = [(ICFolderListViewController *)self collectionView];
      [v12 collectionView:v13 didSelectItemAtIndexPath:v9];
    }
  }
}

- (void)setCollectionView:(id)a3
{
}

- (void)setFolderDataSource:(id)a3
{
}

- (ICToolbarSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
}

- (UIBarButtonItem)addFolderButton
{
  return self->_addFolderButton;
}

- (void)setAddFolderButton:(id)a3
{
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)setManagedObjectContextChangeController:(id)a3
{
}

- (NSManagedObjectID)recentlyCreatedFolderObjectID
{
  return self->_recentlyCreatedFolderObjectID;
}

- (void)setRecentlyCreatedFolderObjectID:(id)a3
{
}

- (UISpringLoadedInteractionContext)currentSpringLoadedInteractionContext
{
  return self->_currentSpringLoadedInteractionContext;
}

- (void)setCurrentSpringLoadedInteractionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpringLoadedInteractionContext, 0);
  objc_storeStrong((id *)&self->_recentlyCreatedFolderObjectID, 0);
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_addFolderButton, 0);
  objc_storeStrong((id *)&self->_overrideContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_folderDataSource, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end