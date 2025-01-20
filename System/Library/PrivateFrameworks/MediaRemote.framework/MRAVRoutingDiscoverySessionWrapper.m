@interface MRAVRoutingDiscoverySessionWrapper
- (MRAVRoutingDiscoverySession)sharedSession;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRAVRoutingDiscoverySessionWrapper)initWithSession:(id)a3 configuration:(id)a4;
- (id)addEndpointsAddedCallback:(id)a3;
- (id)addEndpointsChangedCallback:(id)a3;
- (id)addEndpointsModifiedCallback:(id)a3;
- (id)addEndpointsRemovedCallback:(id)a3;
- (id)addOutputDevicesAddedCallback:(id)a3;
- (id)addOutputDevicesChangedCallback:(id)a3;
- (id)addOutputDevicesModifiedCallback:(id)a3;
- (id)addOutputDevicesRemovedCallback:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (unsigned)discoveryMode;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)reevaluateDiscoveryModeForSession:(id)a3;
- (void)removeEndpointsAddedCallback:(id)a3;
- (void)removeEndpointsChangedCallback:(id)a3;
- (void)removeEndpointsModifiedCallback:(id)a3;
- (void)removeEndpointsRemovedCallback:(id)a3;
- (void)removeOutputDevicesAddedCallback:(id)a3;
- (void)removeOutputDevicesChangedCallback:(id)a3;
- (void)removeOutputDevicesModifiedCallback:(id)a3;
- (void)removeOutputDevicesRemovedCallback:(id)a3;
- (void)setAlwaysAllowUpdates:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setPopulatesExternalDevice:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setSharedSession:(id)a3;
- (void)setTargetAudioSessionID:(unsigned int)a3;
- (void)transferCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferEndpointsAddedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferEndpointsChangedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferEndpointsModifiedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferEndpointsRemovedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferOutputDevicesAddedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferOutputDevicesChangedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferOutputDevicesModifiedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)transferOutputDevicesRemovedCallbacksFromSession:(id)a3 toSession:(id)a4;
- (void)updateObserversWithPreviousSession:(id)a3;
- (void)updateSharedSession;
@end

@implementation MRAVRoutingDiscoverySessionWrapper

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(MRAVRoutingDiscoverySession *)self->_sharedSession methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addOutputDevicesChangedCallback:v4];
  v7 = (void *)[v4 copy];
  v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_outputDevicesChangedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_outputDevicesTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (void)updateObserversWithPreviousSession:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 availableEndpoints];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    v8 = (void *)v5;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v53 = v8;

  v52 = v4;
  uint64_t v9 = [v4 availableOutputDevices];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v7;
  }
  id v12 = v11;

  v13 = [(MRAVRoutingDiscoverySession *)self->_sharedSession availableEndpoints];
  v14 = [(MRAVRoutingDiscoverySession *)self->_sharedSession availableOutputDevices];
  v15 = _MRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    v85 = self;
    __int16 v86 = 2048;
    uint64_t v87 = [v53 count];
    __int16 v88 = 2048;
    uint64_t v89 = [v13 count];
    __int16 v90 = 2048;
    uint64_t v91 = [v12 count];
    __int16 v92 = 2048;
    uint64_t v93 = [v14 count];
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Notifying existing observers from %lu to %lu endpoints and from %lu to %lu output devices", buf, 0x34u);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v16 = self->_endpointsRemovedCallbacks;
  uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v75 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [(NSMutableDictionary *)self->_endpointsRemovedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        ((void (**)(void, id))v21)[2](v21, v53);
      }
      uint64_t v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v18);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v22 = self->_endpointsAddedCallbacks;
  uint64_t v23 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v71 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [(NSMutableDictionary *)self->_endpointsAddedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * j)];
        ((void (**)(void, void *))v27)[2](v27, v13);
      }
      uint64_t v24 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v24);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v28 = self->_endpointsChangedCallbacks;
  uint64_t v29 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v67 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [(NSMutableDictionary *)self->_endpointsChangedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * k)];
        ((void (**)(void, void *))v33)[2](v33, v13);
      }
      uint64_t v30 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v66 objects:v81 count:16];
    }
    while (v30);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v34 = self->_outputDevicesRemovedCallbacks;
  uint64_t v35 = [(NSMutableDictionary *)v34 countByEnumeratingWithState:&v62 objects:v80 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v63 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = [(NSMutableDictionary *)self->_outputDevicesRemovedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * m)];
        ((void (**)(void, id))v39)[2](v39, v12);
      }
      uint64_t v36 = [(NSMutableDictionary *)v34 countByEnumeratingWithState:&v62 objects:v80 count:16];
    }
    while (v36);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v40 = self->_outputDevicesAddedCallbacks;
  uint64_t v41 = [(NSMutableDictionary *)v40 countByEnumeratingWithState:&v58 objects:v79 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v59;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [(NSMutableDictionary *)self->_outputDevicesAddedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * n)];
        ((void (**)(void, void *))v45)[2](v45, v14);
      }
      uint64_t v42 = [(NSMutableDictionary *)v40 countByEnumeratingWithState:&v58 objects:v79 count:16];
    }
    while (v42);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v46 = self->_outputDevicesChangedCallbacks;
  uint64_t v47 = [(NSMutableDictionary *)v46 countByEnumeratingWithState:&v54 objects:v78 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v55;
    do
    {
      for (iuint64_t i = 0; ii != v48; ++ii)
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = [(NSMutableDictionary *)self->_outputDevicesChangedCallbacks objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * ii)];
        ((void (**)(void, void *))v51)[2](v51, v14);
      }
      uint64_t v48 = [(NSMutableDictionary *)v46 countByEnumeratingWithState:&v54 objects:v78 count:16];
    }
    while (v48);
  }
}

