@interface MRAVVirtualOutputDevice
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasBatteryLevel;
- (BOOL)isAddedToHomeKit;
- (BOOL)isAirPlayReceiverSessionActive;
- (BOOL)isDeviceGroupable;
- (BOOL)isGroupLeader;
- (BOOL)isGroupable;
- (BOOL)isLocalDevice;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isUsingJSONProtocol;
- (BOOL)isVolumeControlAvailable;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)requiresAuthorization;
- (BOOL)supportsBluetoothSharing;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsExternalScreen;
- (BOOL)supportsRapport;
- (MRAVVirtualOutputDevice)initWithJSONData:(id)a3 pipeEndpoint:(id)a4;
- (NSData)jsonDeviceDefinition;
- (NSXPCListenerEndpoint)pipeEndpoint;
- (float)batteryLevel;
- (float)volume;
- (id)MACAddress;
- (id)availableBluetoothListeningModes;
- (id)bluetoothID;
- (id)currentBluetoothListeningMode;
- (id)firmwareVersion;
- (id)groupID;
- (id)logicalDeviceID;
- (id)modelID;
- (id)modelSpecificInfo;
- (id)name;
- (id)parentGroupIdentifier;
- (id)playingPairedDeviceName;
- (id)sourceInfo;
- (id)uid;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRAVVirtualOutputDevice

