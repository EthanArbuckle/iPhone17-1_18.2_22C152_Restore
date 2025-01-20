@interface SiriSharedUIReplayUtilityWrapper
+ (id)sharedInstance;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)shouldSkipAutoDismissal;
- (void)addReplayControlTo:(id)a3;
- (void)receivedCommand:(id)a3;
- (void)registerReplayCallback:(id)a3;
- (void)speechRecognized:(id)a3;
@end

@implementation SiriSharedUIReplayUtilityWrapper

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SiriSharedUIReplayUtilityWrapper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __50__SiriSharedUIReplayUtilityWrapper_sharedInstance__block_invoke(uint64_t a1)
{
  if (AFIsInternalInstall() && _os_feature_enabled_impl()) {
    id v2 = objc_alloc_init(*(Class *)(a1 + 32));
  }
  else {
    id v2 = 0;
  }
  uint64_t v3 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v2;
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)receivedCommand:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriSharedUIReplayUtility shared];
  [v4 receivedWithCommand:v3];
}

- (void)registerReplayCallback:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriSharedUIReplayUtility shared];
  [v4 registerWithReplayCallback:v3];
}

- (void)speechRecognized:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriSharedUIReplayUtility shared];
  [v4 speechRecognized:v3];
}

- (void)addReplayControlTo:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriSharedUIReplayUtility shared];
  [v4 addReplayControlTo:v3];
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = +[SiriSharedUIReplayUtility shared];
  char v6 = objc_msgSend(v5, "hasContentAt:", x, y);

  return v6;
}

- (BOOL)shouldSkipAutoDismissal
{
  id v2 = +[SiriSharedUIReplayUtility shared];
  char v3 = [v2 shouldSkipAutoDismissal];

  return v3;
}

@end