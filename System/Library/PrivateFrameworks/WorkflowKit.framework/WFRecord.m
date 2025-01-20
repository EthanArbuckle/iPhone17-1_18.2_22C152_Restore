@interface WFRecord
+ (id)defaultPropertyValues;
+ (id)ignoredPropertyNames;
+ (id)propertiesForClass:(Class)a3;
+ (id)propertiesForClass:(Class)a3 walkingSuperclassesUntilReaching:(Class)a4;
+ (id)recordSubclassProperties;
- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4;
- (BOOL)saveProperties:(id)a3 toStorage:(id)a4 error:(id *)a5;
- (BOOL)writeToStorage:(id)a3 error:(id *)a4;
- (NSDictionary)allPropertiesByName;
- (NSMutableDictionary)lastFetchedValues;
- (NSMutableDictionary)lastSavedOrFetchedValues;
- (NSMutableSet)fetchedPropertyNames;
- (NSMutableSet)modifiedPropertyNames;
- (NSMutableSet)modifiedPropertyNamesSinceLastSave;
- (NSSet)allProperties;
- (NSSet)fetchedProperties;
- (NSSet)modifiedProperties;
- (NSSet)modifiedPropertiesSinceLastSave;
- (NSString)storageIdentifier;
- (WFRecord)init;
- (WFRecord)initWithStorage:(id)a3;
- (WFRecord)initWithStorage:(id)a3 properties:(id)a4;
- (WFRecord)initWithStorage:(id)a3 properties:(id)a4 settingDefaultValues:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithValues:(BOOL)a3;
- (void)dealloc;
- (void)enumerateSettablePropertiesWithBlock:(id)a3;
- (void)loadFromStorage:(id)a3;
- (void)loadFromStorage:(id)a3 properties:(id)a4;
- (void)markPropertyModifiedIfNecessary:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetModificationsForProperties:(id)a3 onlySinceLastSave:(BOOL)a4;
- (void)setDefaultPropertyValuesExceptFetched;
- (void)setStorageIdentifier:(id)a3;
- (void)setupPropertyObservation;
- (void)tearDownPropertyObservation;
@end

@implementation WFRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSavedOrFetchedValues, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyNamesSinceLastSave, 0);
  objc_storeStrong((id *)&self->_lastFetchedValues, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyNames, 0);
  objc_storeStrong((id *)&self->_fetchedPropertyNames, 0);
  objc_storeStrong((id *)&self->_allPropertiesByName, 0);
}

- (void)setStorageIdentifier:(id)a3
{
}

- (NSString)storageIdentifier
{
  return self->_storageIdentifier;
}

- (NSMutableDictionary)lastSavedOrFetchedValues
{
  return self->_lastSavedOrFetchedValues;
}

- (NSMutableSet)modifiedPropertyNamesSinceLastSave
{
  return self->_modifiedPropertyNamesSinceLastSave;
}

- (NSMutableDictionary)lastFetchedValues
{
  return self->_lastFetchedValues;
}

- (NSMutableSet)modifiedPropertyNames
{
  return self->_modifiedPropertyNames;
}

- (NSMutableSet)fetchedPropertyNames
{
  return self->_fetchedPropertyNames;
}

