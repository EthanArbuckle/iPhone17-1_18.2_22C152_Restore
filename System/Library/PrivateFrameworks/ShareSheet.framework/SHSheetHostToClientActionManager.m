@interface SHSheetHostToClientActionManager
+ (SHSheetHostToClientActionManager)shared;
+ (void)receivedAction:(id)a3 forWindowScene:(id)a4;
+ (void)registerHandler:(id)a3 forHostedWindowScene:(id)a4;
+ (void)unregisterHandlerForHostedWindowScene:(id)a3;
- (NSMutableDictionary)sceneProvidersToHandlers;
- (SHSheetHostToClientActionManager)init;
- (id)_handlerForHostingController:(id)a3;
@end

@implementation SHSheetHostToClientActionManager

- (SHSheetHostToClientActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHSheetHostToClientActionManager;
  v2 = [(SHSheetHostToClientActionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneProvidersToHandlers = v2->_sceneProvidersToHandlers;
    v2->_sceneProvidersToHandlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (SHSheetHostToClientActionManager)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)shared_sharedHandler;
  return (SHSheetHostToClientActionManager *)v2;
}

uint64_t __42__SHSheetHostToClientActionManager_shared__block_invoke()
{
  shared_sharedHandler = objc_alloc_init(SHSheetHostToClientActionManager);
  return MEMORY[0x1F41817F8]();
}

+ (void)registerHandler:(id)a3 forHostedWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v11 = +[SHSheetHostToClientActionManager shared];
  v7 = [v11 sceneProvidersToHandlers];
  [v7 objectForKeyedSubscript:v5];

  v8 = (void *)[v6 copy];
  v9 = (void *)MEMORY[0x1A6229A90](v8);
  v10 = [v11 sceneProvidersToHandlers];
  [v10 setObject:v9 forKeyedSubscript:v5];
}

+ (void)unregisterHandlerForHostedWindowScene:(id)a3
{
  id v3 = a3;
  id v5 = +[SHSheetHostToClientActionManager shared];
  v4 = [v5 sceneProvidersToHandlers];
  [v4 removeObjectForKey:v3];
}

+ (void)receivedAction:(id)a3 forWindowScene:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = +[SHSheetHostToClientActionManager shared];
  v7 = [v6 _handlerForHostingController:v5];

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (id)_handlerForHostingController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(SHSheetHostToClientActionManager *)self sceneProvidersToHandlers];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 hostedWindowScene];

        if (v12 == v4)
        {
          v14 = [(SHSheetHostToClientActionManager *)self sceneProvidersToHandlers];
          v13 = [v14 objectForKeyedSubscript:v11];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSMutableDictionary)sceneProvidersToHandlers
{
  return self->_sceneProvidersToHandlers;
}

- (void).cxx_destruct
{
}

@end