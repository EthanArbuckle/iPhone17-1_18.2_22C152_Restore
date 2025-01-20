@interface RCFoldersCollectionViewController
- (BOOL)_selectionFollowsFocus;
- (BOOL)_showsSeparators;
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (Class)_collectionViewCellClass;
- (Class)_collectionViewHeaderCellClass;
- (NSHashTable)cellsHashTable;
- (NSIndexPath)indexPathOfSelectionDuringEditing;
- (RCFolderSelectionDelegate)selectionDelegate;
- (RCFolderViewController)currentFolderViewController;
- (RCFoldersCollectionViewController)init;
- (RCFoldersDiffableDataSource)diffableDataSource;
- (RCFoldersFetchedResultsController)foldersController;
- (double)_builtInFolderSectionTopPadding;
- (id)_backgroundColorToUse;
- (id)_builtInSectionIdentifier;
- (id)_createCollectionViewLayout;
- (id)_trailingSwipeActionsConfigurationProvider;
- (id)_userFolderSectionIdentifier;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionViewIfLoaded;
- (id)currentActiveFolderViewController;
- (int64_t)_folderTypeAtIndexPath:(id)a3;
- (int64_t)_layoutListAppearance;
- (unint64_t)_countOfRecordingsInUserFolderNamed:(id)a3;
- (unint64_t)_countOfUserFolders;
- (unint64_t)_folderCount;
- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4;
- (void)_restyleAllExtantCells;
- (void)_setupControllerAndDelegation;
- (void)_styleView;
- (void)_toggleFoldersEdit;
- (void)_updateEditButtonStateAndExitEditingIfNeeded;
- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4;
- (void)handleFolderDeletion;
- (void)loadView;
- (void)restyle;
- (void)setCellsHashTable:(id)a3;
- (void)setCurrentFolderViewController:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFoldersController:(id)a3;
- (void)setIndexPathOfSelectionDuringEditing:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RCFoldersCollectionViewController

- (RCFolderSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (RCFolderSelectionDelegate *)WeakRetained;
}

- (RCFoldersCollectionViewController)init
{
  v3 = [(RCFoldersCollectionViewController *)self _createCollectionViewLayout];
  v6.receiver = self;
  v6.super_class = (Class)RCFoldersCollectionViewController;
  v4 = [(RCFoldersCollectionViewController *)&v6 initWithCollectionViewLayout:v3];

  return v4;
}

- (void)setSelectionDelegate:(id)a3
{
  p_selectionDelegate = &self->_selectionDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_selectionDelegate, v5);
  id v6 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  [v6 setSelectionDelegate:v5];
}

- (id)_createCollectionViewLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009E35C;
  v5[3] = &unk_100222320;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)setCurrentFolderViewController:(id)a3
{
}

- (id)currentActiveFolderViewController
{
  p_currentFolderViewController = &self->_currentFolderViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFolderViewController);
  unsigned __int8 v4 = [WeakRetained isInactive];

  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = objc_loadWeakRetained((id *)p_currentFolderViewController);
  }

  return v5;
}

