@interface PLFilteredAlbumList
+ (id)filteredAlbumList:(id)a3 filter:(int)a4;
- (BOOL)albumHasFixedOrder:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)hasAtLeastOneAlbum;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4;
- (BOOL)needsReordering;
- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3;
- (Class)derivedChangeNotificationClass;
- (NSIndexSet)filteredIndexes;
- (NSMutableOrderedSet)_albums;
- (NSMutableOrderedSet)albums;
- (NSObject)cachedIndexMapState;
- (NSPredicate)predicate;
- (NSString)_prettyDescription;
- (NSString)_typeDescription;
- (NSString)description;
- (PLFilteredAlbumList)initWithBackingAlbumList:(id)a3 filter:(int)a4;
- (PLIndexMapper)indexMapper;
- (PLManagedAlbumList)backingAlbumList;
- (PLPhotoLibrary)photoLibrary;
- (id)albumsSortingComparator;
- (id)containersRelationshipName;
- (id)filteredAlbumsAtIndexes:(id)a3;
- (id)identifier;
- (id)managedObjectContext;
- (id)objectInFilteredAlbumsAtIndex:(unint64_t)a3;
- (int)filter;
- (signed)albumListType;
- (unint64_t)albumsCount;
- (unint64_t)countOfFilteredAlbums;
- (unint64_t)indexInFilteredAlbumsOfObject:(id)a3;
- (unint64_t)unreadAlbumsCount;
- (void)_backingContextDidChange:(id)a3;
- (void)_invalidateFilteredIndexes;
- (void)dealloc;
- (void)enumerateDerivedAlbumLists:(id)a3;
- (void)insertFilteredAlbums:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inFilteredAlbumsAtIndex:(unint64_t)a4;
- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5;
- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4;
- (void)registerDerivedAlbumList:(id)a3;
- (void)removeFilteredAlbumsAtIndexes:(id)a3;
- (void)removeObjectFromFilteredAlbumsAtIndex:(unint64_t)a3;
- (void)replaceFilteredAlbumsAtIndexes:(id)a3 withFilteredValues:(id)a4;
- (void)replaceObjectInFilteredAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setBackingAlbumList:(id)a3;
- (void)setFilter:(int)a3;
- (void)setNeedsReordering;
- (void)setPredicate:(id)a3;
- (void)set_albums:(id)a3;
- (void)unregisterAllDerivedAlbums;
- (void)updateAlbumsOrderIfNeeded;
@end

@implementation PLFilteredAlbumList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->predicate, 0);
  objc_storeStrong((id *)&self->backingAlbumList, 0);
  for (uint64_t i = 64; i != 24; i -= 8)
    objc_destroyWeak((id *)((char *)&self->super.isa + i));
  objc_destroyWeak((id *)&self->_weak_albums);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
}

- (void)setPredicate:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->predicate;
}

- (void)setFilter:(int)a3
{
  self->filter = a3;
}

- (int)filter
{
  return self->filter;
}

- (void)setBackingAlbumList:(id)a3
{
}

- (PLManagedAlbumList)backingAlbumList
{
  return self->backingAlbumList;
}

- (void)enumerateDerivedAlbumLists:(id)a3
{
  uint64_t v3 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  v6 = (void (**)(id, id))a3;
  do
  {
    id WeakRetained = objc_loadWeakRetained((id *)&derivedAlbumLists[v3]);
    if (WeakRetained) {
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
  v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    uint64_t v11 = 5;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "More than maximum %ld derived album lists trying to register. This will fail.", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
}

- (void)replaceFilteredAlbumsAtIndexes:(id)a3 withFilteredValues:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PLFilteredAlbumList *)self backingAlbumList];
  v8 = [v10 albums];
  v9 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v7];

  [v8 replaceObjectsAtIndexes:v9 withObjects:v6];
}

- (void)replaceObjectInFilteredAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v8 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v7 = [v8 albums];
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3), v6);
}

- (void)removeFilteredAlbumsAtIndexes:(id)a3
{
  id v4 = a3;
  id v7 = [(PLFilteredAlbumList *)self backingAlbumList];
  v5 = [v7 albums];
  id v6 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v4];

  [v5 removeObjectsAtIndexes:v6];
}

- (void)insertFilteredAlbums:(id)a3 atIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v8 = [v10 albums];
  v9 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v6];

  [v8 insertObjects:v7 atIndexes:v9];
}

