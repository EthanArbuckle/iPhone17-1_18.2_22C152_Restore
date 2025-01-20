@interface PLManagedAlbumList
+ (BOOL)_albumOrderMatchesFrom:(id)a3 inDestination:(id)a4;
+ (BOOL)albumKindHasFixedOrder:(int)a3;
+ (BOOL)isValidPathForPersistence:(id)a3;
+ (BOOL)isValidTypeForPersistence:(signed __int16)a3;
+ (BOOL)restoreAlbumListFromPersistedDataAtPath:(id)a3 library:(id)a4;
+ (id)_albumListWithType:(signed __int16)a3 inManagedObjectContext:(id)a4;
+ (id)_singletonListWithType:(signed __int16)a3 library:(id)a4;
+ (id)_typeDescriptionForAlbumListType:(signed __int16)a3;
+ (id)_validAlbumsFromSource:(id)a3 destination:(id)a4;
+ (id)albumListInManagedObjectContext:(id)a3;
+ (id)albumListInPhotoLibrary:(id)a3;
+ (id)allStreamedAlbumsListInManagedObjectContext:(id)a3;
+ (id)allStreamedAlbumsListInPhotoLibrary:(id)a3;
+ (id)entityName;
+ (id)eventListInManagedObjectContext:(id)a3;
+ (id)eventListInPhotoLibrary:(id)a3;
+ (id)facesAlbumListInManagedObjectContext:(id)a3;
+ (id)facesAlbumListInPhotoLibrary:(id)a3;
+ (id)importListInManagedObjectContext:(id)a3;
+ (id)importListInPhotoLibrary:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)placesAlbumListInManagedObjectContext:(id)a3;
+ (id)placesAlbumListInPhotoLibrary:(id)a3;
+ (id)scenesAlbumListInManagedObjectContext:(id)a3;
+ (id)scenesAlbumListInPhotoLibrary:(id)a3;
+ (unint64_t)priorityForAlbumKind:(int)a3;
+ (void)addSingletonObjectsToContext:(id)a3;
+ (void)initialize;
+ (void)persistAlbumListUUIDs:(id)a3 type:(signed __int16)a4 pathManager:(id)a5 allowsOverwrite:(BOOL)a6;
+ (void)pushChangesFromAlbumContainer:(id)a3 toAlbumContainer:(id)a4;
- (BOOL)albumHasFixedOrder:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)hasAtLeastOneAlbum;
- (BOOL)hasDerivedIndexMappers;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)isRegisteredForChanges;
- (BOOL)needsReordering;
- (NSMutableOrderedSet)albums;
- (NSString)_prettyDescription;
- (NSString)_typeDescription;
- (id)_albumsCountFetchRequest;
- (id)albumsSortingComparator;
- (id)containersRelationshipName;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (int)filter;
- (signed)albumListType;
- (unint64_t)albumsCount;
- (unint64_t)unreadAlbumsCount;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)dealloc;
- (void)didSave;
- (void)enumerateDerivedAlbumLists:(id)a3;
- (void)insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:(id)a3;
- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5;
- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4;
- (void)registerDerivedAlbumList:(id)a3;
- (void)registerForChanges;
- (void)setAlbumListType:(signed __int16)a3;
- (void)setIsRegisteredForChanges:(BOOL)a3;
- (void)setNeedsReordering;
- (void)unregisterAllDerivedAlbums;
- (void)unregisterForChanges;
- (void)updateAlbumsOrderIfNeeded;
- (void)willSave;
- (void)willTurnIntoFault;
@end

@implementation PLManagedAlbumList

- (void).cxx_destruct
{
  derivedAlbumLists = self->_derivedAlbumLists;
  for (uint64_t i = 4; i != -1; --i)
    objc_destroyWeak((id *)&derivedAlbumLists[i]);
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (void)didSave
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PLManagedAlbumList;
  [(PLManagedObject *)&v22 didSave];
  v3 = [(PLManagedAlbumList *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 isDatabaseCreationContext] & 1) == 0
    && PLIsAssetsd())
  {
    v4 = [(PLManagedObject *)self photoLibrary];
    v5 = [v4 libraryServicesManager];

    if (+[PLManagedAlbumList isValidTypeForPersistence:[(PLManagedAlbumList *)self albumListType]]&& ([(PLManagedAlbumList *)self hasFaultForRelationshipNamed:@"albums"] & 1) == 0)
    {
      v6 = [v5 modelMigrator];
      if ([v6 isPostProcessingLightweightMigration])
      {

LABEL_9:
        v9 = [MEMORY[0x1E4F1CA48] array];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = [(PLManagedAlbumList *)self albums];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) uuid];
              if (v15) {
                [v9 addObject:v15];
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }
          while (v12);
        }

        uint64_t v16 = [(PLManagedAlbumList *)self albumListType];
        v17 = [v5 pathManager];
        +[PLManagedAlbumList persistAlbumListUUIDs:v9 type:v16 pathManager:v17 allowsOverwrite:1];

        goto LABEL_19;
      }
      v7 = [(PLManagedAlbumList *)self managedObjectContext];
      char v8 = [v7 isInitializingSingletons];

      if ((v8 & 1) == 0) {
        goto LABEL_9;
      }
    }
