@interface MRCompanionLinkClient
+ (id)sharedCompanionLinkClient;
+ (id)sharedIDSCompanionLinkClient;
+ (void)rapportCompanionLinkClient:(id)a3;
- (MRCompanionLinkClient)initWithOptions:(int)a3;
- (NSArray)companionLinkDevices;
- (NSMutableDictionary)eventCallbacks;
- (NSMutableDictionary)requestCallbacks;
- (RPCompanionLinkClient)connection;
- (id)_resolveEventID:(id)a3;
- (id)deviceUIDForRapportUID:(id)a3;
- (id)nameForUID:(id)a3;
- (id)rapportUIDForDeviceUID:(id)a3;
- (id)registerEvent:(id)a3 callback:(id)a4;
- (id)registerRequest:(id)a3 callback:(id)a4;
- (void)_enqueueEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6;
- (void)_enqueueRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8;
- (void)_handleEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 response:(id)a6;
- (void)_registerEvent:(id)a3;
- (void)_registerRequest:(id)a3;
- (void)_sendEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6;
- (void)_sendRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8;
- (void)removeCallback:(id)a3;
- (void)sendEvent:(id)a3 destination:(id)a4 userInfo:(id)a5;
- (void)sendEvent:(id)a3 toDevicesOfHomeUser:(id)a4 userInfo:(id)a5;
- (void)sendEventToCompanion:(id)a3 userInfo:(id)a4;
- (void)sendEventToHome:(id)a3 userInfo:(id)a4;
- (void)sendRequest:(id)a3 destination:(id)a4 userInfo:(id)a5 timeout:(double)a6 response:(id)a7;
- (void)setConnection:(id)a3;
- (void)setEventCallbacks:(id)a3;
- (void)setRequestCallbacks:(id)a3;
@end

@implementation MRCompanionLinkClient

+ (id)sharedCompanionLinkClient
{
  if (sharedCompanionLinkClient_onceToken != -1) {
    dispatch_once(&sharedCompanionLinkClient_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedCompanionLinkClient___connection;

  return v2;
}

uint64_t __50__MRCompanionLinkClient_sharedCompanionLinkClient__block_invoke()
{
  sharedCompanionLinkClient___connection = [[MRCompanionLinkClient alloc] initWithOptions:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedIDSCompanionLinkClient
{
  if (sharedIDSCompanionLinkClient_onceToken != -1) {
    dispatch_once(&sharedIDSCompanionLinkClient_onceToken, &__block_literal_global_85);
  }
  return 0;
}

+ (void)rapportCompanionLinkClient:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F946E0]);
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.companionLinkClient", v5);
  [v4 setDispatchQueue:v6];

  [v4 setInvalidationHandler:&__block_literal_global_89];
  [v4 setInterruptionHandler:&__block_literal_global_92];
  v7 = [[MRBlockGuard alloc] initWithTimeout:@"CompanionLinkClient:activate" reason:&__block_literal_global_100 handler:30.0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_101;
  v11[3] = &unk_1E57D19B0;
  id v13 = v4;
  id v14 = v3;
  v12 = v7;
  id v8 = v4;
  id v9 = v3;
  v10 = v7;
  [v8 activateWithCompletion:v11];
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke()
{
  v0 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_cold_1(v0);
  }
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_90()
{
  v0 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_90_cold_1(v0);
  }
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_97(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_97_cold_1((uint64_t)v2, v3);
  }
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_101(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] disarm];
  id v4 = _MRLogForCategory(7uLL);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_101_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] CompanionLinkClient activated", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_102;
  v6[3] = &unk_1E57D0DB8;
  id v8 = a1[6];
  id v7 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (MRCompanionLinkClient)initWithOptions:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MRCompanionLinkClient;
  id v3 = [(MRCompanionLinkClient *)&v8 init];
  id v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__MRCompanionLinkClient_initWithOptions___block_invoke;
    v6[3] = &unk_1E57D19D8;
    id v7 = v3;
    +[MRCompanionLinkClient rapportCompanionLinkClient:v6];
  }
  return v4;
}

uint64_t __41__MRCompanionLinkClient_initWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setConnection:a2];
}

