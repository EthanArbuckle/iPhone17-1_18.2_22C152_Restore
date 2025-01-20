@interface SUPurchaseManager
- (BOOL)_issuePurchaseRequestForPurchases:(id)a3;
- (BOOL)_needsAuthenticationForPurchases:(id)a3;
- (BOOL)addPurchaseBatch:(id)a3;
- (BOOL)itemIdentifierIsPurchased:(unint64_t)a3;
- (BOOL)itemIdentifierIsPurchasing:(unint64_t)a3;
- (NSDictionary)tidHeaders;
- (NSNumber)accountDSID;
- (NSSet)futurePurchases;
- (NSSet)purchasedItemIdentifiers;
- (NSString)userAgent;
- (SUPurchaseManager)init;
- (SUPurchaseManagerDelegate)delegate;
- (SUQueueSessionManager)queueSessionManager;
- (id)_accountDSIDForPurchase:(id)a3;
- (id)_downloadManagerForDownloadKind:(id)a3;
- (id)_newDictionaryForWebScriptValue:(id)a3 inContext:(OpaqueJSContext *)a4;
- (id)_newExternalDownloadWithDictionary:(id)a3;
- (id)_newExternalDownloadWithDownloadDictionary:(id)a3;
- (id)_newExternalDownloadWithItemDictionary:(id)a3;
- (id)_newPurchaseBatchForPurchases:(id)a3;
- (id)copyPurchaseForScriptObject:(id)a3;
- (id)copyPurchaseForScriptObject:(id)a3 inContext:(OpaqueJSContext *)a4;
- (id)newPurchaseBatchForItems:(id)a3 offers:(id)a4;
- (int64_t)numberOfPendingPurchases;
- (void)_addBatchForPurchases:(id)a3 options:(id)a4;
- (void)_dialogDidFinish:(id)a3;
- (void)_enqueueContinuations:(id)a3;
- (void)_enqueueExternalDownload:(id)a3;
- (void)_enqueuePurchases:(id)a3;
- (void)_performNextAction;
- (void)_removePurchaseRequest:(id)a3;
- (void)_schedulePurchaseCallback:(id)a3 forPurchases:(id)a4;
- (void)_showDialogsForErrors:(id)a3;
- (void)_startContinuations:(id)a3;
- (void)_startPurchases:(id)a3;
- (void)addExternalDownloads:(id)a3 inContext:(OpaqueJSContext *)a4;
- (void)addExternalDownloads:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5;
- (void)addFuturePurchase:(id)a3;
- (void)addPurchasedItemIdentifier:(unint64_t)a3;
- (void)addPurchasedItemIdentifiers:(id)a3;
- (void)beginUpdates;
- (void)cancelFuturePurchase:(id)a3;
- (void)continuation:(id)a3 failedWithError:(id)a4;
- (void)continuationFinished:(id)a3;
- (void)dealloc;
- (void)endUpdates;
- (void)enqueueScriptPurchases:(id)a3;
- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5;
- (void)purchaseRequest:(id)a3 purchaseDidFail:(id)a4 withError:(id)a5;
- (void)purchaseRequest:(id)a3 purchaseDidSucceed:(id)a4;
- (void)purchaseRequest:(id)a3 purchaseDidSucceedWithResponse:(id)a4;
- (void)purchaseScriptObject:(id)a3;
- (void)purchaseScriptObject:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5;
- (void)removePurchasedItemIdentifier:(unint64_t)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)setAccountDSID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueueSessionManager:(id)a3;
- (void)setTidHeaders:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SUPurchaseManager

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v23 = 138412290;
    uint64_t v24 = objc_opt_class();
    LODWORD(v16) = 12;
    v15 = &v23;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v23, v16);
      free(v7);
      v15 = (int *)v8;
      SSFileLog();
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v15), "removeObserver:name:object:", self, @"SUDialogDidFinishNotification", 0);
  [(SSEventMonitor *)self->_eventMonitor setDelegate:0];

  observedDownloadManagers = self->_observedDownloadManagers;
  if (observedDownloadManagers)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [(NSMutableArray *)observedDownloadManagers countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(observedDownloadManagers);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v14 removeObserver:self];
          [(SUQueueSessionManager *)self->_queueSessionManager endDownloadManagerSessionForManager:v14];
        }
        uint64_t v11 = [(NSMutableArray *)observedDownloadManagers countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  [(NSMutableArray *)self->_purchaseRequests makeObjectsPerformSelector:sel_setDelegate_ withObject:0];

  v17.receiver = self;
  v17.super_class = (Class)SUPurchaseManager;
  [(SUPurchaseManager *)&v17 dealloc];
}

- (void)setQueueSessionManager:(id)a3
{
}

