@interface WBSTabDialogManager
- (WBSTabDialogManager)init;
- (id)_dialogBlockingSlot:(id)a3;
- (id)_dialogBlockingWebProcessID:(int)a3;
- (id)_queueForTabID:(unint64_t)a3 createIfNeeded:(BOOL)a4;
- (id)_setForWebProcessID:(int)a3 createIfNeeded:(BOOL)a4;
- (id)description;
- (int64_t)_enqueueDialog:(id)a3;
- (void)_cancelDialogsInQueue:(id)a3 tabID:(unint64_t)a4 context:(id)a5;
- (void)_dismissDialog:(id)a3 withResponse:(id)a4;
- (void)cancelAllDialogsBlockingSlot:(id)a3;
- (void)cancelAllDialogsBlockingWebProcessID:(int)a3;
- (void)cancelAllDialogsForTabID:(unint64_t)a3;
- (void)cancelAllDialogsForTabID:(unint64_t)a3 context:(id)a4;
- (void)cancelAllDialogsForTabID:(unint64_t)a3 reason:(id)a4;
- (void)cancelAllDialogsWithContext:(id)a3;
- (void)dismissCurrentDialogForTabID:(unint64_t)a3 withResponse:(id)a4;
- (void)enqueueOrPresentDialog:(id)a3 inSlot:(id)a4;
- (void)enqueueOrPresentDialogInSlot:(id)a3 presentationBlock:(id)a4 dismissalBlock:(id)a5 blocksWebProcessUntilDismissed:(BOOL)a6;
- (void)presentNextDialogForSlot:(id)a3;
@end

@implementation WBSTabDialogManager

- (void)presentNextDialogForSlot:(id)a3
{
  unint64_t var1 = a3.var1;
  [(WBSTabDialogManager *)self cancelAllDialogsBlockingSlot:*(void *)&a3.var0];
  id v6 = [(WBSTabDialogManager *)self _queueForTabID:var1 createIfNeeded:0];
  v5 = [v6 firstObject];
  [v5 presentIfNeeded];
}

- (void)cancelAllDialogsBlockingSlot:(id)a3
{
  v4 = -[WBSTabDialogManager _dialogBlockingSlot:](self, "_dialogBlockingSlot:", *(void *)&a3.var0, a3.var1);
  if (v4)
  {
    v5 = v4;
    [(WBSTabDialogManager *)self _dismissDialog:v4 withResponse:0];
    v4 = v5;
  }
}

- (id)_queueForTabID:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
  v9 = [(NSMutableDictionary *)tabIDToDialogQueueMapping objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v11 = self->_tabIDToDialogQueueMapping;
    v12 = [NSNumber numberWithUnsignedLong:a3];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (id)_dialogBlockingSlot:(id)a3
{
  unint64_t var1 = a3.var1;
  BOOL v4 = [(WBSTabDialogManager *)self _dialogBlockingWebProcessID:*(void *)&a3.var0];
  [v4 slot];
  if (v5 == var1) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (id)_dialogBlockingWebProcessID:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(WBSTabDialogManager *)self _setForWebProcessID:*(void *)&a3 createIfNeeded:0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isBlockingWebProcess", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_setForWebProcessID:(int)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
  v8 = objc_msgSend(NSNumber, "numberWithInt:");
  long long v9 = [(NSMutableDictionary *)webProcessIDToDialogSetMapping objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    long long v9 = [MEMORY[0x1E4F1CA80] set];
    long long v11 = self->_webProcessIDToDialogSetMapping;
    long long v12 = [NSNumber numberWithInt:v5];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (WBSTabDialogManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSTabDialogManager;
  v2 = [(WBSTabDialogManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    webProcessIDToDialogSetMapping = v2->_webProcessIDToDialogSetMapping;
    v2->_webProcessIDToDialogSetMapping = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    tabIDToDialogQueueMapping = v2->_tabIDToDialogQueueMapping;
    v2->_tabIDToDialogQueueMapping = (NSMutableDictionary *)v5;

    v2->_queueCapacity = 10;
    id v7 = v2;
  }

  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_queueCapacity];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; queueCapacity = %@, webProcessIDToDialogSetMapping = %@, tabIDToQueueMapping = %@>",
    v4,
    self,
    v5,
    self->_webProcessIDToDialogSetMapping,
  id v6 = self->_tabIDToDialogQueueMapping);

  return v6;
}

- (void)enqueueOrPresentDialog:(id)a3 inSlot:(id)a4
{
  unint64_t var1 = a4.var1;
  uint64_t v5 = *(void *)&a4.var0;
  id v7 = [a3 createInfo];
  v8 = v7;
  if ((int)v5 >= 1 && var1)
  {
    objc_msgSend(v7, "setSlot:", v5, var1);
    int64_t v9 = [(WBSTabDialogManager *)self _enqueueDialog:v8];
    if (v9 == 1)
    {
      [v8 presentIfNeeded];
      goto LABEL_9;
    }
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v10 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:](v10, v5, var1);
    }
  }
  [v8 dismissWithResponse:0];
LABEL_9:
}

- (void)enqueueOrPresentDialogInSlot:(id)a3 presentationBlock:(id)a4 dismissalBlock:(id)a5 blocksWebProcessUntilDismissed:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t var1 = a3.var1;
  uint64_t v8 = *(void *)&a3.var0;
  id v10 = +[WBSTabDialog tabDialogWithPresentationBlock:a4 dismissalBlock:a5];
  [v10 setBlocksWebProcessUntilDismissed:v6];
  -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:](self, "enqueueOrPresentDialog:inSlot:", v10, v8, var1);
}

