@interface _DASSignalQueue
- (NSMutableDictionary)signalQueueDictionary;
- (OS_dispatch_queue)executionQueue;
- (_DASSignalQueue)initWithCount:(unint64_t)a3;
- (double)dominant;
- (double)mean;
- (double)percentile:(double)a3;
- (double)rate;
- (double)trend;
- (id)allObjects;
- (id)top;
- (os_unfair_lock_s)queueLock;
- (unint64_t)count;
- (unint64_t)limit;
- (void)addObject:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQueueLock:(os_unfair_lock_s)a3;
- (void)setSignalQueueDictionary:(id)a3;
@end

@implementation _DASSignalQueue

- (unint64_t)count
{
  v2 = [(NSMutableDictionary *)self->_signalQueueDictionary allValues];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (double)mean
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = [(NSMutableDictionary *)self->_signalQueueDictionary allValues];
  if ([v4 count]
    && ([v4 firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      double v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) doubleValue:v16];
          double v11 = v11 + v13;
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v14 = v11 / (double)(unint64_t)[v7 count];
    os_unfair_lock_unlock(p_queueLock);
  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
    double v14 = 0.0;
  }

  return v14;
}

- (void)addObject:(id)a3
{
  p_queueLock = &self->_queueLock;
  id v5 = a3;
  os_unfair_lock_lock(p_queueLock);
  v6 = [(NSMutableDictionary *)self->_signalQueueDictionary allValues];
  id v7 = [v6 count];
  unint64_t limit = self->_limit;

  if ((unint64_t)v7 >= limit)
  {
    id v9 = [(NSMutableDictionary *)self->_signalQueueDictionary allKeys];
    uint64_t v10 = [v9 sortedArrayUsingSelector:"compare:"];
    double v11 = [v10 firstObject];

    [(NSMutableDictionary *)self->_signalQueueDictionary removeObjectForKey:v11];
  }
  signalQueueDictionary = self->_signalQueueDictionary;
  double v13 = +[NSDate date];
  [(NSMutableDictionary *)signalQueueDictionary setObject:v5 forKeyedSubscript:v13];

  os_unfair_lock_unlock(p_queueLock);
}

- (double)rate
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = [(NSMutableDictionary *)self->_signalQueueDictionary allKeys];
  if ([v4 count])
  {
    id v5 = [v4 sortedArrayUsingSelector:"compare:"];

    v6 = [v5 firstObject];
    id v7 = [(NSMutableDictionary *)self->_signalQueueDictionary objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(NSMutableDictionary *)self->_signalQueueDictionary objectForKeyedSubscript:v6];
      [v8 doubleValue];
      double v10 = v9;

      double v11 = [v5 lastObject];
      v12 = [(NSMutableDictionary *)self->_signalQueueDictionary objectForKeyedSubscript:v11];
      [v12 doubleValue];
      double v14 = v13;

      os_unfair_lock_unlock(p_queueLock);
      v15 = os_log_create("com.apple.clas", "signals");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [v11 timeIntervalSinceDate:v6];
        int v20 = 134218496;
        double v21 = v10;
        __int16 v22 = 2048;
        double v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "First %lf, Last %lf, timeInterval %lf", (uint8_t *)&v20, 0x20u);
      }

      [v11 timeIntervalSinceDate:v6];
      double v18 = (v14 - v10) / v17;
    }
    else
    {
      os_unfair_lock_unlock(p_queueLock);
      double v18 = 0.0;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
    double v18 = 0.0;
    id v5 = v4;
  }

  return v18;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (_DASSignalQueue)initWithCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_DASSignalQueue;
  v4 = [(_DASSignalQueue *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:a3];
    signalQueueDictionary = v4->_signalQueueDictionary;
    v4->_signalQueueDictionary = (NSMutableDictionary *)v5;

    v4->_unint64_t limit = a3;
    v4->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)allObjects
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = [(NSMutableDictionary *)self->_signalQueueDictionary allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:"compare:"];

  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DE54;
  v10[3] = &unk_100175A48;
  v10[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  os_unfair_lock_unlock(p_queueLock);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)top
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = [(NSMutableDictionary *)self->_signalQueueDictionary allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:"compare:"];

  id v6 = [v5 lastObject];
  os_unfair_lock_unlock(p_queueLock);
  id v7 = [(NSMutableDictionary *)self->_signalQueueDictionary objectForKeyedSubscript:v6];

  return v7;
}

- (double)trend
{
  return 0.0;
}

- (double)dominant
{
  return 0.0;
}

- (double)percentile:(double)a3
{
  return 0.0;
}

- (void)setLimit:(unint64_t)a3
{
  self->_unint64_t limit = a3;
}

- (NSMutableDictionary)signalQueueDictionary
{
  return self->_signalQueueDictionary;
}

- (void)setSignalQueueDictionary:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (void)setQueueLock:(os_unfair_lock_s)a3
{
  self->_queueLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);

  objc_storeStrong((id *)&self->_signalQueueDictionary, 0);
}

@end