- (SUPurchaseManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUPurchaseManager;
  v2 = [(SUPurchaseManager *)&v5 init];
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__dialogDidFinish_, @"SUDialogDidFinishNotification", 0);
    v3 = (SSEventMonitor *)objc_alloc_init(MEMORY[0x263F7B198]);
    v2->_eventMonitor = v3;
    [(SSEventMonitor *)v3 setDelegate:v2];
  }
  return v2;
}

- (void)addFuturePurchase:(id)a3
{
  futurePurchases = self->_futurePurchases;
  if (!futurePurchases)
  {
    futurePurchases = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_futurePurchases = futurePurchases;
  }
  [(NSMutableSet *)futurePurchases addObject:a3];
  if ([a3 valueForDownloadProperty:*MEMORY[0x263F7B6D8]])
  {
    uint64_t v6 = SSGetUnsignedLongLongFromValue();
    [(SUPurchaseManager *)self addPurchasedItemIdentifier:v6];
  }
}

- (BOOL)addPurchaseBatch:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "errors"), "count")) {
    -[SUPurchaseManager _showDialogsForErrors:](self, "_showDialogsForErrors:", [a3 errors]);
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "continuations"), "count");
  BOOL v6 = v5 != 0;
  if (v5) {
    -[SUPurchaseManager _enqueueContinuations:](self, "_enqueueContinuations:", [a3 continuations]);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "validPurchases"), "count"))
  {
    -[SUPurchaseManager _enqueuePurchases:](self, "_enqueuePurchases:", [a3 validPurchases]);
    BOOL v6 = 1;
  }
  [(SUPurchaseManager *)self _performNextAction];
  return v6;
}

- (void)addPurchasedItemIdentifier:(unint64_t)a3
{
  if (!self->_purchasedIdentifiers) {
    self->_purchasedIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v5 = [NSNumber numberWithItemIdentifier:a3];
  if (([(NSMutableSet *)self->_purchasedIdentifiers containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)self->_purchasedIdentifiers addObject:v5];
    BOOL v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SUPurchasedItemIdentifiersChangedNotification" object:self];
  }
}

- (void)addPurchasedItemIdentifiers:(id)a3
{
  purchasedIdentifiers = self->_purchasedIdentifiers;
  if (!purchasedIdentifiers)
  {
    purchasedIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_purchasedIdentifiers = purchasedIdentifiers;
  }
  unint64_t v6 = [(NSMutableSet *)purchasedIdentifiers count];
  [(NSMutableSet *)self->_purchasedIdentifiers unionSet:a3];
  if ([(NSMutableSet *)self->_purchasedIdentifiers count] > v6)
  {
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUPurchasedItemIdentifiersChangedNotification" object:self];
  }
}

- (void)beginUpdates
{
  int64_t updatesCount = self->_updatesCount;
  self->_int64_t updatesCount = updatesCount + 1;
  if (!updatesCount && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    [(SUPurchaseManagerDelegate *)delegate purchaseManagerWillBeginUpdates:self];
  }
}

- (void)cancelFuturePurchase:(id)a3
{
  id v5 = a3;
  if ([a3 valueForDownloadProperty:*MEMORY[0x263F7B6D8]]) {
    [(SUPurchaseManager *)self removePurchasedItemIdentifier:SSGetUnsignedLongLongFromValue()];
  }
  [(SUPurchaseManager *)self _removePlaceholdersForPurchase:a3];
  futurePurchases = self->_futurePurchases;

  [(NSMutableSet *)futurePurchases removeObject:a3];
}

- (void)endUpdates
{
  int64_t updatesCount = self->_updatesCount;
  BOOL v3 = updatesCount == 1;
  BOOL v4 = updatesCount < 1;
  int64_t v5 = updatesCount - 1;
  if (!v4)
  {
    self->_int64_t updatesCount = v5;
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      [(SUPurchaseManagerDelegate *)delegate purchaseManagerDidEndUpdates:self];
    }
  }
}

- (BOOL)itemIdentifierIsPurchased:(unint64_t)a3
{
  BOOL v4 = (void *)[objc_alloc(NSNumber) initWithItemIdentifier:a3];
  LOBYTE(self) = [(NSMutableSet *)self->_purchasedIdentifiers containsObject:v4];

  return (char)self;
}

- (BOOL)itemIdentifierIsPurchasing:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  purchaseRequests = self->_purchaseRequests;
  uint64_t v5 = [(NSMutableArray *)purchaseRequests countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = *MEMORY[0x263F7B6D8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(purchaseRequests);
        }
        uint64_t v10 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * i) purchases];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v16 + 1) + 8 * j) valueForDownloadProperty:v8];
              if (SSGetUnsignedLongLongFromValue() == a3)
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)purchaseRequests countByEnumeratingWithState:&v20 objects:v25 count:16];
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (id)newPurchaseBatchForItems:(id)a3 offers:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (uint64_t v7 = (SUPurchaseBatch *)(id)[(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self purchaseBatchForItems:a3]) == 0)
  {
    uint64_t v7 = [[SUPurchaseBatch alloc] initWithItems:a3 offers:a4];
  }
  [(SUPurchaseBatch *)v7 setPurchaseManager:self];
  return v7;
}

