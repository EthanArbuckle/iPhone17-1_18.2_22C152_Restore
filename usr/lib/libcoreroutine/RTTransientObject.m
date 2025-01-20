@interface RTTransientObject
- (NSRecursiveLock)lock;
- (RTTimer)backingObjectExpirationTimer;
- (RTTimerManager)timerManager;
- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4;
- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4 timerManager:(id)a5;
- (RTTransientObjectProtocol)transientObjectDelegate;
- (double)backingObjectExpirationTimeInterval;
- (double)lastForwardedMessageTimeInterval;
- (id)__createBackingObject;
- (id)backingObject;
- (id)backingObjectCreationBlock;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)__createTimerAssociatedWithBackingObject;
- (void)__handleBackingObjectTimerExpired;
- (void)__invalidateBackingObject;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)setBackingObject:(id)a3;
- (void)setBackingObjectCreationBlock:(id)a3;
- (void)setBackingObjectExpirationTimeInterval:(double)a3;
- (void)setBackingObjectExpirationTimer:(id)a3;
- (void)setLastForwardedMessageTimeInterval:(double)a3;
- (void)setLock:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTransientObjectDelegate:(id)a3;
- (void)touch;
@end

@implementation RTTransientObject

- (id)__createBackingObject
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E016D870](self, a2);
  backingObjectCreationBlock = (void (**)(void))self->_backingObjectCreationBlock;
  if (backingObjectCreationBlock)
  {
    v5 = backingObjectCreationBlock[2]();
    [(RTTransientObject *)self __createTimerAssociatedWithBackingObject];
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      v9 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "(re)created transient object, %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)__createTimerAssociatedWithBackingObject
{
  objc_initWeak(&location, self);
  timerManager = self->_timerManager;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = dispatch_get_global_queue(0, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __61__RTTransientObject___createTimerAssociatedWithBackingObject__block_invoke;
  v12 = &unk_1E6B91900;
  objc_copyWeak(&v13, &location);
  v7 = [(RTTimerManager *)timerManager timerWithIdentifier:v5 queue:v6 handler:&v9];
  backingObjectExpirationTimer = self->_backingObjectExpirationTimer;
  self->_backingObjectExpirationTimer = v7;

  -[RTTimer fireAfterDelay:](self->_backingObjectExpirationTimer, "fireAfterDelay:", self->_backingObjectExpirationTimeInterval, v9, v10, v11, v12);
  [(RTTimer *)self->_backingObjectExpirationTimer resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(RTTransientObject *)self backingObject];
    double lastForwardedMessageTimeInterval = self->_lastForwardedMessageTimeInterval;
    int v11 = 138412546;
    v12 = v9;
    __int16 v13 = 2048;
    double v14 = lastForwardedMessageTimeInterval;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "updating last forwarded message time interval for transient object, %@ to %lf", (uint8_t *)&v11, 0x16u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_double lastForwardedMessageTimeInterval = v7;
  int v8 = [(RTTransientObject *)self backingObject];
  [v5 invokeWithTarget:v8];

  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)backingObject
{
  id backingObject = self->_backingObject;
  if (!backingObject)
  {
    v4 = [(RTTransientObject *)self __createBackingObject];
    id v5 = self->_backingObject;
    self->_id backingObject = v4;

    id backingObject = self->_backingObject;
    if (backingObject)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_transientObjectDelegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained transientObjectDidCreateBackingObject:self];
      }

      id backingObject = self->_backingObject;
    }
  }
  id v7 = backingObject;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(RTTransientObject *)self backingObject];
  v6 = [v5 methodSignatureForSelector:a3];

  [(NSRecursiveLock *)self->_lock unlock];

  return v6;
}

void __61__RTTransientObject___createTimerAssociatedWithBackingObject__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained __handleBackingObjectTimerExpired];
    id WeakRetained = v2;
  }
}

