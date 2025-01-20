@interface MRAVOutputContextEndpoint
+ (BOOL)supportsSecureCoding;
- (BOOL)canModifyGroupMembership;
- (BOOL)groupContainsDiscoverableGroupLeader;
- (BOOL)isConnected;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRealized;
- (MRAVConcreteOutputContext)outputContext;
- (MRAVOutputContextEndpoint)initWithCoder:(id)a3;
- (MRAVOutputContextEndpoint)initWithOutputContext:(id)a3 uniqueIdentifier:(id)a4;
- (MROrigin)origin;
- (MROutputContextController)outputContextController;
- (NSArray)outputDevices;
- (id)_externalOutputContext;
- (id)designatedGroupLeader;
- (id)deviceInfo;
- (id)personalOutputDevices;
- (id)predictedOutputDevice;
- (id)predictedOutputDeviceUIDs;
- (id)uniqueIdentifier;
- (int64_t)connectionType;
- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_handleDeviceInfoDidChange:(id)a3;
- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_reloadOutputDevicesFromContext;
- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)resetPredictedOutputDevice;
- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setOrigin:(id)a3;
- (void)setOutputContext:(id)a3;
- (void)setOutputContextController:(id)a3;
- (void)setOutputDevices:(id)a3;
@end

@implementation MRAVOutputContextEndpoint

- (int64_t)connectionType
{
  return 1;
}

- (NSArray)outputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSArray *)v2->_outputDevices copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)designatedGroupLeader
{
  return 0;
}

- (id)deviceInfo
{
  v2 = [(MRAVOutputContextEndpoint *)self origin];
  v3 = +[MRDeviceInfoRequest deviceInfoForOrigin:v2];

  return v3;
}

- (MROrigin)origin
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_origin;
  objc_sync_exit(v2);

  return v3;
}

- (void)_handleDeviceInfoDidChange:(id)a3
{
  id v11 = a3;
  v4 = [v11 userInfo];
  v5 = MRGetOriginFromUserInfo(v4);

  v6 = [(MRAVOutputContextEndpoint *)self origin];
  if ([v5 isEqual:v6])
  {
    v7 = [v11 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"kMRPairedDeviceUserInfoKey"];

    v9 = [v11 userInfo];
    v10 = [v9 objectForKeyedSubscript:@"kMRPreviousPairedDeviceUserInfoDataKey"];

    [(id)objc_opt_class() _notifyDeviceInfoDidChange:v8 previousDeviceInfo:v10 endpoint:self];
  }
}

- (void)setOutputContextController:(id)a3
{
  id v8 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7 = v6;
  if (v5->_outputContextController) {
    objc_msgSend(v6, "removeObserver:name:object:", v5, @"MROutputContextDataSourceDidReloadNotification");
  }
  objc_storeStrong((id *)&v5->_outputContextController, a3);
  if (v5->_outputContextController) {
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_outputContextDataSourceReloaded_, @"MROutputContextDataSourceDidReloadNotification");
  }
  [(MRAVEndpoint *)v5 setOutputContextDataSource:v8];

  objc_sync_exit(v5);
}

- (void)setOrigin:(id)a3
{
  v6 = (MROrigin *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_origin != v6) {
    objc_storeStrong((id *)&v5->_origin, a3);
  }
  objc_sync_exit(v5);
}

- (MRAVOutputContextEndpoint)initWithOutputContext:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRAVOutputContextEndpoint;
  id v8 = [(MRAVEndpoint *)&v12 _init];
  v9 = (MRAVOutputContextEndpoint *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    [(MRAVOutputContextEndpoint *)v9 setOutputContext:v6];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__handleDeviceInfoDidChange_ name:@"kMRDeviceInfoDidChangeNotification" object:0];
  }
  return v9;
}

- (void)setOutputContext:(id)a3
{
  id v7 = (MRAVConcreteOutputContext *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_outputContext != v7)
  {
    objc_storeStrong((id *)&v5->_outputContext, a3);
    if (v7)
    {
      if ([(MRAVConcreteOutputContext *)v5->_outputContext type] == 1)
      {
        id v6 = +[MROutputContextController sharedOutputContextController];
      }
      else
      {
        id v6 = [[MROutputContextController alloc] initWithOutputContext:v7];
      }
      [(MRAVOutputContextEndpoint *)v5 setOutputContextController:v6];
    }
  }
  -[MRAVOutputContextEndpoint _reloadOutputDevicesFromContext]((id *)&v5->super.super.isa);
  objc_sync_exit(v5);
}

