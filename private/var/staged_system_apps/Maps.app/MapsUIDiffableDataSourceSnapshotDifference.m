@interface MapsUIDiffableDataSourceSnapshotDifference
- (BOOL)hasChanges;
- (MapsUIDiffableDataSourceSnapshotDifference)initWithReloadedItems:(id)a3 insertedItems:(id)a4 deletedItems:(id)a5;
- (NSArray)deletedItems;
- (NSArray)insertedItems;
- (NSArray)reloadedItems;
- (id)differenceUnionWithDifference:(id)a3;
@end

@implementation MapsUIDiffableDataSourceSnapshotDifference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_insertedItems, 0);

  objc_storeStrong((id *)&self->_reloadedItems, 0);
}

- (MapsUIDiffableDataSourceSnapshotDifference)initWithReloadedItems:(id)a3 insertedItems:(id)a4 deletedItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MapsUIDiffableDataSourceSnapshotDifference;
  v11 = [(MapsUIDiffableDataSourceSnapshotDifference *)&v19 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    reloadedItems = v11->_reloadedItems;
    v11->_reloadedItems = v12;

    v14 = (NSArray *)[v9 copy];
    insertedItems = v11->_insertedItems;
    v11->_insertedItems = v14;

    v16 = (NSArray *)[v10 copy];
    deletedItems = v11->_deletedItems;
    v11->_deletedItems = v16;
  }
  return v11;
}

- (id)differenceUnionWithDifference:(id)a3
{
  reloadedItems = self->_reloadedItems;
  id v5 = a3;
  v6 = +[NSMutableArray arrayWithArray:reloadedItems];
  v7 = [v5 reloadedItems];
  [v6 addObjectsFromArray:v7];

  id v8 = +[NSMutableArray arrayWithArray:self->_insertedItems];
  id v9 = [v5 insertedItems];
  [v8 addObjectsFromArray:v9];

  id v10 = +[NSMutableArray arrayWithArray:self->_deletedItems];
  v11 = [v5 deletedItems];

  [v10 addObjectsFromArray:v11];
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithReloadedItems:v6 insertedItems:v8 deletedItems:v10];

  return v12;
}

- (BOOL)hasChanges
{
  return [(NSArray *)self->_reloadedItems count]
      || [(NSArray *)self->_insertedItems count]
      || [(NSArray *)self->_deletedItems count] != 0;
}

- (NSArray)reloadedItems
{
  return self->_reloadedItems;
}

- (NSArray)insertedItems
{
  return self->_insertedItems;
}

- (NSArray)deletedItems
{
  return self->_deletedItems;
}

@end