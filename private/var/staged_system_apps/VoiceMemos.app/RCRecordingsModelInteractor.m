@interface RCRecordingsModelInteractor
+ (id)sharedRecordingsModelInteractor;
- (BOOL)createUserFolderWithName:(id)a3;
- (BOOL)isEnhancedForUUID:(id)a3;
- (BOOL)isFavoriteForUUID:(id)a3;
- (BOOL)isFavoriteForUUIDs:(id)a3;
- (BOOL)isRecentlyDeletedForUUID:(id)a3;
- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3;
- (BOOL)userFolderExistsWithName:(id)a3;
- (RCApplicationModel)model;
- (RCRecordingsModelInteractor)initWithSavedRecordingsModel:(id)a3;
- (id)allFoldersWithName:(id)a3;
- (id)allUserFolders;
- (id)audioProperties;
- (id)builtInFolderOfType:(int64_t)a3;
- (id)compositionLoadedForSavedRecordingUUID:(id)a3;
- (id)duplicateRecordingWithUUID:(id)a3;
- (id)existingUserFolderWithName:(id)a3;
- (id)existingUserFoldersWithName:(id)a3 searchOption:(int)a4;
- (id)folderForUUID:(id)a3;
- (id)mostRecentRecording;
- (id)recordingForUUID:(id)a3;
- (id)recordingsForUUIDs:(id)a3;
- (id)restoreRecordingsWithUUIDs:(id)a3;
- (id)setFavorite:(BOOL)a3 forUUIDs:(id)a4;
- (id)titleForUUID:(id)a3;
- (id)uuidOfUserFolderForRecordingWithUUID:(id)a3;
- (id)visibleBuiltInFolders;
- (unint64_t)playableCountForFolder:(id)a3;
- (void)_deleteRecordingsWithUUIDs:(id)a3 withImmediateDeletion:(BOOL)a4;
- (void)addRecordingWithUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4;
- (void)addRecordingWithUUID:(id)a3 toUserFolderNamed:(id)a4;
- (void)addRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4;
- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4;
- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderWithUUID:(id)a4;
- (void)deleteRecordingsWithUUIDs:(id)a3;
- (void)deleteUserFolder:(id)a3;
- (void)deleteUserFolderWithName:(id)a3;
- (void)eraseAllDeleted;
- (void)eraseRecordingsWithUUIDs:(id)a3;
- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4;
- (void)performBlockAndWait:(id)a3;
- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4;
- (void)removeRecordingWithUUID:(id)a3 fromUserFolderName:(id)a4;
- (void)removeRecordingWithUUID:(id)a3 fromUserFolderWithUUID:(id)a4;
- (void)removeRecordingsWithUUIDs:(id)a3 fromUserFolderWithUUID:(id)a4;
- (void)renameFolder:(id)a3 toName:(id)a4;
- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4;
- (void)setFavorite:(BOOL)a3 forUUID:(id)a4;
- (void)setModel:(id)a3;
@end

@implementation RCRecordingsModelInteractor

+ (id)sharedRecordingsModelInteractor
{
  if (qword_10026A810 != -1) {
    dispatch_once(&qword_10026A810, &stru_1002225F8);
  }
  v2 = (void *)qword_10026A808;

  return v2;
}

