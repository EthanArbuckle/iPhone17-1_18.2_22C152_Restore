@interface PLManagedObjectJournalEntryPayload
+ (BOOL)_populateObjectDictionary:(id)a3 withObject:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 payloadClass:(Class)a7 info:(id)a8;
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (BOOL)shouldPersistForChangedKeys:(id)a3 entityName:(id)a4;
+ (id)_populateRelationshipKeyPathsForPrefetching:(id)a3 currentKeyPath:(id)a4 usingModelProperties:(id)a5;
+ (id)additionalEntityNames;
+ (id)fetchPredicateInContext:(id)a3;
+ (id)fetchRelationshipPropertyValuesForRelationshipName:(id)a3 fromManagedObject:(id)a4 usingPayloadProperty:(id)a5;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)objectDictionariesByUUIDForPayloadClass:(Class)a3 inManagedObjectContext:(id)a4 fetchPredicate:(id)a5 info:(id)a6 error:(id *)a7;
+ (id)payloadAdapterForManagedObject:(id)a3;
+ (id)payloadClassID;
+ (id)payloadWithData:(id)a3 forPayloadID:(id)a4 version:(unsigned int)a5 andNilProperties:(id)a6 error:(id *)a7;
+ (id)persistedPropertyNamesForEntityNames;
+ (id)persistedPropertyNamesForEntityNamesFromModelProperties;
+ (id)relationshipKeyPathsForPrefetching;
+ (id)relationshipKeyPathsForPrefetchingWithModelProperties:(id)a3 outUUIDPropertyName:(id *)a4;
+ (id)snapshotSortDescriptors;
+ (id)sortedObjectsToAddWithUUIDs:(id)a3 uuidKey:(id)a4 andExistingObjects:(id)a5 fetchBlock:(id)a6;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
+ (void)_populateAddtionalEntityNames:(id)a3 fromModelProperties:(id)a4;
+ (void)_populatePersistedPropertyNamesForAdditionalEntityNames:(id)a3 fromModelProperties:(id)a4;
+ (void)_populateValidationProperties:(id)a3 fromEntityDescription:(id)a4;
+ (void)_validateModelProperties:(id)a3 nonPersistedModelProperties:(id)a4 forEntityDescription:(id)a5;
+ (void)loadModelPropertiesDescription:(id)a3 parentPayloadProperty:(id)a4;
+ (void)populateValidationPropertiesFromManagedObjectModel:(id)a3;
+ (void)validatePayloadPropertiesForManagedObjectModel:(id)a3;
- (BOOL)_applyModelProperties:(id)a3 toPayloadAttributes:(id)a4 andNilAttributes:(id)a5 fromSourceObject:(id)a6 changedKeys:(id)a7 info:(id)a8;
- (BOOL)_comparePayloadAttributes:(id)a3 toObjectDictionary:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 errorDescriptions:(id)a7;
- (BOOL)_decodePayloadAttributesFromData:(id)a3 error:(id *)a4;
- (BOOL)comparePayloadToObjectDictionary:(id)a3 usingModelProperties:(id)a4 errorDescriptions:(id)a5;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)containsAttributeForKey:(id)a3;
- (BOOL)payloadVersionIsLessThanVersion:(unsigned int)a3 forKey:(id)a4 inUpdatePayloads:(id)a5;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6;
- (NSSet)nilProperties;
- (NSString)debugDescription;
- (NSString)description;
- (PLJournalEntryPayloadID)payloadID;
- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4;
- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4 info:(id)a5;
- (PLManagedObjectJournalEntryPayload)initWithManagedObject:(id)a3 changedKeys:(id)a4;
- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 managedObject:(id)a5 changedKeys:(id)a6 modelProperties:(id)a7;
- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5;
- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5 sourceObject:(id)a6 changedKeys:(id)a7 modelProperties:(id)a8 info:(id)a9;
- (id)UUIDDataForString:(id)a3;
- (id)UUIDStringForData:(id)a3;
- (id)_attributesForPayloadAttributes:(id)a3 usingModelProperties:(id)a4;
- (id)_payloadAttributesListForSubRelationshipProperty:(id)a3 withManagedObjects:(id)a4 info:(id)a5;
- (id)descriptionForEntry:(id)a3;
- (id)descriptionForEntry:(id)a3 withBuilder:(id)a4;
- (id)descriptionWithBuilder:(id)a3;
- (id)encodedDataForUUIDStringArray:(id)a3;
- (id)encodedDataForUUIDStringOrderedSet:(id)a3;
- (id)encodedDataForUUIDStringSet:(id)a3;
- (id)orderedSetForUUIDEncodedData:(id)a3;
- (id)payloadAttributes;
- (id)payloadDataWithError:(id *)a3;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (id)prettyDescriptionForEntry:(id)a3 indent:(int64_t)a4;
- (id)rawPayloadAttributeForKey:(id)a3;
- (id)rawPayloadAttributes;
- (id)setForUUIDEncodedData:(id)a3;
- (unsigned)payloadVersion;
- (void)_applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8;
- (void)_applyPayloadToManagedObject:(id)a3 forModelProperties:(id)a4 payloadAttributesToUpdate:(id)a5 info:(id)a6;
- (void)_applySubRelationshipPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8;
- (void)_resolveRelationshipsInObjectDictionary:(id)a3 atKeyPath:(id)a4 forPayloadProperty:(id)a5;
- (void)_updateNilAttributes:(id)a3 withModelProperties:(id)a4;
- (void)addAttributesDescriptionToBuilder:(id)a3;
- (void)addNilAttributesToBuilder:(id)a3;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8;
- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4;
- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4 info:(id)a5;
- (void)mergePayload:(id)a3;
- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3;
- (void)setRawPayloadAttribute:(id)a3 forKey:(id)a4;
- (void)setRawPayloadAttributes:(id)a3;
- (void)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 forPayloadProperty:(id)a5 withUUIDStringData:(id)a6;
@end

@implementation PLManagedObjectJournalEntryPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadID, 0);
  objc_storeStrong((id *)&self->_nilAttributes, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
}

- (BOOL)comparePayloadToObjectDictionary:(id)a3 usingModelProperties:(id)a4 errorDescriptions:(id)a5
{
  return [(PLManagedObjectJournalEntryPayload *)self _comparePayloadAttributes:self->_payloadAttributes toObjectDictionary:a3 currentKeyPath:&stru_1EEB2EB80 usingModelProperties:a4 errorDescriptions:a5];
}

- (void)addAttributesDescriptionToBuilder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_payloadAttributes allKeys];
  v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", v12, (void)v14);
        [(PLManagedObjectJournalEntryPayload *)self appendAttributeKey:v12 value:v13 toDescriptionBuilder:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)addNilAttributesToBuilder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 style] == 1)
  {
    v5 = [(NSMutableSet *)self->_nilAttributes allObjects];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v6 appendString:@"["];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v6, "appendString:", v12, (void)v14);
          v13 = [v7 lastObject];

          if (v12 != v13) {
            [v6 appendString:@", "];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v6 appendString:@"]"];
    [v4 appendName:@"nilAttributes" object:v6];
  }
  else
  {
    [v4 appendName:@"nilAttributes" object:self->_nilAttributes];
  }
}

- (id)descriptionForEntry:(id)a3 withBuilder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  int v9 = [v7 payloadVersion];

  if (v8 != v9) {
    objc_msgSend(v6, "appendName:integerValue:", @"version", -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion"));
  }
  if ([(NSMutableSet *)self->_nilAttributes count]) {
    [(PLManagedObjectJournalEntryPayload *)self addNilAttributesToBuilder:v6];
  }
  if ([(NSMutableDictionary *)self->_payloadAttributes count]) {
    [(PLManagedObjectJournalEntryPayload *)self addAttributesDescriptionToBuilder:v6];
  }
  uint64_t v10 = [v6 build];

  return v10;
}

- (id)descriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  [v4 appendName:@"payloadID" object:v5];

  objc_msgSend(v4, "appendName:integerValue:", @"version", -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion"));
  if ([(NSMutableSet *)self->_nilAttributes count]) {
    [(PLManagedObjectJournalEntryPayload *)self addNilAttributesToBuilder:v4];
  }
  if ([(NSMutableDictionary *)self->_payloadAttributes count])
  {
    uint64_t v6 = [v4 style];
    id v7 = [PLDescriptionBuilder alloc];
    uint64_t v8 = [v4 style];
    if (v6 == 1)
    {
      int v9 = [(PLDescriptionBuilder *)v7 initWithObject:self style:v8 indent:0];
      [(PLManagedObjectJournalEntryPayload *)self addAttributesDescriptionToBuilder:v9];
      uint64_t v10 = NSString;
      v11 = [(PLDescriptionBuilder *)v9 build];
      uint64_t v12 = [v10 stringWithFormat:@"[%@]", v11];
      [v4 appendName:@"attributes" object:v12];
    }
    else
    {
      int v9 = -[PLDescriptionBuilder initWithObject:style:indent:](v7, "initWithObject:style:indent:", self, v8, [v4 indent] + 1);
      [(PLManagedObjectJournalEntryPayload *)self addAttributesDescriptionToBuilder:v9];
      if ([v4 style] == 2)
      {
        v13 = NSString;
        long long v14 = [(PLDescriptionBuilder *)v9 build];
        v11 = [v13 stringWithFormat:@"\n%@", v14];
      }
      else
      {
        v11 = [(PLDescriptionBuilder *)v9 build];
      }
      [v4 appendName:@"attributes" object:v11];
    }
  }
  long long v15 = [v4 build];

  return v15;
}

- (id)prettyDescriptionForEntry:(id)a3 indent:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:a4];
  uint64_t v8 = [(PLManagedObjectJournalEntryPayload *)self descriptionForEntry:v6 withBuilder:v7];

  return v8;
}

- (id)descriptionForEntry:(id)a3
{
  id v4 = a3;
  v5 = [[PLDescriptionBuilder alloc] initWithObject:self style:1 indent:0];
  id v6 = [(PLManagedObjectJournalEntryPayload *)self descriptionForEntry:v4 withBuilder:v5];

  return v6;
}

- (NSString)debugDescription
{
  v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:0];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self descriptionWithBuilder:v3];

  return (NSString *)v4;
}

- (NSString)description
{
  v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:1 indent:0];
  id v4 = [(PLManagedObjectJournalEntryPayload *)self descriptionWithBuilder:v3];

  return (NSString *)v4;
}

- (id)_attributesForPayloadAttributes:(id)a3 usingModelProperties:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PLManagedObjectJournalEntryPayload__attributesForPayloadAttributes_usingModelProperties___block_invoke;
  v15[3] = &unk_1E5870328;
  v15[4] = self;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];

  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