- (void)dismissCurrentDialogForTabID:(unint64_t)a3 withResponse:(id)a4
{
  id v8 = a4;
  BOOL v6 = [(WBSTabDialogManager *)self _queueForTabID:a3 createIfNeeded:0];
  id v7 = [v6 firstObject];

  if ([v7 isPresented]) {
    [(WBSTabDialogManager *)self _dismissDialog:v7 withResponse:v8];
  }
}

- (void)cancelAllDialogsBlockingWebProcessID:(int)a3
{
  uint64_t v4 = [(WBSTabDialogManager *)self _dialogBlockingWebProcessID:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [(WBSTabDialogManager *)self _dismissDialog:v4 withResponse:0];
    uint64_t v4 = v5;
  }
}

- (void)cancelAllDialogsForTabID:(unint64_t)a3
{
}

- (void)cancelAllDialogsForTabID:(unint64_t)a3 reason:(id)a4
{
  id v6 = +[WBSTabDialogCancellationContext cancellationContextWithReason:a4 userInfo:0];
  [(WBSTabDialogManager *)self cancelAllDialogsForTabID:a3 context:v6];
}

- (void)cancelAllDialogsForTabID:(unint64_t)a3 context:(id)a4
{
  id v7 = a4;
  id v6 = [(WBSTabDialogManager *)self _queueForTabID:a3 createIfNeeded:0];
  if (v6) {
    [(WBSTabDialogManager *)self _cancelDialogsInQueue:v6 tabID:a3 context:v7];
  }
}

- (void)_cancelDialogsInQueue:(id)a3 tabID:(unint64_t)a4 context:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v17 isExemptFromCancellationInContext:v9]) {
          v18 = v10;
        }
        else {
          v18 = v11;
        }
        [v18 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v14);
  }

  if ([v11 count])
  {
    if ([v10 count]) {
      v19 = v10;
    }
    else {
      v19 = 0;
    }
    tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
    v21 = [NSNumber numberWithUnsignedLong:a4];
    [(NSMutableDictionary *)tabIDToDialogQueueMapping setObject:v19 forKeyedSubscript:v21];

    v22 = [v11 objectAtIndexedSubscript:0];
    uint64_t v23 = [v22 slot];

    v24 = [(WBSTabDialogManager *)self _setForWebProcessID:v23 createIfNeeded:0];
    uint64_t v25 = [v24 count];
    if (v25 == [v11 count]) {
      goto LABEL_24;
    }
    v38 = self;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = v11;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v26);
          }
          [v24 removeObject:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v28);
    }

    self = v38;
    if (![v24 count])
    {
LABEL_24:
      webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
      v32 = [NSNumber numberWithInt:v23];
      [(NSMutableDictionary *)webProcessIDToDialogSetMapping removeObjectForKey:v32];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v33 = v11;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v40 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * k) dismissWithResponse:0];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v35);
    }
  }
}

- (void)cancelAllDialogsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_tabIDToDialogQueueMapping copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WBSTabDialogManager_cancelAllDialogsWithContext___block_invoke;
  v7[3] = &unk_1E5CA0330;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __51__WBSTabDialogManager_cancelAllDialogsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(v5, "_cancelDialogsInQueue:tabID:context:", v6, objc_msgSend(a2, "unsignedLongValue"), *(void *)(a1 + 40));
}

- (int64_t)_enqueueDialog:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 slot];
  id v7 = [(WBSTabDialogManager *)self _queueForTabID:v6 createIfNeeded:1];
  if ([v7 count] < self->_queueCapacity || objc_msgSend(v4, "isBlockingWebProcess"))
  {
    [v7 addObject:v4];
    id v8 = [(WBSTabDialogManager *)self _setForWebProcessID:v5 createIfNeeded:1];
    [v8 addObject:v4];
    if ([v7 count] == 1) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)_dismissDialog:(id)a3 withResponse:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [v16 slot];
  uint64_t v9 = v8;
  id v10 = [(WBSTabDialogManager *)self _setForWebProcessID:v7 createIfNeeded:0];
  [v10 removeObject:v16];
  if (![v10 count])
  {
    webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
    id v12 = [NSNumber numberWithInt:v7];
    [(NSMutableDictionary *)webProcessIDToDialogSetMapping removeObjectForKey:v12];
  }
  uint64_t v13 = [(WBSTabDialogManager *)self _queueForTabID:v9 createIfNeeded:0];
  [v13 removeObject:v16];
  if (![v13 count])
  {
    tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
    uint64_t v15 = [NSNumber numberWithUnsignedLong:v9];
    [(NSMutableDictionary *)tabIDToDialogQueueMapping removeObjectForKey:v15];
  }
  [v16 dismissWithResponse:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIDToDialogQueueMapping, 0);
  objc_storeStrong((id *)&self->_webProcessIDToDialogSetMapping, 0);
}

- (void)enqueueOrPresentDialog:(uint64_t)a3 inSlot:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a1;
  uint64_t v7 = [v5 stringWithFormat:@"{pid:%d, tab:0x%lx}", a2, a3];
  *(_DWORD *)buf = 138543362;
  uint64_t v9 = v7;
  _os_log_fault_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_FAULT, "Dialog enqueued in invalid slot: %{public}@", buf, 0xCu);
}

@end