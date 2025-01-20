@interface PRPosterCollection
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollection:(id)a3;
- (BOOL)isPosterConfigurationAnAssociatedPoster:(id)a3 parentPoster:(id *)a4;
- (NSOrderedSet)orderedPosterUUIDs;
- (NSOrderedSet)orderedPosters;
- (NSSet)associatedPosterUUIDs;
- (NSSet)associatedPosters;
- (NSSet)posterExtensions;
- (PRPosterCollection)initWithSelectedPoster:(id)a3 posters:(id)a4 associatedPosterMap:(id)a5 attributeProvider:(id)a6;
- (PRPosterConfiguration)selectedPoster;
- (id)associatedHomeScreenConfigurationsMap;
- (id)associatedPosterForPoster:(id)a3;
- (id)associatedPosterForUUID:(id)a3;
- (id)attributeForPoster:(id)a3 ofType:(id)a4;
- (id)attributesForPoster:(id)a3 ofTypes:(id)a4;
- (id)chargerIdentifierRelationships;
- (id)configuredPropertiesForPoster:(id)a3;
- (id)debugDescription;
- (id)fallbackSelectedForSortedConfigurations:(id)a3 reverse:(BOOL)a4;
- (id)posterWithUUID:(id)a3;
@end

@implementation PRPosterCollection

- (PRPosterCollection)initWithSelectedPoster:(id)a3 posters:(id)a4 associatedPosterMap:(id)a5 attributeProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  if (v15)
  {
    NSClassFromString(&cfstr_Prposterconfig.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.5();
      }
LABEL_24:
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C2348D4);
    }
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsorderedset.isa);
  if (!v16)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:]();
    }
    goto LABEL_24;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSOrderedSetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C234938);
  }

  id v17 = v13;
  NSClassFromString(&cfstr_Nsmaptable.isa);
  if (!v17)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C23499CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSMapTableClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C234A00);
  }

  v31.receiver = self;
  v31.super_class = (Class)PRPosterCollection;
  v18 = [(PRPosterCollection *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_selectedPoster, a3);
    uint64_t v20 = [v16 copy];
    orderedPosters = v19->_orderedPosters;
    v19->_orderedPosters = (NSOrderedSet *)v20;

    uint64_t v22 = [v17 copy];
    associatedPosterMap = v19->_associatedPosterMap;
    v19->_associatedPosterMap = (NSMapTable *)v22;

    uint64_t v24 = [v14 copy];
    id attributeProvider = v19->_attributeProvider;
    v19->_id attributeProvider = (id)v24;
  }
  return v19;
}

- (id)debugDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(PRPosterCollection *)self selectedPoster];
  id v5 = (id)[v3 appendObject:v4 withName:@"selectedPoster" skipIfNil:1];

  v6 = [(PRPosterCollection *)self orderedPosterUUIDs];
  v7 = [v6 array];
  uint64_t v20 = v3;
  [v3 appendArraySection:v7 withName:@"posterUUIDs" skipIfEmpty:1];

  v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = [(PRPosterCollection *)self orderedPosterUUIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [(PRPosterCollection *)self associatedPosterForUUID:v13];
        id v15 = [v14 _path];
        id v16 = [v15 serverIdentity];
        id v17 = [v16 posterUUID];

        if (v17) {
          [v21 setObject:v17 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  [v20 appendDictionarySection:v21 withName:@"parentToAssocPoster" skipIfEmpty:1];
  v18 = [v20 build];

  return v18;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4 = a3;
  id v5 = [[PRPosterCollectionDiffInspector alloc] initWithCollection:self newCollection:v4];

  BOOL v6 = [(PRPosterCollectionDiffInspector *)v5 isEqual];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterCollection *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(PRPosterCollection *)self isEqualToCollection:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (id)posterWithUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_orderedPosters;
  uint64_t v5 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 _path];
        uint64_t v11 = [v10 serverIdentity];
        id v12 = [v11 posterUUID];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v9;
          goto LABEL_13;
        }
        id v14 = [(PRPosterCollection *)self associatedPosterForPoster:v9];
        id v15 = [v14 _path];
        id v16 = [v15 serverIdentity];
        id v17 = [v16 posterUUID];
        int v18 = [v17 isEqual:v4];

        if (v18) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v14 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_13:

  return v14;
}

