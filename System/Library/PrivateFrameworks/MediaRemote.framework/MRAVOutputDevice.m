@interface MRAVOutputDevice
+ (id)localDeviceLocalizedName;
+ (id)localDeviceUID;
- (BOOL)allowsHeadTrackedSpatialAudio;
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canBeAirPlayReceiver;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canProxyEndpoint;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)containsUID:(id)a3;
- (BOOL)discoveredOnSameInfra;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasBatteryLevel;
- (BOOL)isActivatedForContinuityScreen;
- (BOOL)isAddedToHomeKit;
- (BOOL)isAirPlayReceiverSessionActive;
- (BOOL)isAirpodsDevice;
- (BOOL)isAppleAccessory;
- (BOOL)isAuxiliary;
- (BOOL)isB238Device;
- (BOOL)isB298Device;
- (BOOL)isB515Device;
- (BOOL)isB520Device;
- (BOOL)isB620Device;
- (BOOL)isB688Device;
- (BOOL)isB698CDevice;
- (BOOL)isB698Device;
- (BOOL)isBeatsLegacyDevice;
- (BOOL)isClusterLeader;
- (BOOL)isConversationDetectionEnabled;
- (BOOL)isDeviceGroupable;
- (BOOL)isEligibleForWHAPlayback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualFuzzy:(id)a3;
- (BOOL)isEqualToOutputDevice:(id)a3;
- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4;
- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4 addedProperties:(id *)a5 removedProperties:(id *)a6 changedProperties:(id *)a7;
- (BOOL)isGroupLeader;
- (BOOL)isGroupable;
- (BOOL)isHeadTrackedSpatialAudioActive;
- (BOOL)isHearingDevice;
- (BOOL)isHomeTheaterB520Device;
- (BOOL)isJ327Device;
- (BOOL)isKnown;
- (BOOL)isLocalDevice;
- (BOOL)isMultiRoom;
- (BOOL)isNearby;
- (BOOL)isPersonalRoute;
- (BOOL)isPickable;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isPrimaryLocalDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isUsingJSONProtocol;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeMuted;
- (BOOL)isW3Device;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)producesLowFidelityAudio;
- (BOOL)requiresAuthorization;
- (BOOL)shouldBeLocallyHosted;
- (BOOL)supportsBluetoothSharing;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsConversationDetection;
- (BOOL)supportsEngageOnClusterActivation;
- (BOOL)supportsExternalScreen;
- (BOOL)supportsHAP;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsMigration;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsRapport;
- (BOOL)supportsRapportRemoteControlTransport;
- (BOOL)supportsSharePlayHandoff;
- (MRAVEndpoint)endpoint;
- (MRAVOutputDevice)outputDeviceWithSourceInfoFrom:(id)a3;
- (MRAVOutputDeviceSourceInfo)sourceInfo;
- (MRGroupSessionInfo)groupSessionInfo;
- (MRRouteRecommendation)recommendation;
- (NSArray)activatedClusterMembersOutputDevices;
- (NSArray)allClusterMembers;
- (NSArray)allClusterMembersOutputDevices;
- (NSArray)availableBluetoothListeningModes;
- (NSArray)clusterComposition;
- (NSArray)clusterCompositionOutputDevices;
- (NSArray)dnsNames;
- (NSArray)rooms;
- (NSData)MACAddress;
- (NSDictionary)jsonEncodableDictionaryRepresentation;
- (NSDictionary)modelSpecificInfo;
- (NSDictionary)roomsLookupTable;
- (NSString)airPlayGroupID;
- (NSString)baseGroupID;
- (NSString)baseParentGroupID;
- (NSString)bluetoothID;
- (NSString)capabilitiesDescription;
- (NSString)clusterID;
- (NSString)composedTypeDescription;
- (NSString)currentBluetoothListeningMode;
- (NSString)debugName;
- (NSString)deviceEnclosureColor;
- (NSString)firmwareVersion;
- (NSString)groupContextID;
- (NSString)groupID;
- (NSString)headTrackedSpatialAudioMode;
- (NSString)logicalDeviceID;
- (NSString)modelID;
- (NSString)name;
- (NSString)parentGroupIdentifier;
- (NSString)parentUID;
- (NSString)playingPairedDeviceName;
- (NSString)roleDescription;
- (NSString)roomID;
- (NSString)roomName;
- (NSString)tightSyncID;
- (NSString)uid;
- (_MRAVOutputDeviceDescriptorProtobuf)descriptor;
- (float)batteryLevel;
- (float)distance;
- (float)volume;
- (id)_clusterCompositionDescription;
- (id)_clusterRoomDescription;
- (id)batteryDescription;
- (id)clusterCompositionDescription;
- (id)description;
- (id)effectiveOutputDeviceForUID:(id)a3;
- (id)mergingVolumeFrom:(id)a3;
- (int64_t)hostDeviceClass;
- (int64_t)transportType;
- (uint64_t)isB735Device;
- (uint64_t)isB768Device;
- (unint64_t)configuredClusterSize;
- (unint64_t)hash;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (unsigned)volumeCapabilities;
- (void)adjustVolume:(int64_t)a3 details:(id)a4;
- (void)setAirPlayGroupID:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setParentGroupIdentifier:(id)a3;
- (void)setPrimaryID:(id)a3;
- (void)setRecommendation:(id)a3;
- (void)setVolume:(float)a3 details:(id)a4;
- (void)setVolumeMuted:(BOOL)a3 details:(id)a4;
@end

