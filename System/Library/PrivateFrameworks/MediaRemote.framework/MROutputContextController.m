@interface MROutputContextController
+ (id)sharedOutputContextController;
- (BOOL)isLocalDeviceDesignatedGroupLeader;
- (BOOL)isOutputContextEmpty;
- (BOOL)localVolumeMuted;
- (MRAVOutputDevice)designatedGroupLeaderWhenContextEmpty;
- (MROutputContextController)initWithOutputContext:(id)a3;
- (float)_onSerialQueue_calculateMasterVolume;
- (float)localVolume;
- (float)volume;
- (id)_onSerialQueue_localOutputDevice;
- (id)_onSerialQueue_performOperationForOutputDeviceUID:(int)a3 withCapabilities:(void *)a4 systemOperation:(void *)a5 deviceOperation:(void *)a6 groupOperation:;
- (id)_performOperationForOutputDeviceUID:(uint64_t)a3 withCapabilities:(void *)a4 systemOperation:(void *)a5 deviceOperation:(void *)a6 groupOperation:;
- (id)adjustVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)muteVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5;
- (id)outputDevices;
- (id)setVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5;
- (id)uniqueIdentifier;
- (uint64_t)_onSerialQueue_calculateGroupVolumeMuted;
- (uint64_t)_onSerialQueue_calculateMasterVolumeCapabilities;
- (uint64_t)_onSerialQueue_isLocalOutputDevice:(uint64_t)a1;
- (unsigned)localVolumeControlCapabilities;
- (unsigned)volumeControlCapabilities;
- (void)_handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)_handleLocalDeviceVolumeDidChangeNotification:(id)a3;
- (void)_handleLocalDeviceVolumeMutedDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceAddedNotification:(id)a3;
- (void)_handleOutputDeviceDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceRemovedNotification:(id)a3;
- (void)_handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceVolumeMutedDidChangeNotification:(id)a3;
- (void)_handlePredictedOutputDeviceDidChangeNotification:(id)a3;
- (void)_inititalizeVolume;
- (void)_onSerialQueue_reevaluateGroupVolume;
- (void)_onSerialQueue_reevaluateGroupVolumeControlCapabilities;
- (void)_onSerialQueue_reevaluateGroupVolumeMuted;
- (void)_registerNotifications;
- (void)dealloc;
- (void)setDesignatedGroupLeaderWhenContextEmpty:(id)a3;
- (void)setLocalVolume:(float)a3;
- (void)setLocalVolumeControlCapabilities:(unsigned int)a3;
- (void)setLocalVolumeMuted:(BOOL)a3;
@end

@implementation MROutputContextController

uint64_t __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_3(uint64_t a1, void *a2)
{
  return -[MROutputContextController _onSerialQueue_isLocalOutputDevice:](*(void *)(a1 + 32), a2);
}

id __42__MROutputContextController_outputDevices__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 uid];
  v6 = [v4 uid];
  int v7 = [v5 isEqualToString:v6];
  v8 = v4;
  if (v7) {
    v8 = *(void **)(a1 + 32);
  }
  id v9 = v8;

  return v9;
}

- (id)_onSerialQueue_localOutputDevice
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke;
    v10[3] = &unk_1E57D2F48;
    v10[4] = a1;
    v10[5] = sel__onSerialQueue_localOutputDevice;
    v2 = (void (**)(void, void))MEMORY[0x1997190F0](v10);
    v3 = [*(id *)(a1 + 48) outputDevices];
    if ([(id)a1 isOutputContextEmpty])
    {
      if (![(id)a1 isLocalDeviceDesignatedGroupLeader]) {
        goto LABEL_5;
      }
      id v4 = +[MRAVOutputContext sharedSystemAudioContext];
      v5 = [v4 outputDevices];
      v6 = objc_msgSend(v5, "msv_firstWhere:", &__block_literal_global_286);

      if (!v6) {
        goto LABEL_5;
      }
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_3;
      v9[3] = &unk_1E57D07B8;
      v9[4] = a1;
      v6 = objc_msgSend(v3, "msv_firstWhere:", v9);
      if (!v6)
      {
LABEL_5:
        int v7 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v7 = ((void (**)(void, void *))v2)[2](v2, v6);

    goto LABEL_8;
  }
  int v7 = 0;
LABEL_9:

  return v7;
}

MRAVDistantOutputDevice *__61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"MROutputContextDataSource.m", 1418, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
  }
  id v4 = [v3 descriptor];
  v5 = v4;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 104) & 2) != 0)
  {
    [v4 setIsVolumeControlAvailable:1];
    LODWORD(v6) = *(_DWORD *)(*(void *)(a1 + 32) + 100);
    [v5 setVolume:v6];
    [v5 setVolumeMuted:*(unsigned __int8 *)(*(void *)(a1 + 32) + 96)];
  }
  else
  {
    [v4 setIsVolumeControlAvailable:0];
    [v5 setHasIsVolumeControlAvailable:0];
    [v5 setVolume:0.0];
    [v5 setHasVolume:0];
    [v5 setVolumeMuted:0];
    [v5 setHasVolumeMuted:0];
  }
  [v5 setVolumeCapabilities:*(unsigned int *)(*(void *)(a1 + 32) + 104)];
  int v7 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v5];

  return v7;
}

- (BOOL)isOutputContextEmpty
{
  v2 = [(MRAVOutputContext *)self->_outputContext outputDevices];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

uint64_t __64__MROutputContextController__onSerialQueue_isLocalOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uid];
  uint64_t v5 = [v3 containsUID:v4];

  return v5;
}

void __58__MROutputContextController_sharedOutputContextController__block_invoke()
{
  v0 = [MRSharedOutputContextController alloc];
  id v3 = +[MRAVOutputContext sharedAudioPresentationContext];
  uint64_t v1 = [(MROutputContextController *)v0 initWithOutputContext:v3];
  v2 = (void *)sharedOutputContextController___outputContextController;
  sharedOutputContextController___outputContextController = v1;
}