- (void)setConnection:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  v5 = self;
  objc_sync_enter(v5);
  dispatch_queue_t v6 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v61 = v38;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Setting Connection %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v5->_connection, a3);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = v5->_pendingRegisteredEvents;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v7);
        }
        -[MRCompanionLinkClient _registerEvent:](v5, "_registerEvent:", *(void *)(*((void *)&v52 + 1) + 8 * i), v38);
      }
      uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v8);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v11 = v5->_pendingRegisteredRequests;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v11);
        }
        -[MRCompanionLinkClient _registerRequest:](v5, "_registerRequest:", *(void *)(*((void *)&v48 + 1) + 8 * j), v38);
      }
      uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v12);
  }

  pendingRegisteredEvents = v5->_pendingRegisteredEvents;
  v5->_pendingRegisteredEvents = 0;

  pendingRegisteredRequests = v5->_pendingRegisteredRequests;
  v5->_pendingRegisteredRequests = 0;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v17 = v5->_pendingEvents;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        v22 = objc_msgSend(v21, "eventID", v38);
        v23 = [v21 userInfo];
        v24 = [v21 destination];
        v25 = [v21 uid];
        [(MRCompanionLinkClient *)v5 _sendEvent:v22 userInfo:v23 destination:v24 uid:v25];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v18);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v5->_pendingRequests;
  uint64_t v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * m);
        v30 = objc_msgSend(v29, "eventID", v38);
        v31 = [v29 userInfo];
        v32 = [v29 destination];
        v33 = [v29 uid];
        v34 = [v29 date];
        v35 = [v29 callback];
        [(MRCompanionLinkClient *)v5 _sendRequest:v30 userInfo:v31 destination:v32 uid:v33 date:v34 response:v35];
      }
      uint64_t v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v26);
  }

  pendingEvents = v5->_pendingEvents;
  v5->_pendingEvents = 0;

  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = 0;

  objc_sync_exit(v5);
}

