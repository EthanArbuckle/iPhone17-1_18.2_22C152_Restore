@interface RCFolderBrowsingCollectionViewController
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isShowingRecentlyDeleted;
- (Class)_collectionViewCellClass;
- (Class)_collectionViewHeaderCellClass;
- (RCCloudRecording)selectedRecording;
- (RCFolderBrowsingDelegate)browsingDelegate;
- (RCLibraryActionHandler)libraryActionHandler;
- (RCRecordingViewController)recordingViewController;
- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate;
- (RCRecordingsCollectionViewController)activeRecordingsCollectionViewController;
- (id)_allRecordingsIndexPath;
- (id)_currentActiveFolder;
- (id)_currentFolder:(BOOL)a3;
- (id)_uuidArrayFromItemArray:(id)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)undoManager;
- (id)viewWillDisappearBlock;
- (void)_classSpecificLoadView;
- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4;
- (void)_dropLocalRecordingsWithUUIDArray:(id)a3 intoDestinationFolder:(id)a4 fromFolderType:(int64_t)a5 fromFolderUUID:(id)a6;
- (void)_pushViewControllerForFolderAtIndexPath:(id)a3;
- (void)_pushViewControllerForFolderOfType:(int64_t)a3 withName:(id)a4 folderUUID:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_selectActiveFolderIfNeeded;
- (void)_selectAllRecordingsFolderForActiveFolderDeletion;
- (void)_updateCellSelectionForActiveFolder;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)deleteFolderWithFolderName:(id)a3;
- (void)goToBuiltInFolderOfType:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)goToUserFolderWithName:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)handleFolderDeletion;
- (void)restyle;
- (void)setBrowsingDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLibraryActionHandler:(id)a3;
- (void)setRecordingViewControllerDelegate:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setViewWillDisappearBlock:(id)a3;
- (void)showRenamingControllerWithFolderName:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RCFolderBrowsingCollectionViewController

- (void)setRecordingViewControllerDelegate:(id)a3
{
  p_recordingViewControllerDelegate = &self->_recordingViewControllerDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_recordingViewControllerDelegate, v5);
  id v6 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  [v6 setRecordingViewControllerDelegate:v5];
}

- (void)setLibraryActionHandler:(id)a3
{
  p_libraryActionHandler = &self->_libraryActionHandler;
  id v5 = a3;
  objc_storeWeak((id *)p_libraryActionHandler, v5);
  id v7 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  id v6 = [v7 recordingsCollectionViewController];
  [v6 setLibraryActionHandler:v5];
}

- (void)goToBuiltInFolderOfType:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  switch(a3)
  {
    case 0:
      v9 = +[RCApplicationModel sharedApplicationModel];
      uint64_t v10 = [v9 voiceMemosRecordingsFolder];
      goto LABEL_6;
    case 1:
      v9 = +[RCApplicationModel sharedApplicationModel];
      uint64_t v10 = [v9 favoriteRecordingsFolder];
      goto LABEL_6;
    case 2:
      v9 = +[RCApplicationModel sharedApplicationModel];
      uint64_t v10 = [v9 capturedOnWatchRecordingsFolder];
      goto LABEL_6;
    case 3:
      v9 = +[RCApplicationModel sharedApplicationModel];
      uint64_t v10 = [v9 recentlyDeletedRecordingsFolder];
LABEL_6:
      v11 = v10;

      if (!v11) {
        goto LABEL_8;
      }
      v12 = [v11 uuid];
      v13 = +[RCFolderDisplayModel folderNameForBuiltInFolderOfType:a3];
      [(RCFolderBrowsingCollectionViewController *)self _pushViewControllerForFolderOfType:a3 withName:v13 folderUUID:v12 animated:v5 completion:v8];

      break;
    default:
LABEL_8:
      v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10016DD9C(a3, v11);
      }
      break;
  }
}

- (void)_pushViewControllerForFolderOfType:(int64_t)a3 withName:(id)a4 folderUUID:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ((unint64_t)a3 >= 4)
  {
    if (a3 != 4)
    {
      v27 = 0;
      goto LABEL_7;
    }
    v15 = [[RCFolderViewController alloc] initWithUserFolderNamed:v12 folderUUID:v13];
  }
  else
  {
    v15 = [[RCFolderViewController alloc] initWithBuiltInFolderType:a3 folderUUID:v13];
  }
  v27 = v15;
