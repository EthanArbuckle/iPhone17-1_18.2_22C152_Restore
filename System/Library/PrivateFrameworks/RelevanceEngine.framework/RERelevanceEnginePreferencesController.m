@interface RERelevanceEnginePreferencesController
- (RERelevanceEnginePreferences)effectivePreferences;
- (RERelevanceEnginePreferencesController)initWithQueue:(id)a3;
- (void)_resetEffectivePreferences;
- (void)removePreferencesForObject:(id)a3;
- (void)setPreferences:(id)a3 forObject:(id)a4;
@end

@implementation RERelevanceEnginePreferencesController

- (RERelevanceEnginePreferences)effectivePreferences
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectivePreferences = self->_effectivePreferences;
  if (!effectivePreferences)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_preferences;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v21 = p_lock;
      uint64_t v8 = 0;
      v9 = 0;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v5);
          }
          v12 = [(NSMapTable *)self->_preferences objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          v13 = v12;
          if (v12)
          {
            if (v9)
            {
              v14 = [v12 disabledDataSourceIdentifiers];
              [v9 intersectSet:v14];
            }
            else
            {
              v15 = (void *)MEMORY[0x263EFF9C0];
              v14 = [v12 disabledDataSourceIdentifiers];
              v9 = [v15 setWithSet:v14];
            }

            v8 |= [v13 mode];
          }
        }
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);

      p_lock = v21;
      if (v9)
      {
        v16 = objc_alloc_init(RERelevanceEnginePreferences);
        v17 = self->_effectivePreferences;
        self->_effectivePreferences = v16;

        [(RERelevanceEnginePreferences *)self->_effectivePreferences setDisabledDataSourceIdentifiers:v9];
        [(RERelevanceEnginePreferences *)self->_effectivePreferences setMode:v8];
LABEL_18:

        effectivePreferences = self->_effectivePreferences;
        goto LABEL_19;
      }
    }
    else
    {
    }
    v18 = +[RERelevanceEnginePreferences defaultPreferences];
    v9 = self->_effectivePreferences;
    self->_effectivePreferences = v18;
    goto LABEL_18;
  }
LABEL_19:
  v19 = (void *)[(RERelevanceEnginePreferences *)effectivePreferences copy];
  os_unfair_lock_unlock(p_lock);
  return (RERelevanceEnginePreferences *)v19;
}

- (RERelevanceEnginePreferencesController)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RERelevanceEnginePreferencesController;
  uint64_t v6 = [(RERelevanceEnginePreferencesController *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    preferences = v7->_preferences;
    v7->_preferences = (NSMapTable *)v8;

    effectivePreferences = v7->_effectivePreferences;
    v7->_effectivePreferences = 0;
  }
  return v7;
}

- (void)setPreferences:(id)a3 forObject:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [v8 setDelegate:self];
  [(NSMapTable *)self->_preferences setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
  [(RERelevanceEnginePreferencesController *)self _resetEffectivePreferences];
}

- (void)removePreferencesForObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMapTable *)self->_preferences objectForKey:v5];
  [v6 setDelegate:0];
  [(NSMapTable *)self->_preferences removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  [(RERelevanceEnginePreferencesController *)self _resetEffectivePreferences];
}

- (void)_resetEffectivePreferences
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectivePreferences = self->_effectivePreferences;
  self->_effectivePreferences = 0;

  os_unfair_lock_unlock(p_lock);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"RERelevanceEnginePreferencesDidUpdate" object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_effectivePreferences, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end