- (NSDictionary)allPropertiesByName
{
  return self->_allPropertiesByName;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFRecordPropertyObservationContext == a6)
  {
    -[WFRecord markPropertyModifiedIfNecessary:](self, "markPropertyModifiedIfNecessary:", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFRecord;
    -[WFRecord observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setDefaultPropertyValuesExceptFetched
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(NSDictionary *)self->_allPropertiesByName allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = [(WFRecord *)self fetchedPropertyNames];
        v10 = [v8 name];
        char v11 = [v9 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          v12 = [v8 name];
          v13 = objc_msgSend(v12, "if_stringByUppercasingFirstCharacter");
          v14 = [@"default" stringByAppendingString:v13];

          NSSelectorFromString(v14);
          objc_opt_class();
          if (objc_opt_respondsToSelector())
          {
            v15 = [(id)objc_opt_class() valueForKey:v14];
            v16 = [v8 name];
            [(WFRecord *)self setValue:v15 forKey:v16];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)tearDownPropertyObservation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__WFRecord_tearDownPropertyObservation__block_invoke;
  v2[3] = &unk_1E654FB68;
  v2[4] = self;
  [(WFRecord *)self enumerateSettablePropertiesWithBlock:v2];
}

void __39__WFRecord_tearDownPropertyObservation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 removeObserver:v2 forKeyPath:v3 context:WFRecordPropertyObservationContext];
}

- (void)setupPropertyObservation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__WFRecord_setupPropertyObservation__block_invoke;
  v2[3] = &unk_1E654FB68;
  v2[4] = self;
  [(WFRecord *)self enumerateSettablePropertiesWithBlock:v2];
}

void __36__WFRecord_setupPropertyObservation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObserver:v2 forKeyPath:v3 options:0 context:WFRecordPropertyObservationContext];
}

- (void)enumerateSettablePropertiesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSDictionary *)self->_allPropertiesByName allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        char v11 = (void *)MEMORY[0x1C87CA430]();
        v12 = [v10 setter];

        if (v12)
        {
          v13 = [v10 setter];
          v14 = NSSelectorFromString(v13);

          v15 = (objc_class *)objc_opt_class();
          if (class_getInstanceMethod(v15, v14)) {
            v4[2](v4, v10);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (BOOL)saveProperties:(id)a3 toStorage:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = +[WFRecord propertiesForClass:v8 walkingSuperclassesUntilReaching:objc_opt_class()];
    objc_opt_class();
    v38 = v9;
    v10 = v7;
    if (objc_opt_respondsToSelector())
    {
      char v11 = [(id)objc_opt_class() recordPropertyMap];
    }
    else
    {
      char v11 = 0;
    }
    v37 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v34 = v6;
    id obj = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v18 = (void *)MEMORY[0x1C87CA430]();
          long long v19 = [v17 name];
          long long v20 = [v11 objectForKeyedSubscript:v19];
          uint64_t v21 = v20;
          if (v20)
          {
            uint64_t v22 = v20;
          }
          else
          {
            uint64_t v22 = [v17 name];
          }
          v23 = v22;

          v24 = [v38 objectForKeyedSubscript:v23];
          if (v24)
          {
            v25 = [[WFRecordPropertyMapping alloc] initWithSourceObject:self property:v17 destinationObject:v10 property:v24];
            [(WFRecordPropertyMapping *)v25 propagate];
            v26 = [v24 name];
            [v37 addObject:v26];
          }
          else
          {
            getWFWFRecordLogObject();
            v25 = (WFRecordPropertyMapping *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(&v25->super, OS_LOG_TYPE_INFO)) {
              goto LABEL_20;
            }
            v27 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v27);
            *(_DWORD *)buf = 136315650;
            v44 = "-[WFRecord saveProperties:toStorage:error:]";
            __int16 v45 = 2114;
            v46 = v23;
            __int16 v47 = 2114;
            v48 = v26;
            _os_log_impl(&dword_1C7F0A000, &v25->super, OS_LOG_TYPE_INFO, "%s Not saving property %{public}@ to storage, because storage %{public}@ doesn't have it.", buf, 0x20u);
          }

LABEL_20:
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v14);
    }

    id v7 = v10;
    if (objc_opt_respondsToSelector()) {
      [v10 didUpdateProperties:v37];
    }
    v28 = getWFWFRecordLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = [obj count];
      v30 = [(WFRecord *)self descriptionWithValues:0];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 136315906;
      v44 = "-[WFRecord saveProperties:toStorage:error:]";
      __int16 v45 = 2048;
      v46 = (WFRecord *)v29;
      __int16 v47 = 2114;
      v48 = v30;
      __int16 v49 = 2114;
      v50 = v32;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_INFO, "%s Saved %lu properties on record %{public}@ to storage %{public}@", buf, 0x2Au);
    }
    id v6 = v34;
    v12 = v38;
  }
  else
  {
    v12 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[WFRecord saveProperties:toStorage:error:]";
      __int16 v45 = 2112;
      v46 = self;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Requested saving a set of properties to storage, but the set is empty. Bailing (%@)", buf, 0x16u);
    }
  }

  return 1;
}

