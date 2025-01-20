@interface __RCFolderContentsDelegate
- (RCFoldersFetchedResultsController)foldersController;
- (void)controllerDidChangeContent:(id)a3;
- (void)setFoldersController:(id)a3;
@end

@implementation __RCFolderContentsDelegate

- (void)controllerDidChangeContent:(id)a3
{
  id v6 = [a3 folder];
  id v4 = [v6 folderType];
  foldersController = self->_foldersController;
  if (v4 == (id)4) {
    [(RCFoldersFetchedResultsController *)foldersController reloadUserFolder:v6];
  }
  else {
    [(RCFoldersFetchedResultsController *)foldersController reloadBuiltinFolder:v6];
  }
}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
  self->_foldersController = (RCFoldersFetchedResultsController *)a3;
}

@end