- (void)removeObjectFromFilteredAlbumsAtIndex:(unint64_t)a3
{
  id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
  v5 = [v6 albums];
  objc_msgSend(v5, "removeObjectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));
}

- (void)insertObject:(id)a3 inFilteredAlbumsAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v7 = [v8 albums];
  objc_msgSend(v7, "insertObject:atIndex:", v6, -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a4));
}

- (id)filteredAlbumsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v6 = [v5 albums];
  id v7 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v4];

  id v8 = [v6 objectsAtIndexes:v7];

  return v8;
}

- (id)objectInFilteredAlbumsAtIndex:(unint64_t)a3
{
  v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v6 = [v5 albums];
  id v7 = objc_msgSend(v6, "objectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));

  return v7;
}

- (unint64_t)indexInFilteredAlbumsOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  id v6 = [v5 albums];
  uint64_t v7 = [v6 indexOfObject:v4];

  unint64_t v8 = [(PLIndexMapper *)self->_indexMapper indexForBackingIndex:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v9 = v8;
  if (v8 >= [(NSMutableIndexSet *)self->_filteredIndexes count]
    || v7 != [(PLIndexMapper *)self->_indexMapper backingIndexForIndex:v9])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (unint64_t)countOfFilteredAlbums
{
  uint64_t v2 = [(PLFilteredAlbumList *)self filteredIndexes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)set_albums:(id)a3
{
}

- (NSMutableOrderedSet)_albums
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_albums);
  return (NSMutableOrderedSet *)WeakRetained;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(PLFilteredAlbumList *)self set_albums:0];
  if ([(PLIndexMapper *)self->_indexMapper applyContainerChangeNotification:v5 changeTypes:15 toFilteredIndexes:self->_filteredIndexes])
  {
    id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
    uint64_t v7 = [v6 albums];
    unint64_t v8 = [v7 array];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v15, "kindValue", (void)v20) == 4003
            || [v15 kindValue] == 4002
            || [v15 kindValue] == 4001)
          {
            BOOL v16 = [(PLFilteredAlbumList *)self shouldIncludeObjectAtIndex:v12 + i];
            filteredIndexes = self->_filteredIndexes;
            uint64_t v18 = v12 + i;
            if (v16) {
              [(NSMutableIndexSet *)filteredIndexes addIndex:v18];
            }
            else {
              [(NSMutableIndexSet *)filteredIndexes removeIndex:v18];
            }
          }
        }
        v12 += i;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
  else
  {
    [(PLFilteredAlbumList *)self _invalidateFilteredIndexes];
  }

  return 1;
}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  id v5 = [(PLFilteredAlbumList *)self predicate];
  id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
  uint64_t v7 = [v6 albums];
  unint64_t v8 = [v7 objectAtIndex:a3];
  char v9 = [v5 evaluateWithObject:v8];

  return v9;
}

- (NSObject)cachedIndexMapState
{
  return self->_filteredIndexes;
}

- (NSIndexSet)filteredIndexes
{
  filteredIndexes = self->_filteredIndexes;
  if (!filteredIndexes)
  {
    id v5 = (void *)MEMORY[0x19F38D3B0]();
    id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
    uint64_t v7 = [v6 albums];
    unint64_t v8 = [v7 array];

    char v9 = [(PLFilteredAlbumList *)self predicate];
    uint64_t v10 = [v8 filteredArrayUsingPredicate:v9];

    uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v12 = [v8 count];
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    long long v21 = __38__PLFilteredAlbumList_filteredIndexes__block_invoke;
    long long v22 = &unk_1E586BA28;
    v26 = v29;
    uint64_t v27 = v12;
    id v13 = v8;
    SEL v28 = a2;
    id v23 = v13;
    v24 = self;
    v14 = v11;
    uint64_t v25 = v14;
    [v10 enumerateObjectsUsingBlock:&v19];
    v15 = self->_filteredIndexes;
    self->_filteredIndexes = v14;
    BOOL v16 = v14;

    _Block_object_dispose(v29, 8);
    filteredIndexes = self->_filteredIndexes;
  }
  v17 = (void *)[(NSMutableIndexSet *)filteredIndexes copy];
  return (NSIndexSet *)v17;
}

uint64_t __38__PLFilteredAlbumList_filteredIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:inRange:", a2, v3, *(void *)(a1 + 64) - v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"PLFilteredAlbumList.m" lineNumber:465 description:&stru_1EEB2EB80];
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  id v5 = *(void **)(a1 + 48);
  return [v5 addIndex:v4];
}

