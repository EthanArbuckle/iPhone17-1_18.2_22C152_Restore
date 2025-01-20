@interface NTKDCompanionTrackedPhotosService
+ (id)sharedService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (id)_priorityListFromCollection:(id)a3;
- (void)_addTrackedPhotosContentToList:(id)a3 forFace:(id)a4;
- (void)_queue_appendCompletionHandler:(id)a3;
- (void)_queue_fetchTrackedPhotosPriorityList:(id)a3;
- (void)_queue_handlePriorityList:(id)a3;
- (void)_queue_startFetchingLibrary;
- (void)fetchTrackedPhotosPriorityList:(id)a3;
- (void)start;
@end

@implementation NTKDCompanionTrackedPhotosService

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002696C;
  block[3] = &unk_100060B50;
  block[4] = a1;
  if (qword_100072400 != -1) {
    dispatch_once(&qword_100072400, block);
  }
  v2 = (void *)qword_1000723F8;

  return v2;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKDCompanionTrackedPhotosService;
  v2 = [(NTKDCompanionTrackedPhotosService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoTimeKit.TrackedPhotosService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_state = 0;
    uint64_t v6 = +[NSMutableArray array];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v6;
  }
  return v2;
}

- (void)start
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tracked Photos service is starting…", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026B2C;
  block[3] = &unk_100060A90;
  block[4] = self;
  if (qword_100072410 != -1) {
    dispatch_once(&qword_100072410, block);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got XPC connection: %@ request for Tracked Photos service", buf, 0xCu);
  }

  objc_super v9 = [v7 valueForEntitlement:@"com.apple.nanotimekit.trackedphotos"];
  unsigned __int8 v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = NTKTrackedPhotosServerInterface();
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026E20;
    v14[3] = &unk_100060A68;
    objc_copyWeak(&v15, (id *)buf);
    [v7 setInvalidationHandler:v14];
    [v7 resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "XPC connection: %@ is not entitled for Tracked Photos service, declining connection", buf, 0xCu);
    }
  }
  return v10;
}

- (void)fetchTrackedPhotosPriorityList:(id)a3
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked for Tracked Photos Priority List", buf, 2u);
  }

  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100026F5C;
    v7[3] = &unk_100060AE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_queue_fetchTrackedPhotosPriorityList:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NTKDCompanionTrackedPhotosService *)self _queue_appendCompletionHandler:v5];

  if (!self->_state)
  {
    [(NTKDCompanionTrackedPhotosService *)self _queue_startFetchingLibrary];
  }
}

- (void)_queue_appendCompletionHandler:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  completionHandlers = self->_completionHandlers;
  id v7 = objc_retainBlock(v5);

  [(NSMutableArray *)completionHandlers addObject:v7];
}

- (void)_queue_startFetchingLibrary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_state)
  {
    self->_state = 1;
    v3 = +[CLKDevice currentDevice];
    id v4 = [v3 nrDevice];
    id v5 = [v4 pairingID];
    id v6 = objc_alloc((Class)NTKPersistentFaceCollection);
    id v7 = [v6 initWithCollectionIdentifier:NTKCollectionIdentifierLibraryFaces deviceUUID:v5];
    id v8 = (NTKDLoadOnceCollectionObserver *)[objc_alloc((Class)NTKDLoadOnceCollectionObserver) initWithCollection:v7];
    collectionObserver = self->_collectionObserver;
    self->_collectionObserver = v8;

    unsigned __int8 v10 = self->_collectionObserver;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002717C;
    v11[3] = &unk_100061D90;
    v11[4] = self;
    [(NTKDLoadOnceCollectionObserver *)v10 performOnLoad:v11];
  }
}

- (void)_queue_handlePriorityList:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling Priority List…", buf, 2u);
  }

  if (self->_state == 1)
  {
    id v6 = [(NSMutableArray *)self->_completionHandlers copy];
    [(NSMutableArray *)self->_completionHandlers removeAllObjects];
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling %@ callbacks…", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v13));
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resetting state…", buf, 2u);
    }

    self->_state = 0;
    collectionObserver = self->_collectionObserver;
    self->_collectionObserver = 0;
  }
}

- (id)_priorityListFromCollection:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [v4 selectedFace];
  [(NTKDCompanionTrackedPhotosService *)self _addTrackedPhotosContentToList:v5 forFace:v6];

  id v7 = [v4 selectedFaceIndex];
  id v8 = (char *)[v4 selectedFaceIndex];
  id v9 = [v4 orderedUUIDs];
  id v10 = (char *)[v9 count];
  id v11 = v10 - 1;

  uint64_t v12 = v8 + 1;
  uint64_t v13 = (uint64_t)v7 - 1;
  if (v13 >= 0)
  {
    do
    {
      if ((uint64_t)v12 > (uint64_t)v11) {
        break;
      }
      v14 = [v4 faceAtIndex:v13];
      [(NTKDCompanionTrackedPhotosService *)self _addTrackedPhotosContentToList:v5 forFace:v14];
      id v15 = [v4 faceAtIndex:v12];
      [(NTKDCompanionTrackedPhotosService *)self _addTrackedPhotosContentToList:v5 forFace:v15];

      ++v12;
    }
    while (v13-- != 0);
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    do
    {
      long long v17 = [v4 faceAtIndex:v13];
      [(NTKDCompanionTrackedPhotosService *)self _addTrackedPhotosContentToList:v5 forFace:v17];
      --v13;
    }
    while (v13 != -1);
  }
  if ((uint64_t)v12 <= (uint64_t)v11)
  {
    do
    {
      long long v18 = [v4 faceAtIndex:v12];
      [(NTKDCompanionTrackedPhotosService *)self _addTrackedPhotosContentToList:v5 forFace:v18];
      ++v12;
    }
    while (v10 != v12);
  }

  return v5;
}

- (void)_addTrackedPhotosContentToList:(id)a3 forFace:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v7 = v5;
    id v6 = [a4 trackedPhotosContent];
    if (v6) {
      [v7 addObject:v6];
    }

    id v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionObserver, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end