- (MRAVVirtualOutputDevice)initWithJSONData:(id)a3 pipeEndpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v70.receiver = self;
  v70.super_class = (Class)MRAVVirtualOutputDevice;
  v9 = [(MRAVVirtualOutputDevice *)&v70 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaremote.MRAVOutputDevice", v10);
    accessSerialQueue = v9->_accessSerialQueue;
    v9->_accessSerialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_jsonDeviceDefinition, a3);
    id v69 = 0;
    v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v69];
    id v14 = v69;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v13;
      uint64_t v16 = [v15 objectForKeyedSubscript:@"uid"];
      uid = v9->_uid;
      v9->_uid = (NSString *)v16;

      uint64_t v18 = [v15 objectForKeyedSubscript:@"modelID"];
      modelID = v9->_modelID;
      v9->_modelID = (NSString *)v18;

      uint64_t v20 = [v15 objectForKeyedSubscript:@"firmwareVersion"];
      firmwareVersion = v9->_firmwareVersion;
      v9->_firmwareVersion = (NSString *)v20;

      uint64_t v22 = [v15 objectForKeyedSubscript:@"logicalDeviceID"];
      logicalDeviceID = v9->_logicalDeviceID;
      v9->_logicalDeviceID = (NSString *)v22;

      uint64_t v24 = [v15 objectForKeyedSubscript:@"groupID"];
      groupID = v9->_groupID;
      v9->_groupID = (NSString *)v24;

      id v26 = [v15 objectForKeyedSubscript:@"MACAddress"];
      [v26 UTF8String];
      TextToHardwareAddress();

      uint64_t v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v68 length:6];
      MACAddress = v9->_MACAddress;
      v9->_MACAddress = (NSData *)v27;

      uint64_t v29 = [v15 objectForKeyedSubscript:@"playingPairedDeviceName"];
      playingPairedDeviceName = v9->_playingPairedDeviceName;
      v9->_playingPairedDeviceName = (NSString *)v29;

      uint64_t v31 = [v15 objectForKeyedSubscript:@"name"];
      name = v9->_name;
      v9->_name = (NSString *)v31;

      v33 = [v15 objectForKeyedSubscript:@"canAccessRemoteAssets"];
      v9->_canAccessRemoteAssets = [v33 BOOLValue];

      v34 = [v15 objectForKeyedSubscript:@"canAccessAppleMusic"];
      v9->_canAccessAppleMusic = [v34 BOOLValue];

      v35 = [v15 objectForKeyedSubscript:@"canAccessiCloudMusicLibrary"];
      v9->_canAccessiCloudMusicLibrary = [v35 BOOLValue];

      v36 = [v15 objectForKeyedSubscript:@"canPlayEncryptedProgressiveDownloadAssets"];
      v9->_canPlayEncryptedProgressiveDownloadAssets = [v36 BOOLValue];

      v37 = [v15 objectForKeyedSubscript:@"canFetchMediaDataFromSender"];
      v9->_canFetchMediaDataFromSender = [v37 BOOLValue];

      v38 = [v15 objectForKeyedSubscript:@"presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"];
      v9->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = [v38 BOOLValue];

      v39 = [v15 objectForKeyedSubscript:@"isRemoteControllable"];
      v9->_isRemoteControllable = [v39 BOOLValue];

      v40 = [v15 objectForKeyedSubscript:@"canRelayCommunicationChannel"];
      v9->_canRelayCommunicationChannel = [v40 BOOLValue];

      v41 = [v15 objectForKeyedSubscript:@"supportsBufferedAirPlay"];
      v9->_supportsBufferedAirPlay = [v41 BOOLValue];

      v42 = [v15 objectForKeyedSubscript:@"supportsRapport"];
      v9->_supportsRapport = [v42 BOOLValue];

      v43 = [v15 objectForKeyedSubscript:@"isAddedToHomeKit"];
      v9->_isAddedToHomeKit = [v43 BOOLValue];

      v44 = [v15 objectForKeyedSubscript:@"isGroupLeader"];
      v9->_isGroupLeader = [v44 BOOLValue];

      v45 = [v15 objectForKeyedSubscript:@"groupContainsGroupLeader"];
      v9->_groupContainsGroupLeader = [v45 BOOLValue];

      v46 = [v15 objectForKeyedSubscript:@"airPlayReceiver"];
      v9->_airPlayReceiver = [v46 BOOLValue];

      uint64_t v47 = [v15 objectForKeyedSubscript:@"parentGroupIdentifier"];
      parentGroupIdentifier = v9->_parentGroupIdentifier;
      v9->_parentGroupIdentifier = (NSString *)v47;

      v49 = [v15 objectForKeyedSubscript:@"isGroupable"];
      v9->_isGroupable = [v49 BOOLValue];

      v50 = [v15 objectForKeyedSubscript:@"supportsBluetoothSharing"];
      v9->_supportsBluetoothSharing = [v50 BOOLValue];

      v51 = [v15 objectForKeyedSubscript:@"isProxyGroupPlayer"];
      v9->_isProxyGroupPlayer = [v51 BOOLValue];

      v52 = [v15 objectForKeyedSubscript:@"isPickedOnPairedDevice"];
      v9->_isPickedOnPairedDevice = [v52 BOOLValue];

      v53 = [v15 objectForKeyedSubscript:@"batteryLevel"];
      [v53 floatValue];
      v9->_batteryLevel = v54;

      v55 = [v15 objectForKeyedSubscript:@"hasBatteryLevel"];
      v9->_hasBatteryLevel = [v55 BOOLValue];

      v56 = [v15 objectForKeyedSubscript:@"isLocalDevice"];
      v9->_isLocalDevice = [v56 BOOLValue];

      v57 = [v15 objectForKeyedSubscript:@"supportsExternalScreen"];
      v9->_supportsExternalScreen = [v57 BOOLValue];

      v58 = [v15 objectForKeyedSubscript:@"deviceType"];
      v9->_deviceType = [v58 intValue];

      v59 = [v15 objectForKeyedSubscript:@"deviceSubType"];
      v9->_deviceSubType = [v59 intValue];

      v60 = [v15 objectForKeyedSubscript:@"requiresAuthorization"];
      v9->_requiresAuthorization = [v60 BOOLValue];

      v61 = [v15 objectForKeyedSubscript:@"isVolumeControlAvailable"];
      v9->_isVolumeControlAvailable = [v61 BOOLValue];

      v62 = [v15 objectForKeyedSubscript:@"volume"];
      [v62 floatValue];
      v9->_volume = v63;

      uint64_t v64 = [v15 objectForKeyedSubscript:@"bluetoothID"];
      bluetoothID = v9->_bluetoothID;
      v9->_bluetoothID = (NSString *)v64;

      v66 = [v15 objectForKeyedSubscript:@"JSONProtocol"];

      v9->_isUsingJSONProtocol = [v66 BOOLValue];
    }
    objc_storeStrong((id *)&v9->_pipeEndpoint, a4);
  }
  return v9;
}

