@interface RCRecordingsCollectionViewControllerDataCoordinator
- (BOOL)isDownloadingAtIndexPath:(id)a3;
- (BOOL)isPerformingSpotlightSearch;
- (NSString)searchString;
- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolder:(id)a3 delegate:(id)a4;
- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolderType:(int64_t)a3 delegate:(id)a4;
- (RCRecordingsCollectionViewControllerDataCoordinator)initWithUserFolderNamed:(id)a3 delegate:(id)a4;
- (RCRecordingsCollectionViewDataCoordinatorDelegate)delegate;
- (RCSavedRecordingsController)savedRecordingsController;
- (id)_indexPathOfRecordingWithUUID:(id)a3;
- (id)_predicateForURIRepresentations:(id)a3;
- (id)_recordingAtIndexPath:(id)a3;
- (id)recordingDataArray;
- (id)uuidAtIndexPath:(id)a3;
- (unint64_t)indexOfUUID:(id)a3;
- (void)_changeLogForType:(unint64_t)a3 oldIndexPath:(id)a4 newIndexPath:(id)a5;
- (void)_commonInitWithDelegate:(id)a3;
- (void)_handleSpotlightSearchResults:(id)a3 forSearchString:(id)a4;
- (void)_performSearch;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPerformingSpotlightSearch:(BOOL)a3;
- (void)setSavedRecordingsController:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation RCRecordingsCollectionViewControllerDataCoordinator

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolderType:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v7 = +[RCBuiltinRecordingsFolder builtInFolderWithType:a3];
  v8 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self initWithFolder:v7 delegate:v6];

  return v8;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithFolder:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RCRecordingsCollectionViewControllerDataCoordinator;
  v8 = [(RCRecordingsCollectionViewControllerDataCoordinator *)&v13 init];
  if (v8)
  {
    v9 = +[RCApplicationModel sharedApplicationModel];
    uint64_t v10 = [v9 recordingsControllerWithFolder:v6];
    savedRecordingsController = v8->_savedRecordingsController;
    v8->_savedRecordingsController = (RCSavedRecordingsController *)v10;

    [(RCRecordingsCollectionViewControllerDataCoordinator *)v8 _commonInitWithDelegate:v7];
  }

  return v8;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)recordingDataArray
{
  return [(RCSavedRecordingsController *)self->_savedRecordingsController fetchedRecordings];
}

- (void)_commonInitWithDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  savedRecordingsController = self->_savedRecordingsController;

  [(RCSavedRecordingsController *)savedRecordingsController setDelegate:self];
}

- (void)setSearchString:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  searchString = self->_searchString;
  self->_searchString = v5;

  id v7 = [v4 length];
  if (v7)
  {
    [(RCRecordingsCollectionViewControllerDataCoordinator *)self _performSearch];
  }
  else
  {
    savedRecordingsController = self->_savedRecordingsController;
    [(RCSavedRecordingsController *)savedRecordingsController setSubPredicate:0 performingFetch:1];
  }
}

- (void)_performSearch
{
  if (!self->_isPerformingSpotlightSearch)
  {
    id v3 = [(NSString *)self->_searchString copy];
    self->_isPerformingSpotlightSearch = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006F1B8;
    v5[3] = &unk_100222248;
    v5[4] = self;
    id v6 = v3;
    id v4 = v3;
    +[RCTranscriptionSearch recordingURIsForTranscriptionsContaining:v4 completionHandler:v5];
  }
}

- (void)_handleSpotlightSearchResults:(id)a3 forSearchString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSString *)self->_searchString length])
  {
    v8 = +[RCQueryManager customLabelSearchPredicateWithString:v7];
    v12[0] = v8;
    v9 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self _predicateForURIRepresentations:v6];
    v12[1] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v12 count:2];
    v11 = +[NSCompoundPredicate orPredicateWithSubpredicates:v10];

    [(RCSavedRecordingsController *)self->_savedRecordingsController setSubPredicate:v11 performingFetch:1];
    if (([(NSString *)self->_searchString isEqual:v7] & 1) == 0) {
      [(RCRecordingsCollectionViewControllerDataCoordinator *)self _performSearch];
    }
  }
}

