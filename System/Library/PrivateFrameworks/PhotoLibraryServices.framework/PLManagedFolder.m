@interface PLManagedFolder
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)childKeyForOrdering;
+ (id)entityName;
+ (id)insertNewFolderWithTitle:(id)a3 kind:(int)a4 intoLibrary:(id)a5;
+ (id)localizedRecoveredTitle;
+ (id)sortDescriptorsForAlbumsInFolderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4;
+ (id)validKindsForPersistence;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
- (BOOL)albumHasFixedOrder:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)canEditContainers;
- (BOOL)canPerformDeleteOperation;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)hasAtLeastOneAlbum;
- (BOOL)isEmpty;
- (BOOL)isValidForPersistence;
- (BOOL)needsFixedOrderKeysComplianceUpdate;
- (BOOL)needsPersistenceUpdate;
- (BOOL)needsReordering;
- (NSString)_prettyDescription;
- (NSString)_typeDescription;
- (id)albums;
- (id)albumsSortingComparator;
- (id)assets;
- (id)childKeyForOrdering;
- (id)containersRelationshipName;
- (id)descriptionOfChildCollectionOrderValues;
- (id)identifier;
- (id)mutableAssets;
- (id)payloadForChangedKeys:(id)a3;
- (int)filter;
- (int64_t)cloudDeletionType;
- (signed)albumListType;
- (unint64_t)albumsCount;
- (unint64_t)approximateCount;
- (unint64_t)assetsCount;
- (unint64_t)containersCount;
- (unint64_t)count;
- (unint64_t)photosCount;
- (unint64_t)unreadAlbumsCount;
- (unint64_t)videosCount;
- (void)addChildCollections:(id)a3;
- (void)addChildCollectionsObject:(id)a3;
- (void)didSave;
- (void)enforceFixedOrderKeyComplianceWithOrderKeyManager:(id)a3;
- (void)insertChildCollections:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4;
- (void)moveChildCollectionsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5;
- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4;
- (void)prepareForDeletion;
- (void)removeChildCollections:(id)a3;
- (void)removeChildCollectionsAtIndexes:(id)a3;
- (void)removeChildCollectionsObject:(id)a3;
- (void)removeObjectFromChildCollectionsAtIndex:(unint64_t)a3;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)replaceChildCollectionsAtIndexes:(id)a3 withChildCollections:(id)a4;
- (void)replaceObjectInChildCollectionsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setNeedsFixedOrderKeysComplianceUpdate:(BOOL)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)willSave;
@end

@implementation PLManagedFolder

+ (id)entityName
{
  return @"Folder";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLManagedFolder *)self isValidForPersistence]) {
    v5 = [(PLManagedObjectJournalEntryPayload *)[PLFolderJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setNeedsFixedOrderKeysComplianceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

- (BOOL)needsFixedOrderKeysComplianceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (void)removeChildCollections:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLManagedFolder *)self willAccessValueForKey:@"childCollections"];
  v5 = [(PLManagedFolder *)self primitiveChildCollections];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v5, "indexOfObject:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
          [v6 addIndex:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(PLManagedFolder *)self didAccessValueForKey:@"childCollections"];
  if ([v6 count])
  {
    [(PLManagedFolder *)self willChange:3 valuesAtIndexes:v6 forKey:@"childCollections"];
    v13 = [(PLManagedFolder *)self primitiveChildCollections];
    [v13 removeObjectsAtIndexes:v6];

    [(PLManagedFolder *)self didChange:3 valuesAtIndexes:v6 forKey:@"childCollections"];
  }
}

- (void)addChildCollections:(id)a3
{
  id v4 = a3;
  [(PLManagedFolder *)self willAccessValueForKey:@"childCollections"];
  v5 = [(PLManagedFolder *)self primitiveValueForKey:@"childCollections"];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count];

  id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v6, v7);
  [(PLManagedFolder *)self didAccessValueForKey:@"childCollections"];
  [(PLManagedFolder *)self willChange:2 valuesAtIndexes:v10 forKey:@"childCollections"];
  uint64_t v8 = [(PLManagedFolder *)self primitiveChildCollections];
  uint64_t v9 = [v4 array];

  [v8 insertObjects:v9 atIndexes:v10];
  [(PLManagedFolder *)self didChange:2 valuesAtIndexes:v10 forKey:@"childCollections"];
}