- (int64_t)numberOfPendingPurchases
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  purchaseRequests = self->_purchaseRequests;
  uint64_t v3 = [(NSMutableArray *)purchaseRequests countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(purchaseRequests);
      }
      v5 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "purchases"), "count");
    }
    uint64_t v4 = [(NSMutableArray *)purchaseRequests countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (void)removePurchasedItemIdentifier:(unint64_t)a3
{
  if (self->_purchasedIdentifiers)
  {
    uint64_t v4 = [NSNumber numberWithItemIdentifier:a3];
    if ([(NSMutableSet *)self->_purchasedIdentifiers containsObject:v4])
    {
      [(NSMutableSet *)self->_purchasedIdentifiers removeObject:v4];
      int64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v5 postNotificationName:@"SUPurchasedItemIdentifiersChangedNotification" object:self];
    }
  }
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (![a4 isEqualToString:*MEMORY[0x263F7B770]]) {
    return;
  }
  uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v60 = 138412290;
    uint64_t v61 = objc_opt_class();
    LODWORD(v58) = 12;
    v55 = &v60;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      long long v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v60, v58);
      free(v11);
      v55 = (int *)v12;
      SSFileLog();
    }
  }
  uint64_t v13 = objc_msgSend(a5, "objectForKey:", @"response", v55);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v59 = 0;
    uint64_t v14 = (void *)MEMORY[0x263F08928];
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    long long v17 = objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), v13, &v59);
    if (v59)
    {
      long long v18 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v20 &= 2u;
      }
      if (v20)
      {
        uint64_t v21 = objc_opt_class();
        int v60 = 138412546;
        uint64_t v61 = v21;
        __int16 v62 = 2112;
        uint64_t v63 = v59;
        LODWORD(v58) = 22;
        v56 = &v60;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          long long v23 = (void *)v22;
          uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v60, v58);
          free(v23);
          v56 = (int *)v24;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v44 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v45 = [v44 shouldLog];
      if ([v44 shouldLogToDisk]) {
        int v46 = v45 | 2;
      }
      else {
        int v46 = v45;
      }
      v47 = objc_msgSend(v44, "OSLogObject", v56);
      if (isKindOfClass)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
          int v48 = v46;
        }
        else {
          int v48 = v46 & 2;
        }
        if (!v48) {
          return;
        }
        uint64_t v49 = objc_opt_class();
        int v60 = 138412546;
        uint64_t v61 = v49;
        __int16 v62 = 2112;
        uint64_t v63 = 0;
        LODWORD(v58) = 22;
      }
      else
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          int v50 = v46;
        }
        else {
          int v50 = v46 & 2;
        }
        if (!v50) {
          return;
        }
        uint64_t v51 = objc_opt_class();
        uint64_t v52 = objc_opt_class();
        int v60 = 138412546;
        uint64_t v61 = v51;
        __int16 v62 = 2112;
        uint64_t v63 = v52;
        LODWORD(v58) = 22;
      }
      v42 = (void *)_os_log_send_and_compose_impl();
      if (!v42) {
        return;
      }
      goto LABEL_61;
    }
    uint64_t v25 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v25, "OSLogObject", v56), OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      uint64_t v28 = objc_opt_class();
      int v60 = 138412546;
      uint64_t v61 = v28;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v17;
      LODWORD(v58) = 22;
      v57 = &v60;
      uint64_t v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        v30 = (void *)v29;
        uint64_t v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v60, v58);
        free(v30);
        v57 = (int *)v31;
        SSFileLog();
      }
    }
    if (objc_msgSend(v17, "error", v57))
    {
      v32 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v33 = [v32 shouldLog];
      if ([v32 shouldLogToDisk]) {
        int v34 = v33 | 2;
      }
      else {
        int v34 = v33;
      }
      if (!os_log_type_enabled((os_log_t)[v32 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v34 &= 2u;
      }
      if (v34)
      {
        uint64_t v35 = objc_opt_class();
        int v60 = 138412290;
        uint64_t v61 = v35;
        LODWORD(v58) = 12;
LABEL_44:
        uint64_t v41 = _os_log_send_and_compose_impl();
        if (!v41) {
          return;
        }
        v42 = (void *)v41;
LABEL_61:
        objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v60, v58);
        free(v42);
        SSFileLog();
      }
    }
    else
    {
      v53 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      objc_msgSend(v53, "postNotificationName:object:", @"SUPurchaseFinishedNotification", objc_msgSend(v17, "purchase"));
      v54 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v17, @"SUPurchaseNotificationKeyPurchaseResponse", 0);
      [v53 postNotificationName:@"SUPurchaseRequestDidSucceedNotification" object:self userInfo:v54];
    }
  }
  else
  {
    v36 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v37 = [v36 shouldLog];
    if ([v36 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    if (!os_log_type_enabled((os_log_t)[v36 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v38 &= 2u;
    }
    if (v38)
    {
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      int v60 = 138412546;
      uint64_t v61 = v39;
      __int16 v62 = 2112;
      uint64_t v63 = v40;
      LODWORD(v58) = 22;
      goto LABEL_44;
    }
  }
}

- (void)_dialogDidFinish:(id)a3
{
  if (self->_showingErrorDialogs
    && ![+[SUDialogManager sharedInstance] numberOfPendingDialogs])
  {
    self->_showingErrorDialogs = 0;
    [(SUPurchaseManager *)self _performNextAction];
  }
}

- (void)continuation:(id)a3 failedWithError:(id)a4
{
  -[NSMutableSet removeObject:](self->_inflightContinuations, "removeObject:", a3, a4);

  [(SUPurchaseManager *)self _performNextAction];
}

- (void)continuationFinished:(id)a3
{
  -[SUPurchaseManager _enqueuePurchases:](self, "_enqueuePurchases:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(a3, "purchase"), 0));
  [(NSMutableSet *)self->_inflightContinuations removeObject:a3];

  [(SUPurchaseManager *)self _performNextAction];
}

- (void)purchaseRequest:(id)a3 purchaseDidFail:(id)a4 withError:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v8 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = a5;
    LODWORD(v16) = 22;
    v15 = &v17;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v17, v16);
      free(v12);
      v15 = (int *)v13;
      SSFileLog();
    }
  }
  if (objc_msgSend(a4, "valueForDownloadProperty:", *MEMORY[0x263F7B6D8], v15)) {
    [(SUPurchaseManager *)self removePurchasedItemIdentifier:SSGetUnsignedLongLongFromValue()];
  }
  [(SUPurchaseManager *)self _removePlaceholdersForPurchase:a4];
  if ([a5 code] == 9990) {
    uint64_t v14 = [a4 tidHeaders];
  }
  else {
    uint64_t v14 = 0;
  }
  [(SUPurchaseManager *)self setTidHeaders:v14];
  if (a5) {
    a5 = (id)objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", a5, @"SUPurchaseNotificationKeyError", 0);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"SUPurchaseFailedNotification", a4, a5);
}

- (void)purchaseRequest:(id)a3 purchaseDidSucceed:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3, a4);
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v10 = 138412290;
    uint64_t v11 = objc_opt_class();
    LODWORD(v9) = 12;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      int v8 = (void *)v7;
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v10, v9);
      free(v8);
      SSFileLog();
    }
  }
}