- (void)resetModificationsForProperties:(id)a3 onlySinceLastSave:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(WFRecord *)self allProperties];
    id v8 = [v9 valueForKey:@"name"];
  }
  v10 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
  [v10 minusSet:v8];

  if (a4)
  {
    [(WFRecord *)self lastSavedOrFetchedValues];
  }
  else
  {
    char v11 = [(WFRecord *)self modifiedPropertyNames];
    [v11 minusSet:v8];

    v12 = [(WFRecord *)self lastSavedOrFetchedValues];
    uint64_t v13 = [v8 allObjects];
    [v12 removeObjectsForKeys:v13];

    [(WFRecord *)self lastFetchedValues];
  uint64_t v14 = };
  uint64_t v15 = [v8 allObjects];
  [v14 removeObjectsForKeys:v15];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v22 = -[WFRecord valueForKey:](self, "valueForKey:", v21, (void)v25);
        v23 = [(WFRecord *)self lastSavedOrFetchedValues];
        [v23 setValue:v22 forKey:v21];

        if (!a4)
        {
          v24 = [(WFRecord *)self lastFetchedValues];
          [v24 setValue:v22 forKey:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }
}

- (void)markPropertyModifiedIfNecessary:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(WFRecord *)self fetchedPropertyNames];
  char v5 = [v4 containsObject:v22];

  if ((v5 & 1) == 0)
  {
    uint64_t v15 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
    [v15 addObject:v22];

    id v16 = [(WFRecord *)self modifiedPropertyNames];
    [v16 addObject:v22];
    goto LABEL_22;
  }
  id v6 = [(WFRecord *)self valueForKey:v22];
  id v7 = [(WFRecord *)self lastSavedOrFetchedValues];
  id v8 = [v7 objectForKey:v22];

  uint64_t v9 = [(WFRecord *)self lastFetchedValues];
  v10 = [v9 objectForKey:v22];

  id v11 = v6;
  id v12 = v8;
  uint64_t v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_9;
  }
  if (v11 && v12)
  {
    char v14 = [v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v17 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
    [v17 removeObject:v22];
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v17 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
  [v17 addObject:v22];
LABEL_12:

  id v16 = v11;
  id v18 = v10;
  uint64_t v19 = v18;
  if (v16 == v18)
  {
  }
  else
  {
    if (!v16 || !v18)
    {

LABEL_20:
      uint64_t v21 = [(WFRecord *)self modifiedPropertyNames];
      [v21 addObject:v22];
      goto LABEL_21;
    }
    char v20 = [v16 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
  }
  uint64_t v21 = [(WFRecord *)self modifiedPropertyNames];
  [v21 removeObject:v22];
LABEL_21:

LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  char v5 = objc_opt_new();
  id v6 = (void *)[v4 initWithStorage:0 properties:v5 settingDefaultValues:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(WFRecord *)self allProperties];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1C87CA430]();
        char v14 = [[WFRecordPropertyMapping alloc] initWithSourceObject:self property:v12 destinationObject:v6 property:v12];
        [(WFRecordPropertyMapping *)v14 propagate:1];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [v6 modifiedPropertyNamesSinceLastSave];
  id v16 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
  [v15 setSet:v16];

  uint64_t v17 = [v6 modifiedPropertyNames];
  id v18 = [(WFRecord *)self modifiedPropertyNames];
  [v17 setSet:v18];

  uint64_t v19 = [v6 lastFetchedValues];
  char v20 = [(WFRecord *)self lastFetchedValues];
  [v19 setDictionary:v20];

  uint64_t v21 = [v6 lastSavedOrFetchedValues];
  id v22 = [(WFRecord *)self lastSavedOrFetchedValues];
  [v21 setDictionary:v22];

  v23 = [(WFRecord *)self storageIdentifier];
  [v6 setStorageIdentifier:v23];

  return v6;
}

- (id)descriptionWithValues:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"<%@: %p, {\n", v7, self];

  long long v26 = (void *)v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [(WFRecord *)self allPropertiesByName];
  uint64_t v11 = [v10 allKeys];
  uint64_t v12 = [v11 sortedArrayUsingSelector:sel_compare_];

  id obj = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        [v9 appendString:@"\t"];
        [v9 appendString:v17];
        id v18 = [(WFRecord *)self fetchedPropertyNames];
        int v19 = [v18 containsObject:v17];

        if (v19) {
          [v9 appendString:@" (f)"];
        }
        char v20 = [(WFRecord *)self modifiedPropertyNames];
        int v21 = [v20 containsObject:v17];

        if (v21) {
          [v9 appendString:@" (m)"];
        }
        id v22 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
        int v23 = [v22 containsObject:v17];

        if (v23) {
          [v9 appendString:@" (u)"];
        }
        if (v3)
        {
          v24 = [(WFRecord *)self valueForKey:v17];
          [v9 appendFormat:@" %@", v24];
        }
        [v9 appendString:@"\n"];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  [v9 appendString:@"}>"];
  return v9;
}