- (void)removeChildCollectionsObject:(id)a3
{
  id v4 = a3;
  [(PLManagedFolder *)self willAccessValueForKey:@"childCollections"];
  v5 = [(PLManagedFolder *)self primitiveChildCollections];
  uint64_t v6 = [v5 indexOfObject:v4];

  [(PLManagedFolder *)self didAccessValueForKey:@"childCollections"];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v6];
    [(PLManagedFolder *)self willChange:3 valuesAtIndexes:v8 forKey:@"childCollections"];
    uint64_t v7 = [(PLManagedFolder *)self primitiveChildCollections];
    [v7 removeObjectAtIndex:v6];

    [(PLManagedFolder *)self didChange:3 valuesAtIndexes:v8 forKey:@"childCollections"];
  }
}

- (void)addChildCollectionsObject:(id)a3
{
  id v4 = a3;
  [(PLManagedFolder *)self willAccessValueForKey:@"childCollections"];
  id v5 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v6 = [(PLManagedFolder *)self primitiveChildCollections];
  id v8 = (id)objc_msgSend(v5, "initWithIndex:", objc_msgSend(v6, "count"));

  [(PLManagedFolder *)self didAccessValueForKey:@"childCollections"];
  [(PLManagedFolder *)self willChange:2 valuesAtIndexes:v8 forKey:@"childCollections"];
  uint64_t v7 = [(PLManagedFolder *)self primitiveChildCollections];
  [v7 addObject:v4];

  [(PLManagedFolder *)self didChange:2 valuesAtIndexes:v8 forKey:@"childCollections"];
}

- (void)moveChildCollectionsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  [(PLManagedFolder *)self willAccessValueForKey:@"childCollections"];
  uint64_t v7 = [(PLManagedFolder *)self primitiveChildCollections];
  id v9 = [v7 objectsAtIndexes:v6];

  [(PLManagedFolder *)self didAccessValueForKey:@"childCollections"];
  [(PLManagedFolder *)self removeChildCollectionsAtIndexes:v6];

  id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a4, objc_msgSend(v9, "count"));
  [(PLManagedFolder *)self insertChildCollections:v9 atIndexes:v8];
}

- (void)replaceChildCollectionsAtIndexes:(id)a3 withChildCollections:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [(PLManagedFolder *)self willChange:3 valuesAtIndexes:v8 forKey:@"childCollections"];
  uint64_t v7 = [(PLManagedFolder *)self primitiveChildCollections];
  [v7 replaceObjectsAtIndexes:v8 withObjects:v6];

  [(PLManagedFolder *)self didChange:3 valuesAtIndexes:v8 forKey:@"childCollections"];
}

- (void)removeChildCollectionsAtIndexes:(id)a3
{
  id v5 = a3;
  [(PLManagedFolder *)self willChange:3 valuesAtIndexes:v5 forKey:@"childCollections"];
  id v4 = [(PLManagedFolder *)self primitiveChildCollections];
  [v4 removeObjectsAtIndexes:v5];

  [(PLManagedFolder *)self didChange:3 valuesAtIndexes:v5 forKey:@"childCollections"];
}

- (void)insertChildCollections:(id)a3 atIndexes:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(PLManagedFolder *)self willChange:2 valuesAtIndexes:v8 forKey:@"childCollections"];
  uint64_t v7 = [(PLManagedFolder *)self primitiveChildCollections];
  [v7 insertObjects:v6 atIndexes:v8];

  [(PLManagedFolder *)self didChange:2 valuesAtIndexes:v8 forKey:@"childCollections"];
}

- (void)replaceObjectInChildCollectionsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28D60];
  id v7 = a4;
  id v9 = (id)[[v6 alloc] initWithIndex:a3];
  [(PLManagedFolder *)self willChange:4 valuesAtIndexes:v9 forKey:@"childCollections"];
  id v8 = [(PLManagedFolder *)self primitiveChildCollections];
  [v8 replaceObjectAtIndex:a3 withObject:v7];

  [(PLManagedFolder *)self didChange:4 valuesAtIndexes:v9 forKey:@"childCollections"];
}

- (void)removeObjectFromChildCollectionsAtIndex:(unint64_t)a3
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
  [(PLManagedFolder *)self willChange:3 valuesAtIndexes:v6 forKey:@"childCollections"];
  id v5 = [(PLManagedFolder *)self primitiveChildCollections];
  [v5 removeObjectAtIndex:a3];

  [(PLManagedFolder *)self didChange:3 valuesAtIndexes:v6 forKey:@"childCollections"];
}