- (id)deviceUIDForRapportUID:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  dispatch_queue_t v6 = [(RPCompanionLinkClient *)v5->_connection activeDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (!v7)
  {
    uint64_t v19 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      v11 = [v10 effectiveIdentifier];
      int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        uint64_t v19 = [v10 mediaRouteIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v21;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to effectiveIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      uint64_t v13 = [v10 identifier];
      int v14 = [v13 isEqualToString:v4];

      if (v14)
      {
        uint64_t v19 = [v10 mediaRouteIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v22;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to identifier <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      v15 = [v10 mediaRouteIdentifier];
      int v16 = [v15 isEqualToString:v4];

      if (v16)
      {
        uint64_t v19 = [v10 mediaRouteIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v23 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v23;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to mediaRouteIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      v17 = [v10 mediaRemoteIdentifier];
      int v18 = [v17 isEqualToString:v4];

      if (v18)
      {
        uint64_t v19 = [v10 mediaRouteIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v25 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v25;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to mediaRemoteIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
    uint64_t v19 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_23:

  objc_sync_exit(v5);

  return v19;
}

- (id)rapportUIDForDeviceUID:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  dispatch_queue_t v6 = [(RPCompanionLinkClient *)v5->_connection activeDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (!v7)
  {
    uint64_t v19 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      v11 = [v10 mediaRouteIdentifier];
      int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        uint64_t v19 = [v10 effectiveIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v21;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped deviceUID <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      uint64_t v13 = [v10 effectiveIdentifier];
      int v14 = [v13 isEqualToString:v4];

      if (v14)
      {
        uint64_t v19 = [v10 effectiveIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v22;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped effectiveIdentifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      v15 = [v10 identifier];
      int v16 = [v15 isEqualToString:v4];

      if (v16)
      {
        uint64_t v19 = [v10 effectiveIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v23 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v23;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped identifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
        goto LABEL_22;
      }
      v17 = [v10 mediaRemoteIdentifier];
      int v18 = [v17 isEqualToString:v4];

      if (v18)
      {
        uint64_t v19 = [v10 effectiveIdentifier];
        v20 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v25 = [v10 name];
          *(_DWORD *)buf = 138543874;
          id v31 = v4;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v25;
          _os_log_debug_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped mediaRemoteIdentifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
    uint64_t v19 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_23:

  objc_sync_exit(v5);

  return v19;
}

- (id)nameForUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  dispatch_queue_t v6 = [(RPCompanionLinkClient *)v5->_connection activeDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v11 = [v10 mediaRouteIdentifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12) {
          goto LABEL_13;
        }
        uint64_t v13 = [v10 effectiveIdentifier];
        int v14 = [v13 isEqualToString:v4];

        if (v14) {
          goto LABEL_13;
        }
        v15 = [v10 identifier];
        char v16 = [v15 isEqualToString:v4];

        if ((v16 & 1) == 0)
        {
          v17 = [v10 mediaRemoteIdentifier];
          char v18 = [v17 isEqualToString:v4];

          if ((v18 & 1) == 0) {
            continue;
          }
        }
LABEL_13:
        uint64_t v19 = [v10 name];
        goto LABEL_15;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v19 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_15:

  objc_sync_exit(v5);

  return v19;
}

- (id)registerEvent:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_eventCallbacks objectForKey:v6];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventCallbacks = v8->_eventCallbacks;
    if (!eventCallbacks)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v12 = v8->_eventCallbacks;
      v8->_eventCallbacks = v11;

      eventCallbacks = v8->_eventCallbacks;
    }
    [(NSMutableDictionary *)eventCallbacks setObject:v9 forKey:v6];
  }
  uint64_t v13 = (void *)[v7 copy];
  int v14 = (void *)MEMORY[0x1997190F0]();
  [v9 addObject:v14];

  if (v8->_connection)
  {
    [(MRCompanionLinkClient *)v8 _registerEvent:v6];
  }
  else
  {
    pendingRegisteredEvents = v8->_pendingRegisteredEvents;
    if (!pendingRegisteredEvents)
    {
      char v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v17 = v8->_pendingRegisteredEvents;
      v8->_pendingRegisteredEvents = v16;

      pendingRegisteredEvents = v8->_pendingRegisteredEvents;
    }
    [(NSMutableSet *)pendingRegisteredEvents addObject:v6];
  }
  char v18 = (void *)MEMORY[0x1997190F0](v13);

  objc_sync_exit(v8);

  return v18;
}

- (id)registerRequest:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  v10 = [(NSMutableDictionary *)v9->_requestCallbacks objectForKey:v7];
  if (v10)
  {
    if (!v8) {
      goto LABEL_8;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, v9, @"MRCompanionLinkClient.m", 316, @"Duplicate request handler for %@", v7 object file lineNumber description];
  }
  else
  {
    if (!v9->_requestCallbacks)
    {
      int v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      requestCallbacks = v9->_requestCallbacks;
      v9->_requestCallbacks = v12;
    }
    v10 = (void *)[v8 copy];
    int v14 = v9->_requestCallbacks;
    v11 = (void *)MEMORY[0x1997190F0]();
    [(NSMutableDictionary *)v14 setObject:v11 forKey:v7];
  }

LABEL_8:
  if (v9->_connection)
  {
    [(MRCompanionLinkClient *)v9 _registerRequest:v7];
  }
  else
  {
    pendingRegisteredRequests = v9->_pendingRegisteredRequests;
    if (!pendingRegisteredRequests)
    {
      char v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v17 = v9->_pendingRegisteredRequests;
      v9->_pendingRegisteredRequests = v16;

      pendingRegisteredRequests = v9->_pendingRegisteredRequests;
    }
    [(NSMutableSet *)pendingRegisteredRequests addObject:v7];
  }
  char v18 = (void *)MEMORY[0x1997190F0](v10);

  objc_sync_exit(v9);

  return v18;
}

- (void)removeCallback:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(NSMutableDictionary *)v5->_eventCallbacks allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1997190F0](v4);
        [v10 removeObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__4;
  long long v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  requestCallbacks = v5->_requestCallbacks;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  char v16 = __40__MRCompanionLinkClient_removeCallback___block_invoke;
  v17 = &unk_1E57D1A00;
  id v13 = v4;
  id v18 = v13;
  uint64_t v19 = &v20;
  [(NSMutableDictionary *)requestCallbacks enumerateKeysAndObjectsUsingBlock:&v14];
  if (v21[5]) {
    -[NSMutableDictionary removeObjectForKey:](v5->_requestCallbacks, "removeObjectForKey:", v14, v15, v16, v17);
  }

  _Block_object_dispose(&v20, 8);
  objc_sync_exit(v5);
}

void __40__MRCompanionLinkClient_removeCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)_registerEvent:(id)a3
{
  id v4 = a3;
  registeredEvents = self->_registeredEvents;
  if (!registeredEvents)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_registeredEvents;
    self->_registeredEvents = v6;

    registeredEvents = self->_registeredEvents;
  }
  if (([(NSMutableSet *)registeredEvents containsObject:v4] & 1) == 0)
  {
    objc_initWeak(&location, self);
    connection = self->_connection;
    id v9 = [(MRCompanionLinkClient *)self _resolveEventID:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__MRCompanionLinkClient__registerEvent___block_invoke;
    v11[3] = &unk_1E57D1A28;
    objc_copyWeak(&v13, &location);
    id v10 = v4;
    id v12 = v10;
    [(RPCompanionLinkClient *)connection registerEventID:v9 options:0 handler:v11];

    [(NSMutableSet *)self->_registeredEvents addObject:v10];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __40__MRCompanionLinkClient__registerEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleEventID:*(void *)(a1 + 32) event:v8 options:v5];
  }
}

- (void)_registerRequest:(id)a3
{
  id v4 = a3;
  registeredRequests = self->_registeredRequests;
  if (!registeredRequests)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_registeredRequests;
    self->_registeredRequests = v6;

    registeredRequests = self->_registeredRequests;
  }
  if (([(NSMutableSet *)registeredRequests containsObject:v4] & 1) == 0)
  {
    objc_initWeak(&location, self);
    connection = self->_connection;
    id v9 = [(MRCompanionLinkClient *)self _resolveEventID:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__MRCompanionLinkClient__registerRequest___block_invoke;
    v11[3] = &unk_1E57D1A78;
    objc_copyWeak(&v13, &location);
    id v10 = v4;
    id v12 = v10;
    [(RPCompanionLinkClient *)connection registerRequestID:v9 options:0 handler:v11];

    [(NSMutableSet *)self->_registeredRequests addObject:v10];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __42__MRCompanionLinkClient__registerRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__MRCompanionLinkClient__registerRequest___block_invoke_2;
    v13[3] = &unk_1E57D1A50;
    id v14 = v9;
    [WeakRetained _handleRequestID:v11 request:v7 options:v8 response:v13];
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(4);
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, Error);
  }
}

uint64_t __42__MRCompanionLinkClient__registerRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendEventToHome:(id)a3 userInfo:(id)a4
{
}

- (void)sendEventToCompanion:(id)a3 userInfo:(id)a4
{
}

- (void)sendEvent:(id)a3 toDevicesOfHomeUser:(id)a4 userInfo:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  uint64_t v22 = self;
  id v23 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [(RPCompanionLinkClient *)self->_connection activeDevices];
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v13 = [v12 homeKitUserIdentifiers];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = [*(id *)(*((void *)&v26 + 1) + 8 * j) UUIDString];
              int v19 = [v18 isEqualToString:v8];

              if (v19)
              {
                uint64_t v20 = [v12 effectiveIdentifier];
                [(MRCompanionLinkClient *)v22 sendEvent:v24 destination:v20 userInfo:v23];

                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }
}

- (void)sendEvent:(id)a3 destination:(id)a4 userInfo:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)[v9 copy];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];

  id v13 = self;
  objc_sync_enter(v13);
  if (v13->_connection) {
    [(MRCompanionLinkClient *)v13 _sendEvent:v14 userInfo:v10 destination:v8 uid:v12];
  }
  else {
    [(MRCompanionLinkClient *)v13 _enqueueEvent:v14 userInfo:v10 destination:v8 uid:v12];
  }
  objc_sync_exit(v13);
}

- (void)sendRequest:(id)a3 destination:(id)a4 userInfo:(id)a5 timeout:(double)a6 response:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = (void *)[v13 copy];
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v16 UUIDString];

  id v18 = [MEMORY[0x1E4F1C9C8] date];
  int v19 = [MRBlockGuard alloc];
  uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", v11, v17];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke;
  v38[3] = &unk_1E57D0FE8;
  id v21 = v14;
  id v39 = v21;
  uint64_t v22 = [(MRBlockGuard *)v19 initWithTimeout:v20 reason:v38 handler:a6];

  id v23 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v41 = v11;
    __int16 v42 = 2114;
    long long v43 = v17;
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v46 = 2112;
    id v47 = v13;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Request: %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke_125;
  v32[3] = &unk_1E57D1AA0;
  id v24 = v22;
  long long v33 = v24;
  id v25 = v18;
  id v34 = v25;
  id v26 = v11;
  id v35 = v26;
  id v27 = v17;
  id v36 = v27;
  id v28 = v21;
  id v37 = v28;
  long long v29 = (void *)MEMORY[0x1997190F0](v32);
  long long v30 = self;
  objc_sync_enter(v30);
  if (v30->_connection) {
    [(MRCompanionLinkClient *)v30 _sendRequest:v26 userInfo:v15 destination:v12 uid:v27 date:v25 response:v29];
  }
  else {
    [(MRCompanionLinkClient *)v30 _enqueueRequest:v26 userInfo:v15 destination:v12 uid:v27 date:v25 response:v29];
  }
  objc_sync_exit(v30);
}