+ (id)sharedOutputContextController
{
  if (sharedOutputContextController___once != -1) {
    dispatch_once(&sharedOutputContextController___once, &__block_literal_global_206);
  }
  v2 = (void *)sharedOutputContextController___outputContextController;

  return v2;
}

- (void)_registerNotifications
{
  if (a1)
  {
    MRMediaRemoteSetWantsVolumeControlNotifications(1);
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__handleLocalDeviceVolumeDidChangeNotification_ name:@"kMRMediaRemotePickedRouteVolumeDidChangeNotification" object:0];
    [v2 addObserver:a1 selector:sel__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification_ name:@"kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification" object:0];
    [v2 addObserver:a1 selector:sel__handleLocalDeviceVolumeMutedDidChangeNotification_ name:@"MRMediaRemotePickedRouteVolumeMutedDidChangeNotification" object:0];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceVolumeDidChangeNotification_ name:@"MRAVOutputContextVolumeDidChangeNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification_ name:@"MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceVolumeMutedDidChangeNotification_ name:@"MRAVOutputContextVolumeMutedDidChangeNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceAddedNotification_ name:@"MRAVOutputContextDidAddOutputDeviceNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceDidChangeNotification_ name:@"MRAVOutputContextOutputDeviceDidChangeNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDeviceRemovedNotification_ name:@"MRAVOutputContextDidRemoveOutputDeviceNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handleOutputDevicesReloadedNotification_ name:@"kMRAVOutputContextDevicesDidChangeNotification" object:*(void *)(a1 + 48)];
    [v2 addObserver:a1 selector:sel__handlePredictedOutputDeviceDidChangeNotification_ name:@"kMRAVOutputContextPredictedOutputDeviceDidChangeNotification" object:*(void *)(a1 + 48)];
  }
}

- (MROutputContextController)initWithOutputContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MROutputContextController;
  double v6 = [(MROutputContextController *)&v12 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputContext, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MROutputContextController.serialQueue", v8);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

    [(MROutputContextDataSource *)v7 setShouldLog:MRProcessIsMediaRemoteDaemon()];
    -[MROutputContextController _inititalizeVolume]((uint64_t)v7);
    -[MROutputContextController _registerNotifications]((uint64_t)v7);
  }

  return v7;
}

uint64_t __54__MROutputContextController_volumeControlCapabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 60);
  return result;
}

- (void)_inititalizeVolume
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v4;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v6 = [*(id *)(a1 + 48) outputDevices];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v11 isVolumeControlAvailable])
          {
            objc_super v12 = [v11 uid];
            if (v12)
            {
              v13 = *(void **)(a1 + 72);
              v14 = NSNumber;
              [v11 volume];
              v15 = objc_msgSend(v14, "numberWithFloat:");
              [v13 setObject:v15 forKey:v12];

              v16 = *(void **)(a1 + 80);
              v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isVolumeMuted"));
              [v16 setObject:v17 forKey:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }

    v18 = *(void **)(a1 + 88);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __47__MROutputContextController__inititalizeVolume__block_invoke;
    v26[3] = &unk_1E57D2F70;
    v26[4] = a1;
    MRMediaRemoteGetMediaPlaybackVolume(v18, v26);
    v19 = +[MROrigin localOrigin];
    v20 = *(void **)(a1 + 88);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_289;
    v25[3] = &unk_1E57D2F98;
    v25[4] = a1;
    MRMediaRemoteGetPickedRoutedVolumeControlCapabilities((uint64_t)v19, v20, v25);

    v21 = *(void **)(a1 + 88);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_291;
    v24[3] = &unk_1E57D2FC0;
    v24[4] = a1;
    MRMediaRemoteGetSystemVolumeMuted(v21, v24);
    v22 = *(NSObject **)(a1 + 88);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_293;
    v23[3] = &unk_1E57D0518;
    v23[4] = a1;
    dispatch_async(v22, v23);
  }
}

- (uint64_t)_onSerialQueue_isLocalOutputDevice:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 48) outputDevices];
    if (([*(id *)(a1 + 48) supportsVolumeControl] & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__MROutputContextController__onSerialQueue_isLocalOutputDevice___block_invoke;
      v8[3] = &unk_1E57D07B8;
      id v9 = v3;
      id v5 = objc_msgSend(v4, "msv_firstWhere:", v8);
      if (v5)
      {

        a1 = 1;
        id v6 = v9;
        goto LABEL_10;
      }
    }
    if ([v3 deviceType] == 1)
    {
      a1 = 0;
LABEL_12:

      goto LABEL_13;
    }
    if (![v3 supportsBluetoothSharing])
    {
      a1 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v4, "msv_filter:", &__block_literal_global_281);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    a1 = (unint64_t)[v6 count] < 2;
LABEL_10:

    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (unsigned)volumeControlCapabilities
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (float)volume
{
  uint64_t v4 = 0;
  id v5 = (float *)&v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  float v2 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __42__MROutputContextController_outputDevices__block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  float v2 = -[MROutputContextController _onSerialQueue_localOutputDevice](*(void *)(a1 + 32));
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__MROutputContextController_outputDevices__block_invoke_2;
    v12[3] = &unk_1E57D1838;
    id v5 = v2;
    id v13 = v5;
    uint64_t v6 = objc_msgSend(v4, "msv_map:", v12);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
    {
      if ([*(id *)(a1 + 32) isLocalDeviceDesignatedGroupLeader])
      {
        v14[0] = v5;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }
  }
}

float __35__MROutputContextController_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 56);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke(uint64_t result, float a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 65))
  {
    uint64_t v3 = result;
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(v3 + 32);
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      double v14 = a2;
      id v7 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volume with %f", (uint8_t *)&v9, 0x20u);
    }
    *(float *)&double v8 = a2;
    return [*(id *)(v3 + 32) setLocalVolume:v8];
  }
  return result;
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke_289(uint64_t result, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 66))
  {
    uint64_t v3 = result;
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(v3 + 32);
      id v7 = v5;
      double v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      double v14 = v8;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volumeCapabilities with %@", (uint8_t *)&v9, 0x20u);
    }
    return [*(id *)(v3 + 32) setLocalVolumeControlCapabilities:a2];
  }
  return result;
}