- (void)insertObject:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28D60];
  id v7 = a3;
  id v9 = (id)[[v6 alloc] initWithIndex:a4];
  [(PLManagedFolder *)self willChange:2 valuesAtIndexes:v9 forKey:@"childCollections"];
  id v8 = [(PLManagedFolder *)self primitiveChildCollections];
  [v8 insertObject:v7 atIndex:a4];

  [(PLManagedFolder *)self didChange:2 valuesAtIndexes:v9 forKey:@"childCollections"];
}

- (NSString)_typeDescription
{
  return (NSString *)@"Folder";
}

- (NSString)_prettyDescription
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  if ([(PLManagedFolder *)self isFault])
  {
    id v4 = [(PLManagedObject *)self shortObjectIDURI];
  }
  else
  {
    id v5 = NSString;
    id v6 = [(PLManagedObject *)self shortObjectIDURI];
    id v7 = [(PLManagedFolder *)self _typeDescription];
    id v4 = [v5 stringWithFormat:@"%@ (%@)", v6, v7];
  }
  return (NSString *)v4;
}

- (void)enforceFixedOrderKeyComplianceWithOrderKeyManager:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLManagedFolder.m", 409, @"Invalid parameter not satisfying: %@", @"orderKeyManager" object file lineNumber description];
  }
  if ([v3 inWriteStashedLocationMode])
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v47 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@: Skipping enforced fixed order", buf, 0xCu);
    }
    goto LABEL_34;
  }
  uint64_t v6 = [(PLManagedFolder *)self objectID];
  id v7 = [(PLManagedFolder *)self managedObjectContext];
  v34 = v6;
  v35 = v3;
  id v8 = [v3 objectIDsAndOrderValuesForRelationship:@"childCollections" onObjectWithID:v6 invalidateCache:1 inContext:v7];

  id v9 = [v8 objectAtIndexedSubscript:0];
  v33 = v8;
  v39 = [v8 objectAtIndexedSubscript:1];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [(PLManagedFolder *)self childCollections];
  uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v10) {
    goto LABEL_27;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v43;
  uint64_t v38 = 1024;
  v13 = off_1E585E000;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      long long v16 = [v15 objectID];
      uint64_t v17 = [v9 indexOfObject:v16];
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = PLBackendGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v47 = v19;
          __int16 v48 = 2112;
          id v49 = v16;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "%@: unable to enforce order key compliance for %@, child object ID not found (ignoring)", buf, 0x16u);
        }
        goto LABEL_23;
      }
      uint64_t v20 = v17;
      v21 = [v39 objectAtIndexedSubscript:v17];
      uint64_t v22 = [v21 longLongValue];

      if (-[__objc2_class albumKindHasFixedOrder:](v13[400], "albumKindHasFixedOrder:", [v15 kindValue]))
      {
        uint64_t v23 = -[__objc2_class priorityForAlbumKind:](v13[400], "priorityForAlbumKind:", [v15 kindValue]);
        if (v22 != v23)
        {
          uint64_t v24 = v23;
          v18 = [(PLManagedFolder *)self managedObjectContext];
          v25 = v35;
          uint64_t v26 = v24;
LABEL_22:
          [v25 stashFolderAlbumsLocationValue:v26 forAlbumWithID:v16 inFolderWithID:v34 atIndex:v20 usingContext:v18];
          v13 = off_1E585E000;
LABEL_23:

          goto LABEL_25;
        }
      }
      else if (v22 < v38)
      {
        if (v38 == 1024) {
          uint64_t v27 = 0x100000;
        }
        else {
          uint64_t v27 = v38;
        }
        uint64_t v38 = v27 + 1024;
        v18 = [(PLManagedFolder *)self managedObjectContext];
        v25 = v35;
        uint64_t v26 = v27;
        goto LABEL_22;
      }
      v13 = off_1E585E000;
LABEL_25:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  }
  while (v11);