LABEL_19:
  }
}

- (void)willSave
{
  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbumList;
  [(PLManagedObject *)&v10 willSave];
  v3 = [(PLManagedAlbumList *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 isDatabaseCreationContext] & 1) == 0)
  {
    v4 = [(PLManagedObject *)self photoLibrary];
    if (![(PLManagedAlbumList *)self albumListType])
    {
      v5 = [(PLManagedAlbumList *)self changedValues];
      v6 = [v5 objectForKeyedSubscript:@"albums"];

      if (v6)
      {
        if (v4)
        {
          v7 = +[PLGenericAlbum rootFolderInLibrary:v4];
          char v8 = [v3 updatedObjects];
          char v9 = [v8 containsObject:v7];

          if ((v9 & 1) == 0) {
            +[PLManagedAlbumList pushChangesFromAlbumContainer:self toAlbumContainer:v7];
          }
        }
      }
    }
  }
}

- (void)unregisterForChanges
{
  if ([(PLManagedAlbumList *)self isRegisteredForChanges])
  {
    v3 = +[PLChangeNotificationCenter defaultCenter];
    [(PLManagedAlbumList *)self removeObserver:v3 forKeyPath:@"albums" context:&PLChangeNotificationCenterKVOContext];

    [(PLManagedAlbumList *)self setIsRegisteredForChanges:0];
  }
}

- (void)registerForChanges
{
  if ([(PLManagedObject *)self isRegisteredWithUserInterfaceContext]
    && ![(PLManagedAlbumList *)self isRegisteredForChanges])
  {
    v3 = +[PLChangeNotificationCenter defaultCenter];
    [(PLManagedAlbumList *)self addObserver:v3 forKeyPath:@"albums" options:8 context:&PLChangeNotificationCenterKVOContext];

    [(PLManagedAlbumList *)self setIsRegisteredForChanges:1];
  }
}

- (BOOL)hasDerivedIndexMappers
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_derivedAlbumLists);

  if (WeakRetained) {
    return 1;
  }
  v5 = (id *)&self->_derivedAlbumLists[1];
  unint64_t v6 = -1;
  while (v6 != 3)
  {
    id v7 = objc_loadWeakRetained(v5);

    ++v6;
    ++v5;
    if (v7) {
      return v6 < 4;
    }
  }
  unint64_t v6 = 4;
  return v6 < 4;
}

- (void)enumerateDerivedAlbumLists:(id)a3
{
  uint64_t v3 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  unint64_t v6 = (void (**)(id, id))a3;
  do
  {
    id WeakRetained = objc_loadWeakRetained((id *)&derivedAlbumLists[v3]);
    if (v6 && WeakRetained) {
      v6[2](v6, WeakRetained);
    }

    ++v3;
  }
  while (v3 != 5);
}

- (void)unregisterAllDerivedAlbums
{
  uint64_t v2 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  do
    objc_storeWeak((id *)&derivedAlbumLists[v2++], 0);
  while (v2 != 5);
}

- (void)registerDerivedAlbumList:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v6 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  do
  {
    id WeakRetained = objc_loadWeakRetained((id *)&derivedAlbumLists[v6]);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&derivedAlbumLists[v6], v4);
      goto LABEL_8;
    }
    ++v6;
  }
  while (v6 != 5);
  char v9 = PLMigrationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    uint64_t v11 = 5;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "More than maximum %ld derived album lists trying to register. This will fail.", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PLManagedAlbumList *)self hasFaultForRelationshipNamed:@"albums"])
  {
    uint64_t v11 = [(PLManagedAlbumList *)self albums];
    uint64_t v12 = [v11 array];

    if (v8)
    {
      uint64_t v13 = [v12 objectsAtIndexes:v8];

      uint64_t v12 = (void *)v13;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    v15 = +[PLGenericAlbum entityName];
    uint64_t v16 = (void *)[v14 initWithEntityName:v15];

    v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v12];
    [v16 setPredicate:v17];

    [v16 setIncludesPropertyValues:1];
    [v16 setReturnsObjectsAsFaults:0];
    if (v9) {
      [v16 setPropertiesToFetch:v9];
    }
    if (v10) {
      [v16 setRelationshipKeyPathsForPrefetching:v10];
    }
    long long v18 = [(PLManagedObject *)self photoLibrary];
    long long v19 = [v18 managedObjectContext];

    id v24 = 0;
    long long v20 = [v19 executeFetchRequest:v16 error:&v24];
    id v21 = v24;
    if (!v20)
    {
      objc_super v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [(PLManagedAlbumList *)self uuid];
        *(_DWORD *)buf = 138543618;
        v26 = v23;
        __int16 v27 = 2112;
        id v28 = v21;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Error fetching albums for album list %{public}@: %@", buf, 0x16u);
      }
    }
  }
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
}

