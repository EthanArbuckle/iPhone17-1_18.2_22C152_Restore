@interface TUIImagePrefetchControllerManager
+ (id)sharedManager;
- (TUIImagePrefetchControllerManager)init;
- (id)_controllerWithID:(id)a3;
- (void)prefetchResources:(id)a3 controllerID:(id)a4 loader:(id)a5;
- (void)registerPrefetchController:(id)a3;
- (void)unregisterPrefetchController:(id)a3;
@end

@implementation TUIImagePrefetchControllerManager

+ (id)sharedManager
{
  if (qword_2DF2C0 != -1) {
    dispatch_once(&qword_2DF2C0, &stru_252878);
  }
  v2 = (void *)qword_2DF2B8;

  return v2;
}

- (TUIImagePrefetchControllerManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)TUIImagePrefetchControllerManager;
  v2 = [(TUIImagePrefetchControllerManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("TUIImagePrefetchControllerManager.workQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("TUIImagePrefetchControllerManager.access", 0);
    access = v2->_access;
    v2->_access = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    map = v2->_map;
    v2->_map = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSHashTable weakObjectsHashTable];
    controllers = v2->_controllers;
    v2->_controllers = (NSHashTable *)v10;
  }
  return v2;
}

- (void)registerPrefetchController:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3A5A0;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(access, v7);
}

- (void)unregisterPrefetchController:(id)a3
{
  id v4 = a3;
  v5 = [v4 controllerID];
  id v6 = [v5 copy];

  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A6D4;
  block[3] = &unk_251828;
  block[4] = self;
  id v14 = v4;
  id v8 = v4;
  dispatch_sync(access, block);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3A6E0;
  v11[3] = &unk_251828;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (id)_controllerWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_3A9B8;
  v16 = sub_3A9C8;
  id v17 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A9D0;
  block[3] = &unk_251800;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(access, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)prefetchResources:(id)a3 controllerID:(id)a4 loader:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3ABF8;
  v15[3] = &unk_252678;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_map, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end