- (id)debugDescription
{
  return [(WFRecord *)self descriptionWithValues:1];
}

- (id)description
{
  return [(WFRecord *)self descriptionWithValues:0];
}

- (BOOL)writeToStorage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WFRecord *)self allProperties];
  LOBYTE(a4) = [(WFRecord *)self saveProperties:v7 toStorage:v6 error:a4];

  return (char)a4;
}

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFRecord.m", 160, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [(WFRecord *)self storageIdentifier];
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 == v11)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    if (v10 && v11) {
      int v13 = [v10 isEqual:v11];
    }
  }

  uint64_t v14 = [(WFRecord *)self modifiedPropertiesSinceLastSave];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if ((v13 & 1) == 0)
  {
    id v16 = [(WFRecord *)self fetchedProperties];
    [v15 unionSet:v16];
  }
  if ([v15 count])
  {
    LODWORD(a4) = [(WFRecord *)self saveProperties:v15 toStorage:v7 error:a4];
    if ((a4 & v13) == 1)
    {
      uint64_t v17 = [v15 valueForKey:@"name"];
      LOBYTE(a4) = 1;
      [(WFRecord *)self resetModificationsForProperties:v17 onlySinceLastSave:1];
    }
  }
  else
  {
    getWFDatabaseLogObject();
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[WFRecord saveChangesToStorage:error:]";
      __int16 v22 = 2112;
      int v23 = self;
      _os_log_impl(&dword_1C7F0A000, (os_log_t)a4, OS_LOG_TYPE_INFO, "%s Requested saving changes to storage, but looks like nothing changed — bailing out (%@)", buf, 0x16u);
    }

    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)loadFromStorage:(id)a3 properties:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFGeneralLogObject();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = getWFGeneralLogObject();
  id v11 = v10;
  unint64_t v36 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "WFRecordLoadFromStorage", "", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    long long v40 = [(id)objc_opt_class() recordPropertyMap];
  }
  else
  {
    long long v40 = 0;
  }
  os_signpost_id_t spid = v9;
  if (!v7)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    int v13 = [(WFRecord *)self allPropertiesByName];
    uint64_t v14 = [v13 allKeys];
    id v7 = [v12 setWithArray:v14];
  }
  uint64_t v15 = objc_opt_class();
  long long v39 = +[WFRecord propertiesForClass:v15 walkingSuperclassesUntilReaching:objc_opt_class()];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x1C87CA430]();
        int v19 = [(WFRecord *)self allPropertiesByName];
        char v20 = [v19 objectForKey:v17];

        if (!v20)
        {
          long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v29 = (objc_class *)objc_opt_class();
          long long v30 = NSStringFromClass(v29);
          [v28 handleFailureInMethod:a2, self, @"WFRecord.m", 139, @"Property name \"%@\" is invalid for class: %@", v17, v30, spid object file lineNumber description];
        }
        uint64_t v21 = [v40 objectForKeyedSubscript:v17];
        __int16 v22 = (void *)v21;
        if (v21) {
          int v23 = (void *)v21;
        }
        else {
          int v23 = v17;
        }
        id v24 = v23;

        long long v25 = [v39 objectForKeyedSubscript:v24];
        if (v25)
        {
          long long v26 = [[WFRecordPropertyMapping alloc] initWithSourceObject:v6 property:v25 destinationObject:self property:v20];
          [(WFRecordPropertyMapping *)v26 propagate:1];
          long long v27 = [(WFRecord *)self fetchedPropertyNames];
          [v27 addObject:v17];
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v41);
  }

  long long v31 = [v6 identifier];
  [(WFRecord *)self setStorageIdentifier:v31];

  [(WFRecord *)self resetModificationsForProperties:obj onlySinceLastSave:0];
  v32 = getWFGeneralLogObject();
  uint64_t v33 = v32;
  if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v33, OS_SIGNPOST_INTERVAL_END, spid, "WFRecordLoadFromStorage", "", buf, 2u);
  }
}

