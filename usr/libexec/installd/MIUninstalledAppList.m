@interface MIUninstalledAppList
+ (id)sharedList;
- (MIUninstalledAppList)init;
- (NSDictionary)uninstalledDictionary;
- (NSMutableDictionary)uninstalledList;
- (OS_dispatch_queue)listQueue;
- (id)_mapPath;
- (id)_onQueue_uninstalledList;
- (void)_onQueue_setUninstalledList:(id)a3;
- (void)addIdentifier:(id)a3;
- (void)preflightUninstalledMap;
- (void)removeIdentifiers:(id)a3;
- (void)setUninstalledList:(id)a3;
@end

@implementation MIUninstalledAppList

- (MIUninstalledAppList)init
{
  v7.receiver = self;
  v7.super_class = (Class)MIUninstalledAppList;
  v2 = [(MIUninstalledAppList *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileInstallation.UninstalledAppListQueue", v3);
    listQueue = v2->_listQueue;
    v2->_listQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedList
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D2D8;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A6058 != -1) {
    dispatch_once(&qword_1000A6058, block);
  }
  v2 = (void *)qword_1000A6050;

  return v2;
}

- (id)_mapPath
{
  v2 = +[MIDaemonConfiguration sharedInstance];
  v3 = [v2 dataDirectory];
  dispatch_queue_t v4 = [v3 URLByAppendingPathComponent:@"UninstalledApplications.plist" isDirectory:0];

  return v4;
}

- (id)_onQueue_uninstalledList
{
  v3 = [(MIUninstalledAppList *)self uninstalledList];

  if (!v3)
  {
    dispatch_queue_t v4 = [(MIUninstalledAppList *)self _mapPath];
    v5 = +[NSMutableDictionary dictionaryWithContentsOfURL:v4];
    [(MIUninstalledAppList *)self setUninstalledList:v5];

    v6 = [(MIUninstalledAppList *)self uninstalledList];

    if (!v6)
    {
      objc_super v7 = objc_opt_new();
      [(MIUninstalledAppList *)self setUninstalledList:v7];
    }
  }

  return [(MIUninstalledAppList *)self uninstalledList];
}

- (void)_onQueue_setUninstalledList:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    [(MIUninstalledAppList *)self setUninstalledList:v5];
    v6 = [(MIUninstalledAppList *)self uninstalledList];
    objc_super v7 = [(MIUninstalledAppList *)self _mapPath];
    unsigned __int8 v8 = [v6 writeToURL:v7 atomically:1];

    if ((v8 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
      MOLogWrite();
    }
  }
  else
  {
    [(MIUninstalledAppList *)self setUninstalledList:0];
    v9 = +[MIFileManager defaultManager];
    v10 = [(MIUninstalledAppList *)self _mapPath];
    id v14 = 0;
    unsigned __int8 v11 = [v9 removeItemAtURL:v10 error:&v14];
    id v12 = v14;

    if ((v11 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      v13 = __error();
      strerror(*v13);
      MOLogWrite();
    }
  }
}

- (void)preflightUninstalledMap
{
  if (!sub_10003D6AC())
  {
    v3 = +[MIFileManager defaultManager];
    id v4 = [(MIUninstalledAppList *)self _mapPath];
    id v8 = 0;
    unsigned __int8 v5 = [v3 removeItemAtURL:v4 error:&v8];
    id v6 = v8;

    if ((v5 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      objc_super v7 = __error();
      strerror(*v7);
      MOLogWrite();
    }
  }
}

- (NSDictionary)uninstalledDictionary
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10003D844;
  unsigned __int8 v11 = sub_10003D854;
  id v12 = 0;
  v3 = [(MIUninstalledAppList *)self listQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003D85C;
  v6[3] = &unk_10008CFB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)addIdentifier:(id)a3
{
  id v4 = a3;
  if (sub_10003D6AC())
  {
    unsigned __int8 v5 = [(MIUninstalledAppList *)self listQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003D964;
    v6[3] = &unk_10008CF38;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MIUninstalledAppList *)self listQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DA9C;
  v7[3] = &unk_10008CF38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (NSMutableDictionary)uninstalledList
{
  return self->_uninstalledList;
}

- (void)setUninstalledList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstalledList, 0);

  objc_storeStrong((id *)&self->_listQueue, 0);
}

@end