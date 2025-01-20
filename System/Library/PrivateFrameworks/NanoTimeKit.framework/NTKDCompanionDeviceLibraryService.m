@interface NTKDCompanionDeviceLibraryService
+ (id)sharedService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (id)_jsonFromCollection:(id)a3 error:(id *)a4;
- (void)_queue_appendCompletionHandler:(id)a3;
- (void)_queue_fetchLibraryAsJSON:(id)a3;
- (void)_queue_handleFaceJSON:(id)a3 error:(id)a4;
- (void)_queue_startFetchingLibrary;
- (void)fetchLibraryAsJSON:(id)a3;
- (void)start;
@end

@implementation NTKDCompanionDeviceLibraryService

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027848;
  block[3] = &unk_100060B50;
  block[4] = a1;
  if (qword_100072420 != -1) {
    dispatch_once(&qword_100072420, block);
  }
  v2 = (void *)qword_100072418;

  return v2;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKDCompanionDeviceLibraryService;
  v2 = [(NTKDCompanionDeviceLibraryService *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoTimeKit.CompanionDeviceLibraryService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_state = 0;
    collectionObserver = v2->_collectionObserver;
    v2->_collectionObserver = 0;

    uint64_t v7 = +[NSMutableArray array];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)start
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device Library service is starting…", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027A14;
  block[3] = &unk_100060A90;
  block[4] = self;
  if (qword_100072430 != -1) {
    dispatch_once(&qword_100072430, block);
  }
}

- (void)fetchLibraryAsJSON:(id)a3
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked for JSON library", buf, 2u);
  }

  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027BC0;
    v7[3] = &unk_100060AE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)_jsonFromCollection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSMutableArray array];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027D70;
  v13[3] = &unk_100061DB8;
  v15 = v17;
  id v16 = [v5 selectedFaceIndex];
  id v7 = v6;
  id v14 = v7;
  [v5 enumerateFacesUsingBlock:v13];
  id v12 = 0;
  id v8 = +[NSJSONSerialization dataWithJSONObject:v7 options:3 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    objc_super v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100043A2C((uint64_t)v9, v10);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  _Block_object_dispose(v17, 8);

  return v8;
}

- (void)_queue_handleFaceJSON:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling found JSON…", buf, 2u);
  }

  if (self->_state == 1)
  {
    id v9 = [(NSMutableArray *)self->_completionHandlers copy];
    [(NSMutableArray *)self->_completionHandlers removeAllObjects];
    objc_super v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %@ callbacks…", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * (void)v16));
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    v17 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Resetting state…", buf, 2u);
    }

    self->_state = 0;
    collectionObserver = self->_collectionObserver;
    self->_collectionObserver = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting XPC connection request for Device Library service…", buf, 2u);
  }

  id v9 = [v7 valueForEntitlement:@"com.apple.nanotimekit.devicelibrary"];
  unsigned __int8 v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NTKDeviceLibraryServer];
    [v7 setExportedInterface:v11];
    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000283E4;
    v13[3] = &unk_100060A68;
    objc_copyWeak(&v14, (id *)buf);
    [v7 setInvalidationHandler:v13];
    [v7 resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "XPC connection not entitled for device library %@…", buf, 0xCu);
    }
  }

  return v10;
}

- (void)_queue_fetchLibraryAsJSON:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = v5;
  if (v5)
  {
    [(NTKDCompanionDeviceLibraryService *)self _queue_appendCompletionHandler:v5];
    id v4 = v5;
    if (!self->_state)
    {
      [(NTKDCompanionDeviceLibraryService *)self _queue_startFetchingLibrary];
      id v4 = v5;
    }
  }
}

- (void)_queue_appendCompletionHandler:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = v7;
  if (v7)
  {
    completionHandlers = self->_completionHandlers;
    id v6 = objc_retainBlock(v7);
    [(NSMutableArray *)completionHandlers addObject:v6];

    id v4 = v7;
  }
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
    v11[2] = sub_100028634;
    v11[3] = &unk_100061D90;
    v11[4] = self;
    [(NTKDLoadOnceCollectionObserver *)v10 performOnLoad:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionObserver, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end