- (void)loadFromStorage:(id)a3
{
}

- (NSSet)modifiedProperties
{
  BOOL v3 = [(WFRecord *)self modifiedPropertyNames];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__WFRecord_modifiedProperties__block_invoke;
  v6[3] = &unk_1E654FB40;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "if_map:", v6);

  return (NSSet *)v4;
}

id __30__WFRecord_modifiedProperties__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 allPropertiesByName];
  char v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (NSSet)modifiedPropertiesSinceLastSave
{
  id v3 = [(WFRecord *)self modifiedPropertyNamesSinceLastSave];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__WFRecord_modifiedPropertiesSinceLastSave__block_invoke;
  v6[3] = &unk_1E654FB40;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "if_map:", v6);

  return (NSSet *)v4;
}

id __43__WFRecord_modifiedPropertiesSinceLastSave__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 allPropertiesByName];
  char v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (NSSet)fetchedProperties
{
  id v3 = [(WFRecord *)self fetchedPropertyNames];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__WFRecord_fetchedProperties__block_invoke;
  v6[3] = &unk_1E654FB40;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "if_map:", v6);

  return (NSSet *)v4;
}

id __29__WFRecord_fetchedProperties__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 allPropertiesByName];
  char v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (NSSet)allProperties
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(WFRecord *)self allPropertiesByName];
  uint64_t v4 = [v3 allValues];
  char v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void)dealloc
{
  [(WFRecord *)self tearDownPropertyObservation];
  v3.receiver = self;
  v3.super_class = (Class)WFRecord;
  [(WFRecord *)&v3 dealloc];
}

