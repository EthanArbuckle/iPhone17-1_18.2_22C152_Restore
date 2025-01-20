@interface _UIScrollViewGestureSimulator
+ (id)sharedInstance;
- (_UIScrollViewGestureSimulator)init;
- (void)_setHasSimulatedGestures:(id)a3;
- (void)_signalMainThreadIfNecessary;
- (void)_threadMain;
- (void)_update;
- (void)dealloc;
- (void)simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6;
@end

@implementation _UIScrollViewGestureSimulator

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___UIScrollViewGestureSimulator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB264F90 != -1) {
    dispatch_once(&qword_1EB264F90, block);
  }
  v2 = (void *)qword_1EB264F88;
  return v2;
}

- (_UIScrollViewGestureSimulator)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIScrollViewGestureSimulator;
  v2 = [(_UIScrollViewGestureSimulator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v8.version = 0;
    memset(&v8.retain, 0, 56);
    v8.info = v2;
    v8.perform = (void (__cdecl *)(void *))_updateSimulation;
    v2->_mainThreadRunLoopSource = CFRunLoopSourceCreate(0, -1, &v8);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3->_mainThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v3->_mainThreadRunLoopSource);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    simulatedGestures = v3->_simulatedGestures;
    v3->_simulatedGestures = v5;
  }
  return v3;
}

- (void)dealloc
{
  CFRunLoopSourceInvalidate(self->_mainThreadRunLoopSource);
  self->_mainThreadRunLoopSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewGestureSimulator;
  [(_UIScrollViewGestureSimulator *)&v3 dealloc];
}

- (void)simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v15 = [[_UIScrollViewSimulatedGesture alloc] initWithDuration:v12 begin:v11 update:v10 end:a3];

  [(NSMutableArray *)self->_simulatedGestures addObject:v15];
  if (self->_workThread)
  {
    if ([(NSMutableArray *)self->_simulatedGestures count] == 1) {
      [(_UIScrollViewGestureSimulator *)self performSelector:sel__setHasSimulatedGestures_ onThread:self->_workThread withObject:MEMORY[0x1E4F1CC38] waitUntilDone:0];
    }
  }
  else
  {
    self->_hasSimulatedGestures = 1;
    v13 = (NSThread *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__threadMain object:0];
    workThread = self->_workThread;
    self->_workThread = v13;

    [(NSThread *)self->_workThread setQualityOfService:33];
    [(NSThread *)self->_workThread setName:@"com.apple.uikit.simulated-scrollview-gesture-thread"];
    [(NSThread *)self->_workThread start];
  }
}

- (void)_threadMain
{
  objc_super v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  if (qword_1EB264FA8 != -1) {
    dispatch_once(&qword_1EB264FA8, &__block_literal_global_188_2);
  }
  if (_MergedGlobals_1320)
  {
    v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkDidFire_];
    displayLink = self->_displayLink;
    self->_displayLink = v4;

    [(CADisplayLink *)self->_displayLink maximumRefreshRate];
    if ((uint64_t)llround(1.0 / v6) >= 61)
    {
      v7 = self->_displayLink;
      [(CADisplayLink *)v7 maximumRefreshRate];
      if (v8 != 0.0) {
        [(CADisplayLink *)v7 setPreferredFramesPerSecond:llround(1.0 / v8)];
      }
    }
    [(CADisplayLink *)self->_displayLink addToRunLoop:v3 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CB00]);
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44___UIScrollViewGestureSimulator__threadMain__block_invoke;
    v19[3] = &unk_1E52EC0A8;
    v19[4] = self;
    id v11 = (NSTimer *)[v9 initWithFireDate:v10 interval:1 repeats:v19 block:0.0166666667];
    timer = self->_timer;
    self->_timer = v11;

    [v3 addTimer:self->_timer forMode:*MEMORY[0x1E4F1C4B0]];
  }
  self->_lastWakeUpTime = CACurrentMediaTime();
  do
  {
    do
    {
      v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.5];
      [v3 runUntilDate:v13];
    }
    while (self->_hasSimulatedGestures);
  }
  while (CACurrentMediaTime() - self->_lastWakeUpTime < 5.0);
  v14 = self->_displayLink;
  if (v14)
  {
    [(CADisplayLink *)v14 invalidate];
    v15 = self->_displayLink;
    self->_displayLink = 0;
  }
  v16 = self->_timer;
  if (v16)
  {
    [(NSTimer *)v16 invalidate];
    v17 = self->_timer;
    self->_timer = 0;
  }
  workThread = self->_workThread;
  self->_workThread = 0;
}

- (void)_signalMainThreadIfNecessary
{
  if (self->_hasSimulatedGestures)
  {
    CFRunLoopSourceSignal(self->_mainThreadRunLoopSource);
    Main = CFRunLoopGetMain();
    CFRunLoopWakeUp(Main);
    self->_lastWakeUpTime = CACurrentMediaTime();
  }
}

- (void)_setHasSimulatedGestures:(id)a3
{
  self->_hasSimulatedGestures = [a3 BOOLValue];
}

- (void)_update
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_simulatedGestures count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v3 = (void *)[(NSMutableArray *)self->_simulatedGestures copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v8 updateSimulation]) {
            [(NSMutableArray *)self->_simulatedGestures removeObjectIdenticalTo:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    if (self->_workThread)
    {
      if (![(NSMutableArray *)self->_simulatedGestures count]) {
        [(_UIScrollViewGestureSimulator *)self performSelector:sel__setHasSimulatedGestures_ onThread:self->_workThread withObject:MEMORY[0x1E4F1CC28] waitUntilDone:0];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_workThread, 0);
  objc_storeStrong((id *)&self->_simulatedGestures, 0);
}

@end