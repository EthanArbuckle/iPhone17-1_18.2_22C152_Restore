@interface RCApplicationModel
+ (RCApplicationModel)sharedApplicationModel;
+ (id)currentLocationBasedName;
- (NSArray)deletedRecordings;
- (NSArray)recordings;
- (NSArray)userFolders;
- (RCApplicationModel)init;
- (RCFolder)capturedOnWatchRecordingsFolder;
- (RCFolder)favoriteRecordingsFolder;
- (RCFolder)recentlyDeletedRecordingsFolder;
- (RCFolder)voiceMemosRecordingsFolder;
- (RCFoldersFetchedResultsController)foldersController;
- (RCSavedRecordingsController)deletedRecordingsController;
- (RCSavedRecordingsController)recordingsController;
- (id)_recordingsControllerWithFolder:(id)a3;
- (id)_recordingsControllerWithPredicate:(id)a3;
- (id)compositionLoadedForSavedRecordingUUID:(id)a3;
- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7;
- (id)mostRecentRecording;
- (id)newChangeTrackingBackgroundModel;
- (id)playableRecordingsForFolder:(id)a3;
- (id)recordingsControllerWithFolder:(id)a3;
- (unint64_t)playableCountForFolder:(id)a3;
- (unint64_t)userFolderCount;
- (void)_deleteFolderAndRecordings:(id)a3 shouldPermanentlyErase:(BOOL)a4;
- (void)deleteFolderAndAllPlayableRecordings:(id)a3;
- (void)deleteFolderAndPermanentlyEraseAllPlayableRecordings:(id)a3;
- (void)moveFolder:(id)a3 toIndexPath:(id)a4;
@end

@implementation RCApplicationModel

- (id)_recordingsControllerWithFolder:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 folderType])
  {
    case 0uLL:
      v5 = [(RCApplicationModel *)self recordingsController];
      goto LABEL_10;
    case 1uLL:
      uint64_t v8 = +[RCQueryManager favoritePredicate];
      goto LABEL_8;
    case 2uLL:
      uint64_t v8 = +[RCQueryManager watchOSPredicate];
LABEL_8:
      v9 = (void *)v8;
      id v10 = [(RCApplicationModel *)self _recordingsControllerWithPredicate:v8];
      goto LABEL_11;
    case 3uLL:
      v5 = [(RCApplicationModel *)self deletedRecordingsController];
LABEL_10:
      v9 = v5;
      id v10 = [v5 copy];
LABEL_11:
      v7 = v10;

      break;
    case 4uLL:
      v11 = [v4 uuid];
      v12 = +[RCQueryManager recordingsInFolderPredicate:v11];
      v7 = [(RCApplicationModel *)self _recordingsControllerWithPredicate:v12];

      break;
    default:
      v6 = OSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10016E178(v4, v6);
      }

      v7 = 0;
      break;
  }

  return v7;
}

+ (RCApplicationModel)sharedApplicationModel
{
  if (qword_10026A878 != -1) {
    dispatch_once(&qword_10026A878, &stru_100223210);
  }
  v2 = (void *)qword_10026A870;

  return (RCApplicationModel *)v2;
}

- (id)recordingsControllerWithFolder:(id)a3
{
  id v4 = a3;
  v5 = [(RCApplicationModel *)self _recordingsControllerWithFolder:v4];
  [v5 setFolder:v4];

  return v5;
}

