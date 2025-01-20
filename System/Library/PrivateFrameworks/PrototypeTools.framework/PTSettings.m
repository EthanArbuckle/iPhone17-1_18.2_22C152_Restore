@interface PTSettings
+ (BOOL)_supportsArchivingCustomClass:(Class)a3;
+ (BOOL)_supportsArchivingStructType:(id)a3;
+ (BOOL)ignoresKey:(id)a3;
+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4;
+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4;
+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4;
+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4;
+ (id)emptyArchiveForSettingsClassName:(id)a3;
+ (id)settingsControllerModule;
+ (id)settingsFromArchiveDictionary:(id)a3;
+ (unint64_t)settingsVersionNumber;
+ (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 toArchive:(id)a5;
- (BOOL)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)_applyArchiveValue:(id)a3 forLeafKey:(id)a4 error:(id *)a5;
- (BOOL)_getChild:(id *)a3 create:(BOOL)a4 leafKey:(id *)a5 forKeyPath:(id)a6 error:(id *)a7;
- (BOOL)_hasKeyPathObservers;
- (BOOL)_hasObservers;
- (BOOL)suppressesIntrospectionOnCustomerInstalls;
- (PTSettings)initWithDefaultValues;
- (id)_allChildAndLeafKeys;
- (id)_archiveValueForKeyPath:(id)a3;
- (id)_archiveValueForLeafKey:(id)a3;
- (id)_createChildForKey:(id)a3;
- (id)_ensureChildForKey:(id)a3;
- (id)_initWithArchiveDictionary:(id)a3;
- (id)_initWithClassStructure:(id)a3;
- (id)_keyForChild:(id)a3;
- (id)archiveDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)drillDownSummary;
- (id)module;
- (void)_applyArchiveDictionary:(id)a3;
- (void)_createChildren;
- (void)_createChildrenAndOutlets;
- (void)_createOutlets;
- (void)_enumerateChildrenWithBlock:(id)a3;
- (void)_enumerateLeafValuesWithBlock:(id)a3;
- (void)_enumerateOutletsWithBlock:(id)a3;
- (void)_safeSetValue:(id)a3 forLeafKey:(id)a4;
- (void)_sendDidRestoreDefaults;
- (void)_sendKeyChanged:(id)a3;
- (void)_sendKeyPathChanged:(id)a3;
- (void)_sendWillRestoreDefaults;
- (void)_setObservationEnabled:(BOOL)a3;
- (void)_setRestoreDefaultsObserver:(id)a3;
- (void)_startObservingChildren;
- (void)_startObservingProperties;
- (void)_startOrStopObservingPropertiesAndChildren;
- (void)_stopObservingChildren;
- (void)_stopObservingProperties;
- (void)_validateChildren;
- (void)addKeyObserver:(id)a3;
- (void)addKeyPathObserver:(id)a3;
- (void)applyArchiveValue:(id)a3 forKey:(id)a4;
- (void)applySettings:(id)a3;
- (void)dealloc;
- (void)invalidateValueForKey:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeKeyObserver:(id)a3;
- (void)removeKeyPathObserver:(id)a3;
- (void)restoreDefaultValues;
- (void)restoreFromArchiveDictionary:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation PTSettings

- (void)_setObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (PTInstallIsAppleInternal() && self->__observationEnabled != v3)
  {
    v5 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      v7 = @"disabling";
      if (v3) {
        v7 = @"enabling";
      }
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      __int16 v13 = 2112;
      v14 = v7;
      id v8 = v6;
      _os_log_impl(&dword_1BEC4F000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ observation", buf, 0x16u);
    }
    self->__observationEnabled = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__PTSettings__setObservationEnabled___block_invoke;
    v9[3] = &__block_descriptor_33_e33_v24__0__NSString_8__PTSettings_16l;
    BOOL v10 = v3;
    [(PTSettings *)self _enumerateChildrenWithBlock:v9];
    [(PTSettings *)self _startOrStopObservingPropertiesAndChildren];
  }
}

- (void)addKeyPathObserver:(id)a3
{
  id v7 = a3;
  if (PTInstallIsAppleInternal())
  {
    keyPathObservers = self->__keyPathObservers;
    if (!keyPathObservers)
    {
      v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      v6 = self->__keyPathObservers;
      self->__keyPathObservers = v5;

      keyPathObservers = self->__keyPathObservers;
    }
    [(NSHashTable *)keyPathObservers addObject:v7];
    [(PTSettings *)self _startOrStopObservingPropertiesAndChildren];
  }
}

