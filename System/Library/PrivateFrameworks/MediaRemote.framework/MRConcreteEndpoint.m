@interface MRConcreteEndpoint
- (BOOL)canModifyGroupMembership;
- (BOOL)isConnected;
- (BOOL)isProxyGroupPlayer;
- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5;
- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5 connectionType:(int64_t)a6;
- (NSArray)outputDevices;
- (id)designatedGroupLeader;
- (id)externalDevice;
- (id)uniqueIdentifier;
- (int64_t)connectionType;
- (void)_handleConnectionStateDidChangeNotification:(id)a3;
- (void)setExternalDevice:(id)a3;
- (void)setOutputDevices:(id)a3;
@end

@implementation MRConcreteEndpoint

- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 primaryID];
  v13 = (void *)MRMediaRemoteCopyDeviceUID();
  char v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = 6;
  }
  else if ([v9 supportsMultiplayer])
  {
    uint64_t v15 = 5;
  }
  else if ([v9 isRemoteControllable])
  {
    uint64_t v15 = 2;
  }
  else if ([v9 canRelayCommunicationChannel])
  {
    uint64_t v15 = 3;
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [v9 uid];
    [v16 handleFailureInMethod:a2, self, @"MRConcreteEndpoint.m", 41, @"Unknown connection type for endpoint with leader: %@, devices: %@", v17, v10 object file lineNumber description];

    uint64_t v15 = 0;
  }
  v18 = [(MRConcreteEndpoint *)self initWithDesignatedGroupLeader:v9 outputDevices:v10 preferredSuffix:v11 connectionType:v15];

  return v18;
}

- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5 connectionType:(int64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v40.receiver = self;
  v40.super_class = (Class)MRConcreteEndpoint;
  uint64_t v15 = [(MRAVEndpoint *)&v40 _init];
  if (!v15) {
    goto LABEL_15;
  }
  v16 = objc_opt_class();
  if (![v16 isEqual:objc_opt_class()] || objc_msgSend(v13, "count"))
  {
    if (v12) {
      goto LABEL_5;
    }
LABEL_17:
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:v15 file:@"MRConcreteEndpoint.m" lineNumber:55 description:@"Attempted to initialize an endpoint without a group leader"];

    if (a6) {
      goto LABEL_6;
    }
LABEL_18:
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = [v12 primaryID];
    [v38 handleFailureInMethod:a2, v15, @"MRConcreteEndpoint.m", 56, @"Unknown connection type for endpoint with leader: %@, devices: %@", v39, v13 object file lineNumber description];

    goto LABEL_6;
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2 object:v15 file:@"MRConcreteEndpoint.m" lineNumber:54 description:@"Attempted to initialize an endpoint with an empty array of output devices"];

  if (!v12) {
    goto LABEL_17;
  }
LABEL_5:
  if (!a6) {
    goto LABEL_18;
  }
LABEL_6:
  v17 = (objc_class *)objc_opt_class();
  Name = class_getName(v17);
  v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v20 = dispatch_queue_create(Name, v19);
  serialQueue = v15->_serialQueue;
  v15->_serialQueue = (OS_dispatch_queue *)v20;

  uint64_t v22 = [v13 copy];
  outputDevices = v15->_outputDevices;
  v15->_outputDevices = (NSArray *)v22;

  objc_storeStrong((id *)&v15->_designatedGroupLeader, a3);
  v15->_uint64_t connectionType = a6;
  if (a6 == 5)
  {
    v24 = [v13 firstObject];
    v25 = [v24 groupID];
  }
  else
  {
    v25 = [v12 groupID];
  }
  if (v14) {
    v26 = v14;
  }
  else {
    v26 = v25;
  }
  id v27 = v26;
  uint64_t connectionType = v15->_connectionType;
  v29 = [v12 primaryID];
  uint64_t v30 = MRAVEndpointCreateUniqueIdentifier(connectionType, v29, v27);
  uniqueIdentifier = v15->_uniqueIdentifier;
  v15->_uniqueIdentifier = (NSString *)v30;

  if (![(NSString *)v15->_uniqueIdentifier length])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = NSStringFromMRAVEndpointConnectionType(v15->_connectionType);
    v35 = [v12 primaryID];
    [v33 handleFailureInMethod:a2, v15, @"MRConcreteEndpoint.m", 71, @"Invalid endpoint with type: %@ leader UID: %@, suffix: %@", v34, v35, v27 object file lineNumber description];
  }