- (void)purchaseRequest:(id)a3 purchaseDidSucceedWithResponse:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  -[SUPurchaseManager setTidHeaders:](self, "setTidHeaders:", 0, a4);
  uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v10 = 138412290;
    uint64_t v11 = objc_opt_class();
    LODWORD(v9) = 12;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      int v8 = (void *)v7;
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v10, v9);
      free(v8);
      SSFileLog();
    }
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = self;
    [(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self didFinishPurchaseRequest:a3 withError:a4];
  }

  [(SUPurchaseManager *)self _removePurchaseRequest:a3];
}

- (void)requestDidFinish:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    int v5 = self;
    [(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self didFinishPurchaseRequest:a3 withError:0];
  }

  [(SUPurchaseManager *)self _removePurchaseRequest:a3];
}

- (id)_accountDSIDForPurchase:(id)a3
{
  int v5 = (void *)[a3 valueForDownloadProperty:*MEMORY[0x263F7B670]];
  if (![v5 isEqualToString:*MEMORY[0x263F7B588]]
    || (uint64_t v6 = [a3 valueForDownloadProperty:*MEMORY[0x263F7B6D8]],
        uint64_t v7 = (void *)[MEMORY[0x263F01868] applicationProxyForItemID:v6],
        !objc_msgSend((id)objc_msgSend(v7, "applicationDSID"), "integerValue"))
    || (id result = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_msgSend(v7, "applicationDSID"), "integerValue"))) == 0)
  {
    return [(SUPurchaseManager *)self accountDSID];
  }
  return result;
}

- (id)_downloadManagerForDownloadKind:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  observedDownloadManagers = self->_observedDownloadManagers;
  if (!observedDownloadManagers)
  {
    observedDownloadManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_observedDownloadManagers = observedDownloadManagers;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(NSMutableArray *)observedDownloadManagers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(observedDownloadManagers);
      }
      id v10 = *(id *)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "managerOptions"), "downloadKinds"), "containsObject:", a3))break; {
      if (v7 == ++v9)
      }
      {
        uint64_t v7 = [(NSMutableArray *)observedDownloadManagers countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    if (v10) {
      return v10;
    }
  }
LABEL_13:
  id v10 = [(SUQueueSessionManager *)self->_queueSessionManager beginDownloadManagerSessionForDownloadKind:a3];
  if (v10
    || (uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", a3, 0),
        id v10 = [(SUQueueSessionManager *)self->_queueSessionManager beginDownloadManagerSessionWithDownloadKinds:v11], v11, v10))
  {
    [v10 addObserver:self];
    [(NSMutableArray *)self->_observedDownloadManagers addObject:v10];
  }
  return v10;
}