- (void)removeKeyObserver:(id)a3
{
  id v4 = a3;
  if (PTInstallIsAppleInternal())
  {
    [(NSHashTable *)self->__keyObservers removeObject:v4];
    [(PTSettings *)self _startOrStopObservingPropertiesAndChildren];
  }
}

- (void)addKeyObserver:(id)a3
{
  id v7 = a3;
  if (PTInstallIsAppleInternal())
  {
    keyObservers = self->__keyObservers;
    if (!keyObservers)
    {
      v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      v6 = self->__keyObservers;
      self->__keyObservers = v5;

      keyObservers = self->__keyObservers;
    }
    [(NSHashTable *)keyObservers addObject:v7];
    [(PTSettings *)self _startOrStopObservingPropertiesAndChildren];
  }
}

- (void)dealloc
{
  if (self->__isObservingProperties) {
    [(PTSettings *)self _stopObservingProperties];
  }
  if (self->__isObservingChildren) {
    [(PTSettings *)self _stopObservingChildren];
  }
  v3.receiver = self;
  v3.super_class = (Class)PTSettings;
  [(PTSettings *)&v3 dealloc];
}

- (id)_createChildForKey:(id)a3
{
  objc_super v3 = objc_msgSend(objc_alloc(-[PTSettingsClassStructure childClassForKey:](self->__classStructure, "childClassForKey:", a3)), "initWithDefaultValues");
  return v3;
}

- (PTSettings)initWithDefaultValues
{
  v10.receiver = self;
  v10.super_class = (Class)PTSettings;
  v2 = [(PTSettings *)&v10 init];
  if (v2)
  {
    int IsAppleInternal = PTInstallIsAppleInternal();
    BOOL v4 = [(PTSettings *)v2 suppressesIntrospectionOnCustomerInstalls];
    if (!v4 || IsAppleInternal != 0)
    {
      v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = +[PTSettingsClassStructure structureForSettingsClass:]((uint64_t)PTSettingsClassStructure, v6);
      classStructure = v2->__classStructure;
      v2->__classStructure = (PTSettingsClassStructure *)v7;
    }
    if (v4) {
      [(PTSettings *)v2 createChildren];
    }
    else {
      [(PTSettings *)v2 _createChildren];
    }
    if (IsAppleInternal)
    {
      [(PTSettings *)v2 _createOutlets];
      [(PTSettings *)v2 setDefaultValues];
      if (v4) {
        [(PTSettings *)v2 _validateChildren];
      }
    }
    else
    {
      [(PTSettings *)v2 setDefaultValues];
    }
  }
  return v2;
}

- (BOOL)suppressesIntrospectionOnCustomerInstalls
{
  return 0;
}

- (void)_createChildren
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C1899760]();
        id v10 = [(PTSettings *)self _ensureChildForKey:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__restoreDefaultsObserver);
  objc_storeStrong((id *)&self->__keyPathObservers, 0);
  objc_storeStrong((id *)&self->__keyObservers, 0);
  objc_storeStrong((id *)&self->__classStructure, 0);
}

- (id)_ensureChildForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTSettings *)self valueForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [(PTSettings *)self _createChildForKey:v4];
    [(PTSettings *)self setValue:v5 forKey:v4];
  }

  return v5;
}

+ (BOOL)ignoresKey:(id)a3
{
  return 0;
}

+ (unint64_t)settingsVersionNumber
{
  return 0;
}

- (id)_initWithClassStructure:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTSettings;
  uint64_t v6 = [(PTSettings *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__classStructure, a3);
  }

  return v7;
}

- (void)_createChildrenAndOutlets
{
  [(PTSettings *)self _createChildren];
  [(PTSettings *)self _createOutlets];
}

- (void)_createOutlets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(PTSettingsClassStructure *)self->__classStructure outletKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [[PTOutlet alloc] _init];
        [(PTSettings *)self setValue:v9 forKey:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_validateChildren
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(PTSettings *)self valueForKey:v8];

        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:@"Child not initialized", @"Child with key %@ has not been initialized.", v8 format];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_initWithArchiveDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTSettings *)self initWithDefaultValues];
  uint64_t v6 = v5;
  if (v5) {
    [(PTSettings *)v5 _applyArchiveDictionary:v4];
  }

  return v6;
}

