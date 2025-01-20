@interface PLAggregateAlbumListChangeNotification
+ (id)notificationForAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5;
- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4;
- (BOOL)shouldReload;
- (PLAggregateAlbumListChangeNotification)initWithAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5;
- (id)albumList;
- (id)changedIndexes;
- (id)changedIndexesRelativeToSnapshot;
- (id)changedObjects;
- (id)deletedIndexes;
- (id)deletedObjects;
- (id)insertedIndexes;
- (id)insertedObjects;
- (id)object;
- (unint64_t)snapshotIndexForContainedObject:(id)a3;
- (void)dealloc;
- (void)enumerateMovesWithBlock:(id)a3;
@end

@implementation PLAggregateAlbumListChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  return [(PLContainerChangeNotification *)self->_note _getOldSet:a3 newSet:a4];
}

- (id)changedObjects
{
  return [(PLContainerChangeNotification *)self->_note changedObjects];
}

- (id)insertedObjects
{
  return [(PLContainerChangeNotification *)self->_note insertedObjects];
}

- (id)deletedObjects
{
  return [(PLContainerChangeNotification *)self->_note deletedObjects];
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLAggregateAlbumListChangeNotification;
  id v4 = [(PLContainerChangeNotification *)&v7 snapshotIndexForContainedObject:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
    return (unint64_t)v4 + self->_indexOffet;
  }
  return v5;
}

- (id)changedIndexesRelativeToSnapshot
{
  v3 = [(PLContainerChangeNotification *)self->_note changedIndexesRelativeToSnapshot];
  id v4 = (void *)[v3 mutableCopy];

  [v4 shiftIndexesStartingAtIndex:0 by:self->_indexOffet];
  return v4;
}

- (id)changedIndexes
{
  v3 = [(PLContainerChangeNotification *)self->_note changedIndexes];
  id v4 = (void *)[v3 mutableCopy];

  [v4 shiftIndexesStartingAtIndex:0 by:self->_indexOffet];
  return v4;
}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PLAggregateAlbumListChangeNotification_enumerateMovesWithBlock___block_invoke;
  v7[3] = &unk_1E586E170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLContainerChangeNotification *)note enumerateMovesWithBlock:v7];
}

uint64_t __66__PLAggregateAlbumListChangeNotification_enumerateMovesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 112) + a2, *(void *)(*(void *)(a1 + 32) + 112) + a3);
  }
  return result;
}

- (id)insertedIndexes
{
  v3 = [(PLContainerChangeNotification *)self->_note insertedIndexes];
  id v4 = (void *)[v3 mutableCopy];

  [v4 shiftIndexesStartingAtIndex:0 by:self->_indexOffet];
  return v4;
}

- (id)deletedIndexes
{
  v3 = [(PLContainerChangeNotification *)self->_note deletedIndexes];
  id v4 = (void *)[v3 mutableCopy];

  [v4 shiftIndexesStartingAtIndex:0 by:self->_indexOffet];
  return v4;
}

- (BOOL)shouldReload
{
  return [(PLContainerChangeNotification *)self->_note shouldReload];
}

- (id)albumList
{
  return self->_albumList;
}

- (id)object
{
  return self->_albumList;
}

- (void)dealloc
{
  albumList = self->_albumList;
  self->_albumList = 0;

  note = self->_note;
  self->_note = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLAggregateAlbumListChangeNotification;
  [(PLContainerChangeNotification *)&v5 dealloc];
}

- (PLAggregateAlbumListChangeNotification)initWithAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLAggregateAlbumListChangeNotification;
  v11 = [(PLContainerChangeNotification *)&v14 _init];
  v12 = (PLAggregateAlbumListChangeNotification *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 12, a3);
    objc_storeStrong((id *)&v12->_note, a4);
    v12->_indexOffet = a5;
  }

  return v12;
}

+ (id)notificationForAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v10 = 0;
  }
  else {
    id v10 = (void *)[objc_alloc((Class)a1) initWithAggregateAlbumList:v8 fromAlbumListChangeNotification:v9 indexOffset:a5];
  }

  return v10;
}

@end