- (RCApplicationModel)init
{
  v3 = +[RCApplicationContainer sharedContainer];
  id v4 = [v3 newContextWithConcurrencyType:2];

  v17.receiver = self;
  v17.super_class = (Class)RCApplicationModel;
  v5 = [(RCApplicationModel *)&v17 initWithContext:v4];
  if (v5)
  {
    v6 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:0];
    v7 = [RCSavedRecordingsController alloc];
    uint64_t v8 = [(RCApplicationModel *)v5 context];
    v9 = [(RCSavedRecordingsController *)v7 initWithFetchRequest:v6 managedObjectContext:v8];
    recordingsController = v5->_recordingsController;
    v5->_recordingsController = v9;

    [(RCSavedRecordingsController *)v5->_recordingsController setDefaultDelegate:v5];
    v11 = +[RCQueryManager deletedRecordingsFetchRequest];
    v12 = [RCSavedRecordingsController alloc];
    v13 = [(RCApplicationModel *)v5 context];
    v14 = [(RCSavedRecordingsController *)v12 initWithFetchRequest:v11 managedObjectContext:v13];
    deletedRecordingsController = v5->_deletedRecordingsController;
    v5->_deletedRecordingsController = v14;

    [(RCSavedRecordingsController *)v5->_deletedRecordingsController setDefaultDelegate:v5];
  }

  return v5;
}

- (RCFolder)voiceMemosRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:0];
}

- (RCSavedRecordingsController)recordingsController
{
  return self->_recordingsController;
}

- (RCFoldersFetchedResultsController)foldersController
{
  foldersController = self->_foldersController;
  if (!foldersController)
  {
    id v4 = +[RCQueryManager userDefinedFoldersFetchRequest];
    v5 = [RCFoldersFetchedResultsController alloc];
    v6 = [(RCApplicationModel *)self context];
    v7 = [(RCFoldersFetchedResultsController *)v5 initWithFetchRequest:v4 managedObjectContext:v6];
    uint64_t v8 = self->_foldersController;
    self->_foldersController = v7;

    foldersController = self->_foldersController;
  }

  return foldersController;
}

- (id)_recordingsControllerWithPredicate:(id)a3
{
  id v4 = +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:a3];
  [v4 setFetchBatchSize:10];
  v5 = [RCSavedRecordingsController alloc];
  v6 = [(RCApplicationModel *)self context];
  v7 = [(RCSavedRecordingsController *)v5 initWithFetchRequest:v4 managedObjectContext:v6];

  [(RCSavedRecordingsController *)v7 setDefaultDelegate:self];

  return v7;
}

- (RCFolder)capturedOnWatchRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:2];
}

- (RCFolder)favoriteRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:1];
}

- (RCFolder)recentlyDeletedRecordingsFolder
{
  return (RCFolder *)+[RCBuiltinRecordingsFolder builtInFolderWithType:3];
}

- (id)playableRecordingsForFolder:(id)a3
{
  id v4 = a3;
  v5 = [(RCApplicationModel *)self foldersController];
  v6 = [v5 playableRecordingsInFolder:v4];

  return v6;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  id v4 = a3;
  v5 = [(RCApplicationModel *)self foldersController];
  id v6 = [v5 playableCountForFolder:v4];

  return (unint64_t)v6;
}

- (void)deleteFolderAndAllPlayableRecordings:(id)a3
{
}

- (void)deleteFolderAndPermanentlyEraseAllPlayableRecordings:(id)a3
{
}

- (void)_deleteFolderAndRecordings:(id)a3 shouldPermanentlyErase:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(RCApplicationModel *)self foldersController];
  id v8 = [v7 playableRecordingsInFolder:v6];

  [(RCApplicationModel *)self deleteFolder:v6];
  if (v4) {
    [(RCApplicationModel *)self eraseRecordings:v8];
  }
  else {
    [(RCApplicationModel *)self deleteRecordings:v8];
  }
}

