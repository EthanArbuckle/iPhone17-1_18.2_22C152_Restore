@interface VGOEMApplicationFinder
- (BOOL)_addOEMApplicationForApplicationRecordIfNeeded:(id)a3;
- (BOOL)_removeOEMApplicationForBundleIdentifier:(id)a3;
- (NSDictionary)allowlist;
- (NSMutableDictionary)applications;
- (NSSet)disabledAppIdentifiers;
- (VGOEMApplicationFinder)init;
- (VGOEMApplicationFinderUpdates)delegate;
- (id)_allowlistPayload;
- (id)_applicationRecordForBundleIdentifier:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)findOEMApplications;
- (void)setAllowlist:(id)a3;
- (void)setApplications:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledAppIdentifiers:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VGOEMApplicationFinder

void __45__VGOEMApplicationFinder_findOEMApplications__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v15 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[VGOEMApplicationFinder findOEMApplications]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 219;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  v2 = VGGetOEMApplicationLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = VGGetOEMApplicationLog();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FindOEMApplications", "", buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = objc_msgSend(WeakRetained, "allowlist", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x2166ACED0]();
          v14 = [WeakRetained _applicationRecordForBundleIdentifier:v12];
          v9 |= [WeakRetained _addOEMApplicationForApplicationRecordIfNeeded:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    v6 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
    v16 = (void *)MEMORY[0x2166ACED0]();
    uint64_t v17 = [v6 nextObject];
    if (v17)
    {
      v18 = (void *)v17;
      int v9 = 0;
      do
      {
        v9 |= [WeakRetained _addOEMApplicationForApplicationRecordIfNeeded:v18];
        v16 = (void *)MEMORY[0x2166ACED0]();
        uint64_t v19 = [v6 nextObject];

        v18 = (void *)v19;
      }
      while (v19);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  v20 = VGGetOEMApplicationLog();
  v21 = v20;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214A2C000, v21, OS_SIGNPOST_INTERVAL_END, v3, "FindOEMApplications", "", buf, 2u);
  }

  if (v9)
  {
    v15 = [WeakRetained delegate];
    v22 = [WeakRetained applications];
    v23 = [v22 allValues];
    [v15 OEMAppsUpdated:v23];

LABEL_28:
  }
}

- (id)_applicationRecordForBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4
    && (!GEOConfigGetBOOL()
     || ([(VGOEMApplicationFinder *)self allowlist],
         v5 = objc_claimAutoreleasedReturnValue(),
         [v5 objectForKeyedSubscript:v4],
         v6 = objc_claimAutoreleasedReturnValue(),
         v6,
         v5,
         v6)))
  {
    uint64_t v7 = [(VGOEMApplicationFinder *)self applications];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      int v9 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_DEBUG, "Won't create an LSAppRecord for bundleId: %@ as we already have this app saved.", buf, 0xCu);
      }
      uint64_t v10 = 0;
    }
    else
    {
      id v14 = 0;
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v14];
      int v9 = v14;
      if (v10)
      {
        id v11 = v10;
      }
      else
      {
        uint64_t v12 = VGGetOEMApplicationLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = v4;
          __int16 v17 = 2112;
          v18 = v9;
          _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_ERROR, "Failed making LSApplicationRecord for '%@': %@. App is not installed", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSDictionary)allowlist
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  allowlist = self->_allowlist;
  if (allowlist) {
    goto LABEL_21;
  }
  v21 = self;
  id v4 = [(VGOEMApplicationFinder *)self _allowlistPayload];
  v22 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v5;
        uint64_t v12 = GEOConfigGetString();
        v13 = [v10 objectForKeyedSubscript:v12];

        id v14 = GEOConfigGetString();
        v15 = [v10 objectForKeyedSubscript:v14];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(NSDictionary *)v22 setObject:v15 forKeyedSubscript:v13];

            id v5 = v11;
            goto LABEL_14;
          }
        }

        id v5 = v11;
      }
      v13 = VGGetOEMApplicationLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v10;
        _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_ERROR, "Encountered a bundle that is malformed: %@", buf, 0xCu);
      }
