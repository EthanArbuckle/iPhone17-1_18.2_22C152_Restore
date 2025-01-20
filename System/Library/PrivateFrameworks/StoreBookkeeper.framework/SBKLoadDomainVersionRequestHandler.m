@interface SBKLoadDomainVersionRequestHandler
+ (int64_t)conflictDetectionType;
- (BOOL)loadsRemoteItemCount;
- (SBKSyncTransaction)transaction;
- (unint64_t)itemCount;
- (unint64_t)responseItemCount;
- (void)runWithCompletionHandler:(id)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setLoadsRemoteItemCount:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SBKLoadDomainVersionRequestHandler

+ (int64_t)conflictDetectionType
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)setTransaction:(id)a3
{
}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (unint64_t)responseItemCount
{
  return self->_responseItemCount;
}

- (void)setLoadsRemoteItemCount:(BOOL)a3
{
  self->_loadsRemoteItemCount = a3;
}

- (BOOL)loadsRemoteItemCount
{
  return self->_loadsRemoteItemCount;
}

- (void)runWithCompletionHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  BOOL v5 = [(SBKLoadDomainVersionRequestHandler *)self loadsRemoteItemCount];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke;
  v8[3] = &unk_2648AF880;
  if (v5) {
    v6 = @"0";
  }
  else {
    v6 = @"9223372036854775807";
  }
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SBKSyncRequestHandler *)self startTransactionWithSyncAnchor:v6 keysToUpdate:0 keysToDelete:0 finishedBlock:v8];
}

uint64_t __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [*(id *)(a1 + 32) responseUpdatedKeys];
  *(void *)(*(void *)(a1 + 32) + 88) = [v6 count];

  if ([*(id *)(a1 + 32) loadsRemoteItemCount])
  {
    id v7 = NSString;
    v8 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 88)];
    [v7 stringWithFormat:@", itemCount = %@", v8];
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = &stru_26DF10968;
  }
  v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [*(id *)(a1 + 32) responseDomainVersion];
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_22B807000, v10, OS_LOG_TYPE_DEFAULT, "finished loading domain version: domainVersion = %@%@", buf, 0x16u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke_5;
  block[3] = &unk_2648AF858;
  id v12 = *(id *)(a1 + 40);
  id v16 = v5;
  id v17 = v12;
  id v13 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  return 1;
}

uint64_t __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end