void __47__MROutputContextController__inititalizeVolume__block_invoke_293(uint64_t a1)
{
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(void *)(a1 + 32));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted](v2);
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke_291(uint64_t result, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 96))
  {
    uint64_t v3 = result;
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(v3 + 32);
      id v7 = @"NO";
      int v9 = 138543874;
      uint64_t v10 = v5;
      if (a2) {
        id v7 = @"YES";
      }
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      double v14 = v7;
      id v8 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volumeMuted with %@", (uint8_t *)&v9, 0x20u);
    }
    return [*(id *)(v3 + 32) setLocalVolumeMuted:a2];
  }
  return result;
}

- (void)setLocalVolumeMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(MROutputContextDataSource *)self shouldLog]
    || (+[MRUserSettings currentSettings],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 verboseOutputContextDataSourceLogging],
        v6,
        v7))
  {
    id v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = objc_opt_class();
      uint64_t v10 = @"NO";
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      if (v3) {
        uint64_t v10 = @"YES";
      }
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2112;
      v24 = v10;
      id v11 = v9;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed localVolumeMuted changed to <%@>", buf, 0x20u);
    }
  }
  else
  {
    id v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MROutputContextController setLocalVolumeMuted:]();
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeMutedInitialized || self->_localVolumeMuted != v3)
  {
    self->_localVolumeMutedInitialized = 1;
    self->_int localVolumeMuted = v3;
    uint64_t v12 = -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
    __int16 v13 = v12;
    if (!v12)
    {
LABEL_18:

      return;
    }
    int v14 = [v12 volumeCapabilities];
    if (v14 == self->_localVolumeControlCapabilities)
    {
      if ((v14 & 8) != 0)
      {
LABEL_14:
        int v15 = [v13 isVolumeMuted];
        int localVolumeMuted = self->_localVolumeMuted;
        if (localVolumeMuted != v15)
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1303, @"Invalid parameter not satisfying: %@", @"localOutputDevice.isVolumeMuted == _localVolumeMuted" object file lineNumber description];

          int localVolumeMuted = self->_localVolumeMuted;
        }
        -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](self, localVolumeMuted != 0, v13);
      }
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1301, @"Invalid parameter not satisfying: %@", @"localOutputDevice.volumeCapabilities == _localVolumeControlCapabilities" object file lineNumber description];

      if ((self->_localVolumeControlCapabilities & 8) != 0) {
        goto LABEL_14;
      }
    }
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted]((uint64_t)self);
    goto LABEL_18;
  }
}

- (void)setLocalVolume:(float)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(MROutputContextDataSource *)self shouldLog]
    || (+[MRUserSettings currentSettings],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 verboseOutputContextDataSourceLogging],
        v6,
        v7))
  {
    id v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2048;
      double v22 = a3;
      id v9 = v18;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed localVolume changed to <%f>", buf, 0x20u);
    }
  }
  else
  {
    id v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MROutputContextController setLocalVolume:]();
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeInitialized || vabds_f32(a3, self->_localVolume) > 0.00000011921)
  {
    self->_localVolumeInitialized = 1;
    self->_float localVolume = a3;
    uint64_t v10 = -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
    id v11 = v10;
    if (v10)
    {
      if ([v10 volumeCapabilities] != self->_localVolumeControlCapabilities)
      {
        int v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1279, @"Invalid parameter not satisfying: %@", @"localOutputDevice.volumeCapabilities == _localVolumeControlCapabilities" object file lineNumber description];
      }
      if (([v11 volumeCapabilities] & 2) != 0)
      {
        [v11 volume];
        float v13 = v12;
        float localVolume = self->_localVolume;
        if (vabds_f32(v13, localVolume) >= 0.00000011921)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1281, @"Invalid parameter not satisfying: %@", @"fabsf(localOutputDevice.volume - _localVolume) < VOL_TOLERANCE" object file lineNumber description];

          float localVolume = self->_localVolume;
        }
        -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](self, v11, localVolume);
      }
      -[MROutputContextController _onSerialQueue_reevaluateGroupVolume]((uint64_t)self);
    }
  }
}

- (uint64_t)_onSerialQueue_calculateMasterVolumeCapabilities
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(a1[11]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(dispatch_queue_t *)a1 outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) volumeCapabilities] | v5;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_onSerialQueue_reevaluateGroupVolume
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      float v2 = -[MROutputContextController _onSerialQueue_calculateMasterVolume]((dispatch_queue_t *)a1);
      if (vabds_f32(v2, *(float *)(a1 + 56)) > 0.00000011921)
      {
        *(float *)(a1 + 56) = v2;
        float v3 = *(float *)(a1 + 56);
        -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:]((void *)a1, 0, v3);
      }
    }
  }
}

- (void)_onSerialQueue_reevaluateGroupVolumeMuted
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    int v2 = -[MROutputContextController _onSerialQueue_calculateGroupVolumeMuted]((dispatch_queue_t *)a1);
    if (v2 != *(unsigned __int8 *)(a1 + 64))
    {
      *(unsigned char *)(a1 + 64) = v2;
      uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:]((void *)a1, v3, 0);
    }
  }
}

- (uint64_t)_onSerialQueue_calculateGroupVolumeMuted
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(a1[11]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v2 = [(dispatch_queue_t *)a1 outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v4 |= [*(id *)(*((void *)&v8 + 1) + 8 * v6++) isVolumeMuted];
      }
      while (v3 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
    uint64_t v3 = v4 & 1;
  }

  return v3;
}