void __91__PLManagedObjectJournalEntryPayload__attributesForPayloadAttributes_usingModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 subRelationshipProperties];

  if (!v5)
  {
    if ([v4 isUUIDKey]) {
      goto LABEL_15;
    }
    v21 = [*(id *)(a1 + 32) payloadValueFromAttributes:*(void *)(a1 + 40) forPayloadProperty:v4];
    v22 = *(void **)(a1 + 48);
    v23 = [v4 key];
    [v22 setObject:v21 forKeyedSubscript:v23];

LABEL_14:
    goto LABEL_15;
  }
  if (([v4 isToManySubRelationship] & 1) == 0)
  {
    v24 = *(void **)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    v26 = [v4 subRelationshipProperties];
    v21 = [v24 _attributesForPayloadAttributes:v25 usingModelProperties:v26];

    [*(id *)(a1 + 48) addEntriesFromDictionary:v21];
    goto LABEL_14;
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 key];
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v16 = *(void **)(a1 + 32);
        id v17 = objc_msgSend(v4, "subRelationshipProperties", (void)v27);
        v18 = [v16 _attributesForPayloadAttributes:v15 usingModelProperties:v17];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v19 = *(void **)(a1 + 48);
  v20 = [v4 key];
  [v19 setObject:v9 forKeyedSubscript:v20];

LABEL_15:
}

- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4 info:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() modelProperties];
  [(PLManagedObjectJournalEntryPayload *)self _applyPayloadToManagedObject:v10 forModelProperties:v11 payloadAttributesToUpdate:v9 info:v8];
}

- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() modelProperties];
  [(PLManagedObjectJournalEntryPayload *)self _applyPayloadToManagedObject:v7 forModelProperties:v8 payloadAttributesToUpdate:v6 info:0];
}

- (void)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 forPayloadProperty:(id)a5 withUUIDStringData:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [a5 key];
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:v11];
  }
  else {
    [v9 addObject:v11];
  }
}

- (BOOL)payloadVersionIsLessThanVersion:(unsigned int)a3 forKey:(id)a4 inUpdatePayloads:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLManagedObjectJournalEntryPayload.m", 776, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  unsigned int v21 = 0;
  unsigned int v11 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  BOOL v12 = 0;
  unsigned int v21 = v11;
  if (*((_DWORD *)v19 + 6) < a3)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__PLManagedObjectJournalEntryPayload_payloadVersionIsLessThanVersion_forKey_inUpdatePayloads___block_invoke;
    v15[3] = &unk_1E5861B30;
    id v16 = v9;
    id v17 = &v18;
    [v10 enumerateObjectsWithOptions:2 usingBlock:v15];
    BOOL v12 = *((_DWORD *)v19 + 6) < a3;
  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __94__PLManagedObjectJournalEntryPayload_payloadVersionIsLessThanVersion_forKey_inUpdatePayloads___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 containsAttributeForKey:*(void *)(a1 + 32)])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 payloadVersion];
    *a4 = 1;
  }
}

- (id)UUIDStringForData:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(v5, 0, 37);
    uuid_unparse((const unsigned __int8 *)objc_msgSend(a3, "bytes", 0, 0, 0, 0, *(void *)&v5[32], v6), v5);
    v3 = (void *)[[NSString alloc] initWithUTF8String:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)UUIDDataForString:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(uu, 0, sizeof(uu));
    uuid_parse((const char *)[a3 UTF8String], uu);
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:uu length:16];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)setForUUIDEncodedData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x10)
  {
    unint64_t v6 = v4 >> 4;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v4 >> 4];
    uint64_t v7 = [v3 bytes];
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v7 + 16 * v8), v13);
      id v10 = (void *)[[NSString alloc] initWithUTF8String:v13];
      [v5 addObject:v10];

      uint64_t v8 = v9;
    }
    while (v6 > v9++);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)orderedSetForUUIDEncodedData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x10)
  {
    unint64_t v6 = v4 >> 4;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v4 >> 4];
    uint64_t v7 = [v3 bytes];
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v7 + 16 * v8), v13);
      id v10 = (void *)[[NSString alloc] initWithUTF8String:v13];
      [v5 addObject:v10];

      uint64_t v8 = v9;
    }
    while (v6 > v9++);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encodedDataForUUIDStringArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    size_t v4 = 16 * [v3 count];
    v5 = (char *)malloc_type_malloc(v4, 0x1B5ED952uLL);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        BOOL v12 = &v5[16 * v9];
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(id *)(*((void *)&v17 + 1) + 8 * v11);
          uint64_t v14 = (const char *)objc_msgSend(v13, "UTF8String", (void)v17);
          memset(uu, 0, sizeof(uu));
          uuid_parse(v14, uu);
          *(_OWORD *)BOOL v12 = *(_OWORD *)uu;
          v12 += 16;
          ++v11;
        }
        while (v8 != v11);
        v9 += v11;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v5 length:v4 freeWhenDone:1];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)encodedDataForUUIDStringOrderedSet:(id)a3
{
  size_t v4 = [a3 array];
  v5 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringArray:v4];

  return v5;
}

- (id)encodedDataForUUIDStringSet:(id)a3
{
  size_t v4 = [a3 allObjects];
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  id v6 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringArray:v5];

  return v6;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v5 = a3;
  id v6 = [a4 key];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    if ([v8 style] == 1 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v9, "appendName:unsignedIntegerValue:", v10, objc_msgSend(v7, "count"));
    }
    else {
      [v9 appendName:v10 object:v7];
    }
  }
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    if ([v9 isOptional])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [v10 defaultValue];
    }
  }
  if ([v10 type] == 500)
  {
    [v8 doubleValue];
    double v12 = v11;
    [v7 doubleValue];
    char v14 = vabdd_f64(v12, v13) < 2.22044605e-16;
  }
  else
  {
    if ([v10 type] == 900 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      [v15 setFormatOptions:3955];
      id v16 = [v15 dateFromString:v8];
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      [v7 timeIntervalSinceReferenceDate];
      char v14 = vabdd_f64(v18, v19) < 0.001;
    }
    else
    {
      if ([v10 type] != 1000 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        char v14 = [v8 isEqual:v7];
        goto LABEL_15;
      }
      id v15 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      char v14 = [v15 isEqualToData:v7];
    }
  }
LABEL_15:

  return v14;
}

- (void)_applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v24 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (([v24 requiresConversion] & 1) != 0
    || ([v24 key],
        double v19 = objc_claimAutoreleasedReturnValue(),
        [v17 objectForKeyedSubscript:v19],
        long long v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    uint64_t v23 = [v24 subRelationshipProperties];

    if (v18 && v23) {
      [(PLManagedObjectJournalEntryPayload *)self _applySubRelationshipPayloadProperty:v24 toManagedObject:v14 key:v15 payloadAttributesToUpdate:v16 payloadDictionary:v17 info:v18];
    }
  }
  else
  {
    unsigned int v21 = [v24 key];
    v22 = [v17 objectForKeyedSubscript:v21];
    [v14 setValue:v22 forKey:v15];
  }
}

- (void)_applySubRelationshipPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v41 = a4;
  id v40 = a5;
  id v44 = a6;
  id v39 = a7;
  id v45 = a8;
  v46 = v13;
  id v14 = [v13 subRelationshipProperties];

  if (v14)
  {
    if ([v13 isToManySubRelationship])
    {
      id v15 = [v13 key];
      id v16 = [v39 objectForKeyedSubscript:v15];

      if ([v16 count])
      {
        id v17 = [v41 managedObjectContext];
        v38 = [v41 valueForKey:v40];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke;
        v71[3] = &unk_1E5861AE0;
        id v37 = v41;
        id v72 = v37;
        [v38 enumerateObjectsUsingBlock:v71];
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id obj = v16;
        uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v68 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
              uint64_t v23 = (void *)MEMORY[0x1E4F1C0A8];
              id v24 = [v46 subRelationshipEntityName];
              uint64_t v25 = [v23 insertNewObjectForEntityForName:v24 inManagedObjectContext:v17];

              v26 = [v46 subRelationshipProperties];
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2;
              v62[3] = &unk_1E586A8F8;
              v62[4] = self;
              id v63 = v25;
              id v64 = v44;
              uint64_t v65 = v22;
              id v66 = v45;
              id v27 = v25;
              [v26 enumerateKeysAndObjectsUsingBlock:v62];

              [v18 addObject:v27];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
          }
          while (v19);
        }

        [v37 setValue:v18 forKey:v40];
      }
      else
      {
      }
    }
    else
    {
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      char v61 = 0;
      long long v28 = [v13 subRelationshipProperties];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3;
      v53[3] = &unk_1E586A2B0;
      id v29 = v45;
      id v54 = v29;
      v55 = self;
      id v30 = v39;
      id v56 = v30;
      v57 = &v58;
      [v28 enumerateKeysAndObjectsUsingBlock:v53];

      if (*((unsigned char *)v59 + 24))
      {
        v31 = [v41 valueForKey:v40];
        if (!v31)
        {
          uint64_t v32 = (void *)MEMORY[0x1E4F1C0A8];
          v33 = [v13 subRelationshipEntityName];
          v34 = [v41 managedObjectContext];
          v31 = [v32 insertNewObjectForEntityForName:v33 inManagedObjectContext:v34];

          [v41 setValue:v31 forKey:v40];
        }
        v35 = [v13 subRelationshipProperties];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4;
        v47[3] = &unk_1E586A8F8;
        id v48 = v29;
        v49 = self;
        id v36 = v31;
        id v50 = v36;
        id v51 = v44;
        id v52 = v30;
        [v35 enumerateKeysAndObjectsUsingBlock:v47];
      }
      _Block_object_dispose(&v58, 8);
    }
  }
}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  [v4 deleteObject:v3];
}

uint64_t __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyPayloadProperty:a3 toManagedObject:*(void *)(a1 + 40) key:a2 payloadAttributesToUpdate:*(void *)(a1 + 48) payloadDictionary:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = (void *)a1[4];
  if (!v8 || [v8 shouldApplyWithPayloadProperty:v7 andPayload:a1[5]])
  {
    id v9 = (void *)a1[6];
    id v10 = [v7 key];
    double v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    if (![v6 shouldApplyWithPayloadProperty:v5 andPayload:*(void *)(a1 + 40)]) {
      goto LABEL_6;
    }
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
  }
  [*(id *)(a1 + 40) applyPayloadProperty:v5 toManagedObject:*(void *)(a1 + 48) key:v8 payloadAttributesToUpdate:*(void *)(a1 + 56) payloadDictionary:*(void *)(a1 + 64) info:v7];
LABEL_6:
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (NSMutableDictionary *)a7;
  id v18 = a8;
  if (!v18 && self->_payloadAttributes == v17) {
    [(PLManagedObjectJournalEntryPayload *)self applyPayloadProperty:v19 toManagedObject:v14 key:v15 payloadAttributesToUpdate:v16];
  }
  else {
    [(PLManagedObjectJournalEntryPayload *)self _applyPayloadProperty:v19 toManagedObject:v14 key:v15 payloadAttributesToUpdate:v16 payloadDictionary:v17 info:v18];
  }
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6
{
  return 0;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  return 0;
}