- (id)collectionViewIfLoaded
{
  if ([(RCFoldersCollectionViewController *)self isViewLoaded])
  {
    id v3 = [(RCFoldersCollectionViewController *)self collectionView];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (RCFoldersDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)RCFoldersCollectionViewController;
  [(RCFoldersCollectionViewController *)&v18 loadView];
  [(RCFoldersCollectionViewController *)self _setupControllerAndDelegation];
  objc_initWeak(&location, self);
  id v3 = [RCFoldersDiffableDataSource alloc];
  unsigned __int8 v4 = [(RCFoldersCollectionViewController *)self collectionView];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10009E114;
  v15 = &unk_100222D30;
  objc_copyWeak(&v16, &location);
  id v5 = [(RCFoldersDiffableDataSource *)v3 initWithCollectionView:v4 cellProvider:&v12];

  -[RCFoldersCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5, v12, v13, v14, v15);
  id v6 = +[NSHashTable weakObjectsHashTable];
  [(RCFoldersCollectionViewController *)self setCellsHashTable:v6];

  v7 = [(RCFoldersCollectionViewController *)self foldersController];
  [(RCFoldersDiffableDataSource *)v5 setFoldersController:v7];

  v8 = [(RCFoldersCollectionViewController *)self selectionDelegate];
  [(RCFoldersDiffableDataSource *)v5 setSelectionDelegate:v8];

  v9 = [(RCFoldersCollectionViewController *)self collectionView];
  [v9 setDataSource:v5];

  BOOL v10 = [(RCFoldersCollectionViewController *)self _selectionFollowsFocus];
  v11 = [(RCFoldersCollectionViewController *)self collectionView];
  [v11 setSelectionFollowsFocus:v10];

  [(RCFoldersCollectionViewController *)self _classSpecificLoadView];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_setupControllerAndDelegation
{
  if (!self->_foldersController)
  {
    id v5 = +[RCApplicationModel sharedApplicationModel];
    id v3 = [v5 foldersController];
    foldersController = self->_foldersController;
    self->_foldersController = v3;

    [(RCFoldersFetchedResultsController *)self->_foldersController addContentObserver:self];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RCFoldersCollectionViewController;
  [(RCFoldersCollectionViewController *)&v8 viewDidLoad];
  id v3 = [(RCFoldersCollectionViewController *)self collectionView];
  [v3 registerClass:[self _collectionViewCellClass] forCellWithReuseIdentifier:@"kFolderCellReuseIdentifier"];
  [v3 registerClass:[self _collectionViewHeaderCellClass] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kFolderHeaderCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"kFolderCollectionElementKindSectionSpacer" withReuseIdentifier:@"kFolderSpacerCellReuseIdentifier"];
  unsigned __int8 v4 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  id v5 = [(RCFoldersFetchedResultsController *)self->_foldersController currentSnapshot];
  [v4 applySnapshot:v5 animatingDifferences:0];

  id v6 = [(RCFoldersCollectionViewController *)self editButtonItem];
  v7 = [(RCFoldersCollectionViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RCFoldersCollectionViewController;
  [(RCFoldersCollectionViewController *)&v11 viewWillAppear:a3];
  unsigned __int8 v4 = [(RCFoldersCollectionViewController *)self editButtonItem];
  [v4 setAction:"_toggleFoldersEdit"];

  id v5 = [(RCFoldersCollectionViewController *)self parentViewController];
  id v6 = [v5 navigationItem];
  v7 = [(RCFoldersCollectionViewController *)self editButtonItem];
  [v6 setRightBarButtonItem:v7];

  objc_super v8 = [(RCFoldersCollectionViewController *)self collectionView];
  v9 = [v8 indexPathForSelectedItem];

  if (v9)
  {
    BOOL v10 = [(RCFoldersCollectionViewController *)self collectionView];
    [v10 deselectItemAtIndexPath:v9 animated:0];
  }
  [(RCFoldersCollectionViewController *)self _styleView];
  [(RCFoldersCollectionViewController *)self _updateEditButtonStateAndExitEditingIfNeeded];
}

- (void)_toggleFoldersEdit
{
  uint64_t v3 = [(RCFoldersCollectionViewController *)self isEditing] ^ 1;

  [(RCFoldersCollectionViewController *)self setEditing:v3 animated:1];
}

- (void)_updateEditButtonStateAndExitEditingIfNeeded
{
  unint64_t v3 = [(RCFoldersCollectionViewController *)self _countOfUserFolders];
  unsigned __int8 v4 = [(RCFoldersCollectionViewController *)self editButtonItem];
  [v4 setEnabled:v3 != 0];

  if (!v3 && [(RCFoldersCollectionViewController *)self isEditing])
  {
    [(RCFoldersCollectionViewController *)self setEditing:0 animated:1];
  }
}

- (int64_t)_folderTypeAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RCFoldersCollectionViewController *)self foldersController];
  id v6 = [v5 folderAtIndexPath:v4];

  id v7 = [v6 folderType];
  return (int64_t)v7;
}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v6 displayName];
  id v8 = [v6 recordingsCount];
  v9 = [v6 iconImage];
  BOOL v10 = [v6 UUID];
  objc_msgSend(v12, "configureWithFolderName:recordingsCount:iconImage:UUID:folderType:", v7, v8, v9, v10, objc_msgSend(v6, "folderType"));

  if ([(RCFoldersCollectionViewController *)self isEditing]) {
    BOOL v11 = [v6 folderType] == (id)4;
  }
  else {
    BOOL v11 = 1;
  }
  [v12 setEnabled:v11];
}

