@interface PTDomain
+ (Class)rootSettingsClass;
+ (id)_sharedInstance;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
+ (void)registerTestRecipe:(id)a3;
- (id)_domainID;
- (id)_domainInfo;
- (id)_init;
- (id)_rootSettings;
- (void)_applyArchive:(id)a3;
- (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4;
- (void)_createConnection;
- (void)_disableObservationIfNecessary;
- (void)_handleConnectionInterrupted;
- (void)_handleConnectionInvalidated;
- (void)_noteRegistrationCompleted;
- (void)_registerTestRecipe:(id)a3;
- (void)_registerWithServerIfNecessary;
- (void)_restoreDefaultSettings;
- (void)_sendProxyDefinitionIfNecessary;
- (void)_tearDownConnection;
- (void)_updateActiveTestRecipe;
- (void)_updateServerConnectionStatusIfNecessary;
- (void)dealloc;
- (void)invokeOutletAtKeyPath:(id)a3;
- (void)restoreDefaultSettings;
- (void)sendActiveTestRecipeEvent:(int64_t)a3;
- (void)setArchiveValue:(id)a3 forKeyPath:(id)a4;
- (void)updateSettingsFromArchive:(id)a3;
@end

@implementation PTDomain

void __27__PTDomain__sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_sharedInstance___sharedInstancesByClassName;
  _sharedInstance___sharedInstancesByClassName = (uint64_t)v0;

  if (PTInstallIsAppleInternal())
  {
    v2 = +[PTDefaults sharedInstance];
    v3 = [NSString stringWithUTF8String:"prototypeSettingsEnabled"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __27__PTDomain__sharedInstance__block_invoke_2;
    v19[3] = &unk_1E63BC600;
    id v4 = v2;
    id v20 = v4;
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v6 = (id)[v4 observeDefault:v3 onQueue:MEMORY[0x1E4F14428] withBlock:v19];

    v7 = [NSString stringWithUTF8String:"activePrototypingEnabled"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __27__PTDomain__sharedInstance__block_invoke_2_11;
    v17[3] = &unk_1E63BC600;
    id v8 = v4;
    id v18 = v8;
    id v9 = (id)[v8 observeDefault:v7 onQueue:v5 withBlock:v17];

    v10 = [NSString stringWithUTF8String:"remotePrototypingEnabled"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __27__PTDomain__sharedInstance__block_invoke_2_16;
    v15[3] = &unk_1E63BC600;
    id v16 = v8;
    v11 = v8;
    id v12 = (id)[v11 observeDefault:v10 onQueue:v5 withBlock:v15];

    id v13 = (id)[v11 observeTestRecipeDefaultsOnQueue:v5 withBlock:&__block_literal_global_22];
  }
  else
  {
    v11 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1BEC4F000, v11, OS_LOG_TYPE_DEFAULT, "Not observing PTDefaults on customer install.", v14, 2u);
    }
  }
}

+ (id)rootSettings
{
  v2 = [a1 _sharedInstance];
  v3 = [v2 _rootSettings];

  return v3;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstance___lock);
  v3 = NSStringFromClass((Class)a1);
  id v4 = [(id)_sharedInstance___sharedInstancesByClassName objectForKey:v3];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc((Class)a1) _init];
    [(id)_sharedInstance___sharedInstancesByClassName setObject:v4 forKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstance___lock);

  return v4;
}

- (id)_rootSettings
{
  return self->_rootSettings;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)PTDomain;
  v2 = [(PTDomain *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rootSettingsClass")), "initWithDefaultValues");
    rootSettings = v2->_rootSettings;
    v2->_rootSettings = (PTSettings *)v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    testRecipesByIdentifier = v2->_testRecipesByIdentifier;
    v2->_testRecipesByIdentifier = v5;

    if (PTInstallIsAppleInternal())
    {
      [(PTDomain *)v2 _updateServerConnectionStatusIfNecessary];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handlePrototypingIsActiveNotification, @"com.apple.PrototypeTools.prototyping-is-active", 0, (CFNotificationSuspensionBehavior)0);
    }
  }
  return v2;
}