uint64_t __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) disarm])
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
    id v9 = v8;

    uint64_t v10 = _MRLogForCategory(7uLL);
    id v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 56);
        int v17 = 138544130;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        uint64_t v20 = v13;
        __int16 v21 = 2114;
        id v22 = v6;
        __int16 v23 = 2048;
        id v24 = v9;
        _os_log_error_impl(&dword_194F3C000, v11, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Response: %{public}@<%{public}@> returned error <%{public}@> in <%lf> seconds", (uint8_t *)&v17, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      int v17 = 138544130;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Response: %{public}@<%{public}@> returned in <%lf> seconds with %{public}@@", (uint8_t *)&v17, 0x2Au);
    }

    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
    }
  }
}

- (void)_sendEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = +[MROrigin localOrigin];
  uint64_t v16 = +[MRDeviceInfoRequest deviceInfoForOrigin:v15];

  int v17 = [v16 data];
  [v14 setObject:v17 forKeyedSubscript:@"deviceInfoData"];

  [v14 setObject:v13 forKeyedSubscript:@"uid"];
  if (v11)
  {
    uint64_t v18 = MRCreateEncodedUserInfo(v11);
    [v14 setObject:v18 forKeyedSubscript:@"userInfoData"];
  }
  __int16 v19 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Sending event %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  connection = self->_connection;
  __int16 v21 = [(MRCompanionLinkClient *)self _resolveEventID:v10];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke;
  v25[3] = &unk_1E57D1AC8;
  id v26 = v10;
  id v27 = v13;
  id v28 = v12;
  id v22 = v12;
  id v23 = v13;
  id v24 = v10;
  [(RPCompanionLinkClient *)connection sendEventID:v21 event:v14 destinationID:v22 options:0 completion:v25];
}