LABEL_14:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v7);
LABEL_16:

  id v16 = v21->_allowlist;
  v21->_allowlist = v22;
  __int16 v17 = v22;

  uint64_t v18 = [(NSDictionary *)v21->_allowlist count];
  if (!v18)
  {
    uint64_t v19 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v19, OS_LOG_TYPE_ERROR, "Error parsing manifest resource. Not having any allowlisted apps is a grave error.", buf, 2u);
    }
  }
  allowlist = v21->_allowlist;
LABEL_21:

  return allowlist;
}

- (NSMutableDictionary)applications
{
  return self->_applications;
}

- (BOOL)_addOEMApplicationForApplicationRecordIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  if (v5)
  {
    uint64_t v6 = [(VGOEMApplicationFinder *)self applications];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      int v9 = [MEMORY[0x263F0F998] appInfoWithApplicationRecord:v4];
      uint64_t v10 = [v9 supportedIntents];

      BOOL v8 = [(NSSet *)self->_requiredIntents isSubsetOfSet:v10];
      if (v8)
      {
        id v11 = [[VGOEMApplication alloc] initWithIdentifier:v5 applicationRecord:v4];
        uint64_t v12 = [(VGOEMApplicationFinder *)self allowlist];
        v13 = [v12 objectForKeyedSubscript:v5];
        [(VGOEMApplication *)v11 setAllowedFormulaIDs:v13];

        id v14 = [(VGOEMApplicationFinder *)self disabledAppIdentifiers];
        -[VGOEMApplication setEnabled:](v11, "setEnabled:", [v14 containsObject:v5] ^ 1);

        v15 = VGGetOEMApplicationLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          v22 = v5;
          _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_INFO, "Added application: %@", (uint8_t *)&v21, 0xCu);
        }

        id v16 = [(VGOEMApplicationFinder *)self applications];
        [v16 setObject:v11 forKeyedSubscript:v5];
      }
      else
      {
        __int16 v17 = [(VGOEMApplicationFinder *)self allowlist];
        uint64_t v18 = [v17 objectForKeyedSubscript:v5];

        if (!v18)
        {
LABEL_12:

          goto LABEL_13;
        }
        VGGetOEMApplicationLog();
        id v11 = (VGOEMApplication *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
        {
          requiredIntents = self->_requiredIntents;
          int v21 = 138412546;
          v22 = v5;
          __int16 v23 = 2112;
          long long v24 = requiredIntents;
          _os_log_impl(&dword_214A2C000, &v11->super, OS_LOG_TYPE_ERROR, "allowlisted application '%@' doesn't support our required intents: %@", (uint8_t *)&v21, 0x16u);
        }
      }

      goto LABEL_12;
    }
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (id)_allowlistPayload
{
  v2 = (void *)MEMORY[0x2166ACED0](self, a2);
  os_signpost_id_t v3 = VGAllowlistPayload();
  id v4 = GEOConfigGetString();
  id v5 = [v3 objectForKeyedSubscript:v4];

  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "No allowlisted apps. Returning.", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (VGOEMApplicationFinder)init
{
  v17.receiver = self;
  v17.super_class = (Class)VGOEMApplicationFinder;
  v2 = [(VGOEMApplicationFinder *)&v17 init];
  if (v2)
  {
    os_signpost_id_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("VGOEMApplicationFinderQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    applications = v2->_applications;
    v2->_applications = (NSMutableDictionary *)v6;

    BOOL v8 = (void *)MEMORY[0x263EFFA08];
    int v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = objc_msgSend(v8, "setWithObjects:", v10, v12, 0);
    requiredIntents = v2->_requiredIntents;
    v2->_requiredIntents = (NSSet *)v13;

    v15 = [MEMORY[0x263F01880] defaultWorkspace];
    [v15 addObserver:v2];

    _GEOConfigAddDelegateListenerForKey();
  }
  return v2;
}

- (void)findOEMApplications
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__VGOEMApplicationFinder_findOEMApplications__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSSet)disabledAppIdentifiers
{
  disabledAppIdentifiers = self->_disabledAppIdentifiers;
  if (!disabledAppIdentifiers)
  {
    dispatch_queue_t v4 = GEOConfigGetString();
    id v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = [v4 componentsSeparatedByString:@","];
    uint64_t v7 = [v5 setWithArray:v6];
    BOOL v8 = self->_disabledAppIdentifiers;
    self->_disabledAppIdentifiers = v7;

    disabledAppIdentifiers = self->_disabledAppIdentifiers;
  }

  return disabledAppIdentifiers;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  dispatch_queue_t v4 = *(void **)&a3.var0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__VGOEMApplicationFinder_valueChangedForGEOConfigKey___block_invoke;
  v7[3] = &unk_264226690;
  objc_copyWeak(v8, &location);
  v8[1] = v4;
  v8[2] = var1;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __54__VGOEMApplicationFinder_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_signpost_id_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v14 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v23 = "-[VGOEMApplicationFinder valueChangedForGEOConfigKey:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 137;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_17;
  }
  if (*(_DWORD *)(a1 + 40) == VirtualGarageConfig_EVRoutingDisabledApplications
    && *(void *)(a1 + 48) == (void)off_26AB30DF8)
  {
    [WeakRetained setDisabledAppIdentifiers:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = objc_msgSend(v3, "applications", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v3 applications];
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];

          uint64_t v13 = [v3 disabledAppIdentifiers];
          objc_msgSend(v12, "setEnabled:", objc_msgSend(v13, "containsObject:", v10) ^ 1);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    id v14 = [v3 delegate];
    v15 = [v3 applications];
    id v16 = [v15 allValues];
    [v14 OEMAppsUpdated:v16];

LABEL_17:
  }
}