- (id)payloadAttributes
{
  payloadAttributes = self->_payloadAttributes;
  id v4 = [(id)objc_opt_class() modelProperties];
  id v5 = [(PLManagedObjectJournalEntryPayload *)self _attributesForPayloadAttributes:payloadAttributes usingModelProperties:v4];

  return v5;
}

- (BOOL)containsAttributeForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_payloadAttributes objectForKeyedSubscript:v4];
  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = [(NSMutableSet *)self->_nilAttributes containsObject:v4];
  }

  return v6;
}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  self->_payloadVersion = [(id)objc_opt_class() payloadVersion];
}

- (void)mergePayload:(id)a3
{
  id v6 = a3;
  [(NSMutableDictionary *)self->_payloadAttributes addEntriesFromDictionary:*((void *)v6 + 1)];
  if ([*((id *)v6 + 2) count])
  {
    payloadAttributes = self->_payloadAttributes;
    id v5 = [*((id *)v6 + 2) allObjects];
    [(NSMutableDictionary *)payloadAttributes removeObjectsForKeys:v5];
  }
}

- (id)payloadDataWithError:(id *)a3
{
  if ([(NSMutableDictionary *)self->_payloadAttributes count]) {
    [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_payloadAttributes format:200 options:0 error:a3];
  }
  else {
  id v5 = [MEMORY[0x1E4F1C9B8] data];
  }
  return v5;
}

- (NSSet)nilProperties
{
  return (NSSet *)self->_nilAttributes;
}

- (unsigned)payloadVersion
{
  return self->_payloadVersion;
}

- (PLJournalEntryPayloadID)payloadID
{
  return self->_payloadID;
}

- (BOOL)_decodePayloadAttributesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:1 format:0 error:a4];
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [(PLManagedObjectJournalEntryPayload *)self migratePayloadAttributes:v7 andNilAttributes:self->_nilAttributes];
      objc_storeStrong((id *)&self->_payloadAttributes, v7);
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_applyPayloadToManagedObject:(id)a3 forModelProperties:(id)a4 payloadAttributesToUpdate:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__PLManagedObjectJournalEntryPayload__applyPayloadToManagedObject_forModelProperties_payloadAttributesToUpdate_info___block_invoke;
  v16[3] = &unk_1E586FCF0;
  id v17 = v12;
  id v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [a4 enumerateKeysAndObjectsUsingBlock:v16];
}

void __117__PLManagedObjectJournalEntryPayload__applyPayloadToManagedObject_forModelProperties_payloadAttributesToUpdate_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v6 || [v6 shouldApplyWithPayloadProperty:v5 andPayload:*(void *)(a1 + 40)])
  {
    uint64_t v7 = [v5 subRelationshipProperties];

    if (v7)
    {
      BOOL v8 = [*(id *)(a1 + 48) valueForKey:v19];
      if (v8)
      {
        char v9 = [v5 isToManySubRelationship];
        id v10 = *(void **)(a1 + 40);
        if ((v9 & 1) == 0)
        {
          id v18 = [v5 subRelationshipProperties];
          [v10 _applyPayloadToManagedObject:v8 forModelProperties:v18 payloadAttributesToUpdate:*(void *)(a1 + 56) info:*(void *)(a1 + 32)];

          goto LABEL_13;
        }
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v13 = v10[1];
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = *(void **)(a1 + 40);
      }
      else
      {
        id v17 = [v5 key];

        if (!v17)
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = *(void **)(a1 + 40);
        uint64_t v13 = v15[1];
      }
      [v15 applyPayloadProperty:v5 toManagedObject:v11 key:v19 payloadAttributesToUpdate:v12 payloadDictionary:v13 info:v14];
      goto LABEL_13;
    }
    id v16 = [v5 key];

    if (v16) {
      [*(id *)(a1 + 40) applyPayloadProperty:v5 toManagedObject:*(void *)(a1 + 48) key:v19 payloadAttributesToUpdate:*(void *)(a1 + 56) payloadDictionary:*(void *)(*(void *)(a1 + 40) + 8) info:*(void *)(a1 + 32)];
    }
  }
LABEL_14:
}

- (BOOL)_applyModelProperties:(id)a3 toPayloadAttributes:(id)a4 andNilAttributes:(id)a5 fromSourceObject:(id)a6 changedKeys:(id)a7 info:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke;
  v26[3] = &unk_1E5861AB8;
  id v20 = v18;
  id v27 = v20;
  id v21 = v17;
  id v28 = v21;
  id v22 = v19;
  v33 = &v34;
  id v29 = v22;
  id v30 = self;
  id v23 = v15;
  id v31 = v23;
  id v24 = v16;
  id v32 = v24;
  [v14 enumerateKeysAndObjectsUsingBlock:v26];
  LOBYTE(v15) = *((unsigned char *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)v15;
}

void __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v53 = a2;
  id v7 = a3;
  BOOL v8 = v7;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v13 = [v7 subRelationshipProperties];

    if (v13)
    {
      id v14 = [*(id *)(a1 + 40) valueForKey:v53];
      id v15 = *(void **)(a1 + 48);
      if (!v15
        || ([v15 validForPersistenceWithPayloadProperty:v8 andValue:v14 stop:*(void *)(*(void *)(a1 + 80) + 8) + 24] & 1) != 0)
      {
        if (!v14) {
          goto LABEL_55;
        }
        if ([v8 isToManySubRelationship])
        {
          id v16 = [v8 key];

          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v17 = [v14 allObjects];
                id v18 = [v17 sortedArrayUsingComparator:&__block_literal_global];

                goto LABEL_42;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = [v14 array];
LABEL_42:
                if (!v18) {
                  goto LABEL_55;
                }
                goto LABEL_46;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v14;
LABEL_46:
                id v44 = [*(id *)(a1 + 56) _payloadAttributesListForSubRelationshipProperty:v8 withManagedObjects:v18 info:*(void *)(a1 + 48)];
                id v45 = v44;
                if (v44)
                {
                  if ([v44 count])
                  {
                    v46 = *(void **)(a1 + 64);
                    v47 = [v8 key];
                    [v46 setObject:v45 forKeyedSubscript:v47];
                  }
                }
                else
                {
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
                  *a4 = 1;
                }

                goto LABEL_54;
              }
            }
LABEL_55:

            goto LABEL_56;
          }
          v49 = (void *)MEMORY[0x1E4F1CA00];
          id v50 = NSString;
          id v51 = (objc_class *)objc_opt_class();
          id v41 = NSStringFromClass(v51);
          v42 = [v50 stringWithFormat:@"Payload property has sub relationship properties, but relationship isn't to-one or to-many: %@, %@, %@", v41, v8, v14];
          v43 = v49;
LABEL_60:
          id v52 = [v43 exceptionWithName:@"PayloadPropertyValidationException" reason:v42 userInfo:0];

          objc_exception_throw(v52);
        }
LABEL_29:
        id v27 = *(void **)(a1 + 56);
        id v28 = [v8 subRelationshipProperties];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v27 _applyModelProperties:v28 toPayloadAttributes:*(void *)(a1 + 64) andNilAttributes:0 fromSourceObject:v14 changedKeys:0 info:*(void *)(a1 + 48)];
      }
LABEL_30:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        *a4 = 1;
      }
      goto LABEL_55;
    }
  }
  uint64_t v9 = [v8 key];
  if (!v9) {
    goto LABEL_56;
  }
  id v10 = (void *)v9;
  uint64_t v11 = *(void **)(a1 + 32);
  if (!v11)
  {

    goto LABEL_16;
  }
  char v12 = [v11 containsObject:v53];

  if (v12)
  {
LABEL_16:
    id v14 = [*(id *)(a1 + 40) valueForKey:v53];
    id v19 = *(void **)(a1 + 48);
    if (v19
      && ([v19 validForPersistenceWithPayloadProperty:v8 andValue:v14 stop:*(void *)(*(void *)(a1 + 80) + 8) + 24] & 1) == 0)
    {
      goto LABEL_30;
    }
    if (v14)
    {
      if ([v8 requiresConversion])
      {
        id v20 = [v8 subRelationshipProperties];

        if (!v20)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v33 = *(void **)(a1 + 56);
          uint64_t v34 = *(void *)(a1 + 64);
          uint64_t v35 = *(void *)(a1 + 72);
          uint64_t v36 = *(void *)(a1 + 40);
          if (isKindOfClass)
          {
            if ([v33 updatePayloadAttributes:v34 andNilAttributes:v35 withManagedObject:v36 forPayloadProperty:v8])goto LABEL_55; {
          }
            }
          else if ([v33 updatePayloadAttributes:v34 andNilAttributes:v35 withSourceObject:v36 forPayloadProperty:v8])
          {
            goto LABEL_55;
          }
          v38 = (void *)MEMORY[0x1E4F1CA00];
          id v39 = NSString;
          id v40 = (objc_class *)objc_opt_class();
          id v41 = NSStringFromClass(v40);
          v42 = [v39 stringWithFormat:@"Payload property not supported by payload class: %@, %@", v41, v8];
          v43 = v38;
          goto LABEL_60;
        }
        if (![v8 isToManySubRelationship]) {
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_55;
        }
        id v21 = [*(id *)(a1 + 56) _payloadAttributesListForSubRelationshipProperty:v8 withManagedObjects:v14 info:*(void *)(a1 + 48)];
        id v18 = v21;
        if (v21)
        {
          if ([v21 count])
          {
            id v22 = *(void **)(a1 + 64);
            id v23 = [v8 key];
            [v22 setObject:v18 forKeyedSubscript:v23];
          }
          else
          {
            id v48 = *(void **)(a1 + 72);
            id v23 = [v8 key];
            [v48 addObject:v23];
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
          *a4 = 1;
        }
LABEL_54:

        goto LABEL_55;
      }
      id v29 = (void *)[v14 copy];
      id v30 = *(void **)(a1 + 64);
      id v31 = [v8 key];
      [v30 setObject:v29 forKeyedSubscript:v31];
    }
    else
    {
      if (!*(void *)(a1 + 32)) {
        goto LABEL_55;
      }
      id v24 = [v8 subRelationshipProperties];

      if (v24)
      {
        uint64_t v25 = *(void **)(a1 + 56);
        uint64_t v26 = *(void *)(a1 + 72);
        id v18 = [v8 subRelationshipProperties];
        [v25 _updateNilAttributes:v26 withModelProperties:v18];
        goto LABEL_54;
      }
      char v37 = *(void **)(a1 + 72);
      id v29 = [v8 key];
      [v37 addObject:v29];
    }

    goto LABEL_55;
  }
LABEL_56:
}