- (void)_enqueueContinuations:(id)a3
{
  pendingContinuations = self->_pendingContinuations;
  if (!pendingContinuations)
  {
    pendingContinuations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_pendingContinuations = pendingContinuations;
  }

  [(NSMutableArray *)pendingContinuations addObjectsFromArray:a3];
}

- (void)_enqueueExternalDownload:(id)a3
{
  [a3 valueForProperty:*MEMORY[0x263F7B6D8]];
  uint64_t v5 = SSGetUnsignedLongLongFromValue();
  [(SUPurchaseManager *)self addPurchasedItemIdentifier:v5];
  id v6 = -[SUPurchaseManager _downloadManagerForDownloadKind:](self, "_downloadManagerForDownloadKind:", [a3 valueForProperty:*MEMORY[0x263F7B670]]);
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SUPurchaseManager__enqueueExternalDownload___block_invoke;
  v8[3] = &unk_264812BC8;
  v8[4] = self;
  v8[5] = v5;
  [v6 addDownloads:v7 completionBlock:v8];
}

void __46__SUPurchaseManager__enqueueExternalDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __46__SUPurchaseManager__enqueueExternalDownload___block_invoke_2;
    v3[3] = &unk_264812A50;
    uint64_t v2 = *(void *)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    v3[5] = v2;
    dispatch_async(MEMORY[0x263EF83A0], v3);
  }
}

uint64_t __46__SUPurchaseManager__enqueueExternalDownload___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePurchasedItemIdentifier:*(void *)(a1 + 40)];
}

- (void)_enqueuePurchases:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x263F7B788];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v10 accountIdentifier])
        {
          id v11 = [(SUPurchaseManager *)self _accountDSIDForPurchase:v10];
          if (v11) {
            [v10 setAccountIdentifier:v11];
          }
          if (self->_userAgent
            && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "requestProperties"), "HTTPHeaders"), "objectForKey:", v8))
          {
            id v12 = (id)objc_msgSend((id)objc_msgSend(v10, "requestProperties"), "mutableCopy");
            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x263F7B290]);
            }
            [v12 setValue:self->_userAgent forHTTPHeaderField:v8];
            [v10 setRequestProperties:v12];
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v13 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }
  pendingPurchases = self->_pendingPurchases;
  if (!pendingPurchases)
  {
    pendingPurchases = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_pendingPurchases = pendingPurchases;
  }
  [(NSMutableArray *)pendingPurchases addObjectsFromArray:a3];
}

- (BOOL)_issuePurchaseRequestForPurchases:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F7B2E8]) initWithPurchases:a3];
  [v5 setDelegate:self];
  [v5 setShouldValidatePurchases:0];
  purchaseRequests = self->_purchaseRequests;
  if (!purchaseRequests)
  {
    purchaseRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_purchaseRequests = purchaseRequests;
  }
  [(NSMutableArray *)purchaseRequests addObject:v5];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SSPurchaseRequestsChangedNotification", self);

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = *MEMORY[0x263F7B6D8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(a3);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_futurePurchases containsObject:v14]) {
          [(NSMutableSet *)self->_futurePurchases removeObject:v14];
        }
        uint64_t v15 = [v14 valueForDownloadProperty:v12];
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  [(SUPurchaseManager *)self addPurchasedItemIdentifiers:v8];

  [v7 count];
  return [v5 start];
}

- (BOOL)_needsAuthenticationForPurchases:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v5 = [v4 activeAccount];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 accountIdentifier];
          uint64_t v12 = (void *)v5;
          if (v11) {
            uint64_t v12 = objc_msgSend(v4, "accountWithUniqueIdentifier:");
          }
          if (!v12 || ![v12 isAuthenticated]) {
            return 1;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return [v4 isExpired];
}

- (void)_performNextAction
{
  if (!self->_showingErrorDialogs && ![(NSMutableSet *)self->_inflightContinuations count])
  {
    if ([(NSMutableArray *)self->_pendingContinuations count])
    {
      uint64_t v3 = self->_pendingContinuations;

      self->_pendingContinuations = 0;
      [(SUPurchaseManager *)self _startContinuations:v3];
    }
    else
    {
      if (![(NSMutableArray *)self->_pendingPurchases count]) {
        return;
      }
      uint64_t v3 = self->_pendingPurchases;

      self->_pendingPurchases = 0;
      [(SUPurchaseManager *)self _startPurchases:v3];
    }
  }
}

- (void)_removePurchaseRequest:(id)a3
{
  [a3 setDelegate:0];
  [(NSMutableArray *)self->_purchaseRequests removeObject:a3];
  uint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"SSPurchaseRequestsChangedNotification" object:self];
}

