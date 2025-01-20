@interface RCFolderSelectionCollectionViewController
- (BOOL)_selectionFollowsFocus;
- (BOOL)_showsSeparators;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (Class)_collectionViewCellClass;
- (Class)_collectionViewHeaderCellClass;
- (NSArray)uuidsToMove;
- (NSString)uuidOfSourceFolder;
- (RCFolderSelectionPresenting)presentingDelegate;
- (double)_builtInFolderSectionTopPadding;
- (id)_backgroundColorToUse;
- (id)selectionDelegate;
- (int64_t)_layoutListAppearance;
- (int64_t)folderTypeOfSourceFolder;
- (void)_classSpecificLoadView;
- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4;
- (void)_handleCancel;
- (void)_handleNewFolder;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setFolderTypeOfSourceFolder:(int64_t)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setUuidOfSourceFolder:(id)a3;
- (void)setUuidsToMove:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RCFolderSelectionCollectionViewController

- (void)_classSpecificLoadView
{
  v3 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  [v3 setSupportsMove:0];

  id v7 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  v4 = [(RCFolderSelectionCollectionViewController *)self uuidsToMove];
  v5 = [v7 folderUUIDsToExcludeWhenMovingRecordingUUIDs:v4];
  excludedFolderUUIDsForMove = self->_excludedFolderUUIDsForMove;
  self->_excludedFolderUUIDsForMove = v5;
}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (Class)_collectionViewHeaderCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(RCFoldersCollectionViewController *)self foldersController];
  id v7 = [v6 folderAtIndexPath:v5];

  v8 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v7];
  v9 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  v10 = [(RCFolderSelectionCollectionViewController *)self uuidOfSourceFolder];
  LOBYTE(self) = [v9 canMoveSelectedRecordingsFromFolderWithUUID:v10 toFolderWithDisplayModel:v8 excludedFolderUUIDsForSelection:self->_excludedFolderUUIDsForMove];

  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(RCFoldersCollectionViewController *)self foldersController];
  id v7 = [v6 folderAtIndexPath:v5];

  v8 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v7];
  v9 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  v10 = [(RCFolderSelectionCollectionViewController *)self uuidOfSourceFolder];
  LOBYTE(self) = [v9 canMoveSelectedRecordingsFromFolderWithUUID:v10 toFolderWithDisplayModel:v8 excludedFolderUUIDsForSelection:self->_excludedFolderUUIDsForMove];

  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(RCFoldersCollectionViewController *)self foldersController];
  id v14 = [v6 folderAtIndexPath:v5];

  id v7 = [v14 folderType];
  v8 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  v9 = [(RCFolderSelectionCollectionViewController *)self uuidsToMove];
  if (v7 == (id)4)
  {
    v10 = [v14 uuid];
    [v8 moveRecordingsWithUUIDs:v9 toFolderWithUUID:v10];
  }
  else
  {
    [v8 moveRecordingsWithUUIDs:v9 fromFolderOfType:[self folderTypeOfSourceFolder] toBuiltInFolderOfType:v7];
  }

  v11 = [(RCFolderSelectionCollectionViewController *)self presentingDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(RCFolderSelectionCollectionViewController *)self presentingDelegate];
    [v13 didCompleteFolderSelection];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RCFolderSelectionCollectionViewController;
  [(RCFoldersCollectionViewController *)&v20 viewWillAppear:a3];
  v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"SELECT_A_FOLDER" value:&stru_100228BC8 table:0];
  v6 = [(RCFolderSelectionCollectionViewController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_handleCancel"];
  v8 = [(RCFolderSelectionCollectionViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  v10 = [(RCFolderSelectionCollectionViewController *)self navigationController];
  [v10 setToolbarHidden:0];

  v11 = [v9 createNewFolderImage];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v11 style:0 target:self action:"_handleNewFolder"];
  v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"AX_NEW_FOLDER" value:&stru_100228BC8 table:0];
  [v12 setAccessibilityLabel:v14];

  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:self action:0];
  v21[0] = v15;
  v21[1] = v12;
  v16 = +[NSArray arrayWithObjects:v21 count:2];
  [(RCFolderSelectionCollectionViewController *)self setToolbarItems:v16 animated:1];

  v17 = [(RCFolderSelectionCollectionViewController *)self navigationController];
  v18 = [v17 toolbar];
  v19 = [v9 folderSelectionNavBarNewFolderImageTintColor];
  [v18 setTintColor:v19];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)RCFolderSelectionCollectionViewController;
  [(RCFolderSelectionCollectionViewController *)&v15 viewDidAppear:a3];
  v4 = [(RCFoldersCollectionViewController *)self foldersController];
  id v5 = [v4 builtinFolders];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "folderType", (void)v11) == (id)1)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  unint64_t v10 = [(RCFoldersCollectionViewController *)self _countOfUserFolders];
  if ((v7 & 1) == 0 && !v10) {
    [(RCFolderSelectionCollectionViewController *)self _handleNewFolder];
  }
}

