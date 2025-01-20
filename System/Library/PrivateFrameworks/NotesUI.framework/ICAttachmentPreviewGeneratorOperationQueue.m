@interface ICAttachmentPreviewGeneratorOperationQueue
- (unint64_t)suspendCount;
- (void)cancelOperationsForAttachment:(id)a3;
- (void)resume;
- (void)setSuspendCount:(unint64_t)a3;
- (void)suspend;
@end

@implementation ICAttachmentPreviewGeneratorOperationQueue

- (void)cancelOperationsForAttachment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(ICAttachmentPreviewGeneratorOperationQueue *)self operations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 attachmentID];
        v12 = [v4 objectID];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          [v10 cancel];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)suspend
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t suspendCount = obj->_suspendCount;
  if (!suspendCount)
  {
    [(ICAttachmentPreviewGeneratorOperationQueue *)obj setSuspended:1];
    unint64_t suspendCount = obj->_suspendCount;
  }
  obj->_unint64_t suspendCount = suspendCount + 1;
  objc_sync_exit(obj);
}

- (void)resume
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t suspendCount = obj->_suspendCount;
  if (suspendCount)
  {
    unint64_t v3 = suspendCount - 1;
    obj->_unint64_t suspendCount = v3;
    if (!v3) {
      [(ICAttachmentPreviewGeneratorOperationQueue *)obj setSuspended:0];
    }
  }
  objc_sync_exit(obj);
}

- (unint64_t)suspendCount
{
  return self->_suspendCount;
}

- (void)setSuspendCount:(unint64_t)a3
{
  self->_unint64_t suspendCount = a3;
}

@end