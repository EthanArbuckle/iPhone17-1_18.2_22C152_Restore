@interface TabSnapshotQueueItem
- (BOOL)snappshottingIsInProgress;
- (NSArray)completionHandlers;
- (TabSnapshotContentProvider)contentProvider;
- (TabSnapshotQueueItem)initWithRequest:(id)a3 contentProvider:(id)a4 completionHandler:(id)a5;
- (TabSnapshotRequest)request;
- (void)appendCompletionHandler:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setSnappshottingIsInProgress:(BOOL)a3;
@end

@implementation TabSnapshotQueueItem

- (TabSnapshotQueueItem)initWithRequest:(id)a3 contentProvider:(id)a4 completionHandler:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TabSnapshotQueueItem;
  v12 = [(TabSnapshotQueueItem *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_contentProvider, a4);
    v14 = (void *)MEMORY[0x1E4E42950](v11);
    v20[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    completionHandlers = v13->_completionHandlers;
    v13->_completionHandlers = (NSArray *)v15;

    v17 = v13;
  }

  return v13;
}

- (void)appendCompletionHandler:(id)a3
{
  completionHandlers = self->_completionHandlers;
  id v7 = (id)MEMORY[0x1E4E42950](a3, a2);
  v5 = [(NSArray *)completionHandlers arrayByAddingObject:v7];
  v6 = self->_completionHandlers;
  self->_completionHandlers = v5;
}

- (TabSnapshotRequest)request
{
  return self->_request;
}

- (NSArray)completionHandlers
{
  return self->_completionHandlers;
}

- (TabSnapshotContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (BOOL)snappshottingIsInProgress
{
  return self->_snappshottingIsInProgress;
}

- (void)setSnappshottingIsInProgress:(BOOL)a3
{
  self->_snappshottingIsInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end