- (WFRecord)initWithStorage:(id)a3 properties:(id)a4 settingDefaultValues:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = getWFGeneralLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = getWFGeneralLogObject();
  int v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = (id)objc_opt_class();
    id v14 = v36;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFRecordInitWithStorage", "class=%{signpost.description:attribute}@", buf, 0xCu);
  }
  v34.receiver = self;
  v34.super_class = (Class)WFRecord;
  uint64_t v15 = [(WFRecord *)&v34 init];
  if (v15)
  {
    uint64_t v16 = [(id)objc_opt_class() recordSubclassProperties];
    allPropertiesByName = v15->_allPropertiesByName;
    v15->_allPropertiesByName = (NSDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    fetchedPropertyNames = v15->_fetchedPropertyNames;
    v15->_fetchedPropertyNames = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    modifiedPropertyNamesSinceLastSave = v15->_modifiedPropertyNamesSinceLastSave;
    v15->_modifiedPropertyNamesSinceLastSave = (NSMutableSet *)v20;

    uint64_t v22 = objc_opt_new();
    lastSavedOrFetchedValues = v15->_lastSavedOrFetchedValues;
    v15->_lastSavedOrFetchedValues = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    modifiedPropertyNames = v15->_modifiedPropertyNames;
    v15->_modifiedPropertyNames = (NSMutableSet *)v24;

    uint64_t v26 = objc_opt_new();
    lastFetchedValues = v15->_lastFetchedValues;
    v15->_lastFetchedValues = (NSMutableDictionary *)v26;

    uint64_t v28 = [v8 identifier];
    storageIdentifier = v15->_storageIdentifier;
    v15->_storageIdentifier = (NSString *)v28;

    if (v8) {
      [(WFRecord *)v15 loadFromStorage:v8 properties:v9];
    }
    if (v5) {
      [(WFRecord *)v15 setDefaultPropertyValuesExceptFetched];
    }
    [(WFRecord *)v15 resetModificationsForProperties:0 onlySinceLastSave:0];
    [(WFRecord *)v15 setupPropertyObservation];
    long long v30 = getWFGeneralLogObject();
    long long v31 = v30;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v31, OS_SIGNPOST_INTERVAL_END, v11, "WFRecordInitWithStorage", "", buf, 2u);
    }

    v32 = v15;
  }

  return v15;
}

- (WFRecord)initWithStorage:(id)a3 properties:(id)a4
{
  return [(WFRecord *)self initWithStorage:a3 properties:a4 settingDefaultValues:1];
}

- (WFRecord)initWithStorage:(id)a3
{
  return [(WFRecord *)self initWithStorage:a3 properties:0];
}

- (WFRecord)init
{
  return [(WFRecord *)self initWithStorage:0];
}

+ (id)propertiesForClass:(Class)a3
{
  uint64_t v4 = objc_opt_new();
  BOOL v5 = +[WFRecord ignoredPropertyNames];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(objc_class *)a3 ignoredPropertyNames];

    BOOL v5 = (void *)v6;
  }
  unsigned int outCount = 0;
  id v7 = class_copyPropertyList(a3, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v9 = [NSString stringWithUTF8String:property_getName(v7[i])];
      if (([v5 containsObject:v9] & 1) == 0)
      {
        id v10 = [[WFRecordProperty alloc] initWithName:v9 property:v7[i]];
        if (v10) {
          [v4 setObject:v10 forKey:v9];
        }
      }
    }
  }
  free(v7);

  return v4;
}

+ (id)propertiesForClass:(Class)a3 walkingSuperclassesUntilReaching:(Class)a4
{
  id v7 = objc_opt_new();
  if (([(objc_class *)a3 isEqual:a4] & 1) == 0)
  {
    do
    {
      if (![(objc_class *)a3 isSubclassOfClass:a4]) {
        break;
      }
      id v8 = (void *)MEMORY[0x1C87CA430]();
      id v9 = [a1 propertiesForClass:a3];
      [v7 addEntriesFromDictionary:v9];

      a3 = (Class)[(objc_class *)a3 superclass];
    }
    while (![(objc_class *)a3 isEqual:a4]);
  }
  return v7;
}

+ (id)recordSubclassProperties
{
  if (recordSubclassProperties_onceToken != -1) {
    dispatch_once(&recordSubclassProperties_onceToken, &__block_literal_global_231);
  }
  objc_super v3 = [(id)recordSubclassProperties_cachedProperties objectForKey:a1];
  if (!v3)
  {
    objc_super v3 = [a1 propertiesForClass:a1 walkingSuperclassesUntilReaching:objc_opt_class()];
    [(id)recordSubclassProperties_cachedProperties setObject:v3 forKey:a1];
  }
  return v3;
}

void __36__WFRecord_recordSubclassProperties__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)recordSubclassProperties_cachedProperties;
  recordSubclassProperties_cachedProperties = v0;
}

+ (id)ignoredPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"description", @"debugDescription", @"hash", @"superclass", @"wfName", 0);
}

+ (id)defaultPropertyValues
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end