- (void)_reloadOutputDevicesFromContext
{
  if (a1)
  {
    id v2 = [a1[10] outputDevices];
    [a1 setOutputDevices:v2];
  }
}

- (void)setOutputDevices:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  outputDevices = v5->_outputDevices;
  if (outputDevices != v4)
  {
    id v7 = [(NSArray *)outputDevices firstObject];
    uint64_t v8 = [(NSArray *)v4 copy];
    v9 = v5->_outputDevices;
    v5->_outputDevices = (NSArray *)v8;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v10 = v5->_outputDevices;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v13++), "setEndpoint:", v5, (void)v26);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v11);
    }

    v14 = [(NSArray *)v4 firstObject];
    if (-[NSArray count](v4, "count") != 1 || [v14 deviceType] != 2) {
      goto LABEL_17;
    }
    v15 = [v7 modelID];
    v16 = [v14 modelID];
    v17 = v15;
    v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      v19 = v18;
      char v20 = [v17 isEqual:v18];

      if (v20)
      {
LABEL_17:
        [(MRAVEndpoint *)v5 scheduleEndpointOutputDevicesDidChangeNotification];

        goto LABEL_18;
      }
      v17 = _MRLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(MRAVOutputContextEndpoint *)v5 uniqueIdentifier];
        v22 = [(MRAVEndpoint *)v5 localizedName];
        v23 = [v14 uid];
        v24 = [v14 name];
        v25 = [v14 modelID];
        *(_DWORD *)buf = 138544386;
        v31 = v21;
        __int16 v32 = 2114;
        v33 = v22;
        __int16 v34 = 2114;
        v35 = v23;
        __int16 v36 = 2114;
        v37 = v24;
        __int16 v38 = 2114;
        v39 = v25;
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Updating Endpoint: %{public}@ | %{public}@ bt output device: %{public}@ | %{public}@ | %{public}@", buf, 0x34u);
      }
    }

    goto LABEL_17;
  }
LABEL_18:
  objc_sync_exit(v5);
}

- (id)personalOutputDevices
{
  return 0;
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRAVOutputContextEndpoint;
  [(MRAVOutputContextEndpoint *)&v4 dealloc];
}

- (id)_externalOutputContext
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_outputContextController;
  objc_sync_exit(v2);

  return v3;
}

- (MRAVOutputContextEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputContextUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];

  id v7 = +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:v5];
  uint64_t v8 = [(MRAVOutputContextEndpoint *)self initWithOutputContext:v7 uniqueIdentifier:v6];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  outputContext = self->_outputContext;
  id v6 = a3;
  v5 = [(MRAVOutputContext *)outputContext uniqueIdentifier];
  [v6 encodeObject:v5 forKey:@"outputContextUID"];

  [v6 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRealized
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_outputContext) {
    BOOL v3 = v2->_origin != 0;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)predictedOutputDevice
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MRAVConcreteOutputContext *)v2->_outputContext predictedOutputDevice];
  objc_sync_exit(v2);

  return v3;
}

- (void)resetPredictedOutputDevice
{
  obj = self;
  objc_sync_enter(obj);
  [(MRAVConcreteOutputContext *)obj->_outputContext resetPredictedOutputDevice];
  objc_sync_exit(obj);
}

- (id)predictedOutputDeviceUIDs
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MRAVConcreteOutputContext *)v2->_outputContext predictedOutputDeviceUIDs];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isProxyGroupPlayer
{
  id v2 = [(MRAVOutputContextEndpoint *)self deviceInfo];
  char v3 = [v2 isProxyGroupPlayer];

  return v3;
}

- (BOOL)canModifyGroupMembership
{
  return 1;
}

- (BOOL)isConnected
{
  return 1;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return 1;
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v15 = &unk_1E57D18A8;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void *)MEMORY[0x1997190F0](&v12);
  uint64_t v11 = MRGetSharedService();
  objc_msgSend(v11, "requestGroupSessionWithCompletion:", v10, v12, v13, v14, v15);
}