- (unint64_t)_countOfUserFolders
{
  id v2 = [(RCFoldersCollectionViewController *)self foldersController];
  unint64_t v3 = [v2 userFolders];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unint64_t)_countOfRecordingsInUserFolderNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[RCApplicationModel sharedApplicationModel];
  id v5 = [v4 folderWithName:v3];

  if (v5) {
    id v6 = [v4 playableCountForFolder:v5];
  }
  else {
    id v6 = 0;
  }

  return (unint64_t)v6;
}

- (id)_trailingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009EB9C;
  v4[3] = &unk_1002223C0;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v6 = a6;
  if ([v6 section] == (id)1)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSIndexPath indexPathForRow:0 inSection:1];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return [a4 section] != 0;
}

- (Class)_collectionViewCellClass
{
  [(RCFoldersCollectionViewController *)self doesNotRecognizeSelector:a2];

  return (Class)objc_opt_class();
}

- (Class)_collectionViewHeaderCellClass
{
  [(RCFoldersCollectionViewController *)self doesNotRecognizeSelector:a2];

  return (Class)objc_opt_class();
}

- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4
{
  id v32 = a4;
  id v5 = [(RCFoldersCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  id v7 = [v6 firstObject];

  if (v7) {
    goto LABEL_2;
  }
  BOOL v10 = [(RCFoldersCollectionViewController *)self collectionView];
  unsigned int v11 = [v10 isEditing];

  if (v11)
  {
    id v7 = [(RCFoldersCollectionViewController *)self indexPathOfSelectionDuringEditing];
    if (v7)
    {
LABEL_2:
      id v8 = [(RCFoldersCollectionViewController *)self diffableDataSource];
      v9 = [v8 itemIdentifierForIndexPath:v7];

      goto LABEL_7;
    }
    v9 = 0;
  }
  else
  {
    v9 = 0;
    id v7 = 0;
  }
LABEL_7:
  id v12 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  uint64_t v13 = [v12 snapshot];

  v14 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  v15 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  [v14 applySnapshot:v32 animatingDifferences:[v15 isDuringMove] ^ 1];

  id v16 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  v17 = [v16 snapshot];
  id v18 = [v17 numberOfItems];
  if (v18 != [v13 numberOfItems])
  {

LABEL_13:
    if (!v9) {
      goto LABEL_24;
    }
    v23 = [(RCFoldersCollectionViewController *)self _builtInSectionIdentifier];
    id v26 = [v13 numberOfItemsInSection:v23];
    id v27 = [v32 numberOfItemsInSection:v23];
    v25 = [(RCFoldersCollectionViewController *)self _userFolderSectionIdentifier];
    if ([v13 indexOfSectionIdentifier:v25] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v28 = 0;
    }
    else
    {
      id v29 = [v13 numberOfItemsInSection:v25];
      BOOL v30 = [v32 indexOfSectionIdentifier:v25] == (id)0x7FFFFFFFFFFFFFFFLL;
      v31 = v32;
      if (v30) {
        goto LABEL_20;
      }
      BOOL v28 = v29 > [v32 numberOfItemsInSection:v25];
    }
    v31 = v32;
    if (v26 <= v27 && !v28)
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_20:
    if ([v31 indexOfItemIdentifier:v9] == (id)0x7FFFFFFFFFFFFFFFLL) {
      [(RCFoldersCollectionViewController *)self handleFolderDeletion];
    }
    goto LABEL_22;
  }
  v19 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  v20 = [v19 snapshot];
  id v21 = [v20 numberOfSections];
  id v22 = [v13 numberOfSections];

  if (v21 != v22) {
    goto LABEL_13;
  }
  v23 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  if ([v23 isDuringMove])
  {
    v24 = [(RCFoldersCollectionViewController *)self indexPathOfSelectionDuringEditing];

    if (!v24) {
      goto LABEL_24;
    }
    v23 = [(RCFoldersCollectionViewController *)self diffableDataSource];
    v25 = [v23 indexPathForItemIdentifier:v9];
    [(RCFoldersCollectionViewController *)self setIndexPathOfSelectionDuringEditing:v25];
    goto LABEL_22;
  }
LABEL_23:

LABEL_24:
  [(RCFoldersCollectionViewController *)self _updateEditButtonStateAndExitEditingIfNeeded];
}

- (id)_builtInSectionIdentifier
{
  return +[NSString stringWithFormat:@"%d", 0];
}

- (id)_userFolderSectionIdentifier
{
  return +[NSString stringWithFormat:@"%d", 1];
}

- (void)handleFolderDeletion
{
}

- (unint64_t)_folderCount
{
  id v3 = [(RCFoldersCollectionViewController *)self foldersController];
  id v4 = [v3 builtinFolders];
  id v5 = (char *)[v4 count];

  id v6 = [(RCFoldersCollectionViewController *)self foldersController];
  id v7 = [v6 userFolders];
  id v8 = &v5[(void)[v7 count]];

  return (unint64_t)v8;
}

- (void)restyle
{
  [(RCFoldersCollectionViewController *)self _styleView];
  id v3 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  [v3 restyle];
}

- (void)_styleView
{
  [(RCFoldersCollectionViewController *)self _restyleAllExtantCells];
  BOOL v3 = [(RCFoldersCollectionViewController *)self _selectionFollowsFocus];
  id v4 = [(RCFoldersCollectionViewController *)self collectionView];
  [v4 setSelectionFollowsFocus:v3];
}

- (void)_restyleAllExtantCells
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(RCFoldersCollectionViewController *)self cellsHashTable];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RCRestylableProtocol]) {
          [v7 restyle];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_backgroundColorToUse
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 sidebarCollectionViewBackgroundColor];

  return v3;
}

