@interface SUScriptNotificationObserver
- (SUScriptNotificationObserver)init;
- (id)_copySafariQueryDictionaryFromURL:(id)a3;
- (void)_accessibilityPerformEscape;
- (void)_accessibilityPerformScrollDown;
- (void)_accessibilityPerformScrollLeft;
- (void)_accessibilityPerformScrollRight;
- (void)_accessibilityPerformScrollUp;
- (void)_audioSessionsChangedNotification:(id)a3;
- (void)_beginObservingNotifications;
- (void)_dispatchEvent:(id)a3 forName:(id)a4;
- (void)_dispatchEventWithDictionary:(id)a3 forName:(id)a4;
- (void)_dispatchSafariEventWithDictionary:(id)a3 andIdentifier:(id)a4;
- (void)_endObservingNotifications;
- (void)_enumerateReceiversUsingBlock:(id)a3;
- (void)_memoryWarningNotification:(id)a3;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_purchaseRequestDidSucceedNotification:(id)a3;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_safariViewControllerDataUpdate:(id)a3;
- (void)_softwareMapChangedNotification:(id)a3;
- (void)_storeBagDidChangeNotification:(id)a3;
- (void)_subscriptionStatusDidChangeNotification:(id)a3;
- (void)addEventReceiver:(id)a3;
- (void)dealloc;
- (void)removeEventReceiver:(id)a3;
@end

@implementation SUScriptNotificationObserver

- (SUScriptNotificationObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserver;
  v2 = [(SUScriptNotificationObserver *)&v4 init];
  if (v2) {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  }
  return v2;
}

- (void)dealloc
{
  [(SUScriptNotificationObserver *)self _endObservingNotifications];

  self->_lock = 0;
  receivers = self->_receivers;
  if (receivers)
  {
    CFRelease(receivers);
    self->_receivers = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserver;
  [(SUScriptNotificationObserver *)&v4 dealloc];
}

- (void)addEventReceiver:(id)a3
{
  [(NSLock *)self->_lock lock];
  receivers = self->_receivers;
  if (!receivers)
  {
    receivers = CFSetCreateMutable(0, 0, 0);
    self->_receivers = receivers;
  }
  CFSetAddValue(receivers, a3);
  if (CFSetGetCount(self->_receivers) == 1) {
    [(SUScriptNotificationObserver *)self _beginObservingNotifications];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)removeEventReceiver:(id)a3
{
  [(NSLock *)self->_lock lock];
  receivers = self->_receivers;
  if (receivers)
  {
    CFSetRemoveValue(receivers, a3);
    if (!CFSetGetCount(self->_receivers)) {
      [(SUScriptNotificationObserver *)self _endObservingNotifications];
    }
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)_audioSessionsChangedNotification:(id)a3
{
}

- (void)_memoryWarningNotification:(id)a3
{
}

- (void)_networkTypeChangedNotification:(id)a3
{
}

- (void)_purchaseRequestDidSucceedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_super v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"SUPurchaseNotificationKeyPurchaseResponse");
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "URLResponse"), "bodyData");
    if (v6)
    {
      v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B418], "consumer"), "objectForData:response:error:", v6, 0, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v7 objectForKey:@"metrics"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          int v10 = [v9 shouldLog];
          if ([v9 shouldLogToDisk]) {
            int v11 = v10 | 2;
          }
          else {
            int v11 = v10;
          }
          if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            int v12 = v11;
          }
          else {
            int v12 = v11 & 2;
          }
          if (v12)
          {
            *(_DWORD *)v31 = 138412290;
            *(void *)&v31[4] = self;
            LODWORD(v30) = 12;
            v29 = v31;
            uint64_t v13 = _os_log_send_and_compose_impl();
            if (v13)
            {
              v14 = (void *)v13;
              uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v31, v30);
              free(v14);
              v29 = (unsigned char *)v15;
              SSFileLog();
            }
          }
          [(SUScriptNotificationObserver *)self _dispatchEventWithDictionary:v8, @"buyConfirmed", v29 forName];
        }
        return;
      }
      v24 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v26 &= 2u;
      }
      if (v26) {
        goto LABEL_36;
      }
    }
    else
    {
      v21 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v22 = [v21 shouldLog];
      if ([v21 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v23 &= 2u;
      }
      if (v23)
      {
LABEL_36:
        *(_DWORD *)v31 = 138412546;
        *(void *)&v31[4] = objc_opt_class();
        *(_WORD *)&v31[12] = 2112;
        *(void *)&v31[14] = v5;
        LODWORD(v30) = 22;
        uint64_t v27 = _os_log_send_and_compose_impl();
        if (!v27) {
          return;
        }
        v28 = (void *)v27;
        objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, v31, v30, *(_OWORD *)v31, *(void *)&v31[16]);
        free(v28);
        goto LABEL_38;
      }
    }
  }
  else
  {
    v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (v18)
    {
      *(_DWORD *)v31 = 138412546;
      *(void *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = 0;
      LODWORD(v30) = 22;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v31, v30);
        free(v20);
LABEL_38:
        SSFileLog();
      }
    }
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
}

