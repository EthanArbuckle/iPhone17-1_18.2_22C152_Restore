@interface PLSortedAlbumList
- (BOOL)albumHasFixedOrder:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)hasAtLeastOneAlbum;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4;
- (BOOL)needsReordering;
- (Class)derivedChangeNotificationClass;
- (NSMutableOrderedSet)_albums;
- (NSObject)cachedIndexMapState;
- (NSString)_prettyDescription;
- (NSString)_typeDescription;
- (PLAlbumContainer)backingAlbumList;
- (PLSortedAlbumList)initWithAlbumList:(id)a3 sortComparator:(id)a4;
- (id)albums;
- (id)albumsSortingComparator;
- (id)containersRelationshipName;
- (id)identifier;
- (id)managedObjectContext;
- (id)objectInSortedAlbumsAtIndex:(unint64_t)a3;
- (id)photoLibrary;
- (id)sortComparator;
- (int)filter;
- (signed)albumListType;
- (unint64_t)albumsCount;
- (unint64_t)indexInSortedAlbumsOfObject:(id)a3;
- (unint64_t)unreadAlbumsCount;
- (void)createSortedIndexesMap;
- (void)dealloc;
- (void)insertObject:(id)a3 inSortedAlbumsAtIndex:(unint64_t)a4;
- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5;
- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4;
- (void)removeObjectFromSortedAlbumsAtIndex:(unint64_t)a3;
- (void)replaceObjectInSortedAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setBackingAlbumList:(id)a3;
- (void)setNeedsReordering;
- (void)setSortComparator:(id)a3;
- (void)set_albums:(id)a3;
- (void)updateAlbumsOrderIfNeeded;
@end

@implementation PLSortedAlbumList

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_albums);
  objc_storeStrong(&self->_sortComparator, 0);
  objc_storeStrong((id *)&self->_backingAlbumList, 0);
}

- (void)setSortComparator:(id)a3
{
}

- (id)sortComparator
{
  return self->_sortComparator;
}

- (void)setBackingAlbumList:(id)a3
{
}

- (PLAlbumContainer)backingAlbumList
{
  return self->_backingAlbumList;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  -[PLSortedAlbumList set_albums:](self, "set_albums:", 0, a4);
  toBackingMap = self->_toBackingMap;
  if (toBackingMap)
  {
    CFRelease(toBackingMap);
    self->_toBackingMap = 0;
  }
  fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap)
  {
    CFRelease(fromBackingMap);
    self->_fromBackingMap = 0;
  }
  return 1;
}

- (NSObject)cachedIndexMapState
{
  fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap) {
    v3 = fromBackingMap;
  }
  return fromBackingMap;
}

- (void)replaceObjectInSortedAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  v7 = backingIndexForIndex(self, a3);
  id v9 = [(PLSortedAlbumList *)self backingAlbumList];
  v8 = [v9 albums];
  [v8 replaceObjectAtIndex:v7 withObject:v6];
}

- (void)removeObjectFromSortedAlbumsAtIndex:(unint64_t)a3
{
  v4 = backingIndexForIndex(self, a3);
  id v6 = [(PLSortedAlbumList *)self backingAlbumList];
  v5 = [v6 albums];
  [v5 removeObjectAtIndex:v4];
}

- (void)insertObject:(id)a3 inSortedAlbumsAtIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = backingIndexForIndex(self, a4);
  id v9 = [(PLSortedAlbumList *)self backingAlbumList];
  v8 = [v9 albums];
  [v8 insertObject:v6 atIndex:v7];
}

- (id)objectInSortedAlbumsAtIndex:(unint64_t)a3
{
  v4 = backingIndexForIndex(self, a3);
  v5 = [(PLSortedAlbumList *)self backingAlbumList];
  id v6 = [v5 albums];
  v7 = [v6 objectAtIndex:v4];

  return v7;
}

- (unint64_t)indexInSortedAlbumsOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(PLSortedAlbumList *)self backingAlbumList];
  id v6 = [v5 albums];
  CFIndex v7 = [v6 indexOfObject:v4];

  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = self;
    [(PLSortedAlbumList *)v9 createSortedIndexesMap];
    CFArrayRef fromBackingMap = v9->_fromBackingMap;

    if (fromBackingMap) {
      return (unint64_t)CFArrayGetValueAtIndex(fromBackingMap, v7);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)set_albums:(id)a3
{
}

- (NSMutableOrderedSet)_albums
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_albums);
  return (NSMutableOrderedSet *)WeakRetained;
}

- (void)createSortedIndexesMap
{
  if (!self->_toBackingMap)
  {
    unint64_t v4 = [(PLSortedAlbumList *)self albumsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      id v6 = (const void **)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
      CFIndex v7 = v6;
      for (i = 0; i != (const void *)v5; i = (char *)i + 1)
        v6[(void)i] = i;
      id v9 = [(PLSortedAlbumList *)self backingAlbumList];
      v10 = [v9 albums];
      v11 = [v10 array];

      v12 = [(PLSortedAlbumList *)self sortComparator];
      if (v12)
      {
        id v13 = [v11 sortedArrayWithOptions:16 usingComparator:v12];
      }
      else
      {
        id v13 = v11;
      }
      v14 = v13;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __43__PLSortedAlbumList_createSortedIndexesMap__block_invoke;
      v18[3] = &unk_1E58723B8;
      id v15 = v11;
      id v19 = v15;
      v20 = self;
      SEL v21 = a2;
      v22 = v7;
      [v14 enumerateObjectsUsingBlock:v18];
      CFIndex v16 = 0;
      self->_toBackingMap = CFArrayCreate(0, v7, v5, 0);
      if (v5 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v5;
      }
      do
      {
        v7[(void)CFArrayGetValueAtIndex(self->_toBackingMap, v16)] = (const void *)v16;
        ++v16;
      }
      while (v17 != v16);
      self->_CFArrayRef fromBackingMap = CFArrayCreate(0, v7, v5, 0);
      free(v7);
    }
  }
}