@implementation MRAVOutputDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_headTrackedSpatialAudioMode, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_tightSyncID, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_endpoint);
  objc_storeStrong((id *)&self->_primaryID, 0);
  objc_storeStrong((id *)&self->_dnsNames, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_activatedClusterMembersOutputDevices, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_recommendation, 0);
}

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  v4 = [(MRAVOutputDevice *)self name];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setName:v4];

  v5 = [(MRAVOutputDevice *)self uid];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setUniqueIdentifier:v5];

  v6 = [(MRAVOutputDevice *)self tightSyncID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setLogicalDeviceID:v6];

  v7 = [(MRAVOutputDevice *)self groupID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setGroupID:v7];

  v8 = [(MRAVOutputDevice *)self modelID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setModelID:v8];

  v9 = [(MRAVOutputDevice *)self MACAddress];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setMacAddress:v9];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanAccessRemoteAssets:[(MRAVOutputDevice *)self canAccessRemoteAssets]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanAccessAppleMusic:[(MRAVOutputDevice *)self canAccessAppleMusic]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanAccessiCloudMusicLibrary:[(MRAVOutputDevice *)self canAccessiCloudMusicLibrary]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanPlayEncryptedProgressiveDownloadAssets:[(MRAVOutputDevice *)self canPlayEncryptedProgressiveDownloadAssets]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanFetchMediaDataFromSender:[(MRAVOutputDevice *)self canFetchMediaDataFromSender]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:[(MRAVOutputDevice *)self presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsRemoteControllable:[(MRAVOutputDevice *)self isRemoteControllable]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCanRelayCommunicationChannel:[(MRAVOutputDevice *)self canRelayCommunicationChannel]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsBufferedAirPlay:[(MRAVOutputDevice *)self supportsBufferedAirPlay]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsGroupLeader:[(MRAVOutputDevice *)self isGroupLeader]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setGroupContainsGroupLeader:[(MRAVOutputDevice *)self groupContainsGroupLeader]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsAirPlayReceiverSessionActive:[(MRAVOutputDevice *)self isAirPlayReceiverSessionActive]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setParentGroupContainsDiscoverableLeader:[(MRAVOutputDevice *)self parentGroupContainsDiscoverableLeader]];
  v10 = [(MRAVOutputDevice *)self parentGroupIdentifier];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setParentGroupIdentifier:v10];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsGroupable:[(MRAVOutputDevice *)self isGroupable]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsDeviceGroupable:[(MRAVOutputDevice *)self isDeviceGroupable]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsProxyGroupPlayer:[(MRAVOutputDevice *)self isProxyGroupPlayer]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDeviceType:[(MRAVOutputDevice *)self deviceType]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDeviceSubType:[(MRAVOutputDevice *)self deviceSubtype]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setHostDeviceClass:_MRDeviceInfoMessageProtobuf_DeviceClassFromModel([(MRAVOutputDevice *)self hostDeviceClass])];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsAddedToHomeKit:[(MRAVOutputDevice *)self isAddedToHomeKit]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setVolumeCapabilities:[(MRAVOutputDevice *)self volumeCapabilities]];
  if ([(MRAVOutputDevice *)self isVolumeControlAvailable]
    || ([(MRAVOutputDevice *)self volumeCapabilities] & 2) != 0)
  {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsVolumeControlAvailable:1];
    [(MRAVOutputDevice *)self volume];
    -[_MRAVOutputDeviceDescriptorProtobuf setVolume:](v3, "setVolume:");
  }
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setVolumeMuted:[(MRAVOutputDevice *)self isVolumeMuted]];
  v11 = [(MRAVOutputDevice *)self bluetoothID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setBluetoothID:v11];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsHAP:[(MRAVOutputDevice *)self supportsHAP]];
  v12 = [(MRAVOutputDevice *)self modelSpecificInfo];
  uint64_t v13 = MRCreateDataFromObject(v12);

  v56 = (void *)v13;
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setModelSpecificInfoData:v13];
  if ([(MRAVOutputDevice *)self hasBatteryLevel])
  {
    [(MRAVOutputDevice *)self batteryLevel];
    -[_MRAVOutputDeviceDescriptorProtobuf setBatteryLevel:](v3, "setBatteryLevel:");
  }
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsLocalDevice:[(MRAVOutputDevice *)self isLocalDevice]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsExternalScreen:[(MRAVOutputDevice *)self supportsExternalScreen]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setRequiresAuthorization:[(MRAVOutputDevice *)self requiresAuthorization]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setUsingJSONProtocol:[(MRAVOutputDevice *)self isUsingJSONProtocol]];
  v14 = [(MRAVOutputDevice *)self sourceInfo];
  v15 = objc_alloc_init(_MRAVOutputDeviceSourceInfoProtobuf);
  v16 = [v14 routingContextUID];
  [(_MRAVOutputDeviceSourceInfoProtobuf *)v15 setRoutingContextUID:v16];

  -[_MRAVOutputDeviceSourceInfoProtobuf setMultipleBuiltInDevices:](v15, "setMultipleBuiltInDevices:", [v14 multipleBuiltInDevices]);
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSourceInfo:v15];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v17 = [(MRAVOutputDevice *)self clusterComposition];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v69 + 1) + 8 * i) descriptor];
        [(_MRAVOutputDeviceDescriptorProtobuf *)v3 addClusterComposition:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v19);
  }

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setClusterType:[(MRAVOutputDevice *)self clusterType]];
  v23 = [(MRAVOutputDevice *)self primaryID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setPrimaryUID:v23];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setConfiguredClusterSize:[(MRAVOutputDevice *)self configuredClusterSize]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsRapportRemoteControlTransport:[(MRAVOutputDevice *)self supportsRapportRemoteControlTransport]];
  v24 = [(MRAVOutputDevice *)self currentBluetoothListeningMode];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setCurrentBluetoothListeningMode:v24];

  v25 = [(MRAVOutputDevice *)self availableBluetoothListeningModes];
  v26 = (void *)[v25 mutableCopy];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setAvailableBluetoothListeningModes:v26];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsMultiplayer:[(MRAVOutputDevice *)self supportsMultiplayer]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setProducesLowFidelityAudio:[(MRAVOutputDevice *)self producesLowFidelityAudio]];
  v27 = [(MRAVOutputDevice *)self airPlayGroupID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setAirPlayGroupID:v27];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsSharePlayHandoff:[(MRAVOutputDevice *)self supportsSharePlayHandoff]];
  [(MRAVOutputDevice *)self distance];
  if (v28 > 0.0)
  {
    [(MRAVOutputDevice *)self distance];
    -[_MRAVOutputDeviceDescriptorProtobuf setDistance:](v3, "setDistance:");
  }
  if (![(MRAVOutputDevice *)self discoveredOnSameInfra]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDiscoveredOnSameInfra:0];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v29 = [(MRAVOutputDevice *)self activatedClusterMembersOutputDevices];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v66 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v65 + 1) + 8 * j) descriptor];
        [(_MRAVOutputDeviceDescriptorProtobuf *)v3 addActivatedClusterMembers:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v31);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v35 = [(MRAVOutputDevice *)self allClusterMembers];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [*(id *)(*((void *)&v61 + 1) + 8 * k) descriptor];
        [(_MRAVOutputDeviceDescriptorProtobuf *)v3 addAllClusterMembers:v40];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v37);
  }

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setPickable:[(MRAVOutputDevice *)self isPickable]];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setTransportType:[(MRAVOutputDevice *)self transportType]];
  v41 = [(MRAVOutputDevice *)self clusterID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setClusterID:v41];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsClusterLeader:[(MRAVOutputDevice *)self isClusterLeader]];
  v42 = [(MRAVOutputDevice *)self parentUID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setParentUniqueIdentifier:v42];

  v43 = [(MRAVOutputDevice *)self roomID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setRoomID:v43];

  v44 = [(MRAVOutputDevice *)self roomName];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setRoomName:v44];

  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsAppleAccessory:[(MRAVOutputDevice *)self isAppleAccessory]];
  if ([(MRAVOutputDevice *)self supportsEngageOnClusterActivation]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setEngageOnClusterActivate:1];
  }
  if ([(MRAVOutputDevice *)self supportsBluetoothSharing]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsBluetoothSharing:1];
  }
  v45 = [(MRAVOutputDevice *)self deviceEnclosureColor];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setDeviceEnclosureColor:v45];

  v46 = [(MRAVOutputDevice *)self playingPairedDeviceName];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setPlayingPairedDeviceName:v46];

  if ([(MRAVOutputDevice *)self supportsRapport]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsRapport:1];
  }
  if ([(MRAVOutputDevice *)self isPickedOnPairedDevice]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsPickedOnPairedDevice:1];
  }
  if ([(MRAVOutputDevice *)self supportsHeadTrackedSpatialAudio]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsHeadTrackedSpatialAudio:1];
  }
  if ([(MRAVOutputDevice *)self isHeadTrackedSpatialAudioActive]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setIsHeadTrackedSpatialAudioActive:1];
  }
  v47 = [(MRAVOutputDevice *)self headTrackedSpatialAudioMode];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setHeadTrackedSpatialAudioMode:v47];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v48 = [(MRAVOutputDevice *)self dnsNames];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v50; ++m)
      {
        if (*(void *)v58 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v57 + 1) + 8 * m);
        v54 = [(_MRAVOutputDeviceDescriptorProtobuf *)v3 dnsNames];
        [v54 addObject:v53];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v50);
  }

  if ([(MRAVOutputDevice *)self supportsConversationDetection]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setSupportsConversationDetection:1];
  }
  if ([(MRAVOutputDevice *)self isConversationDetectionEnabled]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)v3 setConversationDetectionEnabled:1];
  }

  return v3;
}

