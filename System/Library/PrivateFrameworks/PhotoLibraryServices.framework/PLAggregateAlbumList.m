@interface PLAggregateAlbumList
+ (PLAggregateAlbumList)albumListWithFilter:(int)a3 inPhotoLibrary:(id)a4;
- (BOOL)albumHasFixedOrder:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)hasAtLeastOneAlbum;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)needsReordering;
- (NSString)_prettyDescription;
- (NSString)_typeDescription;
- (PLAggregateAlbumList)initWithFilter:(int)a3 inPhotoLibrary:(id)a4;
- (id)albums;
- (id)albumsSortingComparator;
- (id)containersRelationshipName;
- (id)identifier;
- (id)managedObjectContext;
- (id)photoLibrary;
- (int)filter;
- (signed)albumListType;
- (unint64_t)albumsCount;
- (unint64_t)unreadAlbumsCount;
- (void)_invalidateAllAlbums;
- (void)assetContainerListDidChange:(id)a3;
- (void)dealloc;
- (void)setFilter:(int)a3;
@end

@implementation PLAggregateAlbumList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAlbumLists, 0);
  objc_storeStrong((id *)&self->_allAlbums, 0);
}

- (void)setFilter:(int)a3
{
  self->_filter = a3;
}

- (int)filter
{
  return self->_filter;
}

- (id)containersRelationshipName
{
  return @"albums";
}

- (BOOL)isEmpty
{
  return ![(PLAggregateAlbumList *)self hasAtLeastOneAlbum];
}

- (NSString)_typeDescription
{
  return (NSString *)@"All Albums";
}

- (NSString)_prettyDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@\nAll Albums = \n", v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_childAlbumLists;
  uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _prettyDescription];
        [v6 appendString:v12];
      }
      uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSString *)v6;
}

- (id)photoLibrary
{
  v2 = [(NSMutableOrderedSet *)self->_childAlbumLists lastObject];
  v3 = [v2 photoLibrary];

  return v3;
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
  return 1;
}

- (BOOL)isFolder
{
  return 0;
}

- (BOOL)canEditAlbums
{
  return 0;
}

- (signed)albumListType
{
  return 5;
}

- (id)managedObjectContext
{
  v2 = [(NSMutableOrderedSet *)self->_childAlbumLists lastObject];
  v3 = [v2 managedObjectContext];

  return v3;
}

- (unint64_t)unreadAlbumsCount
{
  return 0;
}

- (BOOL)hasAtLeastOneAlbum
{
  return [(PLAggregateAlbumList *)self albumsCount] != 0;
}

- (unint64_t)albumsCount
{
  v2 = [(PLAggregateAlbumList *)self albums];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)albums
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  allAlbums = self->_allAlbums;
  if (!allAlbums)
  {
    v4 = (NSMutableOrderedSet *)objc_opt_new();
    v5 = self->_allAlbums;
    self->_allAlbums = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_childAlbumLists;
    uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = self->_allAlbums;
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "albums", (void)v15);
          [(NSMutableOrderedSet *)v11 unionOrderedSet:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    allAlbums = self->_allAlbums;
  }
  v13 = (void *)[(NSMutableOrderedSet *)allAlbums mutableCopy];
  return v13;
}

- (id)identifier
{
  return (id)[NSNumber numberWithInteger:-1];
}