LABEL_7:
  v16 = [(RCFoldersCollectionViewController *)self selectionDelegate];
  v17 = [(RCFolderViewController *)v27 recordingsCollectionViewController];
  [v17 setFolderSelectionDelegate:v16];

  [(RCFoldersCollectionViewController *)self setCurrentFolderViewController:v27];
  v18 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];

  if (v18)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v27);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001B3D0;
    v34[3] = &unk_100222D80;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(&v38, location);
    id v28 = v12;
    id v35 = v12;
    v36 = self;
    [(RCFolderViewController *)v27 setSetupBlock:v34];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10009FEE0;
    v32[3] = &unk_1002214F8;
    objc_copyWeak(&v33, &from);
    [(RCFolderViewController *)v27 setTeardownBlock:v32];
    v19 = [(RCFolderViewController *)v27 setupBlock];

    if (v19)
    {
      v20 = [(RCFolderViewController *)v27 setupBlock];
      v20[2]();
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:!v8];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000DFD4;
    v29[3] = &unk_100222DD0;
    BOOL v31 = v8;
    v29[4] = self;
    id v30 = v14;
    +[CATransaction setCompletionBlock:v29];
    v21 = [(RCFolderBrowsingCollectionViewController *)self splitViewController];
    [v21 setViewController:v27 forColumn:1];

    v22 = [(RCFolderViewController *)v27 navigationController];
    v23 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v24 = [v23 usesLargeTitles];
    v25 = [v22 navigationBar];
    [v25 setPrefersLargeTitles:v24];

    [v22 setToolbarHidden:1 animated:1];
    +[CATransaction commit];
    v26 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
    [v26 didSelectFolderOfType:a3];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
    id v12 = v28;
  }
  [(RCFoldersCollectionViewController *)self setCurrentFolderViewController:v27];
  [(RCFolderBrowsingCollectionViewController *)self _selectActiveFolderIfNeeded];
}

- (RCRecordingsCollectionViewController)activeRecordingsCollectionViewController
{
  v2 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  v3 = [v2 recordingsCollectionViewController];

  return (RCRecordingsCollectionViewController *)v3;
}

- (void)setUndoManager:(id)a3
{
}

- (void)setBrowsingDelegate:(id)a3
{
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);

  return (RCRecordingViewControllerDelegate *)WeakRetained;
}

- (RCLibraryActionHandler)libraryActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryActionHandler);

  return (RCLibraryActionHandler *)WeakRetained;
}

- (RCFolderBrowsingDelegate)browsingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browsingDelegate);

  return (RCFolderBrowsingDelegate *)WeakRetained;
}

- (void)_selectActiveFolderIfNeeded
{
  if ([(RCFolderBrowsingCollectionViewController *)self isViewLoaded])
  {
    v3 = [(RCFolderBrowsingCollectionViewController *)self splitViewController];
    unsigned __int8 v4 = [v3 isCollapsed];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = [(RCFolderBrowsingCollectionViewController *)self _currentActiveFolder];
      if (v5)
      {
        id v12 = v5;
        id v6 = [(RCFoldersCollectionViewController *)self foldersController];
        id v7 = [v6 indexPathForFolder:v12];

        BOOL v8 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
        v9 = [v8 indexPathsForSelectedItems];
        uint64_t v10 = [v9 firstObject];

        if (([v10 isEqual:v7] & 1) == 0)
        {
          if ([(RCFolderBrowsingCollectionViewController *)self isEditing])
          {
            [(RCFoldersCollectionViewController *)self setIndexPathOfSelectionDuringEditing:v7];
          }
          else
          {
            v11 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
            [v11 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
          }
        }

        BOOL v5 = v12;
      }
    }
  }
}