- (void)updateAlbumsOrderIfNeeded
{
  uint64_t v3 = [(PLManagedAlbumList *)self needsReorderingNumber];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    if ([(PLManagedAlbumList *)self albumListType] == 4)
    {
      v5 = [(PLManagedAlbumList *)self albumsSortingComparator];
      uint64_t v6 = [(PLManagedAlbumList *)self albums];
      [v6 sortWithOptions:16 usingComparator:v5];
    }
    id v7 = [NSNumber numberWithBool:0];
    [(PLManagedAlbumList *)self setNeedsReorderingNumber:v7];
  }
}

- (BOOL)needsReordering
{
  uint64_t v2 = [(PLManagedAlbumList *)self needsReorderingNumber];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNeedsReordering
{
  char v3 = [(PLManagedAlbumList *)self needsReorderingNumber];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = [NSNumber numberWithBool:1];
    [(PLManagedAlbumList *)self setNeedsReorderingNumber:v5];
  }
}

- (void)insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PLManagedAlbumList *)self albums];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v6 = [(PLManagedAlbumList *)self albumsSortingComparator];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__PLManagedAlbumList_insertIntoOrderedAlbumsAtIndexByPriorityForAlbum___block_invoke;
    v13[3] = &unk_1E5867C28;
    id v7 = v6;
    id v15 = v7;
    id v8 = v4;
    id v14 = v8;
    p_long long buf = &buf;
    [v5 enumerateObjectsUsingBlock:v13];
    unint64_t v9 = [v5 indexOfObject:v8];
    unint64_t v10 = *(void *)(*((void *)&buf + 1) + 24);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v10 >= [v5 count]) {
        [v5 addObject:v8];
      }
      else {
        [v5 insertObject:v8 atIndex:*(void *)(*((void *)&buf + 1) + 24)];
      }
    }
    else if (v9 != v10)
    {
      if (v9 < v10) {
        *(void *)(*((void *)&buf + 1) + 24) = v10 - 1;
      }
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
      [v5 moveObjectsAtIndexes:v12 toIndex:*(void *)(*((void *)&buf + 1) + 24)];
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(PLManagedAlbumList *)self uuid];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Attempted to insert nil album into album list: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

uint64_t __71__PLManagedAlbumList_insertIntoOrderedAlbumsAtIndexByPriorityForAlbum___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result == -1) {
    *a4 = 1;
  }
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return result;
}

- (id)albumsSortingComparator
{
  uint64_t v2 = (void *)[&__block_literal_global_27061 copy];
  return v2;
}

uint64_t __45__PLManagedAlbumList_albumsSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = +[PLManagedAlbumList priorityForAlbumKind:](PLManagedAlbumList, "priorityForAlbumKind:", [v4 kindValue]);
  unint64_t v7 = +[PLManagedAlbumList priorityForAlbumKind:](PLManagedAlbumList, "priorityForAlbumKind:", [v5 kindValue]);
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      if ([v4 conformsToProtocol:&unk_1EEC33B20]
        && [v5 conformsToProtocol:&unk_1EEC33B20])
      {
        unint64_t v9 = [v4 cloudLastInterestingChangeDate];
        unint64_t v10 = [v5 cloudLastInterestingChangeDate];
        uint64_t v11 = v10;
        if (v9)
        {
          if (v10) {
            uint64_t v8 = [v10 compare:v9];
          }
          else {
            uint64_t v8 = -1;
          }
        }
        else
        {
          uint64_t v8 = 1;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  uint64_t v3 = [a3 kindValue];
  return +[PLManagedAlbumList albumKindHasFixedOrder:v3];
}

- (id)containersRelationshipName
{
  return @"albums";
}

- (BOOL)isEmpty
{
  return ![(PLManagedAlbumList *)self hasAtLeastOneAlbum];
}

- (NSString)_typeDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(PLManagedAlbumList *)self albumListType];
  return (NSString *)[v3 _typeDescriptionForAlbumListType:v4];
}

- (NSString)_prettyDescription
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  if ([(PLManagedAlbumList *)self isFault])
  {
    uint64_t v4 = [(PLManagedObject *)self shortObjectIDURI];
  }
  else
  {
    id v5 = NSString;
    unint64_t v6 = [(PLManagedObject *)self shortObjectIDURI];
    unint64_t v7 = [(PLManagedAlbumList *)self _typeDescription];
    uint64_t v4 = [v5 stringWithFormat:@"%@ (%@)", v6, v7];
  }
  return (NSString *)v4;
}

- (int)filter
{
  return 0;
}

- (BOOL)isFolder
{
  return 0;
}

- (BOOL)canEditAlbums
{
  return ([(PLManagedAlbumList *)self albumListType] & 0xFFFFFFFB) == 0;
}

