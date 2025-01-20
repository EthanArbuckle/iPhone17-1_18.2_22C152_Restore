@interface NTKComplicationProvider
+ (id)providerForDevice:(id)a3;
- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4;
- (CLKDevice)device;
- (NSIndexSet)disabledComplicationTypes;
- (NTKComplicationProvider)initWithDevice:(id)a3;
- (id)_bundleComplicationsWithOptions:(id)a3;
- (id)_dateComplicationsWithOptions:(id)a3;
- (id)_remoteComplicationsWithOptions:(id)a3;
- (id)_widgetComplicationsWithOptions:(id)a3;
- (id)complicationsOfType:(unint64_t)a3 withOptions:(id)a4;
- (id)complicationsWithOptions:(id)a3;
- (void)_handleAvailableComplicationsChange;
- (void)_resetDisabledTypes;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NTKComplicationProvider

+ (id)providerForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&providerForDevice__lock);
  os_unfair_lock_lock((os_unfair_lock_t)&providerForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&providerForDevice____cachedDevice);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&providerForDevice____cachedDevice);
    if (v6 == v3)
    {
      uint64_t v7 = [v3 version];
      uint64_t v8 = providerForDevice____previousCLKDeviceVersion;

      if (v7 == v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&providerForDevice____cachedDevice, v3);
  providerForDevice____previousCLKDeviceVersion = [v3 version];

  __45__NTKComplicationProvider_providerForDevice___block_invoke(v10, v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&providerForDevice____lock);
  id v11 = (id)providerForDevice____provider;
  os_unfair_lock_unlock((os_unfair_lock_t)&providerForDevice__lock);

  return v11;
}

void __45__NTKComplicationProvider_providerForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[NTKComplicationProvider alloc] initWithDevice:v2];

  v4 = (void *)providerForDevice____provider;
  providerForDevice____provider = (uint64_t)v3;
}

- (NTKComplicationProvider)initWithDevice:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKComplicationProvider;
  id v6 = [(NTKComplicationProvider *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v8;

    objc_storeStrong((id *)&v7->_device, a3);
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__resetDisabledTypes name:@"NTKSystemAppStateChangedNotification" object:0];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__handleAvailableComplicationsChange name:@"NTKRemoteComplicationProviderComplicationsDidChange" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__handleAvailableComplicationsChange name:@"NTKWidgetComplicationProviderComplicationsDidChange" object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel__handleAvailableComplicationsChange name:@"NTKComplicationDidChangeNotification" object:0];
  }
  return v7;
}

- (void)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)complicationsWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKComplicationProvider *)self disabledComplicationTypes];
  id v6 = objc_opt_new();
  if (([v4 includeDisabledTypes] & 1) == 0)
  {
    uint64_t v7 = [v4 allowedComplicationTypes];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 removeIndexes:v5];
    id v9 = (void *)[v4 copy];

    [v9 setAllowedComplicationTypes:v8];
    id v4 = v9;
  }
  uint64_t v10 = [v4 allowedComplicationTypes];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__NTKComplicationProvider_complicationsWithOptions___block_invoke;
  v16[3] = &unk_1E62C58A8;
  v16[4] = self;
  id v17 = v4;
  id v11 = v6;
  id v18 = v11;
  id v12 = v4;
  [v10 enumerateIndexesUsingBlock:v16];

  v13 = v18;
  id v14 = v11;

  return v14;
}

void __52__NTKComplicationProvider_complicationsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) complicationsOfType:a2 withOptions:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObjectsFromArray:v3];
}