+ (void)registerTestRecipe:(id)a3
{
  id v5 = a3;
  if (PTInstallIsAppleInternal())
  {
    id v4 = [a1 _sharedInstance];
    [v4 _registerTestRecipe:v5];
  }
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) prototypeSettingsEnabled];
    id v4 = "disabled";
    if (v3) {
      id v4 = "enabled";
    }
    int v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1BEC4F000, v2, OS_LOG_TYPE_DEFAULT, "Prototype settings are now %s: updating server connection status for all domains", (uint8_t *)&v6, 0xCu);
  }

  return [(id)_sharedInstance___sharedInstancesByClassName enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _updateServerConnectionStatusIfNecessary];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_11(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) activePrototypingEnabled];
    id v4 = "disabled";
    if (v3) {
      id v4 = "enabled";
    }
    int v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1BEC4F000, v2, OS_LOG_TYPE_DEFAULT, "Active prototyping is now %s: updating observation status for all domains", (uint8_t *)&v6, 0xCu);
  }

  return [(id)_sharedInstance___sharedInstancesByClassName enumerateKeysAndObjectsUsingBlock:&__block_literal_global_14];
}

void __27__PTDomain__sharedInstance__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  [v3 _disableObservationIfNecessary];
  [v3 _sendProxyDefinitionIfNecessary];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_16(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) remotePrototypingEnabled];
    id v4 = "disabled";
    if (v3) {
      id v4 = "enabled";
    }
    int v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1BEC4F000, v2, OS_LOG_TYPE_DEFAULT, "Remote prototyping is now %s: sending proxy definitions as needed", (uint8_t *)&v6, 0xCu);
  }

  return [(id)_sharedInstance___sharedInstancesByClassName enumerateKeysAndObjectsUsingBlock:&__block_literal_global_19];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _sendProxyDefinitionIfNecessary];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_20()
{
  return [(id)_sharedInstance___sharedInstancesByClassName enumerateKeysAndObjectsUsingBlock:&__block_literal_global_24];
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _updateActiveTestRecipe];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.PrototypeTools.prototyping-is-active", 0);
  v4.receiver = self;
  v4.super_class = (Class)PTDomain;
  [(PTDomain *)&v4 dealloc];
}

- (void)updateSettingsFromArchive:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PTDomain_updateSettingsFromArchive___block_invoke;
  v6[3] = &unk_1E63BC548;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __38__PTDomain_updateSettingsFromArchive___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyArchive:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _noteRegistrationCompleted];
}

- (void)restoreDefaultSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PTDomain_restoreDefaultSettings__block_invoke;
  block[3] = &unk_1E63BC600;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __34__PTDomain_restoreDefaultSettings__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _restoreDefaultSettings];
  v2 = *(void **)(a1 + 32);
  return [v2 _noteRegistrationCompleted];
}

- (void)setArchiveValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PTDomain_setArchiveValue_forKeyPath___block_invoke;
  block[3] = &unk_1E63BC628;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __39__PTDomain_setArchiveValue_forKeyPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyArchiveValue:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
}

- (void)invokeOutletAtKeyPath:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PTDomain_invokeOutletAtKeyPath___block_invoke;
  v6[3] = &unk_1E63BC548;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __34__PTDomain_invokeOutletAtKeyPath___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKeyPath:*(void *)(a1 + 40)];
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"putative outlet is not a PTOutlet"];
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"putative outlet is nil"];
  }
  [v1 _invokeActions];
}

- (void)sendActiveTestRecipeEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PTDomain_sendActiveTestRecipeEvent___block_invoke;
  v3[3] = &unk_1E63BC650;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __38__PTDomain_sendActiveTestRecipeEvent___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = PTPrototypingEventShortName(*(void *)(a1 + 40));
  int v3 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v3) {
    goto LABEL_9;
  }
  if (![v3 _wantsEvent:*(void *)(a1 + 40)])
  {
    if (*(void *)(*(void *)(a1 + 32) + 48))
    {
      id v7 = PTLogObjectForTopic(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*(id *)(a1 + 32) _domainID];
        id v9 = [*(id *)(*(void *)(a1 + 32) + 48) title];
        int v11 = 138412802;
        id v12 = v8;
        __int16 v13 = 2112;
        v14 = v2;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Domain %@ received '%@' but test recipe '%@' doesn't want it", (uint8_t *)&v11, 0x20u);
      }
LABEL_11:

      goto LABEL_12;
    }