LABEL_27:

  id v3 = v35;
  if ([v35 hasStashedLocationValues])
  {
    id v41 = 0;
    char v28 = [v35 writeStashedLocationValuesInContext:0 error:&v41];
    id v29 = v41;
    if ((v28 & 1) == 0)
    {
      v30 = PLBackendGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v47 = v31;
        __int16 v48 = 2112;
        id v49 = v29;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "%@: Failed to write stashed location values for modified non fixed album order. Error: %@", buf, 0x16u);
      }
    }
  }
  id v4 = v34;
LABEL_34:
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLManagedFolder.m", 401, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedFolderMetadata alloc] initWithPLManagedFolder:self pathManager:v8];
    [(PLPersistedFolderMetadata *)v6 removePersistedData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLManagedFolder.m", 393, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedFolderMetadata alloc] initWithPLManagedFolder:self pathManager:v8];
    [(PLPersistedFolderMetadata *)v6 writePersistedData];
  }
}

- (BOOL)isValidForPersistence
{
  id v3 = [(id)objc_opt_class() validKindsForPersistence];
  id v4 = [(PLManagedFolder *)self kind];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (unint64_t)unreadAlbumsCount
{
  return 0;
}

- (int)filter
{
  return 0;
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PLManagedFolder *)self hasFaultForRelationshipNamed:@"childCollections"])
  {
    uint64_t v11 = [(PLManagedFolder *)self childCollections];
    uint64_t v12 = [v11 array];

    if (v8)
    {
      uint64_t v13 = [v12 objectsAtIndexes:v8];

      uint64_t v12 = (void *)v13;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    long long v15 = +[PLGenericAlbum entityName];
    long long v16 = (void *)[v14 initWithEntityName:v15];

    uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v12];
    [v16 setPredicate:v17];

    [v16 setIncludesPropertyValues:1];
    [v16 setReturnsObjectsAsFaults:0];
    if (v9) {
      [v16 setPropertiesToFetch:v9];
    }
    if (v10) {
      [v16 setRelationshipKeyPathsForPrefetching:v10];
    }
    v18 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v19 = [v18 managedObjectContext];

    id v23 = 0;
    uint64_t v20 = [v19 executeFetchRequest:v16 error:&v23];
    id v21 = v23;
    uint64_t v22 = v21;
    if (!v20) {
      NSLog(&cfstr_ErrorFetchingA_8.isa, self, v21);
    }
  }
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
}

- (BOOL)needsReordering
{
  return 0;
}

- (id)albumsSortingComparator
{
  return 0;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  return 0;
}

- (BOOL)canEditAlbums
{
  return 1;
}

- (signed)albumListType
{
  return 9;
}

- (BOOL)hasAtLeastOneAlbum
{
  v2 = [(PLManagedFolder *)self childCollections];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unint64_t)albumsCount
{
  v2 = [(PLManagedFolder *)self childCollections];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)albums
{
  return (id)[(PLManagedFolder *)self mutableOrderedSetValueForKey:@"childCollections"];
}

- (id)identifier
{
  return &unk_1EEBEFFA8;
}

- (id)containersRelationshipName
{
  return @"childCollections";
}

- (BOOL)canEditContainers
{
  return 1;
}

- (unint64_t)containersCount
{
  v2 = [(PLManagedFolder *)self childCollections];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)canPerformDeleteOperation
{
  return [(PLManagedFolder *)self canPerformEditOperation:32];
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v4 = [(PLGenericAlbum *)self kindValue];
  BOOL v5 = (a3 & 0x61) == 0;
  BOOL v6 = (a3 & 1) == 0;
  if (v4 != 4000) {
    BOOL v6 = 0;
  }
  if (v4 != 3999) {
    BOOL v5 = v6;
  }
  if (v4 == 3998) {
    return a3 == 16;
  }
  else {
    return v5;
  }
}

- (unint64_t)videosCount
{
  return 0;
}

- (unint64_t)photosCount
{
  return 0;
}

- (BOOL)isEmpty
{
  v2 = [(PLManagedFolder *)self childCollections];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)count
{
  v2 = [(PLManagedFolder *)self childCollections];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)assetsCount
{
  return 0;
}

- (unint64_t)approximateCount
{
  v2 = [(PLManagedFolder *)self childCollections];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)mutableAssets
{
  return 0;
}

