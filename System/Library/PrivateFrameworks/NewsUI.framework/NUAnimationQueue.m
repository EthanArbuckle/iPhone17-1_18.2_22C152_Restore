@interface NUAnimationQueue
- (BOOL)isRunning;
- (NSMutableArray)queue;
- (NUAnimationQueue)init;
- (void)addAnimation:(id)a3;
- (void)cancel;
- (void)runUntilEmpty;
- (void)setRunning:(BOOL)a3;
@end

@implementation NUAnimationQueue

- (NUAnimationQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUAnimationQueue;
  v2 = [(NUAnimationQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue = v2->_queue;
    v2->_queue = v3;

    v2->_running = 0;
  }
  return v2;
}

- (void)addAnimation:(id)a3
{
  v4 = (void *)MEMORY[0x263F08B88];
  id v5 = a3;
  [v4 isMainThread];
  v7 = [[NUAnimationRunner alloc] initWithRunBlock:v5];

  objc_super v6 = [(NUAnimationQueue *)self queue];
  [v6 addObject:v7];

  if (![(NUAnimationQueue *)self isRunning]) {
    [(NUAnimationQueue *)self runUntilEmpty];
  }
}

- (void)runUntilEmpty
{
  [MEMORY[0x263F08B88] isMainThread];
  v3 = [(NUAnimationQueue *)self queue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(NUAnimationQueue *)self setRunning:1];
    id v5 = [(NUAnimationQueue *)self queue];
    objc_super v6 = objc_msgSend(v5, "fc_popFirstObject");

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__NUAnimationQueue_runUntilEmpty__block_invoke;
    v7[3] = &unk_2645FED68;
    objc_copyWeak(&v8, &location);
    [v6 runWithFinishBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NUAnimationQueue *)self setRunning:0];
  }
}

- (NSMutableArray)queue
{
  return self->_queue;
}

void __33__NUAnimationQueue_runUntilEmpty__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F08B88] isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained runUntilEmpty];
    id WeakRetained = v3;
  }
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)cancel
{
  [MEMORY[0x263F08B88] isMainThread];
  id v3 = [(NUAnimationQueue *)self queue];
  [v3 removeAllObjects];
}

- (void).cxx_destruct
{
}

@end