- (void)assetContainerListDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 albumList];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  childAlbumLists = self->_childAlbumLists;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke;
  v21[3] = &unk_1E586E198;
  id v7 = v5;
  id v22 = v7;
  v23 = &v24;
  [(NSMutableOrderedSet *)childAlbumLists enumerateObjectsUsingBlock:v21];
  uint64_t v8 = +[PLAggregateAlbumListChangeNotification notificationForAggregateAlbumList:self fromAlbumListChangeNotification:v4 indexOffset:v25[3]];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke_2;
  v16[3] = &unk_1E586E1C0;
  v16[4] = &v17;
  [v8 enumerateMovesWithBlock:v16];
  if (([v4 shouldReload] & 1) != 0 || *((unsigned char *)v18 + 24))
  {
    [(PLAggregateAlbumList *)self willChangeValueForKey:@"albums"];
    [(PLAggregateAlbumList *)self _invalidateAllAlbums];
    [(PLAggregateAlbumList *)self didChangeValueForKey:@"albums"];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
    v11 = [v8 deletedIndexes];
    if ([v11 count])
    {
      [(PLAggregateAlbumList *)self willChange:3 valuesAtIndexes:v11 forKey:@"albums"];
      [(NSMutableOrderedSet *)self->_allAlbums removeObjectsAtIndexes:v11];
      [(PLAggregateAlbumList *)self didChange:3 valuesAtIndexes:v11 forKey:@"albums"];
    }
    v12 = [v8 insertedIndexes];

    if ([v12 count])
    {
      [(PLAggregateAlbumList *)self willChange:2 valuesAtIndexes:v12 forKey:@"albums"];
      allAlbums = self->_allAlbums;
      long long v14 = [v8 insertedObjects];
      [(NSMutableOrderedSet *)allAlbums insertObjects:v14 atIndexes:v12];

      [(PLAggregateAlbumList *)self didChange:2 valuesAtIndexes:v12 forKey:@"albums"];
    }
    long long v15 = [v8 changedIndexes];

    if ([v15 count])
    {
      [(PLAggregateAlbumList *)self willChange:1 valuesAtIndexes:v15 forKey:@"albums"];
      [(PLAggregateAlbumList *)self didChange:1 valuesAtIndexes:v15 forKey:@"albums"];
    }
  }
  uint64_t v9 = +[PLChangeNotificationCenter defaultCenter];
  [v9 enqueueNotification:v8];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);
}

void __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void **)(a1 + 32) == a2)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = [a2 albums];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 count];
  }
}

uint64_t __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_invalidateAllAlbums
{
  allAlbums = self->_allAlbums;
  self->_allAlbums = 0;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[PLChangeNotificationCenter defaultCenter];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_childAlbumLists;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeAssetContainerListChangeObserver:self containerList:*(void *)(*((void *)&v12 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  childAlbumLists = self->_childAlbumLists;
  self->_childAlbumLists = 0;

  allAlbums = self->_allAlbums;
  self->_allAlbums = 0;

  v11.receiver = self;
  v11.super_class = (Class)PLAggregateAlbumList;
  [(PLAggregateAlbumList *)&v11 dealloc];
}

- (PLAggregateAlbumList)initWithFilter:(int)a3 inPhotoLibrary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAggregateAlbumList;
  uint64_t v7 = [(PLAggregateAlbumList *)&v16 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    childAlbumLists = v7->_childAlbumLists;
    v7->_childAlbumLists = (NSMutableOrderedSet *)v8;

    [(PLAggregateAlbumList *)v7 setFilter:v4];
    uint64_t v10 = +[PLChangeNotificationCenter defaultCenter];
    for (uint64_t i = 0; i != 5; ++i)
    {
      switch(__albumListTypes[i])
      {
        case 0:
          uint64_t v12 = +[PLManagedAlbumList albumListInPhotoLibrary:v6];
          goto LABEL_11;
        case 1:
          uint64_t v12 = +[PLManagedAlbumList eventListInPhotoLibrary:v6];
          goto LABEL_11;
        case 2:
          uint64_t v12 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:v6];
          goto LABEL_11;
        case 3:
          uint64_t v12 = +[PLManagedAlbumList placesAlbumListInPhotoLibrary:v6];
          goto LABEL_11;
        case 4:
          uint64_t v12 = +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:v6];
          goto LABEL_11;
        case 7:
          uint64_t v12 = +[PLManagedAlbumList importListInPhotoLibrary:v6];
          goto LABEL_11;
        case 10:
          uint64_t v12 = +[PLManagedAlbumList scenesAlbumListInPhotoLibrary:v6];
LABEL_11:
          long long v13 = (void *)v12;
          if (v12)
          {
            long long v14 = +[PLFilteredAlbumList filteredAlbumList:v12 filter:v4];
            [(NSMutableOrderedSet *)v7->_childAlbumLists addObject:v14];
            [v10 addAssetContainerListChangeObserver:v7 containerList:v14];
          }
          break;
        default:
          continue;
      }
    }
  }
  return v7;
}

+ (PLAggregateAlbumList)albumListWithFilter:(int)a3 inPhotoLibrary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithFilter:v4 inPhotoLibrary:v6];

  return (PLAggregateAlbumList *)v7;
}

@end