- (void)_handleCancel
{
  v3 = [(RCFolderSelectionCollectionViewController *)self presentingDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RCFolderSelectionCollectionViewController *)self presentingDelegate];
    [v5 didCancelFolderSelection];
  }
}

- (void)_handleNewFolder
{
  id v3 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  [v3 showNewFolderUIFromController:self];
}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCFolderSelectionCollectionViewController;
  id v7 = a4;
  [(RCFoldersCollectionViewController *)&v13 _configureCell:v6 withFolderDisplayModel:v7];
  uint64_t v8 = [(RCFolderSelectionCollectionViewController *)self selectionDelegate];
  v9 = [(RCFolderSelectionCollectionViewController *)self uuidOfSourceFolder];
  id v10 = [v8 canMoveSelectedRecordingsFromFolderWithUUID:v9 toFolderWithDisplayModel:v7 excludedFolderUUIDsForSelection:self->_excludedFolderUUIDsForMove];

  [v6 setEnabled:v10];
  if (v10)
  {
    [v6 setAccessibilityValue:&stru_100228BC8];
  }
  else
  {
    long long v11 = +[NSBundle mainBundle];
    long long v12 = [v11 localizedStringForKey:@"AX_DIMMED_VALUE" value:&stru_100228BC8 table:0];
    [v6 setAccessibilityValue:v12];
  }
}

- (id)_backgroundColorToUse
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 folderSelectionCollectionViewBackgroundColor];

  return v3;
}

- (BOOL)_showsSeparators
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 folderSelectionCollectionViewShowsSeparators];

  return v3;
}

- (int64_t)_layoutListAppearance
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 folderSelectionCollectionViewListAppearance];

  return (int64_t)v3;
}

- (double)_builtInFolderSectionTopPadding
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 folderSelectionCollectionViewTopPadding];
  double v4 = v3;

  return v4;
}

- (BOOL)_selectionFollowsFocus
{
  return 0;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 0;
}

- (id)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (RCFolderSelectionPresenting)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (RCFolderSelectionPresenting *)WeakRetained;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (NSArray)uuidsToMove
{
  return self->_uuidsToMove;
}

- (void)setUuidsToMove:(id)a3
{
}

- (NSString)uuidOfSourceFolder
{
  return self->_uuidOfSourceFolder;
}

- (void)setUuidOfSourceFolder:(id)a3
{
}

- (int64_t)folderTypeOfSourceFolder
{
  return self->_folderTypeOfSourceFolder;
}

- (void)setFolderTypeOfSourceFolder:(int64_t)a3
{
  self->_folderTypeOfSourceFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfSourceFolder, 0);
  objc_storeStrong((id *)&self->_uuidsToMove, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_excludedFolderUUIDsForMove, 0);

  objc_destroyWeak((id *)&self->_selectionDelegate);
}

@end