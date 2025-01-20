@interface PLFilteredAlbumListChangeNotification
+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5;
- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4;
- (BOOL)countDidChange;
- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3;
- (BOOL)shouldReload;
- (NSIndexSet)filteredIndexes;
- (NSIndexSet)updatedFilteredIndexes;
- (NSString)description;
- (PLFilteredAlbumListChangeNotification)init;
- (PLFilteredAlbumListChangeNotification)initWithFilteredAlbumList:(id)a3 albumListChangeNotification:(id)a4;
- (PLIndexMapper)indexMapper;
- (id)_changedObjects;
- (id)_diffDescription;
- (id)albumList;
- (id)object;
- (void)setFilteredIndexes:(id)a3;
@end

@implementation PLFilteredAlbumListChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingNotification, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_oldFilteredIndexes, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

- (id)_changedObjects
{
  return [(PLContainerChangeNotification *)self->_backingNotification _changedObjects];
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  backingNotification = self->_backingNotification;
  id v21 = 0;
  id v22 = 0;
  BOOL v8 = [(PLContainerChangeNotification *)backingNotification _getOldSet:&v22 newSet:&v21];
  id v9 = v22;
  id v10 = v21;
  if (v8)
  {
    v11 = self->_oldFilteredIndexes;
    uint64_t v12 = [(PLFilteredAlbumListChangeNotification *)self updatedFilteredIndexes];
    v13 = (void *)v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    BOOL v15 = !v14;
    if (!v14)
    {
      v16 = (void *)MEMORY[0x1E4F1CAA0];
      v17 = [v9 objectsAtIndexes:v11];
      *a3 = [v16 orderedSetWithArray:v17];

      v18 = (void *)MEMORY[0x1E4F1CAA0];
      v19 = [v10 objectsAtIndexes:v13];
      *a4 = [v18 orderedSetWithArray:v19];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_diffDescription
{
  v3 = (void *)MEMORY[0x19F38D3B0]([(PLContainerChangeNotification *)self _calculateDiffsIfNecessary]);
  v4 = [MEMORY[0x1E4F28E78] string];
  if ([(PLFilteredAlbumListChangeNotification *)self shouldReload])
  {
    v5 = [(PLAssetContainerListChangeNotification *)self _contentRelationshipName];
    [v4 appendFormat:@", %@ need reload", v5];
  }
  else
  {
    v6 = [(PLContainerChangeNotification *)self deletedIndexes];

    if (v6)
    {
      v7 = [(PLContainerChangeNotification *)self deletedIndexes];
      BOOL v8 = objc_msgSend(v7, "pl_shortDescription");
      [v4 appendFormat:@", deleted: {%@}", v8];
    }
    id v9 = [(PLContainerChangeNotification *)self insertedIndexes];

    if (v9)
    {
      id v10 = [(PLContainerChangeNotification *)self insertedIndexes];
      v11 = objc_msgSend(v10, "pl_shortDescription");
      [v4 appendFormat:@", inserted: {%@}", v11];
    }
    uint64_t v12 = [MEMORY[0x1E4F28E78] string];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __57__PLFilteredAlbumListChangeNotification__diffDescription__block_invoke;
    id v21 = &unk_1E5873B18;
    id v13 = v12;
    id v22 = v13;
    [(PLContainerChangeNotification *)self enumerateMovesWithBlock:&v18];
    if ([v13 length]) {
      [v4 appendFormat:@", moved: {%@}", v13, v18, v19, v20, v21];
    }

    BOOL v14 = [(PLContainerChangeNotification *)self changedIndexes];

    if (v14)
    {
      BOOL v15 = [(PLContainerChangeNotification *)self changedIndexes];
      v16 = objc_msgSend(v15, "pl_shortDescription");
      [v4 appendFormat:@", changed: {%@}", v16];
    }
    if ([(PLFilteredAlbumListChangeNotification *)self countDidChange]) {
      [v4 appendString:@", count changed"];
    }
  }
  return v4;
}

uint64_t __57__PLFilteredAlbumListChangeNotification__diffDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%lu->%lu, ", a2, a3];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = objc_opt_class();
  v6 = [(PLFilteredAlbumListChangeNotification *)self object];
  v7 = [v4 stringWithFormat:@"<%@: %p> filtered album list: %p backing note: <%@: %p>", v5, self, v6, objc_opt_class(), self->_backingNotification];

  BOOL v8 = [(PLFilteredAlbumListChangeNotification *)self _diffDescription];
  [v7 appendString:v8];

  return (NSString *)v7;
}

- (BOOL)countDidChange
{
  oldFilteredIndexes = self->_oldFilteredIndexes;
  if (!oldFilteredIndexes) {
    return 1;
  }
  uint64_t v4 = [(NSIndexSet *)oldFilteredIndexes count];
  uint64_t v5 = [(PLFilteredAlbumListChangeNotification *)self updatedFilteredIndexes];
  BOOL v6 = v4 != [v5 count];

  return v6;
}

- (BOOL)shouldReload
{
  if (!self->_oldFilteredIndexes) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)PLFilteredAlbumListChangeNotification;
  return [(PLContainerChangeNotification *)&v3 shouldReload];
}

- (id)albumList
{
  return self->_albumList;
}

- (id)object
{
  return self->_albumList;
}

- (PLFilteredAlbumListChangeNotification)initWithFilteredAlbumList:(id)a3 albumListChangeNotification:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLFilteredAlbumListChangeNotification;
  id v9 = [(PLContainerChangeNotification *)&v15 _init];
  id v10 = (PLFilteredAlbumListChangeNotification *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 12, a3);
    v11 = [v8 snapshot];
    uint64_t v12 = [v11 filteredIndexesForFilter:v10->_albumList];
    oldFilteredIndexes = v10->_oldFilteredIndexes;
    v10->_oldFilteredIndexes = (NSIndexSet *)v12;

    objc_storeStrong((id *)&v10->_backingNotification, a4);
  }

  return v10;
}

- (PLFilteredAlbumListChangeNotification)init
{
  return 0;
}

+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = 0;
  }
  else
  {
    id v11 = v8;
    id v12 = v10;
    if (v11)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
    id v13 = (void *)[objc_alloc((Class)a1) initWithFilteredAlbumList:v11 albumListChangeNotification:v12];
  }
  return v13;
}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)setFilteredIndexes:(id)a3
{
  uint64_t v5 = (NSIndexSet *)a3;
  if (self->_filteredIndexes != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_filteredIndexes, a3);
    uint64_t v5 = v6;
  }
}

- (NSIndexSet)filteredIndexes
{
  return self->_filteredIndexes;
}

- (PLIndexMapper)indexMapper
{
  indexMapper = self->_indexMapper;
  if (!indexMapper)
  {
    uint64_t v4 = [[PLIndexMapper alloc] initWithDataSource:self];
    uint64_t v5 = self->_indexMapper;
    self->_indexMapper = v4;

    indexMapper = self->_indexMapper;
  }
  return indexMapper;
}

- (NSIndexSet)updatedFilteredIndexes
{
  return [(PLFilteredAlbumList *)self->_albumList filteredIndexes];
}

@end