@interface ICFolderDataSource
- (BOOL)hasGroupInset;
- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3;
- (BOOL)shouldDisplayTagOperatorInTagHeading;
- (BOOL)shouldIndentNoteCount;
- (BOOL)shouldShowTagOperatorOnSeparateLine;
- (ICFolderCoreDataIndexer)indexer;
- (ICFolderDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 legacyManagedObjectContext:(id)a5 modernManagedObjectContext:(id)a6 overrideContainerIdentifier:(id)a7 unsupportedFolderInfoButtonTapHandler:(id)a8 accountUpgradeButtonTapHandlerProvider:(id)a9 tagSelectionDidChangeHandler:(id)a10 allowNotificationsCloseHandler:(id)a11;
- (ICManagedObjectContextChangeController)managedObjectContextChangeController;
- (ICNAViewController)presentingViewController;
- (ICOutlineParentCollectionViewCell)tagHeadingCell;
- (ICSelectorDelayer)accountChangeDelayer;
- (ICSelectorDelayer)updateVirtualSmartFoldersDelayer;
- (ICTagOperatorCell)tagOperatorCell;
- (ICTagSelection)tagSelection;
- (NSManagedObjectContext)legacyViewContext;
- (NSManagedObjectContext)modernViewContext;
- (NSSet)allSmartFolderObjectIDs;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (id)unsupportedFolderInfoButtonTapHandler;
- (int64_t)shouldIncludeCallNotes;
- (int64_t)shouldIncludeMathNotes;
- (int64_t)shouldIncludeSharedWithYou;
- (int64_t)shouldIncludeSystemPaper;
- (unint64_t)countOfAllVisibleAccounts;
- (unint64_t)countOfLegacyAccounts;
- (unint64_t)countOfModernAccounts;
- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3;
- (void)accountsDidChange:(id)a3;
- (void)checkUpdateVirtualSmartFolders;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)reloadDataAnimatedYes;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setManagedObjectContextChangeController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setShouldIncludeCallNotes:(int64_t)a3;
- (void)setShouldIncludeMathNotes:(int64_t)a3;
- (void)setShouldIncludeSharedWithYou:(int64_t)a3;
- (void)setShouldIncludeSystemPaper:(int64_t)a3;
- (void)setShouldShowTagOperatorOnSeparateLine:(BOOL)a3;
- (void)setTagSelection:(id)a3;
- (void)updateTagOperatorVisibility;
@end

@implementation ICFolderDataSource

- (NSManagedObjectContext)modernViewContext
{
  v2 = +[ICNoteContext sharedContext];
  v3 = [v2 managedObjectContext];

  return (NSManagedObjectContext *)v3;
}

- (unint64_t)countOfModernAccounts
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 countOfModernAccounts];

  return (unint64_t)v3;
}

- (unint64_t)countOfLegacyAccounts
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 countOfLegacyAccounts];

  return (unint64_t)v3;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v4 = a4;
  v5 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 objectID:v15];
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

- (void)setHasGroupInset:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL hasGroupInset = self->_hasGroupInset;
  self->_BOOL hasGroupInset = a3;
  objc_opt_class();
  id v6 = [(ICFolderDataSource *)self collectionView];
  id v7 = ICDynamicCast();
  [v7 setHasGroupInset:v3];

  if (hasGroupInset != v3)
  {
    id v8 = [(ICFolderDataSource *)self collectionView];
    [v8 reloadData];
  }
}

- (ICFolderCoreDataIndexer)indexer
{
  v4.receiver = self;
  v4.super_class = (Class)ICFolderDataSource;
  v2 = [(ICFolderDataSource *)&v4 indexer];

  return (ICFolderCoreDataIndexer *)v2;
}

