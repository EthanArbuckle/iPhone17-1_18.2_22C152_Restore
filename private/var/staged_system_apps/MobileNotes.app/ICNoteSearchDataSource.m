@interface ICNoteSearchDataSource
+ (int64_t)numberOfItemsInSection:(id)a3 forSnapshot:(id)a4;
- (BOOL)didUpdateForCurrentSearchUserInput;
- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3;
- (ICManagedObjectContextChangeController)removedObjectsManagedObjectContextChangeController;
- (ICNoteSearchDataSource)initWithCollectionView:(id)a3 noteContainerViewMode:(int64_t)a4 viewControllerManager:(id)a5 legacyViewContext:(id)a6 modernViewContext:(id)a7 searchContext:(id)a8;
- (ICNoteSearchDataSourceDelegate)delegate;
- (ICNoteSearchResultsController)searchResultsController;
- (ICNoteSearchSnapshot)snapshot;
- (ICSearchUserInput)currentSearchUserInput;
- (ICViewControllerManager)viewControllerManager;
- (NSString)accountIdentifier;
- (id)associatedCellsForItemIdentifiers:(id)a3;
- (id)firstRelevantItemIdentifier;
- (id)legacyViewContext;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (id)modernViewContext;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (int64_t)noteContainerViewMode;
- (int64_t)noteDisplayMode;
- (void)cancelSearchQuery;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)noteLockManagerDidToggleLock:(id)a3;
- (void)performUpdatesIfNeededAndWait;
- (void)searchSnapshotDidUpdateSuggestions:(id)a3;
- (void)searchWithUserInput:(id)a3 updateHandler:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setCurrentSearchUserInput:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidUpdateForCurrentSearchUserInput:(BOOL)a3;
- (void)setRemovedObjectsManagedObjectContextChangeController:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)switchToMode:(unint64_t)a3;
@end

@implementation ICNoteSearchDataSource

- (ICNoteSearchDataSource)initWithCollectionView:(id)a3 noteContainerViewMode:(int64_t)a4 viewControllerManager:(id)a5 legacyViewContext:(id)a6 modernViewContext:(id)a7 searchContext:(id)a8
{
  id v14 = a3;
  id obj = a5;
  id v51 = a6;
  id v50 = a7;
  id v52 = a8;
  objc_initWeak(location, self);
  v54 = v14;
  objc_initWeak(&from, v14);
  uint64_t v15 = objc_opt_class();
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000FC740;
  v72[3] = &unk_100625320;
  objc_copyWeak(&v73, location);
  objc_copyWeak(&v74, &from);
  v16 = +[UICollectionViewCellRegistration registrationWithCellClass:v15 configurationHandler:v72];
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  uint64_t v19 = +[UINib nibWithNibName:v18 bundle:0];

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000FC8A0;
  v69[3] = &unk_100625348;
  objc_copyWeak(&v70, location);
  objc_copyWeak(&v71, &from);
  v48 = (void *)v19;
  v20 = +[UICollectionViewCellRegistration registrationWithCellNib:v19 configurationHandler:v69];
  uint64_t v21 = objc_opt_class();
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1000FCA6C;
  v67[3] = &unk_100629D98;
  objc_copyWeak(&v68, location);
  v22 = +[UICollectionViewCellRegistration registrationWithCellClass:v21 configurationHandler:v67];
  v23 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:&stru_100629DD8];
  uint64_t v24 = objc_opt_class();
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1000FCD00;
  v65[3] = &unk_100629E00;
  objc_copyWeak(&v66, location);
  v49 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v24 elementKind:UICollectionElementKindSectionHeader configurationHandler:v65];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000FCDBC;
  v59[3] = &unk_100629E28;
  objc_copyWeak(&v64, location);
  id v25 = v23;
  id v60 = v25;
  id v26 = v22;
  id v61 = v26;
  id v27 = v16;
  id v62 = v27;
  id v28 = v20;
  id v63 = v28;
  v29 = objc_retainBlock(v59);
  v58.receiver = self;
  v58.super_class = (Class)ICNoteSearchDataSource;
  v30 = [(ICNoteSearchDataSource *)&v58 initWithCollectionView:v54 cellProvider:v29];
  if (v30)
  {
    int64_t v31 = a4;
    v32 = objc_alloc_init(ICNoteSearchResultsController);
    searchResultsController = v30->_searchResultsController;
    v30->_searchResultsController = v32;

    v30->_noteContainerViewMode = a4;
    objc_storeWeak((id *)&v30->_viewControllerManager, obj);
    v34 = [ICNoteSearchSnapshot alloc];
    v35 = [(ICNoteSearchDataSource *)v30 collectionViewDiffableDataSource];
    v36 = [(ICNoteSearchDataSource *)v30 collectionView];
    v37 = [(ICNoteSearchSnapshot *)v34 initWithDiffableDataSource:v35 containerViewMode:v31 collectionView:v36 searchContext:v52];
    snapshot = v30->_snapshot;
    v30->_snapshot = v37;

    v39 = [(ICNoteSearchDataSource *)v30 collectionView];
    -[v30->_snapshot setBehavior:[v39 ic_behavior]];

    [(ICNoteSearchSnapshot *)v30->_snapshot setDelegate:v30];
    v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v51, v50, 0);
    v41 = (ICManagedObjectContextChangeController *)[objc_alloc((Class)ICManagedObjectContextChangeController) initWithManagedObjectContexts:v40 delegate:v30];
    removedObjectsManagedObjectContextChangeController = v30->_removedObjectsManagedObjectContextChangeController;
    v30->_removedObjectsManagedObjectContextChangeController = v41;

    v43 = +[NSMutableArray array];
    if (+[ICSearchSuggestionsContext supportsSearchSuggestions])
    {
      [v43 addObject:&off_10064B2A0];
      [v43 addObject:&off_10064B2B8];
    }
    [v43 addObject:&off_10064B2D0];
    [v43 addObject:&off_10064B2E8];
    id v44 = [v43 copy];
    [(ICNoteSearchDataSource *)v30 setSectionTypes:v44];

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000FCF50;
    v55[3] = &unk_100629E50;
    objc_copyWeak(&v57, &from);
    id v56 = v49;
    v45 = [(ICNoteSearchDataSource *)v30 collectionViewDiffableDataSource];
    [v45 setSupplementaryViewProvider:v55];

    objc_destroyWeak(&v57);
  }
  v46 = v30;

  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v70);

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v46;
}

