@interface _TUIDynamicArrayUpdateGroup
- (NSArray)updates;
- (_TUIDynamicArrayUpdateGroup)initWithGeneration:(id)a3 count:(unint64_t)a4 transaction:(id)a5;
- (_TUITransaction)transaction;
- (id)generation;
- (id)trimWithStart:(int64_t)a3 end:(int64_t)a4;
- (unint64_t)count;
- (void)_validateInserts;
- (void)dealloc;
- (void)deleteItemAtIndex:(unint64_t)a3;
- (void)finalizeUpdates;
- (void)insertItemAtIndex:(unint64_t)a3;
- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)updateItemAtIndex:(unint64_t)a3;
@end

@implementation _TUIDynamicArrayUpdateGroup

- (_TUIDynamicArrayUpdateGroup)initWithGeneration:(id)a3 count:(unint64_t)a4 transaction:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_TUIDynamicArrayUpdateGroup;
  v11 = [(_TUIDynamicArrayUpdateGroup *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_generation, a3);
    v12->_count = a4;
    v12->_oldCount = a4;
    objc_storeStrong((id *)&v12->_transaction, a5);
    [(_TUITransaction *)v12->_transaction addCompletionDeferral];
  }

  return v12;
}

- (void)dealloc
{
  [(_TUITransaction *)self->_transaction removeCompletionDeferral];
  v3.receiver = self;
  v3.super_class = (Class)_TUIDynamicArrayUpdateGroup;
  [(_TUIDynamicArrayUpdateGroup *)&v3 dealloc];
}

- (NSArray)updates
{
  return (NSArray *)self->_updates;
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  id v8 = (id)objc_opt_new();
  [v8 setNewIndex:a3];
  [v8 setOldIndex:0x7FFFFFFFFFFFFFFFLL];
  [v8 setKind:0];
  ++self->_count;
  inserts = self->_inserts;
  if (!inserts)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_inserts;
    self->_inserts = v6;

    inserts = self->_inserts;
  }
  [(NSMutableArray *)inserts addObject:v8];
}

- (void)deleteItemAtIndex:(unint64_t)a3
{
  id v8 = (id)objc_opt_new();
  [v8 setNewIndex:0x7FFFFFFFFFFFFFFFLL];
  [v8 setOldIndex:a3];
  [v8 setKind:1];
  --self->_count;
  deletes = self->_deletes;
  if (!deletes)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_deletes;
    self->_deletes = v6;

    deletes = self->_deletes;
  }
  [(NSMutableArray *)deletes addObject:v8];
}

- (void)updateItemAtIndex:(unint64_t)a3
{
  id v8 = (id)objc_opt_new();
  [v8 setOldIndex:a3];
  [v8 setNewIndex:0x7FFFFFFFFFFFFFFFLL];
  [v8 setKind:2];
  updatesOrMoves = self->_updatesOrMoves;
  if (!updatesOrMoves)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_updatesOrMoves;
    self->_updatesOrMoves = v6;

    updatesOrMoves = self->_updatesOrMoves;
  }
  [(NSMutableArray *)updatesOrMoves addObject:v8];
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v10 = (id)objc_opt_new();
  [v10 setNewIndex:a4];
  [v10 setOldIndex:a3];
  [v10 setKind:3];
  updatesOrMoves = self->_updatesOrMoves;
  if (!updatesOrMoves)
  {
    id v8 = (NSMutableArray *)objc_opt_new();
    id v9 = self->_updatesOrMoves;
    self->_updatesOrMoves = v8;

    updatesOrMoves = self->_updatesOrMoves;
  }
  [(NSMutableArray *)updatesOrMoves addObject:v10];
}

- (void)finalizeUpdates
{
  [(_TUIDynamicArrayUpdateGroup *)self _validateInserts];
  objc_super v3 = (NSMutableArray *)objc_opt_new();
  updates = self->_updates;
  self->_updates = v3;

  [(NSMutableArray *)self->_updates addObjectsFromArray:self->_deletes];
  [(NSMutableArray *)self->_updates addObjectsFromArray:self->_inserts];
  v5 = self->_updates;
  updatesOrMoves = self->_updatesOrMoves;

  [(NSMutableArray *)v5 addObjectsFromArray:updatesOrMoves];
}

- (void)_validateInserts
{
}

- (id)trimWithStart:(int64_t)a3 end:(int64_t)a4
{
  v7 = [[TUIIndexMapper alloc] initWithCount:self->_oldCount];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = self->_updates;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        switch((unint64_t)[v13 kind])
        {
          case 0uLL:
            -[TUIIndexMapper insertAtIndex:](v7, "insertAtIndex:", [v13 newIndex]);
            break;
          case 1uLL:
            -[TUIIndexMapper deleteAtIndex:](v7, "deleteAtIndex:", [v13 oldIndex]);
            break;
          case 2uLL:
            -[TUIIndexMapper updateAtIndex:](v7, "updateAtIndex:", [v13 oldIndex]);
            break;
          case 3uLL:
            -[TUIIndexMapper moveFromIndex:[v13 oldIndex] toIndex:[v13 newIndex]];
            break;
          default:
            continue;
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [(TUIIndexMapper *)v7 trimWithStart:a3 end:a4];
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithGeneration:self->_generation count:[v7 oldCount] transaction:self->_transaction];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_DCCFC;
  v17[3] = &unk_255260;
  id v15 = v14;
  id v18 = v15;
  [(TUIIndexMapper *)v7 computeUpdatesWithBlock:v17];
  [v15 finalizeUpdates];

  return v15;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)generation
{
  return self->_generation;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_generation, 0);
  objc_storeStrong((id *)&self->_updatesOrMoves, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_deletes, 0);

  objc_storeStrong((id *)&self->_updates, 0);
}

@end