uint64_t __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectID];
  id v6 = [v5 URIRepresentation];
  id v7 = [v6 absoluteString];
  BOOL v8 = [v4 objectID];

  uint64_t v9 = [v8 URIRepresentation];
  id v10 = [v9 absoluteString];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (void)_updateNilAttributes:(id)a3 withModelProperties:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__PLManagedObjectJournalEntryPayload__updateNilAttributes_withModelProperties___block_invoke;
  v8[3] = &unk_1E586A9E8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __79__PLManagedObjectJournalEntryPayload__updateNilAttributes_withModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  uint64_t v4 = [v12 subRelationshipProperties];
  if (v4 && (v5 = (void *)v4, char v6 = [v12 isToManySubRelationship], v5, (v6 & 1) == 0))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v9 = [v12 subRelationshipProperties];
    [v10 _updateNilAttributes:v11 withModelProperties:v9];
  }
  else
  {
    id v7 = [v12 key];

    if (!v7) {
      goto LABEL_7;
    }
    BOOL v8 = *(void **)(a1 + 40);
    id v9 = [v12 key];
    [v8 addObject:v9];
  }

LABEL_7:
}

- (id)_payloadAttributesListForSubRelationshipProperty:(id)a3 withManagedObjects:(id)a4 info:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(id)objc_opt_class() payloadAdapterForManagedObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        id v16 = v15;
        BOOL v27 = 0;
        if (v9
          && ([v15 sourceObject],
              id v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v9 validForPersistenceWithPayloadProperty:v26 andValue:v17 stop:&v27],
              v17,
              (v18 & 1) == 0))
        {
          if (v27) {
            goto LABEL_18;
          }
        }
        else if ([v16 isValidForJournalPersistence])
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v20 = [v26 subRelationshipProperties];
          id v21 = [v16 sourceObject];
          BOOL v27 = [(PLManagedObjectJournalEntryPayload *)self _applyModelProperties:v20 toPayloadAttributes:v19 andNilAttributes:0 fromSourceObject:v21 changedKeys:0 info:v9];

          if (v27)
          {

LABEL_18:
            id v23 = 0;
            id v22 = v25;
            goto LABEL_19;
          }
          if ([v19 count]) {
            [v25 addObject:v19];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v22 = v25;
  id v23 = v25;
LABEL_19:

  return v23;
}

- (id)rawPayloadAttributeForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_payloadAttributes objectForKeyedSubscript:a3];
}

- (void)setRawPayloadAttributes:(id)a3
{
}

- (void)setRawPayloadAttribute:(id)a3 forKey:(id)a4
{
}

- (id)rawPayloadAttributes
{
  return self->_payloadAttributes;
}

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5 sourceObject:(id)a6 changedKeys:(id)a7 modelProperties:(id)a8 info:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v16) {
    goto LABEL_16;
  }
  v35.receiver = self;
  v35.super_class = (Class)PLManagedObjectJournalEntryPayload;
  self = [(PLManagedObjectJournalEntryPayload *)&v35 init];
  if (!self) {
    goto LABEL_16;
  }
  id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  payloadAttributes = self->_payloadAttributes;
  self->_payloadAttributes = v22;

  objc_storeStrong((id *)&self->_payloadID, a3);
  self->_payloadVersion = a4;
  if (!v18)
  {
    BOOL v27 = (NSMutableSet *)[v17 mutableCopy];
    nilAttributes = self->_nilAttributes;
    self->_nilAttributes = v27;

LABEL_16:
    self = self;
    uint64_t v33 = self;
    goto LABEL_17;
  }
  if (v19)
  {
    id v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    p_nilAttributes = &self->_nilAttributes;
    id v25 = self->_nilAttributes;
    self->_nilAttributes = v24;
  }
  else
  {
    p_nilAttributes = &self->_nilAttributes;
    id v25 = self->_nilAttributes;
    self->_nilAttributes = 0;
  }

  BOOL v29 = [(PLManagedObjectJournalEntryPayload *)self _applyModelProperties:v20 toPayloadAttributes:self->_payloadAttributes andNilAttributes:self->_nilAttributes fromSourceObject:v18 changedKeys:v19 info:v21];
  BOOL v30 = v29;
  if (v19 && !v29)
  {
    if ([(NSMutableDictionary *)self->_payloadAttributes count]
      || [(NSMutableSet *)*p_nilAttributes count])
    {
      long long v31 = self;
    }
    else
    {
      long long v31 = 0;
    }
    id v32 = v31;

    self = v32;
  }
  if (!v30) {
    goto LABEL_16;
  }
  uint64_t v33 = 0;
LABEL_17:

  return v33;
}

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 managedObject:(id)a5 changedKeys:(id)a6 modelProperties:(id)a7
{
  return [(PLManagedObjectJournalEntryPayload *)self initWithPayloadID:a3 payloadVersion:*(void *)&a4 nilAttributes:0 sourceObject:a5 changedKeys:a6 modelProperties:a7 info:0];
}

- (PLManagedObjectJournalEntryPayload)initWithManagedObject:(id)a3 changedKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 payloadID];
  uint64_t v9 = [(id)objc_opt_class() payloadVersion];
  id v10 = [(id)objc_opt_class() modelProperties];
  uint64_t v11 = [(PLManagedObjectJournalEntryPayload *)self initWithPayloadID:v8 payloadVersion:v9 nilAttributes:0 sourceObject:v7 changedKeys:v6 modelProperties:v10 info:0];

  return v11;
}

- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4 info:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 payloadID];
  uint64_t v12 = [(id)objc_opt_class() payloadVersion];
  uint64_t v13 = [v10 sourceObject];

  id v14 = [(id)objc_opt_class() modelProperties];
  id v15 = [(PLManagedObjectJournalEntryPayload *)self initWithPayloadID:v11 payloadVersion:v12 nilAttributes:0 sourceObject:v13 changedKeys:v9 modelProperties:v14 info:v8];

  return v15;
}

- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 payloadID];
  uint64_t v9 = [(id)objc_opt_class() payloadVersion];
  id v10 = [v7 sourceObject];

  uint64_t v11 = [(id)objc_opt_class() modelProperties];
  uint64_t v12 = [(PLManagedObjectJournalEntryPayload *)self initWithPayloadID:v8 payloadVersion:v9 nilAttributes:0 sourceObject:v10 changedKeys:v6 modelProperties:v11 info:0];

  return v12;
}

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5
{
  return [(PLManagedObjectJournalEntryPayload *)self initWithPayloadID:a3 payloadVersion:*(void *)&a4 nilAttributes:a5 sourceObject:0 changedKeys:0 modelProperties:0 info:0];
}

+ (id)objectDictionariesByUUIDForPayloadClass:(Class)a3 inManagedObjectContext:(id)a4 fetchPredicate:(id)a5 info:(id)a6 error:(id *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = a5;
  id v14 = a4;
  id v15 = objc_alloc_init(v12);
  id v16 = [(objc_class *)a3 modelProperties];
  id v45 = 0;
  id v17 = +[PLManagedObjectJournalEntryPayload relationshipKeyPathsForPrefetchingWithModelProperties:v16 outUUIDPropertyName:&v45];
  id v18 = v45;

  id v19 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  id v20 = [(objc_class *)a3 entityName];
  id v21 = (void *)[v19 initWithEntityName:v20];

  [v21 setReturnsObjectsAsFaults:0];
  [v21 setRelationshipKeyPathsForPrefetching:v17];
  [v21 setShouldRefreshRefetchedObjects:1];
  [v21 setPredicate:v13];

  id v44 = 0;
  id v22 = [v14 executeFetchRequest:v21 error:&v44];

  id v23 = v44;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v25 = v24;
  if (v22)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke;
    v41[3] = &unk_1E5861B80;
    id v26 = v24;
    id v42 = v26;
    Class v43 = a3;
    [v22 enumerateObjectsUsingBlock:v41];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke_139;
    v35[3] = &unk_1E5861BA8;
    id v39 = a1;
    Class v40 = a3;
    id v36 = v11;
    id v37 = v18;
    id v27 = v15;
    id v38 = v27;
    [v26 enumerateObjectsUsingBlock:v35];
    id v28 = v27;
  }
  else
  {
    id v34 = v11;
    BOOL v29 = PLMigrationGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      [(objc_class *)a3 payloadClassID];
      v31 = BOOL v30 = a7;
      *(_DWORD *)buf = 138543618;
      v47 = v31;
      __int16 v48 = 2112;
      id v49 = v23;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Fetch failed for payload class %{public}@, error: %@", buf, 0x16u);

      a7 = v30;
    }

    id v28 = 0;
    if (a7) {
      *a7 = v23;
    }
    id v11 = v34;
  }

  return v28;
}

void __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) payloadAdapterForManagedObject:a2];
  [v2 addObject:v3];
}

void __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isValidForJournalPersistence])
  {
    uint64_t v4 = [v3 sourceObject];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = *(void **)(a1 + 56);
    id v7 = [*(id *)(a1 + 64) modelProperties];
    LOBYTE(v6) = [v6 _populateObjectDictionary:v5 withObject:v4 currentKeyPath:&stru_1EEB2EB80 usingModelProperties:v7 payloadClass:*(void *)(a1 + 64) info:*(void *)(a1 + 32)];

    if (v6)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v8 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 stringValue];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_9:
        uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];

        if (v12)
        {
          id v13 = PLMigrationGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = [*(id *)(a1 + 64) payloadClassID];
            int v15 = 138543618;
            id v16 = v14;
            __int16 v17 = 2114;
            id v18 = v9;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Duplicate object dictionary found for payload class %{public}@ with UUID %{public}@", (uint8_t *)&v15, 0x16u);
          }
        }
        else
        {
          [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v9];
        }

        goto LABEL_15;
      }
      uint64_t v10 = [v9 description];
    }
    id v11 = (void *)v10;

    uint64_t v9 = v11;
    goto LABEL_9;
  }
LABEL_17:
}