- (id)assets
{
  return 0;
}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (void)prepareForDeletion
{
  v8.receiver = self;
  v8.super_class = (Class)PLManagedFolder;
  [(PLManagedObject *)&v8 prepareForDeletion];
  unint64_t v3 = [(PLManagedFolder *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0)
  {
    if ([(PLGenericAlbum *)self kindValue] == 4000) {
      [v3 recordCloudDeletionForObject:self];
    }
    int v4 = [(PLManagedFolder *)self uuid];
    if (!v4
      || ![(PLManagedFolder *)self isValidForPersistence]
      && !+[PLGenericAlbum is1WaySyncKind:[(PLGenericAlbum *)self kindValue]])
    {
      goto LABEL_10;
    }
    BOOL v5 = [(PLManagedFolder *)self managedObjectContext];
    char v6 = [v5 isReadOnly];

    if ((v6 & 1) == 0)
    {
      int v4 = [(PLGenericAlbum *)self photoLibrary];
      id v7 = [v4 pathManager];
      [(PLManagedFolder *)self removePersistedFileSystemDataWithPathManager:v7];

LABEL_10:
    }
  }
}

- (void)didSave
{
  v17.receiver = self;
  v17.super_class = (Class)PLManagedFolder;
  [(PLGenericAlbum *)&v17 didSave];
  if ([(PLManagedFolder *)self needsPersistenceUpdate])
  {
    int v4 = [(PLManagedFolder *)self uuid];
    if (!v4 || ([(PLManagedFolder *)self isDeleted] & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    BOOL v5 = [(PLManagedFolder *)self isValidForPersistence];

    if (v5)
    {
      int v4 = [(PLManagedFolder *)self managedObjectContext];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"PLManagedFolder.m" lineNumber:96 description:@"Must be PLManagedObjectContext"];
      }
      if (([v4 isDatabaseCreationContext] & 1) == 0)
      {
        char v6 = [(PLGenericAlbum *)self photoLibrary];
        id v7 = [v6 pathManager];
        [(PLManagedFolder *)self persistMetadataToFileSystemWithPathManager:v7];
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  if ([(PLManagedFolder *)self needsFixedOrderKeysComplianceUpdate]
    && ([(PLManagedFolder *)self isDeleted] & 1) == 0)
  {
    [(PLManagedFolder *)self setNeedsFixedOrderKeysComplianceUpdate:0];
    objc_super v8 = [(PLGenericAlbum *)self photoLibrary];
    id v9 = [v8 libraryServicesManager];
    id v10 = [v9 databaseContext];

    uint64_t v11 = [PLRelationshipOrderKeyManager alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __26__PLManagedFolder_didSave__block_invoke;
    v15[3] = &unk_1E5872390;
    id v16 = v10;
    id v12 = v10;
    uint64_t v13 = [(PLRelationshipOrderKeyManager *)v11 initWithGenerateContextBlock:v15];
    [(PLManagedFolder *)self enforceFixedOrderKeyComplianceWithOrderKeyManager:v13];
  }
  [(PLManagedFolder *)self setNeedsPersistenceUpdate:0];
}

id __26__PLManagedFolder_didSave__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    objc_super v8 = "-[PLManagedFolder didSave]_block_invoke";
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Generating PLRelationshipOrderKeyManager context on-demand for: %s...", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "newShortLivedLibraryForOrderKeyManagerWithName:", a2), "managedObjectContext");
  return v5;
}

- (void)willSave
{
  v9.receiver = self;
  v9.super_class = (Class)PLManagedFolder;
  [(PLGenericAlbum *)&v9 willSave];
  unint64_t v3 = [(PLManagedFolder *)self changedValues];
  int v4 = [v3 objectForKeyedSubscript:@"childCollections"];

  [(PLManagedFolder *)self setNeedsPersistenceUpdate:0];
  BOOL v5 = [(PLManagedFolder *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  if ([(PLManagedFolder *)self isValidForPersistence])
  {
    if (([(PLManagedFolder *)self isInserted] & 1) == 0 && !v4)
    {
      char v6 = [v3 objectForKeyedSubscript:@"title"];
      if (v6
        || ([v3 objectForKeyedSubscript:@"trashedState"],
            (char v6 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v3 objectForKeyedSubscript:@"isPinned"],
            (char v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        objc_super v8 = [v3 objectForKeyedSubscript:@"isPrototype"];

        if (!v8) {
          goto LABEL_10;
        }
      }
    }
    [(PLManagedFolder *)self setNeedsPersistenceUpdate:1];
  }
LABEL_10:
  if ([(PLGenericAlbum *)self kindValue] == 3999 && v5)
  {
    int v7 = +[PLManagedAlbumList albumListInManagedObjectContext:v5];
    +[PLManagedAlbumList pushChangesFromAlbumContainer:self toAlbumContainer:v7];
    if (v4 && ([v5 isInitializingSingletons] & 1) == 0) {
      [(PLManagedFolder *)self setNeedsFixedOrderKeysComplianceUpdate:1];
    }
  }
LABEL_16:
}

- (id)childKeyForOrdering
{
  return @"childCollections";
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  v2 = (void *)validKindsForPersistence_pl_once_object_17;
  return v2;
}

void __43__PLManagedFolder_validKindsForPersistence__block_invoke()
{
  uint64_t v0 = [&unk_1EEBF22B8 copy];
  v1 = (void *)validKindsForPersistence_pl_once_object_17;
  validKindsForPersistence_pl_once_object_17 = v0;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"cloudGUID";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

+ (id)insertNewFolderWithTitle:(id)a3 kind:(int)a4 intoLibrary:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  objc_super v9 = [v7 managedObjectContext];
  id v10 = +[PLManagedObject insertInManagedObjectContext:v9];

  [v10 setKindValue:v5];
  [v10 setTitle:v8];

  uint64_t v11 = +[PLManagedAlbumList albumListInPhotoLibrary:v7];

  id v12 = [v11 albums];
  [v12 addObject:v10];

  return v10;
}

+ (id)sortDescriptorsForAlbumsInFolderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
    case 2u:
    case 3u:
      goto LABEL_6;
    case 1u:
      uint64_t v5 = (void *)MEMORY[0x1E4F29008];
      char v6 = @"creationDate";
      goto LABEL_7;
    case 4u:
      uint64_t v5 = (void *)MEMORY[0x1E4F29008];
      char v6 = @"trashedDate";
      goto LABEL_7;
    case 5u:
      goto LABEL_5;
    default:
      if (a3 == 100)
      {
LABEL_6:
        uint64_t v5 = (void *)MEMORY[0x1E4F29008];
        char v6 = @"parentFolder";
LABEL_7:
        uint64_t v7 = [v5 sortDescriptorWithKey:v6 ascending:a4];
      }
      else
      {
        if (a3 != 101) {
          goto LABEL_10;
        }
LABEL_5:
        uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:a4 selector:sel_localizedCaseInsensitiveCompare_];
      }
      id v8 = (void *)v7;
      if (v7)
      {
        v13[0] = v7;
        objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        goto LABEL_13;
      }
LABEL_10:
      id v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12[0] = 67109120;
        v12[1] = a3;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Unexpected folder sort key value: %d", (uint8_t *)v12, 8u);
      }

      id v8 = 0;
      objc_super v9 = 0;
LABEL_13:

      return v9;
  }
}

+ (id)localizedRecoveredTitle
{
  return (id)PLServicesLocalizedFrameworkStringForAssetsd();
}

+ (id)childKeyForOrdering
{
  return @"childCollections";
}

- (id)descriptionOfChildCollectionOrderValues
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLManagedFolder *)self managedObjectContext];
  int v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  char v6 = [(PLManagedFolder *)self objectID];
  uint64_t v7 = objc_msgSend(v3, "_orderKeysForRelationshipWithName__:onObjectWithID:", @"childCollections", v6);

  if ([v7 count] == 2)
  {
    uint64_t v24 = v5;
    v25 = v3;
    id v8 = [v7 objectAtIndexedSubscript:1];
    objc_super v9 = [v8 objectEnumerator];

    id v10 = [(PLManagedFolder *)self objectID];
    uint64_t v11 = [v10 URIRepresentation];
    id v12 = [v7 objectAtIndexedSubscript:0];
    [v4 appendFormat:@"FOLDER %@ [%d]\n", v11, objc_msgSend(v12, "count")];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [v7 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = [v9 nextObject];
          uint64_t v20 = [v18 URIRepresentation];
          [v4 appendFormat:@"%@ -> %@\n", v19, v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    uint64_t v5 = v24;
    unint64_t v3 = v25;
  }
  else
  {
    id v21 = [(PLManagedFolder *)self objectID];
    uint64_t v22 = [v21 URIRepresentation];
    [v4 appendFormat:@"FOLDER %@ [0 childCollections]\n", v22];
  }

  return v4;
}

@end