@interface MRAVRoutingDiscoverySession
+ (NSMutableArray)discoverySessionFactories;
+ (id)discoverySessionWithConfiguration:(id)a3;
+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3;
+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3 enableThrottling:(BOOL)a4;
+ (id)sharedDiscoverySessionForClass:(Class)a3 configuration:(id)a4;
+ (void)registerDiscoverySessionFactory:(id)a3;
- (BOOL)alwaysAllowUpdates;
- (BOOL)alwaysLogUpdates;
- (BOOL)onlyDiscoversBluetoothDevices;
- (BOOL)populatesExternalDevice;
- (MRAVRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (MRAVRoutingDiscoverySession)initWithFeatures:(unsigned int)a3;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (NSArray)endpointsSnapshot;
- (NSArray)outputDevicesSnapshot;
- (NSMapTable)clientDiscoveryStates;
- (NSMutableDictionary)endpointsAddedCallbacks;
- (NSMutableDictionary)endpointsChangedCallbacks;
- (NSMutableDictionary)endpointsModifiedCallbacks;
- (NSMutableDictionary)endpointsRemovedCallbacks;
- (NSMutableDictionary)outputDevicesAddedCallbacks;
- (NSMutableDictionary)outputDevicesChangedCallbacks;
- (NSMutableDictionary)outputDevicesModifiedCallbacks;
- (NSMutableDictionary)outputDevicesRemovedCallbacks;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_determineAddedOutputDevices:(void *)a3 previousOutputDevices:;
- (id)_determineModifiedEndpoints:(void *)a3 previousEndpoints:;
- (id)_determineModifiedOutputDevices:(void *)a3 previousOutputDevices:;
- (id)_determineRemovedOutputDevices:(uint64_t)a3 previousOutputDevices:;
- (id)addEndpointsAddedCallback:(id)a3;
- (id)addEndpointsChangedCallback:(id)a3;
- (id)addEndpointsModifiedCallback:(id)a3;
- (id)addEndpointsRemovedCallback:(id)a3;
- (id)addOutputDevicesAddedCallback:(id)a3;
- (id)addOutputDevicesChangedCallback:(id)a3;
- (id)addOutputDevicesModifiedCallback:(id)a3;
- (id)addOutputDevicesRemovedCallback:(id)a3;
- (void)_performEndpointsCallbacks:(void *)a3 withEndpoints:(void *)a4 onQueue:;
- (void)_performOutputDevicesCallbacks:(void *)a3 withOutputDevices:(void *)a4 onQueue:;
- (void)logEndpointsChanged:(id)a3 oldEndpoints:(id)a4;
- (void)logOutputDevicesChanged:(id)a3 oldOutputDevices:(id)a4;
- (void)notifyAvailableEndpointsChanged:(id)a3 discoveredEndpoints:(id)a4;
- (void)notifyEndpointsChanged:(id)a3;
- (void)notifyOutputDevicesChanged:(id)a3;
- (void)removeEndpointsAddedCallback:(id)a3;
- (void)removeEndpointsChangedCallback:(id)a3;
- (void)removeEndpointsModifiedCallback:(id)a3;
- (void)removeEndpointsRemovedCallback:(id)a3;
- (void)removeOutputDevicesAddedCallback:(id)a3;
- (void)removeOutputDevicesChangedCallback:(id)a3;
- (void)removeOutputDevicesModifiedCallback:(id)a3;
- (void)removeOutputDevicesRemovedCallback:(id)a3;
- (void)setAlwaysAllowUpdates:(BOOL)a3;
- (void)setAlwaysLogUpdates:(BOOL)a3;
- (void)setClientDiscoveryStates:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEndpointsAddedCallbacks:(id)a3;
- (void)setEndpointsChangedCallbacks:(id)a3;
- (void)setEndpointsModifiedCallbacks:(id)a3;
- (void)setEndpointsRemovedCallbacks:(id)a3;
- (void)setEndpointsSnapshot:(id)a3;
- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3;
- (void)setOutputDevicesAddedCallbacks:(id)a3;
- (void)setOutputDevicesChangedCallbacks:(id)a3;
- (void)setOutputDevicesModifiedCallbacks:(id)a3;
- (void)setOutputDevicesRemovedCallbacks:(id)a3;
- (void)setOutputDevicesSnapshot:(id)a3;
- (void)setPopulatesExternalDevice:(BOOL)a3;
@end

@implementation MRAVRoutingDiscoverySession

void __52__MRAVRoutingDiscoverySession_setEndpointsSnapshot___block_invoke(uint64_t a1)
{
}

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 outputDeviceUIDs];
  v6 = [v4 outputDeviceUIDs];

  uint64_t v7 = [v5 isEqualToArray:v6] ^ 1;
  return v7;
}