- (void)setRoutingContextUID:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MRAVRoutingDiscoverySessionConfiguration *)v4->_configuration routingContextUID];

  if (v5 != v6)
  {
    [(MRAVRoutingDiscoverySessionConfiguration *)v4->_configuration setRoutingContextUID:v6];
    [(MRAVRoutingDiscoverySessionWrapper *)v4 updateSharedSession];
  }
  objc_sync_exit(v4);
}

- (void)updateSharedSession
{
  id v3 = +[MRAVRoutingDiscoverySession sharedDiscoverySessionForClass:objc_opt_class() configuration:self->_configuration];
  [(MRAVRoutingDiscoverySessionWrapper *)self setSharedSession:v3];
}

- (MRAVRoutingDiscoverySessionWrapper)initWithSession:(id)a3 configuration:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_storeStrong((id *)&self->_sharedSession, a3);
  id v8 = a4;
  uint64_t v9 = (MRAVRoutingDiscoverySessionConfiguration *)[v8 copy];

  configuratiouint64_t n = self->_configuration;
  self->_configuratiouint64_t n = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  endpointsChangedCallbacks = self->_endpointsChangedCallbacks;
  self->_endpointsChangedCallbacks = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  endpointsAddedCallbacks = self->_endpointsAddedCallbacks;
  self->_endpointsAddedCallbacks = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  endpointsRemovedCallbacks = self->_endpointsRemovedCallbacks;
  self->_endpointsRemovedCallbacks = v15;

  uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  endpointsModifiedCallbacks = self->_endpointsModifiedCallbacks;
  self->_endpointsModifiedCallbacks = v17;

  uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputDevicesChangedCallbacks = self->_outputDevicesChangedCallbacks;
  self->_outputDevicesChangedCallbacks = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputDevicesAddedCallbacks = self->_outputDevicesAddedCallbacks;
  self->_outputDevicesAddedCallbacks = v21;

  uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputDevicesRemovedCallbacks = self->_outputDevicesRemovedCallbacks;
  self->_outputDevicesRemovedCallbacks = v23;

  uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputDevicesModifiedCallbacks = self->_outputDevicesModifiedCallbacks;
  self->_outputDevicesModifiedCallbacks = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  endpointsTokensMap = self->_endpointsTokensMap;
  self->_endpointsTokensMap = v27;

  uint64_t v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputDevicesTokensMap = self->_outputDevicesTokensMap;
  self->_outputDevicesTokensMap = v29;

  uint64_t v31 = _MRLogForCategory(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    sharedSessiouint64_t n = self->_sharedSession;
    int v34 = 134218242;
    uint64_t v35 = self;
    __int16 v36 = 2114;
    uint64_t v37 = sharedSession;
    _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Init with shared session: %{public}@", (uint8_t *)&v34, 0x16u);
  }

  [(MRAVRoutingDiscoverySessionWrapper *)self updateObserversWithPreviousSession:0];
  return self;
}