- (id)mostRecentRecording
{
  v2 = [(RCApplicationModel *)self recordingsController];
  v3 = [v2 fetchedRecordings];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (NSArray)recordings
{
  v2 = [(RCApplicationModel *)self recordingsController];
  v3 = [v2 fetchedRecordings];

  return (NSArray *)v3;
}

- (NSArray)deletedRecordings
{
  v2 = [(RCApplicationModel *)self deletedRecordingsController];
  v3 = [v2 fetchedRecordings];

  return (NSArray *)v3;
}

- (unint64_t)userFolderCount
{
  v2 = [(RCApplicationModel *)self foldersController];
  v3 = [v2 userFolders];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (NSArray)userFolders
{
  v2 = [(RCApplicationModel *)self foldersController];
  v3 = [v2 userFolders];

  return (NSArray *)v3;
}

- (id)newChangeTrackingBackgroundModel
{
  v2 = +[RCApplicationContainer sharedContainer];
  id v3 = [v2 newChangeTrackingBackgroundModel];

  return v3;
}

- (id)compositionLoadedForSavedRecordingUUID:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1000B98F0;
  v14 = sub_1000B9900;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B9908;
  v6[3] = &unk_1002221A8;
  v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(RCApplicationModel *)v7 performBlockAndWait:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)moveFolder:(id)a3 toIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 folderType] != (id)4)
  {
    objc_super v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"RCApplicationModel.m", 169, @"Invalid parameter not satisfying: %@", @"folder.folderType == RCFolderTypeUserDefined" object file lineNumber description];
  }
  v9 = [(RCApplicationModel *)self userFolders];
  uint64_t v10 = (char *)[v8 row];
  v11 = (char *)[v9 indexOfObject:v7];
  if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10016E218((uint64_t)v7, v12);
    }
  }
  else
  {
    v13 = v11;
    if (v11 != v10)
    {
      if (v10 >= [v9 count])
      {
        v18 = +[NSAssertionHandler currentHandler];
        [v18 handleFailureInMethod:a2, self, @"RCApplicationModel.m", 178, @"Invalid parameter not satisfying: %@", @"newIndex < folders.count" object file lineNumber description];
      }
      if ((uint64_t)v10 >= (uint64_t)v13)
      {
        if (v13 < v10)
        {
          do
          {
            v16 = [v9 objectAtIndexedSubscript:v13 + 1];
            [v16 setRank:v13];

            ++v13;
          }
          while (v10 != v13);
        }
      }
      else if (v10 < v13)
      {
        v14 = v10;
        do
        {
          id v15 = [v9 objectAtIndexedSubscript:v14];
          [v15 setRank:++v14];
        }
        while (v13 != v14);
      }
      [v7 setRank:v10];
      [(RCApplicationModel *)self saveIfNecessary];
    }
  }
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = +[NSUserDefaults sharedSettingsUserDefaults];
  objc_super v17 = v16;
  if (v16)
  {
    unsigned int v18 = [v16 rc_useLocationBasedNaming];
    if (!v14)
    {
      if (v18)
      {
        v19 = [(id)objc_opt_class() currentLocationBasedName];
        id v14 = v19;
        if (v19)
        {
          id v20 = v19;
        }
        else
        {
          v21 = OSLogForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            sub_10016E2A4(v21);
          }
        }
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)RCApplicationModel;
  v22 = [(RCApplicationModel *)&v24 insertRecordingWithAudioFile:v12 duration:v13 date:v14 customTitleBase:v15 uniqueID:a4];

  return v22;
}

+ (id)currentLocationBasedName
{
  v2 = +[RCLocationsOfInterestManager defaultManager];
  id v3 = [v2 currentLocation];
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000B9EC0;
  v16 = &unk_100223238;
  id v17 = v3;
  v5 = +[NSSortDescriptor sortDescriptorWithKey:@"location" ascending:1 comparator:&v13];
  id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"confidence", 0, v13, v14, v15, v16 ascending];
  id v7 = [v2 locationsOfInterest];
  v18[0] = v5;
  v18[1] = v6;
  id v8 = +[NSArray arrayWithObjects:v18 count:2];
  v9 = [v7 sortedArrayUsingDescriptors:v8];

  uint64_t v10 = [v9 firstObject];
  v11 = v10;
  if (v10)
  {
    id v7 = [v10 preferredName];
  }

  if (!v11) {
LABEL_5:
  }
    id v7 = 0;

  return v7;
}

- (RCSavedRecordingsController)deletedRecordingsController
{
  return self->_deletedRecordingsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordingsController, 0);
  objc_storeStrong((id *)&self->_recordingsController, 0);

  objc_storeStrong((id *)&self->_foldersController, 0);
}

@end