- (id)_predicateForURIRepresentations:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[RCApplicationContainer sharedContainer];
    v5 = [v4 persistentContainer];
    id v6 = [v5 persistentStoreCoordinator];

    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    objc_super v13 = sub_10006F57C;
    v14 = &unk_100222270;
    id v15 = v6;
    id v7 = v6;
    v8 = [v3 na_map:&v11];
    v9 = +[NSPredicate predicateWithFormat:@"SELF IN %@", v8, v11, v12, v13, v14];
  }
  else
  {
    v9 = +[NSPredicate predicateWithValue:0];
  }

  return v9;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)initWithUserFolderNamed:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[RCApplicationModel sharedApplicationModel];
  v9 = [v8 folderWithName:v7];

  uint64_t v10 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self initWithFolder:v9 delegate:v6];
  return v10;
}

- (id)_indexPathOfRecordingWithUUID:(id)a3
{
  id v4 = a3;
  v5 = +[RCApplicationModel sharedApplicationModel];
  id v6 = [v5 recordingWithUniqueID:v4];

  if (v6)
  {
    id v7 = [(RCSavedRecordingsController *)self->_savedRecordingsController indexPathForObject:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfUUID:(id)a3
{
  id v3 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self _indexPathOfRecordingWithUUID:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 item];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)isDownloadingAtIndexPath:(id)a3
{
  id v3 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self _recordingAtIndexPath:a3];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 audioFutureNeedsDownload];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)uuidAtIndexPath:(id)a3
{
  id v3 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self _recordingAtIndexPath:a3];
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 uuid];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_recordingAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self recordingDataArray];
  id v6 = [v5 count];
  id v7 = [v4 item];

  if (v6 <= v7)
  {
    v9 = 0;
  }
  else
  {
    v8 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self recordingDataArray];
    v9 = [v8 objectAtIndexedSubscript:[v4 item]];
  }

  return v9;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v3 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
  [v3 prepareForChangingContent];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  switch(a6)
  {
    case 1uLL:
      v16 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
      id v21 = v15;
      v17 = +[NSArray arrayWithObjects:&v21 count:1];
      [v16 insertItemsAtIndexPaths:v17];
      goto LABEL_4;
    case 2uLL:
      v16 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
      v17 = [v13 uuid];
      [v16 deleteItemAtIndexPath:v14 withUUID:v17];
LABEL_4:

      break;
    case 3uLL:
      v18 = +[RCRecordingCellDisplayModel recordingDisplayModelWithSavedRecording:v13];
      v19 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
      [v19 reloadItemAtIndexPath:v14 usingDisplayModel:v18];

      v20 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
      [v20 moveItemAtIndexPath:v14 toIndexPath:v15];
      goto LABEL_7;
    case 4uLL:
      v18 = +[RCRecordingCellDisplayModel recordingDisplayModelWithSavedRecording:v13];
      v20 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
      [v20 reloadItemAtIndexPath:v14 usingDisplayModel:v18];
LABEL_7:

      break;
    default:
      break;
  }
}

- (void)_changeLogForType:(unint64_t)a3 oldIndexPath:(id)a4 newIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 - 1 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (uint64_t)*(&off_100222290 + a3 - 1);
  }
  uint64_t v10 = OSLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    id v12 = "-[RCRecordingsCollectionViewControllerDataCoordinator _changeLogForType:oldIndexPath:newIndexPath:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- Change type: %@, oldIndexPath: %@, newIndexPath: %@", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v3 = [(RCRecordingsCollectionViewControllerDataCoordinator *)self delegate];
  [v3 contentChangesComplete];
}

- (RCRecordingsCollectionViewDataCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCRecordingsCollectionViewDataCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCSavedRecordingsController)savedRecordingsController
{
  return self->_savedRecordingsController;
}

- (void)setSavedRecordingsController:(id)a3
{
}

- (BOOL)isPerformingSpotlightSearch
{
  return self->_isPerformingSpotlightSearch;
}

- (void)setIsPerformingSpotlightSearch:(BOOL)a3
{
  self->_isPerformingSpotlightSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedRecordingsController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end