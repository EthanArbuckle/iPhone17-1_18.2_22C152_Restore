@interface PKUsageNotificationServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PKUsageNotificationServer)init;
- (void)dealloc;
- (void)notifyPassUsed:(id)a3 fromSource:(int64_t)a4;
- (void)notifyPaymentPassUsedWithTransactionInfo:(id)a3;
@end

@implementation PKUsageNotificationServer

- (PKUsageNotificationServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKUsageNotificationServer;
  v2 = [(PKUsageNotificationServer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v3->_connections;
    v3->_connections = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.passd.usage"];
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v3->_listener setDelegate:v3];
    v8 = [(NSXPCListener *)v3->_listener _xpcConnection];
    xpc_connection_set_non_launching();

    [(NSXPCListener *)v3->_listener resume];
  }
  return v3;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKUsageNotificationServer;
  [(PKUsageNotificationServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PKUsageNotificationClientInterface();
  [v7 setRemoteObjectInterface:v8];

  [v7 setExportedObject:self];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE286F40];
  [v7 setExportedInterface:v9];

  [v7 setInterruptionHandler:&__block_literal_global_106];
  objc_initWeak(&location, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke_61;
  v13[3] = &unk_1E56D9150;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  [v7 setInvalidationHandler:v13];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_connections addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
  objc_super v10 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v7 processIdentifier];
    *(_DWORD *)buf = 67109120;
    int v17 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_INFO, "Pass usage connection added from pid %d", buf, 8u);
  }

  [v7 resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

void __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190E10000, v0, OS_LOG_TYPE_INFO, "Pass usage connection interrupted", v1, 2u);
  }
}

void __64__PKUsageNotificationServer_listener_shouldAcceptNewConnection___block_invoke_61(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_INFO, "Pass usage connection invalidated; removing it", v4, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:WeakRetained];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
}

- (void)notifyPassUsed:(id)a3 fromSource:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = [v6 storeIdentifiers];
  if ([v8 count])
  {
    int64_t v20 = a4;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v14), "stringValue", v20);
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    [v7 setObject:v9 forKey:@"associatedStoreIdentifiers"];
    a4 = v20;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v17 = (void *)[(NSMutableSet *)self->_connections copy];
  os_unfair_lock_unlock(p_lock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__PKUsageNotificationServer_notifyPassUsed_fromSource___block_invoke;
  v21[3] = &unk_1E56E7CF8;
  id v23 = v7;
  int64_t v24 = a4;
  id v22 = v6;
  id v18 = v7;
  id v19 = v6;
  [v17 enumerateObjectsUsingBlock:v21];
}

void __55__PKUsageNotificationServer_notifyPassUsed_fromSource___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = [*(id *)(a1 + 32) passTypeIdentifier];
  [v5 usedPassFromSource:v3 withTypeIdentifier:v4 info:*(void *)(a1 + 40)];
}

- (void)notifyPaymentPassUsedWithTransactionInfo:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 merchant];
  v8 = [v7 mapsMerchant];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "identifier"));
  [v6 setValue:v9 forKey:@"muid"];

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "resultProviderIdentifier"));
  [v6 setValue:v10 forKey:@"resultProviderIdentifier"];

  uint64_t v11 = [v5 location];
  [v6 setValue:v11 forKey:@"transactionLocation"];

  uint64_t v12 = [v5 transactionDate];
  [v6 setValue:v12 forKey:@"transactionDate"];

  uint64_t v13 = [v5 identifier];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = (void *)[(NSMutableSet *)self->_connections copy];
  os_unfair_lock_unlock(p_lock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__PKUsageNotificationServer_notifyPaymentPassUsedWithTransactionInfo___block_invoke;
  v18[3] = &unk_1E56E7D20;
  id v19 = &stru_1EE0F5368;
  id v20 = v13;
  id v21 = v6;
  id v16 = v6;
  id v17 = v13;
  [v15 enumerateObjectsUsingBlock:v18];
  CLPassKitNotifyPayment();
}

void __70__PKUsageNotificationServer_notifyPaymentPassUsedWithTransactionInfo___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 remoteObjectProxy];
  [v4 usedPaymentPassWithUniqueIdentifier:a1[4] transactionIdentifier:a1[5] info:a1[6]];

  id v5 = [v3 remoteObjectProxy];

  [v5 usedPaymentPassWithTransactionIdentifier:a1[5] info:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end