- (id)outputDevices
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__8;
  long long v8 = __Block_byref_object_dispose__8;
  id v9 = [(MRAVOutputContext *)self->_outputContext outputDevices];
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setLocalVolumeControlCapabilities:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(MROutputContextDataSource *)self shouldLog]
    || (+[MRUserSettings currentSettings],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 verboseOutputContextDataSourceLogging],
        v6,
        v7))
  {
    long long v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      long long v11 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a3);
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      __int16 v27 = 2048;
      long long v28 = self;
      __int16 v29 = 2112;
      long long v30 = v11;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed localVolumeCapabilities changed to <%@>", buf, 0x20u);
    }
  }
  else
  {
    long long v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MROutputContextController setLocalVolumeControlCapabilities:]();
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeControlCapabilitiesInitialized || self->_localVolumeControlCapabilities != a3)
  {
    self->_localVolumeControlCapabilitiesInitialized = 1;
    unsigned int localVolumeControlCapabilities = self->_localVolumeControlCapabilities;
    self->_unsigned int localVolumeControlCapabilities = a3;
    uint64_t v13 = -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 volumeCapabilities];
      if (v15 != self->_localVolumeControlCapabilities)
      {
        double v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1243, @"Invalid parameter not satisfying: %@", @"localOutputDevice.volumeCapabilities == _localVolumeControlCapabilities" object file lineNumber description];

        uint64_t v15 = self->_localVolumeControlCapabilities;
      }
      -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, v15, v14);
      -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities]((uint64_t)self);
      unsigned int v16 = self->_localVolumeControlCapabilities;
      if ((v16 & 2) != 0 && (localVolumeControlCapabilities & 2) == 0 && self->_localVolumeInitialized)
      {
        [v14 volume];
        float v18 = v17;
        float localVolume = self->_localVolume;
        if (vabds_f32(v18, localVolume) >= 0.00000011921)
        {
          uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1249, @"Invalid parameter not satisfying: %@", @"fabsf(localOutputDevice.volume - _localVolume) < VOL_TOLERANCE" object file lineNumber description];

          float localVolume = self->_localVolume;
        }
        -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](self, v14, localVolume);
        unsigned int v16 = self->_localVolumeControlCapabilities;
      }
      if ((v16 & 8) != 0 && (localVolumeControlCapabilities & 8) == 0 && self->_localVolumeMutedInitialized)
      {
        int v20 = [v14 isVolumeMuted];
        int localVolumeMuted = self->_localVolumeMuted;
        if (localVolumeMuted != v20)
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, self, @"MROutputContextDataSource.m", 1256, @"Invalid parameter not satisfying: %@", @"localOutputDevice.isVolumeMuted == _localVolumeMuted" object file lineNumber description];

          int localVolumeMuted = self->_localVolumeMuted;
        }
        -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](self, localVolumeMuted != 0, v14);
      }
      -[MROutputContextController _onSerialQueue_reevaluateGroupVolume]((uint64_t)self);
      -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted]((uint64_t)self);
    }
  }
}

- (void)_onSerialQueue_reevaluateGroupVolumeControlCapabilities
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    int v2 = -[MROutputContextController _onSerialQueue_calculateMasterVolumeCapabilities]((dispatch_queue_t *)a1);
    if (v2 != *(_DWORD *)(a1 + 60))
    {
      *(_DWORD *)(a1 + 60) = v2;
      uint64_t v3 = *(unsigned int *)(a1 + 60);
      -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:]((void *)a1, v3, 0);
    }
  }
}

- (float)_onSerialQueue_calculateMasterVolume
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  dispatch_assert_queue_V2(a1[11]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(dispatch_queue_t *)a1 outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 volume];
        if (v6 <= v9)
        {
          [v8 volume];
          float v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MROutputContextController;
  [(MROutputContextController *)&v4 dealloc];
}

- (id)description
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__8;
  long long v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __40__MROutputContextController_description__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)MROutputContextController;
  uint64_t v3 = objc_msgSendSuper2(&v12, sel_description);
  int v4 = [*(id *)(*(void *)(a1 + 32) + 48) supportsVolumeControl];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  double v7 = *(float *)(v5 + 100);
  long long v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(v5 + 104));
  uint64_t v9 = [v2 initWithFormat:@"%@ outputContextSupportsVolumeControl = %@ (ignoreThis: localVolume = %lf, local volume capabilities = %@ localVolumeMute = %u)", v3, v6, *(void *)&v7, v8, *(unsigned __int8 *)(*(void *)(a1 + 32) + 96)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  double v7 = __Block_byref_object_copy__8;
  long long v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __45__MROutputContextController_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)MROutputContextController;
  uint64_t v3 = objc_msgSendSuper2(&v18, sel_debugDescription);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[14];
  if ([v4 isLocalDeviceDesignatedGroupLeader]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  int v7 = [*(id *)(*(void *)(a1 + 32) + 48) supportsVolumeControl];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  double v10 = *(float *)(v8 + 100);
  long long v11 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(v8 + 104));
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(unsigned __int8 *)(v12 + 96);
  long long v14 = objc_msgSend(*(id *)(v12 + 48), "mr_formattedDebugDescription");
  uint64_t v15 = [v2 initWithFormat:@"%@\n  designatedGroupLeader = %@\n  isLocalDeviceDesignatedGroupLeader = %@\n  outputContextSupportsVolumeControl = %@\n  AVSystemController.localVolume = %lf\n  AVSystemController.volumeCapabilities = %@\n  AVSystemController.localVolumeMute = %u\n  OutputContext = %@\n", v3, v5, v6, v9, *(void *)&v10, v11, v13, v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (void)setDesignatedGroupLeaderWhenContextEmpty:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MROutputContextController_setDesignatedGroupLeaderWhenContextEmpty___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __70__MROutputContextController_setDesignatedGroupLeaderWhenContextEmpty___block_invoke(uint64_t a1)
{
}

- (id)uniqueIdentifier
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__8;
  id v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __45__MROutputContextController_uniqueIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) uniqueIdentifier];

  return MEMORY[0x1F41817F8]();
}