- (id)associatedPosterForUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_orderedPosters;
  uint64_t v5 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = [(PRPosterCollection *)self associatedPosterForPoster:*(void *)(*((void *)&v16 + 1) + 8 * v8)];
      uint64_t v10 = [v9 _path];
      uint64_t v11 = [v10 serverIdentity];
      id v12 = [v11 posterUUID];
      char v13 = [v12 isEqual:v4];

      if (v13) {
        break;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSSet)associatedPosters
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PRPosterCollection *)self orderedPosters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(PRPosterCollection *)self associatedPosterForPoster:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (BOOL)isPosterConfigurationAnAssociatedPoster:(id)a3 parentPoster:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 _path];
  uint64_t v7 = [v6 serverIdentity];
  uint64_t v8 = [v7 posterUUID];

  uint64_t v9 = [(PRPosterCollection *)self associatedPosterUUIDs];
  long long v24 = (void *)v8;
  LODWORD(v7) = [v9 containsObject:v8];

  if (v7)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(NSMapTable *)self->_associatedPosterMap keyEnumerator];
    uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v22 = a4;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [(NSMapTable *)self->_associatedPosterMap objectForKey:v14];
          uint64_t v16 = [v15 _path];
          long long v17 = [v16 serverIdentity];
          long long v18 = [v17 posterUUID];
          int v19 = [v18 isEqual:v24];

          if (v19)
          {
            if (v22)
            {
              *long long v22 = [(PRPosterCollection *)self posterWithUUID:v14];
            }

            BOOL v20 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v20 = 0;
LABEL_15:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)associatedHomeScreenConfigurationsMap
{
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v4 = [(PRPosterCollection *)self orderedPosters];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PRPosterCollection_associatedHomeScreenConfigurationsMap__block_invoke;
  v9[3] = &unk_1E54DBFA8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __59__PRPosterCollection_associatedHomeScreenConfigurationsMap__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 associatedPosterForPoster:v4];
  id v5 = [v4 _path];

  int v6 = [v5 isServerPosterPath];
  if (v5 && v6 && v9)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v5 serverIdentity];
    [v7 setObject:v9 forKey:v8];
  }
}

- (NSSet)posterExtensions
{
  v2 = self;
  objc_sync_enter(v2);
  posterExtensions = v2->_posterExtensions;
  if (posterExtensions)
  {
    id v4 = posterExtensions;
  }
  else
  {
    id v5 = objc_opt_new();
    int v6 = [(PRPosterCollection *)v2 orderedPosters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__PRPosterCollection_posterExtensions__block_invoke;
    v11[3] = &unk_1E54DBFD0;
    id v7 = v5;
    id v12 = v7;
    [v6 enumerateObjectsUsingBlock:v11];

    uint64_t v8 = [v7 copy];
    id v9 = v2->_posterExtensions;
    v2->_posterExtensions = (NSSet *)v8;

    id v4 = v2->_posterExtensions;
  }
  objc_sync_exit(v2);

  return v4;
}

void __38__PRPosterCollection_posterExtensions__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [a2 _path];
  v3 = [v5 serverIdentity];
  id v4 = [v3 provider];
  [v2 addObject:v4];
}

- (NSOrderedSet)orderedPosterUUIDs
{
  return (NSOrderedSet *)[(NSOrderedSet *)self->_orderedPosters bs_map:&__block_literal_global_27];
}

id __40__PRPosterCollection_orderedPosterUUIDs__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _path];
  v3 = [v2 serverIdentity];
  id v4 = [v3 posterUUID];

  return v4;
}

