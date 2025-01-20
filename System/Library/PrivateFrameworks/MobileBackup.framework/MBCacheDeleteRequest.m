@interface MBCacheDeleteRequest
- (MBCacheDeleteRequest)initWithVolumePath:(id)a3;
- (NSString)volumePath;
- (unint64_t)purge:(unint64_t)a3;
- (void)_cancel;
- (void)cancel;
- (void)dealloc;
- (void)setVolumePath:(id)a3;
@end

@implementation MBCacheDeleteRequest

- (MBCacheDeleteRequest)initWithVolumePath:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBCacheDeleteRequest;
  v6 = [(MBCacheDeleteRequest *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumePath, a3);
    atomic_store(0, (unsigned __int8 *)&v7->_cancelled);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (unint64_t)purge:(unint64_t)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_cancelled);
  if (v3)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CacheDelete request already cancelled", buf, 2u);
      _MBLog();
    }

    unint64_t v9 = v18[3];
  }
  else
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007C0FC;
    v12[3] = &unk_1004117A0;
    v14 = &v17;
    unint64_t v15 = a3;
    v12[4] = self;
    v13 = v6;
    v8 = v6;
    dispatch_async(queue, v12);
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    unint64_t v9 = v18[3];
  }
  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)cancel
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_cancelled, 1u) & 1) == 0)
  {
    unsigned __int8 v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling CacheDelete purge request", buf, 2u);
      _MBLog();
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007C39C;
    block[3] = &unk_100411128;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_cancel
{
  if (self->_token)
  {
    CacheDeleteCancelPurge();
    self->_token = 0;
  }
}

- (void)dealloc
{
  [(MBCacheDeleteRequest *)self _cancel];
  v3.receiver = self;
  v3.super_class = (Class)MBCacheDeleteRequest;
  [(MBCacheDeleteRequest *)&v3 dealloc];
}

- (NSString)volumePath
{
  return self->_volumePath;
}

- (void)setVolumePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end