- (id)_onSerialQueue_performOperationForOutputDeviceUID:(int)a3 withCapabilities:(void *)a4 systemOperation:(void *)a5 deviceOperation:(void *)a6 groupOperation:
{
  id v11 = a2;
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  long long v14 = a6;
  if (!a1) {
    goto LABEL_22;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  if (v11)
  {
    uint64_t v15 = [(id)a1 outputDeviceForUID:v11];
    if (v15)
    {
      if (!-[MROutputContextController _onSerialQueue_isLocalOutputDevice:](a1, v15))
      {
        if (([v15 volumeCapabilities] & a3) != 0)
        {
          v13[2](v13, v15);
LABEL_14:
          Error = 0;
LABEL_18:

          goto LABEL_25;
        }
LABEL_16:
        uint64_t v17 = 37;
        goto LABEL_17;
      }
    }
    else if (![(id)a1 isOutputContextEmpty] {
           || ![(id)a1 isLocalDeviceDesignatedGroupLeader])
    }
    {
      uint64_t v17 = 39;
LABEL_17:
      Error = (void *)MRMediaRemoteCreateError(v17);
      goto LABEL_18;
    }
    if ((*(_DWORD *)(a1 + 104) & a3) != 0)
    {
      v12[2](v12);
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(_DWORD *)(a1 + 60) & a3) != 0)
  {
    if ([*(id *)(a1 + 48) supportsVolumeControl])
    {
      v14[2](v14, *(void *)(a1 + 48));
LABEL_22:
      Error = 0;
      goto LABEL_25;
    }
    if ((*(_DWORD *)(a1 + 104) & a3) != 0)
    {
      v12[2](v12);
      goto LABEL_22;
    }
    uint64_t v18 = 37;
  }
  else
  {
    uint64_t v18 = 36;
  }
  Error = (void *)MRMediaRemoteCreateError(v18);
LABEL_25:

  return Error;
}

- (id)_performOperationForOutputDeviceUID:(uint64_t)a3 withCapabilities:(void *)a4 systemOperation:(void *)a5 deviceOperation:(void *)a6 groupOperation:
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__8;
    v24 = __Block_byref_object_dispose__8;
    id v25 = 0;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    msv_dispatch_sync_on_queue();
    id v14 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __129__MROutputContextController__performOperationForOutputDeviceUID_withCapabilities_systemOperation_deviceOperation_groupOperation___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = -[MROutputContextController _onSerialQueue_performOperationForOutputDeviceUID:withCapabilities:systemOperation:deviceOperation:groupOperation:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(_DWORD *)(a1 + 80), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));

  return MEMORY[0x1F41817F8]();
}

- (id)setVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  id v11 = @"outputContextController.setOutputDeviceVolume";
  if (!v8) {
    id v11 = @"outputContextController.setVolume";
  }
  id v12 = v11;
  id v13 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(MROutputContextController *)self uniqueIdentifier];
  id v16 = (void *)v15;
  double v17 = a3;
  if (v8) {
    uint64_t v18 = [v13 initWithFormat:@"<%@:%p> endpont=%@, outputDevice=%@ -> volume=%lf", v17, v14, self, v15, v8, a3];
  }
  else {
    uint64_t v18 = [v13 initWithFormat:@"<%@:%p> endpoint=%@ -> volume=%lf", v17, v14, self, v15, a3, v43];
  }
  id v19 = (void *)v18;

  id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
  __int16 v21 = [v9 requestID];
  uint64_t v22 = (__CFString *)[v20 initWithFormat:@"%@<%@>", v12, v21];

  if (v19) {
    [(__CFString *)v22 appendFormat:@" for %@", v19];
  }
  uint64_t v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke;
  v50[3] = &__block_descriptor_36_e5_v8__0l;
  float v51 = a3;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke_2;
  v47[3] = &unk_1E57D2D88;
  float v49 = a3;
  id v48 = v9;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke_3;
  v44[3] = &unk_1E57D2E88;
  float v46 = a3;
  id v24 = v48;
  id v45 = v24;
  id v25 = -[MROutputContextController _performOperationForOutputDeviceUID:withCapabilities:systemOperation:deviceOperation:groupOperation:]((uint64_t)self, v8, 2, v50, v47, v44);
  v26 = _MRLogForCategory(0xAuLL);
  __int16 v27 = v26;
  if (v25)
  {
    BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (!v28) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544386;
      v53 = v12;
      __int16 v54 = 2114;
      v55 = v29;
      __int16 v56 = 2114;
      v57 = v25;
      __int16 v58 = 2114;
      v59 = v19;
      __int16 v60 = 2048;
      uint64_t v61 = v31;
      uint64_t v32 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v33 = v27;
      uint32_t v34 = 52;
    }
    else
    {
      if (!v28) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v53 = v12;
      __int16 v54 = 2114;
      v55 = v29;
      __int16 v56 = 2114;
      v57 = v25;
      __int16 v58 = 2048;
      v59 = v40;
      uint64_t v32 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v33 = v27;
      uint32_t v34 = 42;
    }
    _os_log_error_impl(&dword_194F3C000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
  }
  else
  {
    BOOL v35 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v35) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v53 = v12;
      __int16 v54 = 2114;
      v55 = v29;
      __int16 v56 = 2114;
      v57 = v19;
      __int16 v58 = 2048;
      v59 = v36;
      v37 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v38 = v27;
      uint32_t v39 = 42;
    }
    else
    {
      if (!v35) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138543874;
      v53 = v12;
      __int16 v54 = 2114;
      v55 = v29;
      __int16 v56 = 2048;
      v57 = v41;
      v37 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v38 = v27;
      uint32_t v39 = 32;
    }
    _os_log_impl(&dword_194F3C000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
  }

LABEL_24:

  return v25;
}

void __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke(uint64_t a1)
{
}

uint64_t __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return [a2 setVolume:*(void *)(a1 + 32) details:a3];
}

uint64_t __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return [a2 setVolume:*(void *)(a1 + 32) details:a3];
}