- (id)complicationsOfType:(unint64_t)a3 withOptions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  if ((uint64_t)a3 <= 30)
  {
    if (!a3)
    {
      uint64_t v10 = +[NTKComplication nullComplication];
      [v7 addObject:v10];
      goto LABEL_17;
    }
    if (a3 == 1)
    {
      id v9 = [(NTKComplicationProvider *)self _dateComplicationsWithOptions:v6];
      [v7 addObjectsFromArray:v9];

      if (([v6 allowGenericDateComplication] & 1) == 0) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1FuLL:
        uint64_t v8 = [(NTKComplicationProvider *)self _remoteComplicationsWithOptions:v6];
        goto LABEL_11;
      case 0x30uLL:
        id v11 = [(NTKComplicationProvider *)self _bundleComplicationsWithOptions:v6];
        [v7 addObjectsFromArray:v11];

        break;
      case 0x38uLL:
        uint64_t v8 = [(NTKComplicationProvider *)self _widgetComplicationsWithOptions:v6];
LABEL_11:
        uint64_t v10 = (void *)v8;
        [v7 addObjectsFromArray:v8];
LABEL_17:

LABEL_18:
        id v15 = v7;
        goto LABEL_19;
    }
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v12 = [v6 rankedFamilies];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__NTKComplicationProvider_complicationsOfType_withOptions___block_invoke;
  v17[3] = &unk_1E62C5DB0;
  v17[5] = &v18;
  v17[6] = a3;
  v17[4] = self;
  [v12 enumerateObjectsUsingBlock:v17];

  if (*((unsigned char *)v19 + 24))
  {
    v13 = +[NTKComplication allComplicationsOfType:a3];
    [v7 addObjectsFromArray:v13];
  }
  id v14 = v7;
  _Block_object_dispose(&v18, 8);
LABEL_19:

  return v7;
}

void __59__NTKComplicationProvider_complicationsOfType_withOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 unsignedIntegerValue];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 32) device];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[NTKComplicationController controllerClassForComplicationType:v7 family:v6 forDevice:v8] != 0;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)_dateComplicationsWithOptions:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  uint64_t v6 = [v4 supportedDateStyles];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__NTKComplicationProvider__dateComplicationsWithOptions___block_invoke;
  v9[3] = &unk_1E62C5DD8;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __57__NTKComplicationProvider__dateComplicationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = +[NTKDateComplication complicationWithDateStyle:v3];
  [v4 addObject:v5];
}

- (id)_remoteComplicationsWithOptions:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  uint64_t v6 = [v4 rankedFamilies];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke;
  v9[3] = &unk_1E62C5DD8;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_2;
  id v9 = &unk_1E62C5E28;
  uint64_t v11 = v3;
  id v10 = *(id *)(a1 + 32);
  id v4 = _Block_copy(&v6);
  id v5 = NTKSharedRemoteComplicationProvider();
  objc_msgSend(v5, "enumerateEnabledVendorsForComplicationFamily:withBlock:", v3, v4, v6, v7, v8, v9);
}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NTKSharedRemoteComplicationProvider();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_3;
  v11[3] = &unk_1E62C5E00;
  id v12 = v5;
  id v13 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateComplicationDescriptorsForClientIdentifier:v10 family:v8 withBlock:v11];
}

void __59__NTKComplicationProvider__remoteComplicationsWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = +[NTKRemoteComplication complicationWithClientIdentifier:*(void *)(a1 + 32) appBundleIdentifier:*(void *)(a1 + 40) complicationDescriptor:a2];
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (id)_bundleComplicationsWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke;
  aBlock[3] = &unk_1E62C5E50;
  id v7 = v6;
  id v17 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = [v5 rankedFamilies];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke_2;
  v14[3] = &unk_1E62C5E78;
  v14[4] = self;
  id v15 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v7;

  return v12;
}

