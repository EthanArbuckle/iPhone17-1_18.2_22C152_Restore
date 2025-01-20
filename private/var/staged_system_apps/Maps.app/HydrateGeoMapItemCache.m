@interface HydrateGeoMapItemCache
+ (id)sharedCache;
- (HydrateGeoMapItemCache)init;
- (void)performCompletionsFor:(id)a3 mapItem:(id)a4 error:(id)a5;
- (void)resolveRTMapItem:(id)a3 shouldUpdateAttributes:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation HydrateGeoMapItemCache

- (HydrateGeoMapItemCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)HydrateGeoMapItemCache;
  v2 = [(HydrateGeoMapItemCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    inProgressCompletionsByHandle = v2->_inProgressCompletionsByHandle;
    v2->_inProgressCompletionsByHandle = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    resolvedMapItemByHandle = v2->_resolvedMapItemByHandle;
    v2->_resolvedMapItemByHandle = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Maps.HydrateGeoMapItemCache", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedCache
{
  if (qword_10160FEF8 != -1) {
    dispatch_once(&qword_10160FEF8, &stru_1012FFE10);
  }
  v2 = (void *)qword_10160FEF0;

  return v2;
}

- (void)resolveRTMapItem:(id)a3 shouldUpdateAttributes:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008E2B7C;
  v13[3] = &unk_1012F7A50;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(serialQueue, v13);
}

- (void)performCompletionsFor:(id)a3 mapItem:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1001040F4;
  v21[4] = sub_1001048F8;
  id v22 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E31B4;
  block[3] = &unk_1012FFE60;
  id v16 = v9;
  BOOL v17 = self;
  id v19 = v10;
  v20 = v21;
  id v18 = v8;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(serialQueue, block);

  _Block_object_dispose(v21, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resolvedMapItemByHandle, 0);

  objc_storeStrong((id *)&self->_inProgressCompletionsByHandle, 0);
}

@end