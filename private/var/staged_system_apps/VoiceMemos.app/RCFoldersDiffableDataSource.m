@interface RCFoldersDiffableDataSource
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)isDuringMove;
- (BOOL)supportsMove;
- (RCFolderSelectionDelegate)selectionDelegate;
- (RCFoldersFetchedResultsController)foldersController;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)setFoldersController:(id)a3;
- (void)setIsDuringMove:(BOOL)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setSupportsMove:(BOOL)a3;
@end

@implementation RCFoldersDiffableDataSource

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v8 isEqualToString:UICollectionElementKindSectionHeader];
  unsigned __int8 v11 = [v8 isEqualToString:@"kFolderCollectionElementKindSectionSpacer"];
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10016DD10((uint64_t)v8, v12);
    }
  }
  if (v10) {
    CFStringRef v13 = @"kFolderHeaderCellReuseIdentifier";
  }
  else {
    CFStringRef v13 = @"kFolderSpacerCellReuseIdentifier";
  }
  v14 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v13 forIndexPath:v9];

  return v14;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(RCFoldersDiffableDataSource *)self supportsMove]) {
    BOOL v6 = [v5 section] == (id)1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(RCFoldersDiffableDataSource *)self foldersController];
  id v11 = [v9 folderAtIndexPath:v8];

  [(RCFoldersDiffableDataSource *)self setIsDuringMove:1];
  unsigned int v10 = [(RCFoldersDiffableDataSource *)self selectionDelegate];
  [v10 moveFolder:v11 toDestinationIndexPath:v7];

  [(RCFoldersDiffableDataSource *)self setIsDuringMove:0];
}

- (RCFolderSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (RCFolderSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
}

- (BOOL)isDuringMove
{
  return self->_isDuringMove;
}

- (void)setIsDuringMove:(BOOL)a3
{
  self->_isDuringMove = a3;
}

- (BOOL)supportsMove
{
  return self->_supportsMove;
}

- (void)setSupportsMove:(BOOL)a3
{
  self->_supportsMove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foldersController, 0);

  objc_destroyWeak((id *)&self->_selectionDelegate);
}

@end