uint64_t __56__MRAVRoutingDiscoverySession_endpointsChangedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __60__MRAVRoutingDiscoverySession_outputDevicesChangedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)notifyEndpointsChanged:(id)a3
{
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__27;
  v20 = __Block_byref_object_dispose__27;
  id v21 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  v15 = &v16;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke_2;
  v11[3] = &unk_1E57D03B0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_async(calloutQueue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __52__MRAVRoutingDiscoverySession_outputDevicesSnapshot__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__MRAVRoutingDiscoverySession_endpointsSnapshot__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__MRAVRoutingDiscoverySession_endpointsAddedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__MRAVRoutingDiscoverySession_endpointsModifiedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__MRAVRoutingDiscoverySession_endpointsRemovedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)notifyAvailableEndpointsChanged:(id)a3 discoveredEndpoints:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2 object:self file:@"MRAVRoutingDiscoverySession.m" lineNumber:637 description:@"Mismatch between available and discovered endpoint counts"];
  }
  unsigned int v10 = [(MRAVRoutingDiscoverySession *)self discoveryMode];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = [(MRAVRoutingDiscoverySession *)self alwaysAllowUpdates];
  }
  id v12 = [(MRAVRoutingDiscoverySession *)self endpointsSnapshot];
  v13 = objc_msgSend(v8, "mr_distantEndpoints");
  [(MRAVRoutingDiscoverySession *)self setEndpointsSnapshot:v13];
  if (v11)
  {
    id v47 = v8;
    unsigned int v46 = v10;
    uint64_t v45 = (uint64_t)v12;
    if (self->_previousEndpointsDiscoveryMode == v10)
    {
      id v14 = +[MRUserSettings currentSettings];
      int v48 = [v14 calculateDiscoveryUpdates] ^ 1;
    }
    else
    {
      int v48 = 1;
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "uniqueIdentifier", v45);
          [v15 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v18);
    }

    v23 = [(MRAVRoutingDiscoverySession *)self endpointsRemovedCallbacks];
    uint64_t v24 = [v23 count];
    v25 = [(MRAVRoutingDiscoverySession *)self endpointsChangedCallbacks];
    uint64_t v26 = [v25 count];

    if (v24 + v26)
    {
      id v12 = (void *)v45;
      v27 = -[MRAVRoutingDiscoverySession _determineRemovedOutputDevices:previousOutputDevices:]((uint64_t)self, v13, v45);
      if ([v27 count])
      {
        v28 = [(MRAVRoutingDiscoverySession *)self endpointsRemovedCallbacks];
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v28, v27, self->_calloutQueue);

        int v48 = 1;
      }
    }
    else
    {
      id v12 = (void *)v45;
    }
    v29 = [(MRAVRoutingDiscoverySession *)self endpointsAddedCallbacks];
    uint64_t v30 = [v29 count];
    v31 = [(MRAVRoutingDiscoverySession *)self endpointsChangedCallbacks];
    uint64_t v32 = [v31 count];

    if (v30 + v32)
    {
      v33 = -[MRAVRoutingDiscoverySession _determineAddedOutputDevices:previousOutputDevices:]((uint64_t)self, (uint64_t)v13, v12);
      v34 = objc_msgSend(v33, "mr_replaceEndpointsWithEndpoints:", v15);

      if ([v34 count])
      {
        v35 = [(MRAVRoutingDiscoverySession *)self endpointsAddedCallbacks];
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v35, v34, self->_calloutQueue);

        int v48 = 1;
      }
    }
    v36 = [(MRAVRoutingDiscoverySession *)self endpointsModifiedCallbacks];
    uint64_t v37 = [v36 count];
    v38 = [(MRAVRoutingDiscoverySession *)self endpointsChangedCallbacks];
    uint64_t v39 = [v38 count];

    if (v37 + v39)
    {
      v40 = -[MRAVRoutingDiscoverySession _determineModifiedEndpoints:previousEndpoints:]((uint64_t)self, v13, v12);
      v41 = objc_msgSend(v40, "mr_replaceEndpointsWithEndpoints:", v15);

      unsigned int v10 = v46;
      if ([v41 count])
      {
        v42 = [(MRAVRoutingDiscoverySession *)self endpointsModifiedCallbacks];
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v42, v41, self->_calloutQueue);
      }
      else
      {

        if ((v48 & 1) == 0)
        {
LABEL_33:

          id v8 = v47;
          goto LABEL_34;
        }
      }
    }
    else
    {
      unsigned int v10 = v46;
      if (!v48) {
        goto LABEL_33;
      }
    }
    v43 = [(MRAVRoutingDiscoverySession *)self endpointsChangedCallbacks];
    -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v43, v16, self->_calloutQueue);

    goto LABEL_33;
  }