- (id)adjustVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  id v11 = @"outputContextController.adjustOutputDeviceVolume";
  if (!v8) {
    id v11 = @"outputContextController.adjustVolume";
  }
  id v12 = v11;
  id v13 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(MROutputContextController *)self uniqueIdentifier];
  uint64_t v16 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  double v17 = (void *)v16;
  if (v8) {
    uint64_t v18 = [v13 initWithFormat:@"<%@:%p> endpont=%@, outputDevice=%@ -> adjustment=%@", v14, self, v15, v8, v16];
  }
  else {
    uint64_t v18 = [v13 initWithFormat:@"<%@:%p> endpoint=%@ -> adjustment=%@", v14, self, v15, v16, v43];
  }
  id v19 = (void *)v18;

  id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
  __int16 v21 = [v9 requestID];
  uint64_t v22 = (__CFString *)[v20 initWithFormat:@"%@<%@>", v12, v21];

  if (v19) {
    [(__CFString *)v22 appendFormat:@" for %@", v19];
  }
  uint64_t v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke;
  v50[3] = &__block_descriptor_40_e5_v8__0l;
  void v50[4] = a3;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke_2;
  v47[3] = &unk_1E57D2EB0;
  int64_t v49 = a3;
  id v48 = v9;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke_3;
  v44[3] = &unk_1E57D2ED8;
  int64_t v46 = a3;
  id v24 = v48;
  id v45 = v24;
  id v25 = -[MROutputContextController _performOperationForOutputDeviceUID:withCapabilities:systemOperation:deviceOperation:groupOperation:]((uint64_t)self, v8, 4, v50, v47, v44);
  v26 = _MRLogForCategory(0xAuLL);
  __int16 v27 = v26;
  if (v25)
  {
    BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (!v28) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544386;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v29;
      __int16 v55 = 2114;
      __int16 v56 = v25;
      __int16 v57 = 2114;
      __int16 v58 = v19;
      __int16 v59 = 2048;
      uint64_t v60 = v31;
      uint64_t v32 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v33 = v27;
      uint32_t v34 = 52;
    }
    else
    {
      if (!v28) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v29;
      __int16 v55 = 2114;
      __int16 v56 = v25;
      __int16 v57 = 2048;
      __int16 v58 = v40;
      uint64_t v32 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v33 = v27;
      uint32_t v34 = 42;
    }
    _os_log_error_impl(&dword_194F3C000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
  }
  else
  {
    BOOL v35 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v35) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v29;
      __int16 v55 = 2114;
      __int16 v56 = v19;
      __int16 v57 = 2048;
      __int16 v58 = v36;
      v37 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v38 = v27;
      uint32_t v39 = 42;
    }
    else
    {
      if (!v35) {
        goto LABEL_24;
      }
      __int16 v29 = [v24 requestID];
      long long v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138543874;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v29;
      __int16 v55 = 2048;
      __int16 v56 = v41;
      v37 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v38 = v27;
      uint32_t v39 = 32;
    }
    _os_log_impl(&dword_194F3C000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
  }

LABEL_24:

  return v25;
}

void __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke(uint64_t a1)
{
}

uint64_t __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 adjustVolume:*(void *)(a1 + 40) details:*(void *)(a1 + 32)];
}

uint64_t __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 adjustVolume:*(void *)(a1 + 40) details:*(void *)(a1 + 32)];
}

- (id)muteVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  BOOL v6 = a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  id v11 = @"outputContextController.muteOutputDeviceVolume";
  if (!v8) {
    id v11 = @"outputContextController.muteVolume";
  }
  id v12 = v11;
  id v13 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(MROutputContextController *)self uniqueIdentifier];
  uint64_t v16 = (void *)v15;
  if (v8) {
    uint64_t v17 = [v13 initWithFormat:@"<%@:%p> endpont=%@, outputDevice=%@ -> mute=%u", v14, self, v15, v8, v6];
  }
  else {
    uint64_t v17 = [v13 initWithFormat:@"<%@:%p> endpoint=%@ -> mute=%u", v14, self, v15, v6, v42];
  }
  uint64_t v18 = (void *)v17;

  id v19 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v20 = [v9 requestID];
  __int16 v21 = (__CFString *)[v19 initWithFormat:@"%@<%@>", v12, v20];

  if (v18) {
    [(__CFString *)v21 appendFormat:@" for %@", v18];
  }
  uint64_t v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke;
  v49[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v50 = v6;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke_2;
  v46[3] = &unk_1E57D2E18;
  BOOL v48 = v6;
  id v47 = v9;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke_3;
  v43[3] = &unk_1E57D2F20;
  BOOL v45 = v6;
  id v23 = v47;
  id v44 = v23;
  id v24 = -[MROutputContextController _performOperationForOutputDeviceUID:withCapabilities:systemOperation:deviceOperation:groupOperation:]((uint64_t)self, v8, 8, v49, v46, v43);
  id v25 = _MRLogForCategory(0xAuLL);
  v26 = v25;
  if (v24)
  {
    BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (!v27) {
        goto LABEL_24;
      }
      BOOL v28 = [v23 requestID];
      __int16 v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544386;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v28;
      __int16 v55 = 2114;
      __int16 v56 = v24;
      __int16 v57 = 2114;
      __int16 v58 = v18;
      __int16 v59 = 2048;
      uint64_t v60 = v30;
      uint64_t v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      uint64_t v32 = v26;
      uint32_t v33 = 52;
    }
    else
    {
      if (!v27) {
        goto LABEL_24;
      }
      BOOL v28 = [v23 requestID];
      __int16 v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v28;
      __int16 v55 = 2114;
      __int16 v56 = v24;
      __int16 v57 = 2048;
      __int16 v58 = v39;
      uint64_t v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      uint64_t v32 = v26;
      uint32_t v33 = 42;
    }
    _os_log_error_impl(&dword_194F3C000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
  }
  else
  {
    BOOL v34 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (!v34) {
        goto LABEL_24;
      }
      BOOL v28 = [v23 requestID];
      __int16 v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138544130;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v28;
      __int16 v55 = 2114;
      __int16 v56 = v18;
      __int16 v57 = 2048;
      __int16 v58 = v35;
      v36 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v37 = v26;
      uint32_t v38 = 42;
    }
    else
    {
      if (!v34) {
        goto LABEL_24;
      }
      BOOL v28 = [v23 requestID];
      __int16 v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 138543874;
      v52 = v12;
      __int16 v53 = 2114;
      __int16 v54 = v28;
      __int16 v55 = 2048;
      __int16 v56 = v40;
      v36 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v37 = v26;
      uint32_t v38 = 32;
    }
    _os_log_impl(&dword_194F3C000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
  }

LABEL_24:

  return v24;
}