- (void)_showDialogsForErrors:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[SUDialogManager sharedInstance];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        [(SUDialogManager *)v5 presentDialogForError:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  self->_showingErrorDialogs = [(SUDialogManager *)v5 numberOfPendingDialogs] > 0;
}

- (void)_startContinuations:(id)a3
{
  inflightContinuations = self->_inflightContinuations;
  if (!inflightContinuations)
  {
    inflightContinuations = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_inflightContinuations = inflightContinuations;
  }
  [(NSMutableSet *)inflightContinuations addObjectsFromArray:a3];
  [a3 makeObjectsPerformSelector:sel_setDelegate_ withObject:self];

  [a3 makeObjectsPerformSelector:sel_start];
}

- (void)_startPurchases:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self willAddPurchases:a3];
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SUPurchaseManager *)self _enqueueExternalDownload:v10];
        }
        else {
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  if ([v5 count])
  {
    BOOL v11 = [(SUPurchaseManager *)self _issuePurchaseRequestForPurchases:v5];

    if (!v11)
    {
      if (objc_opt_respondsToSelector()) {
        [(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self failedToAddPurchases:a3];
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (objc_opt_respondsToSelector()) {
    [(SUPurchaseManagerDelegate *)self->_delegate purchaseManager:self didAddPurchases:a3];
  }
LABEL_20:
  [(SUPurchaseManager *)self _performNextAction];
}

- (SUPurchaseManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUPurchaseManagerDelegate *)a3;
}

- (NSSet)futurePurchases
{
  return &self->_futurePurchases->super;
}

- (NSSet)purchasedItemIdentifiers
{
  return &self->_purchasedIdentifiers->super;
}

- (SUQueueSessionManager)queueSessionManager
{
  return self->_queueSessionManager;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
}

- (void)addExternalDownloads:(id)a3 inContext:(OpaqueJSContext *)a4
{
}

- (void)addExternalDownloads:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5
{
  JSPropertyNameArrayRef v9 = JSObjectCopyPropertyNames(a5, (JSObjectRef)[a3 JSObject]);
  if (v9)
  {
    uint64_t v10 = v9;
    id v20 = a4;
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    int64_t Count = JSPropertyNameArrayGetCount(v10);
    if (Count >= 1)
    {
      int64_t v13 = Count;
      for (uint64_t i = 0; i != v13; ++i)
      {
        id v15 = objc_alloc_init(MEMORY[0x263F086B0]);
        id v16 = -[SUPurchaseManager _newDictionaryForWebScriptValue:inContext:](self, "_newDictionaryForWebScriptValue:inContext:", [a3 webScriptValueAtIndex:i], a5);
        if (v16)
        {
          uint64_t v17 = v16;
          id v18 = [(SUPurchaseManager *)self _newExternalDownloadWithDictionary:v16];
          if (v18)
          {
            uint64_t v19 = v18;
            [v11 addObject:v18];
          }
        }
        objc_msgSend(v15, "drain", v20);
      }
    }
    if (objc_msgSend(v11, "count", v20)) {
      [(SUPurchaseManager *)self _addBatchForPurchases:v11 options:v21];
    }

    JSPropertyNameArrayRelease(v10);
  }
}

- (id)copyPurchaseForScriptObject:(id)a3
{
  return [(SUPurchaseManager *)self copyPurchaseForScriptObject:a3 inContext:0];
}

- (id)copyPurchaseForScriptObject:(id)a3 inContext:(OpaqueJSContext *)a4
{
  uint64_t v7 = (void *)[a3 safeValueForKey:@"actionParams"];
  if (![v7 length]) {
    return 0;
  }
  [a3 safeValueForKey:@"itemType"];
  uint64_t v8 = (void *)SSDownloadKindForItemKind();
  JSPropertyNameArrayRef v9 = (Class *)0x263F7B348;
  if (([v8 isEqualToString:*MEMORY[0x263F7B580]] & 1) == 0
    && ![v8 isEqualToString:*MEMORY[0x263F7B590]])
  {
    JSPropertyNameArrayRef v9 = (Class *)0x263F7B2D8;
  }
  id v10 = objc_alloc_init(*v9);
  [v10 setBuyParameters:v7];
  [v10 setValue:v8 forDownloadProperty:*MEMORY[0x263F7B670]];
  id v11 = [(SUPurchaseManager *)self tidHeaders];
  if (v11) {
    [v10 setTidHeaders:v11];
  }
  uint64_t v12 = [a3 safeValueForKey:@"artworkURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v12 forDownloadProperty:*MEMORY[0x263F7B730]];
  }
  uint64_t v13 = [a3 safeValueForKey:@"artistName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v13 forDownloadProperty:*MEMORY[0x263F7B5F0]];
  }
  uint64_t v14 = [a3 safeValueForKey:@"bundleId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v14 forDownloadProperty:*MEMORY[0x263F7B600]];
  }
  uint64_t v15 = [a3 safeValueForKey:@"collectionName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v15 forDownloadProperty:*MEMORY[0x263F7B618]];
  }
  if ([a3 safeValueForKey:@"itemId"]) {
    objc_msgSend(v10, "setValue:forDownloadProperty:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", SSGetUnsignedLongLongFromValue()), *MEMORY[0x263F7B6D8]);
  }
  uint64_t v16 = [a3 safeValueForKey:*MEMORY[0x263F7B880]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v16 forDownloadProperty:*MEMORY[0x263F7B720]];
  }
  uint64_t v17 = [a3 safeValueForKey:*MEMORY[0x263F7B888]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v17 forDownloadProperty:*MEMORY[0x263F7B728]];
  }
  id v18 = (void *)[a3 safeValueForKey:*MEMORY[0x263F7B980]];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 BOOLValue])
  {
    uint64_t v19 = [v10 valueForDownloadProperty:*MEMORY[0x263F7B6D8]];
    [v10 setValue:v19 forDownloadProperty:*MEMORY[0x263F7B6E8]];
  }
  id v20 = (void *)[a3 safeValueForKey:@"seasonNumber"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "integerValue"));
    [v10 setValue:v21 forDownloadProperty:*MEMORY[0x263F7B690]];
  }
  uint64_t v22 = [a3 safeValueForKey:@"seriesName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v22 forDownloadProperty:*MEMORY[0x263F7B698]];
  }
  uint64_t v23 = [a3 safeValueForKey:@"software-type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v23 forDownloadProperty:*MEMORY[0x263F7B6A8]];
  }
  uint64_t v24 = [a3 safeValueForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setValue:v24 forDownloadProperty:*MEMORY[0x263F7B738]];
  }
  uint64_t v25 = (void *)[a3 safeValueForKey:@"networkConstraints"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0)
  {
    int v27 = (void *)[v25 copyArrayOrDictionaryWithContext:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = objc_alloc_init(MEMORY[0x263F7B298]);
      [v28 setSizeLimitsWithStoreConstraintDictionary:v27];
      [v10 setNetworkConstraints:v28];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = (void *)[a3 safeValueForKey:@"allowedToneStyles"];
    objc_opt_class();
    char v30 = objc_opt_isKindOfClass();
    uint64_t v31 = 0;
    if (a4 && (v30 & 1) != 0) {
      uint64_t v31 = (void *)[v29 copyArrayOrDictionaryWithContext:a4];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      int v32 = [v8 isEqualToString:*MEMORY[0x263F7B590]];
      id v33 = objc_alloc(MEMORY[0x263EFF8C0]);
      uint64_t v34 = *MEMORY[0x263F7B990];
      if (v32) {
        uint64_t v35 = objc_msgSend(v33, "initWithObjects:", v34, *MEMORY[0x263F7B998], 0);
      }
      else {
        uint64_t v35 = objc_msgSend(v33, "initWithObjects:", v34, 0, v37);
      }
      uint64_t v31 = (void *)v35;
    }
    [v10 setAllowedToneStyles:v31];
  }
  SSVPurchaseAddDownloadPropertiesForBuyParameters();
  return v10;
}