LABEL_9:
    id v7 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [*(id *)(a1 + 32) _domainID];
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      v14 = v2;
      _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Domain %@ received '%@' but there is no active test recipe", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_11;
  }
  id v4 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) _domainID];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 48) title];
    int v11 = 138412802;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@ delivering '%@' to test recipe '%@'", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) _handleEvent:*(void *)(a1 + 40)];
LABEL_12:
}

- (id)_domainInfo
{
  domainInfo = self->_domainInfo;
  if (!domainInfo)
  {
    id v4 = [[PTDomainInfo alloc] initWithDomain:self];
    id v5 = self->_domainInfo;
    self->_domainInfo = v4;

    domainInfo = self->_domainInfo;
  }
  return domainInfo;
}

- (id)_domainID
{
  domainID = self->_domainID;
  if (!domainID)
  {
    id v4 = [(PTDomain *)self _domainInfo];
    id v5 = [v4 uniqueIdentifier];
    id v6 = self->_domainID;
    self->_domainID = v5;

    domainID = self->_domainID;
  }
  return domainID;
}

- (void)_registerTestRecipe:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [PTTestRecipeInfo alloc];
  id v6 = [(PTDomain *)self _domainInfo];
  id v7 = [(PTTestRecipeInfo *)v5 initWithTestRecipe:v4 domainInfo:v6];

  [v4 setInfo:v7];
  id v8 = [(PTTestRecipeInfo *)v7 uniqueIdentifier];
  id v9 = [(NSMutableDictionary *)self->_testRecipesByIdentifier objectForKey:v8];
  if (v9)
  {
    v10 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(PTDomain *)self _domainID];
      id v12 = [v4 title];
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1BEC4F000, v10, OS_LOG_TYPE_DEFAULT, "Domain %@: replacing test recipe with title %@", buf, 0x16u);
    }
    [v9 invalidate];
  }
  [(NSMutableDictionary *)self->_testRecipesByIdentifier setObject:v4 forKey:v8];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __32__PTDomain__registerTestRecipe___block_invoke;
  v21 = &unk_1E63BC548;
  v22 = self;
  id v13 = v8;
  id v23 = v13;
  [v4 setInvalidationHandler:&v18];
  [(PTDomain *)self _updateActiveTestRecipe];
  if (self->_registrationRequested)
  {
    v14 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(PTDomain *)self _domainID];
      id v16 = [v4 title];
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1BEC4F000, v14, OS_LOG_TYPE_DEFAULT, "Domain %@: registering test recipe %@", buf, 0x16u);
    }
    uint64_t v17 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
    [v17 registerTestRecipeWithInfo:v7];
  }
}

uint64_t __32__PTDomain__registerTestRecipe___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_updateActiveTestRecipe
{
  int v3 = +[PTDefaults sharedInstance];
  id v8 = [v3 activeTestRecipeIdentifier];

  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_testRecipesByIdentifier, "objectForKey:");
    id v4 = (PTTestRecipe *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  activeTestRecipe = self->_activeTestRecipe;
  p_activeTestRecipe = &self->_activeTestRecipe;
  id v5 = activeTestRecipe;
  if (activeTestRecipe != v4)
  {
    if (v5) {
      [(PTTestRecipe *)v5 _deactivate];
    }
    objc_storeStrong((id *)p_activeTestRecipe, v4);
    if (*p_activeTestRecipe) {
      [(PTTestRecipe *)*p_activeTestRecipe _activate];
    }
  }
}

- (void)_applyArchive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PTDomain *)self _domainID];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1BEC4F000, v5, OS_LOG_TYPE_DEFAULT, "Domain %@: applying archive", (uint8_t *)&v7, 0xCu);
  }
  [(PTSettings *)self->_rootSettings _setObservationEnabled:1];
  [(PTSettings *)self->_rootSettings restoreFromArchiveDictionary:v4];

  self->_archiveIsApplied = 1;
  [(PTDomain *)self _disableObservationIfNecessary];
}