- (PLIndexMapper)indexMapper
{
  return self->_indexMapper;
}

- (unint64_t)unreadAlbumsCount
{
  uint64_t v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  unint64_t v3 = [v2 unreadAlbumsCount];

  return v3;
}

- (void)_invalidateFilteredIndexes
{
  [(PLFilteredAlbumList *)self set_albums:0];
  filteredIndexes = self->_filteredIndexes;
  self->_filteredIndexes = 0;
}

- (NSString)_prettyDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
  uint64_t v7 = [v6 _prettyDescription];
  unint64_t v8 = [v3 stringWithFormat:@"%@\nBacking album list = %@", v5, v7];

  return (NSString *)v8;
}

- (NSString)_typeDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PLFilteredAlbumList *)self backingAlbumList];
  uint64_t v7 = [v6 _typeDescription];
  unint64_t v8 = [v3 stringWithFormat:@"%@\nBacking album list = %@", v5, v7];

  return (NSString *)v8;
}

- (id)managedObjectContext
{
  uint64_t v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  unint64_t v3 = [v2 managedObjectContext];

  return v3;
}

- (id)identifier
{
  uint64_t v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  unint64_t v3 = [v2 identifier];

  return v3;
}

- (void)_backingContextDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:*MEMORY[0x1E4F1BDC0]];

  id v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  int v6 = [v7 containsObject:v5];

  if (v6)
  {
    [(PLFilteredAlbumList *)self willChangeValueForKey:@"albums"];
    [(PLFilteredAlbumList *)self setBackingAlbumList:0];
    [(PLFilteredAlbumList *)self _invalidateFilteredIndexes];
    [(PLFilteredAlbumList *)self didChangeValueForKey:@"albums"];
  }
}

- (id)containersRelationshipName
{
  return @"albums";
}

- (BOOL)isEmpty
{
  return ![(PLFilteredAlbumList *)self hasAtLeastOneAlbum];
}

- (NSString)description
{
  unint64_t v3 = [(PLFilteredAlbumList *)self backingAlbumList];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PLFilteredAlbumList *)self backingAlbumList];
    int v6 = [v5 _typeDescription];
  }
  else
  {
    int v6 = @"[]";
  }
  id v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> type: %@", objc_opt_class(), self, v6];
  filteredIndexes = self->_filteredIndexes;
  if (filteredIndexes)
  {
    char v9 = [(NSMutableIndexSet *)filteredIndexes pl_shortDescription];
    [v7 appendFormat:@", filtered items: %@ (count: %lu)", v9, -[NSMutableIndexSet count](self->_filteredIndexes, "count")];
  }
  else
  {
    [v7 appendString:@", filtered items not calculated"];
  }
  uint64_t v10 = [(PLFilteredAlbumList *)self backingAlbumList];
  [v7 appendFormat:@", backing list: %p", v10];

  if (self->_filteredIndexes)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = [(PLFilteredAlbumList *)self albums];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __34__PLFilteredAlbumList_description__block_invoke;
    v16[3] = &unk_1E58758A8;
    id v17 = v11;
    id v13 = v11;
    [v12 enumerateObjectsUsingBlock:v16];

    v14 = [v13 componentsJoinedByString:@", "];
    [v7 appendFormat:@", albums: {%@}", v14];
  }
  return (NSString *)v7;
}

void __34__PLFilteredAlbumList_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a2);
  [v7 addObject:v8];

  if (a3 >= 0x15)
  {
    [*(id *)(a1 + 32) addObject:@"..."];
    *a4 = 1;
  }
}

- (PLPhotoLibrary)photoLibrary
{
  uint64_t v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  unint64_t v3 = [v2 photoLibrary];

  return (PLPhotoLibrary *)v3;
}

- (BOOL)hasAtLeastOneAlbum
{
  return [(PLFilteredAlbumList *)self albumsCount] != 0;
}

