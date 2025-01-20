@interface PFPosterExtensionInstanceProvider
- (NSSet)activeExtensionInstances;
- (NSUUID)defaultInstanceIdentifier;
- (PFPosterExtensionInstanceProvider)init;
- (PFPosterExtensionInstanceProvider)initWithDefaultInstanceIdentifier:(id)a3;
- (id)acquireInstanceForExtension:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)instanceForExtension:(id)a3 reason:(id)a4;
- (void)cancel;
- (void)extensionInstanceDidInvalidate:(id)a3;
- (void)noteExtensionsWereUpdated:(id)a3;
- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4;
@end

@implementation PFPosterExtensionInstanceProvider

- (PFPosterExtensionInstanceProvider)init
{
  return [(PFPosterExtensionInstanceProvider *)self initWithDefaultInstanceIdentifier:0];
}

- (PFPosterExtensionInstanceProvider)initWithDefaultInstanceIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterExtensionInstanceProvider;
  v5 = [(PFPosterExtensionInstanceProvider *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x263F08C38], "pf_defaultInstanceIdentifier");
    }
    defaultInstanceIdentifier = v5->_defaultInstanceIdentifier;
    v5->_defaultInstanceIdentifier = (NSUUID *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    extensionBundleIdentifierToReasonMap = v5->_extensionBundleIdentifierToReasonMap;
    v5->_extensionBundleIdentifierToReasonMap = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    extensionBundleIdentifierWithReasonToInstanceMap = v5->_extensionBundleIdentifierWithReasonToInstanceMap;
    v5->_extensionBundleIdentifierWithReasonToInstanceMap = (NSMapTable *)v10;
  }
  return v5;
}

- (id)acquireInstanceForExtension:(id)a3 reason:(id)a4 error:(id *)a5
{
  v38[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (__CFString *)a4;
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_2707FB7C8;
  }
  if (v8)
  {
    v11 = [v8 posterExtensionBundleIdentifier];
    v12 = -[NSObject stringByAppendingFormat:](v11, "stringByAppendingFormat:", @"-['%@']", v10);
    objc_super v13 = self;
    objc_sync_enter(v13);
    v14 = [(NSMapTable *)v13->_extensionBundleIdentifierWithReasonToInstanceMap objectForKey:v12];
    if (v14)
    {
      v15 = [(NSMapTable *)v13->_extensionBundleIdentifierToReasonMap objectForKey:v11];
      [v15 addObject:v10];

      v16 = PFLogExtensionInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v8 posterExtensionBundleIdentifier];
        v18 = [v14 instanceIdentifier];
        *(_DWORD *)buf = 134218754;
        v30 = v13;
        __int16 v31 = 2112;
        id v32 = v17;
        __int16 v33 = 2114;
        v34 = v18;
        __int16 v35 = 2114;
        v36 = v10;
        _os_log_impl(&dword_25A085000, v16, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@' has instance %{public}@; will use for reason '%{public}@'",
          buf,
          0x2Au);
      }
      v19 = v14;
    }
    else
    {
      if ([(__CFString *)v10 length])
      {
        objc_msgSend(MEMORY[0x263F08C38], "pf_UUIDFromArbitraryString:", v10);
        v22 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = v13->_defaultInstanceIdentifier;
      }
      v23 = v22;
      v24 = [[PFPosterExtensionInstance alloc] initWithExtension:v8 instanceIdentifier:v22];
      [(PFPosterExtensionInstance *)v24 addInstanceObserver:v13];
      v25 = [(NSMapTable *)v13->_extensionBundleIdentifierToReasonMap objectForKey:v11];
      if (!v25)
      {
        v25 = objc_opt_new();
        [(NSMapTable *)v13->_extensionBundleIdentifierToReasonMap setObject:v25 forKey:v11];
      }
      [v25 addObject:v10];
      v26 = PFLogExtensionInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v8 posterExtensionBundleIdentifier];
        *(_DWORD *)buf = 134218754;
        v30 = v13;
        __int16 v31 = 2112;
        id v32 = v27;
        __int16 v33 = 2114;
        v34 = v23;
        __int16 v35 = 2114;
        v36 = v10;
        _os_log_impl(&dword_25A085000, v26, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@' booted new instance %{public}@ for reason '%{public}@'", buf, 0x2Au);
      }
      [(NSMapTable *)v13->_extensionBundleIdentifierWithReasonToInstanceMap setObject:v24 forKey:v12];
      v19 = v24;
    }
    objc_sync_exit(v13);
  }
  else
  {
    if (a5)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      v37[0] = *MEMORY[0x263F08338];
      v37[1] = @"reason";
      v38[0] = @"cannot acquire instance for nil extension";
      v38[1] = v10;
      v21 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
      objc_msgSend(v20, "pf_errorWithCode:userInfo:", 3, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = PFLogExtensionInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PFPosterExtensionInstanceProvider acquireInstanceForExtension:reason:error:]((uint64_t)self, (uint64_t)v10, v11);
    }
    v19 = 0;
  }

  return v19;
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    id v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionInstance"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterExtensionInstanceProvider relinquishExtensionInstance:reason:](a2, (uint64_t)self, (uint64_t)v17);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08C3ACLL);
  }
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = &stru_2707FB7C8;
  }
  uint64_t v10 = [v7 extension];
  v11 = [v10 posterExtensionBundleIdentifier];

  v12 = [v11 stringByAppendingFormat:@"-['%@']", v9];
  objc_super v13 = self;
  objc_sync_enter(v13);
  v14 = PFLogExtensionInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v7 instanceIdentifier];
    *(_DWORD *)buf = 134218754;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2114;
    v23 = v15;
    __int16 v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_25A085000, v14, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@'/%{public}@ for reason '%{public}@'", buf, 0x2Au);
  }
  v16 = [(NSMapTable *)v13->_extensionBundleIdentifierToReasonMap objectForKey:v11];
  [v16 removeObject:v9];
  if (![v16 count])
  {
    [(NSMapTable *)v13->_extensionBundleIdentifierWithReasonToInstanceMap removeObjectForKey:v12];
    [(NSMapTable *)v13->_extensionBundleIdentifierToReasonMap removeObjectForKey:v11];
    [v7 invalidate];
  }

  objc_sync_exit(v13);
}