LABEL_34:
  self->_previousEndpointsDiscoveryMode = v10;
  [(MRAVRoutingDiscoverySession *)self logEndpointsChanged:v7 oldEndpoints:v12];
}

- (NSMutableDictionary)endpointsChangedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  unsigned int v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVRoutingDiscoverySession_endpointsChangedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSArray)endpointsSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  unsigned int v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVRoutingDiscoverySession_endpointsSnapshot__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setEndpointsSnapshot:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MRAVRoutingDiscoverySession_setEndpointsSnapshot___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)logEndpointsChanged:(id)a3 oldEndpoints:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self
    && ([(MRAVRoutingDiscoverySession *)self alwaysLogUpdates]
     || [(MRAVRoutingDiscoverySession *)self discoveryMode]
     || [(MRAVRoutingDiscoverySession *)self alwaysAllowUpdates]))
  {
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v9 = [v8 changeDescriptionTo:v6 keyBlock:&__block_literal_global_122 isUpdatedBlock:&__block_literal_global_125_0 descriptionBlock:&__block_literal_global_128_0];
    if (v9)
    {
      unsigned int v10 = MRLogCategoryDiscoveryUpdates();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v9;
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Endpoints changed\n%{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)logOutputDevicesChanged:(id)a3 oldOutputDevices:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self
    && ([(MRAVRoutingDiscoverySession *)self alwaysLogUpdates]
     || [(MRAVRoutingDiscoverySession *)self discoveryMode]
     || [(MRAVRoutingDiscoverySession *)self alwaysAllowUpdates]))
  {
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v9 = [v8 changeDescriptionTo:v6 keyBlock:&__block_literal_global_114_2 isUpdatedBlock:&__block_literal_global_117_0 descriptionBlock:&__block_literal_global_119];
    if (v9)
    {
      unsigned int v10 = MRLogCategoryDiscoveryUpdates();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v9;
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Output devices changed\n%{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (BOOL)alwaysLogUpdates
{
  return self->_alwaysLogUpdates;
}

- (void)notifyOutputDevicesChanged:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(MRAVRoutingDiscoverySession *)self discoveryMode];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = [(MRAVRoutingDiscoverySession *)self alwaysAllowUpdates];
  }
  id v7 = [(MRAVRoutingDiscoverySession *)self outputDevicesSnapshot];
  id v8 = objc_msgSend(v4, "mr_distantOutputDevices");
  [(MRAVRoutingDiscoverySession *)self setOutputDevicesSnapshot:v8];
  if (v6)
  {
    v41 = v7;
    LODWORD(v39) = v5;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "uid", v39);
          if (v16) {
            [v9 setObject:v15 forKeyedSubscript:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v12);
    }

    unsigned int v5 = v39;
    if (self->_previousOutputDevicesDiscoveryMode == v39)
    {
      uint64_t v17 = +[MRUserSettings currentSettings];
      HIDWORD(v39) = [v17 calculateDiscoveryUpdates] ^ 1;
    }
    else
    {
      HIDWORD(v39) = 1;
    }
    uint64_t v18 = [(MRAVRoutingDiscoverySession *)self outputDevicesRemovedCallbacks];
    uint64_t v19 = [v18 count];
    v20 = [(MRAVRoutingDiscoverySession *)self outputDevicesChangedCallbacks];
    uint64_t v21 = [v20 count];

    if (v19 + v21)
    {
      v22 = -[MRAVRoutingDiscoverySession _determineRemovedOutputDevices:previousOutputDevices:]((uint64_t)self, v8, (uint64_t)v41);
      if ([v22 count])
      {
        v23 = [(MRAVRoutingDiscoverySession *)self outputDevicesRemovedCallbacks];
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v23, v22, self->_calloutQueue);

        int v40 = 1;
      }
    }
    uint64_t v24 = [(MRAVRoutingDiscoverySession *)self outputDevicesAddedCallbacks];
    uint64_t v25 = [v24 count];
    uint64_t v26 = [(MRAVRoutingDiscoverySession *)self outputDevicesChangedCallbacks];
    uint64_t v27 = [v26 count];

    if (v25 + v27)
    {
      v28 = -[MRAVRoutingDiscoverySession _determineAddedOutputDevices:previousOutputDevices:]((uint64_t)self, (uint64_t)v8, v41);
      v29 = objc_msgSend(v28, "mr_replaceOutputDevicesWithOutputDevices:", v9);

      if ([v29 count])
      {
        uint64_t v30 = [(MRAVRoutingDiscoverySession *)self outputDevicesAddedCallbacks];
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v30, v29, self->_calloutQueue);

        int v40 = 1;
      }
    }
    v31 = [(MRAVRoutingDiscoverySession *)self outputDevicesModifiedCallbacks];
    uint64_t v32 = [v31 count];
    v33 = [(MRAVRoutingDiscoverySession *)self outputDevicesChangedCallbacks];
    uint64_t v34 = [v33 count];

    if (v32 + v34)
    {
      id v7 = v41;
      v35 = -[MRAVRoutingDiscoverySession _determineModifiedOutputDevices:previousOutputDevices:]((uint64_t)self, v8, v41);
      v36 = objc_msgSend(v35, "mr_replaceOutputDevicesWithOutputDevices:", v9);

      if ([v36 count])
      {
        uint64_t v37 = [(MRAVRoutingDiscoverySession *)self outputDevicesModifiedCallbacks];
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v37, v36, self->_calloutQueue);
      }
      else
      {

        if ((v40 & 1) == 0)
        {
LABEL_32:

          goto LABEL_33;
        }
      }
    }
    else
    {
      id v7 = v41;
      if (!v40) {
        goto LABEL_32;
      }
    }
    v38 = [(MRAVRoutingDiscoverySession *)self outputDevicesChangedCallbacks];
    -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v38, v10, self->_calloutQueue);

    goto LABEL_32;
  }
