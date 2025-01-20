@interface SBHAnalyticsEventsController
- (NSHashTable)allProviders;
- (NSString)eventsControllerDomain;
- (SBHAnalyticsEventsController)initWithEventsControllerDomain:(id)a3;
- (void)addProvider:(id)a3;
- (void)dealloc;
- (void)removeProvider:(id)a3;
- (void)sendEventsForProvidersWhenSignificantTimeChanged;
- (void)setAllProviders:(id)a3;
@end

@implementation SBHAnalyticsEventsController

- (SBHAnalyticsEventsController)initWithEventsControllerDomain:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHAnalyticsEventsController;
  v6 = [(SBHAnalyticsEventsController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventsControllerDomain, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    allProviders = v7->_allProviders;
    v7->_allProviders = (NSHashTable *)v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_sendEventsForProvidersWhenSignificantTimeChanged name:*MEMORY[0x1E4FB2708] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(SBHAnalyticsEventsController *)self allProviders];
  [v4 removeAllObjects];

  v5.receiver = self;
  v5.super_class = (Class)SBHAnalyticsEventsController;
  [(SBHAnalyticsEventsController *)&v5 dealloc];
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAnalyticsEventsController *)self allProviders];
  [v5 addObject:v4];
}

- (void)removeProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAnalyticsEventsController *)self allProviders];
  [v5 removeObject:v4];
}

- (void)sendEventsForProvidersWhenSignificantTimeChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SBHAnalyticsEventsController_sendEventsForProvidersWhenSignificantTimeChanged__block_invoke;
  block[3] = &unk_1E6AAC810;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__SBHAnalyticsEventsController_sendEventsForProvidersWhenSignificantTimeChanged__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "allProviders", 0);
  v2 = (void *)[v1 copy];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 significantTimeChanged];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSString)eventsControllerDomain
{
  return self->_eventsControllerDomain;
}

- (NSHashTable)allProviders
{
  return self->_allProviders;
}

- (void)setAllProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allProviders, 0);
  objc_storeStrong((id *)&self->_eventsControllerDomain, 0);
}

@end