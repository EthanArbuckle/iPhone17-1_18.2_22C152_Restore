@interface BKLibraryAudiobookProgressCenter
- (BKLibraryAudiobookProgressCenter)init;
- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (void)_minifiedAssetPresentersChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation BKLibraryAudiobookProgressCenter

- (BKLibraryAudiobookProgressCenter)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryAudiobookProgressCenter;
  v2 = [(BKLibraryAudiobookProgressCenter *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    progressInstanceMap = v2->_progressInstanceMap;
    v2->_progressInstanceMap = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable strongToWeakObjectsMapTable];
    timeRemainingInstanceMap = v2->_timeRemainingInstanceMap;
    v2->_timeRemainingInstanceMap = (NSMapTable *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("BKLibraryAudiobookProgressCenter.access", 0);
    access = v2->_access;
    v2->_access = (OS_dispatch_queue *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_minifiedAssetPresentersChangedNotification:" name:@"BKMnifiedPresentersUpdatedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BKMnifiedPresentersUpdatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAudiobookProgressCenter;
  [(BKLibraryAudiobookProgressCenter *)&v4 dealloc];
}

- (void)_minifiedAssetPresentersChangedNotification:(id)a3
{
  [(NSMapTable *)self->_progressInstanceMap removeAllObjects];
  timeRemainingInstanceMap = self->_timeRemainingInstanceMap;

  [(NSMapTable *)timeRemainingInstanceMap removeAllObjects];
}

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_10000717C;
  v27 = sub_10000728C;
  id v28 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002088A4;
  block[3] = &unk_100A4BFB8;
  id v21 = v10;
  v22 = &v23;
  id v18 = v8;
  v19 = self;
  id v20 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(access, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_timeRemainingInstanceMap, 0);

  objc_storeStrong((id *)&self->_progressInstanceMap, 0);
}

@end