- (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PTDomain *)self _domainID];
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BEC4F000, v8, OS_LOG_TYPE_DEFAULT, "Domain %@: applying archive value for keyPath %@", buf, 0x16u);
  }
  [(PTSettings *)self->_rootSettings _setObservationEnabled:1];
  rootSettings = self->_rootSettings;
  id v14 = 0;
  BOOL v11 = [(PTSettings *)rootSettings _applyArchiveValue:v7 forKeyPath:v6 error:&v14];

  id v12 = v14;
  if (v11)
  {
    self->_archiveIsApplied = 1;
  }
  else
  {
    id v13 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_1BEC4F000, v13, OS_LOG_TYPE_DEFAULT, "   ...failed to apply archive value (%@)", buf, 0xCu);
    }
  }
  [(PTDomain *)self _disableObservationIfNecessary];
}

- (void)_restoreDefaultSettings
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PTDomain *)self _domainID];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1BEC4F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: restoring default values", (uint8_t *)&v5, 0xCu);
  }
  if (self->_archiveIsApplied)
  {
    [(PTSettings *)self->_rootSettings _setObservationEnabled:1];
    [(PTSettings *)self->_rootSettings restoreDefaultValues];
    self->_archiveIsApplied = 0;
  }
  [(PTDomain *)self _disableObservationIfNecessary];
}

- (void)_disableObservationIfNecessary
{
  if (!self->_archiveIsApplied
    || (+[PTDefaults sharedInstance],
        int v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 activePrototypingEnabled],
        v3,
        (v4 & 1) == 0))
  {
    rootSettings = self->_rootSettings;
    [(PTSettings *)rootSettings _setObservationEnabled:0];
  }
}

- (void)_updateServerConnectionStatusIfNecessary
{
  int v3 = +[PTDefaults sharedInstance];
  int v4 = [v3 prototypeSettingsEnabled];

  serverConnection = self->_serverConnection;
  if (v4)
  {
    if (!serverConnection)
    {
      [(PTDomain *)self _createConnection];
      [(PTDomain *)self _registerWithServerIfNecessary];
    }
  }
  else if (serverConnection)
  {
    [(PTDomain *)self _tearDownConnection];
    [(PTDomain *)self _restoreDefaultSettings];
  }
}

- (void)_sendProxyDefinitionIfNecessary
{
  if (!self->_haveSentProxyDefinition)
  {
    if (self->_serverConnection)
    {
      uint64_t v3 = [(id)objc_opt_class() rootSettingsClass];
      if (v3)
      {
        uint64_t v4 = v3;
        id v13 = +[PTDefaults sharedInstance];
        int v5 = [(PTDomain *)self _domainInfo];
        id v6 = [v5 settingsFrameworkBundlePath];

        uint64_t v7 = [v6 lastPathComponent];
        id v8 = [v7 pathExtension];

        if (v8) {
          BOOL v9 = [v8 compare:@"framework" options:3] != 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (([v13 remotePrototypingEnabled] & 1) != 0
          || ([v13 activePrototypingEnabled] & v9) == 1)
        {
          v10 = +[PTProxySettingsDefinition definitionForSettingsClass:v4];
          BOOL v11 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
          id v12 = [(PTDomain *)self _domainID];
          [v11 registerRootSettingsProxyDefinition:v10 forDomainID:v12];

          self->_haveSentProxyDefinition = 1;
        }
      }
    }
  }
}

- (void)_createConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PTDomain *)self _domainID];
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1BEC4F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: creating server connection", buf, 0xCu);
  }
  int v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.PrototypeTools.domainserver" options:4096];
  serverConnection = self->_serverConnection;
  self->_serverConnection = v5;

  uint64_t v7 = self->_serverConnection;
  id v8 = PTDomainServerInterface();
  [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

  BOOL v9 = self->_serverConnection;
  v10 = PTDomainClientInterface();
  [(NSXPCConnection *)v9 setExportedInterface:v10];

  [(NSXPCConnection *)self->_serverConnection setExportedObject:self];
  objc_initWeak((id *)buf, self);
  BOOL v11 = self->_serverConnection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __29__PTDomain__createConnection__block_invoke;
  v18[3] = &unk_1E63BC678;
  objc_copyWeak(&v19, (id *)buf);
  [(NSXPCConnection *)v11 setInterruptionHandler:v18];
  id v12 = self->_serverConnection;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __29__PTDomain__createConnection__block_invoke_3;
  id v16 = &unk_1E63BC678;
  objc_copyWeak(&v17, (id *)buf);
  [(NSXPCConnection *)v12 setInvalidationHandler:&v13];
  [(NSXPCConnection *)self->_serverConnection resume];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __29__PTDomain__createConnection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PTDomain__createConnection__block_invoke_2;
  block[3] = &unk_1E63BC678;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __29__PTDomain__createConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __29__PTDomain__createConnection__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PTDomain__createConnection__block_invoke_4;
  block[3] = &unk_1E63BC678;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __29__PTDomain__createConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInvalidated];
}