void __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke(uint64_t a1)
{
}

uint64_t __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setVolumeMuted:*(unsigned __int8 *)(a1 + 40) details:*(void *)(a1 + 32)];
}

uint64_t __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setVolumeMuted:*(unsigned __int8 *)(a1 + 40) details:*(void *)(a1 + 32)];
}

- (void)_handleLocalDeviceVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"kMRMediaRemoteOriginUserInfoKey"];

  if ([v6 isLocal])
  {
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__MROutputContextController__handleLocalDeviceVolumeDidChangeNotification___block_invoke;
    v8[3] = &unk_1E57D0790;
    void v8[4] = self;
    id v9 = v4;
    dispatch_sync(serialQueue, v8);
  }
}

void __75__MROutputContextController__handleLocalDeviceVolumeDidChangeNotification___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) userInfo];
  id v2 = [v3 objectForKeyedSubscript:@"kMRMediaRemotePickedRouteVolumeUserInfoKey"];
  [v2 floatValue];
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolume:");
}

- (void)_handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"kMRMediaRemoteOriginUserInfoKey"];

  if ([v6 isLocal])
  {
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__MROutputContextController__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke;
    v8[3] = &unk_1E57D0790;
    void v8[4] = self;
    id v9 = v4;
    dispatch_sync(serialQueue, v8);
  }
}

void __94__MROutputContextController__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) userInfo];
  id v2 = [v3 objectForKeyedSubscript:@"kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey"];
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolumeControlCapabilities:", objc_msgSend(v2, "intValue"));
}

- (void)_handleLocalDeviceVolumeMutedDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"kMRMediaRemoteOriginUserInfoKey"];

  if ([v6 isLocal])
  {
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__MROutputContextController__handleLocalDeviceVolumeMutedDidChangeNotification___block_invoke;
    v8[3] = &unk_1E57D0790;
    void v8[4] = self;
    id v9 = v4;
    dispatch_sync(serialQueue, v8);
  }
}

void __80__MROutputContextController__handleLocalDeviceVolumeMutedDidChangeNotification___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) userInfo];
  id v2 = [v3 objectForKeyedSubscript:@"_MRMediaRemotePickedRouteIsMutedUserInfoKey"];
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolumeMuted:", objc_msgSend(v2, "BOOLValue"));
}

- (void)_handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  if ((-[MROutputContextController _onSerialQueue_isLocalOutputDevice:]((uint64_t)self, v6) & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MROutputContextController__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v9 = v4;
    id v10 = v6;
    id v11 = self;
    dispatch_async(serialQueue, block);
  }
}

void __95__MROutputContextController__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"MRAVOutputContextVolumeControlCapabilitiesUserInfoKey"];
  uint64_t v4 = [v3 intValue];

  id v5 = a1[5];
  if (v5)
  {
    -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1[6], v4, v5);
    if ((v4 & 2) != 0)
    {
      id v6 = a1[6];
      [a1[5] volume];
      -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](v6, a1[5], v7);
    }
    if ((v4 & 8) != 0) {
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1[6], [a1[5] isVolumeMuted], a1[5]);
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = objc_msgSend(a1[6], "outputDevices", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1[6], [v13 volumeCapabilities], v13);
          if (([v13 volumeCapabilities] & 2) != 0)
          {
            id v14 = a1[6];
            [v13 volume];
            -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](v14, v13, v15);
          }
          if (([v13 volumeCapabilities] & 8) != 0) {
            -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1[6], [v13 isVolumeMuted], v13);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities]((uint64_t)a1[6]);
  uint64_t v16 = (uint64_t)a1[6];
  int v17 = *(_DWORD *)(v16 + 60);
  if ((v17 & 2) != 0)
  {
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](v16);
    uint64_t v16 = (uint64_t)a1[6];
    int v17 = *(_DWORD *)(v16 + 60);
  }
  if ((v17 & 8) != 0) {
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted](v16);
  }
}

- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  if ((-[MROutputContextController _onSerialQueue_isLocalOutputDevice:]((uint64_t)self, v6) & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MROutputContextController__handleOutputDeviceVolumeDidChangeNotification___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v9 = v4;
    id v10 = v6;
    uint64_t v11 = self;
    dispatch_sync(serialQueue, block);
  }
}

void __76__MROutputContextController__handleOutputDeviceVolumeDidChangeNotification___block_invoke(id *a1)
{
  id v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"MRAVOutputContextVolumeUserInfoKey"];
  [v3 floatValue];
  float v5 = v4;

  uint64_t v6 = [a1[5] uid];
  id v13 = (id)v6;
  if (v6)
  {
    float v7 = [*((id *)a1[6] + 9) objectForKey:v6];
    [v7 floatValue];
    float v9 = v8;

    if (vabds_f32(v9, v5) <= 0.00000011921) {
      goto LABEL_7;
    }
    uint64_t v11 = (void *)*((void *)a1[6] + 9);
    *(float *)&double v10 = v5;
    id v12 = [NSNumber numberWithFloat:v10];
    [v11 setObject:v12 forKey:v13];
  }
  else if (vabds_f32(-1.0, v5) <= 0.00000011921)
  {
    goto LABEL_7;
  }
  if (([a1[5] volumeCapabilities] & 2) != 0)
  {
    -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1[6], a1[5], v5);
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolume]((uint64_t)a1[6]);
  }
