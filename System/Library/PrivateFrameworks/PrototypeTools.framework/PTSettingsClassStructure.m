@interface PTSettingsClassStructure
+ (BOOL)supportsSecureCoding;
+ (PTSettingsClassStructure)structureForSettingsClass:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (Class)_classForKey:(id)a3;
- (NSSet)childKeys;
- (NSSet)leafKeys;
- (NSSet)outletKeys;
- (NSString)settingsClassName;
- (PTSettingsClassStructure)initWithCoder:(id)a3;
- (id)_decodeStringSetForKey:(id)a3 withCoder:(id)a4;
- (id)_decodeStringStringDictionaryForKey:(id)a3 withCoder:(id)a4;
- (id)filteredForProxySettings;
- (id)leafStructNameForKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)settingsClassVersion;
- (void)_generateClassNamesIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setChildKeys:(id)a3;
- (void)setLeafKeys:(id)a3;
- (void)setOutletKeys:(id)a3;
- (void)setSettingsClassName:(id)a3;
- (void)setSettingsClassVersion:(unint64_t)a3;
@end

@implementation PTSettingsClassStructure

+ (PTSettingsClassStructure)structureForSettingsClass:(uint64_t)a1
{
  self;
  if (structureForSettingsClass__onceToken != -1) {
    dispatch_once(&structureForSettingsClass__onceToken, &__block_literal_global_1);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&structureForSettingsClass____lock);
  v3 = [(id)structureForSettingsClass___classStructureCache objectForKey:a2];
  if (v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&structureForSettingsClass____lock);
    v4 = v3;
    goto LABEL_37;
  }
  v44 = [MEMORY[0x1E4F1CA80] set];
  v43 = [MEMORY[0x1E4F1CA80] set];
  v42 = [MEMORY[0x1E4F1CA80] set];
  v40 = [MEMORY[0x1E4F1CA60] dictionary];
  v41 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = objc_opt_class();
  aClass = a2;
  if ([(objc_class *)a2 isSubclassOfClass:v5] && (objc_class *)v5 != a2)
  {
    uint64_t v39 = v5;
    do
    {
      id v49 = v43;
      id v47 = v42;
      id v46 = v44;
      v48 = v40;
      v6 = v41;
      unsigned int outCount = 0;
      v7 = class_copyPropertyList(a2, &outCount);
      if (v7)
      {
        v8 = v7;
        v50 = a2;
        v45 = v6;
        if (_NSObjectProtocolProperties_onceToken != -1) {
          dispatch_once(&_NSObjectProtocolProperties_onceToken, &__block_literal_global_98);
        }
        id v9 = (id)_NSObjectProtocolProperties___properties;
        if (outCount)
        {
          uint64_t v10 = 0;
          while (1)
          {
            v11 = (void *)MEMORY[0x1C1899760]();
            v12 = v8[v10];
            Name = property_getName(v12);
            _NSStringFromRuntimeString(Name);
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            Attributes = property_getAttributes(v12);
            v16 = _NSStringFromRuntimeString(Attributes);
            v17 = [MEMORY[0x1E4F28FE8] scannerWithString:v16];
            v18 = 0;
            if ([v17 scanString:@"T@\"" intoString:0]
              && (id v53 = 0,
                  int v19 = [v17 scanUpToString:@"\"" intoString:&v53],
                  v20 = (NSString *)v53,
                  v18 = v20,
                  v19))
            {
              Class v21 = NSClassFromString(v20);
              id v22 = 0;
            }
            else
            {
              [v17 setScanLocation:0];
              v23 = 0;
              if ([v17 scanString:@"T{" intoString:0]
                && (id v52 = 0,
                    int v24 = [v17 scanUpToString:@"=" intoString:&v52],
                    id v25 = v52,
                    v23 = v25,
                    v24))
              {
                id v22 = v25;
                v23 = v22;
              }
              else
              {
                [v17 setScanLocation:0];
                id v22 = 0;
              }

              Class v21 = 0;
            }

            id v26 = v14;
            v27 = (objc_class *)v22;
            if (([v9 containsObject:v26] & 1) != 0
              || ([(objc_class *)v50 ignoresKey:v26] & 1) != 0)
            {
              goto LABEL_32;
            }
            char v28 = [(objc_class *)v21 isSubclassOfClass:objc_opt_class()];
            v29 = v49;
            if ((v28 & 1) == 0)
            {
              if ([(objc_class *)v21 isSubclassOfClass:objc_opt_class()]) {
                v29 = v47;
              }
              else {
                v29 = v46;
              }
            }
            [v29 addObject:v26];
            if (v21) {
              break;
            }
            if (v27)
            {
              v30 = v45;
              Class v31 = v27;
              goto LABEL_31;
            }
LABEL_32:

            if (++v10 >= (unint64_t)outCount) {
              goto LABEL_33;
            }
          }
          v30 = v48;
          Class v31 = v21;
LABEL_31:
          [(NSDictionary *)v30 setObject:v31 forKey:v26];
          goto LABEL_32;
        }
LABEL_33:
        free(v8);

        uint64_t v5 = v39;
        a2 = v50;
        v6 = v45;
      }

      a2 = (objc_class *)[(objc_class *)a2 superclass];
    }
    while ([(objc_class *)a2 isSubclassOfClass:v5] && a2 != (objc_class *)v5);
  }
  v4 = objc_alloc_init(PTSettingsClassStructure);
  v32 = NSStringFromClass(aClass);
  [(PTSettingsClassStructure *)v4 setSettingsClassName:v32];

  [(PTSettingsClassStructure *)v4 setSettingsClassVersion:[(objc_class *)aClass settingsVersionNumber]];
  [(PTSettingsClassStructure *)v4 setLeafKeys:v44];
  [(PTSettingsClassStructure *)v4 setChildKeys:v43];
  [(PTSettingsClassStructure *)v4 setOutletKeys:v42];
  classes = v4->_classes;
  v4->_classes = v40;
  v34 = v40;

  structNames = v4->_structNames;
  v4->_structNames = v41;
  v36 = v41;

  [(id)structureForSettingsClass___classStructureCache setObject:v4 forKey:aClass];
  os_unfair_lock_unlock((os_unfair_lock_t)&structureForSettingsClass____lock);

  v3 = 0;
