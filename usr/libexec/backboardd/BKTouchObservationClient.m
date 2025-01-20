@interface BKTouchObservationClient
- (BKTouchObservationClient)initWithConnection:(id)a3 pid:(int)a4;
- (void)_didRespondToTouchDelivery;
- (void)_lock_sendQueuedUpdatesToClient;
- (void)sendTouchUpdate:(id)a3;
@end

@implementation BKTouchObservationClient

- (void)sendTouchUpdate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingUpdates = self->_lock_pendingUpdates;
  if (self->_lock_waitingOnClient)
  {
    uint64_t v6 = (uint64_t)[(NSMutableArray *)lock_pendingUpdates count];
    BSContinuousMachTimeNow();
    double v8 = v7 - self->_lock_updateSentTimestamp;
    if (v6 >= 1 && v8 > 2.0)
    {
      v10 = BKLogTouchDeliveryObserver();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = BSProcessDescriptionForPID();
        int v14 = 134218498;
        double v15 = v8;
        __int16 v16 = 1024;
        int v17 = v6;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "waiting for %g seconds; dropping %d updates for %{public}@",
          (uint8_t *)&v14,
          0x1Cu);
      }
      [(NSMutableArray *)self->_lock_pendingUpdates removeAllObjects];
    }
    [(NSMutableArray *)self->_lock_pendingUpdates addObject:v4];
  }
  else
  {
    if (!lock_pendingUpdates)
    {
      v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v12 = self->_lock_pendingUpdates;
      self->_lock_pendingUpdates = v11;

      lock_pendingUpdates = self->_lock_pendingUpdates;
    }
    [(NSMutableArray *)lock_pendingUpdates addObject:v4];
    [(BKTouchObservationClient *)self _lock_sendQueuedUpdatesToClient];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_sendQueuedUpdatesToClient
{
  if ([(NSMutableArray *)self->_lock_pendingUpdates count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v4 = [WeakRetained remoteTarget];

    id v5 = [(NSMutableArray *)self->_lock_pendingUpdates copy];
    [(NSMutableArray *)self->_lock_pendingUpdates removeAllObjects];
    uint64_t v6 = BKLogTouchDeliveryObserver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v8 = +[BSDescriptionStream descriptionForRootObject:v5];
      v9 = BSProcessDescriptionForPID();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v8;
      __int16 v13 = 2114;
      int v14 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "post updates:%{public}@ to:%{public}@", location, 0x16u);
    }
    self->_lock_waitingOnClient = 1;
    BSContinuousMachTimeNow();
    self->_lock_updateSentTimestamp = v7;
    objc_initWeak((id *)location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004134;
    v10[3] = &unk_1000F6460;
    objc_copyWeak(&v11, (id *)location);
    [v4 observeTouchEventDeliveryDidOccur:v5 response:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
}

- (void)_didRespondToTouchDelivery
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_waitingOnClient = 0;
  self->_lock_updateSentTimestamp = 0.0;
  [(BKTouchObservationClient *)self _lock_sendQueuedUpdatesToClient];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendingUpdates, 0);

  objc_destroyWeak((id *)&self->_connection);
}

- (BKTouchObservationClient)initWithConnection:(id)a3 pid:(int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKTouchObservationClient;
  double v7 = [(BKTouchObservationClient *)&v10 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_pid = a4;
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

@end