void __43__PLSortedAlbumList_createSortedIndexesMap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:a2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"PLSortedAlbumList.m" lineNumber:258 description:&stru_1EEB2EB80];
  }
  *(void *)(*(void *)(a1 + 56) + 8 * a3) = v5;
}

- (id)containersRelationshipName
{
  return @"albums";
}

- (BOOL)isEmpty
{
  return ![(PLSortedAlbumList *)self hasAtLeastOneAlbum];
}

- (NSString)_prettyDescription
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(PLSortedAlbumList *)self backingAlbumList];
  CFIndex v7 = [v6 _prettyDescription];
  v8 = [v3 stringWithFormat:@"%@\nBacking album list = %@", v5, v7];

  return (NSString *)v8;
}

- (NSString)_typeDescription
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(PLSortedAlbumList *)self backingAlbumList];
  CFIndex v7 = [v6 _typeDescription];
  v8 = [v3 stringWithFormat:@"%@\nBacking album list = %@", v5, v7];

  return (NSString *)v8;
}

- (id)photoLibrary
{
  v2 = [(PLSortedAlbumList *)self backingAlbumList];
  v3 = [v2 photoLibrary];

  return v3;
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F28E60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __72__PLSortedAlbumList_preheatAlbumsAtIndexes_forProperties_relationships___block_invoke;
  v18 = &unk_1E5873A00;
  id v19 = self;
  id v20 = v12;
  id v13 = v12;
  [v11 enumerateIndexesUsingBlock:&v15];

  v14 = [(PLSortedAlbumList *)self backingAlbumList];
  [v14 preheatAlbumsAtIndexes:v13 forProperties:v10 relationships:v9];
}

uint64_t __72__PLSortedAlbumList_preheatAlbumsAtIndexes_forProperties_relationships___block_invoke(uint64_t a1, CFIndex a2)
{
  v3 = backingIndexForIndex(*(void **)(a1 + 32), a2);
  unint64_t v4 = *(void **)(a1 + 40);
  return [v4 addIndex:v3];
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLSortedAlbumList *)self backingAlbumList];
  [v8 preheatAlbumsForProperties:v7 relationships:v6];
}

- (void)updateAlbumsOrderIfNeeded
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  [v2 updateAlbumsOrderIfNeeded];
}

- (BOOL)needsReordering
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  char v3 = [v2 needsReordering];

  return v3;
}

- (void)setNeedsReordering
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  [v2 setNeedsReordering];
}

- (id)albumsSortingComparator
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  char v3 = [v2 albumsSortingComparator];

  return v3;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLSortedAlbumList *)self backingAlbumList];
  char v6 = [v5 albumHasFixedOrder:v4];

  return v6;
}

- (BOOL)isFolder
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  char v3 = [v2 isFolder];

  return v3;
}

- (BOOL)canEditAlbums
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  char v3 = [v2 canEditAlbums];

  return v3;
}

- (signed)albumListType
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  signed __int16 v3 = [v2 albumListType];

  return v3;
}

- (id)managedObjectContext
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  signed __int16 v3 = [v2 managedObjectContext];

  return v3;
}

- (unint64_t)unreadAlbumsCount
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  unint64_t v3 = [v2 unreadAlbumsCount];

  return v3;
}

- (BOOL)hasAtLeastOneAlbum
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  char v3 = [v2 hasAtLeastOneAlbum];

  return v3;
}

- (int)filter
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  int v3 = [v2 filter];

  return v3;
}

- (unint64_t)albumsCount
{
  id v2 = [(PLSortedAlbumList *)self backingAlbumList];
  int v3 = [v2 albums];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)albums
{
  int v3 = [(PLSortedAlbumList *)self _albums];

  if (!v3)
  {
    unint64_t v4 = [(PLSortedAlbumList *)self mutableOrderedSetValueForKey:@"sortedAlbums"];
    [(PLSortedAlbumList *)self set_albums:v4];
  }
  return [(PLSortedAlbumList *)self _albums];
}

- (id)identifier
{
  return (id)[NSNumber numberWithInteger:-1];
}

- (void)dealloc
{
  toBackingMap = self->_toBackingMap;
  if (toBackingMap) {
    CFRelease(toBackingMap);
  }
  CFArrayRef fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap) {
    CFRelease(fromBackingMap);
  }
  id sortComparator = self->_sortComparator;
  self->_id sortComparator = 0;

  v6.receiver = self;
  v6.super_class = (Class)PLSortedAlbumList;
  [(PLSortedAlbumList *)&v6 dealloc];
}

- (PLSortedAlbumList)initWithAlbumList:(id)a3 sortComparator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSortedAlbumList;
  id v8 = [(PLSortedAlbumList *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    [(PLSortedAlbumList *)v8 setBackingAlbumList:v6];
    [(PLSortedAlbumList *)v9 setSortComparator:v7];
    id v10 = [(PLSortedAlbumList *)v9 backingAlbumList];
    int v11 = [v10 conformsToProtocol:&unk_1EEC413C0];

    if (v11)
    {
      id v12 = [(PLSortedAlbumList *)v9 backingAlbumList];
      [v12 registerDerivedAlbumList:v9];
    }
  }

  return v9;
}

@end