- (void)_softwareMapChangedNotification:(id)a3
{
}

- (void)_storeBagDidChangeNotification:(id)a3
{
}

- (void)_subscriptionStatusDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  if (v4) {
    v5 = [[SUScriptDictionary alloc] initWithDictionary:v4];
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = v5;
  [(SUScriptNotificationObserver *)self _dispatchEvent:v5 forName:@"subscriptionstatuschange"];
}

- (void)_safariViewControllerDataUpdate:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(SUScriptNotificationObserver *)self _copySafariQueryDictionaryFromURL:v4];
    uint64_t v5 = [v6 objectForKey:@"safariid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUScriptNotificationObserver *)self _dispatchSafariEventWithDictionary:v6 andIdentifier:v5];
    }
  }
}

- (id)_copySafariQueryDictionaryFromURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"name=%@", @"action"];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "queryItems"), "mutableCopy");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "filteredArrayUsingPredicate:", v4), "firstObject");
  v7 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  [v5 removeObject:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "value"), objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "name"));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  int v12 = (void *)[v7 copy];
  return v12;
}

- (void)_dispatchSafariEventWithDictionary:(id)a3 andIdentifier:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__SUScriptNotificationObserver__dispatchSafariEventWithDictionary_andIdentifier___block_invoke;
  v4[3] = &unk_2648131F8;
  v4[4] = a4;
  v4[5] = a3;
  v4[6] = self;
  [(SUScriptNotificationObserver *)self _enumerateReceiversUsingBlock:v4];
}

void __81__SUScriptNotificationObserver__dispatchSafariEventWithDictionary_andIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend((id)objc_msgSend(a2, "safariViewControllerIdentifier"), "isEqualToString:", *(void *)(a1 + 32)))
    {
      uint64_t v4 = [MEMORY[0x263F08900] dataWithJSONObject:*(void *)(a1 + 40) options:0 error:0];
      if (v4)
      {
        uint64_t v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
        uint64_t v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v7 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v8 = v7 | 2;
        }
        else {
          int v8 = v7;
        }
        if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          int v9 = v8;
        }
        else {
          int v9 = v8 & 2;
        }
        if (v9)
        {
          int v15 = 138412290;
          long long v16 = v5;
          LODWORD(v14) = 12;
          uint64_t v13 = &v15;
          uint64_t v10 = _os_log_send_and_compose_impl();
          if (v10)
          {
            uint64_t v11 = (void *)v10;
            uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v15, v14);
            free(v11);
            uint64_t v13 = (int *)v12;
            SSFileLog();
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "_dispatchEvent:forName:", v5, @"safariviewcontrollerdataupdate", v13);
      }
    }
  }
}

- (void)_accessibilityPerformScrollUp
{
}