- (unint64_t)unreadAlbumsCount
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudSharedAlbum"];
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = [(PLManagedAlbumList *)self objectID];
  unint64_t v6 = [v4 predicateWithFormat:@"%@ IN albumLists", v5];

  unint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudNotificationsEnabled == YES"];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"hasUnseenContent == YES"];
  unint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  v21[0] = v6;
  v21[1] = v7;
  v21[2] = v8;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  uint64_t v11 = [v9 andPredicateWithSubpredicates:v10];

  [v3 setPredicate:v11];
  uint64_t v12 = [(PLManagedAlbumList *)self managedObjectContext];
  id v18 = 0;
  unint64_t v13 = [v12 countForFetchRequest:v3 error:&v18];
  id v14 = v18;

  if (v14)
  {
    id v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v14 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch unread albums count: %@", buf, 0xCu);
    }
  }

  return v13;
}

- (BOOL)hasAtLeastOneAlbum
{
  if ([(PLManagedAlbumList *)self hasFaultForRelationshipNamed:@"albums"])
  {
    uint64_t v3 = [(PLManagedAlbumList *)self _albumsCountFetchRequest];
    [v3 setFetchLimit:1];
    uint64_t v4 = [(PLManagedAlbumList *)self managedObjectContext];
    uint64_t v5 = [v4 countForFetchRequest:v3 error:0];

    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0;
  }
  else
  {
    uint64_t v3 = [(PLManagedAlbumList *)self albums];
    BOOL v6 = [v3 count] == 0;
  }
  BOOL v7 = !v6;

  return v7;
}

- (unint64_t)albumsCount
{
  uint64_t v3 = [(PLManagedAlbumList *)self _albumsCountFetchRequest];
  uint64_t v4 = [(PLManagedAlbumList *)self managedObjectContext];
  uint64_t v5 = [v4 countForFetchRequest:v3 error:0];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }

  return v6;
}

- (id)_albumsCountFetchRequest
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLGenericAlbum entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  unint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = [(PLManagedAlbumList *)self objectID];
  uint64_t v8 = [v6 predicateWithFormat:@"%@ IN albumLists", v7];
  [v5 setPredicate:v8];

  return v5;
}

- (NSMutableOrderedSet)albums
{
  [(PLManagedAlbumList *)self willAccessValueForKey:@"albums"];
  uint64_t v3 = [(PLManagedAlbumList *)self mutableOrderedSetValueForKey:@"albums"];
  [(PLManagedAlbumList *)self didAccessValueForKey:@"albums"];
  return (NSMutableOrderedSet *)v3;
}

- (void)setAlbumListType:(signed __int16)a3
{
  id v4 = [NSNumber numberWithShort:a3];
  [(PLManagedAlbumList *)self setIdentifier:v4];
}

- (signed)albumListType
{
  uint64_t v2 = [(PLManagedAlbumList *)self identifier];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (void)willTurnIntoFault
{
  [(PLManagedAlbumList *)self unregisterForChanges];
  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  [(PLManagedAlbumList *)&v3 willTurnIntoFault];
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  [(PLManagedAlbumList *)&v3 awakeFromFetch];
  [(PLManagedAlbumList *)self registerForChanges];
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLManagedAlbumList;
  [(PLManagedAlbumList *)&v4 awakeFromInsert];
  objc_super v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLManagedAlbumList *)self setUuid:v3];

  [(PLManagedAlbumList *)self registerForChanges];
}

- (void)dealloc
{
  [(PLManagedAlbumList *)self unregisterAllDerivedAlbums];
  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  [(PLManagedAlbumList *)&v3 dealloc];
}

+ (BOOL)restoreAlbumListFromPersistedDataAtPath:(id)a3 library:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 lastPathComponent];
  unint64_t v9 = [v8 stringByDeletingPathExtension];
  __int16 v10 = [v9 intValue];

  int v11 = v10;
  if ([a1 isValidTypeForPersistence:v10]
    && [a1 isValidPathForPersistence:v6])
  {
    uint64_t v12 = [a1 _singletonListWithType:v10 library:v7];
    if (!v12)
    {
LABEL_14:

      BOOL v20 = 1;
      goto LABEL_15;
    }
    unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    id v14 = (void *)MEMORY[0x1E4F1CAA0];
    id v15 = [v13 objectForKey:@"albums"];
    uint64_t v16 = [v14 orderedSetWithArray:v15];

    v17 = [v12 albums];
    id v18 = [v17 valueForKey:@"uuid"];

    if ([v16 isEqual:v18])
    {
      uint64_t v19 = PLMigrationGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        int v29 = v11;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "Persisted albumList %d UUIDs match existing UUID ordering", buf, 8u);
      }
    }
    else
    {
      if (![v16 count])
      {
LABEL_13:

        goto LABEL_14;
      }
      id v21 = PLMigrationGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v29 = v11;
        __int16 v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Sorting albumList %d to match UUID ordering %@", buf, 0x12u);
      }

      objc_super v22 = [v12 albumsSortingComparator];
      v23 = [v12 albums];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __70__PLManagedAlbumList_restoreAlbumListFromPersistedDataAtPath_library___block_invoke;
      v25[3] = &unk_1E5868040;
      id v27 = v22;
      id v26 = v16;
      uint64_t v19 = v22;
      [v23 sortUsingComparator:v25];
    }
    goto LABEL_13;
  }
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