- (void)cancelSearchQuery
{
  v3 = [(ICNoteSearchDataSource *)self searchResultsController];
  [v3 cancelSearchQuery];

  [(ICNoteSearchDataSource *)self setCurrentSearchUserInput:0];
}

- (void)searchWithUserInput:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICNoteSearchDataSource *)self setCurrentSearchUserInput:v6];
  [(ICNoteSearchDataSource *)self switchToMode:1];
  if ([v6 isEmpty])
  {
    v8 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1004DBD30(v8);
    }

    [(ICNoteSearchDataSource *)self cancelSearchQuery];
    v9 = [(ICNoteSearchDataSource *)self snapshot];
    [v9 clear];
  }
  else
  {
    int64_t v10 = [(ICNoteSearchDataSource *)self noteContainerViewMode];
    v11 = [(ICNoteSearchDataSource *)self searchResultsController];
    v12 = [(ICNoteSearchDataSource *)self accountIdentifier];
    unsigned __int8 v13 = [v11 isUpToDateForInput:v6 accountIdentifier:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = [v6 tokens];
      id v15 = [v14 ic_containsObjectPassingTest:&stru_100629E90];

      v16 = [(ICNoteSearchDataSource *)self snapshot];
      [v16 prepareSearchWithCannedSuggestionToken:v15];

      [(ICNoteSearchDataSource *)self setDidUpdateForCurrentSearchUserInput:0];
    }
    v17 = [(ICNoteSearchDataSource *)self collectionView];
    id v18 = [v17 ic_behavior];

    objc_initWeak(&location, self);
    uint64_t v19 = [(ICNoteSearchDataSource *)self searchResultsController];
    v20 = [(ICNoteSearchDataSource *)self snapshot];
    uint64_t v21 = [(ICNoteSearchDataSource *)self accountIdentifier];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000FD2D8;
    v22[3] = &unk_100629EB8;
    objc_copyWeak(v24, &location);
    v24[1] = v18;
    id v23 = v7;
    [v19 performSearchWithInput:v6 suggestionsResponder:v20 accountIdentifier:v21 modernResultsOnly:v10 == 1 updateHandler:v22];

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

- (void)switchToMode:(unint64_t)a3
{
  id v5 = [(ICNoteSearchDataSource *)self snapshot];
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions])unint64_t v4 = a3; {
  else
  }
    unint64_t v4 = 0;
  [v5 switchToMode:v4];
}