- (unint64_t)albumsCount
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  char v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  int v6 = [v5 objectID];
  id v7 = [v4 predicateWithFormat:@"%@ IN albumLists", v6];
  [v3 addObject:v7];

  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind != %d) OR (cachedCount > 0)", 1552);
  [v3 addObject:v8];

  char v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind != %d", 1602);
  [v3 addObject:v9];

  uint64_t v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v12 = +[PLGenericAlbum entityName];
  id v13 = [v11 fetchRequestWithEntityName:v12];

  [v13 setPredicate:v10];
  [v13 setFetchLimit:1];
  v14 = [(PLFilteredAlbumList *)self backingAlbumList];
  v15 = [v14 managedObjectContext];
  uint64_t v16 = [v15 countForFetchRequest:v13 error:0];

  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = v16;
  }

  return v17;
}

- (NSMutableOrderedSet)albums
{
  unint64_t v3 = [(PLFilteredAlbumList *)self _albums];

  if (!v3)
  {
    char v4 = [(PLFilteredAlbumList *)self mutableOrderedSetValueForKey:@"filteredAlbums"];
    [(PLFilteredAlbumList *)self set_albums:v4];
  }
  return [(PLFilteredAlbumList *)self _albums];
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  indexMapper = self->_indexMapper;
  id v9 = a5;
  id v10 = a4;
  id v12 = [(PLIndexMapper *)indexMapper backingIndexesForIndexes:a3];
  uint64_t v11 = [(PLFilteredAlbumList *)self backingAlbumList];
  [v11 preheatAlbumsAtIndexes:v12 forProperties:v10 relationships:v9];
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLFilteredAlbumList *)self backingAlbumList];
  [v8 preheatAlbumsForProperties:v7 relationships:v6];
}

- (void)updateAlbumsOrderIfNeeded
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  [v2 updateAlbumsOrderIfNeeded];
}

- (BOOL)needsReordering
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  char v3 = [v2 needsReordering];

  return v3;
}

- (void)setNeedsReordering
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  [v2 setNeedsReordering];
}

- (id)albumsSortingComparator
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  char v3 = [v2 albumsSortingComparator];

  return v3;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbumList *)self backingAlbumList];
  char v6 = [v5 albumHasFixedOrder:v4];

  return v6;
}

- (BOOL)isFolder
{
  return 0;
}

- (BOOL)canEditAlbums
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  char v3 = [v2 canEditAlbums];

  return v3;
}

- (signed)albumListType
{
  id v2 = [(PLFilteredAlbumList *)self backingAlbumList];
  signed __int16 v3 = [v2 albumListType];

  return v3;
}

- (void)dealloc
{
  signed __int16 v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PLFilteredAlbumList *)self unregisterAllDerivedAlbums];
  [(PLFilteredAlbumList *)self _invalidateFilteredIndexes];
  v4.receiver = self;
  v4.super_class = (Class)PLFilteredAlbumList;
  [(PLFilteredAlbumList *)&v4 dealloc];
}

