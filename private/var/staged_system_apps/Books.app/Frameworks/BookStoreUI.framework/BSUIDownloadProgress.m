@interface BSUIDownloadProgress
- (BSUIDownloadProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (NSNumber)progress;
- (NSObject)instance;
- (NSObject)parameters;
- (NSString)formattedProgress;
- (NSString)kind;
- (void)registerProgressObserver:(id)a3;
- (void)setProgress:(id)a3;
- (void)unregisterProgressObserver:(id)a3;
@end

@implementation BSUIDownloadProgress

- (BSUIDownloadProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BSUIDownloadProgress;
  v12 = [(BSUIDownloadProgress *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kind, a3);
    objc_storeStrong((id *)&v13->_instance, a4);
    objc_storeStrong((id *)&v13->_parameters, a5);
    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("BSUIDownloadProgress.access", 0);
    access = v13->_access;
    v13->_access = (OS_dispatch_queue *)v16;
  }
  return v13;
}

- (void)setProgress:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = sub_2B6FC;
  v20 = sub_2B70C;
  id v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2C3B4;
  block[3] = &unk_38E428;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(access, block);
  objc_storeStrong((id *)&self->_progress, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v17[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) dynamicProgressChanged:self];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)registerProgressObserver:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2C498;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(access, v7);
}

- (void)unregisterProgressObserver:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2C53C;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(access, v7);
}

- (NSString)formattedProgress
{
  return self->formattedProgress;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->formattedProgress, 0);
  objc_storeStrong((id *)&self->_access, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end