+ (int64_t)numberOfItemsInSection:(id)a3 forSnapshot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 sectionIdentifiers];
  unsigned int v8 = [v7 containsObject:v5];

  if (v8) {
    id v9 = [v6 numberOfItemsInSection:v5];
  }
  else {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (void)performUpdatesIfNeededAndWait
{
  id v2 = [(ICNoteSearchDataSource *)self removedObjectsManagedObjectContextChangeController];
  [v2 performUpdatesIfNeededAndWait];
}

- (id)firstRelevantItemIdentifier
{
  id v2 = [(ICNoteSearchDataSource *)self collectionViewDiffableDataSource];
  v3 = [v2 snapshot];

  unint64_t v4 = [v3 itemIdentifiers];
  id v5 = [v4 ic_firstObjectOfClass:objc_opt_class()];

  return v5;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 lastObject];

  id v6 = ICDynamicCast();

  if (!v6) {
    goto LABEL_11;
  }
  id v7 = [(ICNoteSearchDataSource *)self collectionViewDiffableDataSource];
  unsigned int v8 = [v7 snapshot];

  id v9 = [v8 itemIdentifiers];
  int64_t v10 = [v9 ic_map:&stru_100629ED8];

  v11 = (char *)[v10 indexOfObject:v6];
  if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    unsigned __int8 v13 = v11 + 1;
    if (v11 + 1 >= [v10 count])
    {
      v16 = 0;
      if (!v12) {
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      id v14 = [v8 itemIdentifiers];
      id v15 = [v14 objectAtIndexedSubscript:v13];
      v16 = ICDynamicCast();

      if (!v12) {
        goto LABEL_10;
      }
    }
    if (!v16)
    {
      objc_opt_class();
      v17 = [v8 itemIdentifiers];
      id v18 = [v17 objectAtIndexedSubscript:v12 - 1];
      v16 = ICDynamicCast();
    }
LABEL_10:

    if (v16) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

LABEL_11:
  objc_opt_class();
  uint64_t v19 = [(ICNoteSearchDataSource *)self firstRelevantItemIdentifier];
  v16 = ICDynamicCast();

LABEL_12:
  v20 = [v16 object];
  uint64_t v21 = [v20 objectID];
  unsigned int v22 = [v21 isEqual:v6];

  if (v22)
  {

    v16 = 0;
  }

  return v16;
}

- (id)associatedCellsForItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteSearchDataSource *)self collectionViewDiffableDataSource];
  id v6 = [v5 snapshot];

  id v7 = [v6 itemIdentifiers];
  unsigned int v8 = +[NSSet setWithArray:v7];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000FDAC0;
  v12[3] = &unk_100629F00;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  int64_t v10 = [v8 ic_compactMap:v12];

  return v10;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteSearchDataSource *)self collectionViewDiffableDataSource];
  id v7 = [v6 snapshot];
  id v8 = [v7 numberOfItems];

  if (v8)
  {
    +[NSMutableSet set];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000FDD08;
    v12[3] = &unk_100629F28;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v13;
    [v5 enumerateObjectsUsingBlock:v12];
    id v10 = [v9 copy];
  }
  else
  {
    id v10 = +[NSSet set];
  }

  return v10;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteSearchDataSource *)self snapshot];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FDEF0;
  v8[3] = &unk_100629F78;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlockAndUpdateHeaders:1 animated:1 block:v8];
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (void)searchSnapshotDidUpdateSuggestions:(id)a3
{
  if ((id)[(ICNoteSearchDataSource *)self noteDisplayMode] == (id)1)
  {
    id v4 = [(ICNoteSearchDataSource *)self delegate];
    [v4 searchDataSourceDidUpdateSuggestions:self];
  }
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  id v6 = ICCheckedDynamicCast();

  id v7 = [v6 updatedNote];

  if (v7)
  {
    id v8 = [(ICNoteSearchDataSource *)self snapshot];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FE21C;
    v10[3] = &unk_100629F78;
    id v11 = v6;
    [v8 performBlockAndUpdateHeaders:0 animated:1 block:v10];
  }
  v9.receiver = self;
  v9.super_class = (Class)ICNoteSearchDataSource;
  [(ICNoteSearchDataSource *)&v9 noteLockManagerDidToggleLock:v4];
}

- (id)legacyViewContext
{
  id v2 = +[NotesApp sharedNotesApp];
  v3 = [v2 noteContext];
  id v4 = [v3 managedObjectContext];

  return v4;
}

- (id)modernViewContext
{
  id v2 = +[ICNoteContext sharedContext];
  v3 = [v2 managedObjectContext];

  return v3;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (ICNoteSearchDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteSearchDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)noteDisplayMode
{
  return self->_noteDisplayMode;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (ICNoteSearchSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (BOOL)didUpdateForCurrentSearchUserInput
{
  return self->_didUpdateForCurrentSearchUserInput;
}

- (void)setDidUpdateForCurrentSearchUserInput:(BOOL)a3
{
  self->_didUpdateForCurrentSearchUserInput = a3;
}

- (ICSearchUserInput)currentSearchUserInput
{
  return self->_currentSearchUserInput;
}

- (void)setCurrentSearchUserInput:(id)a3
{
}

- (ICNoteSearchResultsController)searchResultsController
{
  return self->_searchResultsController;
}

- (void)setSearchResultsController:(id)a3
{
}

- (ICManagedObjectContextChangeController)removedObjectsManagedObjectContextChangeController
{
  return self->_removedObjectsManagedObjectContextChangeController;
}

- (void)setRemovedObjectsManagedObjectContextChangeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjectsManagedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_currentSearchUserInput, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);

  objc_destroyWeak((id *)&self->_delegate);
}

@end