- (void)enqueueScriptPurchases:(id)a3
{
  id v4 = [(SUPurchaseManager *)self _newPurchaseBatchForPurchases:a3];
  [(SUPurchaseManager *)self addPurchaseBatch:v4];
}

- (void)purchaseScriptObject:(id)a3
{
}

- (void)purchaseScriptObject:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [a3 webScriptValueAtIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    JSPropertyNameArrayRef v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", a3, 0);
  }
  else {
    JSPropertyNameArrayRef v9 = (void *)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
  }
  id v10 = v9;
  if ([v9 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = [(SUPurchaseManager *)self copyPurchaseForScriptObject:*(void *)(*((void *)&v18 + 1) + 8 * v15) inContext:a5];
          if (v16)
          {
            uint64_t v17 = v16;
            [v11 addObject:v16];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
    if ([v11 count]) {
      [(SUPurchaseManager *)self _addBatchForPurchases:v11 options:a4];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (void)_addBatchForPurchases:(id)a3 options:(id)a4
{
}

void __70__SUPurchaseManager_SUScriptAdditions___addBatchForPurchases_options___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) _newPurchaseBatchForPurchases:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)[v3 validPurchases];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 count]) {
    [*(id *)(a1 + 32) _schedulePurchaseCallback:*(void *)(a1 + 48) forPurchases:v2];
  }
  [*(id *)(a1 + 32) addPurchaseBatch:v3];
}

- (id)_newDictionaryForWebScriptValue:(id)a3 inContext:(OpaqueJSContext *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (id)[a3 copyArrayOrDictionaryWithContext:a4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)SUScriptPropertyListFromString(a3);
      return v7;
    }
    else
    {
      return 0;
    }
  }
}