LABEL_33:
  self->_previousOutputDevicesDiscoveryMode = v5;
  [(MRAVRoutingDiscoverySession *)self logOutputDevicesChanged:v4 oldOutputDevices:v7];
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (NSMutableDictionary)outputDevicesChangedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVRoutingDiscoverySession_outputDevicesChangedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSArray)outputDevicesSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVRoutingDiscoverySession_outputDevicesSnapshot__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setOutputDevicesSnapshot:(id)a3
{
}

- (NSMutableDictionary)endpointsAddedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVRoutingDiscoverySession_endpointsAddedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)endpointsRemovedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVRoutingDiscoverySession_endpointsRemovedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)endpointsModifiedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVRoutingDiscoverySession_endpointsModifiedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (id)_determineModifiedEndpoints:(void *)a3 previousEndpoints:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__MRAVRoutingDiscoverySession__determineModifiedEndpoints_previousEndpoints___block_invoke;
    v9[3] = &unk_1E57D63D8;
    id v10 = v5;
    id v7 = objc_msgSend(a2, "mr_filter:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __77__MRAVRoutingDiscoverySession__determineModifiedEndpoints_previousEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
    uint64_t v5 = [v3 isEqualToEndpoint:v6] ^ 1;
  }
  return v5;
}

- (NSMutableDictionary)outputDevicesRemovedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVRoutingDiscoverySession_outputDevicesRemovedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)outputDevicesModifiedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MRAVRoutingDiscoverySession_outputDevicesModifiedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)outputDevicesAddedCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  id v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVRoutingDiscoverySession_outputDevicesAddedCallbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (id)_determineModifiedOutputDevices:(void *)a3 previousOutputDevices:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__MRAVRoutingDiscoverySession__determineModifiedOutputDevices_previousOutputDevices___block_invoke;
    v9[3] = &unk_1E57D6400;
    id v10 = v5;
    uint64_t v11 = a1;
    id v7 = objc_msgSend(a2, "mr_filter:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_performOutputDevicesCallbacks:(void *)a3 withOutputDevices:(void *)a4 onQueue:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = v9;
  if (a1)
  {
    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__MRAVRoutingDiscoverySession__performOutputDevicesCallbacks_withOutputDevices_onQueue___block_invoke;
      block[3] = &unk_1E57D0790;
      id v21 = v7;
      id v22 = v8;
      dispatch_async(v10, block);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v7);
            }
            uint64_t v15 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            ((void (**)(void, id))v15)[2](v15, v8);
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_performEndpointsCallbacks:(void *)a3 withEndpoints:(void *)a4 onQueue:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = v9;
  if (a1)
  {
    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__MRAVRoutingDiscoverySession__performEndpointsCallbacks_withEndpoints_onQueue___block_invoke;
      block[3] = &unk_1E57D0790;
      id v21 = v7;
      id v22 = v8;
      dispatch_async(v10, block);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v7);
            }
            uint64_t v15 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            ((void (**)(void, id))v15)[2](v15, v8);
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