- (RCCloudRecording)selectedRecording
{
  v2 = [(RCFolderBrowsingCollectionViewController *)self activeRecordingsCollectionViewController];
  v3 = [v2 selectedRecording];

  return (RCCloudRecording *)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v26 = [(RCFolderBrowsingCollectionViewController *)self isEditing];
  if (!v26 && v5)
  {
    id v7 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
    BOOL v8 = [v7 indexPathsForSelectedItems];
    v9 = [v8 firstObject];
    [(RCFoldersCollectionViewController *)self setIndexPathOfSelectionDuringEditing:v9];
  }
  v32.receiver = self;
  v32.super_class = (Class)RCFolderBrowsingCollectionViewController;
  BOOL v27 = v5;
  [(RCFolderBrowsingCollectionViewController *)&v32 setEditing:v5 animated:v4];
  uint64_t v10 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
  [v10 didChangeEditingState];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v11 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
  id v12 = [v11 visibleCells];

  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v18 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
        v19 = [v18 indexPathForCell:v17];

        if ([(RCFolderBrowsingCollectionViewController *)self isEditing]) {
          BOOL v20 = [v19 section] == (id)1;
        }
        else {
          BOOL v20 = 1;
        }
        [v17 setEnabled:v20];
        if ([v17 enabled])
        {
          [v17 setAccessibilityValue:&stru_100228BC8];
        }
        else
        {
          v21 = +[NSBundle mainBundle];
          v22 = [v21 localizedStringForKey:@"AX_DIMMED_VALUE" value:&stru_100228BC8 table:0];
          [v17 setAccessibilityValue:v22];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v14);
  }

  if ((v26 & !v27) == 1)
  {
    v23 = [(RCFoldersCollectionViewController *)self indexPathOfSelectionDuringEditing];

    if (v23)
    {
      id v24 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
      v25 = [(RCFoldersCollectionViewController *)self indexPathOfSelectionDuringEditing];
      [v24 selectItemAtIndexPath:v25 animated:0 scrollPosition:0];

      [(RCFoldersCollectionViewController *)self setIndexPathOfSelectionDuringEditing:0];
    }
  }
}

- (RCRecordingViewController)recordingViewController
{
  v2 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  v3 = [v2 recordingViewController];

  return (RCRecordingViewController *)v3;
}

- (id)undoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoManager);

  return WeakRetained;
}

- (void)_classSpecificLoadView
{
  id v2 = [(RCFoldersCollectionViewController *)self diffableDataSource];
  [v2 setSupportsMove:1];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCFolderBrowsingCollectionViewController;
  [(RCFoldersCollectionViewController *)&v4 viewDidLoad];
  v3 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
  [v3 setDropDelegate:self];
  [v3 setDragDelegate:self];
}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (Class)_collectionViewHeaderCellClass
{
  return (Class)objc_opt_class();
}

- (void)handleFolderDeletion
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  [(RCFolderBrowsingCollectionViewController *)self _pushViewControllerForFolderAtIndexPath:a4];
  id v5 = [(RCFolderBrowsingCollectionViewController *)self splitViewController];
  [v5 hidePrimaryColumnIfNeeded];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
  id v7 = [v6 indexPathsForSelectedItems];
  BOOL v8 = [v7 firstObject];

  BOOL v9 = !v8 || ([v8 isEqual:v5] & 1) == 0;
  return v9;
}

- (void)_pushViewControllerForFolderAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RCFoldersCollectionViewController *)self foldersController];
  id v10 = [v5 folderAtIndexPath:v4];

  id v6 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v10];
  id v7 = [v10 folderType];
  BOOL v8 = [v6 displayName];
  BOOL v9 = [v6 UUID];
  [(RCFolderBrowsingCollectionViewController *)self _pushViewControllerForFolderOfType:v7 withName:v8 folderUUID:v9 animated:1 completion:0];
}