uint64_t __70__PLManagedAlbumList_restoreAlbumListFromPersistedDataAtPath_library___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    unint64_t v9 = [v5 uuid];
    unint64_t v10 = [v8 indexOfObject:v9];

    int v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v6 uuid];
    unint64_t v13 = [v11 indexOfObject:v12];

    if (v10 >= v13) {
      uint64_t v7 = v10 > v13;
    }
    else {
      uint64_t v7 = -1;
    }
  }

  return v7;
}

+ (void)persistAlbumListUUIDs:(id)a3 type:(signed __int16)a4 pathManager:(id)a5 allowsOverwrite:(BOOL)a6
{
  uint64_t v8 = a4;
  id v23 = a3;
  id v10 = a5;
  if ([a1 isValidTypeForPersistence:v8])
  {
    int v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [v10 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
    unint64_t v13 = [v11 fileURLWithPath:v12 isDirectory:1];

    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d.albumlistmetadata", (int)v8);
    id v15 = [v13 URLByAppendingPathComponent:v14];
    if (a6
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [v15 path],
          v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v16 fileExistsAtPath:v17],
          v17,
          v16,
          (v18 & 1) == 0))
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v23 forKey:@"albums"];
      BOOL v20 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v19 format:100 options:0 error:0];
      [MEMORY[0x1E4F8B900] persistMetadata:v20 fileURL:v15];
      id v21 = (void *)MEMORY[0x1E4F8B908];
      objc_super v22 = [v15 path];
      [v21 changeFileOwnerToMobileAtPath:v22 error:0];
    }
  }
}

+ (BOOL)isValidPathForPersistence:(id)a3
{
  objc_super v3 = [a3 pathExtension];
  char v4 = [v3 isEqualToString:@"albumlistmetadata"];

  return v4;
}

+ (BOOL)isValidTypeForPersistence:(signed __int16)a3
{
  return (a3 < 8) & (0x86u >> a3);
}

+ (void)pushChangesFromAlbumContainer:(id)a3 toAlbumContainer:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 && v6)
  {
    uint64_t v12 = v6;
    uint64_t v8 = [a1 _validAlbumsFromSource:a3 destination:v6];
    unint64_t v9 = [v12 albums];
    char v10 = [a1 _albumOrderMatchesFrom:v8 inDestination:v9];

    if ((v10 & 1) == 0)
    {
      int v11 = [v12 albums];
      objc_msgSend(v11, "pl_insertObjects:atIndex:", v8, 0);
    }
    uint64_t v7 = v12;
  }
}

+ (id)_validAlbumsFromSource:(id)a3 destination:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = v5;
  uint64_t v8 = [v5 albums];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v13 isDeleted] & 1) == 0)
        {
          uint64_t v14 = [v13 parentFolder];
          if (!v14
            || (id v15 = (void *)v14,
                [v6 albums],
                uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                int v17 = [v16 containsObject:v13],
                v16,
                v15,
                v17))
          {
            [v7 addObject:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)_albumOrderMatchesFrom:(id)a3 inDestination:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      uint64_t v12 = 0;
      unint64_t v13 = v11;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v14 = objc_msgSend(v6, "indexOfObject:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v11 = v14, v13 != 0x7FFFFFFFFFFFFFFFLL) && v14 <= v13)
        {
          BOOL v15 = 0;
          goto LABEL_14;
        }
        ++v12;
        unint64_t v13 = v14;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_14:

  return v15;
}

+ (id)allStreamedAlbumsListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:4 inManagedObjectContext:a3];
}

+ (id)scenesAlbumListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:10 inManagedObjectContext:a3];
}

+ (id)placesAlbumListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:3 inManagedObjectContext:a3];
}

+ (id)facesAlbumListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:2 inManagedObjectContext:a3];
}

+ (id)eventListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:1 inManagedObjectContext:a3];
}

+ (id)importListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:7 inManagedObjectContext:a3];
}

+ (id)albumListInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumListWithType:0 inManagedObjectContext:a3];
}