- (RCRecordingsModelInteractor)initWithSavedRecordingsModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingsModelInteractor;
  v6 = [(RCRecordingsModelInteractor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (id)audioProperties
{
  return [(RCApplicationModel *)self->_model audioProperties];
}

- (void)performBlockAndWait:(id)a3
{
}

- (id)recordingForUUID:(id)a3
{
  return [(RCApplicationModel *)self->_model recordingWithUniqueID:a3];
}

- (id)recordingsForUUIDs:(id)a3
{
  return [(RCApplicationModel *)self->_model recordingsWithUniqueIDs:a3];
}

- (id)mostRecentRecording
{
  return [(RCApplicationModel *)self->_model mostRecentRecording];
}

- (id)titleForUUID:(id)a3
{
  v3 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 title];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isRecentlyDeletedForUUID:(id)a3
{
  v3 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  v4 = [v3 deletionDate];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isFavoriteForUUID:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  BOOL v5 = +[NSArray arrayWithObjects:&v7 count:1];

  LOBYTE(self) = -[RCRecordingsModelInteractor isFavoriteForUUIDs:](self, "isFavoriteForUUIDs:", v5, v7);
  return (char)self;
}

- (BOOL)isFavoriteForUUIDs:(id)a3
{
  [(RCRecordingsModelInteractor *)self recordingsForUUIDs:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      unsigned __int8 v9 = [v8 favorite];
      if (![v8 favorite]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isEnhancedForUUID:(id)a3
{
  id v3 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  unsigned __int8 v4 = [v3 enhanced];

  return v4;
}

- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3
{
  id v3 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  unsigned __int8 v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 manuallyRenamed];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setFavorite:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = a4;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];

  id v8 = -[RCRecordingsModelInteractor setFavorite:forUUIDs:](self, "setFavorite:forUUIDs:", v4, v7, v9);
}

- (id)setFavorite:(BOOL)a3 forUUIDs:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [(RCRecordingsModelInteractor *)self recordingsForUUIDs:v6];

  id v9 = self->_model;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10008A07C;
  v19 = &unk_100222620;
  id v20 = v8;
  BOOL v23 = a3;
  id v10 = v7;
  id v21 = v10;
  v22 = v9;
  long long v11 = v9;
  id v12 = v8;
  [(RCApplicationModel *)v11 performWithSavingDisabled:&v16];
  [(RCApplicationModel *)v11 saveIfNecessary];
  long long v13 = v22;
  id v14 = v10;

  return v14;
}

- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = [(RCRecordingsModelInteractor *)self recordingForUUID:a4];
  if (v6)
  {
    id v7 = v6;
    [(RCApplicationModel *)self->_model setEnhanced:v4 ofRecording:v6];
    id v6 = v7;
  }
}

- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4
{
  id v7 = a3;
  id v6 = [(RCRecordingsModelInteractor *)self recordingForUUID:a4];
  if (v6) {
    [(RCApplicationModel *)self->_model setTitle:v7 ofRecording:v6];
  }
}

- (id)duplicateRecordingWithUUID:(id)a3
{
  BOOL v4 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  if (v4)
  {
    model = self->_model;
    id v12 = 0;
    id v6 = [(RCApplicationModel *)model duplicateRecording:v4 error:&v12];
    id v7 = v12;
    id v8 = v7;
    if (v6) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (!v9)
    {
      id v10 = OSLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10016CA88(v8, v10);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)eraseRecordingsWithUUIDs:(id)a3
{
}

- (void)deleteRecordingsWithUUIDs:(id)a3
{
}

- (void)_deleteRecordingsWithUUIDs:(id)a3 withImmediateDeletion:(BOOL)a4
{
  id v6 = a3;
  id v7 = self->_model;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10008A454;
  long long v13 = &unk_100222620;
  id v14 = self;
  id v15 = v6;
  BOOL v17 = a4;
  v16 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RCApplicationModel *)v8 performWithSavingDisabled:&v10];
  [(RCApplicationModel *)v8 saveIfNecessary];
}

- (id)restoreRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  id v6 = self->_model;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10008A674;
  id v15 = &unk_100221858;
  v16 = self;
  id v17 = v4;
  v18 = v6;
  id v19 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = v4;
  [(RCApplicationModel *)v8 performWithSavingDisabled:&v12];
  [(RCApplicationModel *)v8 saveIfNecessary];
  id v10 = [v7 copy];

  return v10;
}

- (void)eraseAllDeleted
{
}