- (NSDictionary)roomsLookupTable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(MRAVOutputDevice *)self activatedClusterMembersOutputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 roomID];
        if (v10)
        {
          id v11 = [v3 objectForKeyedSubscript:v10];
          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v3 setObject:v11 forKeyedSubscript:v10];
          }
          [v11 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSString)groupID
{
  if ([(MRAVOutputDevice *)self supportsMultiplayer])
  {
    id v3 = [(MRAVOutputDevice *)self parentGroupIdentifier];
    if ([v3 length]) {
      goto LABEL_5;
    }
  }
  id v3 = [(MRAVOutputDevice *)self airPlayGroupID];
LABEL_5:

  return (NSString *)v3;
}

- (BOOL)shouldBeLocallyHosted
{
  id v3 = +[MRUserSettings currentSettings];
  if ([v3 canHostMultiplayerStream]
    && [(MRAVOutputDevice *)self isAuxiliary])
  {
    if (self) {
      BOOL v4 = ![(MRAVOutputDevice *)self canRelayCommunicationChannel];
    }
    else {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isUsingJSONProtocol
{
  return 0;
}

- (int64_t)hostDeviceClass
{
  return self->_hostDeviceClass;
}

- (NSString)roomName
{
  return 0;
}

- (NSString)roomID
{
  return 0;
}

- (NSString)parentUID
{
  return 0;
}

- (BOOL)isPickable
{
  return 1;
}

+ (id)localDeviceLocalizedName
{
  if (MSVDeviceIsAppleTV())
  {
    MRCopyDeviceName();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (localDeviceLocalizedName___once != -1) {
      dispatch_once(&localDeviceLocalizedName___once, &__block_literal_global_19);
    }
    id v2 = (id)localDeviceLocalizedName___localizedModelName;
  }

  return v2;
}

+ (id)localDeviceUID
{
  return @"LOCAL";
}

- (BOOL)isPersonalRoute
{
  return [(MRAVOutputDevice *)self deviceSubtype] == 2;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(MRAVOutputDevice *)self isLocalDevice]) {
    uint64_t v5 = "(local) ";
  }
  else {
    uint64_t v5 = " ";
  }
  uint64_t v6 = [(MRAVOutputDevice *)self name];
  uint64_t v7 = [(MRAVOutputDevice *)self uid];
  BOOL v8 = [(MRAVOutputDevice *)self supportsMultiplayer];
  v9 = NSString;
  uint64_t v93 = v4;
  if (v8)
  {
    long long v70 = [(MRAVOutputDevice *)self airPlayGroupID];
    [v9 stringWithFormat:@"airplay_group_id=\"%@\"", v70];
  }
  else
  {
    long long v70 = [(MRAVOutputDevice *)self groupID];
    [v9 stringWithFormat:@"group_id=\"%@\"", v70];
  long long v69 = };
  uint64_t v10 = [(MRAVOutputDevice *)self parentGroupIdentifier];
  if (v10)
  {
    id v11 = NSString;
    long long v67 = [(MRAVOutputDevice *)self parentGroupIdentifier];
    [v11 stringWithFormat:@"parent_group_id=\"%@\" ", v67];
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1EE60E7D8;
  }
  v90 = [(MRAVOutputDevice *)self bluetoothID];
  uint64_t v13 = [(MRAVOutputDevice *)self logicalDeviceID];
  if (v13)
  {
    long long v14 = NSString;
    long long v66 = [(MRAVOutputDevice *)self logicalDeviceID];
    [v14 stringWithFormat:@" logical_id=%@", v66];
    v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v99 = &stru_1EE60E7D8;
  }
  v101 = MRAVOutputDeviceTypeCopyDescription([(MRAVOutputDevice *)self deviceType]);
  v100 = MRAVOutputDeviceSubtypeCopyDescription([(MRAVOutputDevice *)self deviceSubtype]);
  v88 = [(MRAVOutputDevice *)self clusterComposition];
  if (v88)
  {
    -[MRAVOutputDevice clusterCompositionDescription](self);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = &stru_1EE60E7D8;
  }
  unsigned int v15 = [(MRAVOutputDevice *)self clusterType] - 1;
  v96 = (void *)v7;
  v97 = (void *)v6;
  v94 = (void *)v10;
  v95 = v3;
  v91 = v12;
  v92 = v5;
  v89 = (void *)v13;
  if (v15 > 2) {
    long long v16 = @"None";
  }
  else {
    long long v16 = off_1E57D1C00[v15];
  }
  long long v68 = v16;
  BOOL v17 = [(MRAVOutputDevice *)self canAccessRemoteAssets];
  uint64_t v18 = " remote-assets";
  if (!v17) {
    uint64_t v18 = "";
  }
  v87 = v18;
  BOOL v19 = [(MRAVOutputDevice *)self isRemoteControllable];
  uint64_t v20 = " remote-controllable";
  if (!v19) {
    uint64_t v20 = "";
  }
  v86 = v20;
  BOOL v21 = [(MRAVOutputDevice *)self canRelayCommunicationChannel];
  v22 = " relayable";
  if (!v21) {
    v22 = "";
  }
  v85 = v22;
  BOOL v23 = [(MRAVOutputDevice *)self supportsBufferedAirPlay];
  v24 = " airplay2";
  if (!v23) {
    v24 = "";
  }
  v84 = v24;
  BOOL v25 = [(MRAVOutputDevice *)self isGroupable];
  v26 = " groupable";
  if (!v25) {
    v26 = "";
  }
  v83 = v26;
  BOOL v27 = [(MRAVOutputDevice *)self isDeviceGroupable];
  float v28 = " device-groupable";
  if (!v27) {
    float v28 = "";
  }
  v82 = v28;
  BOOL v29 = [(MRAVOutputDevice *)self isGroupLeader];
  uint64_t v30 = " group-leader";
  if (!v29) {
    uint64_t v30 = "";
  }
  v81 = v30;
  BOOL v31 = [(MRAVOutputDevice *)self groupContainsGroupLeader];
  uint64_t v32 = " group-contains-leader";
  if (!v31) {
    uint64_t v32 = "";
  }
  v80 = v32;
  BOOL v33 = [(MRAVOutputDevice *)self isAirPlayReceiverSessionActive];
  v34 = " airplay-receiving";
  if (!v33) {
    v34 = "";
  }
  v79 = v34;
  BOOL v35 = [(MRAVOutputDevice *)self parentGroupContainsDiscoverableLeader];
  uint64_t v36 = " parent-group-discoverable-leader";
  if (!v35) {
    uint64_t v36 = "";
  }
  v78 = v36;
  BOOL v37 = [(MRAVOutputDevice *)self isProxyGroupPlayer];
  uint64_t v38 = " proxy";
  if (!v37) {
    uint64_t v38 = "";
  }
  uint64_t v77 = v38;
  BOOL v39 = [(MRAVOutputDevice *)self canAccessAppleMusic];
  v40 = " music";
  if (!v39) {
    v40 = "";
  }
  v76 = v40;
  BOOL v41 = [(MRAVOutputDevice *)self canAccessiCloudMusicLibrary];
  v42 = " iCML";
  if (!v41) {
    v42 = "";
  }
  v75 = v42;
  BOOL v43 = [(MRAVOutputDevice *)self canPlayEncryptedProgressiveDownloadAssets];
  v44 = " enc-prog-dl-assets";
  if (!v43) {
    v44 = "";
  }
  v74 = v44;
  BOOL v45 = [(MRAVOutputDevice *)self canFetchMediaDataFromSender];
  v46 = " fetch-sender-media-data";
  if (!v45) {
    v46 = "";
  }
  v73 = v46;
  BOOL v47 = [(MRAVOutputDevice *)self presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
  v48 = " opt-audio-ui";
  if (!v47) {
    v48 = "";
  }
  long long v72 = v48;
  BOOL v49 = [(MRAVOutputDevice *)self isAddedToHomeKit];
  uint64_t v50 = " is-added-to-home-kit";
  if (!v49) {
    uint64_t v50 = "";
  }
  long long v71 = v50;
  uint64_t v51 = [(MRAVOutputDevice *)self modelID];
  v52 = &stru_1EE60E7D8;
  if (v51)
  {
    uint64_t v53 = NSString;
    long long v65 = [(MRAVOutputDevice *)self modelID];
    v54 = [v53 stringWithFormat:@" %@", v65];
  }
  else
  {
    v54 = &stru_1EE60E7D8;
  }
  if ([(MRAVOutputDevice *)self supportsBluetoothSharing]) {
    v55 = " bluetooth-sharing";
  }
  else {
    v55 = "";
  }
  if ([(MRAVOutputDevice *)self isUsingJSONProtocol]) {
    v56 = " JSON";
  }
  else {
    v56 = "";
  }
  if ([(MRAVOutputDevice *)self supportsHAP]) {
    long long v57 = " supportsHAP";
  }
  else {
    long long v57 = "";
  }
  if ([(MRAVOutputDevice *)self supportsMultiplayer]) {
    long long v58 = " multiplayer";
  }
  else {
    long long v58 = "";
  }
  uint64_t v59 = -[MRAVOutputDevice batteryDescription](self);
  long long v60 = (void *)v59;
  if (v59) {
    long long v61 = (__CFString *)v59;
  }
  else {
    long long v61 = &stru_1EE60E7D8;
  }
  if ([(MRAVOutputDevice *)self transportType])
  {
    unint64_t v62 = [(MRAVOutputDevice *)self transportType];
    if (v62 > 7) {
      v52 = @"Unknown";
    }
    else {
      v52 = off_1E57D1C18[v62];
    }
  }
  objc_msgSend(v95, "stringWithFormat:", @"<%@:%p %s\"%@\" uid=\"%@\" %@ %@bluetooth_id=%@%@ type=%@ subtype=%@%@ clusterType=%@%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%@%s%s%s%s%@ %@>", v93, self, v92, v97, v96, v69, v91, v90, v99, v101, v100, v98, v68, v87, v86, v85,
    v84,
    v83,
    v82,
    v81,
    v80,
    v79,
    v78,
    v77,
    v76,
    v75,
    v74,
    v73,
    v72,
    v71,
    v54,
    v55,
    v56,
    v57,
    v58,
    v61,
  long long v63 = v52);

  if (v51)
  {
  }
  if (v88) {

  }
  if (v89)
  {
  }
  if (v94)
  {
  }

  return v63;
}

- (id)batteryDescription
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v1 hasBatteryLevel])
    {
      id v3 = NSString;
      [v1 batteryLevel];
      uint64_t v5 = [v3 stringWithFormat:@"s:%.2f", v4];
      [v2 addObject:v5];
    }
    uint64_t v6 = [v1 modelSpecificInfo];
    uint64_t v7 = getAVOutputDeviceBatteryLevelCaseKey[0]();
    BOOL v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = NSString;
      uint64_t v10 = [v1 modelSpecificInfo];
      id v11 = getAVOutputDeviceBatteryLevelCaseKey[0]();
      v12 = [v10 objectForKeyedSubscript:v11];
      [v12 floatValue];
      long long v14 = [v9 stringWithFormat:@"c:%.2f", v13];
      [v2 addObject:v14];
    }
    unsigned int v15 = [v1 modelSpecificInfo];
    long long v16 = getAVOutputDeviceBatteryLevelLeftKey[0]();
    BOOL v17 = [v15 objectForKeyedSubscript:v16];

    if (v17)
    {
      uint64_t v18 = NSString;
      BOOL v19 = [v1 modelSpecificInfo];
      uint64_t v20 = getAVOutputDeviceBatteryLevelLeftKey[0]();
      BOOL v21 = [v19 objectForKeyedSubscript:v20];
      [v21 floatValue];
      BOOL v23 = [v18 stringWithFormat:@"l:%.2f", v22];
      [v2 addObject:v23];
    }
    v24 = [v1 modelSpecificInfo];
    BOOL v25 = getAVOutputDeviceBatteryLevelRightKey[0]();
    v26 = [v24 objectForKeyedSubscript:v25];

    if (v26)
    {
      BOOL v27 = NSString;
      float v28 = [v1 modelSpecificInfo];
      BOOL v29 = getAVOutputDeviceBatteryLevelRightKey[0]();
      uint64_t v30 = [v28 objectForKeyedSubscript:v29];
      [v30 floatValue];
      uint64_t v32 = [v27 stringWithFormat:@"r:%.2f", v31];
      [v2 addObject:v32];
    }
    if ([v2 count])
    {
      BOOL v33 = NSString;
      v34 = [v2 componentsJoinedByString:@"|"];
      id v1 = [v33 stringWithFormat:@" (batt %@)", v34];
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

- (BOOL)containsUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRAVOutputDevice *)self uid];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(MRAVOutputDevice *)self primaryID];
    if ([v7 isEqualToString:v4])
    {
      char v6 = 1;
    }
    else
    {
      BOOL v8 = [(MRAVOutputDevice *)self allClusterMembers];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __32__MRAVOutputDevice_containsUID___block_invoke;
      v18[3] = &unk_1E57D0460;
      id v9 = v4;
      id v19 = v9;
      if (objc_msgSend(v8, "mr_any:", v18))
      {
        char v6 = 1;
      }
      else
      {
        uint64_t v10 = [(MRAVOutputDevice *)self clusterComposition];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __32__MRAVOutputDevice_containsUID___block_invoke_2;
        v16[3] = &unk_1E57D0460;
        id v11 = v9;
        id v17 = v11;
        if (objc_msgSend(v10, "mr_any:", v16))
        {
          char v6 = 1;
        }
        else
        {
          v12 = [(MRAVOutputDevice *)self allClusterMembers];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __32__MRAVOutputDevice_containsUID___block_invoke_3;
          v14[3] = &unk_1E57D0460;
          id v15 = v11;
          char v6 = objc_msgSend(v12, "mr_any:", v14);
        }
      }
    }
  }

  return v6;
}