- (id)_newExternalDownloadWithDictionary:(id)a3
{
  if ([a3 objectForKey:@"type"])
  {
    return [(SUPurchaseManager *)self _newExternalDownloadWithItemDictionary:a3];
  }
  else
  {
    return [(SUPurchaseManager *)self _newExternalDownloadWithDownloadDictionary:a3];
  }
}

- (id)_newExternalDownloadWithDownloadDictionary:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F7B190]) initWithDictionary:a3];
  if ([v3 kind]) {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7B168]) initWithDownloadMetadata:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_newExternalDownloadWithItemDictionary:(id)a3
{
  id v4 = +[SUItemDataSource sharedDataSource];
  id result = (id)[v4 newItemWithItemDictionary:a3];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = objc_msgSend(v4, "newExternalDownloadWithItem:storeOffer:", result, objc_msgSend(result, "defaultStoreOffer"));

    return v7;
  }
  return result;
}

- (id)_newPurchaseBatchForPurchases:(id)a3
{
  id v5 = [(SUPurchaseManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v6 = (SUPurchaseBatch *)(id)[(SUPurchaseManagerDelegate *)v5 purchaseManager:self purchaseBatchForPurchases:a3]) == 0)
  {
    id v6 = objc_alloc_init(SUPurchaseBatch);
    [(SUPurchaseBatch *)v6 setValidPurchases:a3];
  }
  [(SUPurchaseBatch *)v6 setPurchaseManager:self];
  return v6;
}

- (void)_schedulePurchaseCallback:(id)a3 forPurchases:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  if ((unint64_t)[a4 count] < 2)
  {
    uint64_t v12 = [a4 firstObject];
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3052000000;
    uint64_t v31 = __Block_byref_object_copy__29;
    int v32 = __Block_byref_object_dispose__29;
    uint64_t v33 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000;
    uint64_t v24 = __Block_byref_object_copy__29;
    uint64_t v25 = __Block_byref_object_dispose__29;
    uint64_t v26 = 0;
    uint64_t v13 = [MEMORY[0x263F08A48] mainQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_2;
    v20[3] = &unk_264813D48;
    v20[4] = v12;
    v20[5] = a3;
    v20[6] = v7;
    v20[7] = &v28;
    v20[8] = &v21;
    uint64_t v14 = [v7 addObserverForName:@"SUPurchaseFailedNotification" object:0 queue:v13 usingBlock:v20];
    v29[5] = v14;
    uint64_t v15 = [MEMORY[0x263F08A48] mainQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_3;
    v19[3] = &unk_264813D48;
    v19[4] = v12;
    v19[5] = a3;
    v19[6] = v7;
    v19[7] = &v28;
    v19[8] = &v21;
    uint64_t v16 = [v7 addObserverForName:@"SUPurchaseFinishedNotification" object:0 queue:v15 usingBlock:v19];
    v22[5] = v16;
    id v17 = (id)v29[5];
    id v18 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int64_t v8 = [(SUPurchaseManager *)self numberOfPendingPurchases];
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3052000000;
    uint64_t v31 = __Block_byref_object_copy__29;
    int v32 = __Block_byref_object_dispose__29;
    uint64_t v33 = 0;
    uint64_t v9 = [MEMORY[0x263F08A48] mainQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke;
    v27[3] = &unk_264813D20;
    v27[6] = &v28;
    v27[7] = v8;
    v27[4] = a3;
    v27[5] = v7;
    id v10 = (void *)[v7 addObserverForName:@"SSPurchaseRequestsChangedNotification" object:self queue:v9 usingBlock:v27];
    v29[5] = (uint64_t)v10;
    id v11 = v10;
  }
  _Block_object_dispose(&v28, 8);
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "object"), "numberOfPendingPurchases") <= *(void *)(a1 + 56))
  {
    __CallPurchaseCallback(*(void *)(a1 + 32), 1, 0);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "removeObserver:");

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)[a2 object];
  if (v4 == v5
    || objc_msgSend((id)objc_msgSend(v4, "valueForDownloadProperty:", *MEMORY[0x263F7B6D8]), "isEqual:", objc_msgSend(v5, "valueForDownloadProperty:", *MEMORY[0x263F7B6D8])))
  {
    __CallPurchaseCallback(*(void *)(a1 + 40), 0, (SUScriptError *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"SUPurchaseNotificationKeyError"));
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
    }
  }
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)[a2 object];
  if (v3 == v4
    || objc_msgSend((id)objc_msgSend(v3, "valueForDownloadProperty:", *MEMORY[0x263F7B6D8]), "isEqual:", objc_msgSend(v4, "valueForDownloadProperty:", *MEMORY[0x263F7B6D8])))
  {
    __CallPurchaseCallback(*(void *)(a1 + 40), 1, 0);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
    }
  }
}

@end