- (BOOL)_showsSeparators
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 sidebarCollectionViewShowsSeparators];

  return v3;
}

- (int64_t)_layoutListAppearance
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 sidebarCollectionViewListAppearance];

  return (int64_t)v3;
}

- (double)_builtInFolderSectionTopPadding
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 sidebarCollectionViewTopPadding];
  double v4 = v3;

  return v4;
}

- (BOOL)_selectionFollowsFocus
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 sidebarSelectionFollowsFocus];

  return v3;
}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
}

- (void)setDiffableDataSource:(id)a3
{
}

- (RCFolderViewController)currentFolderViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFolderViewController);

  return (RCFolderViewController *)WeakRetained;
}

- (NSHashTable)cellsHashTable
{
  return self->_cellsHashTable;
}

- (void)setCellsHashTable:(id)a3
{
}

- (NSIndexPath)indexPathOfSelectionDuringEditing
{
  return self->_indexPathOfSelectionDuringEditing;
}

- (void)setIndexPathOfSelectionDuringEditing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfSelectionDuringEditing, 0);
  objc_storeStrong((id *)&self->_cellsHashTable, 0);
  objc_destroyWeak((id *)&self->_currentFolderViewController);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_foldersController, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);

  objc_storeStrong((id *)&self->_folderUUID, 0);
}

@end