- (BOOL)isVolumeControlAvailable
{
  return ([(MRAVOutputDevice *)self volumeCapabilities] >> 1) & 1;
}

- (void)setEndpoint:(id)a3
{
}

uint64_t __44__MRAVOutputDevice_localDeviceLocalizedName__block_invoke()
{
  localDeviceLocalizedName___localizedModelName = MSVCopyLocalizedModelName();

  return MEMORY[0x1F41817F8]();
}

- (void)setVolume:(float)a3 details:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice setVolume:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice adjustVolume:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice setVolumeMuted:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (float)volume
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice volume]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isVolumeMuted
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice isVolumeMuted]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (unsigned)volumeCapabilities
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputDevice volumeCapabilities]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (unsigned)clusterType
{
  return 0;
}

- (id)_clusterCompositionDescription
{
  if (a1)
  {
    uint64_t v2 = [a1 configuredClusterSize];
    uint64_t v3 = [a1 clusterComposition];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__MRAVOutputDevice__clusterCompositionDescription__block_invoke;
    v10[3] = &unk_1E57D1B98;
    v10[4] = a1;
    id v4 = objc_msgSend(v3, "mr_map:", v10);
    id v5 = [v4 componentsJoinedByString:@"|"];

    uint64_t v6 = [a1 clusterComposition];
    uint64_t v7 = [v6 count];

    if (v7 != v2)
    {
      uint64_t v8 = objc_msgSend(v5, "stringByAppendingFormat:", @" * expected: %lu", v2);

      id v5 = (void *)v8;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __50__MRAVOutputDevice__clusterCompositionDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a2;
  id v5 = MRAVOutputDeviceSubtypeCopyDescription([v4 deviceSubtype]);
  uint64_t v6 = [v4 uid];
  uint64_t v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  uint64_t v8 = [*(id *)(a1 + 32) primaryID];
  id v9 = [v4 uid];

  LODWORD(v4) = [v8 isEqual:v9];
  if (v4)
  {
    uint64_t v10 = [v7 stringByAppendingString:@"^"];

    uint64_t v7 = (void *)v10;
  }

  return v7;
}

- (id)_clusterRoomDescription
{
  if (a1)
  {
    id v1 = [a1 roomOutputDevices];
    uint64_t v2 = objc_msgSend(v1, "mr_map:", &__block_literal_global_24);
    uint64_t v3 = [v2 componentsJoinedByString:@"|"];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __43__MRAVOutputDevice__clusterRoomDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugName];
}

- (id)clusterCompositionDescription
{
  if (a1)
  {
    uint64_t v2 = -[MRAVOutputDevice _clusterCompositionDescription](a1);
    uint64_t v3 = -[MRAVOutputDevice _clusterRoomDescription](a1);
    if ([v3 length]) {
      [NSString stringWithFormat:@"(%@, rooms=<%@>)", v2, v3];
    }
    else {
    id v4 = [NSString stringWithFormat:@"(%@)", v2, v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isAirpodsDevice
{
  uint64_t v3 = [(MRAVOutputDevice *)self modelID];
  if ([v3 containsString:0x1EE617B18])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(MRAVOutputDevice *)self modelID];
    if (([v5 containsString:0x1EE617B38] & 1) != 0
      || [(MRAVOutputDevice *)self isB298Device]
      || [(MRAVOutputDevice *)self isB515Device]
      || [(MRAVOutputDevice *)self isB688Device]
      || [(MRAVOutputDevice *)self isB698Device]
      || [(MRAVOutputDevice *)self isB698CDevice]
      || (-[MRAVOutputDevice isB768Device](self) & 1) != 0)
    {
      char v4 = 1;
    }
    else
    {
      char v4 = -[MRAVOutputDevice isB735Device](self);
    }
  }
  return v4;
}

- (uint64_t)isB768Device
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v2 = [a1 modelID];
    if ([v2 containsString:0x1EE617CB8])
    {
      uint64_t v1 = 1;
    }
    else
    {
      uint64_t v3 = [(id)v1 modelID];
      if ([v3 containsString:0x1EE617CD8])
      {
        uint64_t v1 = 1;
      }
      else
      {
        char v4 = [(id)v1 modelID];
        if ([v4 containsString:0x1EE617CF8])
        {
          uint64_t v1 = 1;
        }
        else
        {
          id v5 = [(id)v1 modelID];
          uint64_t v1 = [v5 containsString:0x1EE617D18];
        }
      }
    }
  }
  return v1;
}

- (uint64_t)isB735Device
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v2 = [a1 modelID];
    if ([v2 containsString:0x1EE617D38])
    {
      uint64_t v1 = 1;
    }
    else
    {
      uint64_t v3 = [(id)v1 modelID];
      uint64_t v1 = [v3 containsString:0x1EE617D58];
    }
  }
  return v1;
}