uint64_t __61__MRAVRoutingDiscoverySession_outputDevicesModifiedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 96) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __60__MRAVRoutingDiscoverySession_outputDevicesRemovedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __58__MRAVRoutingDiscoverySession_outputDevicesAddedCallbacks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)_determineRemovedOutputDevices:(uint64_t)a3 previousOutputDevices:
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = a2;
    uint64_t v6 = [v4 setWithArray:a3];
    id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v5];

    [v6 minusSet:v7];
    id v8 = [v6 allObjects];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_determineAddedOutputDevices:(void *)a3 previousOutputDevices:
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = a3;
    uint64_t v6 = [v4 setWithArray:a2];
    id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v5];

    [v6 minusSet:v7];
    id v8 = [v6 allObjects];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (MRAVRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MRAVRoutingDiscoverySession;
  id v5 = [(MRAVRoutingDiscoverySession *)&v46 init];
  if (v5)
  {
    id v6 = [NSString alloc];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = objc_msgSend(v6, "initWithFormat:", @"%s.serialQueue", class_getName(v7));
    uint64_t v9 = (const char *)[v8 UTF8String];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v11;

    id v13 = [NSString alloc];
    id v14 = (objc_class *)objc_opt_class();
    id v15 = objc_msgSend(v13, "initWithFormat:", @"%s.calloutQueue", class_getName(v14));
    long long v16 = (const char *)[v15 UTF8String];
    long long v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointsChangedCallbacks = v5->_endpointsChangedCallbacks;
    v5->_endpointsChangedCallbacks = v20;

    id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointsAddedCallbacks = v5->_endpointsAddedCallbacks;
    v5->_endpointsAddedCallbacks = v22;

    uint64_t v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointsRemovedCallbacks = v5->_endpointsRemovedCallbacks;
    v5->_endpointsRemovedCallbacks = v24;

    uint64_t v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointsModifiedCallbacks = v5->_endpointsModifiedCallbacks;
    v5->_endpointsModifiedCallbacks = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outputDevicesChangedCallbacks = v5->_outputDevicesChangedCallbacks;
    v5->_outputDevicesChangedCallbacks = v28;

    uint64_t v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outputDevicesAddedCallbacks = v5->_outputDevicesAddedCallbacks;
    v5->_outputDevicesAddedCallbacks = v30;

    uint64_t v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outputDevicesRemovedCallbacks = v5->_outputDevicesRemovedCallbacks;
    v5->_outputDevicesRemovedCallbacks = v32;

    uint64_t v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outputDevicesModifiedCallbacks = v5->_outputDevicesModifiedCallbacks;
    v5->_outputDevicesModifiedCallbacks = v34;

    v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    endpointsSnapshot = v5->_endpointsSnapshot;
    v5->_endpointsSnapshot = v36;

    v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    outputDevicesSnapshot = v5->_outputDevicesSnapshot;
    v5->_outputDevicesSnapshot = v38;

    uint64_t v40 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v40;

    v5->_alwaysAllowUpdates = [v4 alwaysAllowUpdates];
    v5->_populatesExternalDevice = [v4 populatesExternalDevice];
    uint64_t v42 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    clientDiscoveryStates = v5->_clientDiscoveryStates;
    v5->_clientDiscoveryStates = (NSMapTable *)v42;

    long long v44 = +[MRMediaRemoteServiceClient sharedServiceClient];
    [v44 addDiscoverySession:v5];
  }
  return v5;
}

