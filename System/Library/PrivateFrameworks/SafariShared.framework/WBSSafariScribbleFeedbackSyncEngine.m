@interface WBSSafariScribbleFeedbackSyncEngine
- (WBSSafariScribbleFeedbackSyncEngine)init;
- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4;
@end

@implementation WBSSafariScribbleFeedbackSyncEngine

- (WBSSafariScribbleFeedbackSyncEngine)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSSafariScribbleFeedbackSyncEngine;
  v2 = [(WBSSafariScribbleFeedbackSyncEngine *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WBSSafariScribbleFeedbackSyncEngine.internalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__WBSSafariScribbleFeedbackSyncEngine_syncScribbleFeedbackUp_withCompletion___block_invoke;
  v11[3] = &unk_1E5C8C9F8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, v11);
}

void __77__WBSSafariScribbleFeedbackSyncEngine_syncScribbleFeedbackUp_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 syncScribbleFeedbackUp:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end