- (void)_tearDownConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PTDomain *)self _domainID];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1BEC4F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: tearing down server connection", (uint8_t *)&v6, 0xCu);
  }
  [(NSXPCConnection *)self->_serverConnection suspend];
  [(NSXPCConnection *)self->_serverConnection invalidate];
  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;
}

- (void)_handleConnectionInterrupted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL registrationCompleted = self->_registrationCompleted;
  *(_WORD *)&self->_registrationRequested = 0;
  uint64_t v4 = PTLogObjectForTopic(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (registrationCompleted)
  {
    if (v5)
    {
      int v6 = [(PTDomain *)self _domainID];
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@: server connection interrupted, no need to reconnect", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = [(PTDomain *)self _domainID];
      double delayBeforeRegisteringAfterInterruption = self->_delayBeforeRegisteringAfterInterruption;
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2048;
      double v14 = delayBeforeRegisteringAfterInterruption;
      _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@: server connection interrupted, will reconnect after %.1gs", buf, 0x16u);
    }
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_delayBeforeRegisteringAfterInterruption * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PTDomain__handleConnectionInterrupted__block_invoke;
    block[3] = &unk_1E63BC600;
    void block[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __40__PTDomain__handleConnectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerWithServerIfNecessary];
}

- (void)_handleConnectionInvalidated
{
  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

  *(_WORD *)&self->_registrationRequested = 0;
}

- (void)_registerWithServerIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_serverConnection && !self->_registrationRequested)
  {
    uint64_t v3 = PTLogObjectForTopic(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(PTDomain *)self _domainID];
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1BEC4F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: registering with server", buf, 0xCu);
    }
    BOOL v5 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
    int v6 = [(PTDomain *)self _domainInfo];
    [v5 registerDomainWithInfo:v6];

    testRecipesByIdentifier = self->_testRecipesByIdentifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__PTDomain__registerWithServerIfNecessary__block_invoke;
    v8[3] = &unk_1E63BC6A0;
    v8[4] = self;
    [(NSMutableDictionary *)testRecipesByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
    [(PTDomain *)self _sendProxyDefinitionIfNecessary];
    self->_registrationRequested = 1;
    self->_double delayBeforeRegisteringAfterInterruption = self->_delayBeforeRegisteringAfterInterruption + 2.0;
  }
}

void __42__PTDomain__registerWithServerIfNecessary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PTLogObjectForTopic(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 title];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1BEC4F000, v5, OS_LOG_TYPE_DEFAULT, "   ...registering test recipe %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  uint64_t v8 = [v4 info];
  [v7 registerTestRecipeWithInfo:v8];
}

- (void)_noteRegistrationCompleted
{
  self->_BOOL registrationCompleted = 1;
  self->_double delayBeforeRegisteringAfterInterruption = 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTestRecipe, 0);
  objc_storeStrong((id *)&self->_testRecipesByIdentifier, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_domainInfo, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

+ (id)domainGroupName
{
  return 0;
}

+ (id)domainName
{
  return 0;
}

+ (Class)rootSettingsClass
{
  return 0;
}

@end