- (void)_accessibilityPerformScrollDown
{
}

- (void)_accessibilityPerformScrollLeft
{
}

- (void)_accessibilityPerformScrollRight
{
}

- (void)_accessibilityPerformEscape
{
}

- (void)_beginObservingNotifications
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x263F536E0] object:0];
  [v3 addObserver:self selector:sel__networkTypeChangedNotification_ name:*MEMORY[0x263F89418] object:0];
  [v3 addObserver:self selector:sel__audioSessionsChangedNotification_ name:@"SUAudioPlayerSessionsChangedNotification" object:0];
  [v3 addObserver:self selector:sel__purchaseRequestDidSucceedNotification_ name:@"SUPurchaseRequestDidSucceedNotification" object:0];
  [v3 addObserver:self selector:sel__memoryWarningNotification_ name:*MEMORY[0x263F1D060] object:0];
  [v3 addObserver:self selector:sel__storeBagDidChangeNotification_ name:@"SUScriptStoreBagDidChangeNotification" object:0];
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__subscriptionStatusDidChangeNotification_, @"SUScriptSubscriptionStatusDidChangeNotification", +[SUScriptSubscriptionStatusObserver sharedObserver](SUScriptSubscriptionStatusObserver, "sharedObserver"));
  [v3 addObserver:self selector:sel__safariViewControllerDataUpdate_ name:@"SSScriptSafariViewControllerDataUpdateNotification" object:0];
  [MEMORY[0x263F89518] startObservingNotifications];
  uint64_t v4 = *MEMORY[0x263F89438];

  [v3 addObserver:self selector:sel__softwareMapChangedNotification_ name:v4 object:0];
}

- (void)_dispatchEvent:(id)a3 forName:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUScriptNotificationObserver__dispatchEvent_forName___block_invoke;
  v4[3] = &unk_264813220;
  v4[4] = a3;
  v4[5] = a4;
  [(SUScriptNotificationObserver *)self _enumerateReceiversUsingBlock:v4];
}

uint64_t __55__SUScriptNotificationObserver__dispatchEvent_forName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dispatchEvent:*(void *)(a1 + 32) forName:*(void *)(a1 + 40)];
}

- (void)_dispatchEventWithDictionary:(id)a3 forName:(id)a4
{
  if (objc_msgSend(MEMORY[0x263F08900], "isValidJSONObject:"))
  {
    uint64_t v7 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:0 error:0];
    if (v7)
    {
      id v8 = (id)[[NSString alloc] initWithData:v7 encoding:4];
      [(SUScriptNotificationObserver *)self _dispatchEvent:v8 forName:a4];
    }
  }
  else
  {
    NSLog(&cfstr_UnableToSerial_0.isa, a4, a3);
  }
}

- (void)_endObservingNotifications
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F89418] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F89438] object:0];
  [v3 removeObserver:self name:@"SUAudioPlayerSessionsChangedNotification" object:0];
  [v3 removeObserver:self name:@"SUPurchaseRequestDidSucceedNotification" object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];
  [v3 removeObserver:self name:@"SUScriptStoreBagDidChangeNotification" object:0];
  objc_msgSend(v3, "removeObserver:name:object:", self, @"SUScriptSubscriptionStatusDidChangeNotification", +[SUScriptSubscriptionStatusObserver sharedObserver](SUScriptSubscriptionStatusObserver, "sharedObserver"));

  [v3 removeObserver:self name:@"SSScriptSafariViewControllerDataUpdateNotification" object:0];
}

- (void)_enumerateReceiversUsingBlock:(id)a3
{
  [(NSLock *)self->_lock lock];
  if (self->_receivers)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    CFSetApplyFunction(self->_receivers, (CFSetApplierFunction)__AddObjectToNSMutableSet, v7);
    [(NSLock *)self->_lock unlock];
    if (v7)
    {
      uint64_t v5 = self;
      [v7 enumerateObjectsUsingBlock:a3];
    }
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

@end