@interface MapsUIDiffableDataSourceSectionSnapshotUpdateDifference
- (BOOL)hasChanges;
- (MapsUIDiffableDataSourceSectionSnapshotUpdateDifference)initWithReloadedItems:(id)a3 insertedItems:(id)a4 deletedItems:(id)a5 movedItems:(id)a6 expandedItems:(id)a7 collapsedItems:(id)a8;
- (NSArray)collapsedItems;
- (NSArray)deletedItems;
- (NSArray)expandedItems;
- (NSArray)insertedItems;
- (NSArray)movedItems;
- (NSArray)reloadedItems;
@end

@implementation MapsUIDiffableDataSourceSectionSnapshotUpdateDifference

- (MapsUIDiffableDataSourceSectionSnapshotUpdateDifference)initWithReloadedItems:(id)a3 insertedItems:(id)a4 deletedItems:(id)a5 movedItems:(id)a6 expandedItems:(id)a7 collapsedItems:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)MapsUIDiffableDataSourceSectionSnapshotUpdateDifference;
  v20 = [(MapsUIDiffableDataSourceSectionSnapshotUpdateDifference *)&v34 init];
  if (v20)
  {
    v21 = (NSArray *)[v14 copy];
    reloadedItems = v20->_reloadedItems;
    v20->_reloadedItems = v21;

    v23 = (NSArray *)[v15 copy];
    insertedItems = v20->_insertedItems;
    v20->_insertedItems = v23;

    v25 = (NSArray *)[v16 copy];
    deletedItems = v20->_deletedItems;
    v20->_deletedItems = v25;

    v27 = (NSArray *)[v17 copy];
    movedItems = v20->_movedItems;
    v20->_movedItems = v27;

    v29 = (NSArray *)[v18 copy];
    expandedItems = v20->_expandedItems;
    v20->_expandedItems = v29;

    v31 = (NSArray *)[v19 copy];
    collapsedItems = v20->_collapsedItems;
    v20->_collapsedItems = v31;
  }
  return v20;
}

- (BOOL)hasChanges
{
  return [(NSArray *)self->_reloadedItems count]
      || [(NSArray *)self->_insertedItems count]
      || [(NSArray *)self->_deletedItems count]
      || [(NSArray *)self->_movedItems count]
      || [(NSArray *)self->_expandedItems count]
      || [(NSArray *)self->_collapsedItems count] != 0;
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

- (NSArray)movedItems
{
  return self->_movedItems;
}

- (NSArray)expandedItems
{
  return self->_expandedItems;
}

- (NSArray)collapsedItems
{
  return self->_collapsedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedItems, 0);
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_movedItems, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_insertedItems, 0);

  objc_storeStrong((id *)&self->_reloadedItems, 0);
}

@end