- (void)_applyArchiveDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412546;
    long long v21 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v12 = objc_msgSend(v4, "objectForKey:", v11, v21);
        long long v13 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
        int v14 = [v13 containsObject:v11];

        if (v14)
        {
          objc_opt_class();
          objc_opt_class();
          if (PTValidateDictionary(v12))
          {
            uint64_t v15 = [(PTSettings *)self _ensureChildForKey:v11];
            [v15 _applyArchiveDictionary:v12];
          }
          else
          {
            v18 = PTLogObjectForTopic(0);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_opt_class();
              *(_DWORD *)buf = v21;
              uint64_t v27 = v11;
              __int16 v28 = 2112;
              v29 = v19;
              id v20 = v19;
              _os_log_impl(&dword_1BEC4F000, v18, OS_LOG_TYPE_DEFAULT, "PTSettings can't apply archive for child settings key %@ (expected NSDictionary, found %@)", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v16 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
          int v17 = [v16 containsObject:v11];

          if (v17) {
            [(PTSettings *)self applyArchiveValue:v12 forKey:v11];
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 applySettings:self];
  return v4;
}

+ (id)settingsFromArchiveDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"_internal_class"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  long long v7 = v6;

  if (v7) {
    Class v8 = NSClassFromString(v7);
  }
  else {
    Class v8 = 0;
  }
  if ([(objc_class *)v8 isSubclassOfClass:a1]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (objc_class *)a1;
  }
  long long v10 = (void *)[[v9 alloc] _initWithArchiveDictionary:v4];

  return v10;
}

- (id)archiveDictionary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PTSettingsClassStructure *)self->__classStructure settingsClassName];
  [v3 setObject:v4 forKey:@"_internal_class"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(PTSettings *)self _allChildAndLeafKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
        int v13 = [v12 containsObject:v11];

        if (v13)
        {
          int v14 = [(PTSettings *)self valueForKey:v11];
          uint64_t v15 = [v14 archiveDictionary];

          if (!v15) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v15 = [(PTSettings *)self archiveValueForKey:v11];
          if (!v15) {
            goto LABEL_15;
          }
        }
        if (PTObjectIsRecursivelyPlistable(v15))
        {
          [v3 setObject:v15 forKey:v11];
        }
        else
        {
          uint64_t v16 = PTLogObjectForTopic(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v11;
            __int16 v25 = 2112;
            v26 = v15;
            _os_log_impl(&dword_1BEC4F000, v16, OS_LOG_TYPE_DEFAULT, "PTSettings cannot use archive value for property %@ as it contains non-plist types: %@", buf, 0x16u);
          }
        }
LABEL_15:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)restoreDefaultValues
{
  [(PTSettings *)self _sendWillRestoreDefaults];
  id v3 = (id)[objc_alloc((Class)objc_opt_class()) initWithDefaultValues];
  [(PTSettings *)self applySettings:v3];
  [(PTSettings *)self _sendDidRestoreDefaults];
}

- (void)restoreFromArchiveDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() settingsFromArchiveDictionary:v4];

  [(PTSettings *)self applySettings:v5];
}

- (void)applySettings:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v4 valueForKey:v10];
        long long v12 = [(PTSettings *)self _ensureChildForKey:v10];
        [v12 applySettings:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v13 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        long long v19 = [v4 valueForKey:v18];
        [(PTSettings *)self _safeSetValue:v19 forLeafKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
}

- (void)_safeSetValue:(id)a3 forLeafKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(PTSettingsClassStructure *)self->__classStructure leafClassForKey:v6];
  uint64_t v8 = [(PTSettingsClassStructure *)self->__classStructure leafStructNameForKey:v6];
  uint64_t v9 = (void *)v8;
  if (!v7)
  {
    objc_opt_class();
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
  }
  [(PTSettings *)self setValue:v10 forKey:v6];
LABEL_7:
}

- (void)removeKeyPathObserver:(id)a3
{
  id v4 = a3;
  if (PTInstallIsAppleInternal())
  {
    [(NSHashTable *)self->__keyPathObservers removeObject:v4];
    [(PTSettings *)self _startOrStopObservingPropertiesAndChildren];
  }
}

- (void)invalidateValueForKey:(id)a3
{
  id v4 = a3;
  [(PTSettings *)self _sendKeyChanged:v4];
  [(PTSettings *)self _sendKeyPathChanged:v4];
}

- (id)module
{
  v2 = [(id)objc_opt_class() settingsControllerModule];
  id v3 = (void *)[v2 copy];

  return v3;
}

+ (id)settingsControllerModule
{
  return 0;
}