- (id)sourceInfo
{
  return 0;
}

- (id)uid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MRAVVirtualOutputDevice_uid__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MRAVVirtualOutputDevice_uid__block_invoke(uint64_t a1)
{
}

- (id)name
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MRAVVirtualOutputDevice_name__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MRAVVirtualOutputDevice_name__block_invoke(uint64_t a1)
{
}

- (id)logicalDeviceID
{
  id v3 = +[MRUserSettings currentSettings];
  char v4 = [v3 useClusterDevices];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__29;
    v13 = __Block_byref_object_dispose__29;
    id v14 = 0;
    accessSerialQueue = self->_accessSerialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__MRAVVirtualOutputDevice_logicalDeviceID__block_invoke;
    v8[3] = &unk_1E57D0590;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(accessSerialQueue, v8);
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return v5;
}

void __42__MRAVVirtualOutputDevice_logicalDeviceID__block_invoke(uint64_t a1)
{
}

- (id)modelID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVVirtualOutputDevice_modelID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__MRAVVirtualOutputDevice_modelID__block_invoke(uint64_t a1)
{
}

- (id)firmwareVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_firmwareVersion__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__MRAVVirtualOutputDevice_firmwareVersion__block_invoke(uint64_t a1)
{
}

- (id)groupID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVVirtualOutputDevice_groupID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__MRAVVirtualOutputDevice_groupID__block_invoke(uint64_t a1)
{
}

- (id)MACAddress
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MRAVVirtualOutputDevice_MACAddress__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__MRAVVirtualOutputDevice_MACAddress__block_invoke(uint64_t a1)
{
}

- (id)modelSpecificInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVVirtualOutputDevice_modelSpecificInfo__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__MRAVVirtualOutputDevice_modelSpecificInfo__block_invoke(uint64_t a1)
{
}

- (id)playingPairedDeviceName
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVVirtualOutputDevice_playingPairedDeviceName__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__MRAVVirtualOutputDevice_playingPairedDeviceName__block_invoke(uint64_t a1)
{
}

- (BOOL)canAccessRemoteAssets
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_canAccessRemoteAssets__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__MRAVVirtualOutputDevice_canAccessRemoteAssets__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 384);
  return result;
}

- (BOOL)canAccessAppleMusic
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVVirtualOutputDevice_canAccessAppleMusic__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MRAVVirtualOutputDevice_canAccessAppleMusic__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 385);
  return result;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVVirtualOutputDevice_canAccessiCloudMusicLibrary__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVVirtualOutputDevice_canAccessiCloudMusicLibrary__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 386);
  return result;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MRAVVirtualOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__MRAVVirtualOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 387);
  return result;
}

- (BOOL)canFetchMediaDataFromSender
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVVirtualOutputDevice_canFetchMediaDataFromSender__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVVirtualOutputDevice_canFetchMediaDataFromSender__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 388);
  return result;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__MRAVVirtualOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __90__MRAVVirtualOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 389);
  return result;
}

- (BOOL)isRemoteControllable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRAVVirtualOutputDevice_isRemoteControllable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__MRAVVirtualOutputDevice_isRemoteControllable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 390);
  return result;
}

- (BOOL)canRelayCommunicationChannel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVVirtualOutputDevice_canRelayCommunicationChannel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__MRAVVirtualOutputDevice_canRelayCommunicationChannel__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 391);
  return result;
}

- (BOOL)supportsBufferedAirPlay
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVVirtualOutputDevice_supportsBufferedAirPlay__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__MRAVVirtualOutputDevice_supportsBufferedAirPlay__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 392);
  return result;
}

- (BOOL)supportsRapport
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_supportsRapport__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRAVVirtualOutputDevice_supportsRapport__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 393);
  return result;
}

- (BOOL)isAddedToHomeKit
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MRAVVirtualOutputDevice_isAddedToHomeKit__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__MRAVVirtualOutputDevice_isAddedToHomeKit__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 394);
  return result;
}

- (BOOL)isGroupLeader
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_isGroupLeader__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_isGroupLeader__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 395);
  return result;
}