+ (void)addSingletonObjectsToContext:(id)a3
{
  id v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    v62 = NSStringFromSelector(a2);
    [v61 handleFailureInMethod:a2, a1, @"PLManagedAlbumList.m", 791, @"%@ can only be called from assetsd", v62 object file lineNumber description];
  }
  id v6 = [a1 _albumListWithType:0 inManagedObjectContext:v5];
  if (!v6)
  {
    id v6 = [a1 insertInManagedObjectContext:v5];
    id v7 = [NSNumber numberWithInt:0];
    [v6 setIdentifier:v7];
  }
  uint64_t v8 = +[PLGenericAlbum albumWithKind:1616 inManagedObjectContext:v5];
  if (v8) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v8];
  }
  uint64_t v9 = +[PLGenericAlbum albumWithKind:1613 inManagedObjectContext:v5];
  if (v9) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v9];
  }
  uint64_t v10 = +[PLGenericAlbum albumWithKind:1614 inManagedObjectContext:v5];
  if (v10) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v10];
  }
  uint64_t v11 = +[PLGenericAlbum albumWithKind:1605 inManagedObjectContext:v5];
  if (v11) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v11];
  }
  v81 = (void *)v11;
  uint64_t v12 = +[PLGenericAlbum albumWithKind:1639 inManagedObjectContext:v5];
  if (v12) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v12];
  }
  id v85 = a1;
  uint64_t v13 = +[PLGenericAlbum albumWithKind:1606 inManagedObjectContext:v5];
  if (v13) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v13];
  }
  uint64_t v14 = +[PLGenericAlbum albumWithKind:1615 inManagedObjectContext:v5];
  if (v14) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v14];
  }
  v83 = (void *)v9;
  v78 = (void *)v14;
  uint64_t v15 = +[PLGenericAlbum albumWithKind:1610 inManagedObjectContext:v5];
  if (v15) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v15];
  }
  v77 = (void *)v15;
  uint64_t v16 = +[PLGenericAlbum albumWithKind:1617 inManagedObjectContext:v5];
  if (v16) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v16];
  }
  v76 = (void *)v16;
  uint64_t v17 = +[PLGenericAlbum albumWithKind:1618 inManagedObjectContext:v5];
  if (v17) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v17];
  }
  uint64_t v18 = +[PLGenericAlbum albumWithKind:1611 inManagedObjectContext:v5];
  if (v18) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v18];
  }
  v75 = (void *)v18;
  v84 = (void *)v8;
  uint64_t v19 = +[PLGenericAlbum albumWithKind:1609 inManagedObjectContext:v5];
  if (v19) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v19];
  }
  v80 = (void *)v12;
  v74 = (void *)v19;
  uint64_t v20 = +[PLGenericAlbum albumWithKind:1552 inManagedObjectContext:v5];
  if (v20)
  {
    long long v21 = [v6 albums];
    [v21 addObject:v20];
  }
  v73 = (void *)v20;
  uint64_t v22 = +[PLGenericAlbum albumWithKind:4001 inManagedObjectContext:v5];
  if (v22) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v22];
  }
  v72 = (void *)v22;
  uint64_t v23 = +[PLGenericAlbum albumWithKind:4003 inManagedObjectContext:v5];
  if (v23) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v23];
  }
  uint64_t v24 = +[PLGenericAlbum albumWithKind:4002 inManagedObjectContext:v5];
  if (v24) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v24];
  }
  v79 = (void *)v13;
  uint64_t v25 = +[PLGenericAlbum albumWithKind:1612 inManagedObjectContext:v5];
  if (v25) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v25];
  }
  id v26 = (void *)v17;
  v69 = (void *)v25;
  uint64_t v27 = +[PLGenericAlbum albumWithKind:4004 inManagedObjectContext:v5];
  if (v27) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v27];
  }
  id v28 = (void *)v10;
  v68 = (void *)v27;
  uint64_t v29 = +[PLGenericAlbum albumWithKind:4005 inManagedObjectContext:v5];
  if (v29) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v29];
  }
  uint64_t v30 = +[PLGenericAlbum albumWithKind:4006 inManagedObjectContext:v5];
  if (v30) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v30];
  }
  v66 = (void *)v30;
  uint64_t v31 = +[PLGenericAlbum albumWithKind:1619 inManagedObjectContext:v5];
  if (v31) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v31];
  }
  uint64_t v32 = +[PLGenericAlbum albumWithKind:1620 inManagedObjectContext:v5];
  if (v32) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v32];
  }
  v64 = (void *)v32;
  uint64_t v33 = +[PLGenericAlbum albumWithKind:1621 inManagedObjectContext:v5];
  if (v33) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v33];
  }
  v63 = (void *)v33;
  v65 = (void *)v31;
  v82 = v28;
  v34 = +[PLGenericAlbum albumWithKind:1622 inManagedObjectContext:v5];
  if (v34) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v34];
  }
  v70 = (void *)v24;
  v35 = +[PLGenericAlbum albumWithKind:1623 inManagedObjectContext:v5];
  if (v35) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v35];
  }
  v71 = (void *)v23;
  v36 = +[PLGenericAlbum albumWithKind:1624 inManagedObjectContext:v5];
  if (v36) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v36];
  }
  v37 = +[PLGenericAlbum albumWithKind:1634 inManagedObjectContext:v5];
  if (v37) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v37];
  }
  v67 = (void *)v29;
  v38 = +[PLGenericAlbum albumWithKind:1636 inManagedObjectContext:v5];
  if (v38) {
    [v6 insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v38];
  }
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __51__PLManagedAlbumList_addSingletonObjectsToContext___block_invoke;
  v86[3] = &unk_1E5867C50;
  id v39 = v5;
  id v87 = v39;
  id v40 = v6;
  id v88 = v40;
  v41 = (void (**)(void, void))MEMORY[0x19F38D650](v86);
  v41[2](v41, 1626);
  v41[2](v41, 1627);
  v41[2](v41, 1630);
  v41[2](v41, 1631);
  v41[2](v41, 1637);
  v41[2](v41, 1632);
  v41[2](v41, 1640);
  v41[2](v41, 1641);
  v41[2](v41, 1628);
  v42 = +[PLGenericAlbum albumWithKind:3999 inManagedObjectContext:v39];
  +[PLManagedAlbumList pushChangesFromAlbumContainer:v40 toAlbumContainer:v42];

  v43 = [v85 _albumListWithType:7 inManagedObjectContext:v39];

  if (!v43)
  {
    v44 = [v85 insertInManagedObjectContext:v39];
    v45 = [NSNumber numberWithInt:7];
    [v44 setIdentifier:v45];
  }
  v46 = [v85 _albumListWithType:1 inManagedObjectContext:v39];

  if (!v46)
  {
    v47 = [v85 insertInManagedObjectContext:v39];
    v48 = [NSNumber numberWithInt:1];
    [v47 setIdentifier:v48];
  }
  v49 = [v85 _albumListWithType:2 inManagedObjectContext:v39];

  if (!v49)
  {
    v50 = [v85 insertInManagedObjectContext:v39];
    v51 = [NSNumber numberWithInt:2];
    [v50 setIdentifier:v51];
  }
  v52 = [v85 _albumListWithType:3 inManagedObjectContext:v39];

  if (!v52)
  {
    v53 = [v85 insertInManagedObjectContext:v39];
    v54 = [NSNumber numberWithInt:3];
    [v53 setIdentifier:v54];
  }
  v55 = [v85 _albumListWithType:10 inManagedObjectContext:v39];

  if (!v55)
  {
    v56 = [v85 insertInManagedObjectContext:v39];
    v57 = [NSNumber numberWithInt:10];
    [v56 setIdentifier:v57];
  }
  v58 = [v85 _albumListWithType:4 inManagedObjectContext:v39];

  if (!v58)
  {
    v59 = [v85 insertInManagedObjectContext:v39];
    v60 = [NSNumber numberWithInt:4];
    [v59 setIdentifier:v60];
  }
}