LABEL_7:
}

- (void)_handleOutputDeviceVolumeMutedDidChangeNotification:(id)a3
{
  id v4 = a3;
  float v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  if ((-[MROutputContextController _onSerialQueue_isLocalOutputDevice:]((uint64_t)self, v6) & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MROutputContextController__handleOutputDeviceVolumeMutedDidChangeNotification___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v9 = v4;
    id v10 = v6;
    uint64_t v11 = self;
    dispatch_sync(serialQueue, block);
  }
}

void __81__MROutputContextController__handleOutputDeviceVolumeMutedDidChangeNotification___block_invoke(id *a1)
{
  id v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"MRAVOutputContextVolumeMutedUserInfoKey"];
  uint64_t v4 = [v3 BOOLValue];

  uint64_t v5 = [a1[5] uid];
  id v10 = (id)v5;
  if (v5)
  {
    uint64_t v6 = [*((id *)a1[6] + 10) objectForKey:v5];
    int v7 = [v6 BOOLValue];

    if (v4 == v7) {
      goto LABEL_7;
    }
    float v8 = (void *)*((void *)a1[6] + 10);
    id v9 = [NSNumber numberWithBool:v4];
    [v8 setObject:v9 forKey:v10];
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_7;
  }
  if (([a1[5] volumeCapabilities] & 8) != 0)
  {
    -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1[6], v4, a1[5]);
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted]((uint64_t)a1[6]);
  }
LABEL_7:
}

- (void)_handleOutputDeviceAddedNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  id v4 = [v3 uid];
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 72);
    id v6 = NSNumber;
    [v3 volume];
    int v7 = objc_msgSend(v6, "numberWithFloat:");
    [v5 setObject:v7 forKey:v4];

    id v8 = *(void **)(*(void *)(a1 + 40) + 80);
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isVolumeMuted"));
    [v8 setObject:v9 forKey:v4];
  }
  id v10 = [*(id *)(a1 + 40) outputDevices];
  uint64_t v11 = objc_msgSend(v10, "mr_allOutputDevices");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke_2;
  v15[3] = &unk_1E57D07B8;
  id v16 = v3;
  id v12 = v3;
  id v13 = objc_msgSend(v11, "msv_firstWhere:", v15);

  if (v13) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  -[MROutputContextDataSource notifyOutputDeviceAdded:](*(void **)(a1 + 40), v14);
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(void *)(a1 + 40));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(void *)(a1 + 40));
}

uint64_t __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualFuzzy:*(void *)(a1 + 32)];
}

- (void)_handleOutputDeviceDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  id v6 = [(MROutputContextController *)self outputDevices];
  int v7 = objc_msgSend(v6, "mr_allOutputDevices");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__MROutputContextController__handleOutputDeviceDidChangeNotification___block_invoke;
  v11[3] = &unk_1E57D07B8;
  id v12 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "msv_firstWhere:", v11);

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v8;
  }
  -[MROutputContextDataSource notifyOutputDeviceChanged:](self, v10);
}

uint64_t __70__MROutputContextController__handleOutputDeviceDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualFuzzy:*(void *)(a1 + 32)];
}

- (void)_handleOutputDeviceRemovedNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MROutputContextController__handleOutputDeviceRemovedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __68__MROutputContextController__handleOutputDeviceRemovedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v2 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  id v3 = [v4 uid];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:v3];
    [*(id *)(*(void *)(a1 + 40) + 80) removeObjectForKey:v3];
  }
  -[MROutputContextDataSource notifyOutputDeviceRemoved:](*(void **)(a1 + 40), v4);
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(void *)(a1 + 40));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(void *)(a1 + 40));
}

- (void)_handlePredictedOutputDeviceDidChangeNotification:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int v7 = [v5 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"MRAVOutputContextOutputDeviceUserInfoKey"];

  [v6 setObject:v8 forKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__MROutputContextController__handlePredictedOutputDeviceDidChangeNotification___block_invoke;
  v10[3] = &unk_1E57D0790;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __79__MROutputContextController__handlePredictedOutputDeviceDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MROutputContextDataSourceDidChangePredictedOutputDeviceNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (BOOL)isLocalDeviceDesignatedGroupLeader
{
  designatedGroupLeaderWhenContextEmpty = self->_designatedGroupLeaderWhenContextEmpty;
  return !designatedGroupLeaderWhenContextEmpty
      || [(MRAVOutputDevice *)designatedGroupLeaderWhenContextEmpty isLocalDevice];
}

uint64_t __64__MROutputContextController__onSerialQueue_isLocalOutputDevice___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsBluetoothSharing];
}

uint64_t __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isLocalDevice];
}

- (MRAVOutputDevice)designatedGroupLeaderWhenContextEmpty
{
  return self->_designatedGroupLeaderWhenContextEmpty;
}

- (float)localVolume
{
  return self->_localVolume;
}

- (unsigned)localVolumeControlCapabilities
{
  return self->_localVolumeControlCapabilities;
}

- (BOOL)localVolumeMuted
{
  return self->_localVolumeMuted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedGroupLeaderWhenContextEmpty, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeMuted, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolume, 0);

  objc_storeStrong((id *)&self->_outputContext, 0);
}

- (void)setLocalVolumeControlCapabilities:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v1 = (id)objc_opt_class();
  id v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v0);
  OUTLINED_FUNCTION_2_1(&dword_194F3C000, v2, v3, "<%{public}@: %p> Observed localVolumeCapabilities changed to <%@>", v4, v5, v6, v7, 2u);
}

- (void)setLocalVolume:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_7();
  id v1 = v0;
  OUTLINED_FUNCTION_2_1(&dword_194F3C000, v2, v3, "<%{public}@: %p> Observed localVolume changed to <%f>", v4, v5, v6, v7, 2u);
}

- (void)setLocalVolumeMuted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2_1(&dword_194F3C000, v1, v2, "<%{public}@: %p> Observed localVolumeMuted changed to <%@>", v3, v4, v5, v6, 2u);
}

@end