- (void)restyle
{
  v5.receiver = self;
  v5.super_class = (Class)RCFolderBrowsingCollectionViewController;
  [(RCFoldersCollectionViewController *)&v5 restyle];
  v3 = [(RCFoldersCollectionViewController *)self currentFolderViewController];
  id v4 = [v3 recordingViewController];
  [v4 restyle];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCFolderBrowsingCollectionViewController;
  [(RCFolderBrowsingCollectionViewController *)&v8 viewDidAppear:a3];
  [(RCFolderBrowsingCollectionViewController *)self _updateCellSelectionForActiveFolder];
  id v4 = [(RCFolderBrowsingCollectionViewController *)self _currentActiveFolder];
  if (!v4)
  {
    objc_super v5 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
    [v5 didReturnToFoldersList];
  }
  UIAccessibilityNotifications v6 = UIAccessibilityLayoutChangedNotification;
  id v7 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
  UIAccessibilityPostNotification(v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCFolderBrowsingCollectionViewController;
  -[RCFolderBrowsingCollectionViewController viewWillDisappear:](&v8, "viewWillDisappear:");
  [(RCFolderBrowsingCollectionViewController *)self setEditing:0 animated:v3];
  objc_super v5 = [(RCFolderBrowsingCollectionViewController *)self navigationController];
  [v5 setToolbarHidden:1 animated:v3];

  UIAccessibilityNotifications v6 = [(RCFolderBrowsingCollectionViewController *)self viewWillDisappearBlock];

  if (v6)
  {
    id v7 = [(RCFolderBrowsingCollectionViewController *)self viewWillDisappearBlock];
    v7[2]();

    [(RCFolderBrowsingCollectionViewController *)self setViewWillDisappearBlock:0];
  }
}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCFolderBrowsingCollectionViewController;
  id v6 = a3;
  [(RCFoldersCollectionViewController *)&v7 _configureCell:v6 withFolderDisplayModel:a4];
  [v6 setActionHandler:self];
}

- (void)_updateCellSelectionForActiveFolder
{
  id v6 = [(RCFolderBrowsingCollectionViewController *)self _currentActiveFolder];
  if (v6)
  {
    BOOL v3 = [(RCFoldersCollectionViewController *)self foldersController];
    id v4 = [v3 indexPathForFolder:v6];

    objc_super v5 = [(RCFolderBrowsingCollectionViewController *)self collectionView];
    [v5 selectItemAtIndexPath:v4 animated:0 scrollPosition:0];
  }
}

- (id)_currentActiveFolder
{
  return [(RCFolderBrowsingCollectionViewController *)self _currentFolder:0];
}

- (id)_currentFolder:(BOOL)a3
{
  if (a3) {
    [(RCFoldersCollectionViewController *)self currentFolderViewController];
  }
  else {
  BOOL v3 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  }
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 folderTitle];
    id v6 = [v4 folderType];
    objc_super v7 = +[RCApplicationModel sharedApplicationModel];
    objc_super v8 = v7;
    switch((unint64_t)v6)
    {
      case 0uLL:
        uint64_t v9 = [v7 voiceMemosRecordingsFolder];
        goto LABEL_13;
      case 1uLL:
        uint64_t v9 = [v7 favoriteRecordingsFolder];
        goto LABEL_13;
      case 2uLL:
        uint64_t v9 = [v7 capturedOnWatchRecordingsFolder];
        goto LABEL_13;
      case 3uLL:
        uint64_t v9 = [v7 recentlyDeletedRecordingsFolder];
        goto LABEL_13;
      case 4uLL:
        uint64_t v9 = [v7 existingFolderWithName:v5];
LABEL_13:
        id v10 = (void *)v9;
        break;
      default:
        id v10 = 0;
        break;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_selectAllRecordingsFolderForActiveFolderDeletion
{
  BOOL v3 = [(RCFolderBrowsingCollectionViewController *)self splitViewController];
  unsigned int v4 = [v3 isCollapsed];

  if (v4)
  {
    [(RCFolderBrowsingCollectionViewController *)self goToBuiltInFolderOfType:0 animated:0 completion:0];
  }
  else
  {
    id v6 = [(RCFolderBrowsingCollectionViewController *)self _allRecordingsIndexPath];
    -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderAtIndexPath:](self, "_pushViewControllerForFolderAtIndexPath:");
    objc_super v5 = [(RCFoldersCollectionViewController *)self indexPathOfSelectionDuringEditing];

    if (v5) {
      [(RCFoldersCollectionViewController *)self setIndexPathOfSelectionDuringEditing:v6];
    }
  }
}

- (id)_allRecordingsIndexPath
{
  BOOL v3 = +[RCApplicationModel sharedApplicationModel];
  unsigned int v4 = [v3 voiceMemosRecordingsFolder];

  objc_super v5 = [(RCFoldersCollectionViewController *)self foldersController];
  id v6 = [v5 indexPathForFolder:v4];

  return v6;
}

- (void)showRenamingControllerWithFolderName:(id)a3
{
  id v4 = a3;
  id v5 = [(RCFoldersCollectionViewController *)self selectionDelegate];
  [v5 showRenamingControllerWithFolderName:v4 controller:self];
}

