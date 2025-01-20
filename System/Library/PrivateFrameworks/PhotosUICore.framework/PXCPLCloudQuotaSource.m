@interface PXCPLCloudQuotaSource
- (NSString)customActionTitle;
- (NSString)customMessage;
- (NSString)customTitle;
- (PXCPLCloudQuotaSource)init;
- (int64_t)state;
- (void)_handleInAppMessage:(id)a3;
- (void)currentInAppMessageDidChange:(id)a3;
- (void)setCustomActionTitle:(id)a3;
- (void)setCustomMessage:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PXCPLCloudQuotaSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActionTitle, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
}

- (NSString)customActionTitle
{
  return self->_customActionTitle;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (int64_t)state
{
  return self->_state;
}

- (void)currentInAppMessageDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v6 = (void *)getICQInAppMessageKeySymbolLoc_ptr;
  uint64_t v14 = getICQInAppMessageKeySymbolLoc_ptr;
  if (!getICQInAppMessageKeySymbolLoc_ptr)
  {
    v7 = iCloudQuotaUILibrary_137491();
    v12[3] = (uint64_t)dlsym(v7, "ICQInAppMessageKey");
    getICQInAppMessageKeySymbolLoc_ptr = v12[3];
    v6 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    v8 = [v5 objectForKeyedSubscript:*v6];

    [(PXCPLCloudQuotaSource *)self _handleInAppMessage:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"NSString *getICQInAppMessageKey(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXCPLCloudQuotaSource.m", 26, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_handleInAppMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 reason];
  if (!v5)
  {
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v6 = (void *)getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
  uint64_t v39 = getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
  if (!getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_block_invoke;
    v34 = &unk_1E5DD2B08;
    v35 = &v36;
    v7 = iCloudQuotaUILibrary_137491();
    v37[3] = (uint64_t)dlsym(v7, "ICQUIInAppMessageReasoniCloudAlmostFull");
    getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr = *(void *)(v35[1] + 24);
    v6 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v6)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString *getICQUIInAppMessageReasoniCloudAlmostFull(void)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXCPLCloudQuotaSource.m", 28, @"%s", dlerror());
LABEL_26:

    __break(1u);
    return;
  }
  if ([v5 isEqualToString:*v6])
  {
    uint64_t v8 = 1;
    goto LABEL_14;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v9 = (void *)getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
  uint64_t v39 = getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
  if (!getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getICQUIInAppMessageReasoniCloudFullSymbolLoc_block_invoke;
    v34 = &unk_1E5DD2B08;
    v35 = &v36;
    v10 = iCloudQuotaUILibrary_137491();
    v37[3] = (uint64_t)dlsym(v10, "ICQUIInAppMessageReasoniCloudFull");
    getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr = *(void *)(v35[1] + 24);
    v9 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString *getICQUIInAppMessageReasoniCloudFull(void)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXCPLCloudQuotaSource.m", 30, @"%s", dlerror());
    goto LABEL_26;
  }
  if ([v5 isEqualToString:*v9]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
LABEL_14:

  uint64_t v11 = [v4 title];
  if ([v11 length]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = [v4 subTitle];
  if ([v13 length]) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  v15 = [v4 actions];
  v16 = [v15 firstObject];

  v17 = [v16 title];
  if ([v17 length]) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__PXCPLCloudQuotaSource__handleInAppMessage___block_invoke;
  v25[3] = &unk_1E5DBE420;
  v25[4] = self;
  id v26 = v12;
  id v27 = v14;
  id v28 = v18;
  id v29 = v5;
  uint64_t v30 = v8;
  id v19 = v5;
  id v20 = v18;
  id v21 = v14;
  id v22 = v12;
  [(PXCPLCloudQuotaSource *)self performChanges:v25];
}

void __45__PXCPLCloudQuotaSource__handleInAppMessage___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setCustomTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCustomMessage:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setCustomActionTitle:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 32) currentChanges])
  {
    if (*(void *)(a1 + 72))
    {
      v2 = PLUserStatusGetLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        unint64_t v4 = *(void *)(a1 + 72);
        if (v4 > 2) {
          id v5 = 0;
        }
        else {
          id v5 = off_1E5DCF380[v4];
        }
        uint64_t v13 = v5;
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        uint64_t v16 = *(void *)(a1 + 56);
        int v18 = 138544386;
        uint64_t v19 = v3;
        __int16 v20 = 2114;
        id v21 = v13;
        __int16 v22 = 2114;
        uint64_t v23 = v14;
        __int16 v24 = 2114;
        uint64_t v25 = v15;
        __int16 v26 = 2114;
        uint64_t v27 = v16;
        _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ HANDLE message with state: \"%{public}@\", custom title: \"%{public}@\", message: \"%{public}@\", action title: \"%{public}@\"", (uint8_t *)&v18, 0x34u);
      }
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)(a1 + 64);
    v2 = PLUserStatusGetLog();
    BOOL v7 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        v9 = *(__CFString **)(a1 + 64);
        int v18 = 138543618;
        uint64_t v19 = v8;
        __int16 v20 = 2114;
        id v21 = v9;
        v10 = "%{public}@ IGNORE message with reason: \"%{public}@\"";
        uint64_t v11 = v2;
        uint32_t v12 = 22;