void __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (!a4 && (![v8 length] || (NTKIsSystemAppRestrictedOrRemoved(v9) & 1) == 0))
  {
    id v10 = +[NTKBundleComplicationManager sharedManager];
    uint64_t v11 = [v10 bundleComplicationsForBundleIdentifier:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = +[NTKBundleComplication bundledComplicationWithComplication:](NTKBundleComplication, "bundledComplicationWithComplication:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
          if (([*(id *)(a1 + 32) containsObject:v17] & 1) == 0) {
            [*(id *)(a1 + 32) addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

void __59__NTKComplicationProvider__bundleComplicationsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  id v5 = +[NTKBundleComplicationManager sharedManager];
  id v4 = [*(id *)(a1 + 32) device];
  [v5 enumerateBundlesForComplicationFamily:v3 device:v4 withBlock:*(void *)(a1 + 40)];
}

- (id)_widgetComplicationsWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  id v7 = [(NTKComplicationProvider *)self device];
  id v8 = NTKSharedWidgetComplicationProvider((uint64_t)v7);
  id v9 = [v5 rankedFamilies];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__NTKComplicationProvider__widgetComplicationsWithOptions___block_invoke;
  v13[3] = &unk_1E62C5EA0;
  id v14 = v6;
  id v10 = v6;
  [v8 enumerateDescriptorsCompatibleWithFamilies:v9 withBlock:v13];

  uint64_t v11 = (void *)[v10 copy];

  return v11;
}

void __59__NTKComplicationProvider__widgetComplicationsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[NTKWidgetComplication complicationWithDescriptor:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (NSIndexSet)disabledComplicationTypes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  if (!lock_disabledComplicationTypes)
  {
    id v5 = +[NTKCompanionAppLibrary sharedAppLibrary];
    id v6 = [v5 disabledComplicationTypes];
    id v7 = self->_lock_disabledComplicationTypes;
    self->_lock_disabledComplicationTypes = v6;

    lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  }
  id v8 = (void *)[(NSIndexSet *)lock_disabledComplicationTypes copy];
  os_unfair_lock_unlock(p_lock);

  return (NSIndexSet *)v8;
}

- (void)_resetDisabledTypes
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  self->_lock_disabledComplicationTypes = 0;

  id v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__NTKComplicationProvider__resetDisabledTypes__block_invoke;
  v5[3] = &unk_1E62C5EC8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  [(NTKComplicationProvider *)self _handleAvailableComplicationsChange];
}

void __46__NTKComplicationProvider__resetDisabledTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 complicationProviderUpdatedDisabledComplicationTypes:*(void *)(a1 + 32)];
  }
}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v11 = v6;
    id v12 = NTKSharedRemoteComplicationProvider();
    LOBYTE(self) = [v12 isComplicationAvailable:v11 forFamilies:v7];

LABEL_5:
    goto LABEL_6;
  }
  if (v9)
  {
    id v13 = v6;
    id v12 = [(NTKComplicationProvider *)self device];
    id v14 = NTKSharedWidgetComplicationProvider((uint64_t)v12);
    LOBYTE(self) = [v14 isComplicationAvailable:v13 forFamilies:v7];

    goto LABEL_5;
  }
  if (v10)
  {
    uint64_t v16 = [v6 complication];
    id v17 = [v16 appBundleIdentifier];

    if ([v17 length]) {
      LODWORD(self) = NTKIsSystemAppRestrictedOrRemoved(v17) ^ 1;
    }
    else {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    self = [(NTKComplicationProvider *)self disabledComplicationTypes];
    char v18 = -[NTKComplicationProvider containsIndex:](self, "containsIndex:", [v6 complicationType]);

    LOBYTE(self) = v18 ^ 1;
  }
LABEL_6:

  return (char)self;
}

- (void)_handleAvailableComplicationsChange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_disabledComplicationTypes = self->_lock_disabledComplicationTypes;
  self->_lock_disabledComplicationTypes = 0;

  id v5 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NTKComplicationProvider__handleAvailableComplicationsChange__block_invoke;
  v6[3] = &unk_1E62C5EC8;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __62__NTKComplicationProvider__handleAvailableComplicationsChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 complicationProviderComplicationsDidChange:*(void *)(a1 + 32)];
  }
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lock_disabledComplicationTypes, 0);

  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end