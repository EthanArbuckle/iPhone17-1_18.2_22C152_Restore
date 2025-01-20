@interface APAccumulator
+ (BOOL)supportsSecureCoding;
+ (id)_accumulationReasonToString:(int64_t)a3;
- (APAccumulator)initWithAccumulationTime:(unint64_t)a3 inactivityTime:(unint64_t)a4 itemLimit:(unint64_t)a5;
- (APAccumulator)initWithCoder:(id)a3;
- (APUnfairLock)lock;
- (NSArray)accumulatedItems;
- (NSMutableArray)items;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)dispatchSourceAccumulation;
- (OS_dispatch_source)dispatchSourceInactivity;
- (double)startTime;
- (id)accumulationHandler;
- (id)userData;
- (unint64_t)accumulationTime;
- (unint64_t)inactivityTime;
- (unint64_t)itemLimit;
- (void)_accumulationEventHandler;
- (void)_callAccumulationHandlerWithReason:(int64_t)a3;
- (void)_inactivityEventHandler;
- (void)_startAccumulationSource;
- (void)_startInactivitySource;
- (void)_stopAccumulationSource;
- (void)_stopInactivitySource;
- (void)accumulate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccumulationHandler:(id)a3;
- (void)setAccumulationTime:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatchSourceAccumulation:(id)a3;
- (void)setDispatchSourceInactivity:(id)a3;
- (void)setInactivityTime:(unint64_t)a3;
- (void)setItemLimit:(unint64_t)a3;
- (void)setItems:(id)a3;
- (void)setLock:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setUserData:(id)a3;
@end

@implementation APAccumulator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APAccumulator)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"accumulationTime"];
  id v6 = [v5 unsignedIntegerValue];
  v7 = [v4 decodeObjectForKey:@"inactivityTime"];
  id v8 = [v7 unsignedIntegerValue];
  v9 = [v4 decodeObjectForKey:@"itemLimit"];

  v10 = -[APAccumulator initWithAccumulationTime:inactivityTime:itemLimit:](self, "initWithAccumulationTime:inactivityTime:itemLimit:", v6, v8, [v9 unsignedIntegerValue]);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:[(APAccumulator *)self accumulationTime]];
  [v4 encodeObject:v5 forKey:@"accumulationTime"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(APAccumulator *)self inactivityTime]];
  [v4 encodeObject:v6 forKey:@"inactivityTime"];

  id v7 = +[NSNumber numberWithUnsignedInteger:[(APAccumulator *)self itemLimit]];
  [v4 encodeObject:v7 forKey:@"itemLimit"];
}

- (APAccumulator)initWithAccumulationTime:(unint64_t)a3 inactivityTime:(unint64_t)a4 itemLimit:(unint64_t)a5
{
  v17.receiver = self;
  v17.super_class = (Class)APAccumulator;
  id v8 = [(APAccumulator *)&v17 init];
  if (v8)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218752;
      v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2048;
      unint64_t v25 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%p: creating accumulator with time %lu, inactivity %lu, itemLimit %lu", buf, 0x2Au);
    }

    v8->_accumulationTime = a3;
    v8->_inactivityTime = a4;
    v8->_itemLimit = a5;
    uint64_t v10 = +[NSMutableArray arrayWithCapacity:a5];
    items = v8->_items;
    v8->_items = (NSMutableArray *)v10;

    v12 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v8->_lock;
    v8->_lock = v12;

    dispatch_queue_t v14 = dispatch_queue_create("apaccumulator_queue", 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v14;
  }
  return v8;
}

- (void)accumulate:(id)a3
{
  id v4 = a3;
  v5 = [(APAccumulator *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008B2B8;
  v7[3] = &unk_100234D88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSArray)accumulatedItems
{
  v3 = [(APAccumulator *)self lock];
  [v3 lock];

  id v4 = [(APAccumulator *)self items];
  id v5 = [v4 copy];

  id v6 = [(APAccumulator *)self lock];
  [v6 unlock];

  return (NSArray *)v5;
}

+ (id)_accumulationReasonToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Invalid reason";
  }
  else {
    return *(&off_100234DA8 + a3 - 1);
  }
}

- (void)_stopAccumulationSource
{
  v3 = [(APAccumulator *)self dispatchSourceAccumulation];

  if (v3)
  {
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: stopping accumulation timer.", (uint8_t *)&v7, 0xCu);
    }

    id v5 = [(APAccumulator *)self dispatchSourceAccumulation];
    dispatch_source_cancel(v5);

    dispatchSourceAccumulation = self->_dispatchSourceAccumulation;
    self->_dispatchSourceAccumulation = 0;
  }
}

