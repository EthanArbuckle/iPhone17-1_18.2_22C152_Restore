@interface BRCDownloadContentsBatchOperation
- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perDownloadCompletionBlock;
- (id)transferredObjectsPrettyName;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerDownloadCompletionBlock:(id)a3;
@end

@implementation BRCDownloadContentsBatchOperation

- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  return [(BRCTransferBatchOperation *)&v5 initWithName:@"dl-content" syncContext:a3 sessionContext:a4];
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "dl-content", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCDownloadContentsBatchOperation *)self perDownloadCompletionBlock];
  if (v8)
  {
    id v9 = v6;
    v10 = [(BRCSyncContext *)self->super.super._syncContext session];
    v11 = [v10 clientDB];
    v12 = [v11 serialQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    v14[3] = &unk_26507EEB0;
    id v15 = v7;
    id v16 = v9;
    v17 = self;
    id v18 = v8;
    id v13 = v9;
    dispatch_sync(v12, v14);
  }
}

void __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    os_activity_t v2 = *(void **)(a1 + 40);
    v3 = [*(id *)(*(void *)(a1 + 48) + 256) downloadStager];
    [v2 _stageWithDownloadStager:v3 error:&v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)mainWithTransfers:(id)a3
{
  id v7 = [a3 allObjects];
  id v4 = [v7 objectEnumerator];
  objc_super v5 = [(BRCTransferBatchOperation *)self fetchOperationForTransfers:v4 traceCode:18];

  id v6 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:4];
  [v5 setDesiredKeys:v6];

  [(_BRCOperation *)self addSubOperation:v5];
}

- (id)transferredObjectsPrettyName
{
  return @"documents";
}

- (id)actionPrettyName
{
  return @"downloading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  [(BRCTransferBatchOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCDownloadContentsBatchOperation *)self setPerDownloadCompletionBlock:0];
}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 576, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end