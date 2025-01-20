@interface UICollectionViewDiffableDataSourceSectionSnapshotHandlers
- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)initWithShouldExpandItemHandler:(id)a3 willExpandItemHandler:(id)a4 shouldCollapseItemHandler:(id)a5 willCollapseItemHandler:(id)a6 snapshotForExpandingParentItemHandler:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setShouldCollapseItemHandler:(void *)shouldCollapseItemHandler;
- (void)setShouldExpandItemHandler:(void *)shouldExpandItemHandler;
- (void)setSnapshotForExpandingParentItemHandler:(void *)snapshotForExpandingParentItemHandler;
- (void)setWillCollapseItemHandler:(void *)willCollapseItemHandler;
- (void)setWillExpandItemHandler:(void *)willExpandItemHandler;
- (void)shouldCollapseItemHandler;
- (void)shouldExpandItemHandler;
- (void)snapshotForExpandingParentItemHandler;
- (void)willCollapseItemHandler;
- (void)willExpandItemHandler;
@end

@implementation UICollectionViewDiffableDataSourceSectionSnapshotHandlers

- (void)setWillExpandItemHandler:(void *)willExpandItemHandler
{
}

- (void)setWillCollapseItemHandler:(void *)willCollapseItemHandler
{
}

- (void)setShouldExpandItemHandler:(void *)shouldExpandItemHandler
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v16 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)self shouldExpandItemHandler];
  v5 = (void *)[v16 copy];
  v6 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)self willExpandItemHandler];
  v7 = (void *)[v6 copy];
  v8 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)self shouldCollapseItemHandler];
  v9 = (void *)[v8 copy];
  v10 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)self willCollapseItemHandler];
  v11 = (void *)[v10 copy];
  v12 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)self snapshotForExpandingParentItemHandler];
  v13 = (void *)[v12 copy];
  v14 = (void *)[v4 initWithShouldExpandItemHandler:v5 willExpandItemHandler:v7 shouldCollapseItemHandler:v9 willCollapseItemHandler:v11 snapshotForExpandingParentItemHandler:v13];

  return v14;
}

- (void)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (void)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (void)snapshotForExpandingParentItemHandler
{
  return self->_snapshotForExpandingParentItemHandler;
}

- (void)shouldExpandItemHandler
{
  return self->_shouldExpandItemHandler;
}

- (void)shouldCollapseItemHandler
{
  return self->_shouldCollapseItemHandler;
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)initWithShouldExpandItemHandler:(id)a3 willExpandItemHandler:(id)a4 shouldCollapseItemHandler:(id)a5 willCollapseItemHandler:(id)a6 snapshotForExpandingParentItemHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers;
  v17 = [(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)&v29 init];
  if (v17)
  {
    v18 = _Block_copy(v12);
    id shouldExpandItemHandler = v17->_shouldExpandItemHandler;
    v17->_id shouldExpandItemHandler = v18;

    v20 = _Block_copy(v13);
    id willExpandItemHandler = v17->_willExpandItemHandler;
    v17->_id willExpandItemHandler = v20;

    v22 = _Block_copy(v14);
    id shouldCollapseItemHandler = v17->_shouldCollapseItemHandler;
    v17->_id shouldCollapseItemHandler = v22;

    v24 = _Block_copy(v15);
    id willCollapseItemHandler = v17->_willCollapseItemHandler;
    v17->_id willCollapseItemHandler = v24;

    v26 = _Block_copy(v16);
    id snapshotForExpandingParentItemHandler = v17->_snapshotForExpandingParentItemHandler;
    v17->_id snapshotForExpandingParentItemHandler = v26;
  }
  return v17;
}

- (void)setShouldCollapseItemHandler:(void *)shouldCollapseItemHandler
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotForExpandingParentItemHandler, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_shouldCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong(&self->_shouldExpandItemHandler, 0);
}

- (void)setSnapshotForExpandingParentItemHandler:(void *)snapshotForExpandingParentItemHandler
{
}

@end