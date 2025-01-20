@interface PLClientChangePublisher
- (PLClientChangePublisher)initWithAssetsdClient:(id)a3;
- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5;
- (void)pauseLaunchEventNotifications;
- (void)unpauseLaunchEventNotifications;
@end

@implementation PLClientChangePublisher

- (PLClientChangePublisher)initWithAssetsdClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLClientChangePublisher;
  v6 = [(PLClientChangePublisher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetsdClient, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)unpauseLaunchEventNotifications
{
  v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_FAULT, "Trying to unpause launch event notifications from the client", v3, 2u);
  }
}

- (void)pauseLaunchEventNotifications
{
  v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_FAULT, "Trying to pause launch event notifications from the client", v3, 2u);
  }
}

- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (objc_class *)MEMORY[0x1E4F8BA20];
  id v11 = a3;
  v12 = (void *)[[v10 alloc] initWithXPCObject:v11];

  v13 = [(PLAssetsdClient *)self->_assetsdClient libraryClient];
  if (!v13)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      assetsdClient = self->_assetsdClient;
      *(_DWORD *)buf = 138412290;
      v21 = assetsdClient;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Assetsd client %@ has nil library client, unable to publish remote change event", buf, 0xCu);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__PLClientChangePublisher_publishChangeEvent_delayedSaveActionsDetail_transaction___block_invoke;
  v18[3] = &unk_1E5873440;
  id v16 = v9;
  id v19 = v16;
  [v13 publishRemoteChangeEvent:v12 delayedSaveActionsDetail:v8 completionHandler:v18];

  return v16;
}

void __83__PLClientChangePublisher_publishChangeEvent_delayedSaveActionsDetail_transaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Unable to publish remote change event: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  [*(id *)(a1 + 32) completeTransaction];
}

@end