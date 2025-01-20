@interface BSUIDownloadProgressCenter
- (BSUIDownloadProgressCenter)init;
- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (void)_audiobookDownloadStatusNotification:(id)a3;
- (void)_ubiquityDownloadStatusNotification:(id)a3;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
@end

@implementation BSUIDownloadProgressCenter

- (BSUIDownloadProgressCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)BSUIDownloadProgressCenter;
  v2 = [(BSUIDownloadProgressCenter *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    instanceMap = v2->_instanceMap;
    v2->_instanceMap = (NSMapTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("BSUIDownloadProgressCenter.access", v5);
    accessQ = v2->_accessQ;
    v2->_accessQ = (OS_dispatch_queue *)v6;

    v8 = +[BLDownloadQueue sharedInstance];
    [v8 addObserver:v2];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_audiobookDownloadStatusNotification:" name:@"BSUIAudioBookDownloadStatusNotification" object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_ubiquityDownloadStatusNotification:" name:@"BSUIUbiquityDownloadStatusNotification" object:0];

    v11 = BCBookDownloadLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_2DD424(v11);
    }
  }
  return v2;
}

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_2B6FC;
  v26 = sub_2B70C;
  id v27 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B714;
  block[3] = &unk_38EF68;
  id v20 = v10;
  v21 = &v22;
  block[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(accessQ, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v12 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v8);
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x3032000000;
        id v18 = sub_2B6FC;
        id v19 = sub_2B70C;
        id v20 = 0;
        accessQ = self->_accessQ;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_2BA98;
        block[3] = &unk_38E388;
        void block[5] = v9;
        block[6] = &v15;
        block[4] = self;
        dispatch_sync(accessQ, block);
        if (v16[5])
        {
          v11 = [v9 percentComplete];
          [(id)v16[5] setProgress:v11];
        }
        _Block_object_dispose(&v15, 8);

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
}

- (void)_audiobookDownloadStatusNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"BSUIAudioBookDownloadProgressKey"];
  uint64_t v7 = BUDynamicCast();

  if (v7)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_2B6FC;
    id v20 = sub_2B70C;
    id v21 = 0;
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2BD94;
    block[3] = &unk_38E388;
    uint64_t v15 = &v16;
    block[4] = self;
    id v9 = v7;
    id v14 = v9;
    dispatch_sync(accessQ, block);
    if (v17[5])
    {
      id v10 = BCBookDownloadLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [v9 progress];
        sub_2DD468(v11, buf, v10);
      }

      id v12 = [v9 progress];
      [(id)v17[5] setProgress:v12];
    }
    _Block_object_dispose(&v16, 8);
  }
}

- (void)_ubiquityDownloadStatusNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"BSUIUbiquityDownloadProgressKey"];
  uint64_t v7 = BUDynamicCast();

  if (v7)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_2B6FC;
    id v20 = sub_2B70C;
    id v21 = 0;
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2C01C;
    block[3] = &unk_38E388;
    uint64_t v15 = &v16;
    block[4] = self;
    id v9 = v7;
    id v14 = v9;
    dispatch_sync(accessQ, block);
    if (v17[5])
    {
      id v10 = BCBookDownloadLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [v9 progress];
        sub_2DD4C0(v11, buf, v10);
      }

      id v12 = [v9 progress];
      [(id)v17[5] setProgress:v12];
    }
    _Block_object_dispose(&v16, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQ, 0);

  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end