LABEL_13:
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, v12);
      }
    }
    else if (v7)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543362;
      uint64_t v19 = v17;
      v10 = "%{public}@ CLEAR message";
      uint64_t v11 = v2;
      uint32_t v12 = 12;
      goto LABEL_13;
    }
LABEL_14:
  }
}

- (void)setCustomActionTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v4 = self->_customActionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      customActionTitle = self->_customActionTitle;
      self->_customActionTitle = v6;

      [(PXCPLCloudQuotaSource *)self signalChange:8];
    }
  }
}

- (void)setCustomMessage:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v4 = self->_customMessage;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      customMessage = self->_customMessage;
      self->_customMessage = v6;

      [(PXCPLCloudQuotaSource *)self signalChange:4];
    }
  }
}

- (void)setCustomTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v4 = self->_customTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      customTitle = self->_customTitle;
      self->_customTitle = v6;

      [(PXCPLCloudQuotaSource *)self signalChange:2];
    }
  }
}

- (void)setState:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXCPLCloudQuotaSource *)self signalChange:1];
  }
}

- (PXCPLCloudQuotaSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXCPLCloudQuotaSource;
  v2 = [(PXCPLCloudQuotaSource *)&v13 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  unint64_t v4 = (void *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  uint64_t v22 = getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  if (!getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getICQCurrentInAppMessageChangedNotificationSymbolLoc_block_invoke;
    uint64_t v17 = &unk_1E5DD2B08;
    int v18 = &v19;
    BOOL v5 = iCloudQuotaUILibrary_137491();
    uint64_t v6 = dlsym(v5, "ICQCurrentInAppMessageChangedNotification");
    *(void *)(v18[1] + 24) = v6;
    getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = *(void *)(v18[1] + 24);
    unint64_t v4 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v4)
  {
    [v3 addObserver:v2 selector:sel_currentInAppMessageDidChange_ name:*v4 object:0];

    uint64_t v19 = 0;
    __int16 v20 = &v19;
    uint64_t v21 = 0x2050000000;
    BOOL v7 = (void *)getICQInAppMessagingClass_softClass;
    uint64_t v22 = getICQInAppMessagingClass_softClass;
    if (!getICQInAppMessagingClass_softClass)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __getICQInAppMessagingClass_block_invoke;
      uint64_t v17 = &unk_1E5DD2B08;
      int v18 = &v19;
      __getICQInAppMessagingClass_block_invoke((uint64_t)&v14);
      BOOL v7 = (void *)v20[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v19, 8);
    v9 = [v8 shared];
    [v9 observeUpdates];

    return v2;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  uint32_t v12 = [NSString stringWithUTF8String:"NSString *getICQCurrentInAppMessageChangedNotification(void)"];
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCPLCloudQuotaSource.m", 24, @"%s", dlerror());

  __break(1u);
  return result;
}

@end