- (void)deleteFolderWithFolderName:(id)a3
{
  id v4 = a3;
  id v7 = +[RCApplicationModel sharedApplicationModel];
  id v5 = [v7 folderWithName:v4];

  id v6 = [(RCFoldersCollectionViewController *)self selectionDelegate];
  [v6 deleteFolder:v5 controller:self completionBlock:0];
}

- (void)goToUserFolderWithName:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v14 = +[RCApplicationModel sharedApplicationModel];
  id v10 = [v14 folderWithName:v9];

  id v11 = [v10 folderType];
  id v12 = [v10 name];
  id v13 = [v10 uuid];
  [(RCFolderBrowsingCollectionViewController *)self _pushViewControllerForFolderOfType:v11 withName:v12 folderUUID:v13 animated:v5 completion:v8];
}

- (BOOL)isShowingRecentlyDeleted
{
  id v2 = [(RCFoldersCollectionViewController *)self currentActiveFolderViewController];
  BOOL v3 = [v2 recordingsCollectionViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v8 section])
  {
    id v9 = [(RCFoldersCollectionViewController *)self foldersController];
    id v10 = [v9 folderAtIndexPath:v8];

    id v11 = [v10 folderType];
    id v12 = [v10 uuid];
    id v13 = +[RCLocalDropContext dropContextWithFolderType:v11 folderUUID:v12 folderIndexPath:v8 payloadType:1];

    [v7 setLocalContext:v13];
    id v14 = objc_opt_new();
    id v15 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v14];
    id v18 = v15;
    v16 = +[NSArray arrayWithObjects:&v18 count:1];
  }
  else
  {
    v16 = &__NSArray0__struct;
  }

  return v16;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4 = [(RCFolderBrowsingCollectionViewController *)self libraryActionHandler];
  [v4 willBeginDragSession];
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v4 = [(RCFolderBrowsingCollectionViewController *)self libraryActionHandler];
  [v4 didEndDragSession];
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = a4;
  BOOL v5 = [v4 localDragSession];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    id v7 = +[RCCaptureFormat supportedFileTypeIdentifiers];
    uint64_t v6 = [v4 hasItemsConformingToTypeIdentifiers:v7];
  }
  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [v6 session];
  id v8 = [v7 localDragSession];

  id v9 = [v6 destinationIndexPath];
  id v10 = [(RCFoldersCollectionViewController *)self foldersController];
  id v11 = [v10 folderAtIndexPath:v9];

  if (v8)
  {
    id v12 = [v6 session];
    id v13 = [v12 localDragSession];
    id v14 = [v13 localContext];

    id v15 = [v14 payloadType];
    if (v15 == (id)1)
    {
      v22 = [v14 folderIndexPath];
      unsigned __int8 v23 = [v22 isEqual:v9];

      if (v23) {
        goto LABEL_9;
      }
      id v18 = [v24 dataSource];
      BOOL v20 = [v14 folderIndexPath];
      [v18 collectionView:v24 moveItemAtIndexPath:v20 toIndexPath:v9];
    }
    else
    {
      if (v15) {
        goto LABEL_9;
      }
      v16 = [v6 session];
      v17 = [v16 items];
      id v18 = [(RCFolderBrowsingCollectionViewController *)self _uuidArrayFromItemArray:v17];

      id v19 = [v14 folderType];
      BOOL v20 = [v14 folderUUID];
      [(RCFolderBrowsingCollectionViewController *)self _dropLocalRecordingsWithUUIDArray:v18 intoDestinationFolder:v11 fromFolderType:v19 fromFolderUUID:v20];
    }
  }
  else
  {
    v21 = [(RCFoldersCollectionViewController *)self foldersController];
    id v14 = [v21 folderAtIndexPath:v9];

    [v24 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
    [(RCFolderBrowsingCollectionViewController *)self collectionView:v24 didSelectItemAtIndexPath:v9];
    id v18 = [(RCFolderBrowsingCollectionViewController *)self activeRecordingsCollectionViewController];
    BOOL v20 = [v6 session];
    [v18 performDropWithSession:v20 folder:v14];
  }

LABEL_9:
}