void __51__PLManagedAlbumList_addSingletonObjectsToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = +[PLGenericAlbum albumWithKind:a2 inManagedObjectContext:*(void *)(a1 + 32)];
  if (v3)
  {
    char v4 = v3;
    [*(id *)(a1 + 40) insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:v3];
    objc_super v3 = v4;
  }
}

+ (id)_albumListWithType:(signed __int16)a3 inManagedObjectContext:(id)a4
{
  int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  id v8 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v9 = [a1 entityName];
  uint64_t v10 = (void *)[v8 initWithEntityName:v9];

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"identifier = %d", v4);
  [v10 setPredicate:v11];
  id v17 = 0;
  uint64_t v12 = [v6 executeFetchRequest:v10 error:&v17];
  id v13 = v17;
  if (v12)
  {
    uint64_t v14 = [v12 lastObject];
  }
  else
  {
    uint64_t v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v13;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error fetching album list: %@", buf, 0xCu);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)_typeDescriptionForAlbumListType:(signed __int16)a3
{
  if a3 < 0xB && ((0x4BFu >> a3))
  {
    objc_super v3 = off_1E5867C70[(unsigned __int16)a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown %d>", a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (unint64_t)priorityForAlbumKind:(int)a3
{
  unint64_t result = -1;
  if (a3 <= 1504)
  {
    unint64_t v4 = 180;
    uint64_t v5 = 210;
    if (a3 != 1502) {
      uint64_t v5 = -1;
    }
    if (a3 != 1500) {
      unint64_t v4 = v5;
    }
    uint64_t v6 = 240;
    uint64_t v7 = 10;
    if (a3 != 1000) {
      uint64_t v7 = -1;
    }
    if (a3 != 16) {
      uint64_t v6 = v7;
    }
    if (a3 <= 1499) {
      unint64_t v4 = v6;
    }
    unint64_t v8 = 400;
    uint64_t v9 = 222;
    uint64_t v10 = 230;
    if (a3 != 15) {
      uint64_t v10 = -1;
    }
    if (a3 != 12) {
      uint64_t v9 = v10;
    }
    if (a3 != 2) {
      unint64_t v8 = v9;
    }
    if (a3 <= 15) {
      return v8;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 1550:
        unint64_t result = 220;
        break;
      case 1551:
        unint64_t result = 221;
        break;
      case 1552:
        unint64_t result = 170;
        break;
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1601:
      case 1607:
      case 1608:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        return result;
      case 1600:
        unint64_t result = 250;
        break;
      case 1602:
        unint64_t result = 130;
        break;
      case 1603:
        unint64_t result = 65;
        break;
      case 1604:
        unint64_t result = 66;
        break;
      case 1605:
        unint64_t result = 80;
        break;
      case 1606:
        unint64_t result = 60;
        break;
      case 1609:
        unint64_t result = 30;
        break;
      case 1610:
        unint64_t result = 91;
        break;
      case 1611:
        unint64_t result = 270;
        break;
      case 1612:
        unint64_t result = 280;
        break;
      case 1613:
        unint64_t result = 12;
        break;
      case 1614:
        unint64_t result = 100;
        break;
      case 1615:
        unint64_t result = 92;
        break;
      case 1616:
        unint64_t result = 15;
        break;
      case 1617:
        unint64_t result = 70;
        break;
      case 1618:
        unint64_t result = 110;
        break;
      case 1619:
        unint64_t result = 50;
        break;
      case 1620:
        unint64_t result = 76;
        break;
      case 1621:
        unint64_t result = 75;
        break;
      case 1622:
        unint64_t result = 115;
        break;
      case 1623:
        unint64_t result = 78;
        break;
      case 1624:
        unint64_t result = 275;
        break;
      case 1625:
        unint64_t result = 13;
        break;
      case 1626:
        unint64_t result = 285;
        break;
      case 1627:
        unint64_t result = 112;
        break;
      case 1628:
        unint64_t result = 11;
        break;
      case 1630:
        unint64_t result = 117;
        break;
      case 1631:
        unint64_t result = 93;
        break;
      case 1632:
        unint64_t result = 94;
        break;
      case 1634:
        unint64_t result = 290;
        break;
      case 1636:
        unint64_t result = 21;
        break;
      case 1637:
        unint64_t result = 95;
        break;
      case 1639:
        unint64_t result = 79;
        break;
      case 1640:
        unint64_t result = 291;
        break;
      case 1641:
        unint64_t result = 295;
        break;
      default:
        switch(a3)
        {
          case 4001:
            unint64_t result = 160;
            break;
          case 4002:
            unint64_t result = 140;
            break;
          case 4003:
            unint64_t result = 150;
            break;
          case 4004:
            unint64_t result = 141;
            break;
          case 4005:
            unint64_t result = 161;
            break;
          case 4006:
            unint64_t result = 33;
            break;
          default:
            if (a3 == 1505) {
              unint64_t result = 120;
            }
            break;
        }
        break;
    }
  }
  return result;
}

+ (BOOL)albumKindHasFixedOrder:(int)a3
{
  BOOL result = 0;
  if (a3 <= 1551)
  {
    if (a3 == 1000 || a3 == 1500 || a3 == 1502) {
      return 1;
    }
  }
  else
  {
    switch(a3)
    {
      case 1552:
      case 1600:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1636:
      case 1637:
      case 1639:
      case 1640:
      case 1641:
        return 1;
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1601:
      case 1607:
      case 1608:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        return result;
      default:
        if ((a3 - 4004) < 3) {
          return 1;
        }
        break;
    }
  }
  return result;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLManagedAlbumList;
  id v3 = a3;
  unint64_t v4 = objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  int v5 = objc_msgSend(v3, "isEqualToString:", @"adjustmentFormatIdentifier", v9.receiver, v9.super_class);

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"identifier"];
    uint64_t v7 = [v4 setByAddingObjectsFromSet:v6];

    unint64_t v4 = (void *)v7;
  }
  return v4;
}

+ (id)allStreamedAlbumsListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:4 library:a3];
}

