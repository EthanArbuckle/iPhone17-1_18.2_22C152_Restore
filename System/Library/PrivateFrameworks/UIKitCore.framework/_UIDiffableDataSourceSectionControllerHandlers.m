@interface _UIDiffableDataSourceSectionControllerHandlers
- (id)childSnapshotForExpandingParentHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shouldCollapseItemHandler;
- (id)shouldExpandItemHandler;
- (id)willCollapseItemHandler;
- (id)willExpandItemHandler;
- (void)setChildSnapshotForExpandingParentHandler:(id)a3;
- (void)setShouldCollapseItemHandler:(id)a3;
- (void)setShouldExpandItemHandler:(id)a3;
- (void)setWillCollapseItemHandler:(id)a3;
- (void)setWillExpandItemHandler:(id)a3;
@end

@implementation _UIDiffableDataSourceSectionControllerHandlers

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(_UIDiffableDataSourceSectionControllerHandlers *)self shouldExpandItemHandler];
  v6 = (void *)[v5 copy];
  [v4 setShouldExpandItemHandler:v6];

  v7 = [(_UIDiffableDataSourceSectionControllerHandlers *)self willExpandItemHandler];
  v8 = (void *)[v7 copy];
  [v4 setWillExpandItemHandler:v8];

  v9 = [(_UIDiffableDataSourceSectionControllerHandlers *)self shouldCollapseItemHandler];
  v10 = (void *)[v9 copy];
  [v4 setShouldCollapseItemHandler:v10];

  v11 = [(_UIDiffableDataSourceSectionControllerHandlers *)self willCollapseItemHandler];
  v12 = (void *)[v11 copy];
  [v4 setWillCollapseItemHandler:v12];

  v13 = [(_UIDiffableDataSourceSectionControllerHandlers *)self childSnapshotForExpandingParentHandler];
  v14 = (void *)[v13 copy];
  [v4 setChildSnapshotForExpandingParentHandler:v14];

  return v4;
}

- (id)shouldExpandItemHandler
{
  return self->_shouldExpandItemHandler;
}

- (void)setShouldExpandItemHandler:(id)a3
{
}

- (id)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (void)setWillExpandItemHandler:(id)a3
{
}

- (id)shouldCollapseItemHandler
{
  return self->_shouldCollapseItemHandler;
}

- (void)setShouldCollapseItemHandler:(id)a3
{
}

- (id)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (void)setWillCollapseItemHandler:(id)a3
{
}

- (id)childSnapshotForExpandingParentHandler
{
  return self->_childSnapshotForExpandingParentHandler;
}

- (void)setChildSnapshotForExpandingParentHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childSnapshotForExpandingParentHandler, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_shouldCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong(&self->_shouldExpandItemHandler, 0);
}

@end