- (void)__handleBackingObjectTimerExpired
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_backingObjectExpirationTimeInterval];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  double lastForwardedMessageTimeInterval = self->_lastForwardedMessageTimeInterval;
  if (lastForwardedMessageTimeInterval <= v5)
  {
    [(RTTransientObject *)self __invalidateBackingObject];
  }
  else
  {
    double v7 = lastForwardedMessageTimeInterval - v5;
    [(RTTimer *)self->_backingObjectExpirationTimer suspend];
    [(RTTimer *)self->_backingObjectExpirationTimer fireAfterDelay:v7];
    [(RTTimer *)self->_backingObjectExpirationTimer resume];
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id backingObject = self->_backingObject;
      int v10 = 134218242;
      double v11 = v7;
      __int16 v12 = 2112;
      id v13 = backingObject;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "moving timer out, %lf on object, %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  double v7 = objc_opt_new();
  int v8 = [(RTTransientObject *)self initWithCreationBlock:v6 timeout:v7 timerManager:a4];

  return v8;
}

- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4 timerManager:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315394;
    v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
    __int16 v22 = 1024;
    int v23 = 29;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationBlock (in %s:%d)", (uint8_t *)&v20, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
      __int16 v22 = 1024;
      int v23 = 30;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }
  }
LABEL_10:
  if (a4 <= 0.0)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
      __int16 v22 = 1024;
      int v23 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "timeout must be greater than 0. (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }
  }
  uint64_t v14 = 0;
  if (v8 && a4 > 0.0 && v10)
  {
    self->_backingObjectExpirationTimeInterval = a4;
    uint64_t v15 = (void *)MEMORY[0x1E016DB00](v8);
    id backingObjectCreationBlock = self->_backingObjectCreationBlock;
    self->_id backingObjectCreationBlock = v15;

    v17 = (NSRecursiveLock *)objc_opt_new();
    lock = self->_lock;
    self->_lock = v17;

    objc_storeStrong((id *)&self->_timerManager, a5);
    self->_double lastForwardedMessageTimeInterval = 0.0;
    uint64_t v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  [(RTTimer *)self->_backingObjectExpirationTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RTTransientObject;
  [(RTTransientObject *)&v3 dealloc];
}

- (void)touch
{
  id v2 = [(RTTransientObject *)self backingObject];
}

- (void)__invalidateBackingObject
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E016D870](self, a2);
  [(NSRecursiveLock *)self->_lock lock];
  double v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id backingObject = self->_backingObject;
    int v8 = 138412290;
    id v9 = backingObject;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "releasing transient object, %@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = self->_backingObject;
  self->_id backingObject = 0;

  self->_double lastForwardedMessageTimeInterval = 0.0;
  [(RTTimer *)self->_backingObjectExpirationTimer invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientObjectDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained transientObjectDidReleaseBackingObject:self];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (RTTransientObjectProtocol)transientObjectDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientObjectDelegate);

  return (RTTransientObjectProtocol *)WeakRetained;
}

- (void)setTransientObjectDelegate:(id)a3
{
}

- (id)backingObjectCreationBlock
{
  return self->_backingObjectCreationBlock;
}

- (void)setBackingObjectCreationBlock:(id)a3
{
}

- (void)setBackingObject:(id)a3
{
}

- (double)backingObjectExpirationTimeInterval
{
  return self->_backingObjectExpirationTimeInterval;
}

- (void)setBackingObjectExpirationTimeInterval:(double)a3
{
  self->_backingObjectExpirationTimeInterval = a3;
}

- (RTTimer)backingObjectExpirationTimer
{
  return self->_backingObjectExpirationTimer;
}

- (void)setBackingObjectExpirationTimer:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (double)lastForwardedMessageTimeInterval
{
  return self->_lastForwardedMessageTimeInterval;
}

- (void)setLastForwardedMessageTimeInterval:(double)a3
{
  self->_double lastForwardedMessageTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_backingObjectExpirationTimer, 0);
  objc_storeStrong(&self->_backingObject, 0);
  objc_storeStrong(&self->_backingObjectCreationBlock, 0);

  objc_destroyWeak((id *)&self->_transientObjectDelegate);
}

@end