+ (id)discoverySessionWithConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)objc_opt_class() discoverySessionFactories];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * i));
        if (v10)
        {
          uint64_t v11 = v10;

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (objc_msgSend(v4, "isLocal", (void)v15) && (objc_msgSend(v4, "features") & 8) == 0) {
    [v4 features];
  }
  uint64_t v11 = objc_opt_class();
  if (v11)
  {
LABEL_14:
    uint64_t v12 = objc_msgSend(a1, "sharedDiscoverySessionForClass:configuration:", v11, v4, (void)v15);
    id v13 = [[MRAVRoutingDiscoverySessionWrapper alloc] initWithSession:v12 configuration:v4];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)sharedDiscoverySessionForClass:(Class)a3 configuration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  objc_sync_enter(v6);
  uint64_t v7 = (void *)sharedSessionsByClass;
  if (!sharedSessionsByClass)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v9 = (void *)sharedSessionsByClass;
    sharedSessionsByClass = v8;

    uint64_t v7 = (void *)sharedSessionsByClass;
  }
  uint64_t v10 = [v7 objectForKey:a3];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    [(id)sharedSessionsByClass setObject:v10 forKey:a3];
  }
  uint64_t v11 = [v10 objectForKey:v5];
  if (!v11)
  {
    uint64_t v11 = (void *)[[a3 alloc] initWithConfiguration:v5];
    [v10 setObject:v11 forKey:v5];
  }

  objc_sync_exit(v6);

  return v11;
}