void __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke_cold_1();
    }
  }
}

- (void)_enqueueEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Enqueing event %{public}@<%{public}@> to destination <%@> with userInfo %@", (uint8_t *)&v18, 0x2Au);
  }

  if (!self->_pendingEvents)
  {
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingEvents = self->_pendingEvents;
    self->_pendingEvents = v15;
  }
  int v17 = objc_alloc_init(MRCompanionLinkClientEvent);
  [(MRCompanionLinkClientEvent *)v17 setEventID:v10];
  [(MRCompanionLinkClientEvent *)v17 setUserInfo:v11];
  [(MRCompanionLinkClientEvent *)v17 setDestination:v12];
  [(MRCompanionLinkClientEvent *)v17 setUid:v13];
  [(NSMutableArray *)self->_pendingEvents addObject:v17];
}

- (void)_sendRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = +[MROrigin localOrigin];
  __int16 v20 = +[MRDeviceInfoRequest deviceInfoForOrigin:v19];

  id v21 = [v20 data];
  [v18 setObject:v21 forKeyedSubscript:@"deviceInfoData"];

  [v18 setObject:v16 forKeyedSubscript:@"uid"];
  if (v14)
  {
    __int16 v22 = MRCreateEncodedUserInfo(v14);
    [v18 setObject:v22 forKeyedSubscript:@"userInfoData"];
  }
  id v23 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v30 = v13;
    __int16 v31 = 2114;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Sending request %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  connection = self->_connection;
  id v25 = [(MRCompanionLinkClient *)self _resolveEventID:v13];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__MRCompanionLinkClient__sendRequest_userInfo_destination_uid_date_response___block_invoke;
  v27[3] = &unk_1E57D1AF0;
  id v28 = v17;
  id v26 = v17;
  [(RPCompanionLinkClient *)connection sendRequestID:v25 request:v18 destinationID:v15 options:0 responseHandler:v27];
}

void __77__MRCompanionLinkClient__sendRequest_userInfo_destination_uid_date_response___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  MRCreateDecodedUserInfo(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);
}