- (void)setSharedSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_sharedSessiouint64_t n = (id *)&v6->_sharedSession;
  sharedSessiouint64_t n = v6->_sharedSession;
  if (sharedSession)
  {
    id v9 = sharedSession;
    objc_sync_enter(v9);
    v10 = [*p_sharedSession clientDiscoveryStates];
    [v10 removeObjectForKey:v6];

    [(MRAVRoutingDiscoverySessionWrapper *)v6 transferCallbacksFromSession:*p_sharedSession toSession:v5];
    [(MRAVRoutingDiscoverySessionWrapper *)v6 reevaluateDiscoveryModeForSession:*p_sharedSession];
    objc_sync_exit(v9);

    sharedSessiouint64_t n = *p_sharedSession;
  }
  id v11 = sharedSession;
  objc_storeStrong((id *)&v6->_sharedSession, a3);
  if (*p_sharedSession)
  {
    id v12 = _MRLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = *p_sharedSession;
      int v14 = 134218242;
      v15 = v6;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Changed to shared session: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    [(MRAVRoutingDiscoverySessionWrapper *)v6 setDiscoveryMode:v6->_discoveryMode];
  }
  [(MRAVRoutingDiscoverySessionWrapper *)v6 updateObserversWithPreviousSession:v11];

  objc_sync_exit(v6);
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_discoveryMode = v3;
  id v4 = obj->_sharedSession;
  objc_sync_enter(v4);
  id v5 = [(MRAVRoutingDiscoverySession *)obj->_sharedSession clientDiscoveryStates];
  id v6 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v6 forKey:obj];

  [(MRAVRoutingDiscoverySessionWrapper *)obj reevaluateDiscoveryModeForSession:obj->_sharedSession];
  objc_sync_exit(v4);

  objc_sync_exit(obj);
}

- (void)reevaluateDiscoveryModeForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "clientDiscoveryStates", 0);
  id v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v8 <= [v11 intValue]) {
          uint64_t v8 = [v11 intValue];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  [v3 setDiscoveryMode:v8];
}

- (void)transferCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 134218498;
    v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Transferring callbacks from: %{public}@ to: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  [(MRAVRoutingDiscoverySessionWrapper *)self transferEndpointsChangedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferEndpointsAddedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferEndpointsRemovedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferEndpointsModifiedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferOutputDevicesChangedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferOutputDevicesAddedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferOutputDevicesRemovedCallbacksFromSession:v6 toSession:v7];
  [(MRAVRoutingDiscoverySessionWrapper *)self transferOutputDevicesModifiedCallbacksFromSession:v6 toSession:v7];
}

- (void)transferOutputDevicesRemovedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_outputDevicesRemovedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_outputDevicesTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_outputDevicesRemovedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeOutputDevicesRemovedCallback:v11];
        id v14 = [v16 addOutputDevicesRemovedCallback:v13];
        [(NSMutableDictionary *)self->_outputDevicesTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferOutputDevicesModifiedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_outputDevicesModifiedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_outputDevicesTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_outputDevicesModifiedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeOutputDevicesModifiedCallback:v11];
        id v14 = [v16 addOutputDevicesModifiedCallback:v13];
        [(NSMutableDictionary *)self->_outputDevicesTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferOutputDevicesChangedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_outputDevicesChangedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_outputDevicesTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_outputDevicesChangedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeOutputDevicesChangedCallback:v11];
        id v14 = [v16 addOutputDevicesChangedCallback:v13];
        [(NSMutableDictionary *)self->_outputDevicesTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferOutputDevicesAddedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_outputDevicesAddedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_outputDevicesTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_outputDevicesAddedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeOutputDevicesAddedCallback:v11];
        id v14 = [v16 addOutputDevicesAddedCallback:v13];
        [(NSMutableDictionary *)self->_outputDevicesTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferEndpointsRemovedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_endpointsRemovedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_endpointsTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_endpointsRemovedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeEndpointsRemovedCallback:v11];
        id v14 = [v16 addEndpointsRemovedCallback:v13];
        [(NSMutableDictionary *)self->_endpointsTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferEndpointsModifiedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_endpointsModifiedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_endpointsTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_endpointsModifiedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeEndpointsModifiedCallback:v11];
        id v14 = [v16 addEndpointsModifiedCallback:v13];
        [(NSMutableDictionary *)self->_endpointsTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferEndpointsChangedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_endpointsChangedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_endpointsTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_endpointsChangedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeEndpointsChangedCallback:v11];
        id v14 = [v16 addEndpointsChangedCallback:v13];
        [(NSMutableDictionary *)self->_endpointsTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)transferEndpointsAddedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_endpointsAddedCallbacks;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v11 = [(NSMutableDictionary *)self->_endpointsTokensMap objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_endpointsAddedCallbacks objectForKeyedSubscript:v10];
        __int16 v13 = (void *)MEMORY[0x1997190F0]();

        [v17 removeEndpointsAddedCallback:v11];
        id v14 = [v16 addEndpointsAddedCallback:v13];
        [(NSMutableDictionary *)self->_endpointsTokensMap setObject:v14 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (id)addEndpointsChangedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addEndpointsChangedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_endpointsChangedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_endpointsTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MRAVRoutingDiscoverySessionWrapper *)self sharedSession];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p> sharedSession: %@", v5, self, v6];

  return v7;
}

