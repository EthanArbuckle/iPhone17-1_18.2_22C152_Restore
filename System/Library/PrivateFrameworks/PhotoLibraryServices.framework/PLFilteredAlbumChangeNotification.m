@interface PLFilteredAlbumChangeNotification
+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5;
- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4;
- (BOOL)countDidChange;
- (BOOL)keyAssetDidChange;
- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3;
- (BOOL)shouldReload;
- (BOOL)titleDidChange;
- (NSIndexSet)filteredIndexes;
- (NSIndexSet)updatedFilteredIndexes;
- (NSString)description;
- (PLFilteredAlbumChangeNotification)init;
- (PLFilteredAlbumChangeNotification)initWithFilteredAlbum:(id)a3 priorChangeState:(id)a4 albumChangeNotification:(id)a5;
- (PLIndexMapper)indexMapper;
- (id)_changedObjects;
- (id)_diffDescription;
- (id)album;
- (id)object;
- (void)setFilteredIndexes:(id)a3;
@end

@implementation PLFilteredAlbumChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingNotification, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_oldFilteredIndexes, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

- (id)_changedObjects
{
  return [(PLContainerChangeNotification *)self->_backingNotification _changedObjects];
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  backingNotification = self->_backingNotification;
  id v23 = 0;
  id v24 = 0;
  BOOL v8 = [(PLAssetContainerChangeNotification *)backingNotification _getOldSet:&v24 newSet:&v23];
  id v9 = v24;
  id v10 = v23;
  if (v8)
  {
    v11 = self->_oldFilteredIndexes;
    uint64_t v12 = [(PLFilteredAlbumChangeNotification *)self updatedFilteredIndexes];
    v13 = (void *)v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14
      || [(NSIndexSet *)v11 count]
      && (unint64_t v15 = [v9 count], v15 <= -[NSIndexSet lastIndex](v11, "lastIndex"))
      || [v13 count] && (unint64_t v16 = objc_msgSend(v10, "count"), v16 <= objc_msgSend(v13, "lastIndex")))
    {
      BOOL v21 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F1CAA0];
      v18 = [v9 objectsAtIndexes:v11];
      *a3 = [v17 orderedSetWithArray:v18];

      v19 = (void *)MEMORY[0x1E4F1CAA0];
      v20 = [v10 objectsAtIndexes:v13];
      *a4 = [v19 orderedSetWithArray:v20];

      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)_diffDescription
{
  v3 = (void *)MEMORY[0x19F38D3B0]([(PLContainerChangeNotification *)self _calculateDiffsIfNecessary]);
  v4 = [MEMORY[0x1E4F28E78] string];
  if ([(PLFilteredAlbumChangeNotification *)self shouldReload])
  {
    v5 = [(PLAssetContainerChangeNotification *)self _contentRelationshipName];
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
    v20 = __53__PLFilteredAlbumChangeNotification__diffDescription__block_invoke;
    BOOL v21 = &unk_1E5873B18;
    id v13 = v12;
    id v22 = v13;
    [(PLContainerChangeNotification *)self enumerateMovesWithBlock:&v18];
    if ([v13 length]) {
      [v4 appendFormat:@", moved: {%@}", v13, v18, v19, v20, v21];
    }

    BOOL v14 = [(PLContainerChangeNotification *)self changedIndexes];

    if (v14)
    {
      unint64_t v15 = [(PLContainerChangeNotification *)self changedIndexes];
      unint64_t v16 = objc_msgSend(v15, "pl_shortDescription");
      [v4 appendFormat:@", changed: {%@}", v16];
    }
    if ([(PLFilteredAlbumChangeNotification *)self countDidChange]) {
      [v4 appendString:@", count changed"];
    }
  }
  return v4;
}

uint64_t __53__PLFilteredAlbumChangeNotification__diffDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%lu->%lu, ", a2, a3];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = objc_opt_class();
  v6 = [(PLFilteredAlbumChangeNotification *)self object];
  v7 = [v4 stringWithFormat:@"<%@: %p> filtered album: %p backing note: <%@: %p>", v5, self, v6, objc_opt_class(), self->_backingNotification];

  BOOL v8 = [(PLFilteredAlbumChangeNotification *)self _diffDescription];
  [v7 appendString:v8];

  if ([(PLFilteredAlbumChangeNotification *)self keyAssetDidChange]) {
    [v7 appendString:@", key asset changed"];
  }
  if ([(PLFilteredAlbumChangeNotification *)self titleDidChange]) {
    [v7 appendString:@", title changed"];
  }
  return (NSString *)v7;
}

- (BOOL)countDidChange
{
  oldFilteredIndexes = self->_oldFilteredIndexes;
  if (!oldFilteredIndexes) {
    return 1;
  }
  uint64_t v4 = [(NSIndexSet *)oldFilteredIndexes count];
  uint64_t v5 = [(PLFilteredAlbumChangeNotification *)self updatedFilteredIndexes];
  BOOL v6 = v4 != [v5 count];

  return v6;
}

- (BOOL)keyAssetDidChange
{
  return [(PLAssetContainerChangeNotification *)self->_backingNotification keyAssetDidChange];
}

- (BOOL)titleDidChange
{
  return [(PLAssetContainerChangeNotification *)self->_backingNotification titleDidChange];
}

- (BOOL)shouldReload
{
  if (!self->_oldFilteredIndexes) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)PLFilteredAlbumChangeNotification;
  return [(PLContainerChangeNotification *)&v3 shouldReload];
}

- (id)album
{
  return self->_album;
}

- (id)object
{
  return self->_album;
}

- (PLFilteredAlbumChangeNotification)initWithFilteredAlbum:(id)a3 priorChangeState:(id)a4 albumChangeNotification:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLFilteredAlbumChangeNotification;
  uint64_t v12 = [(PLContainerChangeNotification *)&v21 _init];
  id v13 = (PLFilteredAlbumChangeNotification *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 13, a3);
    BOOL v14 = [v11 snapshot];

    if (v14)
    {
      unint64_t v15 = [v11 snapshot];
      uint64_t v16 = [v15 filteredIndexesForFilter:v13->_album];
      oldFilteredIndexes = v13->_oldFilteredIndexes;
      v13->_oldFilteredIndexes = (NSIndexSet *)v16;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v10;
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = v18;
      unint64_t v15 = v13->_oldFilteredIndexes;
      v13->_oldFilteredIndexes = v19;
    }

    objc_storeStrong((id *)&v13->_backingNotification, a5);
  }

  return v13;
}

- (PLFilteredAlbumChangeNotification)init
{
  return 0;
}

+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
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
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = 0;
    }
    else {
      id v13 = (void *)[objc_alloc((Class)a1) initWithFilteredAlbum:v11 priorChangeState:v9 albumChangeNotification:v12];
    }
  }
  else
  {
    id v13 = 0;
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
  return [(PLFilteredAlbum *)self->_album filteredIndexes];
}

@end