+ (NSMutableArray)discoverySessionFactories
{
  if (discoverySessionFactories_onceToken != -1) {
    dispatch_once(&discoverySessionFactories_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)discoverySessionFactories_factories;

  return (NSMutableArray *)v2;
}

- (NSMapTable)clientDiscoveryStates
{
  return self->_clientDiscoveryStates;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableOutputDevices];
  if ([v2 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __56__MRAVRoutingDiscoverySession_discoverySessionFactories__block_invoke()
{
  discoverySessionFactories_factories = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return MEMORY[0x1F41817F8]();
}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 72);
  id v7 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v6 = (void *)MEMORY[0x1997190F0]();
  [v5 setObject:v6 forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableEndpoints];
  if ([v2 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientDiscoveryStates, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDevicesModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesSnapshot, 0);

  objc_storeStrong((id *)&self->_endpointsSnapshot, 0);
}

void __88__MRAVRoutingDiscoverySession__performOutputDevicesCallbacks_withOutputDevices_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40);
  id v7 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v6 = (void *)MEMORY[0x1997190F0]();
  [v5 setObject:v6 forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __80__MRAVRoutingDiscoverySession__performEndpointsCallbacks_withEndpoints_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)addEndpointsChangedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__27;
  uint64_t v20 = __Block_byref_object_dispose__27;
  id v21 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  long long v15 = &v16;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke_2;
  v11[3] = &unk_1E57D03B0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_async(calloutQueue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3 enableThrottling:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:*(void *)&a3];
  [v6 setEnableThrottling:v4];
  id v7 = [a1 discoverySessionWithConfiguration:v6];

  return v7;
}

+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3
{
  BOOL v4 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:*(void *)&a3];
  uint64_t v5 = [a1 discoverySessionWithConfiguration:v4];

  return v5;
}

- (MRAVRoutingDiscoverySession)initWithFeatures:(unsigned int)a3
{
  BOOL v4 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:*(void *)&a3];
  uint64_t v5 = [(MRAVRoutingDiscoverySession *)self initWithConfiguration:v4];

  return v5;
}

- (void)removeEndpointsChangedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MRAVRoutingDiscoverySession_removeEndpointsChangedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __62__MRAVRoutingDiscoverySession_removeEndpointsChangedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MRAVRoutingDiscoverySession_removeOutputDevicesChangedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __66__MRAVRoutingDiscoverySession_removeOutputDevicesChangedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)addEndpointsAddedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__27;
  uint64_t v20 = __Block_byref_object_dispose__27;
  id v21 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  long long v15 = &v16;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke_2;
  v11[3] = &unk_1E57D03B0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_async(calloutQueue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableEndpoints];
  if ([v2 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)removeEndpointsAddedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MRAVRoutingDiscoverySession_removeEndpointsAddedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __60__MRAVRoutingDiscoverySession_removeEndpointsAddedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)addEndpointsRemovedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__27;
  uint64_t v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MRAVRoutingDiscoverySession_addEndpointsRemovedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __59__MRAVRoutingDiscoverySession_addEndpointsRemovedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)removeEndpointsRemovedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MRAVRoutingDiscoverySession_removeEndpointsRemovedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __62__MRAVRoutingDiscoverySession_removeEndpointsRemovedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)addEndpointsModifiedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__27;
  uint64_t v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRAVRoutingDiscoverySession_addEndpointsModifiedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__MRAVRoutingDiscoverySession_addEndpointsModifiedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)removeEndpointsModifiedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MRAVRoutingDiscoverySession_removeEndpointsModifiedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __63__MRAVRoutingDiscoverySession_removeEndpointsModifiedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)addOutputDevicesAddedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__27;
  uint64_t v20 = __Block_byref_object_dispose__27;
  id v21 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  long long v15 = &v16;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke_2;
  v11[3] = &unk_1E57D03B0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_async(calloutQueue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableOutputDevices];
  if ([v2 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)removeOutputDevicesAddedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MRAVRoutingDiscoverySession_removeOutputDevicesAddedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __64__MRAVRoutingDiscoverySession_removeOutputDevicesAddedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)addOutputDevicesRemovedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__27;
  uint64_t v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesRemovedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesRemovedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 88) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)removeOutputDevicesRemovedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MRAVRoutingDiscoverySession_removeOutputDevicesRemovedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __66__MRAVRoutingDiscoverySession_removeOutputDevicesRemovedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)addOutputDevicesModifiedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__27;
  uint64_t v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRAVRoutingDiscoverySession_addOutputDevicesModifiedCallback___block_invoke;
  block[3] = &unk_1E57D6330;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __64__MRAVRoutingDiscoverySession_addOutputDevicesModifiedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedInt:arc4random()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v6 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)MEMORY[0x1997190F0]();
  [*(id *)(*(void *)(a1 + 32) + 96) setObject:v5 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)removeOutputDevicesModifiedCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MRAVRoutingDiscoverySession_removeOutputDevicesModifiedCallback___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __67__MRAVRoutingDiscoverySession_removeOutputDevicesModifiedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

