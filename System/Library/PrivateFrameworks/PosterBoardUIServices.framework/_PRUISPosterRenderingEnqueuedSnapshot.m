@interface _PRUISPosterRenderingEnqueuedSnapshot
- (PRUISPosterSnapshotRequest)snapshotRequest;
- (_PRUISPosterRenderingEnqueuedSnapshot)initWithSnapshotRequest:(id)a3 completionBlock:(id)a4;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setSnapshotRequest:(id)a3;
@end

@implementation _PRUISPosterRenderingEnqueuedSnapshot

- (_PRUISPosterRenderingEnqueuedSnapshot)initWithSnapshotRequest:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PRUISPosterRenderingEnqueuedSnapshot;
  v9 = [(_PRUISPosterRenderingEnqueuedSnapshot *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotRequest, a3);
    uint64_t v11 = [v8 copy];
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = (id)v11;
  }
  return v10;
}

- (PRUISPosterSnapshotRequest)snapshotRequest
{
  return self->_snapshotRequest;
}

- (void)setSnapshotRequest:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_snapshotRequest, 0);
}

@end