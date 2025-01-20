@interface PXDisplayLink
+ (BOOL)highFramerateRequiresReasonAndRange;
+ (BOOL)supportsSpecificScreen;
- (NSString)runloopModes;
- (OS_dispatch_queue)queue;
- (PXDisplayLink)init;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 queue:(id)a8;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5;
- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6;
- (SEL)selector;
- (UIScreen)screen;
- (double)currentMediaTime;
- (double)duration;
- (double)resolvedDuration;
- (double)targetTimestamp;
- (double)timestamp;
- (id)initInternalWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9;
- (id)target;
- (int64_t)preferredFramesPerSecond;
- (void)invalidate;
@end

@implementation PXDisplayLink

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  uint64_t v10 = *MEMORY[0x263EFF588];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [(PXDisplayLink *)self initWithWeakTarget:v13 selector:a4 deferredStart:0 runloopModes:v10 preferredFramesPerSecond:PXDisplayLinkDefaultPreferredFramesPerSecond() screen:v12 queue:v11];

  return v14;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 queue:(id)a8
{
  return [(PXDisplayLink *)self initWithWeakTarget:a3 selector:a4 deferredStart:a5 runloopModes:a6 preferredFramesPerSecond:a7 screen:0 queue:a8];
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  BOOL v12 = a5;
  id v16 = (id)MEMORY[0x263EF83A0];
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a3;
  if (a9 != v16)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXDisplayLink.m" lineNumber:81 description:@"Only main queue supported"];
  }
  v21 = [[PXCADisplayLink alloc] initWithWeakTarget:v20 selector:a4 deferredStart:v12 runloopModes:v19 preferredFramesPerSecond:a7 screen:v18 queue:v17];

  return &v21->super;
}

- (id)initInternalWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)PXDisplayLink;
  id v18 = [(PXDisplayLink *)&v21 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeWeak(&v18->_target, v14);
    v19->_selector = a4;
    objc_storeStrong((id *)&v19->_queue, a9);
    objc_storeStrong((id *)&v19->_runloopModes, a6);
    v19->_preferredFramesPerSecond = a7;
    objc_storeWeak((id *)&v19->_screen, v16);
  }

  return v19;
}

- (NSString)runloopModes
{
  return self->_runloopModes;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = *MEMORY[0x263EFF588];
  id v9 = a3;
  uint64_t v10 = [(PXDisplayLink *)self initWithWeakTarget:v9 selector:a4 deferredStart:v5 runloopModes:v8 preferredFramesPerSecond:PXDisplayLinkDefaultPreferredFramesPerSecond() queue:MEMORY[0x263EF83A0]];

  return v10;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (SEL)selector
{
  return self->_selector;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7
{
  return [(PXDisplayLink *)self initWithWeakTarget:a3 selector:a4 deferredStart:a5 runloopModes:a6 preferredFramesPerSecond:a7 queue:MEMORY[0x263EF83A0]];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_runloopModes, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak(&self->_target);
}

+ (BOOL)supportsSpecificScreen
{
  return +[PXCADisplayLink supportsSpecificScreen];
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timestamp
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 135, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink timestamp]", v6 object file lineNumber description];

  abort();
}

- (double)targetTimestamp
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 131, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink targetTimestamp]", v6 object file lineNumber description];

  abort();
}

- (double)duration
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 127, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink duration]", v6 object file lineNumber description];

  abort();
}

- (double)resolvedDuration
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 115, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink resolvedDuration]", v6 object file lineNumber description];

  abort();
}

- (double)currentMediaTime
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 111, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink currentMediaTime]", v6 object file lineNumber description];

  abort();
}

- (void)invalidate
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayLink.m", 107, @"Method %s is a responsibility of subclass %@", "-[PXDisplayLink invalidate]", v6 object file lineNumber description];

  abort();
}

- (PXDisplayLink)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayLink.m", 101, @"%s is not available as initializer", "-[PXDisplayLink init]");

  abort();
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5
{
  return [(PXDisplayLink *)self initWithWeakTarget:a3 selector:a4 deferredStart:0 runloopModes:*MEMORY[0x263EFF588] preferredFramesPerSecond:a5 queue:MEMORY[0x263EF83A0]];
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  uint64_t v8 = *MEMORY[0x263EFF588];
  id v9 = a5;
  id v10 = a3;
  id v11 = [(PXDisplayLink *)self initWithWeakTarget:v10 selector:a4 deferredStart:0 runloopModes:v8 preferredFramesPerSecond:PXDisplayLinkDefaultPreferredFramesPerSecond() queue:v9];

  return v11;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return [(PXDisplayLink *)self initWithWeakTarget:a3 selector:a4 queue:MEMORY[0x263EF83A0]];
}

+ (BOOL)highFramerateRequiresReasonAndRange
{
  return +[PXCADisplayLink highFramerateRequiresReasonAndRange];
}

@end