+ (void)registerDiscoverySessionFactory:(id)a3
{
  id v6 = a3;
  id v4 = [a1 discoverySessionFactories];
  objc_sync_enter(v4);
  uint64_t v5 = (void *)MEMORY[0x1997190F0](v6);
  [v4 addObject:v5];

  objc_sync_exit(v4);
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke_2()
{
  return 0;
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __85__MRAVRoutingDiscoverySession__determineModifiedOutputDevices_previousOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
    id v7 = +[MRUserSettings currentSettings];
    int v8 = [v7 verboseDiscoveryLogging];

    if (v8)
    {
      id v20 = 0;
      id v21 = 0;
      id v19 = 0;
      int v9 = [v3 isEqualToOutputDevice:v6 denyList:0 addedProperties:&v21 removedProperties:&v20 changedProperties:&v19];
      id v10 = v21;
      id v11 = v20;
      id v12 = v19;
      if ((v9 & 1) == 0)
      {
        uint64_t v13 = MRLogCategoryDiscoveryOversize();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          id v23 = v14;
          _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - OutputDevice modified", buf, 0xCu);
        }
      }
      if ([v10 count])
      {
        long long v15 = MRLogCategoryDiscoveryOversize();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v10;
          _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Added Fields: %{public}@", buf, 0xCu);
        }
      }
      if ([v11 count])
      {
        uint64_t v16 = MRLogCategoryDiscoveryOversize();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v11;
          _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Removed Fields: %{public}@", buf, 0xCu);
        }
      }
      if ([v12 count])
      {
        id v17 = MRLogCategoryDiscoveryOversize();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v12;
          _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Changed Values: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      int v9 = [v3 isEqualToOutputDevice:v6];
    }
    uint64_t v5 = v9 ^ 1u;
  }
  return v5;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  self->_alwaysAllowUpdates = a3;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return self->_onlyDiscoversBluetoothDevices;
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
  self->_onlyDiscoversBluetoothDevices = a3;
}

- (void)setAlwaysLogUpdates:(BOOL)a3
{
  self->_alwaysLogUpdates = a3;
}

- (void)setEndpointsChangedCallbacks:(id)a3
{
}

- (void)setEndpointsAddedCallbacks:(id)a3
{
}

- (void)setEndpointsRemovedCallbacks:(id)a3
{
}

- (void)setEndpointsModifiedCallbacks:(id)a3
{
}

- (void)setOutputDevicesChangedCallbacks:(id)a3
{
}

- (void)setOutputDevicesAddedCallbacks:(id)a3
{
}

- (void)setOutputDevicesRemovedCallbacks:(id)a3
{
}

- (void)setOutputDevicesModifiedCallbacks:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setClientDiscoveryStates:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  self->_populatesExternalDevice = a3;
}

@end