- (BOOL)isB298Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617B78];

  return v3;
}

- (BOOL)isB515Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617B58];

  return v3;
}

- (BOOL)isB688Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617C38];

  return v3;
}

- (BOOL)isB698Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617C78];

  return v3;
}

- (BOOL)isB698CDevice
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617C98];

  return v3;
}

- (BOOL)isBeatsLegacyDevice
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 componentsSeparatedByString:@","];
  char v4 = [v3 firstObject];

  if (v4)
  {
    if ([v4 containsString:0x1EE617B98]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 containsString:0x1EE617BB8];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isHearingDevice
{
  uint64_t v2 = [(MRAVOutputDevice *)self uid];
  char v3 = [v2 containsString:@"-tlea"];

  return v3;
}

- (BOOL)isJ327Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617C58];

  return v3;
}

- (BOOL)isB238Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617BD8];

  return v3;
}

- (BOOL)isB520Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617BF8];

  return v3;
}

- (BOOL)isB620Device
{
  uint64_t v2 = [(MRAVOutputDevice *)self modelID];
  char v3 = [v2 containsString:0x1EE617C18];

  return v3;
}

- (BOOL)isHomeTheaterB520Device
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = [(MRAVOutputDevice *)self clusterComposition];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v6)
        {
          char v6 = 1;
        }
        else
        {
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) modelID];
          char v6 = [v9 containsString:0x1EE617BF8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  if ([(MRAVOutputDevice *)self clusterType] == 2) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)isW3Device
{
  if ([(MRAVOutputDevice *)self isB698Device]
    || [(MRAVOutputDevice *)self isB698CDevice]
    || (-[MRAVOutputDevice isB768Device](self) & 1) != 0)
  {
    return 1;
  }

  return -[MRAVOutputDevice isB735Device](self);
}

