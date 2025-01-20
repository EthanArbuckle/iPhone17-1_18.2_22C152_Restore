@interface BaseRequestHandler
+ (BOOL)supportsAccountlessHandling;
+ (BaseRequestHandler)accountlessHandler;
+ (NSArray)managedConfigurations;
+ (NSMutableDictionary)handlers;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)deleteHandlerForConfiguration:(id)a3;
+ (id)handlerForConfiguration:(id)a3;
- (BOOL)isActive;
- (BaseRequestHandler)init;
- (BaseRequestHandler)initWithConfiguration:(id)a3;
- (ICConnectionConfiguration)configuration;
- (ICDBackgroundTaskScheduling)taskScheduler;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (ML3MusicLibrary)musicLibrary;
- (id)description;
- (void)onCalloutQueue:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setTaskScheduler:(id)a3;
@end

@implementation BaseRequestHandler

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BaseRequestHandler *)self configuration];
  v6 = [v5 userIdentity];
  v7 = [v6 accountDSID];
  v8 = +[NSString stringWithFormat:@"<%@ %p: [dsid=%@, active=%d]>", v4, self, v7, self->_active];

  return v8;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

+ (id)handlerForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1000350D4;
  v17 = sub_1000350E4;
  id v18 = 0;
  v5 = [(id)objc_opt_class() globalSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DE40;
  block[3] = &unk_1001BA220;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000354B4;
  block[3] = &unk_1001BEA20;
  void block[4] = a1;
  if (qword_1001F3790 != -1) {
    dispatch_once(&qword_1001F3790, block);
  }
  v2 = (void *)qword_1001F3788;

  return (OS_dispatch_queue *)v2;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setTaskScheduler:(id)a3
{
}

- (ICDBackgroundTaskScheduling)taskScheduler
{
  return self->_taskScheduler;
}

- (void)onCalloutQueue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034E4C;
    block[3] = &unk_1001BEC70;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

- (BaseRequestHandler)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BaseRequestHandler;
  id v6 = [(BaseRequestHandler *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [v5 userIdentity];
    userIdentity = v7->_userIdentity;
    v7->_userIdentity = (ICUserIdentity *)v8;

    uint64_t v10 = [v5 userIdentityStore];
    userIdentityStore = v7->_userIdentityStore;
    v7->_userIdentityStore = (ICUserIdentityStore *)v10;

    uint64_t v12 = +[ML3MusicLibrary musicLibraryForUserAccount:v7->_userIdentity];
    musicLibrary = v7->_musicLibrary;
    v7->_musicLibrary = (ML3MusicLibrary *)v12;
  }
  return v7;
}

- (BaseRequestHandler)init
{
  return 0;
}

+ (BaseRequestHandler)accountlessHandler
{
  return 0;
}

+ (BOOL)supportsAccountlessHandling
{
  return 0;
}

+ (NSArray)managedConfigurations
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000350D4;
  v11 = sub_1000350E4;
  id v12 = 0;
  id v3 = [(id)objc_opt_class() globalSerialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000350EC;
  v6[3] = &unk_1001BA248;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

+ (id)deleteHandlerForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    objc_super v15 = sub_1000350D4;
    v16 = sub_1000350E4;
    id v17 = 0;
    id v5 = [(id)objc_opt_class() globalSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000352F0;
    block[3] = &unk_1001BA220;
    id v11 = a1;
    id v9 = v4;
    uint64_t v10 = &v12;
    dispatch_sync(v5, block);

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (NSMutableDictionary)handlers
{
  return 0;
}

@end