@interface GCDTimer
+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5;
+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6;
- (BOOL)isRepeating;
- (GCDTimer)initWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6;
- (NSDate)fireDate;
- (id)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation GCDTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (void)dealloc
{
  [(GCDTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GCDTimer;
  [(GCDTimer *)&v3 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v5 = self->_source;
    self->_source = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  v11 = [[GCDTimer alloc] initWithTimeInterval:v10 queue:v6 repeating:v9 block:a3];

  dispatch_resume((dispatch_object_t)v11->_source);

  return v11;
}

- (GCDTimer)initWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GCDTimer;
  v12 = [(GCDTimer *)&v26 init];
  v13 = v12;
  if (v12)
  {
    v12->_repeating = v7;
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);
    source = v13->_source;
    v13->_source = (OS_dispatch_source *)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    fireDate = v13->_fireDate;
    v13->_fireDate = (NSDate *)v16;

    dispatch_time_t v18 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    if (v7) {
      uint64_t v19 = (unint64_t)(a3 * 1000000000.0);
    }
    else {
      uint64_t v19 = -1;
    }
    dispatch_source_set_timer((dispatch_source_t)v13->_source, v18, v19, 0);
    objc_initWeak(&location, v13);
    v20 = v13->_source;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000BA34;
    v22[3] = &unk_101318138;
    objc_copyWeak(v24, &location);
    v24[1] = *(id *)&a3;
    id v23 = v11;
    dispatch_source_set_event_handler(v20, v22);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (BOOL)isRepeating
{
  return self->_repeating;
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return [a1 scheduledTimerWithTimeInterval:a4 queue:0 repeating:a5 block:a3];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)GCDTimer;
  objc_super v3 = [(GCDTimer *)&v8 description];
  if ([(GCDTimer *)self isRepeating]) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  v5 = [(GCDTimer *)self fireDate];
  BOOL v6 = +[NSString stringWithFormat:@"%@ <repeating: %s, next fire: %@>", v3, v4, v5];

  return v6;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

@end