- (NSSet)associatedPosterUUIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  if ([(NSMapTable *)self->_associatedPosterMap count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(NSMapTable *)self->_associatedPosterMap keyEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [(NSMapTable *)self->_associatedPosterMap objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          id v10 = [v9 _path];
          uint64_t v11 = [v10 serverIdentity];
          id v12 = [v11 posterUUID];

          if (v12) {
            [v3 addObject:v12];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  return (NSSet *)v3;
}

- (id)associatedPosterForPoster:(id)a3
{
  associatedPosterMap = self->_associatedPosterMap;
  id v4 = [a3 _path];
  uint64_t v5 = [v4 serverIdentity];
  uint64_t v6 = [v5 posterUUID];
  uint64_t v7 = [(NSMapTable *)associatedPosterMap objectForKey:v6];

  return v7;
}

- (id)attributeForPoster:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PRPosterCollection *)self orderedPosters];
  if ([(PRPosterCollection *)v8 containsObject:v6] && self->_attributeProvider)
  {

    if (!v7)
    {
      long long v14 = 0;
      goto LABEL_17;
    }
    uint64_t v8 = self;
    objc_sync_enter(v8);
    posterToAttributeMap = v8->_posterToAttributeMap;
    if (!posterToAttributeMap)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      uint64_t v11 = v8->_posterToAttributeMap;
      v8->_posterToAttributeMap = (NSMapTable *)v10;

      posterToAttributeMap = v8->_posterToAttributeMap;
    }
    id v12 = [(NSMapTable *)posterToAttributeMap objectForKey:v6];
    if (!v12)
    {
      id v12 = objc_opt_new();
      [(NSMapTable *)v8->_posterToAttributeMap setObject:v12 forKey:v6];
    }
    long long v13 = [v12 objectForKey:v7];

    if (v13)
    {
      long long v14 = [v12 objectForKey:v7];
    }
    else
    {
      id attributeProvider = (void (**)(id, id, void *))self->_attributeProvider;
      long long v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      long long v17 = attributeProvider[2](attributeProvider, v6, v16);

      long long v14 = [v17 objectForKey:v7];
      if (v14) {
        [v12 setObject:v14 forKeyedSubscript:v7];
      }
    }
    objc_sync_exit(v8);
  }
  else
  {
    long long v14 = 0;
  }

LABEL_17:
  return v14;
}

- (id)attributesForPoster:(id)a3 ofTypes:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v41 = a4;
  id v8 = v7;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v8)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection attributesForPoster:ofTypes:](a2);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C235FD4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection attributesForPoster:ofTypes:](a2);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C236038);
  }
  v42 = v8;

  id v9 = [(PRPosterCollection *)self orderedPosters];
  id v10 = v8;
  if (![v9 containsObject:v8])
  {

    goto LABEL_13;
  }
  id attributeProvider = self->_attributeProvider;

  if (!attributeProvider)
  {
LABEL_13:
    id v21 = 0;
    goto LABEL_36;
  }
  id v12 = self;
  objc_sync_enter(v12);
  id obj = v12;
  posterToAttributeMap = v12->_posterToAttributeMap;
  if (!posterToAttributeMap)
  {
    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v15 = v12->_posterToAttributeMap;
    v12->_posterToAttributeMap = (NSMapTable *)v14;

    posterToAttributeMap = v12->_posterToAttributeMap;
  }
  long long v16 = [(NSMapTable *)posterToAttributeMap objectForKey:v10];
  if (!v16) {
    long long v16 = objc_opt_new();
  }
  long long v17 = (void *)MEMORY[0x1E4F1CAD0];
  long long v18 = [v16 allKeys];
  uint64_t v19 = [v17 setWithArray:v18];
  if (![v19 isEqualToSet:v41])
  {

    goto LABEL_15;
  }
  BOOL v20 = (void *)[v16 copy];

  if (!v20)
  {
LABEL_15:
    long long v22 = objc_opt_new();
    long long v23 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v24 = v41;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v29 = [v16 objectForKey:v28];
          if (v29) {
            [v22 setObject:v29 forKey:v28];
          }
          else {
            [v23 addObject:v28];
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v25);
    }

    uint64_t v30 = (*((void (**)(void))self->_attributeProvider + 2))();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    objc_super v31 = [v30 keyEnumerator];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          v36 = [v30 objectForKey:v35];
          if (v36)
          {
            [v16 setObject:v36 forKeyedSubscript:v35];
            [v22 setObject:v36 forKeyedSubscript:v35];
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v32);
    }

    id v21 = (id)[v30 copy];
    goto LABEL_35;
  }
  id v21 = v20;