- (BOOL)canBeAirPlayReceiver
{
  return [(MRAVOutputDevice *)self deviceType] == 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (MRAVOutputDevice *)v4;
    if (self == v5)
    {
      char v10 = 1;
    }
    else
    {
      char v6 = [(MRAVOutputDevice *)self uid];
      if (v6)
      {
        uint64_t v7 = [(MRAVOutputDevice *)v5 uid];
        if (v7)
        {
          uint64_t v8 = [(MRAVOutputDevice *)self uid];
          id v9 = [(MRAVOutputDevice *)v5 uid];
          char v10 = [v8 isEqualToString:v9];
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqualToOutputDevice:(id)a3
{
  return [(MRAVOutputDevice *)self isEqualToOutputDevice:a3 denyList:0];
}

- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4
{
  return [(MRAVOutputDevice *)self isEqualToOutputDevice:a3 denyList:a4 addedProperties:0 removedProperties:0 changedProperties:0];
}

- (BOOL)isEqualToOutputDevice:(id)a3 denyList:(id)a4 addedProperties:(id *)a5 removedProperties:(id *)a6 changedProperties:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if ([(MRAVOutputDevice *)self isEqual:v12])
  {
    uint64_t v14 = [v13 count];
    id v15 = [(MRAVOutputDevice *)self descriptor];
    uint64_t v16 = v15;
    if (a7 || a6 || a5 || v14)
    {
      id v19 = [v15 dictionaryRepresentation];
      uint64_t v20 = (void *)[v19 mutableCopy];

      BOOL v21 = [v12 descriptor];
      float v22 = [v21 dictionaryRepresentation];
      BOOL v23 = (void *)[v22 mutableCopy];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __103__MRAVOutputDevice_isEqualToOutputDevice_denyList_addedProperties_removedProperties_changedProperties___block_invoke;
      v35[3] = &unk_1E57D1BE0;
      id v36 = v13;
      v24 = (void (**)(void, void))MEMORY[0x1997190F0](v35);
      ((void (**)(void, void *))v24)[2](v24, v20);
      ((void (**)(void, void *))v24)[2](v24, v23);
      id v33 = 0;
      id v34 = 0;
      float v31 = v20;
      id v32 = 0;
      MRDictionaryCalculateDeltas(v20, v23, &v34, &v33, &v32);
      id v25 = v34;
      id v26 = v33;
      id v27 = v32;
      if (a5) {
        *a5 = v25;
      }
      if (a6) {
        *a6 = v26;
      }
      if (a7) {
        *a7 = v27;
      }
      uint64_t v28 = [v25 count];
      uint64_t v29 = [v26 count] + v28;
      char v18 = v29 + [v27 count] == 0;
    }
    else
    {
      id v17 = [v12 descriptor];
      char v18 = [v16 isEqual:v17];
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

void __103__MRAVOutputDevice_isEqualToOutputDevice_denyList_addedProperties_removedProperties_changedProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)isEqualFuzzy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = v4;
  unsigned int v7 = [(MRAVOutputDevice *)v5 clusterType];
  if (v7 == [v6 clusterType])
  {
    uint64_t v8 = [(MRAVOutputDevice *)v5 configuredClusterSize];
    BOOL v9 = v8 == [v6 configuredClusterSize];
  }
  else
  {
    BOOL v9 = 0;
  }
  long long v10 = [(MRAVOutputDevice *)v5 uid];
  long long v11 = [v6 uid];
  char v12 = [v10 isEqual:v11];

  id v13 = [(MRAVOutputDevice *)v5 uid];
  if ([v13 length])
  {

LABEL_10:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = [v6 uid];
  uint64_t v15 = [v14 length];

  if (v15
    || ![v6 isLocalDevice]
    || ![(MRAVOutputDevice *)v5 isLocalDevice])
  {
    goto LABEL_10;
  }
  unsigned int v16 = [(MRAVOutputDevice *)v5 deviceType];
  BOOL v17 = v16 == [v6 deviceType];
LABEL_11:
  BOOL v18 = v12 & v9 | v17;

  return v18;
}

- (id)mergingVolumeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRAVOutputDevice *)self descriptor];
  __38__MRAVOutputDevice_mergingVolumeFrom___block_invoke((uint64_t)v5, v5, v4);

  id v6 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v5];

  return v6;
}

void __38__MRAVOutputDevice_mergingVolumeFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (([v5 hasVolume] & 1) == 0)
  {
    [v4 volume];
    objc_msgSend(v5, "setVolume:");
  }
  if (([v5 hasVolumeCapabilities] & 1) == 0) {
    objc_msgSend(v5, "setVolumeCapabilities:", objc_msgSend(v4, "volumeCapabilities"));
  }
  if (([v5 hasVolumeMuted] & 1) == 0) {
    objc_msgSend(v5, "setVolumeMuted:", objc_msgSend(v4, "isVolumeMuted"));
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(MRAVOutputDevice *)self uid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)capabilitiesDescription
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  if ([(MRAVOutputDevice *)self isGroupable]) {
    [v3 addObject:@"groupable"];
  }
  if ([(MRAVOutputDevice *)self groupContainsGroupLeader]) {
    [v3 addObject:@"discoverable-leader"];
  }
  if ([(MRAVOutputDevice *)self isRemoteControllable]) {
    [v3 addObject:@"remote-controllable"];
  }
  if ([(MRAVOutputDevice *)self canRelayCommunicationChannel]) {
    [v3 addObject:@"relayable"];
  }
  if ([(MRAVOutputDevice *)self canAccessAppleMusic]) {
    [v3 addObject:@"music"];
  }
  if ([(MRAVOutputDevice *)self canAccessiCloudMusicLibrary]) {
    [v3 addObject:@"iCML"];
  }
  if ([(MRAVOutputDevice *)self canAccessRemoteAssets]) {
    [v3 addObject:@"remote-assets"];
  }
  if ([(MRAVOutputDevice *)self parentGroupContainsDiscoverableLeader]) {
    [v3 addObject:@"discoverable-parent-leader"];
  }
  id v4 = [(MRAVOutputDevice *)self bluetoothID];

  if (v4) {
    [v3 addObject:@"bt-ad"];
  }
  if ([(MRAVOutputDevice *)self supportsBluetoothSharing]) {
    [v3 addObject:@"bt-share"];
  }
  if ([(MRAVOutputDevice *)self supportsHAP]) {
    [v3 addObject:@"HAP"];
  }
  if ([(MRAVOutputDevice *)self isUsingJSONProtocol]) {
    [v3 addObject:@"JSON"];
  }
  if ([(MRAVOutputDevice *)self supportsMultiplayer]) {
    [v3 addObject:@"multiplayer"];
  }
  unint64_t v5 = [(MRAVOutputDevice *)self transportType];
  if (v5 > 7) {
    id v6 = @"Unknown";
  }
  else {
    id v6 = off_1E57D1C18[v5];
  }
  [v3 addObject:v6];
  unsigned int v7 = [v3 componentsJoinedByString:@" "];

  return (NSString *)v7;
}

- (NSString)composedTypeDescription
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([(MRAVOutputDevice *)self deviceType] == 2
    && ([(MRAVOutputDevice *)self modelID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5))
  {
    uint64_t v6 = [(MRAVOutputDevice *)self modelID];
  }
  else
  {
    unsigned int v7 = MRAVOutputDeviceTypeCopyDescription([(MRAVOutputDevice *)self deviceType]);
    [v3 addObject:v7];

    if ([(MRAVOutputDevice *)self deviceType] == 1
      && [(MRAVOutputDevice *)self supportsBufferedAirPlay])
    {
      [v3 addObject:@"2"];
    }
    uint64_t v6 = (uint64_t)MRAVOutputDeviceSubtypeCopyDescription([(MRAVOutputDevice *)self deviceSubtype]);
  }
  uint64_t v8 = (void *)v6;
  [v3 addObject:v6];

  BOOL v9 = [v3 componentsJoinedByString:@" "];

  return (NSString *)v9;
}

- (NSString)roleDescription
{
  if ([(MRAVOutputDevice *)self isProxyGroupPlayer]) {
    return (NSString *)@"proxy";
  }
  if ([(MRAVOutputDevice *)self isGroupLeader]) {
    return (NSString *)@"leader";
  }
  if ([(MRAVOutputDevice *)self isAirPlayReceiverSessionActive]) {
    return (NSString *)@"receiver";
  }
  return (NSString *)@"none";
}

