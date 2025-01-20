@interface WFSilentModeSettingsClient
+ (BOOL)canRunIntent;
+ (id)publisher;
+ (id)reversalArbiter;
+ (id)reversePublisher;
+ (void)createClientWithCompletionHandler:(id)a3;
+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3;
+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFSilentModeSettingsClient

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (+[WFSilentModeSettingsClient canRunIntent])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB4548]);
    [v7 setSilentMode:v4 reason:@"Shortcuts settings client asked for it" client:2];
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFSettingsClientErrorDomain" code:4 userInfo:0];
    id v7 = (id)v6;
  }
  v5[2](v5, v6);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  if (+[WFSilentModeSettingsClient canRunIntent])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB4548]);
    v3[2](v3, [v4 silentModeActive], 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFSettingsClientErrorDomain" code:4 userInfo:0];
    ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v4);
  }
}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 reversalArbiter];
  v9 = [v7 biomeBookmark];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__WFSilentModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_1E654C638;
  id v12 = v6;
  id v10 = v6;
  [v8 getReversalStateWithBookmark:v9 completionHandler:v11];
}

void __77__WFSilentModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 starting];
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v6, 0);
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 reversalArbiter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WFSilentModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E654C610;
  id v8 = v4;
  id v6 = v4;
  [v5 getBookmarkForCurrentStateWithCompletionHandler:v7];
}

void __78__WFSilentModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = [[WFSettingsClientBookmark alloc] initWithBiomeBookmark:v5];
    (*(void (**)(uint64_t, WFSettingsClientBookmark *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

+ (id)reversalArbiter
{
  uint64_t v3 = [WFSettingsClientBiomeReversalArbiter alloc];
  id v4 = [a1 publisher];
  id v5 = [a1 reversePublisher];
  uint64_t v6 = [(WFSettingsClientBiomeReversalArbiter *)v3 initWithPublisher:v4 reversePublisher:v5];

  return v6;
}

+ (id)reversePublisher
{
  v2 = BiomeLibrary();
  uint64_t v3 = [v2 Device];
  id v4 = [v3 SilentMode];
  id v5 = +[WFSettingsClientBiomeReversalArbiter reversePublisherOptions];
  uint64_t v6 = [v4 publisherWithOptions:v5];

  return v6;
}

+ (id)publisher
{
  v2 = BiomeLibrary();
  uint64_t v3 = [v2 Device];
  id v4 = [v3 SilentMode];
  id v5 = [v4 publisher];

  return v5;
}

+ (BOOL)canRunIntent
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v3 = [v2 hasCapability:*MEMORY[0x1E4FB4C78]];

  return v3;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  char v3 = (void (**)(id, id, void))a3;
  if (+[WFSilentModeSettingsClient canRunIntent])
  {
    id v4 = (id)objc_opt_new();
    v3[2](v3, v4, 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFSettingsClientErrorDomain" code:4 userInfo:0];
    ((void (**)(id, id, id))v3)[2](v3, 0, v4);
  }
}

@end