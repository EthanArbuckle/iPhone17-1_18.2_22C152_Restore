@interface NIServerVisionDataDistributor
+ (id)sharedProvider;
- (id).cxx_construct;
- (id)initPrivate;
- (void)processVisionInput:(id)a3;
- (void)registerForVisionInput:(id)a3;
- (void)unregisterForVisionInput:(id)a3;
@end

@implementation NIServerVisionDataDistributor

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)NIServerVisionDataDistributor;
  v2 = [(NIServerVisionDataDistributor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    consumers = v3->_consumers;
    v3->_consumers = (NSHashTable *)v4;
  }
  return v3;
}

+ (id)sharedProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100238980;
  block[3] = &unk_1008466D8;
  block[4] = a1;
  if (qword_1008A5790 != -1) {
    dispatch_once(&qword_1008A5790, block);
  }
  v2 = (void *)qword_1008A5788;

  return v2;
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  uint64_t v6 = sub_1002B5E84((uint64_t)&self->_machTimeConverter, v5);
  if (v7)
  {
    [v4 overrideTimestamp:*(double *)&v6];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = self->_consumers;
    id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [v12 getQueueForInputingData];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100238BB0;
          block[3] = &unk_100846588;
          block[4] = v12;
          id v16 = v4;
          dispatch_async(v13, block);
        }
        id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (void)registerForVisionInput:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (([v6 supportsCameraAssistance] & 1) == 0)
  {
    id v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100424B18(v4);
    }
    double v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/VIO/NIServerVisionDataDistributor.mm";
      __int16 v9 = 1024;
      int v10 = 59;
      __int16 v11 = 2080;
      v12 = "-[NIServerVisionDataDistributor registerForVisionInput:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  [(NSHashTable *)self->_consumers addObject:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterForVisionInput:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_consumers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end