- (NSDictionary)jsonEncodableDictionaryRepresentation
{
  v42[22] = *MEMORY[0x1E4F143B8];
  v41[0] = @"name";
  uint64_t v3 = [(MRAVOutputDevice *)self name];
  v40 = (void *)v3;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = &stru_1EE60E7D8;
  }
  v42[0] = v4;
  v41[1] = @"uid";
  uint64_t v5 = [(MRAVOutputDevice *)self uid];
  BOOL v39 = (void *)v5;
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  else {
    uint64_t v6 = &stru_1EE60E7D8;
  }
  v42[1] = v6;
  v41[2] = @"group-id";
  uint64_t v7 = [(MRAVOutputDevice *)self groupID];
  uint64_t v38 = (void *)v7;
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  else {
    uint64_t v8 = &stru_1EE60E7D8;
  }
  v42[2] = v8;
  v41[3] = @"type";
  BOOL v9 = MRAVOutputDeviceTypeCopyDescription([(MRAVOutputDevice *)self deviceType]);
  BOOL v37 = v9;
  if (v9) {
    long long v10 = v9;
  }
  else {
    long long v10 = &stru_1EE60E7D8;
  }
  v42[3] = v10;
  v41[4] = @"subtype";
  long long v11 = MRAVOutputDeviceSubtypeCopyDescription([(MRAVOutputDevice *)self deviceSubtype]);
  id v36 = v11;
  if (v11) {
    char v12 = v11;
  }
  else {
    char v12 = &stru_1EE60E7D8;
  }
  v42[4] = v12;
  v41[5] = @"buffered-airplay";
  BOOL v35 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice supportsBufferedAirPlay](self, "supportsBufferedAirPlay"));
  v42[5] = v35;
  v41[6] = @"group-leader";
  id v34 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isGroupLeader](self, "isGroupLeader"));
  v42[6] = v34;
  v41[7] = @"remote-assets";
  id v33 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice canAccessRemoteAssets](self, "canAccessRemoteAssets"));
  v42[7] = v33;
  v41[8] = @"remote-controllable";
  id v32 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable"));
  v42[8] = v32;
  v41[9] = @"relayable";
  float v31 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice canRelayCommunicationChannel](self, "canRelayCommunicationChannel"));
  v42[9] = v31;
  v41[10] = @"groupable";
  uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isGroupable](self, "isGroupable"));
  v42[10] = v30;
  v41[11] = @"discoverable-leader";
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice groupContainsGroupLeader](self, "groupContainsGroupLeader"));
  v42[11] = v29;
  v41[12] = @"airplay-receiving";
  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isAirPlayReceiverSessionActive](self, "isAirPlayReceiverSessionActive"));
  v42[12] = v28;
  v41[13] = @"parent-group-id";
  uint64_t v13 = [(MRAVOutputDevice *)self parentGroupIdentifier];
  uint64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_1EE60E7D8;
  }
  v42[13] = v15;
  v41[14] = @"parent-group-discoverable-leader";
  unsigned int v16 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice parentGroupContainsDiscoverableLeader](self, "parentGroupContainsDiscoverableLeader"));
  v42[14] = v16;
  v41[15] = @"proxy";
  BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  v42[15] = v17;
  v41[16] = @"music";
  BOOL v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice canAccessAppleMusic](self, "canAccessAppleMusic"));
  v42[16] = v18;
  v41[17] = @"iCML";
  id v19 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice canAccessiCloudMusicLibrary](self, "canAccessiCloudMusicLibrary"));
  v42[17] = v19;
  v41[18] = @"is-added-to-home-kit";
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice isAddedToHomeKit](self, "isAddedToHomeKit"));
  v42[18] = v20;
  v41[19] = @"bluetoothID";
  uint64_t v21 = [(MRAVOutputDevice *)self bluetoothID];
  float v22 = (void *)v21;
  if (v21) {
    BOOL v23 = (__CFString *)v21;
  }
  else {
    BOOL v23 = &stru_1EE60E7D8;
  }
  v42[19] = v23;
  v41[20] = @"supportsHAP";
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[MRAVOutputDevice supportsHAP](self, "supportsHAP"));
  v42[20] = v24;
  v41[21] = @"modelID";
  id v25 = [(MRAVOutputDevice *)self modelID];
  v42[21] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:22];

  return (NSDictionary *)v26;
}

- (NSString)debugName
{
  id v3 = [NSString alloc];
  id v4 = [(MRAVOutputDevice *)self uid];
  uint64_t v5 = [(MRAVOutputDevice *)self name];
  uint64_t v6 = (void *)[v3 initWithFormat:@"%@-%@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isAuxiliary
{
  id v3 = +[MRUserSettings currentSettings];
  BOOL v4 = [v3 isMultiplayerAware]
    && [(MRAVOutputDevice *)self deviceType] == 1
    && ([(MRAVOutputDevice *)self deviceSubtype] == 1
     || [(MRAVOutputDevice *)self deviceSubtype] == 0);

  return v4;
}

- (BOOL)isPrimaryLocalDevice
{
  uint64_t v2 = [(MRAVOutputDevice *)self primaryID];
  id v3 = (void *)MRMediaRemoteCopyDeviceUID();
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)canProxyEndpoint
{
  BOOL v3 = [(MRAVOutputDevice *)self supportsRapportRemoteControlTransport];
  if (v3) {
    LOBYTE(v3) = [(MRAVOutputDevice *)self deviceSubtype] == 12;
  }
  return v3;
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

uint64_t __32__MRAVOutputDevice_containsUID___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (id)effectiveOutputDeviceForUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(MRAVOutputDevice *)self rooms];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
      long long v11 = [v10 uid];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [(MRAVOutputDevice *)self activatedClusterMembersOutputDevices];
    uint64_t v13 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v13)
    {
LABEL_17:

      if ([(MRAVOutputDevice *)self containsUID:v4]) {
        id v19 = self;
      }
      else {
        id v19 = 0;
      }
      uint64_t v20 = v19;
      goto LABEL_22;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
      BOOL v17 = [v10 uid];
      char v18 = [v17 isEqual:v4];

      if (v18) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v14) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  uint64_t v20 = v10;

LABEL_22:

  return v20;
}

- (NSString)baseGroupID
{
  uint64_t v2 = [(MRAVOutputDevice *)self airPlayGroupID];
  BOOL v3 = MRComputeBaseGroupID(v2);

  return (NSString *)v3;
}

- (NSString)baseParentGroupID
{
  uint64_t v2 = [(MRAVOutputDevice *)self parentGroupIdentifier];
  BOOL v3 = MRComputeBaseGroupID(v2);

  return (NSString *)v3;
}

- (NSString)groupContextID
{
  uint64_t v2 = [(MRAVOutputDevice *)self groupID];
  BOOL v3 = MRComputeGroupContextID(v2);

  return (NSString *)v3;
}

