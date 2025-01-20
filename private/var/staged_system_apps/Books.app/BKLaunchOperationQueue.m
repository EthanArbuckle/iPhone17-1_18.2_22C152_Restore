@interface BKLaunchOperationQueue
- (BKLaunchOperationQueue)initWithName:(id)a3 signpostLog:(id)a4 targetQueue:(id)a5 activate:(BOOL)a6;
- (unsigned)qosClass;
- (void)activate;
- (void)addOperationWithBlock:(id)a3;
- (void)dealloc;
- (void)setQosClass:(unsigned int)a3;
- (void)waitUntilAllOperationsAreFinished;
@end

@implementation BKLaunchOperationQueue

- (void)addOperationWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  activeQueue = self->_activeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043C3C;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activeQueue, v7);
  self->_hasNewBlocks = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeQueue, 0);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
  objc_storeStrong((id *)&self->_signpostLog, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BKLaunchOperationQueue)initWithName:(id)a3 signpostLog:(id)a4 targetQueue:(id)a5 activate:(BOOL)a6
{
  id v11 = a3;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BKLaunchOperationQueue;
  v14 = [(BKLaunchOperationQueue *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_signpostLog, a4);
    v15->_signpostID = os_signpost_id_make_with_pointer(v12, v15);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UNSPECIFIED, 0);

    if (!a6)
    {
      uint64_t v18 = dispatch_queue_attr_make_initially_inactive(v17);

      v17 = v18;
    }
    v19 = (const char *)[v11 UTF8String];
    if (v13) {
      dispatch_queue_t v20 = dispatch_queue_create_with_target_V2(v19, v17, v13);
    }
    else {
      dispatch_queue_t v20 = dispatch_queue_create(v19, v17);
    }
    underlyingQueue = v15->_underlyingQueue;
    v15->_underlyingQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v15->_activeQueue, v15->_underlyingQueue);
    v15->_lock._os_unfair_lock_opaque = 0;
  }
  return v15;
}

- (void)setQosClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int qosClass = self->_qosClass;
  if (qosClass != v3)
  {
    self->_unsigned int qosClass = v3;
    if (v3)
    {
      v7 = +[NSString stringWithFormat:@"%@@0x%x", self->_name, v3];
      id v8 = (const char *)[(OS_dispatch_queue *)v7 UTF8String];
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = dispatch_queue_attr_make_with_qos_class(v9, (dispatch_qos_class_t)v3, 0);
      id v11 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v8, v10, (dispatch_queue_t)self->_underlyingQueue);
      activeQueue = self->_activeQueue;
      self->_activeQueue = v11;
    }
    else
    {
      v13 = self->_underlyingQueue;
      v7 = self->_activeQueue;
      self->_activeQueue = v13;
    }

    if (qosClass < v3 && self->_hasNewBlocks) {
      dispatch_async((dispatch_queue_t)self->_activeQueue, &stru_100A4B480);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)waitUntilAllOperationsAreFinished
{
  p_lock = &self->_lock;
  do
  {
    os_unfair_lock_lock(p_lock);
    activeQueue = self->_activeQueue;
    self->_hasNewBlocks = 0;
    v5 = activeQueue;
    os_unfair_lock_unlock(p_lock);
    dispatch_sync(v5, &stru_100A4B4A0);

    os_unfair_lock_lock(p_lock);
    LODWORD(v5) = self->_hasNewBlocks;
    os_unfair_lock_unlock(p_lock);
  }
  while (v5);
}

- (void)dealloc
{
  dispatch_activate((dispatch_object_t)self->_underlyingQueue);
  v3.receiver = self;
  v3.super_class = (Class)BKLaunchOperationQueue;
  [(BKLaunchOperationQueue *)&v3 dealloc];
}

- (void)activate
{
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

@end