- (ICFolderDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 legacyManagedObjectContext:(id)a5 modernManagedObjectContext:(id)a6 overrideContainerIdentifier:(id)a7 unsupportedFolderInfoButtonTapHandler:(id)a8 accountUpgradeButtonTapHandlerProvider:(id)a9 tagSelectionDidChangeHandler:(id)a10 allowNotificationsCloseHandler:(id)a11
{
  id v17 = a3;
  id obj = a4;
  id v18 = a5;
  id v74 = a6;
  id v19 = a7;
  id v71 = a8;
  id v20 = a9;
  v21 = v17;
  id v22 = a10;
  id v23 = a11;
  objc_initWeak(location, self);
  objc_initWeak(&from, v17);
  self->_shouldShowTagOperatorOnSeparateLine = 0;
  id v24 = [objc_alloc((Class)ICFolderCoreDataIndexer) initWithLegacyManagedObjectContext:v18 modernManagedObjectContext:v74 overrideContainerIdentifier:v19];
  [v24 setShouldIncludeOutlineParentItems:v19 == 0];
  [v24 setShouldIncludeTags:v19 == 0];
  v73 = v24;
  v69 = v19;
  v70 = v18;
  uint64_t v25 = objc_opt_class();
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10012AB3C;
  v100[3] = &unk_10062A938;
  objc_copyWeak(&v103, location);
  id v68 = v20;
  id v101 = v68;
  id v26 = v22;
  id v102 = v26;
  v27 = +[UICollectionViewCellRegistration registrationWithCellClass:v25 configurationHandler:v100];
  uint64_t v28 = objc_opt_class();
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10012AE10;
  v97[3] = &unk_10062A960;
  objc_copyWeak(&v98, location);
  objc_copyWeak(&v99, &from);
  v29 = +[UICollectionViewCellRegistration registrationWithCellClass:v28 configurationHandler:v97];
  uint64_t v30 = objc_opt_class();
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_10012B08C;
  v94[3] = &unk_10062A988;
  objc_copyWeak(&v96, location);
  id v31 = v26;
  id v95 = v31;
  v32 = +[UICollectionViewCellRegistration registrationWithCellClass:v30 configurationHandler:v94];
  uint64_t v33 = objc_opt_class();
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10012B228;
  v91[3] = &unk_10062A9B0;
  objc_copyWeak(&v93, location);
  id v67 = v31;
  id v92 = v67;
  v34 = +[UICollectionViewCellRegistration registrationWithCellClass:v33 configurationHandler:v91];
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_10012B3E0;
  v85[3] = &unk_10062A9D8;
  id v35 = v27;
  id v86 = v35;
  id v66 = v32;
  id v87 = v66;
  id v65 = v34;
  id v88 = v65;
  id v36 = v29;
  id v89 = v36;
  objc_copyWeak(&v90, &from);
  v37 = objc_retainBlock(v85);
  uint64_t v38 = objc_opt_class();
  v63 = v36;
  v64 = v35;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10012B4EC;
  v82[3] = &unk_10062AA00;
  objc_copyWeak(&v84, location);
  id v39 = v23;
  id v83 = v39;
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v38 elementKind:UICollectionElementKindSectionHeader configurationHandler:v82];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10012B560;
  v80[3] = &unk_100628838;
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  id v81 = v40;
  v41 = objc_retainBlock(v80);
  v79.receiver = self;
  v79.super_class = (Class)ICFolderDataSource;
  v42 = [(ICFolderDataSource *)&v79 initWithCollectionView:v21 cellProvider:v37 indexer:v73];
  v43 = v42;
  if (v42)
  {
    objc_storeWeak((id *)&v42->_presentingViewController, obj);
    id v44 = objc_retainBlock(v71);
    id unsupportedFolderInfoButtonTapHandler = v43->_unsupportedFolderInfoButtonTapHandler;
    v43->_id unsupportedFolderInfoButtonTapHandler = v44;

    v46 = +[ICNoteContext sharedContext];

    if (v46)
    {
      id v47 = objc_alloc((Class)ICManagedObjectContextChangeController);
      v48 = [(ICFolderDataSource *)v43 modernViewContext];
      v49 = +[NSSet setWithObject:v48];
      v50 = (ICManagedObjectContextChangeController *)[v47 initWithManagedObjectContexts:v49 delegate:v43];
      managedObjectContextChangeController = v43->_managedObjectContextChangeController;
      v43->_managedObjectContextChangeController = v50;
    }
    id v52 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10012B56C;
    v77[3] = &unk_100625598;
    objc_copyWeak(&v78, location);
    [v52 setWillExpandItemHandler:v77];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10012B670;
    v75[3] = &unk_100625598;
    objc_copyWeak(&v76, location);
    [v52 setWillCollapseItemHandler:v75];
    v53 = [(ICFolderDataSource *)v43 collectionViewDiffableDataSource];
    [v53 setSectionSnapshotHandlers:v52];

    [(ICFolderDataSource *)v43 setSectionTypes:&off_10064B620];
    v54 = [(ICFolderDataSource *)v43 collectionViewDiffableDataSource];
    [v54 setSupplementaryViewProvider:v41];

    v55 = +[NSNotificationCenter defaultCenter];
    [v55 addObserver:v43 selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];

    v56 = +[NSNotificationCenter defaultCenter];
    [v56 addObserver:v43 selector:"accountsDidChange:" name:ICLocalAccountDidChooseToMigrateNotification object:0];

    v57 = (ICSelectorDelayer *)[objc_alloc((Class)ICSelectorDelayer) initWithTarget:v43 selector:"reloadDataAnimatedYes" delay:1 waitToFireUntilRequestsStop:0 callOnMainThread:0.3];
    accountChangeDelayer = v43->_accountChangeDelayer;
    v43->_accountChangeDelayer = v57;

    v59 = (ICSelectorDelayer *)[objc_alloc((Class)ICSelectorDelayer) initWithTarget:v43 selector:"checkUpdateVirtualSmartFolders" delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.3];
    updateVirtualSmartFoldersDelayer = v43->_updateVirtualSmartFoldersDelayer;
    v43->_updateVirtualSmartFoldersDelayer = v59;

    objc_destroyWeak(&v76);
    objc_destroyWeak(&v78);
  }
  v61 = v43;

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v90);

  objc_destroyWeak(&v93);
  objc_destroyWeak(&v96);

  objc_destroyWeak(&v99);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v61;
}