+ (id)scenesAlbumListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:10 library:a3];
}

+ (id)placesAlbumListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:3 library:a3];
}

+ (id)facesAlbumListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:2 library:a3];
}

+ (id)eventListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:1 library:a3];
}

+ (id)importListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:7 library:a3];
}

+ (id)albumListInPhotoLibrary:(id)a3
{
  return (id)[a1 _singletonListWithType:0 library:a3];
}

+ (id)_singletonListWithType:(signed __int16)a3 library:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLManagedAlbumList.m", 77, @"Invalid parameter not satisfying: %@", @"aPhotoLibrary" object file lineNumber description];
  }
  unint64_t v8 = [v7 managedObjectContext];
  objc_super v9 = [a1 _albumListWithType:v4 inManagedObjectContext:v8];
  if (!v9)
  {
    [v7 repairSingletonObjects];
    objc_super v9 = [a1 _albumListWithType:v4 inManagedObjectContext:v8];
  }

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    pl_dispatch_once();
  }
}

+ (id)entityName
{
  return @"AlbumList";
}

- (id)payloadIDForTombstone:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"uuid"];
  uint64_t v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isValidTypeForPersistence:", -[PLManagedAlbumList albumListType](self, "albumListType")))int v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLAlbumListJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4); {
  else
  }
    int v5 = 0;

  return v5;
}

- (id)payloadID
{
  uint64_t v2 = [(PLManagedAlbumList *)self uuid];
  id v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

@end