LABEL_35:

  objc_sync_exit(obj);
LABEL_36:

  return v21;
}

- (id)configuredPropertiesForPoster:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v4)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection configuredPropertiesForPoster:]();
    }
LABEL_14:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2361ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection configuredPropertiesForPoster:]();
    }
    goto LABEL_14;
  }

  uint64_t v5 = [(PRPosterCollection *)self orderedPosters];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [v4 loadConfiguredPropertiesWithError:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)chargerIdentifierRelationships
{
  v3 = objc_opt_new();
  id v4 = [(PRPosterCollection *)self orderedPosters];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PRPosterCollection_chargerIdentifierRelationships__block_invoke;
  v9[3] = &unk_1E54DBFA8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  int v6 = v10;
  id v7 = v5;

  return v7;
}

void __52__PRPosterCollection_chargerIdentifierRelationships__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 _path];
  id v5 = [v4 serverIdentity];

  id v21 = v5;
  int v6 = [v5 posterUUID];
  id v7 = [v6 UUIDString];

  id v8 = v3;
  [*(id *)(a1 + 32) attributeForPoster:v3 ofType:@"PRPosterRoleAttributeTypeAmbientChargerConfiguration"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = long long v25 = 0u;
  id obj = [v19 associatedChargerIdentifiers];
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
        if (!v14)
        {
          uint64_t v14 = objc_opt_new();
          [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v13];
        }
        long long v15 = NSString;
        long long v16 = [v21 provider];
        long long v17 = [v8 descriptorIdentifier];
        long long v18 = [v15 stringWithFormat:@"%@ %@ %@", v7, v16, v17];
        [v14 addObject:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (id)fallbackSelectedForSortedConfigurations:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  BOOL v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  if (v4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v6 && [v6 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__PRPosterCollection_fallbackSelectedForSortedConfigurations_reverse___block_invoke;
    v15[3] = &unk_1E54DC018;
    v15[4] = self;
    v15[5] = &v16;
    [v7 enumerateObjectsWithOptions:v8 usingBlock:v15];
    if (!v17[5])
    {
      uint64_t v9 = PRLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PRPosterCollection fallbackSelectedForSortedConfigurations:reverse:](v9);
      }

      if (v4) {
        [v7 lastObject];
      }
      else {
      uint64_t v10 = [v7 firstObject];
      }
      uint64_t v13 = (void *)v17[5];
      v17[5] = v10;
    }
    id v12 = (id)v17[5];
  }
  else
  {
    uint64_t v11 = PRLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PRPosterCollection fallbackSelectedForSortedConfigurations:reverse:](v11);
    }

    id v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __70__PRPosterCollection_fallbackSelectedForSortedConfigurations_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) configuredPropertiesForPoster:v7];
  uint64_t v9 = [v8 focusConfiguration];

  if (!v9)
  {
    uint64_t v10 = PRLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEFAULT, "Choosing selected configuration: choosing MRU unpaired configuration %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (PRPosterConfiguration)selectedPoster
{
  return (PRPosterConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (NSOrderedSet)orderedPosters
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedPosters, 0);
  objc_storeStrong((id *)&self->_selectedPoster, 0);
  objc_storeStrong((id *)&self->_posterToAttributeMap, 0);
  objc_storeStrong((id *)&self->_associatedPosterMap, 0);
  objc_storeStrong((id *)&self->_posterExtensions, 0);
  objc_storeStrong(&self->_configuredPropertiesProvider, 0);
  objc_storeStrong(&self->_attributeProvider, 0);
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:(const char *)a1 ofTypes:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:(const char *)a1 ofTypes:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configuredPropertiesForPoster:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fallbackSelectedForSortedConfigurations:(os_log_t)log reverse:.cold.1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Choosing selected configuration: sortedConfigurations is empty, no selected poster could be found.", v1, 2u);
}

- (void)fallbackSelectedForSortedConfigurations:(os_log_t)log reverse:.cold.2(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Choosing selected configuration: no unpaired configurations found, choosing MRU.", v1, 2u);
}

@end