- (BOOL)_removeOEMApplicationForBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(VGOEMApplicationFinder *)self applications];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = VGGetOEMApplicationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Removed application: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = [(VGOEMApplicationFinder *)self applications];
    [v8 setObject:0 forKeyedSubscript:v4];
  }
  return v6 != 0;
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__VGOEMApplicationFinder_applicationsDidInstall___block_invoke;
  v10[3] = &unk_264226208;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __49__VGOEMApplicationFinder_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    os_signpost_id_t v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[VGOEMApplicationFinder applicationsDidInstall:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 266;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_15;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  os_signpost_id_t v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v4)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      uint64_t v10 = objc_opt_respondsToSelector();
      if (v10)
      {
        id v11 = (void *)MEMORY[0x2166ACED0](v10);
        id v12 = objc_msgSend(v9, "bundleIdentifier", (void)v16);
        uint64_t v13 = [WeakRetained _applicationRecordForBundleIdentifier:v12];
        v6 |= [WeakRetained _addOEMApplicationForApplicationRecordIfNeeded:v13];
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v5);

  if (v6)
  {
    os_signpost_id_t v3 = objc_loadWeakRetained(WeakRetained + 3);
    id v14 = [WeakRetained applications];
    uint64_t v15 = [v14 allValues];
    [v3 OEMAppsUpdated:v15];

    goto LABEL_15;
  }
LABEL_16:
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__VGOEMApplicationFinder_applicationsDidUninstall___block_invoke;
  v10[3] = &unk_264226208;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __51__VGOEMApplicationFinder_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    os_signpost_id_t v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[VGOEMApplicationFinder applicationsDidUninstall:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 291;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_15;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  os_signpost_id_t v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      uint64_t v10 = objc_opt_respondsToSelector();
      if (v10)
      {
        id v11 = (void *)MEMORY[0x2166ACED0](v10);
        id v12 = objc_msgSend(v9, "bundleIdentifier", (void)v15);
        v6 |= [WeakRetained _removeOEMApplicationForBundleIdentifier:v12];
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v5);

  if (v6)
  {
    os_signpost_id_t v3 = objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v13 = [WeakRetained applications];
    id v14 = [v13 allValues];
    [v3 OEMAppsUpdated:v14];

    goto LABEL_15;
  }
LABEL_16:
}

- (void)dealloc
{
  os_signpost_id_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  GEOConfigRemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)VGOEMApplicationFinder;
  [(VGOEMApplicationFinder *)&v4 dealloc];
}

- (VGOEMApplicationFinderUpdates)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VGOEMApplicationFinderUpdates *)WeakRetained;
}

- (void)setDisabledAppIdentifiers:(id)a3
{
}

- (void)setAllowlist:(id)a3
{
}

- (void)setApplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_disabledAppIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_requiredIntents, 0);
}

@end