LABEL_15:

  return v15;
}

- (id)designatedGroupLeader
{
  return self->_designatedGroupLeader;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (id)uniqueIdentifier
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __38__MRConcreteEndpoint_uniqueIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSArray)outputDevices
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __35__MRConcreteEndpoint_outputDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setOutputDevices:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MRConcreteEndpoint_setOutputDevices___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __39__MRConcreteEndpoint_setOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setEndpoint:", *(void *)(a1 + 32), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)externalDevice
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1;
  uint64_t v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __36__MRConcreteEndpoint_externalDevice__block_invoke(uint64_t a1)
{
}

- (void)setExternalDevice:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MRConcreteEndpoint_setExternalDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __40__MRConcreteEndpoint_setExternalDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 72);
  if (v3 != v1)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:*(void *)(a1 + 32) name:@"kMRExternalDeviceConnectionStateDidChangeNotification" object:*(void *)(*(void *)(a1 + 32) + 72)];

      uint64_t v2 = *(void *)(a1 + 32);
      v1 = *(void **)(a1 + 40);
    }
    objc_storeStrong((id *)(v2 + 72), v1);
    if (*(void *)(*(void *)(a1 + 32) + 72))
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:*(void *)(a1 + 32) selector:sel__handleConnectionStateDidChangeNotification_ name:@"kMRExternalDeviceConnectionStateDidChangeNotification" object:*(void *)(*(void *)(a1 + 32) + 72)];
    }
  }
}

- (void)_handleConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v9 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  id v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"kMRExternalDeviceConnectionStateUserInfoKey"];
  int v8 = [v7 intValue];

  if (v8 == 3)
  {
    [(id)objc_opt_class() _notifyEndpointDidDisconnect:self withError:v9];
  }
  else if (v8 == 2)
  {
    [(id)objc_opt_class() _notifyEndpointDidConnect:self];
  }
}

- (BOOL)isProxyGroupPlayer
{
  uint64_t v2 = self;
  uint64_t v3 = [(MRConcreteEndpoint *)self outputDevices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MRConcreteEndpoint_isProxyGroupPlayer__block_invoke;
  v6[3] = &unk_1E57D07B8;
  v6[4] = v2;
  id v4 = objc_msgSend(v3, "msv_firstWhere:", v6);
  LOBYTE(v2) = v4 == 0;

  return (char)v2;
}

uint64_t __40__MRConcreteEndpoint_isProxyGroupPlayer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 designatedGroupLeader];
  id v5 = [v4 uid];
  uint64_t v6 = [v3 containsUID:v5];

  return v6;
}

- (BOOL)canModifyGroupMembership
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRConcreteEndpoint_canModifyGroupMembership__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MRConcreteEndpoint_canModifyGroupMembership__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) groupContainsDiscoverableGroupLeader];
  char v3 = [*(id *)(a1 + 32) designatedGroupLeader];
  char v4 = [v3 isAirPlayReceiverSessionActive];

  id v5 = [*(id *)(a1 + 32) designatedGroupLeader];
  uint64_t v6 = [v5 groupID];
  if ([v6 length])
  {
    uint64_t v7 = [*(id *)(a1 + 32) designatedGroupLeader];
    uint64_t v8 = [v7 parentGroupIdentifier];
    if ([v8 length])
    {
      [*(id *)(a1 + 32) designatedGroupLeader];
      char v9 = v21 = v2;
      [v9 groupID];
      long long v10 = v20 = v4;
      long long v11 = [*(id *)(a1 + 32) designatedGroupLeader];
      long long v12 = [v11 parentGroupIdentifier];
      int v13 = [v10 isEqualToString:v12] ^ 1;

      char v4 = v20;
      int v2 = v21;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  id v14 = [*(id *)(a1 + 32) designatedGroupLeader];
  char v15 = [v14 supportsMultiplayer];

  v16 = [*(id *)(a1 + 32) designatedGroupLeader];
  uint64_t v22 = [v16 groupSessionInfo];

  if (v22) {
    char v17 = [v22 isHosted];
  }
  else {
    char v17 = 1;
  }
  char v18 = (v13 | ~v4 | v15) & v17;
  if (!v2) {
    char v18 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v18;

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isConnected
{
  int v2 = [(MRConcreteEndpoint *)self externalDevice];
  char v3 = [v2 isConnected];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeader, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end