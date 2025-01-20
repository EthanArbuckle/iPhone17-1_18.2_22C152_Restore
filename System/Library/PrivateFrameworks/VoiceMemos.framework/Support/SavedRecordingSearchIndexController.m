@interface SavedRecordingSearchIndexController
+ (id)_lookupSearchableItemForRecordingInModel:(id)a3 recordingURI:(id)a4;
- (BOOL)deleteSearchMetadata:(id *)a3;
- (SavedRecordingSearchIndexController)init;
- (id)_voiceMemosSearchableIndex;
- (void)_reloadSearchMetadataAsReset:(BOOL)a3 completionBlock:(id)a4;
- (void)_updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6;
- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3;
- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3;
- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6;
@end

@implementation SavedRecordingSearchIndexController

- (SavedRecordingSearchIndexController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SavedRecordingSearchIndexController;
  v2 = [(SavedRecordingSearchIndexController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3
{
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3
{
}

- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6
{
}

- (BOOL)deleteSearchMetadata:(id *)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100007E28;
  v17 = sub_10000E930;
  id v18 = 0;
  if (self->__searchableIndex)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    searchableIndex = self->__searchableIndex;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000E938;
    v10[3] = &unk_100038D70;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    [(CSSearchableIndex *)searchableIndex deleteAllSearchableItemsWithCompletionHandler:v10];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (a3) {
      *a3 = (id) v14[5];
    }

    BOOL v8 = v14[5] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_voiceMemosSearchableIndex
{
  searchableIndex = self->__searchableIndex;
  if (!searchableIndex)
  {
    id v4 = objc_alloc((Class)CSSearchableIndex);
    dispatch_semaphore_t v5 = (CSSearchableIndex *)[v4 initWithName:@"VoiceMemos" protectionClass:NSFileProtectionCompleteUnlessOpen bundleIdentifier:RCVoiceMemosBundleID];
    objc_super v6 = self->__searchableIndex;
    self->__searchableIndex = v5;

    searchableIndex = self->__searchableIndex;
  }
  return searchableIndex;
}

- (void)_reloadSearchMetadataAsReset:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v7 = [(SavedRecordingSearchIndexController *)self _voiceMemosSearchableIndex];
  BOOL v8 = [[SerializedIndexUpdateTransaction alloc] initWithSearchIndex:v7 identifier:@"SavedRecordingSearchIndexController.reload"];
  dispatch_queue_t v9 = dispatch_queue_create(0, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000EB70;
  v16[3] = &unk_100038E50;
  BOOL v19 = a3;
  v17 = v8;
  id v18 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EE3C;
  v13[3] = &unk_100038B78;
  v14 = v17;
  id v15 = v6;
  v10 = v17;
  id v11 = v6;
  id v12 = v7;
  [(SerializedIndexUpdateTransaction *)v10 performTransactionOnQueue:v9 processingBlock:v16 finishedBlock:v13];
}

- (void)_updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  if (a3) {
    id v11 = a3;
  }
  else {
    id v11 = &__NSArray0__struct;
  }
  id v12 = v11;
  id v13 = a5;
  id v14 = a4;
  id v15 = v14;
  if (v14) {
    v16 = v14;
  }
  else {
    v16 = &__NSArray0__struct;
  }
  id v17 = v16;

  if (v13) {
    id v18 = v13;
  }
  else {
    id v18 = &__NSArray0__struct;
  }
  id v19 = v18;

  v20 = [(SavedRecordingSearchIndexController *)self _voiceMemosSearchableIndex];
  v21 = [[SerializedIndexUpdateTransaction alloc] initWithSearchIndex:v20 identifier:@"SavedRecordingSearchIndexController.update"];
  processingQueue = self->_processingQueue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000F0B4;
  v32[3] = &unk_100038EE0;
  id v33 = v12;
  id v34 = v17;
  id v35 = v19;
  v36 = v21;
  id v37 = v20;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000F45C;
  v29[3] = &unk_100038B78;
  v30 = v36;
  id v31 = v10;
  v23 = v36;
  id v24 = v10;
  id v25 = v20;
  id v26 = v19;
  id v27 = v17;
  id v28 = v12;
  [(SerializedIndexUpdateTransaction *)v23 performTransactionOnQueue:processingQueue processingBlock:v32 finishedBlock:v29];
}

+ (id)_lookupSearchableItemForRecordingInModel:(id)a3 recordingURI:(id)a4
{
  id v4 = [a3 recordingWithURIRepresentation:a4];
  dispatch_semaphore_t v5 = RCSearchableItemForRecording();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__searchableIndex, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

@end