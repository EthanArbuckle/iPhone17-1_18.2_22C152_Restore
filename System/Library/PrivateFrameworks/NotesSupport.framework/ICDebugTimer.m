@interface ICDebugTimer
+ (id)debugTimerForClass:(Class)a3;
+ (void)enableTimersForClass:(Class)a3;
- (NSDate)startingDate;
- (double)elapsedTime;
- (void)pause;
- (void)resume;
- (void)setElapsedTime:(double)a3;
- (void)setStartingDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDebugTimer

+ (id)debugTimerForClass:(Class)a3
{
  if ([(id)enabledTimers containsObject:a3]) {
    v3 = objc_alloc_init(ICDebugTimer);
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (void)enableTimersForClass:(Class)a3
{
  if (enableTimersForClass__onceToken != -1) {
    dispatch_once(&enableTimersForClass__onceToken, &__block_literal_global_4);
  }
  v4 = (void *)enabledTimers;
  [v4 addObject:a3];
}

uint64_t __37__ICDebugTimer_enableTimersForClass___block_invoke()
{
  enabledTimers = [MEMORY[0x263EFF9C0] set];
  return MEMORY[0x270F9A758]();
}

- (void)start
{
  [(ICDebugTimer *)self setElapsedTime:0.0];
  id v3 = [MEMORY[0x263EFF910] date];
  [(ICDebugTimer *)self setStartingDate:v3];
}

- (void)pause
{
  id v3 = [(ICDebugTimer *)self startingDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  [(ICDebugTimer *)self elapsedTime];
  [(ICDebugTimer *)self setElapsedTime:v6 - v5];

  [(ICDebugTimer *)self setStartingDate:0];
}

- (void)resume
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(ICDebugTimer *)self setStartingDate:v3];
}

- (void)stop
{
  id v3 = [(ICDebugTimer *)self startingDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  [(ICDebugTimer *)self elapsedTime];
  [(ICDebugTimer *)self setElapsedTime:v6 - v5];

  [(ICDebugTimer *)self setStartingDate:0];
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (NSDate)startingDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartingDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end