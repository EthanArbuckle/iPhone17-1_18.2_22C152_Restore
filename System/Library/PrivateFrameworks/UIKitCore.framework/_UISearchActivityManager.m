@interface _UISearchActivityManager
- (NSMapTable)_activeAssertions;
- (UIScene)_scene;
- (_UISearchActivityManager)initWithScene:(id)a3;
- (id)beginTrackingActiveSearchParticipant:(id)a3;
- (id)windowHostingScene;
- (void)_setScene:(id)a3;
- (void)_updateClientSettingsIfNecessary;
- (void)set_activeAssertions:(id)a3;
@end

@implementation _UISearchActivityManager

- (_UISearchActivityManager)initWithScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISearchActivityManager;
  v5 = [(_UISearchActivityManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    activeAssertions = v6->__activeAssertions;
    v6->__activeAssertions = v7;
  }
  return v6;
}

- (id)beginTrackingActiveSearchParticipant:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UISearchActivityManager *)self _activeAssertions];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Attempt to begin tracking an already tracked active search participant. Participant: %@", buf, 0xCu);
      }
    }
    else
    {
      v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &beginTrackingActiveSearchParticipant____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Attempt to begin tracking an already tracked active search participant. Participant: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"SearchParticipant:%p", v4);
    id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v10 = MEMORY[0x1E4F14428];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65___UISearchActivityManager_beginTrackingActiveSearchParticipant___block_invoke;
    v14[3] = &unk_1E52F3A90;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, (id *)buf);
    v6 = (void *)[v9 initWithIdentifier:v8 forReason:@"Active search participant" queue:MEMORY[0x1E4F14428] invalidationBlock:v14];

    v11 = [(_UISearchActivityManager *)self _activeAssertions];
    [v11 setObject:v6 forKey:v4];

    [(_UISearchActivityManager *)self _updateClientSettingsIfNecessary];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (id)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return WeakRetained;
}

- (void)_updateClientSettingsIfNecessary
{
  v3 = [(_UISearchActivityManager *)self windowHostingScene];
  id v4 = v3;
  if (v3)
  {
    if (([v3 _hasInvalidated] & 1) == 0)
    {
      v5 = [(_UISearchActivityManager *)self _activeAssertions];
      uint64_t v6 = [v5 count];

      v7 = [v4 _effectiveUIClientSettings];
      int v8 = [v7 containsSearchView];

      if ((v6 != 0) != v8)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __60___UISearchActivityManager__updateClientSettingsIfNecessary__block_invoke;
        v9[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        BOOL v10 = v6 != 0;
        [v4 _updateUIClientSettingsWithBlock:v9];
      }
    }
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (NSMapTable)_activeAssertions
{
  return self->__activeAssertions;
}

- (void)set_activeAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAssertions, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end