LABEL_37:

  return v4;
}

- (NSSet)childKeys
{
  return self->_childKeys;
}

- (Class)_classForKey:(id)a3
{
  classes = self->_classes;
  if (classes)
  {
    uint64_t v5 = [(NSDictionary *)classes objectForKeyedSubscript:a3];
  }
  else
  {
    v6 = [(NSDictionary *)self->_classNames objectForKeyedSubscript:a3];
    uint64_t v5 = NSClassFromString(v6);
  }
  return (Class)v5;
}

- (void)setSettingsClassVersion:(unint64_t)a3
{
  self->_settingsClassVersion = a3;
}

- (void)setSettingsClassName:(id)a3
{
}

- (void)setOutletKeys:(id)a3
{
}

- (void)setLeafKeys:(id)a3
{
}

- (void)setChildKeys:(id)a3
{
}

uint64_t __54__PTSettingsClassStructure_structureForSettingsClass___block_invoke()
{
  structureForSettingsClass___classStructureCache = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  return MEMORY[0x1F41817F8]();
}

- (id)filteredForProxySettings
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(PTSettingsClassStructure *)self _generateClassNamesIfNecessary];
  id v26 = (void *)[(NSDictionary *)self->_classes mutableCopy];
  id v25 = (void *)[(NSDictionary *)self->_classNames mutableCopy];
  v3 = (void *)[(NSSet *)self->_leafKeys mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = self->_leafKeys;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [(PTSettingsClassStructure *)self leafStructNameForKey:v9];
        if (v10)
        {
          v11 = PTLogObjectForTopic(0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            settingsClassName = self->_settingsClassName;
            *(_DWORD *)buf = 138412802;
            v32 = settingsClassName;
            __int16 v33 = 2112;
            uint64_t v34 = v9;
            __int16 v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_1BEC4F000, v11, OS_LOG_TYPE_DEFAULT, "Proxy for %@ will omit key '%@', as %@ is a struct", buf, 0x20u);
          }

          [v3 removeObject:v9];
        }
        v13 = [(PTSettingsClassStructure *)self leafClassForKey:v9];
        if (v13)
        {
          id v14 = v13;
          if ((PTClassIsPlistable() & 1) == 0)
          {
            v15 = PTLogObjectForTopic(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = self->_settingsClassName;
              *(_DWORD *)buf = 138412802;
              v32 = v16;
              __int16 v33 = 2112;
              uint64_t v34 = v9;
              __int16 v35 = 2112;
              v36 = v14;
              _os_log_impl(&dword_1BEC4F000, v15, OS_LOG_TYPE_DEFAULT, "Proxy for %@ will omit key '%@', as %@ is not a plist type", buf, 0x20u);
            }

            [v3 removeObject:v9];
            [v26 setObject:0 forKeyedSubscript:v9];
            [v25 setObject:0 forKeyedSubscript:v9];
          }
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v6);
  }

  v17 = objc_alloc_init(PTSettingsClassStructure);
  [(PTSettingsClassStructure *)v17 setSettingsClassName:self->_settingsClassName];
  [(PTSettingsClassStructure *)v17 setSettingsClassVersion:self->_settingsClassVersion];
  [(PTSettingsClassStructure *)v17 setChildKeys:self->_childKeys];
  [(PTSettingsClassStructure *)v17 setOutletKeys:self->_outletKeys];
  v18 = (void *)[v3 copy];
  [(PTSettingsClassStructure *)v17 setLeafKeys:v18];

  uint64_t v19 = [v26 copy];
  classes = v17->_classes;
  v17->_classes = (NSDictionary *)v19;

  uint64_t v21 = [v25 copy];
  classNames = v17->_classNames;
  v17->_classNames = (NSDictionary *)v21;

  structNames = v17->_structNames;
  v17->_structNames = (NSDictionary *)MEMORY[0x1E4F1CC08];

  return v17;
}

