@interface ICNoteResultsViewController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (ICManagedObjectContextChangeController)managedObjectContextChangeController;
- (ICNoteBrowseCollectionView)collectionView;
- (ICNoteResultsViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5;
- (NSMutableSet)managedObjectIDsForDeferredCellUpdates;
- (UIBarButtonItem)actionBarButtonItem;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (void)dataSourceDataUpdateDidRender:(id)a3;
- (void)dealloc;
- (void)dismissContextMenu;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)noteDecryptedStatusDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionBarButtonItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setManagedObjectContextChangeController:(id)a3;
- (void)setManagedObjectIDsForDeferredCellUpdates:(id)a3;
- (void)thumbnailCacheDidInvalidateThumbnail:(id)a3;
- (void)updateCellsForManagedObjectIDs:(id)a3 updateTextAndStatus:(BOOL)a4 updateThumbnails:(BOOL)a5;
- (void)updateNoteSelection;
- (void)updateNoteSelectionAnimated:(BOOL)a3;
- (void)updatePreparedCells;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICNoteResultsViewController

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v4 = a4;
  v5 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectID];
        if (objc_msgSend(v11, "ic_isInvitationType")) {
          [v5 addObject:v11];
        }
        if (objc_msgSend(v11, "ic_isNoteType")) {
          [v5 addObject:v11];
        }
        if (objc_msgSend(v11, "ic_isModernFolderType"))
        {
          objc_opt_class();
          v12 = ICCheckedDynamicCast();
          [v5 addObject:v11];
          v13 = [v12 recursiveVisibleSubfolders];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000E9628;
          v16[3] = &unk_100629900;
          id v17 = v5;
          [v13 enumerateObjectsUsingBlock:v16];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (ICNoteResultsViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)ICNoteResultsViewController;
  v5 = [(ICBaseViewController *)&v15 initWithViewMode:a3 viewControllerManager:a4 viewControllerType:a5];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(ICBaseViewController *)v5 legacyViewContext];
    id v8 = [(ICBaseViewController *)v6 modernViewContext];
    uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, 0);

    v10 = (ICManagedObjectContextChangeController *)[objc_alloc((Class)ICManagedObjectContextChangeController) initWithManagedObjectContexts:v9 delegate:v6];
    managedObjectContextChangeController = v6->_managedObjectContextChangeController;
    v6->_managedObjectContextChangeController = v10;

    uint64_t v12 = +[NSMutableSet set];
    managedObjectIDsForDeferredCellUpdates = v6->_managedObjectIDsForDeferredCellUpdates;
    v6->_managedObjectIDsForDeferredCellUpdates = (NSMutableSet *)v12;
  }
  return v6;
}