void __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
}

- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  *(float *)&double v14 = a3;
  v15 = [(MROutputContextController *)self->_outputContextController setVolume:a4 outputDeviceUID:a5 details:v14];
  if (v13)
  {
    id v16 = v12;
    if (!v12)
    {
      id v16 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__MRAVOutputContextEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v18[3] = &unk_1E57D0DB8;
    id v20 = v13;
    id v19 = v15;
    dispatch_async(v16, v18);
    if (!v12) {
  }
    }
}

uint64_t __90__MRAVOutputContextEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  double v14 = [(MROutputContextController *)self->_outputContextController adjustVolume:a3 outputDeviceUID:a4 details:a5];
  if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      v15 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__MRAVOutputContextEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v17[3] = &unk_1E57D0DB8;
    id v19 = v13;
    id v18 = v14;
    dispatch_async(v15, v17);
    if (!v12) {
  }
    }
}

uint64_t __93__MRAVOutputContextEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = a7;
  double v14 = [(MROutputContextController *)self->_outputContextController muteVolume:v10 outputDeviceUID:a4 details:a5];
  if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      v15 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__MRAVOutputContextEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v17[3] = &unk_1E57D0DB8;
    id v19 = v13;
    id v18 = v14;
    dispatch_async(v15, v17);
    if (!v12) {
  }
    }
}

uint64_t __91__MRAVOutputContextEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  notify_post((const char *)[@"kAirPlayWHANotification_BreakAwayFromCurrentGroup" UTF8String]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRAVOutputContextEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke;
  block[3] = &unk_1E57D0FC0;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __80__MRAVOutputContextEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  uint64_t v11 = a5;
  id v12 = a6;
  id v13 = [(MRAVEndpoint *)self outputDeviceWithUID:a4];
  double v14 = v13;
  if (v13)
  {
    id v21 = 0;
    [v13 setCurrentBluetoothListeningMode:v10 error:&v21];
    id v15 = v21;
  }
  else
  {
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
  }
  id v16 = v15;
  if (v12)
  {
    if (!v11)
    {
      uint64_t v11 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MRAVOutputContextEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E57D0DB8;
    id v20 = v12;
    id v19 = v16;
    dispatch_async(v11, block);
  }
}

uint64_t __79__MRAVOutputContextEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MRAVEndpoint *)self outputDeviceWithUID:a4];
  id v13 = v12;
  if (v12)
  {
    id v20 = 0;
    [v12 setAllowsHeadTrackedSpatialAudio:v8 error:&v20];
    id v14 = v20;
  }
  else
  {
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
  }
  id v15 = v14;
  if (v11)
  {
    if (!v10)
    {
      id v10 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MRAVOutputContextEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E57D0DB8;
    id v19 = v11;
    id v18 = v15;
    dispatch_async(v10, block);
  }
}

uint64_t __95__MRAVOutputContextEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MRAVEndpoint *)self outputDeviceWithUID:a4];
  id v14 = v13;
  if (v13)
  {
    id v21 = 0;
    [v13 setHeadTrackedSpatialAudioMode:v10 error:&v21];
    id v15 = v21;
  }
  else
  {
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
  }
  id v16 = v15;
  if (v12)
  {
    if (!v11)
    {
      id v11 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__MRAVOutputContextEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E57D0DB8;
    id v20 = v12;
    id v19 = v16;
    dispatch_async(v11, block);
  }
}

uint64_t __93__MRAVOutputContextEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MRAVEndpoint *)self outputDeviceWithUID:a4];
  id v13 = v12;
  if (v12)
  {
    id v20 = 0;
    [v12 setConversationDetectionEnabled:v8 error:&v20];
    id v14 = v20;
  }
  else
  {
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
  }
  id v15 = v14;
  if (v11)
  {
    if (!v10)
    {
      id v10 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__MRAVOutputContextEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E57D0DB8;
    id v19 = v11;
    id v18 = v15;
    dispatch_async(v10, block);
  }
}

uint64_t __94__MRAVOutputContextEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (MROutputContextController)outputContextController
{
  return self->_outputContextController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end