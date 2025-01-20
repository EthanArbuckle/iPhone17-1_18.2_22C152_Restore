@interface PLObjectSnapshot
+ (__CFDictionary)_createIndexMapsSnapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4;
+ (id)snapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4 useCommitedValues:(BOOL)a5;
- (BOOL)hasSnapshotValueForProperty:(id)a3;
- (PLManagedObject)managedObject;
- (PLObjectSnapshot)init;
- (PLObjectSnapshot)initWithManagedObject:(id)a3 properties:(id)a4 toOneRelationships:(id)a5 indexMaps:(__CFDictionary *)a6 useCommitedValues:(BOOL)a7;
- (id)_allSnapshotValuesDescription;
- (id)_snapshotValueForProperty:(id)a3;
- (id)description;
- (id)filteredIndexesForFilter:(id)a3;
- (id)indexMapStateForDerivedObject:(id)a3;
- (id)snapshotValueForProperty:(id)a3;
- (void)dealloc;
- (void)setAssetsSnapshot:(id)a3;
@end

@implementation PLObjectSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotValues, 0);
  objc_storeStrong((id *)&self->_managedObject, 0);
}

- (PLManagedObject)managedObject
{
  return self->_managedObject;
}

- (void)setAssetsSnapshot:(id)a3
{
  if (a3)
  {
    snapshotValues = self->_snapshotValues;
    id v5 = a3;
    id v9 = [(NSKnownKeysDictionary *)snapshotValues mapping];
    uint64_t v6 = [v9 fastIndexForKnownKey:@"assets"];
    v7 = self->_snapshotValues;
    v8 = (void *)[v5 copy];

    [(NSKnownKeysDictionary *)v7 setValue:v8 atIndex:v6];
  }
}

- (id)_allSnapshotValuesDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  snapshotValues = self->_snapshotValues;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLObjectSnapshot__allSnapshotValuesDescription__block_invoke;
  v8[3] = &unk_1E5869AA0;
  id v9 = v3;
  id v5 = v3;
  [(NSKnownKeysDictionary *)snapshotValues enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];

  return v6;
}

void __49__PLObjectSnapshot__allSnapshotValuesDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "pl_shortDescription");
  }
  else {
  id v9 = [v5 description];
  }

  v7 = *(void **)(a1 + 32);
  v8 = [NSString stringWithFormat:@"\"%@\": {%@}", v6, v9];

  [v7 addObject:v8];
}

- (id)_snapshotValueForProperty:(id)a3
{
  snapshotValues = self->_snapshotValues;
  id v5 = a3;
  id v6 = [(NSKnownKeysDictionary *)snapshotValues mapping];
  uint64_t v7 = [v6 fastIndexForKnownKey:v5];

  v8 = [(NSKnownKeysDictionary *)self->_snapshotValues valueAtIndex:v7];

  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [(NSKnownKeysDictionary *)self->_snapshotValues allKeys];
  id v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(PLManagedObject *)self->_managedObject entity];
  v8 = [v7 managedObjectClassName];
  id v9 = [v4 componentsJoinedByString:@", "];
  v10 = [v5 stringWithFormat:@"<%@: %p> class: %@, keys: {%@}", v6, self, v8, v9];

  indexMaps = self->_indexMaps;
  if (indexMaps) {
    CFDictionaryApplyFunction(indexMaps, (CFDictionaryApplierFunction)myIndexMapDescriptionApplier, v10);
  }

  return v10;
}

- (id)filteredIndexesForFilter:(id)a3
{
  v3 = [(PLObjectSnapshot *)self indexMapStateForDerivedObject:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)indexMapStateForDerivedObject:(id)a3
{
  CFDictionaryRef indexMaps = self->_indexMaps;
  if (indexMaps)
  {
    CFDictionaryGetValue(indexMaps, a3);
    CFDictionaryRef indexMaps = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return indexMaps;
}

- (BOOL)hasSnapshotValueForProperty:(id)a3
{
  v3 = [(PLObjectSnapshot *)self _snapshotValueForProperty:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)snapshotValueForProperty:(id)a3
{
  v3 = [(PLObjectSnapshot *)self _snapshotValueForProperty:a3];
  BOOL v4 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (PLObjectSnapshot)initWithManagedObject:(id)a3 properties:(id)a4 toOneRelationships:(id)a5 indexMaps:(__CFDictionary *)a6 useCommitedValues:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v59.receiver = self;
  v59.super_class = (Class)PLObjectSnapshot;
  v16 = [(PLObjectSnapshot *)&v59 init];
  v17 = v16;
  if (v16)
  {
    v46 = v15;
    objc_storeStrong((id *)&v16->_managedObject, a3);
    v18 = [v13 managedObjectContext];
    uint64_t v19 = +[PLChangeNotificationCenter allManagedObjectKeysStrategyWithContext:v18];

    v50 = (void *)v19;
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C0F8]) initWithSearchStrategy:v19];
    snapshotValues = v17->_snapshotValues;
    v17->_snapshotValues = (NSKnownKeysDictionary *)v20;

    v44 = a6;
    v49 = v17;
    if (v7)
    {
      v48 = [v13 committedValuesForKeys:v14];
    }
    else
    {
      v48 = 0;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v45 = v14;
    obuint64_t j = v14;
    uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = (__CFString *)*(id *)(*((void *)&v55 + 1) + 8 * i);
          v27 = v13;
          v28 = [v13 entity];
          v29 = [v28 name];
          v30 = +[PLManagedAsset entityName];
          int v31 = [v29 isEqualToString:v30];

          v32 = v26;
          if (v31)
          {
            v33 = @"orderedCloudComments";
            if (([(__CFString *)v26 isEqualToString:@"cloudComments"] & 1) != 0
              || (v33 = @"orderedLikeComments",
                  v32 = v26,
                  [(__CFString *)v26 isEqualToString:@"likeComments"]))
            {

              v32 = v33;
            }
          }
          if (v7)
          {
            v34 = [v48 objectForKey:v32];
            id v13 = v27;
          }
          else
          {
            id v13 = v27;
            v34 = [v27 valueForKey:v32];
          }
          v35 = (void *)[v34 copy];

          if (!v35)
          {
            v35 = [MEMORY[0x1E4F1CA98] null];
          }
          -[NSKnownKeysDictionary setValue:atIndex:](v49->_snapshotValues, "setValue:atIndex:", v35, [v50 fastIndexForKnownKey:v26]);
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v23);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v36 = v46;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v51 objects:v60 count:16];
    v17 = v49;
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v52 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v51 + 1) + 8 * j);
          if (v7) {
            [v48 objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * j)];
          }
          else {
          v42 = [v13 valueForKey:*(void *)(*((void *)&v51 + 1) + 8 * j)];
          }
          if (!v42)
          {
            v42 = [MEMORY[0x1E4F1CA98] null];
          }
          -[NSKnownKeysDictionary setValue:atIndex:](v49->_snapshotValues, "setValue:atIndex:", v42, [v50 fastIndexForKnownKey:v41]);
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v38);
    }

    if (v44) {
      v49->_CFDictionaryRef indexMaps = (__CFDictionary *)CFRetain(v44);
    }

    id v14 = v45;
    id v15 = v46;
  }

  return v17;
}

