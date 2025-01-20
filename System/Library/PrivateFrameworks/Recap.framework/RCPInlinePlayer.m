@interface RCPInlinePlayer
+ (id)sharedInstance;
+ (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)setIgnoresCompletionDelay:(BOOL)a3;
+ (void)setNeedsInitialDelay;
- (BOOL)ignoresCompletionDelay;
- (BOOL)needsInitialDelay;
- (OS_dispatch_queue)replayQueue;
- (RCPInlinePlayer)init;
- (RCPPlayer)underlyingPlayer;
- (void)_callBlock:(id)a3;
- (void)_doInitialDelayIfNeeded;
- (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5;
- (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5;
- (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5;
- (void)prewarmForEventStream:(id)a3 completion:(id)a4;
- (void)setIgnoresCompletionDelay:(BOOL)a3;
- (void)setNeedsInitialDelay:(BOOL)a3;
- (void)setReplayQueue:(id)a3;
- (void)setUnderlyingPlayer:(id)a3;
- (void)tearDown;
@end

@implementation RCPInlinePlayer

void __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) underlyingPlayer];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  [v2 prewarmForEventStream:v3 withError:&v8];
  id v4 = v8;

  if (*(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke_2;
    block[3] = &unk_1E5D770A8;
    id v7 = *(id *)(a1 + 48);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __27__RCPInlinePlayer_tearDown__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) underlyingPlayer];
  [v1 tearDown];
}

- (RCPPlayer)underlyingPlayer
{
  return self->_underlyingPlayer;
}

+ (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[RCPInlinePlayer sharedInstance];
  [v10 prewarmForEventStream:v9 completion:0];

  v11 = +[RCPInlinePlayer sharedInstance];
  [v11 playEventStream:v9 options:v8 completion:v7];

  id v12 = +[RCPInlinePlayer sharedInstance];
  [v12 tearDown];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)instance;
  return v2;
}

- (void)tearDown
{
  uint64_t v3 = [(RCPInlinePlayer *)self replayQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RCPInlinePlayer_tearDown__block_invoke;
  block[3] = &unk_1E5D76FB0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(RCPInlinePlayer *)self _doInitialDelayIfNeeded];
  if (!v9) {
    id v9 = (id)objc_opt_new();
  }
  v11 = [(RCPInlinePlayer *)self replayQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke;
  v15[3] = &unk_1E5D77120;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)prewarmForEventStream:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(RCPInlinePlayer *)self _doInitialDelayIfNeeded];
  id v8 = [(RCPInlinePlayer *)self replayQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke;
  block[3] = &unk_1E5D770D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)replayQueue
{
  return self->_replayQueue;
}