+ (id)fetchRelationshipPropertyValuesForRelationshipName:(id)a3 fromManagedObject:(id)a4 usingPayloadProperty:(id)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 entity];
  uint64_t v12 = [v11 relationshipsByName];
  id v13 = [v12 objectForKeyedSubscript:v8];

  uint64_t v14 = [v13 inverseRelationship];
  int v15 = (void *)v14;
  if (v13 && v14)
  {
    id v44 = a1;
    id v45 = v10;
    v47 = v11;
    id v16 = [v10 relatedEntityPropertyNames];
    __int16 v17 = [v16 anyObject];

    id v18 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v19 = [v15 entity];
    id v20 = [v19 name];
    id v21 = [v18 fetchRequestWithEntityName:v20];

    [v21 setResultType:2];
    LODWORD(v18) = [v15 isToMany];
    id v22 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v23 = [v15 name];
    id v24 = (void *)v23;
    if (v18) {
      id v25 = @"%K CONTAINS %@";
    }
    else {
      id v25 = @"%K = %@";
    }
    id v26 = objc_msgSend(v22, "predicateWithFormat:", v25, v23, v9);
    [v21 setPredicate:v26];

    [v21 setAllocationType:1];
    v59[0] = v17;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    [v21 setPropertiesToFetch:v27];

    if ([v13 isOrdered])
    {
      id v28 = (void *)MEMORY[0x1E4F29008];
      BOOL v29 = [v15 name];
      BOOL v30 = [v28 sortDescriptorWithKey:v29 ascending:1];
      uint64_t v58 = v30;
      long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
      [v21 setSortDescriptors:v31];
    }
    id v32 = [v9 managedObjectContext];
    id v51 = 0;
    uint64_t v33 = [v32 executeFetchRequest:v21 error:&v51];
    id v34 = v51;

    v46 = v34;
    if (v33)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __128__PLManagedObjectJournalEntryPayload_fetchRelationshipPropertyValuesForRelationshipName_fromManagedObject_usingPayloadProperty___block_invoke;
      v48[3] = &unk_1E586AF70;
      id v49 = v17;
      id v36 = v35;
      id v50 = v36;
      [v33 enumerateObjectsUsingBlock:v48];
      id v37 = v8;
      id v38 = v50;
      id v39 = v36;

      id v8 = v37;
      Class v40 = v39;
    }
    else
    {
      id v39 = PLMigrationGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v42 = [v44 payloadClassID];
        *(_DWORD *)buf = 138412802;
        id v53 = v17;
        __int16 v54 = 2112;
        v55 = v42;
        __int16 v56 = 2112;
        id v57 = v34;
        _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "JournalManager: failed to fetch relationship properties for relationship %@ on %@, error: %@", buf, 0x20u);
      }
      Class v40 = 0;
    }
    id v10 = v45;

    id v11 = v47;
  }
  else
  {
    __int16 v17 = PLMigrationGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v41 = [a1 payloadClassID];
      *(_DWORD *)buf = 138543618;
      id v53 = v8;
      __int16 v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "JournalManager: relationship %{public}@ on %{public}@ does not define an inverse relationship", buf, 0x16u);
    }
    Class v40 = 0;
  }

  return v40;
}

void __128__PLManagedObjectJournalEntryPayload_fetchRelationshipPropertyValuesForRelationshipName_fromManagedObject_usingPayloadProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

+ (id)relationshipKeyPathsForPrefetchingWithModelProperties:(id)a3 outUUIDPropertyName:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [a1 _populateRelationshipKeyPathsForPrefetching:v8 currentKeyPath:&stru_1EEB2EB80 usingModelProperties:v7];

  if (a4) {
    *a4 = v9;
  }

  return v8;
}

+ (id)_populateRelationshipKeyPathsForPrefetching:(id)a3 currentKeyPath:(id)a4 usingModelProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__156;
  id v24 = __Block_byref_object_dispose__157;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __118__PLManagedObjectJournalEntryPayload__populateRelationshipKeyPathsForPrefetching_currentKeyPath_usingModelProperties___block_invoke;
  v15[3] = &unk_1E5861B58;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v18 = &v20;
  id v19 = a1;
  id v17 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __118__PLManagedObjectJournalEntryPayload__populateRelationshipKeyPathsForPrefetching_currentKeyPath_usingModelProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = [v5 subRelationshipProperties];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) stringByAppendingString:v21];
    id v8 = [v7 stringByAppendingString:@"."];

    id v9 = *(void **)(a1 + 40);
    id v10 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v21];
    [v9 addObject:v10];

    id v11 = *(void **)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v5 subRelationshipProperties];
    id v14 = (id)[v11 _populateRelationshipKeyPathsForPrefetching:v12 currentKeyPath:v8 usingModelProperties:v13];

LABEL_8:
    goto LABEL_9;
  }
  if ([v5 isUUIDKey])
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = v21;
    id v8 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
    goto LABEL_8;
  }
  uint64_t v17 = [v5 relatedEntityPropertyNames];
  if (v17)
  {
    id v18 = (void *)v17;
    int v19 = [v5 shouldPrefetchRelationship];

    if (v19)
    {
      uint64_t v20 = *(void **)(a1 + 40);
      id v8 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v21];
      [v20 addObject:v8];
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (id)sortedObjectsToAddWithUUIDs:(id)a3 uuidKey:(id)a4 andExistingObjects:(id)a5 fetchBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a6;
  uint64_t v12 = [a5 valueForKey:v10];
  if ([v9 count] && (objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
  {
    id v14 = v11[2](v11);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104__PLManagedObjectJournalEntryPayload_sortedObjectsToAddWithUUIDs_uuidKey_andExistingObjects_fetchBlock___block_invoke;
    v16[3] = &unk_1E58653E8;
    id v17 = v9;
    id v18 = v10;
    id v13 = [v14 sortedArrayUsingComparator:v16];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __104__PLManagedObjectJournalEntryPayload_sortedObjectsToAddWithUUIDs_uuidKey_andExistingObjects_fetchBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = [a2 valueForKey:v6];
  unint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = [v7 valueForKey:*(void *)(a1 + 40)];

  unint64_t v12 = [v10 indexOfObject:v11];
  if (v9 < v12) {
    return -1;
  }
  else {
    return v9 > v12;
  }
}

+ (void)_populateAddtionalEntityNames:(id)a3 fromModelProperties:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PLManagedObjectJournalEntryPayload__populateAddtionalEntityNames_fromModelProperties___block_invoke;
  v8[3] = &unk_1E5861B08;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __88__PLManagedObjectJournalEntryPayload__populateAddtionalEntityNames_fromModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  uint64_t v4 = [v14 subRelationshipProperties];

  if (v4)
  {
    uint64_t v5 = [v14 subRelationshipEntityName];
    if (v5)
    {
      id v6 = (void *)v5;
      int v7 = [v14 isAdditionalEntityName];

      if (v7)
      {
        id v8 = *(void **)(a1 + 32);
        id v9 = [v14 subRelationshipEntityName];
        [v8 addObject:v9];
      }
    }
    uint64_t v12 = a1 + 32;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v12 + 8);
    id v13 = [v14 subRelationshipProperties];
    [v11 _populateAddtionalEntityNames:v10 fromModelProperties:v13];
  }
}

+ (void)_populatePersistedPropertyNamesForAdditionalEntityNames:(id)a3 fromModelProperties:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __114__PLManagedObjectJournalEntryPayload__populatePersistedPropertyNamesForAdditionalEntityNames_fromModelProperties___block_invoke;
  v8[3] = &unk_1E5861B08;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __114__PLManagedObjectJournalEntryPayload__populatePersistedPropertyNamesForAdditionalEntityNames_fromModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v16 = a3;
  uint64_t v4 = [v16 subRelationshipProperties];

  if (v4)
  {
    uint64_t v5 = [v16 subRelationshipEntityName];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1CAD0];
      id v7 = [v16 subRelationshipProperties];
      id v8 = [v7 allKeys];
      id v9 = [v6 setWithArray:v8];
      id v10 = *(void **)(a1 + 32);
      id v11 = [v16 subRelationshipEntityName];
      [v10 setObject:v9 forKeyedSubscript:v11];
    }
    uint64_t v14 = a1 + 32;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v14 + 8);
    uint64_t v15 = [v16 subRelationshipProperties];
    [v13 _populatePersistedPropertyNamesForAdditionalEntityNames:v12 fromModelProperties:v15];
  }
}

+ (id)persistedPropertyNamesForEntityNamesFromModelProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [a1 modelProperties];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v4 allKeys];
  id v7 = [v5 setWithArray:v6];
  id v8 = [a1 entityName];
  [v3 setObject:v7 forKeyedSubscript:v8];

  [a1 _populatePersistedPropertyNamesForAdditionalEntityNames:v3 fromModelProperties:v4];
  return v3;
}

+ (void)loadModelPropertiesDescription:(id)a3 parentPayloadProperty:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PLManagedObjectJournalEntryPayload_loadModelPropertiesDescription_parentPayloadProperty___block_invoke;
  v8[3] = &unk_1E5861B08;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __91__PLManagedObjectJournalEntryPayload_loadModelPropertiesDescription_parentPayloadProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [v7 setParentProperty:*(void *)(a1 + 32)];
  uint64_t v4 = [v7 subRelationshipProperties];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [v7 subRelationshipProperties];
    [v5 loadModelPropertiesDescription:v6 parentPayloadProperty:v7];
  }
}

+ (id)nonPersistedModelPropertiesDescription
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)modelPropertiesDescription
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)payloadClassID
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)payloadWithData:(id)a3 forPayloadID:(id)a4 version:(unsigned int)a5 andNilProperties:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = (void *)[objc_alloc((Class)a1) initWithPayloadID:v14 payloadVersion:v9 nilAttributes:v13];

  if (v12 && ![v15 _decodePayloadAttributesFromData:v12 error:a7]) {
    id v16 = 0;
  }
  else {
    id v16 = v15;
  }

  return v16;
}

+ (id)fetchPredicateInContext:(id)a3
{
  return 0;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  return a3;
}

+ (id)relationshipKeyPathsForPrefetching
{
  id v3 = [a1 modelProperties];
  uint64_t v4 = [a1 relationshipKeyPathsForPrefetchingWithModelProperties:v3 outUUIDPropertyName:0];

  return v4;
}

+ (id)snapshotSortDescriptors
{
  return 0;
}

+ (BOOL)shouldPersistForChangedKeys:(id)a3 entityName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 persistedPropertyNamesForEntityNames];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9) {
    char v10 = [v6 intersectsSet:v9];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (unsigned)payloadVersion
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)persistedPropertyNamesForEntityNames
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)modelProperties
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)additionalEntityNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [a1 modelProperties];
  [a1 _populateAddtionalEntityNames:v3 fromModelProperties:v4];

  return v3;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  return 1;
}

+ (void)populateValidationPropertiesFromManagedObjectModel:(id)a3
{
  uint64_t v4 = [a3 entitiesByName];
  uint64_t v5 = [a1 entityName];
  id v7 = [v4 objectForKeyedSubscript:v5];

  id v6 = [(id)objc_opt_class() modelProperties];
  [a1 _populateValidationProperties:v6 fromEntityDescription:v7];
}

+ (void)validatePayloadPropertiesForManagedObjectModel:(id)a3
{
  uint64_t v4 = [a3 entitiesByName];
  uint64_t v5 = [a1 entityName];
  id v9 = [v4 objectForKeyedSubscript:v5];

  id v6 = objc_opt_class();
  id v7 = [(id)objc_opt_class() modelProperties];
  id v8 = [(id)objc_opt_class() nonPersistedModelPropertiesDescription];
  [v6 _validateModelProperties:v7 nonPersistedModelProperties:v8 forEntityDescription:v9];
}