- (id)debugDescription
{
  return (id)[(MRAVRoutingDiscoverySession *)self->_sharedSession debugDescription];
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  if ([(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration targetAudioSessionID] != v3)
  {
    [(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration setTargetAudioSessionID:v3];
    [(MRAVRoutingDiscoverySessionWrapper *)obj updateSharedSession];
  }
  objc_sync_exit(obj);
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  if ([(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration alwaysAllowUpdates] != v3)
  {
    [(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration setAlwaysAllowUpdates:v3];
    [(MRAVRoutingDiscoverySessionWrapper *)obj updateSharedSession];
  }
  objc_sync_exit(obj);
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  if ([(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration populatesExternalDevice] != v3)
  {
    [(MRAVRoutingDiscoverySessionConfiguration *)obj->_configuration setPopulatesExternalDevice:v3];
    [(MRAVRoutingDiscoverySessionWrapper *)obj updateSharedSession];
  }
  objc_sync_exit(obj);
}

- (void)setConfiguration:(id)a3
{
  id v6 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(MRAVRoutingDiscoverySessionConfiguration *)v5->_configuration isEqual:v6])
  {
    objc_storeStrong((id *)&v5->_configuration, a3);
    [(MRAVRoutingDiscoverySessionWrapper *)v5 updateSharedSession];
  }
  objc_sync_exit(v5);
}

- (id)addEndpointsAddedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addEndpointsAddedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_endpointsAddedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_endpointsTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)addEndpointsRemovedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addEndpointsRemovedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_endpointsRemovedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_endpointsTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)addEndpointsModifiedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addEndpointsModifiedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_endpointsModifiedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_endpointsTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesAddedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addOutputDevicesAddedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_outputDevicesAddedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_outputDevicesTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesRemovedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addOutputDevicesRemovedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_outputDevicesRemovedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_outputDevicesTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesModifiedCallback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRAVRoutingDiscoverySession *)v5->_sharedSession addOutputDevicesModifiedCallback:v4];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v5->_outputDevicesModifiedCallbacks setObject:v8 forKeyedSubscript:v6];

  [(NSMutableDictionary *)v5->_outputDevicesTokensMap setObject:v6 forKeyedSubscript:v6];
  objc_sync_exit(v5);

  return v6;
}

- (void)removeEndpointsChangedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_endpointsTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeEndpointsChangedCallback:v7];
  [(NSMutableDictionary *)v4->_endpointsChangedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_endpointsTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeEndpointsAddedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_endpointsTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeEndpointsAddedCallback:v7];
  [(NSMutableDictionary *)v4->_endpointsAddedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_endpointsTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeEndpointsRemovedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_endpointsTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeEndpointsRemovedCallback:v7];
  [(NSMutableDictionary *)v4->_endpointsRemovedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_endpointsTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeEndpointsModifiedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_endpointsTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeEndpointsModifiedCallback:v7];
  [(NSMutableDictionary *)v4->_endpointsModifiedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_endpointsTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_outputDevicesTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeOutputDevicesChangedCallback:v7];
  [(NSMutableDictionary *)v4->_outputDevicesChangedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_outputDevicesTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesAddedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_outputDevicesTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeOutputDevicesAddedCallback:v7];
  [(NSMutableDictionary *)v4->_outputDevicesAddedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_outputDevicesTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesRemovedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_outputDevicesTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeOutputDevicesRemovedCallback:v7];
  [(NSMutableDictionary *)v4->_outputDevicesRemovedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_outputDevicesTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesModifiedCallback:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_outputDevicesTokensMap objectForKeyedSubscript:v8];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v8;
  }
  id v7 = v6;

  [(MRAVRoutingDiscoverySession *)v4->_sharedSession removeOutputDevicesModifiedCallback:v7];
  [(NSMutableDictionary *)v4->_outputDevicesModifiedCallbacks setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)v4->_outputDevicesTokensMap setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (void)dealloc
{
  [(MRAVRoutingDiscoverySessionWrapper *)self setSharedSession:0];
  v3.receiver = self;
  v3.super_class = (Class)MRAVRoutingDiscoverySessionWrapper;
  [(MRAVRoutingDiscoverySessionWrapper *)&v3 dealloc];
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (MRAVRoutingDiscoverySession)sharedSession
{
  return self->_sharedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputDevicesTokensMap, 0);
  objc_storeStrong((id *)&self->_endpointsTokensMap, 0);
  objc_storeStrong((id *)&self->_outputDevicesModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsAddedCallbacks, 0);

  objc_storeStrong((id *)&self->_endpointsChangedCallbacks, 0);
}

@end