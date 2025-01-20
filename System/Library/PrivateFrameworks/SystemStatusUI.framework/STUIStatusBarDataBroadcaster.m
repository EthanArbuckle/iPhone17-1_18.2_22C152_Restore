@interface STUIStatusBarDataBroadcaster
+ (id)sharedInstance;
- (STStatusBarData)currentData;
- (id)_init;
- (void)dealloc;
- (void)registerListener:(id)a3;
- (void)unregisterListener:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation STUIStatusBarDataBroadcaster

- (void)registerListener:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__STUIStatusBarDataBroadcaster_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_43 != -1) {
    dispatch_once(&_MergedGlobals_43, block);
  }
  v2 = (void *)qword_1EC05EF20;
  return v2;
}

- (STStatusBarData)currentData
{
  v3 = self->_broadcastData;
  v4 = [(STStatusBarOverridesStatusDomain *)self->_overridesDomain data];
  v5 = [v4 customOverrides];

  if (v5 && ([v5 isEmpty] & 1) == 0)
  {
    id v6 = [(STStatusBarData *)v3 mutableCopy];
    [v6 applyUpdate:v5];
    uint64_t v7 = [v6 immutableCopy];

    v3 = (STStatusBarData *)v7;
  }

  return v3;
}

uint64_t __46__STUIStatusBarDataBroadcaster_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = qword_1EC05EF20;
  qword_1EC05EF20 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)_init
{
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarDataBroadcaster;
  uint64_t v2 = [(STUIStatusBarDataBroadcaster *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    dataListeners = v2->_dataListeners;
    v2->_dataListeners = (NSHashTable *)v3;

    v5 = (id *)MEMORY[0x1E4FB2608];
    if ([(id)*MEMORY[0x1E4FB2608] _isSpringBoard]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FA94F0]);
      uint64_t v7 = [*v5 systemStatusServer];
      uint64_t v8 = [v6 initWithServerHandle:v7];
      overridesDomain = v2->_overridesDomain;
      v2->_overridesDomain = (STStatusBarOverridesStatusDomain *)v8;
    }
    else
    {
      v10 = (STStatusBarOverridesStatusDomain *)objc_alloc_init(MEMORY[0x1E4FA94F0]);
      uint64_t v7 = v2->_overridesDomain;
      v2->_overridesDomain = v10;
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__STUIStatusBarDataBroadcaster__init__block_invoke;
    aBlock[3] = &unk_1E6AA37A0;
    v11 = v2;
    v21 = v11;
    v12 = _Block_copy(aBlock);
    v13 = v11->_overridesDomain;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__STUIStatusBarDataBroadcaster__init__block_invoke_2;
    v18[3] = &unk_1E6AA45F8;
    id v19 = v12;
    id v14 = v12;
    [(STStatusBarOverridesStatusDomain *)v13 observeDataWithBlock:v18];
    v15 = (STStatusBarData *)objc_alloc_init(MEMORY[0x1E4FA9440]);
    broadcastData = v11->_broadcastData;
    v11->_broadcastData = v15;
  }
  return v2;
}

void __37__STUIStatusBarDataBroadcaster__init__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allObjects", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateForDataChange:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __37__STUIStatusBarDataBroadcaster__init__block_invoke_2(uint64_t a1)
{
}

- (void)dealloc
{
  [(STStatusBarOverridesStatusDomain *)self->_overridesDomain invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDataBroadcaster;
  [(STUIStatusBarDataBroadcaster *)&v3 dealloc];
}

- (void)unregisterListener:(id)a3
{
}

- (void)updateWithData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*((void (**)(id, STStatusBarData *))a3 + 2))(a3, self->_broadcastData);
  if (([v4 isEqual:self->_broadcastData] & 1) == 0)
  {
    uint64_t v5 = [v4 immutableCopy];
    broadcastData = self->_broadcastData;
    self->_broadcastData = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v7 = [(NSHashTable *)self->_dataListeners allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) updateForDataChange:self];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastData, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
  objc_storeStrong((id *)&self->_dataListeners, 0);
}

@end