@interface RCPEventDeliveryServicePool
- (BOOL)prewarmForSenderProperties:(id)a3 withError:(id *)a4;
- (BOOL)shouldIgnoreSenderProperties;
- (NSMutableDictionary)deliveryServicesBySenderID;
- (NSMutableDictionary)deliveryServicesBySenderProperties;
- (RCPEventDeliveryService)fallbackDeliveryService;
- (RCPEventDeliveryServicePool)init;
- (id)_findServiceForSenderProperties:(id)a3;
- (id)deliveryServiceForSenderProperties:(id)a3;
- (void)setDeliveryServicesBySenderID:(id)a3;
- (void)setDeliveryServicesBySenderProperties:(id)a3;
- (void)setFallbackDeliveryService:(id)a3;
- (void)setShouldIgnoreSenderProperties:(BOOL)a3;
- (void)tearDown;
@end

@implementation RCPEventDeliveryServicePool

- (void)tearDown
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableDictionary *)self->_deliveryServicesBySenderID copy];
  v4 = (void *)[(NSMutableDictionary *)self->_deliveryServicesBySenderProperties copy];
  [(NSMutableDictionary *)self->_deliveryServicesBySenderID removeAllObjects];
  [(NSMutableDictionary *)self->_deliveryServicesBySenderProperties removeAllObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [v3 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) stop];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = objc_msgSend(v4, "allValues", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) stop];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)prewarmForSenderProperties:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v8 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = [(RCPEventDeliveryServicePool *)self _findServiceForSenderProperties:v6];
  id v10 = 0;
  [v7 startWithError:&v10];
  id v8 = v10;

  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v8 == 0;
}

- (id)deliveryServiceForSenderProperties:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCPEventDeliveryServicePool *)self shouldIgnoreSenderProperties];
  if (!v4 || v5)
  {
    uint64_t v7 = RCPLogPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9051000, v7, OS_LOG_TYPE_DEFAULT, "properties were nil, or ignoring properties set. Falling back to a platform specific default sender.", buf, 2u);
    }

    id v8 = RCPLogPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9051000, v8, OS_LOG_TYPE_DEFAULT, "defaulting to touch screen digitizer sender", v11, 2u);
    }

    uint64_t v9 = +[RCPEventSenderProperties touchScreenDigitizerSender];
    id v6 = [(RCPEventDeliveryServicePool *)self _findServiceForSenderProperties:v9];
  }
  else
  {
    id v6 = [(RCPEventDeliveryServicePool *)self _findServiceForSenderProperties:v4];
  }
  if (([v6 isRunning] & 1) == 0) {
    [v6 startWithError:0];
  }

  return v6;
}

- (BOOL)shouldIgnoreSenderProperties
{
  return self->_shouldIgnoreSenderProperties;
}

- (id)_findServiceForSenderProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 senderID];
  if (v5)
  {
    uint64_t v6 = v5;
    deliveryServicesBySenderID = self->_deliveryServicesBySenderID;
    id v8 = [NSNumber numberWithUnsignedLongLong:v5];
    uint64_t v9 = [(NSMutableDictionary *)deliveryServicesBySenderID objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"recap-%llX", v6);
      uint64_t v9 = +[RCPVirtualHIDService serviceWithIdentifier:v10 properties:v4];

      uint64_t v11 = RCPLogPlayback();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v17 = v9;
        _os_log_impl(&dword_1A9051000, v11, OS_LOG_TYPE_DEFAULT, "new virtual service %{public}@", buf, 0xCu);
      }

      uint64_t v12 = self->_deliveryServicesBySenderID;
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v6];
      [(NSMutableDictionary *)v12 setObject:v9 forKeyedSubscript:v13];
    }
  }
  else
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_deliveryServicesBySenderProperties objectForKeyedSubscript:v4];
    if (!v9)
    {
      uint64_t v9 = +[RCPVirtualHIDService serviceWithIdentifier:@"recapulon" properties:v4];
      uint64_t v14 = RCPLogPlayback();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v17 = v9;
        _os_log_impl(&dword_1A9051000, v14, OS_LOG_TYPE_DEFAULT, "new virtual service %{public}@", buf, 0xCu);
      }

      [(NSMutableDictionary *)self->_deliveryServicesBySenderProperties setObject:v9 forKeyedSubscript:v4];
    }
  }

  return v9;
}

- (RCPEventDeliveryServicePool)init
{
  v9.receiver = self;
  v9.super_class = (Class)RCPEventDeliveryServicePool;
  v2 = [(RCPEventDeliveryServicePool *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldIgnoreSenderProperties = 0;
    uint64_t v4 = objc_opt_new();
    deliveryServicesBySenderID = v3->_deliveryServicesBySenderID;
    v3->_deliveryServicesBySenderID = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    deliveryServicesBySenderProperties = v3->_deliveryServicesBySenderProperties;
    v3->_deliveryServicesBySenderProperties = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)setShouldIgnoreSenderProperties:(BOOL)a3
{
  self->_shouldIgnoreSenderProperties = a3;
}

- (NSMutableDictionary)deliveryServicesBySenderID
{
  return self->_deliveryServicesBySenderID;
}

- (void)setDeliveryServicesBySenderID:(id)a3
{
}

- (NSMutableDictionary)deliveryServicesBySenderProperties
{
  return self->_deliveryServicesBySenderProperties;
}

- (void)setDeliveryServicesBySenderProperties:(id)a3
{
}

- (RCPEventDeliveryService)fallbackDeliveryService
{
  return self->_fallbackDeliveryService;
}

- (void)setFallbackDeliveryService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackDeliveryService, 0);
  objc_storeStrong((id *)&self->_deliveryServicesBySenderProperties, 0);
  objc_storeStrong((id *)&self->_deliveryServicesBySenderID, 0);
}

@end