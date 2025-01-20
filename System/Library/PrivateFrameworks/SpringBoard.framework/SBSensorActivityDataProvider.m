@interface SBSensorActivityDataProvider
- (NSHashTable)observers;
- (NSSet)activeAndRecentSensorActivityAttributions;
- (NSSet)activeCameraAndMicrophoneActivityAttributions;
- (NSSet)activeSensorActivityAttributions;
- (NSSet)recentSensorActivityAttributions;
- (SBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution;
- (SBSensorActivityDataProvider)init;
- (SBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3;
- (STUIDataAccessStatusDomain)dataAccessDomain;
- (id)_recentCameraAndMicrophoneActivityAttributions;
- (void)_handleNewDomainData:(id)a3;
- (void)_notifyObserversOfActivityChange;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setActiveSensorActivityAttributions:(id)a3;
- (void)setRecentSensorActivityAttributions:(id)a3;
@end

@implementation SBSensorActivityDataProvider

BOOL __77__SBSensorActivityDataProvider_activeCameraAndMicrophoneActivityAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 sensor]) {
    BOOL v3 = [v2 sensor] == 1;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (SBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBSensorActivityDataProvider *)self _recentCameraAndMicrophoneActivityAttributions];
  id v3 = [v2 lastObject];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v9 != v3)
        {
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", (void)v14);
          v11 = [v3 bundleIdentifier];
          if ([v10 isEqualToString:v11])
          {
            uint64_t v12 = [v9 sensor];

            if (v12) {
              continue;
            }
            v10 = v3;
            id v3 = v9;
          }
          else
          {
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (SBSensorActivityAttribution *)v3;
}

- (id)_recentCameraAndMicrophoneActivityAttributions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBSensorActivityDataProvider *)self recentSensorActivityAttributions];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "sensor", (void)v12) || objc_msgSend(v9, "sensor") == 1) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (NSSet)activeAndRecentSensorActivityAttributions
{
  id v3 = [(SBSensorActivityDataProvider *)self activeSensorActivityAttributions];
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
  }
  uint64_t v7 = v6;

  v8 = [(SBSensorActivityDataProvider *)self recentSensorActivityAttributions];
  [v7 unionSet:v8];

  id v9 = (void *)[v7 copy];
  return (NSSet *)v9;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  id v2 = [(SBSensorActivityDataProvider *)self activeSensorActivityAttributions];
  id v3 = [v2 objectsPassingTest:&__block_literal_global_232];

  return (NSSet *)v3;
}

- (NSSet)activeSensorActivityAttributions
{
  return self->_activeSensorActivityAttributions;
}

- (NSSet)recentSensorActivityAttributions
{
  return self->_recentSensorActivityAttributions;
}

void __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleNewDomainData:*(void *)(a1 + 32)];
}

- (void)_handleNewDomainData:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 activeAttributionData];
    id v6 = [v5 dataAccessAttributions];

    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = objc_msgSend(v6, "bs_map:", &__block_literal_global_17_2);
    id v9 = [v7 setWithArray:v8];

    [(SBSensorActivityDataProvider *)self setActiveSensorActivityAttributions:v9];
    v10 = [v16 recentAttributionData];
    v11 = [v10 dataAccessAttributions];

    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    long long v13 = objc_msgSend(v11, "bs_map:", &__block_literal_global_20_2);
    long long v14 = [v12 setWithArray:v13];

    [(SBSensorActivityDataProvider *)self setRecentSensorActivityAttributions:v14];
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F1CAD0] set];
    [(SBSensorActivityDataProvider *)self setActiveSensorActivityAttributions:v15];

    id v6 = [MEMORY[0x1E4F1CAD0] set];
    [(SBSensorActivityDataProvider *)self setRecentSensorActivityAttributions:v6];
  }

  [(SBSensorActivityDataProvider *)self _notifyObserversOfActivityChange];
}

- (void)setRecentSensorActivityAttributions:(id)a3
{
}

- (void)setActiveSensorActivityAttributions:(id)a3
{
}

- (void)_notifyObserversOfActivityChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBSensorActivityDataProvider *)self observers];
  id v4 = (void *)[v3 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "activityDidChangeForSensorActivityDataProvider:", self, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

SBSensorActivityAttribution *__53__SBSensorActivityDataProvider__handleNewDomainData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SBSensorActivityAttribution alloc] initWithDataAccessAttribution:v2];

  return v3;
}

SBSensorActivityAttribution *__53__SBSensorActivityDataProvider__handleNewDomainData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SBSensorActivityAttribution alloc] initWithDataAccessAttribution:v2];

  return v3;
}

void __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke_2;
  v5[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

- (SBSensorActivityDataProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSensorActivityDataProvider.m" lineNumber:32 description:@"call initWithSystemStatusServer:"];

  id v5 = [MEMORY[0x1E4F1CA98] null];
  id v6 = [(SBSensorActivityDataProvider *)self initWithSystemStatusServer:v5];

  return v6;
}

- (SBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSensorActivityDataProvider;
  id v5 = [(SBSensorActivityDataProvider *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FA9958]) initWithServerHandle:v4];
    dataAccessDomain = v5->_dataAccessDomain;
    v5->_dataAccessDomain = (STUIDataAccessStatusDomain *)v6;

    objc_initWeak(&location, v5);
    uint64_t v8 = v5->_dataAccessDomain;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke;
    uint64_t v16 = &unk_1E6B06758;
    objc_copyWeak(&v17, &location);
    [(STUIDataAccessStatusDomain *)v8 observeDataWithBlock:&v13];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v13, v14, v15, v16);
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v9;

    long long v11 = [(STUIDataAccessStatusDomain *)v5->_dataAccessDomain data];
    [(SBSensorActivityDataProvider *)v5 _handleNewDomainData:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  [(STUIDataAccessStatusDomain *)self->_dataAccessDomain invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSensorActivityDataProvider;
  [(SBSensorActivityDataProvider *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSensorActivityDataProvider *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSensorActivityDataProvider *)self observers];
  [v5 removeObject:v4];
}

- (STUIDataAccessStatusDomain)dataAccessDomain
{
  return self->_dataAccessDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataAccessDomain, 0);
  objc_storeStrong((id *)&self->_recentSensorActivityAttributions, 0);
  objc_storeStrong((id *)&self->_activeSensorActivityAttributions, 0);
}

@end