- (NSSet)activeExtensionInstances
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(NSMapTable *)v2->_extensionBundleIdentifierWithReasonToInstanceMap objectEnumerator];
  v5 = [v4 allObjects];
  uint64_t v6 = [v3 setWithArray:v5];

  objc_sync_exit(v2);
  return (NSSet *)v6;
}

- (void)noteExtensionsWereUpdated:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v24 = a3;
  v25 = [v24 valueForKey:@"posterExtensionBundleIdentifier"];
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [(NSMapTable *)v4->_extensionBundleIdentifierToReasonMap keyEnumerator];
  id v7 = [v6 allObjects];
  id v8 = [v5 setWithArray:v7];

  v23 = v8;
  v9 = (void *)[v8 mutableCopy];
  [v9 minusSet:v25];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v10)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v28 = v10;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v12 = [(NSMapTable *)v4->_extensionBundleIdentifierToReasonMap objectForKey:v11];

        if (v12)
        {
          [(NSMapTable *)v4->_extensionBundleIdentifierToReasonMap removeObjectForKey:v11];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          objc_super v13 = [(NSMapTable *)v4->_extensionBundleIdentifierWithReasonToInstanceMap keyEnumerator];
          v14 = [v13 allObjects];
          v15 = (void *)[v14 copy];

          uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v15);
                }
                v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                if ([v19 hasPrefix:v11])
                {
                  __int16 v20 = [(NSMapTable *)v4->_extensionBundleIdentifierWithReasonToInstanceMap objectForKey:v19];
                  [v20 invalidate];
                  [(NSMapTable *)v4->_extensionBundleIdentifierWithReasonToInstanceMap removeObjectForKey:v19];
                  v21 = PFLogExtensionInstance();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    __int16 v22 = [v20 instanceIdentifier];
                    *(_DWORD *)buf = 134218498;
                    v39 = v4;
                    __int16 v40 = 2112;
                    uint64_t v41 = v11;
                    __int16 v42 = 2114;
                    v43 = v22;
                    _os_log_impl(&dword_25A085000, v21, OS_LOG_TYPE_DEFAULT, "(%p) cleaning up after now invalid extension '%@'/%{public}@", buf, 0x20u);
                  }
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v44 count:16];
            }
            while (v16);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (id)instanceForExtension:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 posterExtensionBundleIdentifier];
  v9 = [v8 stringByAppendingFormat:@"-['%@']", v7];
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMapTable *)v10->_extensionBundleIdentifierWithReasonToInstanceMap objectForKey:v9];
  objc_sync_exit(v10);

  return v11;
}

- (void)extensionInstanceDidInvalidate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = PFLogExtensionInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 extension];
      id v8 = [v7 posterExtensionBundleIdentifier];
      v9 = [v4 instanceIdentifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v26 = v5;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2114;
      long long v30 = v9;
      _os_log_impl(&dword_25A085000, v6, OS_LOG_TYPE_DEFAULT, "(%p) invalidated instance %@/%{public}@", buf, 0x20u);
    }
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [(NSMapTable *)v5->_extensionBundleIdentifierWithReasonToInstanceMap dictionaryRepresentation];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__PFPosterExtensionInstanceProvider_extensionInstanceDidInvalidate___block_invoke;
    v21[3] = &unk_26546EBC0;
    id v22 = v4;
    id v12 = v10;
    id v23 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v21];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          -[NSMapTable removeObjectForKey:](v5->_extensionBundleIdentifierWithReasonToInstanceMap, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v14);
    }

    objc_sync_exit(v5);
  }
}

uint64_t __68__PFPosterExtensionInstanceProvider_extensionInstanceDidInvalidate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32) == a3) {
    return [*(id *)(result + 40) addObject:a2];
  }
  return result;
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = PFLogExtensionInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v2;
    _os_log_impl(&dword_25A085000, v3, OS_LOG_TYPE_DEFAULT, "(%p) cancel", (uint8_t *)&v6, 0xCu);
  }

  [(NSMapTable *)v2->_extensionBundleIdentifierWithReasonToInstanceMap removeAllObjects];
  id v4 = [(NSMapTable *)v2->_extensionBundleIdentifierWithReasonToInstanceMap objectEnumerator];
  v5 = [v4 allObjects];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_195];

  [(NSMapTable *)v2->_extensionBundleIdentifierWithReasonToInstanceMap removeAllObjects];
  objc_sync_exit(v2);
}

uint64_t __43__PFPosterExtensionInstanceProvider_cancel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (NSUUID)defaultInstanceIdentifier
{
  return self->_defaultInstanceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifierWithReasonToInstanceMap, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifierToReasonMap, 0);
}

- (void)acquireInstanceForExtension:(uint64_t)a1 reason:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A085000, log, OS_LOG_TYPE_ERROR, "(%p) no extension specified; will not acquire instance for reason '%{public}@'",
    (uint8_t *)&v3,
    0x16u);
}

- (void)relinquishExtensionInstance:(uint64_t)a3 reason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  __int16 v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  id v12 = @"PFPosterExtensionProvider.m";
  __int16 v13 = 1024;
  int v14 = 477;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end