- (void)_resolveRelationshipsInObjectDictionary:(id)a3 atKeyPath:(id)a4 forPayloadProperty:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = v9;
  id v12 = [v9 subRelationshipProperties];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke;
  v30[3] = &unk_1E5870328;
  id v13 = v8;
  id v31 = v13;
  id v14 = v7;
  id v32 = v14;
  id v15 = v10;
  id v33 = v15;
  [v12 enumerateKeysAndObjectsUsingBlock:v30];

  if ([v15 count])
  {
    id v22 = v14;
    [v14 objectForKeyedSubscript:v13];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v21 = [v11 subRelationshipProperties];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_3;
          v24[3] = &unk_1E586A9E8;
          v24[4] = v20;
          id v25 = v15;
          [v21 enumerateKeysAndObjectsUsingBlock:v24];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
    }

    id v14 = v22;
  }
}

void __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 relatedEntityPropertyNames];
  if (v7)
  {
  }
  else
  {
    uint64_t v12 = [v6 subRelationshipProperties];
    if (!v12) {
      goto LABEL_30;
    }
    id v13 = (void *)v12;
    char v14 = [v6 isToManySubRelationship];

    if (v14) {
      goto LABEL_30;
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [v6 relatedEntityPropertyNames];

  id v35 = v6;
  if (v9)
  {
    id v10 = [v6 relatedEntityPropertyNames];
    id v11 = [v10 allObjects];
    [v8 addObjectsFromArray:v11];
  }
  else
  {
    id v15 = [v6 subRelationshipProperties];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_2;
    v52[3] = &unk_1E5861CC0;
    id v53 = v8;
    [v15 enumerateKeysAndObjectsUsingBlock:v52];
  }
  id v34 = [NSString stringWithFormat:@"%@.%@.pk", *(void *)(a1 + 32), v5];
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v8;
  uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v41)
  {
    uint64_t v17 = *(void *)v49;
    unint64_t v18 = 0x1E4F1C000uLL;
    uint64_t v38 = a1;
    id v39 = v5;
    uint64_t v36 = *(void *)v49;
    id v37 = v16;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        Class v43 = [NSString stringWithFormat:@"%@.%@.%@", *(void *)(a1 + 32), v5, v42];
        uint64_t v20 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
        id v21 = objc_alloc_init(*(Class *)(v18 + 2656));
        if (v20) {
          BOOL v22 = v16 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          uint64_t v23 = [v16 objectEnumerator];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v24 = v20;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v45;
LABEL_20:
            uint64_t v28 = 0;
            while (1)
            {
              if (*(void *)v45 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v44 + 1) + 8 * v28);
              uint64_t v30 = [v23 nextObject];
              if (!v30) {
                break;
              }
              id v31 = (void *)v30;
              [v21 setObject:v29 forKeyedSubscript:v30];

              if (v26 == ++v28)
              {
                uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v54 count:16];
                if (v26) {
                  goto LABEL_20;
                }
                break;
              }
            }
          }

          a1 = v38;
          id v5 = v39;
          id v32 = *(void **)(v38 + 48);
          id v33 = [NSString stringWithFormat:@"%@.%@", v39, v42];
          [v32 setObject:v21 forKeyedSubscript:v33];

          uint64_t v17 = v36;
          uint64_t v16 = v37;
          unint64_t v18 = 0x1E4F1C000;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v41);
  }

  id v6 = v35;
LABEL_30:
}

void __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v5 = a3;
  id v6 = [v5 relatedEntityPropertyNames];
  if (v6)
  {
  }
  else
  {
    uint64_t v14 = [v5 subRelationshipProperties];
    if (!v14) {
      goto LABEL_19;
    }
    id v15 = (void *)v14;
    char v16 = [v5 isToManySubRelationship];

    if (v16) {
      goto LABEL_19;
    }
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [v27 stringByAppendingString:@"PrimaryKey"];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v26 = (void *)v9;
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = [v5 relatedEntityPropertyNames];

    if (v11)
    {
      uint64_t v12 = [v5 relatedEntityPropertyNames];
      id v13 = [v12 allObjects];
      [v10 addObjectsFromArray:v13];
    }
    else
    {
      uint64_t v17 = [v5 subRelationshipProperties];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_4;
      v32[3] = &unk_1E5861CC0;
      id v33 = v10;
      [v17 enumerateKeysAndObjectsUsingBlock:v32];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [NSString stringWithFormat:@"%@.%@", v27, *(void *)(*((void *)&v28 + 1) + 8 * i)];
          id v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v23];
          uint64_t v25 = [v24 objectForKeyedSubscript:v26];
          [*(id *)(a1 + 32) setObject:v25 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v20);
    }
  }
LABEL_19:
}

uint64_t __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)_comparePayloadAttributes:(id)a3 toObjectDictionary:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 errorDescriptions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke;
  v22[3] = &unk_1E5861C98;
  id v17 = v14;
  id v23 = v17;
  id v24 = self;
  id v18 = v12;
  id v25 = v18;
  id v19 = v13;
  id v26 = v19;
  id v20 = v16;
  id v27 = v20;
  long long v28 = &v29;
  [v15 enumerateKeysAndObjectsUsingBlock:v22];
  LOBYTE(v12) = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return (char)v12;
}

void __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v100[8] = *MEMORY[0x1E4F143B8];
  id v75 = a2;
  id v68 = a3;
  uint64_t v4 = [v68 subRelationshipProperties];

  if (!v4)
  {
    id v66 = [*(id *)(a1 + 40) payloadValueFromAttributes:*(void *)(a1 + 48) forPayloadProperty:v68];
    long long v67 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v75];
    id v19 = [v68 key];

    if (!v19)
    {
      BOOL v22 = 0;
      goto LABEL_63;
    }
    if ([v68 isUUIDKey])
    {
      id v20 = NSString;
      uint64_t v21 = [*(id *)(a1 + 56) objectForKeyedSubscript:v67];
      BOOL v22 = [v20 stringWithFormat:@"%@", v21];

      id v23 = [*(id *)(*(void *)(a1 + 40) + 24) payloadIDString];
      LOBYTE(v20) = [(__CFString *)v22 isEqualToString:v23];

      if (v20) {
        goto LABEL_63;
      }
      goto LABEL_55;
    }
    long long v30 = [v68 relatedEntityPropertyNames];
    uint64_t v65 = v30;
    uint64_t v31 = v30;
    if (v30)
    {
      if ([v30 count] == 1)
      {
        char v32 = NSString;
        uint64_t v33 = *(void *)(a1 + 32);
        id v34 = [v31 anyObject];
        uint64_t v35 = [v32 stringWithFormat:@"%@%@.%@", v33, v75, v34];

        BOOL v22 = [*(id *)(a1 + 56) objectForKeyedSubscript:v35];
        long long v67 = (void *)v35;
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v42 = v31;
        uint64_t v74 = [v42 countByEnumeratingWithState:&v77 objects:v98 count:16];
        if (v74)
        {
          Class v43 = 0;
          uint64_t v70 = *(void *)v78;
          id v72 = 0;
          do
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v78 != v70) {
                objc_enumerationMutation(v42);
              }
              uint64_t v45 = *(void *)(*((void *)&v77 + 1) + 8 * i);
              long long v46 = [NSString stringWithFormat:@"%@%@.%@", *(void *)(a1 + 32), v75, v45];
              long long v47 = [*(id *)(a1 + 56) objectForKeyedSubscript:v46];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (!v43) {
                  Class v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
                }
                if ([v47 count])
                {
                  unint64_t v48 = 0;
                  do
                  {
                    if (v48 >= [v43 count]
                      || ([v43 objectAtIndex:v48],
                          (long long v49 = objc_claimAutoreleasedReturnValue()) == 0))
                    {
                      long long v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v42, "count"));
                      [v43 addObject:v49];
                    }
                    long long v50 = [v47 objectAtIndex:v48];
                    [v49 setObject:v50 forKeyedSubscript:v45];

                    ++v48;
                  }
                  while (v48 < [v47 count]);
                }
              }
              else
              {
                long long v51 = v72;
                if (!v72) {
                  long long v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v42, "count"));
                }
                id v72 = v51;
                [v51 setObject:v47 forKeyedSubscript:v45];
              }
            }
            uint64_t v74 = [v42 countByEnumeratingWithState:&v77 objects:v98 count:16];
          }
          while (v74);
        }
        else
        {
          Class v43 = 0;
          id v72 = 0;
        }

        if (v43) {
          id v52 = v43;
        }
        else {
          id v52 = v72;
        }
        BOOL v22 = v52;
      }
    }
    else
    {
      BOOL v22 = [*(id *)(a1 + 56) objectForKeyedSubscript:v67];
    }
    if (v22)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_54;
      }
      BOOL v53 = [(__CFString *)v22 count] == 0;
    }
    else
    {
      BOOL v53 = 1;
    }
    if (v53 && !v66)
    {
      __int16 v54 = 0;
LABEL_62:

      id v66 = v54;
      goto LABEL_63;
    }
LABEL_54:
    char v55 = [*(id *)(a1 + 40) comparePayloadValue:v66 toObjectDictionaryValue:v22 forPayloadProperty:v68];

    if ((v55 & 1) == 0)
    {
LABEL_55:
      uint64_t v56 = v22;
      if (v22) {
        id v57 = v22;
      }
      else {
        id v57 = @"<nil>";
      }
      BOOL v22 = v57;

      if (v66) {
        uint64_t v58 = v66;
      }
      else {
        uint64_t v58 = @"<nil>";
      }
      __int16 v54 = v58;

      v96[0] = @"payloadClassID";
      v59 = [(id)objc_opt_class() payloadClassID];
      uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 24);
      v97[0] = v59;
      v97[1] = v60;
      v96[1] = @"payloadID";
      v96[2] = @"type";
      v97[2] = @"value";
      v97[3] = v67;
      v96[3] = @"objectDictionaryKeyPath";
      v96[4] = @"payloadKey";
      char v61 = [v68 key];
      v97[4] = v61;
      v96[5] = @"objectDictionaryValue";
      v96[6] = @"payloadValue";
      v97[5] = v22;
      v97[6] = v54;
      v96[7] = @"description";
      v62 = NSString;
      id v63 = [v68 key];
      id v64 = [v62 stringWithFormat:@"values not equal: %@: %@, %@: %@", v67, v22, v63, v54];
      v97[7] = v64;
      uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:8];

      [*(id *)(a1 + 64) addObject:v65];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      goto LABEL_62;
    }