- (void)_enqueueRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a7;
  __int16 v20 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138544130;
    id v25 = v14;
    __int16 v26 = 2114;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Enqueing request %{public}@<%{public}@> to destination <%@> with userInfo %@", (uint8_t *)&v24, 0x2Au);
  }

  if (!self->_pendingRequests)
  {
    id v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingRequests = self->_pendingRequests;
    self->_pendingRequests = v21;
  }
  id v23 = objc_alloc_init(MRCompanionLinkClientRequest);
  [(MRCompanionLinkClientEvent *)v23 setEventID:v14];
  [(MRCompanionLinkClientEvent *)v23 setUserInfo:v15];
  [(MRCompanionLinkClientEvent *)v23 setDestination:v16];
  [(MRCompanionLinkClientEvent *)v23 setUid:v17];
  [(MRCompanionLinkClientRequest *)v23 setDate:v19];

  [(MRCompanionLinkClientRequest *)v23 setCallback:v18];
  [(NSMutableArray *)self->_pendingRequests addObject:v23];
}

- (void)_handleEventID:(id)a3 event:(id)a4 options:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v7 = a4;
  id v8 = a5;
  __int16 v30 = (void *)*MEMORY[0x1E4F947A0];
  id v31 = v8;
  id v9 = objc_msgSend(v8, "objectForKeyedSubscript:");
  id v10 = [MRDeviceInfo alloc];
  id v11 = [v7 objectForKeyedSubscript:@"deviceInfoData"];
  id v12 = [(MRDeviceInfo *)v10 initWithData:v11];

  id v13 = [v7 objectForKeyedSubscript:@"userInfoData"];
  id v36 = MRCreateDecodedUserInfo(v13);

  __int16 v33 = [v7 objectForKeyedSubscript:@"uid"];
  __int16 v35 = [(MRDeviceInfo *)v12 deviceUID];
  id v34 = [(MRDeviceInfo *)v12 name];
  id v14 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    id v48 = v37;
    __int16 v49 = 2114;
    long long v50 = v33;
    __int16 v51 = 2114;
    long long v52 = v35;
    __int16 v53 = 2114;
    long long v54 = v34;
    __int16 v55 = 2112;
    v56 = v30;
    __int16 v57 = 2114;
    v58 = v9;
    __int16 v59 = 2112;
    v60 = v36;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Received event %{public}@<%{public}@> from <%{public}@> (%{public}@) with %@ <%{public}@> userInfo %@", buf, 0x48u);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = [(RPCompanionLinkClient *)self->_connection activeDevices];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v43;
LABEL_5:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v43 != v17) {
        objc_enumerationMutation(v15);
      }
      id v19 = *(void **)(*((void *)&v42 + 1) + 8 * v18);
      __int16 v20 = [v19 effectiveIdentifier];
      char v21 = [v20 isEqualToString:v9];

      if (v21) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v16) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    __int16 v22 = v19;

    if (!v22) {
      goto LABEL_15;
    }
    id v23 = self;
    objc_sync_enter(v23);
    int v24 = [(NSMutableDictionary *)v23->_eventCallbacks objectForKey:v37];
    id v25 = (void *)[v24 copy];

    objc_sync_exit(v23);
    if (v36) {
      id v26 = (id)[v36 mutableCopy];
    }
    else {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v27 = v26;
    [v26 setObject:v9 forKeyedSubscript:v30];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MRCompanionLinkClient__handleEventID_event_options___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v39 = v25;
    long long v40 = v12;
    id v41 = v27;
    id v28 = v27;
    id v29 = v25;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
LABEL_11:

LABEL_15:
    __int16 v22 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      id v48 = v37;
      __int16 v49 = 2114;
      long long v50 = v35;
      __int16 v51 = 2114;
      long long v52 = v34;
      __int16 v53 = 2112;
      long long v54 = v30;
      __int16 v55 = 2112;
      v56 = v9;
      _os_log_error_impl(&dword_194F3C000, v22, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Received event <%{public}@> from <%{public}@> (%{public}@) with <%@> <%@> but could not find device", buf, 0x34u);
    }
  }
}

