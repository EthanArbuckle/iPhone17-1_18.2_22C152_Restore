@interface SBIconViewSnapshotProvider
- (SBIconViewSnapshotProvider)initWithSnapshotView:(id)a3 invalidation:(id)a4;
- (UIView)snapshotView;
- (void)invalidate;
@end

@implementation SBIconViewSnapshotProvider

- (SBIconViewSnapshotProvider)initWithSnapshotView:(id)a3 invalidation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconViewSnapshotProvider;
  v9 = [(SBIconViewSnapshotProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotView, a3);
    uint64_t v11 = [v8 copy];
    id invalidationBlock = v10->_invalidationBlock;
    v10->_id invalidationBlock = (id)v11;
  }
  return v10;
}

- (void)invalidate
{
  id invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v5 = (void (**)(id, SBIconViewSnapshotProvider *))MEMORY[0x1D948C7A0](invalidationBlock, a2);
    id v4 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;

    v5[2](v5, self);
  }
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end