- (void)updateNoteSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICNoteResultsViewController *)self isEditing]) {
    return;
  }
  v5 = [(ICBaseViewController *)self viewControllerManager];
  uint64_t v39 = [v5 selectedNoteObjectID];

  id v6 = [(ICBaseViewController *)self viewControllerManager];
  uint64_t v7 = [v6 selectedInvitationObjectID];

  id v8 = [(ICBaseViewController *)self viewControllerManager];
  uint64_t v9 = [v8 selectedContainerIdentifiers];

  if (!(v39 | v7) && ([(ICNoteResultsViewController *)self isEditing] & 1) == 0)
  {
    v10 = [(ICBaseViewController *)self viewControllerManager];
    if ([v10 isAutomaticallySelectingNotes])
    {
    }
    else
    {
      id v11 = [v9 count];

      if (!v11)
      {
        uint64_t v12 = [(ICNoteResultsViewController *)self collectionView];
        [v12 ic_deselectAllItemsAnimated:v3];
        goto LABEL_29;
      }
    }
  }
  uint64_t v12 = [(ICBaseViewController *)self viewControllerManager];
  if (![v12 isAutomaticallySelectingNotes]) {
    goto LABEL_29;
  }
  unsigned __int8 v13 = [(ICNoteResultsViewController *)self isEditing];

  if ((v13 & 1) == 0)
  {
    if (v39)
    {
      id v14 = [(ICBaseViewController *)self dataSource];
      objc_super v15 = [v14 collectionViewDiffableDataSource];
      v16 = v15;
      uint64_t v17 = v39;
    }
    else
    {
      if (!v7) {
        goto LABEL_14;
      }
      id v14 = [(ICBaseViewController *)self dataSource];
      objc_super v15 = [v14 collectionViewDiffableDataSource];
      v16 = v15;
      uint64_t v17 = v7;
    }
    uint64_t v12 = [v15 indexPathForItemIdentifier:v17];

    if (v12)
    {
LABEL_15:
      v22 = [(ICNoteResultsViewController *)self collectionView];
      id v23 = [v22 numberOfSections];
      if ((uint64_t)v23 <= (uint64_t)[v12 section])
      {
      }
      else
      {
        v24 = [(ICNoteResultsViewController *)self collectionView];
        id v25 = [v24 numberOfItemsInSection:[v12 section]];
        id v26 = [v12 row];

        if ((uint64_t)v25 > (uint64_t)v26)
        {
          v27 = [(ICNoteResultsViewController *)self collectionView];
          v28 = [v27 indexPathsForSelectedItems];
          v29 = [v28 firstObject];
          unsigned __int8 v30 = [v29 isEqual:v12];

          if ((v30 & 1) == 0)
          {
            v31 = [(ICNoteResultsViewController *)self collectionView];
            v32 = [v31 indexPathsForVisibleItems];
            if ([v32 containsObject:v12]) {
              uint64_t v33 = 0;
            }
            else {
              uint64_t v33 = 2;
            }

            v34 = [(ICNoteResultsViewController *)self collectionView];
            if ([v34 allowsMultipleSelection])
            {
              v35 = [(ICNoteResultsViewController *)self collectionView];
              v36 = [v35 indexPathsForSelectedItems];
              id v37 = [v36 count];

              if (v37 != (id)1)
              {
LABEL_25:
                v38 = [(ICNoteResultsViewController *)self collectionView];
                [v38 selectItemAtIndexPath:v12 animated:v3 scrollPosition:v33];
LABEL_28:

                goto LABEL_29;
              }
              v34 = [(ICNoteResultsViewController *)self collectionView];
              [v34 ic_deselectAllItemsAnimated:v3];
            }

            goto LABEL_25;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
LABEL_27:
      v38 = [(ICNoteResultsViewController *)self collectionView];
      [v38 ic_deselectAllItemsAnimated:v3];
      goto LABEL_28;
    }
LABEL_14:
    long long v18 = [(ICBaseViewController *)self viewControllerManager];
    long long v19 = [v18 selectedSearchResult];

    long long v20 = [(ICBaseViewController *)self dataSource];
    long long v21 = [v20 collectionViewDiffableDataSource];
    uint64_t v12 = [v21 indexPathForItemIdentifier:v19];

    if (!v12) {
      goto LABEL_27;
    }
    goto LABEL_15;
  }
LABEL_30:
}

- (ICNoteBrowseCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)updateNoteSelection
{
}

- (void)setCollectionView:(id)a3
{
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(ICBaseViewController *)self viewControllerManager];
  [v4 ic_removeObserver:self forKeyPath:@"selectedNoteObjectID" context:&off_10069A138];

  v5 = [(ICBaseViewController *)self viewControllerManager];
  [v5 ic_removeObserver:self forKeyPath:@"selectedSearchResult" context:&off_10069A138];

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsViewController;
  [(ICBaseViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ICNoteResultsViewController;
  [(ICBaseViewController *)&v12 viewDidLoad];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"thumbnailCacheDidInvalidateThumbnail:" name:ICThumbnailCacheDidInvalidateThumbnailNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = ICAuthenticationStateDidAuthenticateNotification;
  objc_super v6 = +[ICAuthenticationState sharedState];
  [v4 addObserver:self selector:"noteDecryptedStatusDidChange:" name:v5 object:v6];

  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = ICAuthenticationStateDidDeauthenticateNotification;
  uint64_t v9 = +[ICAuthenticationState sharedState];
  [v7 addObserver:self selector:"noteDecryptedStatusDidChange:" name:v8 object:v9];

  v10 = [(ICBaseViewController *)self viewControllerManager];
  [v10 ic_addObserver:self forKeyPath:@"selectedNoteObjectID" context:&off_10069A138];

  id v11 = [(ICBaseViewController *)self viewControllerManager];
  [v11 ic_addObserver:self forKeyPath:@"selectedSearchResult" context:&off_10069A138];
}

- (void)viewWillAppear:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)ICNoteResultsViewController;
  [(ICBaseViewController *)&v24 viewWillAppear:a3];
  id v4 = [(ICNoteResultsViewController *)self managedObjectContextChangeController];
  [v4 performUpdatesIfNeeded];

  if ([(ICNoteResultsViewController *)self ic_isBeingRevealedFromPoppingViewController]&& ([(ICNoteResultsViewController *)self isEditing] & 1) == 0)
  {
    uint64_t v5 = [(ICNoteResultsViewController *)self collectionView];
    objc_super v6 = [v5 indexPathsForSelectedItems];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v11);
          unsigned __int8 v13 = [(ICBaseViewController *)self dataSource];
          id v14 = [v13 collectionViewDiffableDataSource];
          objc_super v15 = [v14 itemIdentifierForIndexPath:v12];

          objc_opt_class();
          v16 = ICDynamicCast();
          if ((objc_msgSend(v16, "ic_isNoteType") & 1) != 0
            || (objc_msgSend(v16, "ic_isFolderType") & 1) != 0
            || objc_msgSend(v16, "ic_isInvitationType"))
          {
            uint64_t v17 = [(ICNoteResultsViewController *)self collectionView];
            [v17 deselectItemAtIndexPath:v12 animated:1];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }

    long long v18 = [(ICBaseViewController *)self noteSearchViewController];
    long long v19 = [v18 collectionView];
    [v19 ic_deselectAllItemsAnimated:1];
  }
  -[ICNoteResultsViewController updateNoteSelectionAnimated:](self, "updateNoteSelectionAnimated:", 0, (void)v20);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsViewController;
  [(ICBaseViewController *)&v6 viewDidAppear:a3];
  id v4 = [(ICNoteResultsViewController *)self managedObjectIDsForDeferredCellUpdates];
  [(ICNoteResultsViewController *)self updateCellsForManagedObjectIDs:v4 updateTextAndStatus:1 updateThumbnails:1];

  uint64_t v5 = [(ICNoteResultsViewController *)self managedObjectIDsForDeferredCellUpdates];
  [v5 removeAllObjects];
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteResultsViewController;
  [(ICBaseViewController *)&v3 dataSourceDataUpdateDidRender:a3];
  performBlockOnMainThread();
}