- (void)_dropLocalRecordingsWithUUIDArray:(id)a3 intoDestinationFolder:(id)a4 fromFolderType:(int64_t)a5 fromFolderUUID:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v20 && [v20 count])
  {
    id v12 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v10];
    unsigned int v13 = [v12 representsPossibleMoveDestination];
    id v14 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
    id v15 = [v10 uuid];
    unsigned int v16 = [v14 canMoveRecordingsWithUUIDs:v20 toFolderWithUUID:v15 toFolderType:[v12 folderType] fromFolderUUID:v11];

    if (v13 && v16)
    {
      id v17 = [v12 folderType];
      id v18 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
      if (v17 == (id)4)
      {
        id v19 = [v12 UUID];
        [v18 moveRecordingsWithUUIDs:v20 toFolderWithUUID:v19];
      }
      else
      {
        [v18 moveRecordingsWithUUIDs:v20 fromFolderOfType:a5 toBuiltInFolderOfType:[v12 folderType]];
      }
    }
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:1 intent:0];
  id v10 = v9;
  if (!v8)
  {
    id v28 = v9;
    goto LABEL_25;
  }
  id v11 = [v7 localDragSession];

  id v12 = [(RCFoldersCollectionViewController *)self foldersController];
  unsigned int v13 = [v12 folderAtIndexPath:v8];

  if (v13)
  {
    id v14 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v13];
    id v15 = v14;
    if (!v11)
    {
      unint64_t v29 = (unint64_t)[v14 folderType] & 0xFFFFFFFFFFFFFFFELL;
      id v30 = objc_alloc((Class)UICollectionViewDropProposal);
      if (v29 == 2)
      {
        uint64_t v31 = 1;
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v31 = 2;
        uint64_t v32 = 2;
      }
      id v17 = v10;
      id v10 = [v30 initWithDropOperation:v31 intent:v32];
      goto LABEL_23;
    }
    unsigned int v16 = [v7 localDragSession];
    id v17 = [v16 localContext];

    id v18 = [v17 payloadType];
    if (v18 != (id)1)
    {
      if (!v18)
      {
        id v19 = [v7 items];
        uint64_t v41 = [(RCFolderBrowsingCollectionViewController *)self _uuidArrayFromItemArray:v19];

        unsigned int v39 = [v15 representsPossibleMoveDestination];
        id v20 = [(RCFolderBrowsingCollectionViewController *)self browsingDelegate];
        v21 = [v15 UUID];
        v40 = v15;
        id v22 = [v15 folderType];
        unsigned __int8 v23 = [v17 folderUUID];
        unsigned __int8 v24 = [v20 canMoveRecordingsWithUUIDs:v41 toFolderWithUUID:v21 toFolderType:v22 fromFolderUUID:v23];

        id v25 = objc_alloc((Class)UICollectionViewDropProposal);
        if (v39 && (v24 & 1) != 0)
        {
          uint64_t v26 = 3;
          uint64_t v27 = 2;
        }
        else
        {
          uint64_t v26 = 1;
          uint64_t v27 = 0;
        }
        id v37 = [v25 initWithDropOperation:v26 intent:v27];

        id v15 = v40;
        id v10 = (id)v41;
        goto LABEL_22;
      }
LABEL_23:

      id v28 = v10;
      goto LABEL_24;
    }
    id v33 = [v8 section];
    if (v33 == (id)1)
    {
      id v34 = objc_alloc((Class)UICollectionViewDropProposal);
      uint64_t v35 = 3;
      uint64_t v36 = 1;
    }
    else
    {
      if (v33) {
        goto LABEL_23;
      }
      id v34 = objc_alloc((Class)UICollectionViewDropProposal);
      uint64_t v35 = 1;
      uint64_t v36 = 0;
    }
    id v37 = [v34 initWithDropOperation:v35 intent:v36];
LABEL_22:

    id v10 = v37;
    goto LABEL_23;
  }
  id v28 = v10;
LABEL_24:

LABEL_25:

  return v28;
}

- (id)_uuidArrayFromItemArray:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) localObject:v13];
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 addObject:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id v11 = +[NSArray arrayWithArray:v4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)viewWillDisappearBlock
{
  return self->_viewWillDisappearBlock;
}

- (void)setViewWillDisappearBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDisappearBlock, 0);
  objc_destroyWeak((id *)&self->_browsingDelegate);
  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
  objc_destroyWeak((id *)&self->_libraryActionHandler);

  objc_destroyWeak((id *)&self->_undoManager);
}

@end