- (id)drillDownSummary
{
  return 0;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v12 = 0;
  BOOL v7 = [(PTSettings *)self _applyArchiveValue:a3 forLeafKey:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    uint64_t v9 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      id v11 = v10;
      _os_log_impl(&dword_1BEC4F000, v9, OS_LOG_TYPE_DEFAULT, "%@ cannot apply archive value for key '%@': %@", buf, 0x20u);
    }
  }
}

+ (BOOL)_supportsArchivingCustomClass:(Class)a3
{
  return 0;
}

+ (BOOL)_supportsArchivingStructType:(id)a3
{
  return 0;
}

+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4
{
  return 0;
}

+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4
{
  return 0;
}

+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4
{
  return 0;
}

+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4
{
  return 0;
}

uint64_t __37__PTSettings__setObservationEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _setObservationEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_setRestoreDefaultsObserver:(id)a3
{
}

- (BOOL)_hasObservers
{
  return [(NSHashTable *)self->__keyObservers count]
      || [(NSHashTable *)self->__keyPathObservers count] != 0;
}

- (BOOL)_hasKeyPathObservers
{
  return [(NSHashTable *)self->__keyPathObservers count] != 0;
}

- (void)_startOrStopObservingPropertiesAndChildren
{
  if (!self->__observationEnabled)
  {
LABEL_11:
    BOOL v5 = 0;
LABEL_12:
    if (self->__isObservingProperties)
    {
      [(PTSettings *)self _stopObservingProperties];
      if (v5) {
        goto LABEL_14;
      }
    }
    else if (v5)
    {
      goto LABEL_14;
    }
LABEL_19:
    if (self->__isObservingChildren)
    {
      [(PTSettings *)self _stopObservingChildren];
    }
    return;
  }
  BOOL v3 = [(PTSettings *)self _hasObservers];
  BOOL v4 = v3;
  if (!self->__observationEnabled)
  {
    if (v3)
    {
      if (!self->__isObservingProperties) {
        [(PTSettings *)self _startObservingProperties];
      }
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  BOOL v5 = [(PTSettings *)self _hasKeyPathObservers];
  if (!v4) {
    goto LABEL_12;
  }
  if (!self->__isObservingProperties) {
    [(PTSettings *)self _startObservingProperties];
  }
  if (!v5) {
    goto LABEL_19;
  }
LABEL_14:
  if (!self->__isObservingChildren)
  {
    [(PTSettings *)self _startObservingChildren];
  }
}

- (void)_startObservingProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->__isObservingProperties = 1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(PTSettings *)self _allChildAndLeafKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(PTSettings *)self addObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) options:3 context:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_stopObservingProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->__isObservingProperties = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(PTSettings *)self _allChildAndLeafKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(PTSettings *)self removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) context:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_startObservingChildren
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->__isObservingChildren = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = [(PTSettings *)self valueForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v8 addKeyPathObserver:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_stopObservingChildren
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->__isObservingChildren = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = [(PTSettings *)self valueForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v8 removeKeyPathObserver:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_allChildAndLeafKeys
{
  BOOL v3 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v4 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (BOOL)_applyArchiveValue:(id)a3 forLeafKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  char v11 = [v10 containsObject:v9];

  if (v11)
  {
    long long v12 = [(PTSettingsClassStructure *)self->__classStructure leafClassForKey:v9];
    uint64_t v13 = [(PTSettingsClassStructure *)self->__classStructure leafStructNameForKey:v9];
    uint64_t v14 = (void *)v13;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [(id)objc_opt_class() _supportsArchivingCustomClass:v12])
      {
        __int16 v15 = [(id)objc_opt_class() _objectOfCustomClass:v12 fromArchiveDictionary:v8];
        [(PTSettings *)self setValue:v15 forKey:v9];

LABEL_22:
        BOOL v16 = 1;
        goto LABEL_29;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          __int16 v17 = NSString;
          uint64_t v18 = objc_opt_class();
          long long v22 = v12;
LABEL_18:
          [v17 stringWithFormat:@"don't know how to convert %@ to %@", v18, v22];
LABEL_19:
          BOOL v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(id)objc_opt_class() _supportsArchivingStructType:v14])
        {
          uint64_t v19 = [(id)objc_opt_class() _valueOfStructType:v14 fromArchiveDictionary:v8];
          BOOL v16 = v19 != 0;
          if (v19)
          {
            [(PTSettings *)self setValue:v19 forKey:v9];
          }
          else if (a5)
          {
            *a5 = [NSString stringWithFormat:@"failed to create struct %@ from %@", v14, v8];
          }

          goto LABEL_29;
        }
        if (a5)
        {
          __int16 v17 = NSString;
          uint64_t v18 = objc_opt_class();
          long long v22 = (objc_class *)v14;
          goto LABEL_18;
        }
LABEL_25:
        BOOL v16 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          [NSString stringWithFormat:@"don't know how to convert %@ to scalar", objc_opt_class(), v21];
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
    [(PTSettings *)self setValue:v8 forKey:v9];
    goto LABEL_22;
  }
  BOOL v16 = 0;
  if (a5) {
    *a5 = @"no such leaf key";
  }
LABEL_30:

  return v16;
}