- (void)thumbnailCacheDidInvalidateThumbnail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseViewController *)self modernViewContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E97E4;
  v7[3] = &unk_100625860;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ICNoteResultsViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Common/View Controllers/ICNoteResultsViewController.m"])
  {
    unsigned __int8 v13 = [(ICNoteResultsViewController *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

    if (a6 == &off_10069A138
      && (v13 & 1) == 0
      && (([v10 isEqualToString:@"selectedNoteObjectID"] & 1) != 0
       || [v10 isEqualToString:@"selectedSearchResult"]))
    {
      performBlockOnMainThread();
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteResultsViewController;
    [(ICNoteResultsViewController *)&v14 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  objc_super v3 = +[ICAuthenticationState sharedState];
  unsigned __int8 v4 = [v3 isBlockingDeauthentication];

  if ((v4 & 1) == 0) {
    performBlockOnMainThread();
  }
}

- (void)updatePreparedCells
{
  v2 = [(ICNoteResultsViewController *)self collectionView];
  objc_super v3 = [v2 preparedCells];
  unsigned __int8 v4 = [v3 ic_objectsConformingToProtocol:&OBJC_PROTOCOL___ICNoteBrowseCellUpdating];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 updateThumbnail:v11];
        [v10 updateTextAndStatus];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)dismissContextMenu
{
  v2 = [(ICNoteResultsViewController *)self collectionView];
  objc_super v3 = [v2 interactions];
  [v3 ic_objectPassingTest:&stru_100629940];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  unsigned __int8 v4 = ICCheckedDynamicCast();
  [v4 dismissMenu];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 previouslyFocusedItem];
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v7 = [v4 nextFocusedItem];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  uint64_t v8 = [(ICNoteResultsViewController *)self collectionView];
  id v9 = [v8 indexPathsForSelectedItems];
  id v10 = [v9 count];

  if (v10 && (isKindOfClass & 1) != 0)
  {
    long long v11 = [(ICNoteResultsViewController *)self collectionView];
    [v11 ic_deselectAllItems];
  }
  return 1;
}

- (void)updateCellsForManagedObjectIDs:(id)a3 updateTextAndStatus:(BOOL)a4 updateThumbnails:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 count])
  {
    id v9 = [(ICNoteResultsViewController *)self viewIfLoaded];
    id v10 = [v9 window];

    if (v10)
    {
      long long v11 = [(ICBaseViewController *)self dataSource];
      long long v12 = [v11 associatedCellsForItemIdentifiers:v8];

      long long v21 = v12;
      long long v13 = [v12 ic_objectsConformingToProtocol:&OBJC_PROTOCOL___ICNoteBrowseCellUpdating];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (v6)
            {
              [*(id *)(*((void *)&v22 + 1) + 8 * i) updateTextAndStatus];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = v18;
                [v19 updateSubfolderCount];
                [v19 updateNoteCount];
              }
            }
            if (v5) {
              [v18 updateThumbnail];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }
    }
    else
    {
      long long v20 = [(ICNoteResultsViewController *)self managedObjectIDsForDeferredCellUpdates];
      [v20 unionSet:v8];
    }
  }
}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)setManagedObjectContextChangeController:(id)a3
{
}

- (UIBarButtonItem)actionBarButtonItem
{
  return self->_actionBarButtonItem;
}

- (void)setActionBarButtonItem:(id)a3
{
}

- (NSMutableSet)managedObjectIDsForDeferredCellUpdates
{
  return self->_managedObjectIDsForDeferredCellUpdates;
}

- (void)setManagedObjectIDsForDeferredCellUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectIDsForDeferredCellUpdates, 0);
  objc_storeStrong((id *)&self->_actionBarButtonItem, 0);
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end