LABEL_63:

    goto LABEL_64;
  }
  char v5 = [v68 isToManySubRelationship];
  id v6 = [*(id *)(a1 + 32) stringByAppendingString:v75];
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 40) _resolveRelationshipsInObjectDictionary:*(void *)(a1 + 56) atKeyPath:v6 forPayloadProperty:v68];
    id v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_2;
    v93[3] = &unk_1E5861C20;
    id v9 = v68;
    uint64_t v10 = *(void *)(a1 + 40);
    id v94 = v9;
    uint64_t v95 = v10;
    id v11 = [v8 indexesOfObjectsPassingTest:v93];

    id v12 = *(void **)(a1 + 48);
    id v13 = [v9 key];
    id v14 = [v12 objectForKeyedSubscript:v13];

    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    BOOL v92 = 0;
    uint64_t v15 = [v11 count];
    BOOL v92 = v15 == [v14 count];
    if (*((unsigned char *)v90 + 24))
    {
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_3;
      v81[3] = &unk_1E5861C70;
      id v82 = *(id *)(a1 + 56);
      id v83 = v7;
      id v16 = v14;
      uint64_t v17 = *(void *)(a1 + 40);
      id v84 = v16;
      uint64_t v85 = v17;
      id v86 = v9;
      id v87 = *(id *)(a1 + 64);
      v88 = &v89;
      [v11 enumerateIndexesUsingBlock:v81];

      id v18 = v82;
    }
    else
    {
      v99[0] = @"payloadClassID";
      v73 = [(id)objc_opt_class() payloadClassID];
      v100[0] = v73;
      v99[1] = @"payloadID";
      v71 = [*(id *)(*(void *)(a1 + 40) + 24) payloadIDString];
      v100[1] = v71;
      v100[2] = @"to-many count";
      v99[2] = @"type";
      v99[3] = @"objectDictionaryKeyPath";
      v100[3] = v7;
      v99[4] = @"payloadKey";
      long long v69 = [v9 key];
      v100[4] = v69;
      v99[5] = @"objectDictionaryCount";
      uint64_t v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v100[5] = v36;
      v99[6] = @"payloadAttributeListCount";
      id v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v100[6] = v37;
      v99[7] = @"description";
      uint64_t v38 = NSString;
      uint64_t v39 = [v11 count];
      Class v40 = [v9 key];
      uint64_t v41 = [v38 stringWithFormat:@"differing number of entries: %@: %ld, %@: %ld", v7, v39, v40, objc_msgSend(v14, "count")];
      v100[7] = v41;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:8];

      [*(id *)(a1 + 64) addObject:v18];
    }

    if (!*((unsigned char *)v90 + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
    _Block_object_dispose(&v89, 8);
  }
  else
  {
    id v24 = [v6 stringByAppendingString:@"."];

    id v25 = *(void **)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 56);
    long long v28 = [v68 subRelationshipProperties];
    char v29 = [v25 _comparePayloadAttributes:v26 toObjectDictionary:v27 currentKeyPath:v24 usingModelProperties:v28 errorDescriptions:*(void *)(a1 + 64)];

    if ((v29 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
LABEL_64:
}

uint64_t __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) subRelationshipEntityName];
  if (v4)
  {
    char v5 = objc_opt_class();
    id v6 = [*(id *)(a1 + 32) subRelationshipEntityName];
    uint64_t v7 = [v5 isValidForPersistenceWithObjectDictionary:v3 additionalEntityName:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  char v5 = [v4 objectAtIndexedSubscript:a2];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_4;
  v53[3] = &unk_1E5861C48;
  id v6 = *(void **)(a1 + 48);
  void v53[4] = *(void *)(a1 + 56);
  id v44 = v5;
  id v54 = v44;
  id v55 = *(id *)(a1 + 64);
  uint64_t v7 = [v6 indexesOfObjectsPassingTest:v53];
  if ([v7 count])
  {
    if ((unint64_t)[v7 count] < 2) {
      goto LABEL_20;
    }
    id v8 = [*(id *)(a1 + 48) objectsAtIndexes:v7];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v16 = *(void **)(a1 + 56);
          uint64_t v17 = [*(id *)(a1 + 64) subRelationshipProperties];
          id v18 = [v16 _attributesForPayloadAttributes:v15 usingModelProperties:v17];
          [v9 addObject:v18];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v12);
    }

    v56[0] = @"payloadClassID";
    Class v43 = [(id)objc_opt_class() payloadClassID];
    v57[0] = v43;
    v56[1] = @"payloadID";
    id v42 = [*(id *)(*(void *)(a1 + 56) + 24) payloadIDString];
    v57[1] = v42;
    v57[2] = @"to-many multiple matches";
    v56[2] = @"type";
    v56[3] = @"objectDictionaryKeyPath";
    v57[3] = *(void *)(a1 + 40);
    v56[4] = @"payloadKey";
    id v19 = [*(id *)(a1 + 64) key];
    v57[4] = v19;
    v57[5] = v44;
    v56[5] = @"objectDictionaryValue";
    v56[6] = @"payloadValue";
    v57[6] = v9;
    v56[7] = @"description";
    id v20 = NSString;
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = [v7 count];
    id v23 = [*(id *)(a1 + 64) key];
    id v24 = [v20 stringWithFormat:@"%@: %@ matches %ld payloads: %@: %@", v21, v44, v22, v23, v9];
    v57[7] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:8];

    [*(id *)(a1 + 72) addObject:v25];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v26 = *(id *)(a1 + 48);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          char v32 = *(void **)(a1 + 56);
          uint64_t v33 = [*(id *)(a1 + 64) subRelationshipProperties];
          id v34 = [v32 _attributesForPayloadAttributes:v31 usingModelProperties:v33];
          [v10 addObject:v34];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v28);
    }

    v59[0] = @"payloadClassID";
    uint64_t v35 = [(id)objc_opt_class() payloadClassID];
    v60[0] = v35;
    v59[1] = @"payloadID";
    uint64_t v36 = [*(id *)(*(void *)(a1 + 56) + 24) payloadIDString];
    v60[1] = v36;
    v60[2] = @"to-many none match";
    v59[2] = @"type";
    void v59[3] = @"objectDictionaryKeyPath";
    v60[3] = *(void *)(a1 + 40);
    v59[4] = @"payloadKey";
    id v37 = [*(id *)(a1 + 64) key];
    v60[4] = v37;
    v60[5] = v44;
    v59[5] = @"objectDictionaryValue";
    v59[6] = @"payloadValue";
    v60[6] = v10;
    v59[7] = @"description";
    uint64_t v38 = NSString;
    uint64_t v39 = *(void *)(a1 + 40);
    Class v40 = [*(id *)(a1 + 64) key];
    uint64_t v41 = [v38 stringWithFormat:@"%@: %@ doesn't match any payload in: %@: %@", v39, v44, v40, v10];
    v60[7] = v41;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:8];

    [*(id *)(a1 + 72) addObject:v9];
  }

LABEL_20:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v7 count] == 1;
  }
}

uint64_t __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_4(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v5 = a2;
  id v6 = [v4 subRelationshipProperties];
  uint64_t v7 = [v2 _comparePayloadAttributes:v5 toObjectDictionary:v3 currentKeyPath:&stru_1EEB2EB80 usingModelProperties:v6 errorDescriptions:0];

  return v7;
}

+ (BOOL)_populateObjectDictionary:(id)a3 withObject:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 payloadClass:(Class)a7 info:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __170__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateObjectDictionary_withObject_currentKeyPath_usingModelProperties_payloadClass_info___block_invoke;
  v24[3] = &unk_1E5861CE8;
  id v19 = v15;
  id v25 = v19;
  id v20 = v18;
  id v26 = v20;
  uint64_t v29 = &v32;
  id v21 = v16;
  id v27 = v21;
  id v30 = a1;
  id v22 = v14;
  id v28 = v22;
  Class v31 = a7;
  [v17 enumerateKeysAndObjectsUsingBlock:v24];
  LOBYTE(a7) = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return (char)a7;
}

void __170__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateObjectDictionary_withObject_currentKeyPath_usingModelProperties_payloadClass_info___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ([v8 hasSourceObjectValue])
  {
    id v9 = [*(id *)(a1 + 32) valueForKey:v7];
    id v10 = *(void **)(a1 + 40);
    if (v10
      && ([v10 validForPersistenceWithPayloadProperty:v8 andValue:v9 stop:*(void *)(*(void *)(a1 + 64) + 8) + 24] & 1) == 0)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a4 = 1;
      }
      goto LABEL_63;
    }
    uint64_t v11 = [v8 subRelationshipProperties];

    id v69 = v7;
    uint64_t v70 = a1;
    if (v11)
    {
      uint64_t v62 = a4;
      if (([v8 isToManySubRelationship] & 1) == 0)
      {
        uint64_t v41 = [*(id *)(a1 + 48) stringByAppendingString:v7];
        id v42 = [v41 stringByAppendingString:@"."];

        Class v43 = v9;
        id v44 = v9;
        long long v45 = *(void **)(a1 + 72);
        uint64_t v46 = *(void *)(a1 + 56);
        long long v47 = [v8 subRelationshipProperties];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v45 _populateObjectDictionary:v46 withObject:v44 currentKeyPath:v42 usingModelProperties:v47 payloadClass:*(void *)(a1 + 80) info:*(void *)(a1 + 40)];

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          unsigned char *v62 = 1;
        }

        id v9 = v43;
        goto LABEL_63;
      }
      id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v60 = [*(id *)(a1 + 48) stringByAppendingString:v7];
      uint64_t v58 = v9;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id obj = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v88;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v88 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = [*(id *)(v70 + 80) payloadAdapterForManagedObject:*(void *)(*((void *)&v87 + 1) + 8 * i)];
            if ([v16 isValidForJournalPersistence])
            {
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v18 = *(void **)(v70 + 72);
              id v19 = [v16 sourceObject];
              id v20 = v8;
              id v21 = [v8 subRelationshipProperties];
              *(unsigned char *)(*(void *)(*(void *)(v70 + 64) + 8) + 24) = [v18 _populateObjectDictionary:v17 withObject:v19 currentKeyPath:&stru_1EEB2EB80 usingModelProperties:v21 payloadClass:*(void *)(v70 + 80) info:*(void *)(v70 + 40)];

              if (*(unsigned char *)(*(void *)(*(void *)(v70 + 64) + 8) + 24))
              {
                *a4 = 1;

                id v7 = v69;
                id v9 = v58;
                id v8 = v20;
                goto LABEL_63;
              }
              [v64 addObject:v17];

              id v7 = v69;
              id v8 = v20;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      [*(id *)(v70 + 56) setObject:v64 forKeyedSubscript:v60];
    }
    else
    {
      id v22 = [v8 relatedEntityPropertyNames];

      if (!v22)
      {
        if (([v8 isUUIDKey] & 1) != 0
          || ([v8 key], long long v48 = objc_claimAutoreleasedReturnValue(), v48, v48))
        {
          long long v49 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 48), v7];
          [*(id *)(a1 + 56) setObject:v9 forKeyedSubscript:v49];
        }
        goto LABEL_63;
      }
      objc_opt_class();
      id v63 = v8;
      uint64_t v58 = v9;
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v23 = [v8 relatedEntityPropertyNames];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v83 objects:v94 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v84 != v26) {
                objc_enumerationMutation(v23);
              }
              id v28 = [NSString stringWithFormat:@"%@%@.%@", *(void *)(a1 + 48), v69, *(void *)(*((void *)&v83 + 1) + 8 * j)];
              id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [*(id *)(a1 + 56) setObject:v29 forKeyedSubscript:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v83 objects:v94 count:16];
          }
          while (v25);
        }

        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v59 = v58;
        id v7 = v69;
        uint64_t v65 = [v59 countByEnumeratingWithState:&v79 objects:v93 count:16];
        if (v65)
        {
          uint64_t v61 = *(void *)v80;
          do
          {
            id v30 = 0;
            do
            {
              if (*(void *)v80 != v61) {
                objc_enumerationMutation(v59);
              }
              obja = v30;
              Class v31 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v30);
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              uint64_t v32 = [v63 relatedEntityPropertyNames];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v75 objects:v92 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v76;
                do
                {
                  for (uint64_t k = 0; k != v34; ++k)
                  {
                    if (*(void *)v76 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v37 = *(void *)(*((void *)&v75 + 1) + 8 * k);
                    uint64_t v38 = [NSString stringWithFormat:@"%@%@.%@", *(void *)(v70 + 48), v7, v37];
                    uint64_t v39 = [v31 valueForKeyPath:v37];
                    if (v39)
                    {
                      Class v40 = [*(id *)(v70 + 56) objectForKeyedSubscript:v38];
                      [v40 addObject:v39];

                      id v7 = v69;
                    }
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v75 objects:v92 count:16];
                }
                while (v34);
              }

              id v30 = obja + 1;
            }
            while (obja + 1 != (char *)v65);
            uint64_t v65 = [v59 countByEnumeratingWithState:&v79 objects:v93 count:16];
          }
          while (v65);
        }
      }
      else
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id objb = [v8 relatedEntityPropertyNames];
        uint64_t v50 = [objb countByEnumeratingWithState:&v71 objects:v91 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v72;
          do
          {
            for (uint64_t m = 0; m != v51; ++m)
            {
              if (*(void *)v72 != v52) {
                objc_enumerationMutation(objb);
              }
              uint64_t v54 = *(void *)(*((void *)&v71 + 1) + 8 * m);
              id v55 = [NSString stringWithFormat:@"%@%@.%@", *(void *)(v70 + 48), v7, v54];
              uint64_t v56 = [NSString stringWithFormat:@"%@.%@", v7, v54];
              id v57 = [*(id *)(v70 + 32) valueForKeyPath:v56];
              [*(id *)(v70 + 56) setObject:v57 forKeyedSubscript:v55];
            }
            uint64_t v51 = [objb countByEnumeratingWithState:&v71 objects:v91 count:16];
          }
          while (v51);
        }
      }
      id v8 = v63;
    }
    id v9 = v58;