- (id)_archiveValueForLeafKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [(PTSettings *)self valueForKey:v4];
    id v8 = [(PTSettingsClassStructure *)self->__classStructure leafClassForKey:v4];
    id v9 = [(PTSettingsClassStructure *)self->__classStructure leafStructNameForKey:v4];
    if (v8 && [(id)objc_opt_class() _supportsArchivingCustomClass:v8])
    {
      id v10 = [(id)objc_opt_class() _archiveDictionaryForObject:v7 ofCustomClass:v8];
    }
    else if (v9 && [(id)objc_opt_class() _supportsArchivingStructType:v9])
    {
      id v10 = [(id)objc_opt_class() _archiveDictionaryForValue:v7 ofStructType:v9];
    }
    else
    {
      id v10 = v7;
    }
    char v11 = v10;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_enumerateLeafValuesWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PTSettings__enumerateLeafValuesWithBlock___block_invoke;
  v7[3] = &unk_1E63BC8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __44__PTSettings__enumerateLeafValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  if (!v3)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA98] null];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateChildrenWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PTSettings__enumerateChildrenWithBlock___block_invoke;
  v7[3] = &unk_1E63BC8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __42__PTSettings__enumerateChildrenWithBlock___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateOutletsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PTSettingsClassStructure *)self->__classStructure outletKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PTSettings__enumerateOutletsWithBlock___block_invoke;
  v7[3] = &unk_1E63BC8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __41__PTSettings__enumerateOutletsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_getChild:(id *)a3 create:(BOOL)a4 leafKey:(id *)a5 forKeyPath:(id)a6 error:(id *)a7
{
  uint64_t v9 = a4;
  id v12 = a6;
  uint64_t v13 = [v12 rangeOfString:@"."];
  if (v14)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    long long v26 = a3;
    __int16 v17 = a5;
    id v18 = [v12 substringToIndex:v13];
    uint64_t v19 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
    int v20 = [v19 containsObject:v18];

    if (v20)
    {
      if (v9) {
        [(PTSettings *)self _ensureChildForKey:v18];
      }
      else {
      long long v23 = [(PTSettings *)self valueForKey:v18];
      }
      long long v24 = [v12 substringFromIndex:v15 + v16];
      LOBYTE(v9) = [v23 _getChild:v26 create:v9 leafKey:v17 forKeyPath:v24 error:a7];

      goto LABEL_18;
    }
    if (!a7)
    {
      LOBYTE(v9) = 0;
      goto LABEL_18;
    }
    id v22 = [NSString stringWithFormat:@"%@ has no child for key '%@'", objc_opt_class(), v18];
    LOBYTE(v9) = 0;
LABEL_14:
    *a7 = v22;
    goto LABEL_18;
  }
  id v18 = v12;
  uint64_t v21 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
  LODWORD(v9) = [v21 containsObject:v18];

  if (!v9)
  {
    if (!a7) {
      goto LABEL_18;
    }
    id v22 = [NSString stringWithFormat:@"%@ has no leaf key '%@'", objc_opt_class(), v18];
    goto LABEL_14;
  }
  if (a3) {
    *a3 = self;
  }
  if (a5)
  {
    id v18 = v18;
    *a5 = v18;
  }
LABEL_18:

  return v9;
}