- (unint64_t)countOfAllVisibleAccounts
{
  unint64_t v3 = [(ICFolderDataSource *)self countOfLegacyAccounts];
  return [(ICFolderDataSource *)self countOfModernAccounts] + v3;
}

- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012B894;
  v12[3] = &unk_10062AA28;
  objc_copyWeak(&v14, &location);
  id v10 = v8;
  id v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)ICFolderDataSource;
  [(ICFolderDataSource *)&v11 reindexDataAnimated:v6 dataIndexedBlock:v12 dataRenderedBlock:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setShouldShowTagOperatorOnSeparateLine:(BOOL)a3
{
  self->_shouldShowTagOperatorOnSeparateLine = a3;
  [(ICFolderDataSource *)self updateTagOperatorVisibility];
}

- (void)setTagSelection:(id)a3
{
  objc_storeStrong((id *)&self->_tagSelection, a3);
  id v5 = a3;
  BOOL v6 = [(ICFolderDataSource *)self tagOperatorCell];
  [v6 setTagSelection:v5];

  id v7 = [(ICFolderDataSource *)self tagHeadingCell];
  [v7 setTagSelection:v5];

  [(ICFolderDataSource *)self updateTagOperatorVisibility];
}

- (NSSet)allSmartFolderObjectIDs
{
  v2 = [(ICFolderDataSource *)self indexer];
  unint64_t v3 = [v2 allSmartFolderObjectIDs];

  return (NSSet *)v3;
}

- (int64_t)shouldIncludeSharedWithYou
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 shouldIncludeSharedWithYou];

  return (int64_t)v3;
}

- (void)setShouldIncludeSharedWithYou:(int64_t)a3
{
  id v4 = [(ICFolderDataSource *)self indexer];
  [v4 setShouldIncludeSharedWithYou:a3];
}

- (int64_t)shouldIncludeSystemPaper
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 shouldIncludeSystemPaper];

  return (int64_t)v3;
}

- (void)setShouldIncludeSystemPaper:(int64_t)a3
{
  id v4 = [(ICFolderDataSource *)self indexer];
  [v4 setShouldIncludeSystemPaper:a3];
}

- (int64_t)shouldIncludeCallNotes
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 shouldIncludeCallNotes];

  return (int64_t)v3;
}

- (void)setShouldIncludeCallNotes:(int64_t)a3
{
  id v4 = [(ICFolderDataSource *)self indexer];
  [v4 setShouldIncludeCallNotes:a3];
}

- (int64_t)shouldIncludeMathNotes
{
  v2 = [(ICFolderDataSource *)self indexer];
  id v3 = [v2 shouldIncludeMathNotes];

  return (int64_t)v3;
}

- (void)setShouldIncludeMathNotes:(int64_t)a3
{
  id v4 = [(ICFolderDataSource *)self indexer];
  [v4 setShouldIncludeMathNotes:a3];
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    id v5 = [(ICFolderDataSource *)self updateVirtualSmartFoldersDelayer];
    [v5 requestFire];
  }
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (BOOL)shouldIndentNoteCount
{
  return +[UIDevice ic_isVision] ^ 1;
}

- (NSManagedObjectContext)legacyViewContext
{
  v2 = +[NotesApp sharedNotesApp];
  id v3 = [v2 noteContext];
  id v4 = [v3 managedObjectContext];

  return (NSManagedObjectContext *)v4;
}

- (void)accountsDidChange:(id)a3
{
  id v3 = [(ICFolderDataSource *)self accountChangeDelayer];
  [v3 requestFire];
}

- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)ICFolderDataSource;
  [(ICFolderDataSource *)&v18 accountHidesNotesInCustomFoldersDidChange:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ICFolderDataSource *)self collectionView];
  id v5 = [v4 indexPathsForVisibleItems];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        objc_opt_class();
        objc_super v11 = [(ICFolderDataSource *)self collectionView];
        v12 = [v11 cellForItemAtIndexPath:v10];
        id v13 = ICDynamicCast();

        [v13 updateNoteCount];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)reloadDataAnimatedYes
{
}

- (void)checkUpdateVirtualSmartFolders
{
  id v3 = [(ICFolderDataSource *)self collectionViewDiffableDataSource];
  id v4 = [v3 snapshot];
  id v5 = [v4 itemIdentifiers];
  id v6 = [v5 ic_objectsOfClass:[objc_opt_class()]];
  id v7 = +[NSSet setWithArray:v6];

  uint64_t v8 = [(ICFolderDataSource *)self indexer];
  id v9 = [v8 allVirtualSmartFolderIdentifiers];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C190;
  v11[3] = &unk_10062AA50;
  v11[4] = self;
  uint64_t v10 = [v9 ic_objectsPassingTest:v11];

  if (([v10 isEqualToSet:v7] & 1) == 0) {
    [(ICFolderDataSource *)self reindexDataAnimated:1];
  }
}

- (ICOutlineParentCollectionViewCell)tagHeadingCell
{
  id v3 = [(ICFolderDataSource *)self collectionViewDiffableDataSource];
  id v4 = [v3 snapshot];

  id v5 = [v4 itemIdentifiers];
  id v6 = [v5 ic_objectPassingTest:&stru_10062AA70];

  if (v6)
  {
    id v7 = [(ICFolderDataSource *)self collectionViewDiffableDataSource];
    uint64_t v8 = [v7 indexPathForItemIdentifier:v6];

    objc_opt_class();
    id v9 = [(ICFolderDataSource *)self collectionView];
    uint64_t v10 = [v9 cellForItemAtIndexPath:v8];
    objc_super v11 = ICDynamicCast();
  }
  else
  {
    objc_super v11 = 0;
  }

  return (ICOutlineParentCollectionViewCell *)v11;
}

- (ICTagOperatorCell)tagOperatorCell
{
  id v3 = [(ICFolderDataSource *)self collectionViewDiffableDataSource];
  id v4 = +[ICTagOperatorItemIdentifier sharedItemIdentifier];
  id v5 = [v3 indexPathForItemIdentifier:v4];

  objc_opt_class();
  id v6 = [(ICFolderDataSource *)self collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v5];
  uint64_t v8 = ICDynamicCast();

  return (ICTagOperatorCell *)v8;
}

- (void)updateTagOperatorVisibility
{
  BOOL v3 = [(ICFolderDataSource *)self shouldDisplayTagOperatorInTagHeading];
  id v4 = [(ICFolderDataSource *)self tagHeadingCell];
  [v4 setShouldDisplayTagSelectionOperator:v3];

  if ([(ICFolderDataSource *)self hasGroupInset]
    || ![(ICFolderDataSource *)self shouldShowTagOperatorOnSeparateLine])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v5 = [(ICFolderDataSource *)self tagSelection];
    BOOL v6 = (unint64_t)[v5 selectedTagCount] > 1;
  }
  id v7 = [(ICFolderDataSource *)self indexer];
  unsigned int v8 = [v7 shouldIncludeTagOperator];

  if (v6 != v8)
  {
    id v9 = [(ICFolderDataSource *)self indexer];
    [v9 setShouldIncludeTagOperator:v6];

    [(ICFolderDataSource *)self reloadDataAnimated:1];
  }
}

- (BOOL)shouldDisplayTagOperatorInTagHeading
{
  if ([(ICFolderDataSource *)self hasGroupInset]) {
    return 0;
  }
  else {
    return ![(ICFolderDataSource *)self shouldShowTagOperatorOnSeparateLine];
  }
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (BOOL)shouldShowTagOperatorOnSeparateLine
{
  return self->_shouldShowTagOperatorOnSeparateLine;
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (ICNAViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (ICNAViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICSelectorDelayer)accountChangeDelayer
{
  return self->_accountChangeDelayer;
}

- (ICSelectorDelayer)updateVirtualSmartFoldersDelayer
{
  return self->_updateVirtualSmartFoldersDelayer;
}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)setManagedObjectContextChangeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_updateVirtualSmartFoldersDelayer, 0);
  objc_storeStrong((id *)&self->_accountChangeDelayer, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);

  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end