- (BOOL)isEligibleForWHAPlayback
{
  unsigned int v3 = [(MRAVOutputDevice *)self isGroupable];
  if (v3)
  {
    if ([(MRAVOutputDevice *)self deviceType] == 1)
    {
      if (!self
        || (unsigned int v3 = [(MRAVOutputDevice *)self deviceSubtype], v3 > 0xF)
        || (char v4 = v3, LOBYTE(v3) = 1, ((1 << v4) & 0xB000) == 0))
      {
        LOBYTE(v3) = [(MRAVOutputDevice *)self isAuxiliary];
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)supportsMigration
{
  BOOL v3 = self
    && [(MRAVOutputDevice *)self canRelayCommunicationChannel]
    && [(MRAVOutputDevice *)self groupContainsGroupLeader];
  BOOL v4 = [(MRAVOutputDevice *)self isGroupable];
  if (v4)
  {
    unsigned int v5 = [(MRAVOutputDevice *)self deviceType];
    BOOL v6 = v5 == 1;
    LOBYTE(v4) = v5 == 1 && v3;
    if (self && v6)
    {
      unsigned int v7 = [(MRAVOutputDevice *)self deviceSubtype];
      LOBYTE(v4) = v7 == 15 || (v7 & 0xFFFFFFFE) == 12 || v3;
    }
  }
  return v4;
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (BOOL)isNearby
{
  BOOL v3 = +[MRUserSettings currentSettings];
  int v4 = [v3 supportRouteRecommendations];

  if (!v4) {
    return 0;
  }
  unsigned int v5 = [(MRAVOutputDevice *)self recommendation];

  if (!v5) {
    return 0;
  }
  BOOL v6 = [(MRAVOutputDevice *)self recommendation];
  BOOL v7 = (unint64_t)([v6 classification] - 2) < 3;

  return v7;
}

- (BOOL)isKnown
{
  BOOL v3 = +[MRUserSettings currentSettings];
  char v4 = [v3 supportRouteRecommendations];

  if ((v4 & 1) != 0
    && ([(MRAVOutputDevice *)self recommendation],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = [(MRAVOutputDevice *)self recommendation];
    BOOL v7 = [v6 classification] != 1;

    return v7;
  }
  else
  {
    return [(MRAVOutputDevice *)self discoveredOnSameInfra];
  }
}

- (NSArray)clusterCompositionOutputDevices
{
  uint64_t v2 = [(MRAVOutputDevice *)self clusterComposition];
  BOOL v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_211);

  return (NSArray *)v3;
}

MRAVDistantOutputDevice *__51__MRAVOutputDevice_clusterCompositionOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [MRAVDistantOutputDevice alloc];
  char v4 = [v2 descriptor];

  unsigned int v5 = [(MRAVDistantOutputDevice *)v3 initWithDescriptor:v4];

  return v5;
}

- (NSArray)allClusterMembersOutputDevices
{
  id v2 = [(MRAVOutputDevice *)self allClusterMembers];
  BOOL v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_213);

  return (NSArray *)v3;
}

MRAVDistantOutputDevice *__50__MRAVOutputDevice_allClusterMembersOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [MRAVDistantOutputDevice alloc];
  char v4 = [v2 descriptor];

  unsigned int v5 = [(MRAVDistantOutputDevice *)v3 initWithDescriptor:v4];

  return v5;
}

- (BOOL)isMultiRoom
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  char v4 = [(MRAVOutputDevice *)self roomID];

  if (v4)
  {
    unsigned int v5 = [(MRAVOutputDevice *)self roomID];
    [v3 addObject:v5];
  }
  BOOL v6 = [(MRAVOutputDevice *)self activatedClusterMembersOutputDevices];
  BOOL v7 = objc_msgSend(v6, "msv_compactMap:", &__block_literal_global_217);
  [v3 addObjectsFromArray:v7];

  LOBYTE(v6) = (unint64_t)[v3 count] > 1;
  return (char)v6;
}

uint64_t __31__MRAVOutputDevice_isMultiRoom__block_invoke(uint64_t a1, void *a2)
{
  return [a2 roomID];
}

- (NSArray)rooms
{
  return 0;
}

- (MRRouteRecommendation)recommendation
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_recommendation;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecommendation:(id)a3
{
  char v4 = (MRRouteRecommendation *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  recommendation = obj->_recommendation;
  obj->_recommendation = v4;

  objc_sync_exit(obj);
}

- (MRAVOutputDevice)outputDeviceWithSourceInfoFrom:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MRAVOutputDevice *)self descriptor];
  BOOL v6 = [v4 descriptor];

  BOOL v7 = [v6 sourceInfo];
  [v5 setSourceInfo:v7];

  uint64_t v8 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v5];

  return (MRAVOutputDevice *)v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (void)setAirPlayGroupID:(id)a3
{
}

- (NSData)MACAddress
{
  return self->_MACAddress;
}

- (NSDictionary)modelSpecificInfo
{
  return self->_modelSpecificInfo;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (BOOL)canAccessAppleMusic
{
  return self->_canAccessAppleMusic;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return self->_canAccessiCloudMusicLibrary;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (BOOL)isRemoteControllable
{
  return self->_remoteControllable;
}

- (BOOL)isGroupLeader
{
  return self->_groupLeader;
}

- (BOOL)groupContainsGroupLeader
{
  return self->_groupContainsGroupLeader;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return self->_airPlayReceiverSessionActive;
}

- (BOOL)isGroupable
{
  return self->_groupable;
}

- (BOOL)supportsBluetoothSharing
{
  return self->_supportsBluetoothSharing;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_proxyGroupPlayer;
}

- (BOOL)canRelayCommunicationChannel
{
  return self->_canRelayCommunicationChannel;
}

- (BOOL)supportsBufferedAirPlay
{
  return self->_supportsBufferedAirPlay;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (BOOL)isDeviceGroupable
{
  return self->_deviceGroupable;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_pickedOnPairedDevice;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (unsigned)deviceSubtype
{
  return self->_deviceSubtype;
}

- (NSArray)clusterComposition
{
  return self->_clusterComposition;
}

- (NSArray)allClusterMembers
{
  return self->_allClusterMembers;
}

- (NSArray)activatedClusterMembersOutputDevices
{
  return self->_activatedClusterMembersOutputDevices;
}

- (unint64_t)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)hasBatteryLevel
{
  return self->_hasBatteryLevel;
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (BOOL)supportsExternalScreen
{
  return self->_supportsExternalScreen;
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void)setParentGroupIdentifier:(id)a3
{
}

- (BOOL)producesLowFidelityAudio
{
  return self->_producesLowFidelityAudio;
}

- (NSString)bluetoothID
{
  return self->_bluetoothID;
}

- (BOOL)supportsHAP
{
  return self->_supportsHAP;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (BOOL)isClusterLeader
{
  return self->_clusterLeader;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return self->_supportsEngageOnClusterActivation;
}

- (MRGroupSessionInfo)groupSessionInfo
{
  return self->_groupSessionInfo;
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (BOOL)isAppleAccessory
{
  return self->_appleAccessory;
}

- (NSArray)dnsNames
{
  return self->_dnsNames;
}

- (void)setPrimaryID:(id)a3
{
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return self->_parentGroupContainsDiscoverableLeader;
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return self->_supportsRapportRemoteControlTransport;
}

- (BOOL)supportsSharePlayHandoff
{
  return self->_supportsSharePlayHandoff;
}

- (float)distance
{
  return self->_distance;
}

- (MRAVEndpoint)endpoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpoint);

  return (MRAVEndpoint *)WeakRetained;
}

- (void)setDescriptor:(id)a3
{
}

- (NSString)logicalDeviceID
{
  return self->_logicalDeviceID;
}

- (NSString)tightSyncID
{
  return self->_tightSyncID;
}

- (BOOL)supportsRapport
{
  return self->_supportsRapport;
}

- (BOOL)isAddedToHomeKit
{
  return self->_isAddedToHomeKit;
}

- (NSString)currentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode;
}

- (NSArray)availableBluetoothListeningModes
{
  return self->_availableBluetoothListeningModes;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return self->_supportsHeadTrackedSpatialAudio;
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return self->_allowsHeadTrackedSpatialAudio;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return self->_headTrackedSpatialAudioActive;
}

- (NSString)headTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode;
}

- (BOOL)supportsConversationDetection
{
  return self->_supportsConversationDetection;
}

- (BOOL)isConversationDetectionEnabled
{
  return self->_conversationDetectionEnabled;
}

- (BOOL)discoveredOnSameInfra
{
  return self->_discoveredOnSameInfra;
}

- (MRAVOutputDeviceSourceInfo)sourceInfo
{
  return self->_sourceInfo;
}

@end