- (BOOL)groupContainsGroupLeader
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_groupContainsGroupLeader__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_groupContainsGroupLeader__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 396);
  return result;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVVirtualOutputDevice_isAirPlayReceiverSessionActive__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__MRAVVirtualOutputDevice_isAirPlayReceiverSessionActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 397);
  return result;
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRAVVirtualOutputDevice_parentGroupContainsDiscoverableLeader__block_invoke;
  block[3] = &unk_1E57D66F8;
  block[4] = &v6;
  dispatch_sync(accessSerialQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)parentGroupIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_parentGroupIdentifier__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__MRAVVirtualOutputDevice_parentGroupIdentifier__block_invoke(uint64_t a1)
{
}

- (BOOL)isGroupable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVVirtualOutputDevice_isGroupable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__MRAVVirtualOutputDevice_isGroupable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 408);
  return result;
}

- (BOOL)supportsBluetoothSharing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_supportsBluetoothSharing__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_supportsBluetoothSharing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 409);
  return result;
}

- (BOOL)isProxyGroupPlayer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MRAVVirtualOutputDevice_isProxyGroupPlayer__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__MRAVVirtualOutputDevice_isProxyGroupPlayer__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 410);
  return result;
}

- (BOOL)isDeviceGroupable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVVirtualOutputDevice_isDeviceGroupable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MRAVVirtualOutputDevice_isDeviceGroupable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 408);
  return result;
}

- (BOOL)isPickedOnPairedDevice
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVVirtualOutputDevice_isPickedOnPairedDevice__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRAVVirtualOutputDevice_isPickedOnPairedDevice__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 411);
  return result;
}

- (id)currentBluetoothListeningMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVVirtualOutputDevice_currentBluetoothListeningMode__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__MRAVVirtualOutputDevice_currentBluetoothListeningMode__block_invoke(uint64_t a1)
{
}

- (id)availableBluetoothListeningModes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVVirtualOutputDevice_availableBluetoothListeningModes__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__MRAVVirtualOutputDevice_availableBluetoothListeningModes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 464) copy];

  return MEMORY[0x1F41817F8]();
}

- (unsigned)deviceType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MRAVVirtualOutputDevice_deviceType__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__MRAVVirtualOutputDevice_deviceType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 420);
  return result;
}

- (unsigned)deviceSubtype
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_deviceSubtype__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_deviceSubtype__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 424);
  return result;
}

- (float)batteryLevel
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVVirtualOutputDevice_batteryLevel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __39__MRAVVirtualOutputDevice_batteryLevel__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 412);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)hasBatteryLevel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVVirtualOutputDevice_hasBatteryLevel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRAVVirtualOutputDevice_hasBatteryLevel__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 416);
  return result;
}

- (BOOL)isLocalDevice
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVVirtualOutputDevice_isLocalDevice__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVVirtualOutputDevice_isLocalDevice__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 417);
  return result;
}

- (BOOL)supportsExternalScreen
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVVirtualOutputDevice_supportsExternalScreen__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRAVVirtualOutputDevice_supportsExternalScreen__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 418);
  return result;
}

- (BOOL)requiresAuthorization
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVVirtualOutputDevice_requiresAuthorization__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__MRAVVirtualOutputDevice_requiresAuthorization__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 428);
  return result;
}

- (BOOL)isVolumeControlAvailable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVVirtualOutputDevice_isVolumeControlAvailable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MRAVVirtualOutputDevice_isVolumeControlAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 429);
  return result;
}

- (float)volume
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MRAVVirtualOutputDevice_volume__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__MRAVVirtualOutputDevice_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 432);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)bluetoothID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVVirtualOutputDevice_bluetoothID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__MRAVVirtualOutputDevice_bluetoothID__block_invoke(uint64_t a1)
{
}

- (BOOL)isUsingJSONProtocol
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVVirtualOutputDevice_isUsingJSONProtocol__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MRAVVirtualOutputDevice_isUsingJSONProtocol__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 448);
  return result;
}

- (NSXPCListenerEndpoint)pipeEndpoint
{
  return self->_pipeEndpoint;
}

- (NSData)jsonDeviceDefinition
{
  return self->_jsonDeviceDefinition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDeviceDefinition, 0);
  objc_storeStrong((id *)&self->_pipeEndpoint, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end