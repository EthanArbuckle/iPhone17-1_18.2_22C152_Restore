@interface PXContentSyndicationHighlightCenter
+ (id)shared;
- (BOOL)isAutomaticSharingEnabled;
- (PXContentSyndicationHighlightCenter)init;
- (id)_allObservers;
- (void)_updateValue;
- (void)highlightCenterSettingsEnablementHasChanged:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setIsAutomaticSharingEnabled:(BOOL)a3;
@end

@implementation PXContentSyndicationHighlightCenter

void __45__PXContentSyndicationHighlightCenter_shared__block_invoke()
{
  v0 = objc_alloc_init(PXContentSyndicationHighlightCenter);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;
}

- (PXContentSyndicationHighlightCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXContentSyndicationHighlightCenter;
  v2 = [(PXContentSyndicationHighlightCenter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    [(PXContentSyndicationHighlightCenter *)v2 _updateValue];
    v5 = (SLHighlightCenter *)objc_alloc_init(MEMORY[0x1E4FA5658]);
    socialLayerHighlightCenter = v2->_socialLayerHighlightCenter;
    v2->_socialLayerHighlightCenter = v5;

    [(SLHighlightCenter *)v2->_socialLayerHighlightCenter setDelegate:v2];
  }
  return v2;
}

- (void)setIsAutomaticSharingEnabled:(BOOL)a3
{
  self->_isAutomaticSharingEnabled = a3;
}

- (void)_updateValue
{
  uint64_t v3 = [MEMORY[0x1E4FA5658] isAutomaticSharingEnabled];
  [(PXContentSyndicationHighlightCenter *)self setIsAutomaticSharingEnabled:v3];
}

- (BOOL)isAutomaticSharingEnabled
{
  return self->_isAutomaticSharingEnabled;
}

+ (id)shared
{
  if (shared_onceToken_183717 != -1) {
    dispatch_once(&shared_onceToken_183717, &__block_literal_global_183718);
  }
  v2 = (void *)shared_shared;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialLayerHighlightCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  [(PXContentSyndicationHighlightCenter *)self _updateValue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PXContentSyndicationHighlightCenter_highlightCenterSettingsEnablementHasChanged___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__PXContentSyndicationHighlightCenter_highlightCenterSettingsEnablementHasChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) contentSyndicationHighlightCenterDidChange:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_allObservers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSHashTable *)v2->_observers allObjects];
  objc_sync_exit(v2);

  return v3;
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

@end