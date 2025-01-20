@interface _UIOpenURLApplicationBSActionHandler
- (id)_respondToApplicationActions:(id)a3 fromTransitionContext:(id)a4;
@end

@implementation _UIOpenURLApplicationBSActionHandler

- (id)_respondToApplicationActions:(id)a3 fromTransitionContext:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v18 = v5;
  v7 = [v5 objectsPassingTest:&__block_literal_global_680];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v12 url];
        if ([(id)UIApp _shouldHandleTestURL:v13])
        {
          [(id)UIApp handleTestURL:v13];
        }
        else
        {
          objc_msgSend((id)UIApp, "_setHandlingURL:url:", objc_msgSend(v13, "isInternalUIKitURL") ^ 1, v13);
          v14 = [v6 originatingProcess];
          if (!v14)
          {
            v14 = [v12 workspaceOriginatingProcess];
          }
          if ([v6 isUISubclass])
          {
            v15 = [v6 payload];
          }
          else
          {
            v15 = 0;
          }
          [(id)UIApp _applicationOpenURLAction:v12 payload:v15 origin:v14];
          [(id)UIApp _setHandlingURL:0 url:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  v16 = (void *)[v18 mutableCopy];
  [v16 minusSet:v7];

  return v16;
}

@end