- (BOOL)userFolderExistsWithName:(id)a3
{
  id v3 = [(RCRecordingsModelInteractor *)self existingUserFolderWithName:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)existingUserFoldersWithName:(id)a3 searchOption:(int)a4
{
  return [(RCApplicationModel *)self->_model existingFoldersWithName:a3 searchOption:*(void *)&a4];
}

- (id)existingUserFolderWithName:(id)a3
{
  return [(RCApplicationModel *)self->_model existingFolderWithName:a3];
}

- (id)allFoldersWithName:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  id v6 = +[NSCharacterSet whitespaceCharacterSet];
  id v7 = [v4 stringByTrimmingCharactersInSet:v6];

  id v8 = [(RCRecordingsModelInteractor *)self existingUserFoldersWithName:v4 searchOption:2];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008A9FC;
  v22[3] = &unk_100222648;
  id v9 = v7;
  id v23 = v9;
  uint64_t v24 = 129;
  id v10 = [v8 na_filter:v22];

  if ([v10 count]) {
    [v5 addObjectsFromArray:v10];
  }
  uint64_t v11 = [(RCRecordingsModelInteractor *)self visibleBuiltInFolders];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10008AA80;
  id v19 = &unk_100222648;
  id v20 = v9;
  uint64_t v21 = 129;
  id v12 = v9;
  uint64_t v13 = [v11 na_filter:&v16];

  if (objc_msgSend(v13, "count", v16, v17, v18, v19)) {
    [v5 addObjectsFromArray:v13];
  }
  id v14 = [v5 copy];

  return v14;
}

- (id)allUserFolders
{
  return [(RCApplicationModel *)self->_model userFolders];
}

- (id)builtInFolderOfType:(int64_t)a3
{
  id v4 = self->_model;
  unsigned __int8 v5 = v4;
  switch(a3)
  {
    case 0:
      uint64_t v6 = [(RCApplicationModel *)v4 voiceMemosRecordingsFolder];
      goto LABEL_6;
    case 1:
      uint64_t v6 = [(RCApplicationModel *)v4 favoriteRecordingsFolder];
      goto LABEL_6;
    case 2:
      uint64_t v6 = [(RCApplicationModel *)v4 capturedOnWatchRecordingsFolder];
      goto LABEL_6;
    case 3:
      uint64_t v6 = [(RCApplicationModel *)v4 recentlyDeletedRecordingsFolder];
LABEL_6:
      id v7 = (void *)v6;
      goto LABEL_13;
    case 4:
      id v8 = OSLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10016CBC0(v8);
      }

      goto LABEL_10;
    default:
LABEL_10:
      id v9 = OSLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10016CB34(a3, v9);
      }

      id v7 = 0;
LABEL_13:

      return v7;
  }
}

- (id)visibleBuiltInFolders
{
  v2 = [(RCApplicationModel *)self->_model foldersController];
  id v3 = [v2 builtinFolders];

  return v3;
}

- (id)uuidOfUserFolderForRecordingWithUUID:(id)a3
{
  if (a3)
  {
    id v3 = -[RCRecordingsModelInteractor recordingForUUID:](self, "recordingForUUID:");
    id v4 = v3;
    if (v3)
    {
      id v3 = [v3 userFolderUUID];
    }
    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)folderForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [(RCRecordingsModelInteractor *)self builtInFolderOfType:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 uuid];
      unsigned __int8 v9 = [v8 isEqual:v4];

      if (v9) {
        break;
      }
    }

    if (++v5 == 4)
    {
      id v7 = [(RCApplicationModel *)self->_model existingFolderWithUUID:v4];
      break;
    }
  }

  return v7;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  return [(RCApplicationModel *)self->_model playableCountForFolder:a3];
}

- (BOOL)createUserFolderWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCRecordingsModelInteractor *)self existingUserFolderWithName:v4];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [(RCApplicationModel *)self->_model folderWithName:v4];

    BOOL v6 = v7 != 0;
  }

  return v6;
}

- (void)deleteUserFolderWithName:(id)a3
{
  id v4 = [(RCRecordingsModelInteractor *)self existingUserFolderWithName:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [(RCRecordingsModelInteractor *)self deleteUserFolder:v4];
    id v4 = v5;
  }
}