- (void)dealloc
{
  CFDictionaryRef indexMaps = self->_indexMaps;
  if (indexMaps) {
    CFRelease(indexMaps);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLObjectSnapshot;
  [(PLObjectSnapshot *)&v4 dealloc];
}

- (PLObjectSnapshot)init
{
  return 0;
}

+ (__CFDictionary)_createIndexMapsSnapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__PLObjectSnapshot__createIndexMapsSnapshotForManagedObject_changeNotificationCenter___block_invoke;
  v9[3] = &unk_1E5869A78;
  v9[4] = &v10;
  [v6 enumerateIndexMappingCachesForObject:v5 withBlock:v9];
  BOOL v7 = (__CFDictionary *)v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __86__PLObjectSnapshot__createIndexMapsSnapshotForManagedObject_changeNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id key = a2;
  v3 = [key cachedIndexMapState];
  if (v3)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable(0, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    objc_super v4 = (void *)[v3 copyWithZone:0];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), key, v4);
  }
}

+ (id)snapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4 useCommitedValues:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isFault])
  {
    uint64_t v10 = 0;
    goto LABEL_43;
  }
  v11 = [v9 _orderedRelationshipsOfInterestForObject:v8];
  uint64_t v12 = [v9 _attributesOfInterestForObject:v8];
  uint64_t v13 = [v9 _toOneRelationshipsOfInterestForObject:v8];
  uint64_t v14 = [v11 count];
  uint64_t v15 = [v12 count] + v14;
  if (v15 + [v13 count])
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v41 = v13;
    BOOL v39 = v5;
    id v38 = a1;
    if (v5)
    {
      v16 = [v11 allObjects];
      v17 = [v13 allObjects];
    }
    else
    {
      if (v11)
      {
        v16 = [MEMORY[0x1E4F1CA48] array];
      }
      else
      {
        v16 = 0;
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v47 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            if (([v8 hasFaultForRelationshipNamed:v23] & 1) == 0) {
              [v16 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v20);
      }

      uint64_t v37 = v11;
      if (v41)
      {
        v17 = [MEMORY[0x1E4F1CA48] array];
      }
      else
      {
        v17 = 0;
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v24 = v41;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v42 + 1) + 8 * j);
            if (([v8 hasFaultForRelationshipNamed:v29] & 1) == 0) {
              [v17 addObject:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v26);
      }

      uint64_t v30 = [v16 count];
      uint64_t v31 = [v12 count] + v30;
      if (!(v31 + [v17 count]))
      {
        uint64_t v10 = 0;
        v11 = v37;
LABEL_41:
        uint64_t v13 = v41;

        goto LABEL_42;
      }
      v11 = v37;
    }
    v32 = [MEMORY[0x1E4F1CA48] array];
    v33 = v32;
    if (v16) {
      [v32 addObjectsFromArray:v16];
    }
    if (v12)
    {
      v34 = [v12 allObjects];
      [v33 addObjectsFromArray:v34];
    }
    v35 = (const void *)[v38 _createIndexMapsSnapshotForManagedObject:v8 changeNotificationCenter:v9];
    uint64_t v10 = (void *)[objc_alloc((Class)v38) initWithManagedObject:v8 properties:v33 toOneRelationships:v17 indexMaps:v35 useCommitedValues:v39];
    if (v35) {
      CFRelease(v35);
    }

    goto LABEL_41;
  }
  uint64_t v10 = 0;
LABEL_42:

LABEL_43:
  return v10;
}

@end