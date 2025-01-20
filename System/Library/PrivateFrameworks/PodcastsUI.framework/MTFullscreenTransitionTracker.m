@interface MTFullscreenTransitionTracker
+ (BOOL)isTransitioning;
+ (void)performAfterTransitioning:(id)a3;
- (BOOL)isTransitioning;
- (MTFullscreenTransitionTracker)init;
- (NSMutableArray)pendingBlocks;
- (void)didFinishTransition:(id)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setPendingBlocks:(id)a3;
- (void)willBeginTransition:(id)a3;
@end

@implementation MTFullscreenTransitionTracker

- (MTFullscreenTransitionTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTFullscreenTransitionTracker;
  v2 = [(MTFullscreenTransitionTracker *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [(MTFullscreenTransitionTracker *)v2 setPendingBlocks:v3];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_willBeginTransition_ name:@"NSWindowWillEnterFullScreenNotification" object:0];
    [v4 addObserver:v2 selector:sel_didFinishTransition_ name:@"NSWindowDidEnterFullScreenNotification" object:0];
    [v4 addObserver:v2 selector:sel_willBeginTransition_ name:@"NSWindowWillExitFullScreenNotification" object:0];
    [v4 addObserver:v2 selector:sel_didFinishTransition_ name:@"NSWindowDidExitFullScreenNotification" object:0];
  }
  return v2;
}

+ (BOOL)isTransitioning
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MTFullscreenTransitionTracker_isTransitioning__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isTransitioning_onceToken != -1) {
    dispatch_once(&isTransitioning_onceToken, block);
  }
  return [(id)tracker isTransitioning];
}

uint64_t __48__MTFullscreenTransitionTracker_isTransitioning__block_invoke(uint64_t a1)
{
  tracker = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

+ (void)performAfterTransitioning:(id)a3
{
  if (a3)
  {
    v3 = (void *)tracker;
    id v4 = a3;
    id v6 = [v3 pendingBlocks];
    v5 = _Block_copy(v4);

    [v6 addObject:v5];
  }
}

- (void)willBeginTransition:(id)a3
{
}

- (void)didFinishTransition:(id)a3
{
  [(id)tracker setIsTransitioning:0];
  id v4 = (id)[(NSMutableArray *)self->_pendingBlocks copy];
  [(NSMutableArray *)self->_pendingBlocks removeAllObjects];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_2];
}

uint64_t __53__MTFullscreenTransitionTracker_didFinishTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end