LABEL_63:
  }
}

+ (void)_populateValidationProperties:(id)a3 fromEntityDescription:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __131__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateValidationProperties_fromEntityDescription___block_invoke;
  v8[3] = &unk_1E5861B08;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __131__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateValidationProperties_fromEntityDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v5 subRelationshipProperties];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) relationshipsByName];
    id v8 = [v7 objectForKeyedSubscript:v14];

    if (!v8)
    {
LABEL_5:

      goto LABEL_7;
    }
    id v9 = *(void **)(a1 + 40);
    id v10 = [v5 subRelationshipProperties];
    uint64_t v11 = [v8 destinationEntity];
    [v9 _populateValidationProperties:v10 fromEntityDescription:v11];

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v12 = [v5 relatedEntityPropertyNames];

  if (!v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) attributesByName];
    id v8 = [v13 objectForKeyedSubscript:v14];

    if (!v8) {
      goto LABEL_5;
    }
    objc_msgSend(v5, "setOptional:", objc_msgSend(v8, "isOptional"));
    id v10 = [v8 defaultValue];
    [v5 setDefaultValue:v10];
    goto LABEL_4;
  }
LABEL_7:
}

+ (void)_validateModelProperties:(id)a3 nonPersistedModelProperties:(id)a4 forEntityDescription:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 attributesByName];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke;
  v21[3] = &unk_1E5861BD0;
  id v12 = v8;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  id v24 = a1;
  [v11 enumerateKeysAndObjectsUsingBlock:v21];

  id v14 = [v10 relationshipsByName];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke_2;
  v17[3] = &unk_1E5861BF8;
  id v18 = v12;
  id v19 = v13;
  id v20 = a1;
  id v15 = v13;
  id v16 = v12;
  [v14 enumerateKeysAndObjectsUsingBlock:v17];
}

void __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke(id *a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  id v6 = [a1[4] objectForKeyedSubscript:v25];
  id v7 = [a1[5] objectForKeyedSubscript:v25];
  if (v6)
  {
    uint64_t v8 = [v6 key];
    if (v8)
    {
      id v9 = (void *)v8;
      char v10 = [v6 isUUIDKey];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [v5 attributeType];
        if (v11 != [v6 type])
        {
          id v21 = (void *)MEMORY[0x1E4F1CA00];
          id v15 = [NSString stringWithFormat:@"Mismatch between attribute and payload types for attribute name: %@ (%lu != %lu)", v25, objc_msgSend(v5, "attributeType"), objc_msgSend(v6, "type")];
          id v22 = [v21 exceptionWithName:@"PayloadPropertyValidationException" reason:v15 userInfo:0];
          goto LABEL_17;
        }
        id v12 = [v6 subRelationshipProperties];

        if (v12)
        {
          id v13 = (void *)MEMORY[0x1E4F1CA00];
          id v23 = NSString;
          id v15 = [v6 key];
          [v23 stringWithFormat:@"Sub-relation property %@ defined as an attribute: %@", v15, v25];
          goto LABEL_16;
        }
        if (v7)
        {
          id v13 = (void *)MEMORY[0x1E4F1CA00];
          id v14 = NSString;
          id v15 = [v6 key];
          [v14 stringWithFormat:@"attribute %@ defined as both a persisted and non-persisted property for payload property: %@", v25, v15];
          id v24 = LABEL_16:;
          id v22 = [v13 exceptionWithName:@"PayloadPropertyValidationException" reason:v24 userInfo:0];

LABEL_17:
          objc_exception_throw(v22);
        }
      }
    }
  }
  else if (([v5 isTransient] & 1) == 0 && !v7)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    id v17 = NSString;
    id v18 = [a1[6] payloadClassID];
    id v19 = [v17 stringWithFormat:@"attribute %@ not defined as a persisted or non-persisted property for %@", v25, v18];
    id v20 = [v16 exceptionWithName:@"PayloadPropertyValidationException" reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
}

void __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v49 = a2;
  id v5 = a3;
  id v6 = [a1[4] objectForKeyedSubscript:v49];
  uint64_t v7 = [a1[5] objectForKeyedSubscript:v49];
  uint64_t v8 = (void *)v7;
  if (!v6)
  {
    if (!v7)
    {
      id v24 = (void *)MEMORY[0x1E4F1CA00];
      id v25 = NSString;
      uint64_t v26 = [a1[6] payloadClassID];
      id v27 = [v25 stringWithFormat:@"relationship %@ not defined as a persisted or non-persisted property for %@", v49, v26];
      id v28 = [v24 exceptionWithName:@"PayloadPropertyValidationException" reason:v27 userInfo:0];

      objc_exception_throw(v28);
    }
    goto LABEL_17;
  }
  if ([v6 isUUIDKey]) {
    goto LABEL_17;
  }
  if (v8)
  {
    id v9 = [v8 subRelationshipProperties];

    if (!v9)
    {
      id v30 = (void *)MEMORY[0x1E4F1CA00];
      Class v31 = NSString;
      uint64_t v32 = [v6 key];
      [v31 stringWithFormat:@"relationship %@ defined as both a persisted and non-persisted property for payload property: %@", v49, v32];
      goto LABEL_22;
    }
  }
  char v10 = [v6 subRelationshipProperties];

  if (v10)
  {
    uint64_t v11 = [v8 subRelationshipProperties];

    if (v11)
    {
      uint64_t v12 = [v6 subRelationshipEntityName];
      if (v12)
      {
        id v13 = (void *)v12;
        id v14 = [v6 subRelationshipEntityName];
        id v15 = [v5 destinationEntity];
        id v16 = [v15 name];
        char v17 = [v14 isEqualToString:v16];

        if ((v17 & 1) == 0)
        {
          uint64_t v37 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v38 = NSString;
          uint64_t v39 = [v5 destinationEntity];
          Class v40 = [v39 name];
          uint64_t v41 = [v6 subRelationshipEntityName];
          id v42 = [v38 stringWithFormat:@"relationship %@ destination entity name %@ does not match sub-relationship entity name %@", v49, v40, v41];
          id v43 = [v37 exceptionWithName:@"PayloadPropertyValidationException" reason:v42 userInfo:0];

          objc_exception_throw(v43);
        }
      }
      int v18 = [v6 isToManySubRelationship];
      if (v18 == [v5 isToMany])
      {
        id v19 = a1[6];
        id v20 = [v6 subRelationshipProperties];
        id v21 = [v8 subRelationshipProperties];
        id v22 = [v5 destinationEntity];
        [v19 _validateModelProperties:v20 nonPersistedModelProperties:v21 forEntityDescription:v22];

        goto LABEL_11;
      }
      uint64_t v36 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v32 = [NSString stringWithFormat:@"relationship %@ isToMany %d does not match sub-relationship isToMany %d", v49, objc_msgSend(v5, "isToMany"), objc_msgSend(v6, "isToManySubRelationship")];
      id v35 = [v36 exceptionWithName:@"PayloadPropertyValidationException" reason:v32 userInfo:0];
LABEL_24:

      goto LABEL_25;
    }
    id v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = NSString;
    uint64_t v32 = [v6 key];
    [v33 stringWithFormat:@"relationship %@ defines persisted sub-relationship properties but no non-persisted sub-relationship properties : %@", v49, v32];
    uint64_t v34 = LABEL_22:;
    id v35 = [v30 exceptionWithName:@"PayloadPropertyValidationException" reason:v34 userInfo:0];

    goto LABEL_24;
  }
LABEL_11:
  id v23 = [v6 relatedEntityPropertyNames];
  if (!v23 || [v6 shouldPrefetchRelationship])
  {

    goto LABEL_17;
  }
  id v29 = [v5 inverseRelationship];

  if (!v29)
  {
    id v44 = (void *)MEMORY[0x1E4F1CA00];
    long long v45 = NSString;
    uint64_t v46 = [v6 relatedEntityPropertyNames];
    long long v47 = [v6 key];
    long long v48 = [v45 stringWithFormat:@"relationship %@ defines relationPropertyNames (%@) but the model does not define an inverse relationship: %@", v49, v46, v47];
    id v35 = [v44 exceptionWithName:@"PayloadPropertyValidationException" reason:v48 userInfo:0];

LABEL_25:
    objc_exception_throw(v35);
  }
LABEL_17:
}

@end