- (void)_startAccumulationSource
{
  if ([(APAccumulator *)self accumulationTime])
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000 * [(APAccumulator *)self accumulationTime]);
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = [(APAccumulator *)self accumulationTime];
      __int16 v15 = 2048;
      dispatch_time_t v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: starting accumulation timer for %lu mS (%llu nS).", buf, 0x20u);
    }

    id v5 = [(APAccumulator *)self dispatchQueue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v5);
    [(APAccumulator *)self setDispatchSourceAccumulation:v6];

    int v7 = [(APAccumulator *)self dispatchSourceAccumulation];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008B888;
    handler[3] = &unk_100233D50;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    id v8 = [(APAccumulator *)self dispatchSourceAccumulation];
    dispatch_source_set_timer(v8, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v9 = [(APAccumulator *)self dispatchSourceAccumulation];
    dispatch_resume(v9);

    [(APAccumulator *)self setStartTime:CFAbsoluteTimeGetCurrent()];
  }
}

- (void)_stopInactivitySource
{
  dispatch_time_t v3 = [(APAccumulator *)self dispatchSourceInactivity];

  if (v3)
  {
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: stopping inactivity timer.", (uint8_t *)&v6, 0xCu);
    }

    id v5 = [(APAccumulator *)self dispatchSourceInactivity];
    dispatch_source_cancel(v5);

    [(APAccumulator *)self setDispatchSourceInactivity:0];
  }
}

- (void)_startInactivitySource
{
  if ([(APAccumulator *)self inactivityTime])
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000 * [(APAccumulator *)self inactivityTime]);
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = [(APAccumulator *)self inactivityTime];
      __int16 v15 = 2048;
      dispatch_time_t v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: starting inactivity timer for %lu mS (%llu nS).", buf, 0x20u);
    }

    id v5 = [(APAccumulator *)self dispatchQueue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v5);
    [(APAccumulator *)self setDispatchSourceInactivity:v6];

    int v7 = [(APAccumulator *)self dispatchSourceInactivity];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008BB44;
    handler[3] = &unk_100233D50;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    id v8 = [(APAccumulator *)self dispatchSourceInactivity];
    dispatch_source_set_timer(v8, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v9 = [(APAccumulator *)self dispatchSourceInactivity];
    dispatch_resume(v9);
  }
}

- (void)_callAccumulationHandlerWithReason:(int64_t)a3
{
  id v5 = [(APAccumulator *)self items];
  id v6 = [v5 copy];

  int v7 = [(APAccumulator *)self items];
  [v7 removeAllObjects];

  id v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(APAccumulator *)self startTime];
    double v11 = (Current - v10) * 1000.0;
    v12 = +[APAccumulator _accumulationReasonToString:a3];
    int v16 = 134218242;
    double v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Calling accumulation handler after %.0f mS with reason \"%{public}@\"", (uint8_t *)&v16, 0x16u);
  }
  __int16 v13 = [(APAccumulator *)self accumulationHandler];

  if (v13)
  {
    unint64_t v14 = [(APAccumulator *)self accumulationHandler];
    ((void (**)(void, id, int64_t))v14)[2](v14, v6, a3);
  }
  [(APAccumulator *)self setStartTime:0.0];
  __int16 v15 = APLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    double v17 = *(double *)&self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p: emptying accumulated items.", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_inactivityEventHandler
{
  dispatch_time_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(APAccumulator *)self accumulatedItems];
    int v5 = 134218240;
    id v6 = self;
    __int16 v7 = 2048;
    id v8 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%p: Calling inactivity event handler with %ld items.", (uint8_t *)&v5, 0x16u);
  }
  [(APAccumulator *)self _stopAccumulationSource];
  [(APAccumulator *)self _callAccumulationHandlerWithReason:3];
  [(APAccumulator *)self _stopInactivitySource];
}

- (void)_accumulationEventHandler
{
  dispatch_time_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(APAccumulator *)self accumulatedItems];
    int v5 = 134218240;
    id v6 = self;
    __int16 v7 = 2048;
    id v8 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%p: Calling accumulation handler with %ld items.", (uint8_t *)&v5, 0x16u);
  }
  [(APAccumulator *)self _stopInactivitySource];
  [(APAccumulator *)self _callAccumulationHandlerWithReason:2];
  [(APAccumulator *)self _stopAccumulationSource];
}

- (id)accumulationHandler
{
  return self->_accumulationHandler;
}

- (void)setAccumulationHandler:(id)a3
{
}

- (id)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (unint64_t)accumulationTime
{
  return self->_accumulationTime;
}

- (void)setAccumulationTime:(unint64_t)a3
{
  self->_accumulationTime = a3;
}

- (OS_dispatch_source)dispatchSourceInactivity
{
  return self->_dispatchSourceInactivity;
}

- (void)setDispatchSourceInactivity:(id)a3
{
}

- (OS_dispatch_source)dispatchSourceAccumulation
{
  return self->_dispatchSourceAccumulation;
}

- (void)setDispatchSourceAccumulation:(id)a3
{
}

- (unint64_t)inactivityTime
{
  return self->_inactivityTime;
}

- (void)setInactivityTime:(unint64_t)a3
{
  self->_inactivityTime = a3;
}

- (unint64_t)itemLimit
{
  return self->_itemLimit;
}

- (void)setItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dispatchSourceAccumulation, 0);
  objc_storeStrong((id *)&self->_dispatchSourceInactivity, 0);
  objc_storeStrong(&self->_userData, 0);

  objc_storeStrong(&self->_accumulationHandler, 0);
}

@end