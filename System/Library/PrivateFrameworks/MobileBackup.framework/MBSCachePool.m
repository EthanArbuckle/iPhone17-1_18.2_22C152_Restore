@interface MBSCachePool
+ (id)sharedPool;
- (MBSCachePool)init;
- (id)_openCache;
- (id)acquireCache;
- (void)_closeCache:(id)a3;
- (void)_drain;
- (void)_scheduleDrain;
- (void)dealloc;
- (void)releaseCache:(id)a3;
@end

@implementation MBSCachePool

+ (id)sharedPool
{
  if (qword_100482570 != -1) {
    dispatch_once(&qword_100482570, &stru_100414948);
  }
  return (id)qword_100482568;
}

- (MBSCachePool)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBSCachePool;
  v2 = [(MBSCachePool *)&v6 init];
  if (v2)
  {
    v2->_caches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBSCachePool;
  [(MBSCachePool *)&v3 dealloc];
}

- (id)acquireCache
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_10015A3CC;
  v13 = sub_10015A3DC;
  uint64_t v14 = 0;
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Removing cache from pool", buf, 2u);
    _MBLog();
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015A3E8;
  v7[3] = &unk_100414970;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  if (!v5)
  {
    id v5 = [(MBSCachePool *)self _openCache];
    v10[5] = (uint64_t)v5;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)releaseCache:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10015A5B8;
  v4[3] = &unk_100414998;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)_openCache
{
  v2 = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", +[MBServiceCache systemPath](MBServiceCache, "systemPath"), objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0)));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015A87C;
  v5[3] = &unk_1004149C0;
  v5[4] = v2;
  MBPerformOnMBSCachePoolSerialQueue(v5);
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Opened cache: %p", buf, 0xCu);
    _MBLog();
  }
  return v2;
}

- (void)_closeCache:(id)a3
{
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Closing cache: %p", buf, 0xCu);
    id v5 = a3;
    _MBLog();
  }
  objc_msgSend(a3, "close", v5);
}

- (void)_scheduleDrain
{
  BOOL drainScheduled = self->_drainScheduled;
  v4 = MBGetDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (drainScheduled)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Not scheduling duplicate drain", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      int v10 = 10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Scheduling drain of cache pool in %d s", buf, 8u);
      _MBLog();
    }
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015ABC8;
    block[3] = &unk_1004149C0;
    block[4] = self;
    dispatch_after(v6, queue, block);
    self->_BOOL drainScheduled = 1;
  }
}

- (void)_drain
{
  self->_BOOL drainScheduled = 0;
  id v3 = [(NSMutableArray *)self->_caches count];
  v4 = MBGetDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (!v5) {
      return;
    }
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Can't drain because cache pool is empty", v7, 2u);
    goto LABEL_10;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Draining cache pool", buf, 2u);
    _MBLog();
  }
  [(MBSCachePool *)self _closeCache:[(NSMutableArray *)self->_caches objectAtIndexedSubscript:0]];
  [(NSMutableArray *)self->_caches removeObjectAtIndex:0];
  if ([(NSMutableArray *)self->_caches count])
  {
    [(MBSCachePool *)self _scheduleDrain];
    return;
  }
  dispatch_time_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Not scheduling cache pool drain because it's empty", v8, 2u);
LABEL_10:
    _MBLog();
  }
}

@end