- (void)_doInitialDelayIfNeeded
{
  if (self->_needsInitialDelay)
  {
    uint64_t v3 = [(RCPInlinePlayer *)self replayQueue];
    dispatch_async(v3, &__block_literal_global_9);

    self->_needsInitialDelay = 0;
  }
}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) underlyingPlayer];
  [v2 playEventStream:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48)];

  if (*(void *)(a1 + 56))
  {
    if ([*(id *)(a1 + 32) ignoresCompletionDelay])
    {
      uint64_t v3 = [*(id *)(a1 + 32) replayQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_2;
      block[3] = &unk_1E5D770F8;
      void block[4] = *(void *)(a1 + 32);
      id v4 = &v9;
      id v9 = *(id *)(a1 + 56);
      dispatch_async(v3, block);
    }
    else
    {
      dispatch_time_t v5 = dispatch_time(0, 200000000);
      uint64_t v3 = [*(id *)(a1 + 32) replayQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_3;
      v6[3] = &unk_1E5D770F8;
      v6[4] = *(void *)(a1 + 32);
      id v4 = &v7;
      id v7 = *(id *)(a1 + 56);
      dispatch_after(v5, v3, v6);
    }
  }
}

uint64_t __33__RCPInlinePlayer_sharedInstance__block_invoke()
{
  instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)setNeedsInitialDelay
{
  if (instance)
  {
    [(id)instance setNeedsInitialDelay:1];
    uint64_t v2 = __ignoresCompletionDelay;
    uint64_t v3 = (void *)instance;
    [v3 setIgnoresCompletionDelay:v2];
  }
}

+ (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [a3 componentsSeparatedByString:@" "];
  id v9 = +[RCPSyntheticEventStream eventStreamWithCLIArguments:v8];

  if (v9)
  {
    id v10 = +[RCPInlinePlayer sharedInstance];
    [v10 prewarmForEventStream:v9 completion:0];

    v11 = +[RCPInlinePlayer sharedInstance];
    [v11 playEventStream:v9 options:v13 completion:v7];

    id v12 = +[RCPInlinePlayer sharedInstance];
    [v12 tearDown];
  }
  else
  {
    NSLog(&cfstr_RecapEventStre.isa);
  }
}

+ (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = +[RCPSyntheticEventStream eventStreamWithEventActions:a3];
  id v9 = +[RCPInlinePlayer sharedInstance];
  [v9 prewarmForEventStream:v12 completion:0];

  id v10 = +[RCPInlinePlayer sharedInstance];
  [v10 playEventStream:v12 options:v8 completion:v7];

  v11 = +[RCPInlinePlayer sharedInstance];
  [v11 tearDown];
}

+ (void)setIgnoresCompletionDelay:(BOOL)a3
{
  if (instance) {
    [(id)instance setIgnoresCompletionDelay:a3];
  }
  else {
    __ignoresCompletionDelay = a3;
  }
}

- (RCPInlinePlayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)RCPInlinePlayer;
  uint64_t v2 = [(RCPInlinePlayer *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_needsInitialDelay = 1;
    id v4 = objc_alloc_init(RCPPlayer);
    underlyingPlayer = v3->_underlyingPlayer;
    v3->_underlyingPlayer = v4;

    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.recap.inline-replay", v6);

    [(RCPInlinePlayer *)v3 setReplayQueue:v7];
  }
  return v3;
}

uint64_t __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __42__RCPInlinePlayer__doInitialDelayIfNeeded__block_invoke()
{
  return [MEMORY[0x1E4F29060] sleepForTimeInterval:0.1];
}

- (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  objc_super v9 = [a3 componentsSeparatedByString:@" "];
  id v10 = +[RCPSyntheticEventStream eventStreamWithCLIArguments:v9];

  if (v10) {
    [(RCPInlinePlayer *)self playEventStream:v10 options:v11 completion:v8];
  }
  else {
    NSLog(&cfstr_RecapEventStre.isa);
  }
}

- (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[RCPSyntheticEventStream eventStreamWithEventActions:a3];
  [(RCPInlinePlayer *)self playEventStream:v10 options:v9 completion:v8];
}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)MEMORY[0x1AD0ECCD0](*(void *)(a1 + 40));
  [v1 performSelectorOnMainThread:sel__callBlock_ withObject:v2 waitUntilDone:0];
}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)MEMORY[0x1AD0ECCD0](*(void *)(a1 + 40));
  [v1 performSelectorOnMainThread:sel__callBlock_ withObject:v2 waitUntilDone:0];
}

- (void)_callBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)needsInitialDelay
{
  return self->_needsInitialDelay;
}

- (void)setNeedsInitialDelay:(BOOL)a3
{
  self->_needsInitialDelay = a3;
}

- (BOOL)ignoresCompletionDelay
{
  return self->_ignoresCompletionDelay;
}

- (void)setIgnoresCompletionDelay:(BOOL)a3
{
  self->_ignoresCompletionDelay = a3;
}

- (void)setUnderlyingPlayer:(id)a3
{
}

- (void)setReplayQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_underlyingPlayer, 0);
}

@end