void __54__MRCompanionLinkClient__handleEventID_event_options___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 response:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v42 = a4;
  id v10 = a5;
  id v36 = a6;
  uint64_t v34 = *MEMORY[0x1E4F947A0];
  __int16 v35 = v10;
  uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:");
  id v12 = [MRDeviceInfo alloc];
  id v13 = [v42 objectForKeyedSubscript:@"deviceInfoData"];
  id v41 = [(MRDeviceInfo *)v12 initWithData:v13];

  id v14 = [v42 objectForKeyedSubscript:@"userInfoData"];
  long long v40 = MRCreateDecodedUserInfo(v14);

  id v15 = [v42 objectForKeyedSubscript:@"uid"];
  id v38 = [(MRDeviceInfo *)v41 deviceUID];
  id v37 = [(MRDeviceInfo *)v41 name];
  uint64_t v16 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    id v58 = v9;
    __int16 v59 = 2114;
    v60 = v15;
    __int16 v61 = 2114;
    uint64_t v62 = v38;
    __int16 v63 = 2114;
    v64 = v37;
    __int16 v65 = 2112;
    uint64_t v66 = v34;
    __int16 v67 = 2114;
    v68 = v11;
    __int16 v69 = 2112;
    v70 = v40;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Received request %{public}@<%{public}@> from <%{public}@> (%{public}@) with %@ <%{public}@> userInfo %@", buf, 0x48u);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  uint64_t v17 = [(RPCompanionLinkClient *)self->_connection activeDevices];
  id v18 = (id)[v17 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v17);
        }
        char v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        __int16 v22 = [v21 effectiveIdentifier];
        int v23 = [v22 isEqualToString:v11];

        if (v23)
        {
          id v18 = v21;
          goto LABEL_13;
        }
      }
      id v18 = (id)[v17 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke;
  v48[3] = &unk_1E57D1B40;
  id v24 = v9;
  id v49 = v24;
  id v25 = v15;
  id v50 = v25;
  id v26 = v36;
  id v51 = v26;
  id v27 = (void (**)(void, void, void))MEMORY[0x1997190F0](v48);
  if (v18)
  {
    id v28 = self;
    objc_sync_enter(v28);
    id v29 = [(NSMutableDictionary *)v28->_requestCallbacks objectForKey:v24];
    __int16 v30 = (void *)[v29 copy];

    objc_sync_exit(v28);
    if (v30)
    {
      if (v40) {
        id v31 = (id)[v40 mutableCopy];
      }
      else {
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      __int16 v33 = v31;
      [v31 setObject:v11 forKeyedSubscript:v34];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_132;
      block[3] = &unk_1E57D1B68;
      id v46 = v30;
      long long v44 = v41;
      id v45 = v33;
      id v47 = v27;
      id Error = v33;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      id Error = (id)MRMediaRemoteCreateError(14);
      ((void (**)(void, void, id))v27)[2](v27, 0, Error);
    }
  }
  else
  {
    __int16 v30 = (void *)MRMediaRemoteCreateError(4);
    ((void (**)(void, void, void *))v27)[2](v27, 0, v30);
  }
}

void __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = _MRLogForCategory(7uLL);
  long long v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Responding to request %{public}@<%{public}@> with <%{public}@>", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v11 = a1[6];
  id v12 = MRCreateEncodedUserInfo(v5);
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
}

uint64_t __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_132(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

- (id)_resolveEventID:(id)a3
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"com.apple.mediaremote.%@", v4];

  return v5;
}

- (NSArray)companionLinkDevices
{
  uint64_t v2 = [(MRCompanionLinkClient *)self connection];
  uint64_t v3 = [v2 activeDevices];

  return (NSArray *)v3;
}

- (RPCompanionLinkClient)connection
{
  return self->_connection;
}

- (NSMutableDictionary)eventCallbacks
{
  return self->_eventCallbacks;
}

- (void)setEventCallbacks:(id)a3
{
}

- (NSMutableDictionary)requestCallbacks
{
  return self->_requestCallbacks;
}

- (void)setRequestCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCallbacks, 0);
  objc_storeStrong((id *)&self->_eventCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_pendingRegisteredRequests, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);

  objc_storeStrong((id *)&self->_pendingRegisteredEvents, 0);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] CompanionLinkClient invalidation", v1, 2u);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_90_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] CompanionLinkClient interrupted", v1, 2u);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_97_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] %@", (uint8_t *)&v2, 0xCu);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_101_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Error activating CompanionLinkClient %{public}@", (uint8_t *)&v2, 0xCu);
}

void __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke_cold_1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_194F3C000, v3, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Error sending <%{public}@> <%{public}@> event to <%@> <%{public}@>", v4, 0x2Au);
}

void __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Responding to request %{public}@<%{public}@> with error <%{public}@>", v3, 0x20u);
}

@end