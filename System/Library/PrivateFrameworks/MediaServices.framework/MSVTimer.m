@interface MSVTimer
+ (id)timerWithInterval:(double)a3 block:(id)a4;
+ (id)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5;
+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (MSVTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (MSVTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (void)dealloc;
- (void)invalidate;
@end

@implementation MSVTimer

- (void).cxx_destruct
{
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = (void *)[objc_alloc((Class)a1) initWithInterval:v7 repeats:v11 queue:v10 block:a3];

  return v12;
}

- (void)dealloc
{
  [(MSVTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSVTimer;
  [(MSVTimer *)&v3 dealloc];
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  timerSource = obj->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    objc_super v3 = obj->_timerSource;
    obj->_timerSource = 0;
  }
  objc_sync_exit(obj);
}

- (MSVTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MSVTimer;
  id v12 = [(MSVTimer *)&v24 init];
  if (v12)
  {
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
    v14 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v13;

    double v15 = a3 * 1000000000.0;
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)v15);
    dispatch_source_set_timer(*((dispatch_source_t *)v12 + 1), v16, (unint64_t)v15, 0x989680uLL);
    objc_initWeak(&location, v12);
    v17 = *((void *)v12 + 1);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__MSVTimer_initWithInterval_repeats_queue_block___block_invoke;
    v19[3] = &unk_1E5AD9928;
    id v20 = v11;
    BOOL v22 = a4;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_resume(*((dispatch_object_t *)v12 + 1));
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return (MSVTimer *)v12;
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5
{
  return (id)[a1 timerWithInterval:a4 repeats:MEMORY[0x1E4F14428] queue:a5 block:a3];
}

void __49__MSVTimer_initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained invalidate];
  }
}

- (MSVTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return [(MSVTimer *)self initWithInterval:1 repeats:a4 queue:a5 block:a3];
}

+ (id)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (id)[a1 timerWithInterval:1 repeats:a4 queue:a5 block:a3];
}

+ (id)timerWithInterval:(double)a3 block:(id)a4
{
  return (id)[a1 timerWithInterval:1 repeats:a4 block:a3];
}

@end