- (PLFilteredAlbumList)initWithBackingAlbumList:(id)a3 filter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PLFilteredAlbumList;
  id v7 = [(PLFilteredAlbumList *)&v57 init];
  if (!v7) {
    goto LABEL_46;
  }
  id v8 = [[PLIndexMapper alloc] initWithDataSource:v7];
  indexMapper = v7->_indexMapper;
  v7->_indexMapper = v8;

  [(PLFilteredAlbumList *)v7 setBackingAlbumList:v6];
  id v10 = [(PLFilteredAlbumList *)v7 backingAlbumList];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(PLFilteredAlbumList *)v7 backingAlbumList];
    [v12 registerDerivedAlbumList:v7];
  }
  [(PLFilteredAlbumList *)v7 setFilter:v4];
  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
  [(PLFilteredAlbumList *)v7 setPredicate:v13];

  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v15 = *MEMORY[0x1E4F1BE30];
  uint64_t v16 = [(PLFilteredAlbumList *)v7 backingAlbumList];
  unint64_t v17 = [v16 managedObjectContext];
  [v14 addObserver:v7 selector:sel__backingContextDidChange_ name:v15 object:v17];

  uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  if (v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"photosCount > 0"];
    [v18 addObject:v19];
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"videosCount > 0"];
    [v18 addObject:v20];
  }
  long long v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isStandInAlbum == NO"];
  if ((v4 & 0x20000) != 0)
  {
    long long v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isEmpty == NO"];
    id v23 = (void *)MEMORY[0x1E4F28BA0];
    v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v21, v22, 0);
    uint64_t v25 = [v23 orPredicateWithSubpredicates:v24];

    [v18 addObject:v25];
  }
  else
  {
    [v18 addObject:v21];
  }

  if ((v4 & 0x80000) != 0)
  {
    uint64_t v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isFolder == NO"];
    [v18 addObject:v27];

    if ((v4 & 0x400000) == 0)
    {
LABEL_13:
      if ((v4 & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_33;
    }
  }
  else if ((v4 & 0x400000) == 0)
  {
    goto LABEL_13;
  }
  SEL v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isRecentlyAddedAlbum == NO"];
  [v18 addObject:v28];

  if ((v4 & 0x200) == 0)
  {
LABEL_14:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isEmpty == NO"];
  [v18 addObject:v29];

  if ((v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((v4 & 0x100000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"isSmartAlbum == NO OR isEmpty == NO OR kind == %d", 1612);
  [v18 addObject:v30];

  if ((v4 & 0x100000) != 0)
  {
LABEL_16:
    if ((v4 & 0x200000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  v31 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"trashedState == %d", 0);
  [v18 addObject:v31];

  if ((v4 & 0x200000) != 0)
  {
LABEL_17:
    if ((v4 & 0x1000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  v32 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind != %d", 1612);
  [v18 addObject:v32];

  if ((v4 & 0x1000000) != 0)
  {
LABEL_18:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_19;
    }
LABEL_38:
    v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isCameraAlbum == NO"];
    [v18 addObject:v34];
    goto LABEL_40;
  }
LABEL_37:
  v33 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind != %d", 1619);
  [v18 addObject:v33];

  if ((v4 & 0x800000) != 0) {
    goto LABEL_38;
  }
LABEL_19:
  if (v4 & 0x400) == 0 && (MGGetBoolAnswer())
  {
    if ((v4 & 0x2000) == 0) {
      goto LABEL_22;
    }
LABEL_41:
    v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isPhotoStreamAlbum == NO"];
    [v18 addObject:v43];

    if ((v4 & 0x1000) == 0) {
      goto LABEL_23;
    }
LABEL_42:
    v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isLibrary == NO"];
    [v18 addObject:v44];
    goto LABEL_48;
  }
  v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isCameraAlbum == NO"];
  v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isCameraAlbum == YES"];
  v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isEmpty == NO"];
  v37 = (void *)MEMORY[0x1E4F28BA0];
  v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v35, v36, 0);
  v39 = [v37 andPredicateWithSubpredicates:v38];

  v40 = (void *)MEMORY[0x1E4F28BA0];
  v41 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v34, v39, 0);
  v42 = [v40 orPredicateWithSubpredicates:v41];

  [v18 addObject:v42];
LABEL_40:

  if ((v4 & 0x2000) != 0) {
    goto LABEL_41;
  }
LABEL_22:
  if ((v4 & 0x1000) != 0) {
    goto LABEL_42;
  }
LABEL_23:
  if ((v4 & 0x800) == 0)
  {
    if ((v4 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
  v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isLibrary == NO"];
  v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isLibrary == YES"];
  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isEmpty == NO    "];
  v49 = (void *)MEMORY[0x1E4F28BA0];
  v50 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v47, v48, 0);
  v51 = [v49 andPredicateWithSubpredicates:v50];

  v52 = (void *)MEMORY[0x1E4F28BA0];
  v53 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v44, v51, 0);
  v54 = [v52 orPredicateWithSubpredicates:v53];

  [v18 addObject:v54];
LABEL_48:

  if ((v4 & 0x4000) == 0)
  {
LABEL_25:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_26;
    }
LABEL_50:
    v56 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"( isPendingPhotoStreamAlbum == NO)"];
    [v18 addObject:v56];

    if ((v4 & 0x8000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_49:
  v55 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"( (isOwnedCloudSharedAlbum == YES) OR (isMultipleContributorCloudSharedAlbum == YES))"];
  [v18 addObject:v55];

  if ((v4 & 0x10000) != 0) {
    goto LABEL_50;
  }
LABEL_26:
  if ((v4 & 0x8000) != 0)
  {
LABEL_27:
    v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isCloudSharedAlbum == NO"];
    [v18 addObject:v26];
  }
LABEL_28:
  if ([v18 count])
  {
    if ([v18 count] == 1) {
      [v18 objectAtIndex:0];
    }
    else {
    v45 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
    }
    [(PLFilteredAlbumList *)v7 setPredicate:v45];
  }
LABEL_46:

  return v7;
}

+ (id)filteredAlbumList:(id)a3 filter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithBackingAlbumList:v6 filter:v4];

  return v7;
}

@end