- (void)deleteUserFolder:(id)a3
{
  id v6 = a3;
  if (-[RCRecordingsModelInteractor playableCountForFolder:](self, "playableCountForFolder:"))
  {
    id v4 = +[NSUserDefaults sharedSettingsUserDefaults];
    uint64_t v5 = v4;
    if (v4 && objc_msgSend(v4, "rc_deletionIsImmediate")) {
      [(RCApplicationModel *)self->_model deleteFolderAndPermanentlyEraseAllPlayableRecordings:v6];
    }
    else {
      [(RCApplicationModel *)self->_model deleteFolderAndAllPlayableRecordings:v6];
    }
  }
  else
  {
    [(RCApplicationModel *)self->_model deleteFolder:v6];
  }
}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
}

- (void)addRecordingWithUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v8 = a3;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];

  -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toBuiltInFolderOfType:](self, "addRecordingsWithUUIDs:toBuiltInFolderOfType:", v7, a4, v8);
}

- (void)addRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v8 = [(RCRecordingsModelInteractor *)self recordingsForUUIDs:a3];
  id v6 = [v8 count];
  if ((unint64_t)a4 <= 1 && v6)
  {
    id v7 = [(RCRecordingsModelInteractor *)self builtInFolderOfType:a4];
    if (v7) {
      [(RCApplicationModel *)self->_model addRecordings:v8 toFolder:v7];
    }
  }
}

- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderWithUUID:(id)a4
{
  id v9 = a4;
  id v6 = [(RCRecordingsModelInteractor *)self recordingsForUUIDs:a3];
  if ([v6 count])
  {
    id v7 = self->_model;
    id v8 = [(RCApplicationModel *)v7 existingFolderWithUUID:v9];
    if (v8) {
      [(RCApplicationModel *)v7 addRecordings:v6 toFolder:v8];
    }
  }
}

- (void)addRecordingWithUUID:(id)a3 toUserFolderNamed:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[RCRecordingsModelInteractor addRecordingsWithUUIDs:toUserFolderNamed:](self, "addRecordingsWithUUIDs:toUserFolderNamed:", v8, v6, v9);
}

- (void)addRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4
{
  id v8 = a4;
  id v6 = [(RCRecordingsModelInteractor *)self recordingsForUUIDs:a3];
  if ([v6 count])
  {
    id v7 = [(RCRecordingsModelInteractor *)self existingUserFolderWithName:v8];
    if (v7) {
      [(RCApplicationModel *)self->_model addRecordings:v6 toFolder:v7];
    }
  }
}

- (void)removeRecordingWithUUID:(id)a3 fromUserFolderWithUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[RCRecordingsModelInteractor removeRecordingsWithUUIDs:fromUserFolderWithUUID:](self, "removeRecordingsWithUUIDs:fromUserFolderWithUUID:", v8, v6, v9);
}

- (void)removeRecordingsWithUUIDs:(id)a3 fromUserFolderWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(RCRecordingsModelInteractor *)self recordingsForUUIDs:a3];
  id v8 = self->_model;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008B434;
  v12[3] = &unk_100221CB0;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(RCApplicationModel *)v9 performWithSavingDisabled:v12];
  [(RCApplicationModel *)v9 saveIfNecessary];
}

- (void)removeRecordingWithUUID:(id)a3 fromUserFolderName:(id)a4
{
  id v6 = a4;
  id v8 = [(RCRecordingsModelInteractor *)self recordingForUUID:a3];
  id v7 = [(RCRecordingsModelInteractor *)self existingUserFolderWithName:v6];

  if (v8 && v7) {
    [(RCApplicationModel *)self->_model removeRecording:v8 fromFolder:v7];
  }
}

- (id)compositionLoadedForSavedRecordingUUID:(id)a3
{
  return [(RCApplicationModel *)self->_model compositionLoadedForSavedRecordingUUID:a3];
}

- (RCApplicationModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end