- (BOOL)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v26 = 0;
  id v27 = 0;
  id v25 = 0;
  BOOL v10 = [(PTSettings *)self _getChild:&v27 create:1 leafKey:&v26 forKeyPath:v9 error:&v25];
  char v11 = (PTSettings *)v27;
  id v12 = v26;
  id v13 = v25;
  uint64_t v14 = v13;
  if (!v10)
  {
    if (!a5)
    {
      BOOL v17 = 0;
      id v16 = v13;
      goto LABEL_14;
    }
    id v18 = [NSString stringWithFormat:@"%@ can't apply value for keyPath '%@' (%@)", objc_opt_class(), v9, v13];
    id v16 = v14;
LABEL_13:
    BOOL v17 = 0;
    *a5 = v18;
    goto LABEL_14;
  }
  id v24 = v13;
  BOOL v15 = [(PTSettings *)v11 _applyArchiveValue:v8 forLeafKey:v12 error:&v24];
  id v16 = v24;

  if (!v15)
  {
    if (!a5)
    {
      BOOL v17 = 0;
      goto LABEL_14;
    }
    uint64_t v19 = NSString;
    uint64_t v20 = objc_opt_class();
    if (v11 == self) {
      [v19 stringWithFormat:@"%@ can't apply value for key '%@' (%@)", v20, v9, v16, v22, v23];
    }
    else {
    id v18 = [v19 stringWithFormat:@"%@ can't apply value for keyPath '%@' because %@ can't apply value for key '%@' (%@)", v20, v9, objc_opt_class(), v12, v16];
    }
    goto LABEL_13;
  }
  BOOL v17 = 1;
LABEL_14:

  return v17;
}

- (id)_archiveValueForKeyPath:(id)a3
{
  id v8 = 0;
  id v9 = 0;
  BOOL v3 = [(PTSettings *)self _getChild:&v9 create:0 leafKey:&v8 forKeyPath:a3 error:0];
  id v4 = v9;
  id v5 = v8;
  id v6 = 0;
  if (v3)
  {
    id v6 = [v4 _archiveValueForLeafKey:v5];
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v16 = a3;
  uint64_t v8 = *MEMORY[0x1E4F284E0];
  id v9 = a5;
  BOOL v10 = [v9 objectForKey:v8];
  char v11 = [v9 objectForKey:*MEMORY[0x1E4F284C8]];

  if (v10 != v11)
  {
    id v12 = [(PTSettingsClassStructure *)self->__classStructure leafKeys];
    int v13 = [v12 containsObject:v16];

    uint64_t v14 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
    int v15 = [v14 containsObject:v16];

    if (v13 && ([v10 isEqual:v11] & 1) == 0)
    {
      [(PTSettings *)self _sendKeyChanged:v16];
      [(PTSettings *)self _sendKeyPathChanged:v16];
    }
    if (v15 && self->__isObservingChildren)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 removeKeyPathObserver:self];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v11 addKeyPathObserver:self];
      }
    }
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v8 = a4;
  id v6 = [(PTSettings *)self _keyForChild:a3];
  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.%@", v6, v8];
    [(PTSettings *)self _sendKeyPathChanged:v7];
  }
}

- (id)_keyForChild:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(PTSettingsClassStructure *)self->__classStructure childKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(PTSettings *)self valueForKey:v10];

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_sendKeyChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->__keyObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "settings:changedValueForKey:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_sendKeyPathChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->__keyPathObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "settings:changedValueForKeyPath:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_sendWillRestoreDefaults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__restoreDefaultsObserver);
  [WeakRetained settingsWillRestoreDefaults:self];
}

- (void)_sendDidRestoreDefaults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__restoreDefaultsObserver);
  [WeakRetained settingsDidRestoreDefaults:self];
}

+ (id)emptyArchiveForSettingsClassName:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  [v5 setObject:v4 forKey:@"_internal_class"];

  return v5;
}

+ (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 toArchive:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && (PTObjectIsRecursivelyPlistable(v7) & 1) == 0)
  {
    long long v10 = PTLogObjectForTopic(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1BEC4F000, v10, OS_LOG_TYPE_DEFAULT, "PTSettings cannot use archive value for keyPath '%@' as it contains non-plist types: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    long long v10 = [v8 componentsSeparatedByString:@"."];
    uint64_t v11 = [v10 count];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = v9;
      long long v14 = v13;
      uint64_t v15 = v12 - 1;
      if (v12 == 1)
      {
        id v18 = v13;
      }
      else
      {
        uint64_t v16 = 0;
        do
        {
          long long v17 = [v10 objectAtIndexedSubscript:v16];
          id v18 = [v14 objectForKeyedSubscript:v17];
          if (!v18)
          {
            id v18 = [MEMORY[0x1E4F1CA60] dictionary];
            [v14 setObject:v18 forKeyedSubscript:v17];
          }

          ++v16;
          long long v14 = v18;
        }
        while (v15 != v16);
      }
      uint64_t v19 = [v10 lastObject];
      [v18 setObject:v7 forKeyedSubscript:v19];
    }
  }
}

@end