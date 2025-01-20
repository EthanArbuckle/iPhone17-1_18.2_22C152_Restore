@interface MSPHistoryRAPStorage
+ (Class)recordingClass;
- (MSPHistoryContainer)historyContainer;
- (MSPHistoryRAPStorage)init;
- (MSPHistoryRAPStorage)initWithStorageDirectoryURL:(id)a3;
- (RAPStorage)underlyingStorage;
- (void)editRecordingForHistoryEntryWithStorageIdentifier:(id)a3 usingBlock:(id)a4;
- (void)garbageCollectRAPStorageIfNeeded;
- (void)historyContainerPerformMaintenanceForValidIdentifiers:(id)a3 completion:(id)a4;
- (void)loadAllRecordingsWithConcurrentBlock:(id)a3;
- (void)saveHistoryEntry:(id)a3 origin:(int64_t)a4 searchTicket:(id)a5;
- (void)saveRecording:(id)a3 forHistoryEntryWithStorageIdentifier:(id)a4 completion:(id)a5;
- (void)setHistoryContainer:(id)a3;
@end

@implementation MSPHistoryRAPStorage

- (void)saveHistoryEntry:(id)a3 origin:(int64_t)a4 searchTicket:(id)a5
{
  id v8 = a5;
  v9 = [a3 storageIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005C91B0;
  v11[3] = &unk_1012F1520;
  id v12 = v8;
  int64_t v13 = a4;
  id v10 = v8;
  [(MSPHistoryRAPStorage *)self editRecordingForHistoryEntryWithStorageIdentifier:v9 usingBlock:v11];
}

- (MSPHistoryRAPStorage)init
{
  result = (MSPHistoryRAPStorage *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MSPHistoryRAPStorage)initWithStorageDirectoryURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSPHistoryRAPStorage;
  v5 = [(MSPHistoryRAPStorage *)&v9 init];
  if (v5)
  {
    v6 = [[RAPStorage alloc] initWithStorageDirectoryURL:v4];
    underlyingStorage = v5->_underlyingStorage;
    v5->_underlyingStorage = v6;

    +[RAPStorage standardTimeToLive];
    -[RAPStorage setItemTimeToLive:](v5->_underlyingStorage, "setItemTimeToLive:");
  }

  return v5;
}

- (void)setHistoryContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeWeak((id *)&v5->_historyContainer, v4);
  if (v4)
  {
    id v6 = objc_alloc_init((Class)MSHistoryItemRequest);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D43650;
    v7[3] = &unk_1012E7610;
    v7[4] = v5;
    [v6 fetchWithCompletionHandler:v7];
  }
  objc_sync_exit(v5);
}

- (void)historyContainerPerformMaintenanceForValidIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [(MSPHistoryRAPStorage *)self underlyingStorage];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D43888;
  v10[3] = &unk_101322C58;
  id v11 = v6;
  id v9 = v6;
  [v8 removeItemsPassingTest:v10];

  v7[2](v7, 0);
}

- (void)loadAllRecordingsWithConcurrentBlock:(id)a3
{
  id v4 = a3;
  v5 = [(MSPHistoryRAPStorage *)self underlyingStorage];
  id v6 = [v5 allItemIdentifiersByDescendingCreationDate];

  if ([v6 count])
  {
    v21 = v6;
    v7 = +[NSArray arrayWithObjects:&v21 count:1];
    id v8 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"identifier IN %@" argumentArray:v7];

    id v9 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
    id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"createTime" ascending:0];
    id v20 = v10;
    id v11 = +[NSArray arrayWithObjects:&v20 count:1];
    id v12 = [v9 initWithPredicate:v8 sortDescriptors:v11 range:0];

    id v13 = objc_alloc_init((Class)MSHistoryItemRequest);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100D43ADC;
    v16[3] = &unk_1012F09D8;
    id v17 = v6;
    v18 = self;
    id v19 = v4;
    [v13 fetchWithOptions:v12 completionHandler:v16];
  }
  else
  {
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v14, v15);
  }
}

- (void)editRecordingForHistoryEntryWithStorageIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = a4;
  id v8 = [(MSPHistoryRAPStorage *)self underlyingStorage];
  id v9 = [v8 dataForItemWithIdentifier:v6 error:0];

  if (!v9
    || (id v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "recordingClass")), "initWithData:", v9)) == 0)
  {
    id v10 = objc_alloc_init((Class)[(id)objc_opt_class() recordingClass]);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D43EEC;
  v14[3] = &unk_1012E66E0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v11 = (void (*)(void *, id, void *))v7[2];
  id v12 = v6;
  id v13 = v10;
  v11(v7, v13, v14);
}

- (void)saveRecording:(id)a3 forHistoryEntryWithStorageIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MSPHistoryRAPStorage *)self underlyingStorage];
  id v12 = [v10 data];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D43FF8;
  v14[3] = &unk_1012E76C0;
  id v15 = v8;
  id v13 = v8;
  [v11 saveItemWithData:v12 forIdentifier:v9 completion:v14];
}

+ (Class)recordingClass
{
  return 0;
}

- (void)garbageCollectRAPStorageIfNeeded
{
  id v2 = [(MSPHistoryRAPStorage *)self underlyingStorage];
  [v2 garbageCollectIfNeeded];
}

- (MSPHistoryContainer)historyContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_historyContainer);

  return (MSPHistoryContainer *)WeakRetained;
}

- (RAPStorage)underlyingStorage
{
  return self->_underlyingStorage;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_historyContainer);

  objc_storeStrong((id *)&self->_underlyingStorage, 0);
}

@end