- (id)leafStructNameForKey:(id)a3
{
  return [(NSDictionary *)self->_structNames objectForKeyedSubscript:a3];
}

- (void)_generateClassNamesIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_classNames)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = [(NSDictionary *)self->_classes allKeys];
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
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v10 = NSStringFromClass((Class)[(NSDictionary *)self->_classes objectForKeyedSubscript:v9]);
          [(NSDictionary *)v3 setObject:v10 forKeyedSubscript:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    classNames = self->_classNames;
    self->_classNames = v3;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTSettingsClassStructure *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    [(PTSettingsClassStructure *)self _generateClassNamesIfNecessary];
    if ([(PTSettingsClassStructure *)v4 isMemberOfClass:objc_opt_class()]
      && BSEqualStrings()
      && self->_settingsClassVersion == v4->_settingsClassVersion
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v5 = BSEqualObjects();
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  [(PTSettingsClassStructure *)self _generateClassNamesIfNecessary];
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_settingsClassName];
  id v5 = (id)[v3 appendUnsignedInteger:self->_settingsClassVersion];
  id v6 = (id)[v3 appendObject:self->_leafKeys];
  id v7 = (id)[v3 appendObject:self->_childKeys];
  id v8 = (id)[v3 appendObject:self->_outletKeys];
  id v9 = (id)[v3 appendObject:self->_classNames];
  id v10 = (id)[v3 appendObject:self->_structNames];
  unint64_t v11 = [v3 hash];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PTSettingsClassStructure *)self _generateClassNamesIfNecessary];
  [v4 encodeObject:self->_settingsClassName forKey:@"settingsClassName"];
  [v4 encodeInteger:self->_settingsClassVersion forKey:@"settingsClassVersion"];
  [v4 encodeObject:self->_leafKeys forKey:@"leafKeys"];
  [v4 encodeObject:self->_childKeys forKey:@"childKeys"];
  [v4 encodeObject:self->_outletKeys forKey:@"outletKeys"];
  [v4 encodeObject:self->_classNames forKey:@"classNames"];
  [v4 encodeObject:self->_structNames forKey:@"structNames"];
}

- (PTSettingsClassStructure)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PTSettingsClassStructure *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsClassName"];
    settingsClassName = v5->_settingsClassName;
    v5->_settingsClassName = (NSString *)v6;

    v5->_settingsClassVersion = [v4 decodeIntegerForKey:@"settingsClassVersion"];
    uint64_t v8 = [(PTSettingsClassStructure *)v5 _decodeStringSetForKey:@"leafKeys" withCoder:v4];
    leafKeys = v5->_leafKeys;
    v5->_leafKeys = (NSSet *)v8;

    uint64_t v10 = [(PTSettingsClassStructure *)v5 _decodeStringSetForKey:@"childKeys" withCoder:v4];
    childKeys = v5->_childKeys;
    v5->_childKeys = (NSSet *)v10;

    uint64_t v12 = [(PTSettingsClassStructure *)v5 _decodeStringSetForKey:@"outletKeys" withCoder:v4];
    outletKeys = v5->_outletKeys;
    v5->_outletKeys = (NSSet *)v12;

    uint64_t v14 = [(PTSettingsClassStructure *)v5 _decodeStringStringDictionaryForKey:@"structNames" withCoder:v4];
    structNames = v5->_structNames;
    v5->_structNames = (NSDictionary *)v14;

    uint64_t v16 = [(PTSettingsClassStructure *)v5 _decodeStringStringDictionaryForKey:@"classNames" withCoder:v4];
    classNames = v5->_classNames;
    v5->_classNames = (NSDictionary *)v16;
  }
  return v5;
}

- (id)_decodeStringStringDictionaryForKey:(id)a3 withCoder:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v6, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v7 decodeObjectOfClasses:v9 forKey:v5];

  objc_opt_class();
  objc_opt_class();
  if ((PTValidateDictionary(v10) & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28498], @"%@ expected [String:String] dictionary for '%@'; got %@",
  }
      objc_opt_class(),
      v5,
      v10);

  return v10;
}

- (id)_decodeStringSetForKey:(id)a3 withCoder:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v6, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v7 decodeObjectOfClasses:v9 forKey:v5];

  objc_opt_class();
  if ((PTValidateSet(v10) & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28498], @"%@ expected set of Strings for '%@'; got %@",
  }
      objc_opt_class(),
      v5,
      v10);

  return v10;
}

- (NSString)settingsClassName
{
  return self->_settingsClassName;
}

- (unint64_t)settingsClassVersion
{
  return self->_settingsClassVersion;
}

- (NSSet)leafKeys
{
  return self->_leafKeys;
}

- (NSSet)outletKeys
{
  return self->_outletKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outletKeys, 0);
  objc_storeStrong((id *)&self->_childKeys, 0);
  objc_storeStrong((id *)&self->_leafKeys, 0);
  objc_storeStrong((id *)&self->_settingsClassName, 0);
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_structNames, 0);
}

@end