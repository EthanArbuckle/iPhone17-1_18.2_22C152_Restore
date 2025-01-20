@interface _MRAVOutputDeviceDescriptorProtobuf
+ (Class)activatedClusterMembersType;
+ (Class)allClusterMembersType;
+ (Class)availableBluetoothListeningModesType;
+ (Class)clusterCompositionType;
+ (Class)dnsNamesType;
- (BOOL)allowsHeadTrackedSpatialAudio;
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)conversationDetectionEnabled;
- (BOOL)discoveredOnSameInfra;
- (BOOL)engageOnClusterActivate;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasAirPlayGroupID;
- (BOOL)hasAllowsHeadTrackedSpatialAudio;
- (BOOL)hasBatteryLevel;
- (BOOL)hasBluetoothID;
- (BOOL)hasCanAccessAppleMusic;
- (BOOL)hasCanAccessRemoteAssets;
- (BOOL)hasCanAccessiCloudMusicLibrary;
- (BOOL)hasCanFetchMediaDataFromSender;
- (BOOL)hasCanPlayEncryptedProgressiveDownloadAssets;
- (BOOL)hasCanRelayCommunicationChannel;
- (BOOL)hasClusterID;
- (BOOL)hasClusterType;
- (BOOL)hasConfiguredClusterSize;
- (BOOL)hasConversationDetectionEnabled;
- (BOOL)hasCurrentBluetoothListeningMode;
- (BOOL)hasDeviceEnclosureColor;
- (BOOL)hasDeviceSubType;
- (BOOL)hasDeviceType;
- (BOOL)hasDiscoveredOnSameInfra;
- (BOOL)hasDistance;
- (BOOL)hasEngageOnClusterActivate;
- (BOOL)hasFirmwareVersion;
- (BOOL)hasGroupContainsGroupLeader;
- (BOOL)hasGroupID;
- (BOOL)hasGroupSessionInfo;
- (BOOL)hasHeadTrackedSpatialAudioMode;
- (BOOL)hasHostDeviceClass;
- (BOOL)hasIsAddedToHomeKit;
- (BOOL)hasIsAirPlayReceiverSessionActive;
- (BOOL)hasIsAppleAccessory;
- (BOOL)hasIsClusterLeader;
- (BOOL)hasIsDeviceGroupable;
- (BOOL)hasIsGroupLeader;
- (BOOL)hasIsGroupable;
- (BOOL)hasIsHeadTrackedSpatialAudioActive;
- (BOOL)hasIsLocalDevice;
- (BOOL)hasIsPickedOnPairedDevice;
- (BOOL)hasIsProxyGroupPlayer;
- (BOOL)hasIsRemoteControllable;
- (BOOL)hasIsVolumeControlAvailable;
- (BOOL)hasLogicalDeviceID;
- (BOOL)hasMacAddress;
- (BOOL)hasModelID;
- (BOOL)hasModelSpecificInfoData;
- (BOOL)hasName;
- (BOOL)hasParentGroupContainsDiscoverableLeader;
- (BOOL)hasParentGroupIdentifier;
- (BOOL)hasParentUniqueIdentifier;
- (BOOL)hasPickable;
- (BOOL)hasPlayingPairedDeviceName;
- (BOOL)hasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)hasPrimaryUID;
- (BOOL)hasProducesLowFidelityAudio;
- (BOOL)hasRequiresAuthorization;
- (BOOL)hasRoomID;
- (BOOL)hasRoomName;
- (BOOL)hasShouldForceRemoteControlabillity;
- (BOOL)hasSourceInfo;
- (BOOL)hasSupportsBluetoothSharing;
- (BOOL)hasSupportsBufferedAirPlay;
- (BOOL)hasSupportsConversationDetection;
- (BOOL)hasSupportsExternalScreen;
- (BOOL)hasSupportsHAP;
- (BOOL)hasSupportsHeadTrackedSpatialAudio;
- (BOOL)hasSupportsMultiplayer;
- (BOOL)hasSupportsRapport;
- (BOOL)hasSupportsRapportRemoteControlTransport;
- (BOOL)hasSupportsSharePlayHandoff;
- (BOOL)hasTransportType;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasUsingJSONProtocol;
- (BOOL)hasVolume;
- (BOOL)hasVolumeCapabilities;
- (BOOL)hasVolumeMuted;
- (BOOL)isAddedToHomeKit;
- (BOOL)isAirPlayReceiverSessionActive;
- (BOOL)isAppleAccessory;
- (BOOL)isClusterLeader;
- (BOOL)isDeviceGroupable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupLeader;
- (BOOL)isGroupable;
- (BOOL)isHeadTrackedSpatialAudioActive;
- (BOOL)isLocalDevice;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isVolumeControlAvailable;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)pickable;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)producesLowFidelityAudio;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresAuthorization;
- (BOOL)shouldForceRemoteControlabillity;
- (BOOL)supportsBluetoothSharing;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsConversationDetection;
- (BOOL)supportsExternalScreen;
- (BOOL)supportsHAP;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsRapport;
- (BOOL)supportsRapportRemoteControlTransport;
- (BOOL)supportsSharePlayHandoff;
- (BOOL)usingJSONProtocol;
- (BOOL)volumeMuted;
- (NSData)macAddress;
- (NSData)modelSpecificInfoData;
- (NSMutableArray)activatedClusterMembers;
- (NSMutableArray)allClusterMembers;
- (NSMutableArray)availableBluetoothListeningModes;
- (NSMutableArray)clusterCompositions;
- (NSMutableArray)dnsNames;
- (NSString)airPlayGroupID;
- (NSString)bluetoothID;
- (NSString)clusterID;
- (NSString)currentBluetoothListeningMode;
- (NSString)deviceEnclosureColor;
- (NSString)firmwareVersion;
- (NSString)groupID;
- (NSString)headTrackedSpatialAudioMode;
- (NSString)logicalDeviceID;
- (NSString)modelID;
- (NSString)name;
- (NSString)parentGroupIdentifier;
- (NSString)parentUniqueIdentifier;
- (NSString)playingPairedDeviceName;
- (NSString)primaryUID;
- (NSString)roomID;
- (NSString)roomName;
- (NSString)uniqueIdentifier;
- (_MRAVOutputDeviceSourceInfoProtobuf)sourceInfo;
- (_MRGroupSessionInfoProtobuf)groupSessionInfo;
- (float)batteryLevel;
- (float)distance;
- (float)volume;
- (id)activatedClusterMembersAtIndex:(unint64_t)a3;
- (id)allClusterMembersAtIndex:(unint64_t)a3;
- (id)availableBluetoothListeningModesAtIndex:(unint64_t)a3;
- (id)clusterCompositionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceSubTypeAsString:(int)a3;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)dnsNamesAtIndex:(unint64_t)a3;
- (id)hostDeviceClassAsString:(int)a3;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsDeviceSubType:(id)a3;
- (int)StringAsDeviceType:(id)a3;
- (int)StringAsHostDeviceClass:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)deviceSubType;
- (int)deviceType;
- (int)hostDeviceClass;
- (int)transportType;
- (int)volumeCapabilities;
- (unint64_t)activatedClusterMembersCount;
- (unint64_t)allClusterMembersCount;
- (unint64_t)availableBluetoothListeningModesCount;
- (unint64_t)clusterCompositionsCount;
- (unint64_t)dnsNamesCount;
- (unint64_t)hash;
- (unsigned)clusterType;
- (unsigned)configuredClusterSize;
- (void)addActivatedClusterMembers:(id)a3;
- (void)addAllClusterMembers:(id)a3;
- (void)addAvailableBluetoothListeningModes:(id)a3;
- (void)addClusterComposition:(id)a3;
- (void)addDnsNames:(id)a3;
- (void)clearActivatedClusterMembers;
- (void)clearAllClusterMembers;
- (void)clearAvailableBluetoothListeningModes;
- (void)clearClusterCompositions;
- (void)clearDnsNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivatedClusterMembers:(id)a3;
- (void)setAirPlayGroupID:(id)a3;
- (void)setAllClusterMembers:(id)a3;
- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3;
- (void)setAvailableBluetoothListeningModes:(id)a3;
- (void)setBatteryLevel:(float)a3;
- (void)setBluetoothID:(id)a3;
- (void)setCanAccessAppleMusic:(BOOL)a3;
- (void)setCanAccessRemoteAssets:(BOOL)a3;
- (void)setCanAccessiCloudMusicLibrary:(BOOL)a3;
- (void)setCanFetchMediaDataFromSender:(BOOL)a3;
- (void)setCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3;
- (void)setCanRelayCommunicationChannel:(BOOL)a3;
- (void)setClusterCompositions:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setClusterType:(unsigned int)a3;
- (void)setConfiguredClusterSize:(unsigned int)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3;
- (void)setCurrentBluetoothListeningMode:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDeviceSubType:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setDiscoveredOnSameInfra:(BOOL)a3;
- (void)setDistance:(float)a3;
- (void)setDnsNames:(id)a3;
- (void)setEngageOnClusterActivate:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setGroupContainsGroupLeader:(BOOL)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupSessionInfo:(id)a3;
- (void)setHasAllowsHeadTrackedSpatialAudio:(BOOL)a3;
- (void)setHasBatteryLevel:(BOOL)a3;
- (void)setHasCanAccessAppleMusic:(BOOL)a3;
- (void)setHasCanAccessRemoteAssets:(BOOL)a3;
- (void)setHasCanAccessiCloudMusicLibrary:(BOOL)a3;
- (void)setHasCanFetchMediaDataFromSender:(BOOL)a3;
- (void)setHasCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3;
- (void)setHasCanRelayCommunicationChannel:(BOOL)a3;
- (void)setHasClusterType:(BOOL)a3;
- (void)setHasConfiguredClusterSize:(BOOL)a3;
- (void)setHasConversationDetectionEnabled:(BOOL)a3;
- (void)setHasDeviceSubType:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasDiscoveredOnSameInfra:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasEngageOnClusterActivate:(BOOL)a3;
- (void)setHasGroupContainsGroupLeader:(BOOL)a3;
- (void)setHasHostDeviceClass:(BOOL)a3;
- (void)setHasIsAddedToHomeKit:(BOOL)a3;
- (void)setHasIsAirPlayReceiverSessionActive:(BOOL)a3;
- (void)setHasIsAppleAccessory:(BOOL)a3;
- (void)setHasIsClusterLeader:(BOOL)a3;
- (void)setHasIsDeviceGroupable:(BOOL)a3;
- (void)setHasIsGroupLeader:(BOOL)a3;
- (void)setHasIsGroupable:(BOOL)a3;
- (void)setHasIsHeadTrackedSpatialAudioActive:(BOOL)a3;
- (void)setHasIsLocalDevice:(BOOL)a3;
- (void)setHasIsPickedOnPairedDevice:(BOOL)a3;
- (void)setHasIsProxyGroupPlayer:(BOOL)a3;
- (void)setHasIsRemoteControllable:(BOOL)a3;
- (void)setHasIsVolumeControlAvailable:(BOOL)a3;
- (void)setHasParentGroupContainsDiscoverableLeader:(BOOL)a3;
- (void)setHasPickable:(BOOL)a3;
- (void)setHasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3;
- (void)setHasProducesLowFidelityAudio:(BOOL)a3;
- (void)setHasRequiresAuthorization:(BOOL)a3;
- (void)setHasShouldForceRemoteControlabillity:(BOOL)a3;
- (void)setHasSupportsBluetoothSharing:(BOOL)a3;
- (void)setHasSupportsBufferedAirPlay:(BOOL)a3;
- (void)setHasSupportsConversationDetection:(BOOL)a3;
- (void)setHasSupportsExternalScreen:(BOOL)a3;
- (void)setHasSupportsHAP:(BOOL)a3;
- (void)setHasSupportsHeadTrackedSpatialAudio:(BOOL)a3;
- (void)setHasSupportsMultiplayer:(BOOL)a3;
- (void)setHasSupportsRapport:(BOOL)a3;
- (void)setHasSupportsRapportRemoteControlTransport:(BOOL)a3;
- (void)setHasSupportsSharePlayHandoff:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasUsingJSONProtocol:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setHasVolumeCapabilities:(BOOL)a3;
- (void)setHasVolumeMuted:(BOOL)a3;
- (void)setHeadTrackedSpatialAudioMode:(id)a3;
- (void)setHostDeviceClass:(int)a3;
- (void)setIsAddedToHomeKit:(BOOL)a3;
- (void)setIsAirPlayReceiverSessionActive:(BOOL)a3;
- (void)setIsAppleAccessory:(BOOL)a3;
- (void)setIsClusterLeader:(BOOL)a3;
- (void)setIsDeviceGroupable:(BOOL)a3;
- (void)setIsGroupLeader:(BOOL)a3;
- (void)setIsGroupable:(BOOL)a3;
- (void)setIsHeadTrackedSpatialAudioActive:(BOOL)a3;
- (void)setIsLocalDevice:(BOOL)a3;
- (void)setIsPickedOnPairedDevice:(BOOL)a3;
- (void)setIsProxyGroupPlayer:(BOOL)a3;
- (void)setIsRemoteControllable:(BOOL)a3;
- (void)setIsVolumeControlAvailable:(BOOL)a3;
- (void)setLogicalDeviceID:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setModelID:(id)a3;
- (void)setModelSpecificInfoData:(id)a3;
- (void)setName:(id)a3;
- (void)setParentGroupContainsDiscoverableLeader:(BOOL)a3;
- (void)setParentGroupIdentifier:(id)a3;
- (void)setParentUniqueIdentifier:(id)a3;
- (void)setPickable:(BOOL)a3;
- (void)setPlayingPairedDeviceName:(id)a3;
- (void)setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3;
- (void)setPrimaryUID:(id)a3;
- (void)setProducesLowFidelityAudio:(BOOL)a3;
- (void)setRequiresAuthorization:(BOOL)a3;
- (void)setRoomID:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setShouldForceRemoteControlabillity:(BOOL)a3;
- (void)setSourceInfo:(id)a3;
- (void)setSupportsBluetoothSharing:(BOOL)a3;
- (void)setSupportsBufferedAirPlay:(BOOL)a3;
- (void)setSupportsConversationDetection:(BOOL)a3;
- (void)setSupportsExternalScreen:(BOOL)a3;
- (void)setSupportsHAP:(BOOL)a3;
- (void)setSupportsHeadTrackedSpatialAudio:(BOOL)a3;
- (void)setSupportsMultiplayer:(BOOL)a3;
- (void)setSupportsRapport:(BOOL)a3;
- (void)setSupportsRapportRemoteControlTransport:(BOOL)a3;
- (void)setSupportsSharePlayHandoff:(BOOL)a3;
- (void)setTransportType:(int)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUsingJSONProtocol:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setVolumeCapabilities:(int)a3;
- (void)setVolumeMuted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAVOutputDeviceDescriptorProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_roomID, 0);
  objc_storeStrong((id *)&self->_primaryUID, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_parentUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfoData, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_headTrackedSpatialAudioMode, 0);
  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_dnsNames, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_currentBluetoothListeningMode, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_clusterCompositions, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_availableBluetoothListeningModes, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);

  objc_storeStrong((id *)&self->_activatedClusterMembers, 0);
}

- (void)setVolumeMuted:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_volumeMuted = a3;
}

- (void)setVolumeCapabilities:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_volumeCapabilities = a3;
}

- (_MRAVOutputDeviceSourceInfoProtobuf)sourceInfo
{
  return self->_sourceInfo;
}

- (NSData)modelSpecificInfoData
{
  return self->_modelSpecificInfoData;
}

- (NSMutableArray)clusterCompositions
{
  return self->_clusterCompositions;
}

- (NSMutableArray)allClusterMembers
{
  return self->_allClusterMembers;
}

- (NSMutableArray)activatedClusterMembers
{
  return self->_activatedClusterMembers;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setSupportsBufferedAirPlay:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_supportsBufferedAirPlay = a3;
}

- (void)setPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = a3;
}

- (void)setParentGroupIdentifier:(id)a3
{
}

- (void)setParentGroupContainsDiscoverableLeader:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_parentGroupContainsDiscoverableLeader = a3;
}

- (void)setName:(id)a3
{
}

- (void)setModelID:(id)a3
{
}

- (void)setMacAddress:(id)a3
{
}

- (void)setLogicalDeviceID:(id)a3
{
}

- (void)setIsRemoteControllable:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_isRemoteControllable = a3;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_isProxyGroupPlayer = a3;
}

- (void)setIsGroupable:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_isGroupable = a3;
}

- (void)setIsGroupLeader:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_isGroupLeader = a3;
}

- (void)setIsDeviceGroupable:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_isDeviceGroupable = a3;
}

- (void)setIsAirPlayReceiverSessionActive:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_isAirPlayReceiverSessionActive = a3;
}

- (void)setIsAddedToHomeKit:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_isAddedToHomeKit = a3;
}

- (void)setHostDeviceClass:(int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_hostDeviceClass = a3;
}

- (void)setGroupID:(id)a3
{
}

- (void)setGroupContainsGroupLeader:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_groupContainsGroupLeader = a3;
}

- (void)setDeviceType:(int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_deviceType = a3;
}

- (void)setDeviceSubType:(int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_deviceSubType = a3;
}

- (void)setCanRelayCommunicationChannel:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_canRelayCommunicationChannel = a3;
}

- (void)setCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_canPlayEncryptedProgressiveDownloadAssets = a3;
}

- (void)setCanFetchMediaDataFromSender:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_canFetchMediaDataFromSender = a3;
}

- (void)setCanAccessiCloudMusicLibrary:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_canAccessiCloudMusicLibrary = a3;
}

- (void)setCanAccessRemoteAssets:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_canAccessRemoteAssets = a3;
}

- (void)setCanAccessAppleMusic:(BOOL)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_canAccessAppleMusic = a3;
}

- (void)setUsingJSONProtocol:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_usingJSONProtocol = a3;
}

- (void)setTransportType:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_transportType = a3;
}

- (void)setSupportsSharePlayHandoff:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_supportsSharePlayHandoff = a3;
}

- (void)setSupportsRapportRemoteControlTransport:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_supportsRapportRemoteControlTransport = a3;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_supportsMultiplayer = a3;
}

- (void)setSupportsHAP:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_supportsHAP = a3;
}

- (void)setSupportsExternalScreen:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_supportsExternalScreen = a3;
}

- (void)setSourceInfo:(id)a3
{
}

- (void)setRoomName:(id)a3
{
}

- (void)setRoomID:(id)a3
{
}

- (void)setRequiresAuthorization:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_requiresAuthorization = a3;
}

- (void)setProducesLowFidelityAudio:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_producesLowFidelityAudio = a3;
}

- (void)setPrimaryUID:(id)a3
{
}

- (void)setPlayingPairedDeviceName:(id)a3
{
}

- (void)setPickable:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_pickable = a3;
}

- (void)setParentUniqueIdentifier:(id)a3
{
}

- (void)setModelSpecificInfoData:(id)a3
{
}

- (void)setIsLocalDevice:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_isLocalDevice = a3;
}

- (void)setIsClusterLeader:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_isClusterLeader = a3;
}

- (void)setIsAppleAccessory:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_isAppleAccessory = a3;
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3
{
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
}

- (void)setConfiguredClusterSize:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_configuredClusterSize = a3;
}

- (void)setClusterType:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_clusterType = a3;
}

- (void)setClusterID:(id)a3
{
}

- (void)setBluetoothID:(id)a3
{
}

- (void)setAvailableBluetoothListeningModes:(id)a3
{
}

- (void)setAirPlayGroupID:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setVolume:(float)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_volume = a3;
}

- (void)setIsVolumeControlAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_isVolumeControlAvailable = a3;
}

- (void)setHasVolumeMuted:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (void)setHasVolume:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setHasIsVolumeControlAvailable:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_454;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_454;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_454;
    }
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:")) {
      goto LABEL_454;
    }
  }
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](modelID, "isEqual:")) {
      goto LABEL_454;
    }
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](macAddress, "isEqual:")) {
      goto LABEL_454;
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  uint64_t v11 = *(void *)(v4 + 324);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0) {
      goto LABEL_454;
    }
    if (self->_canAccessRemoteAssets)
    {
      if (!v4[282]) {
        goto LABEL_454;
      }
    }
    else if (v4[282])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isRemoteControllable)
    {
      if (!v4[302]) {
        goto LABEL_454;
      }
    }
    else if (v4[302])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isGroupLeader)
    {
      if (!v4[296]) {
        goto LABEL_454;
      }
    }
    else if (v4[296])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v11 & 0x8000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isGroupable)
    {
      if (!v4[297]) {
        goto LABEL_454;
      }
    }
    else if (v4[297])
    {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x8000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_deviceType != *((_DWORD *)v4 + 25)) {
      goto LABEL_454;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_454;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_deviceSubType != *((_DWORD *)v4 + 24)) {
      goto LABEL_454;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_454;
  }
  modelSpecificInfoData = self->_modelSpecificInfoData;
  if ((unint64_t)modelSpecificInfoData | *((void *)v4 + 23))
  {
    if (!-[NSData isEqual:](modelSpecificInfoData, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v13 = *(void *)(v4 + 324);
  if (*(unsigned char *)&has)
  {
    if ((v13 & 1) == 0 || self->_batteryLevel != *((float *)v4 + 10)) {
      goto LABEL_454;
    }
  }
  else if (v13)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v13 & 0x20000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isLocalDevice)
    {
      if (!v4[299]) {
        goto LABEL_454;
      }
    }
    else if (v4[299])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x20000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v13 & 0x80000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsExternalScreen)
    {
      if (!v4[313]) {
        goto LABEL_454;
      }
    }
    else if (v4[313])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x80000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v13 & 0x4000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_requiresAuthorization)
    {
      if (!v4[308]) {
        goto LABEL_454;
      }
    }
    else if (v4[308])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x4000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v13 & 0x8000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_shouldForceRemoteControlabillity)
    {
      if (!v4[309]) {
        goto LABEL_454;
      }
    }
    else if (v4[309])
    {
      goto LABEL_454;
    }
  }
  else if ((v13 & 0x8000000000) != 0)
  {
    goto LABEL_454;
  }
  sourceInfo = self->_sourceInfo;
  if ((unint64_t)sourceInfo | *((void *)v4 + 31))
  {
    if (!-[_MRAVOutputDeviceSourceInfoProtobuf isEqual:](sourceInfo, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v15 = *(void *)(v4 + 324);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isDeviceGroupable)
    {
      if (!v4[295]) {
        goto LABEL_454;
      }
    }
    else if (v4[295])
    {
      goto LABEL_454;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0) {
      goto LABEL_454;
    }
    if (self->_canRelayCommunicationChannel)
    {
      if (!v4[286]) {
        goto LABEL_454;
      }
    }
    else if (v4[286])
    {
      goto LABEL_454;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_454;
  }
  logicalDeviceID = self->_logicalDeviceID;
  if ((unint64_t)logicalDeviceID | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](logicalDeviceID, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v17 = *(void *)(v4 + 324);
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isProxyGroupPlayer)
    {
      if (!v4[301]) {
        goto LABEL_454;
      }
    }
    else if (v4[301])
    {
      goto LABEL_454;
    }
  }
  else if ((v17 & 0x80000000) != 0)
  {
    goto LABEL_454;
  }
  firmwareVersion = self->_firmwareVersion;
  if ((unint64_t)firmwareVersion | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](firmwareVersion, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v19 = *(void *)(v4 + 324);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_volume != *((float *)v4 + 68)) {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v19 & 0x200000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isVolumeControlAvailable)
    {
      if (!v4[303]) {
        goto LABEL_454;
      }
    }
    else if (v4[303])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x200000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0) {
      goto LABEL_454;
    }
    if (self->_canAccessAppleMusic)
    {
      if (!v4[281]) {
        goto LABEL_454;
      }
    }
    else if (v4[281])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0) {
      goto LABEL_454;
    }
    if (self->_canAccessiCloudMusicLibrary)
    {
      if (!v4[283]) {
        goto LABEL_454;
      }
    }
    else if (v4[283])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0) {
      goto LABEL_454;
    }
    if (self->_groupContainsGroupLeader)
    {
      if (!v4[290]) {
        goto LABEL_454;
      }
    }
    else if (v4[290])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v19 & 0x20000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsBufferedAirPlay)
    {
      if (!v4[311]) {
        goto LABEL_454;
      }
    }
    else if (v4[311])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x20000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0) {
      goto LABEL_454;
    }
    if (self->_canPlayEncryptedProgressiveDownloadAssets)
    {
      if (!v4[285]) {
        goto LABEL_454;
      }
    }
    else if (v4[285])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v19 & 0x4000) == 0) {
      goto LABEL_454;
    }
    if (self->_canFetchMediaDataFromSender)
    {
      if (!v4[284]) {
        goto LABEL_454;
      }
    }
    else if (v4[284])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v19 & 0x1000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets)
    {
      if (!v4[306]) {
        goto LABEL_454;
      }
    }
    else if (v4[306])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x1000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v19 & 0x400000) == 0) {
      goto LABEL_454;
    }
    if (self->_isAirPlayReceiverSessionActive)
    {
      if (!v4[292]) {
        goto LABEL_454;
      }
    }
    else if (v4[292])
    {
      goto LABEL_454;
    }
  }
  else if ((v19 & 0x400000) != 0)
  {
    goto LABEL_454;
  }
  parentGroupIdentifier = self->_parentGroupIdentifier;
  if ((unint64_t)parentGroupIdentifier | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](parentGroupIdentifier, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v21 = *(void *)(v4 + 324);
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0) {
      goto LABEL_454;
    }
    if (self->_parentGroupContainsDiscoverableLeader)
    {
      if (!v4[304]) {
        goto LABEL_454;
      }
    }
    else if (v4[304])
    {
      goto LABEL_454;
    }
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v21 & 0x200000) == 0) {
      goto LABEL_454;
    }
    if (self->_isAddedToHomeKit)
    {
      if (!v4[291]) {
        goto LABEL_454;
      }
    }
    else if (v4[291])
    {
      goto LABEL_454;
    }
  }
  else if ((v21 & 0x200000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v21 & 0x200) == 0 || self->_volumeCapabilities != *((_DWORD *)v4 + 69)) {
      goto LABEL_454;
    }
  }
  else if ((v21 & 0x200) != 0)
  {
    goto LABEL_454;
  }
  bluetoothID = self->_bluetoothID;
  if ((unint64_t)bluetoothID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](bluetoothID, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v23 = *(void *)(v4 + 324);
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v23 & 0x100000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsHAP)
    {
      if (!v4[314]) {
        goto LABEL_454;
      }
    }
    else if (v4[314])
    {
      goto LABEL_454;
    }
  }
  else if ((v23 & 0x100000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v23 & 0x4000000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_usingJSONProtocol)
    {
      if (!v4[320]) {
        goto LABEL_454;
      }
    }
    else if (v4[320])
    {
      goto LABEL_454;
    }
  }
  else if ((v23 & 0x4000000000000) != 0)
  {
    goto LABEL_454;
  }
  clusterCompositions = self->_clusterCompositions;
  if ((unint64_t)clusterCompositions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](clusterCompositions, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v25 = *(void *)(v4 + 324);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_clusterType != *((_DWORD *)v4 + 18)) {
      goto LABEL_454;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_454;
  }
  primaryUID = self->_primaryUID;
  if ((unint64_t)primaryUID | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](primaryUID, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  }
  uint64_t v27 = *(void *)(v4 + 324);
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v27 & 4) == 0 || self->_configuredClusterSize != *((_DWORD *)v4 + 19)) {
      goto LABEL_454;
    }
  }
  else if ((v27 & 4) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v27 & 0x1000000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsRapportRemoteControlTransport)
    {
      if (!v4[318]) {
        goto LABEL_454;
      }
    }
    else if (v4[318])
    {
      goto LABEL_454;
    }
  }
  else if ((v27 & 0x1000000000000) != 0)
  {
    goto LABEL_454;
  }
  currentBluetoothListeningMode = self->_currentBluetoothListeningMode;
  if ((unint64_t)currentBluetoothListeningMode | *((void *)v4 + 10)
    && !-[NSString isEqual:](currentBluetoothListeningMode, "isEqual:"))
  {
    goto LABEL_454;
  }
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  if ((unint64_t)availableBluetoothListeningModes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](availableBluetoothListeningModes, "isEqual:")) {
      goto LABEL_454;
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  uint64_t v31 = *(void *)(v4 + 324);
  if ((*(void *)&v30 & 0x400000000000) != 0)
  {
    if ((v31 & 0x400000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsMultiplayer)
    {
      if (!v4[316]) {
        goto LABEL_454;
      }
    }
    else if (v4[316])
    {
      goto LABEL_454;
    }
  }
  else if ((v31 & 0x400000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&v30 & 0x2000000000) != 0)
  {
    if ((v31 & 0x2000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_producesLowFidelityAudio)
    {
      if (!v4[307]) {
        goto LABEL_454;
      }
    }
    else if (v4[307])
    {
      goto LABEL_454;
    }
  }
  else if ((v31 & 0x2000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(unsigned char *)&v30 & 0x40) != 0)
  {
    if ((v31 & 0x40) == 0 || self->_hostDeviceClass != *((_DWORD *)v4 + 38)) {
      goto LABEL_454;
    }
  }
  else if ((v31 & 0x40) != 0)
  {
    goto LABEL_454;
  }
  airPlayGroupID = self->_airPlayGroupID;
  if ((unint64_t)airPlayGroupID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](airPlayGroupID, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  }
  uint64_t v33 = *(void *)(v4 + 324);
  if ((*(void *)&v30 & 0x2000000000000) != 0)
  {
    if ((v33 & 0x2000000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsSharePlayHandoff)
    {
      if (!v4[319]) {
        goto LABEL_454;
      }
    }
    else if (v4[319])
    {
      goto LABEL_454;
    }
  }
  else if ((v33 & 0x2000000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(unsigned char *)&v30 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_distance != *((float *)v4 + 26)) {
      goto LABEL_454;
    }
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v30 & 0x40000) != 0)
  {
    if ((v33 & 0x40000) == 0) {
      goto LABEL_454;
    }
    if (self->_discoveredOnSameInfra)
    {
      if (!v4[288]) {
        goto LABEL_454;
      }
    }
    else if (v4[288])
    {
      goto LABEL_454;
    }
  }
  else if ((v33 & 0x40000) != 0)
  {
    goto LABEL_454;
  }
  activatedClusterMembers = self->_activatedClusterMembers;
  if ((unint64_t)activatedClusterMembers | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](activatedClusterMembers, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  }
  uint64_t v35 = *(void *)(v4 + 324);
  if ((*(void *)&v30 & 0x800000000) != 0)
  {
    if ((v35 & 0x800000000) == 0) {
      goto LABEL_454;
    }
    if (self->_pickable)
    {
      if (!v4[305]) {
        goto LABEL_454;
      }
    }
    else if (v4[305])
    {
      goto LABEL_454;
    }
  }
  else if ((v35 & 0x800000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(unsigned char *)&v30 & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0 || self->_transportType != *((_DWORD *)v4 + 64)) {
      goto LABEL_454;
    }
  }
  else if ((v35 & 0x80) != 0)
  {
    goto LABEL_454;
  }
  clusterID = self->_clusterID;
  if ((unint64_t)clusterID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](clusterID, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  }
  uint64_t v37 = *(void *)(v4 + 324);
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isClusterLeader)
    {
      if (!v4[294]) {
        goto LABEL_454;
      }
    }
    else if (v4[294])
    {
      goto LABEL_454;
    }
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    if ((v37 & 0x800000) == 0) {
      goto LABEL_454;
    }
    if (self->_isAppleAccessory)
    {
      if (!v4[293]) {
        goto LABEL_454;
      }
    }
    else if (v4[293])
    {
      goto LABEL_454;
    }
  }
  else if ((v37 & 0x800000) != 0)
  {
    goto LABEL_454;
  }
  parentUniqueIdentifier = self->_parentUniqueIdentifier;
  if ((unint64_t)parentUniqueIdentifier | *((void *)v4 + 26)
    && !-[NSString isEqual:](parentUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_454;
  }
  roomID = self->_roomID;
  if ((unint64_t)roomID | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](roomID, "isEqual:")) {
      goto LABEL_454;
    }
  }
  roomName = self->_roomName;
  if ((unint64_t)roomName | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](roomName, "isEqual:")) {
      goto LABEL_454;
    }
  }
  allClusterMembers = self->_allClusterMembers;
  if ((unint64_t)allClusterMembers | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](allClusterMembers, "isEqual:")) {
      goto LABEL_454;
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v42 = self->_has;
  uint64_t v43 = *(void *)(v4 + 324);
  if ((*(void *)&v42 & 0x40000000000) != 0)
  {
    if ((v43 & 0x40000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsConversationDetection)
    {
      if (!v4[312]) {
        goto LABEL_454;
      }
    }
    else if (v4[312])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x40000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v42 & 0x20000) != 0)
  {
    if ((v43 & 0x20000) == 0) {
      goto LABEL_454;
    }
    if (self->_conversationDetectionEnabled)
    {
      if (!v4[287]) {
        goto LABEL_454;
      }
    }
    else if (v4[287])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x20000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v42 & 0x80000) != 0)
  {
    if ((v43 & 0x80000) == 0) {
      goto LABEL_454;
    }
    if (self->_engageOnClusterActivate)
    {
      if (!v4[289]) {
        goto LABEL_454;
      }
    }
    else if (v4[289])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x80000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&v42 & 0x8000000000000) != 0)
  {
    if ((v43 & 0x8000000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_volumeMuted)
    {
      if (!v4[321]) {
        goto LABEL_454;
      }
    }
    else if (v4[321])
    {
      goto LABEL_454;
    }
  }
  else if ((v43 & 0x8000000000000) != 0)
  {
    goto LABEL_454;
  }
  groupSessionInfo = self->_groupSessionInfo;
  if ((unint64_t)groupSessionInfo | *((void *)v4 + 17))
  {
    if (!-[_MRGroupSessionInfoProtobuf isEqual:](groupSessionInfo, "isEqual:")) {
      goto LABEL_454;
    }
    $F5690C47DB6193B0809CC40AF9394DD6 v42 = self->_has;
  }
  uint64_t v45 = *(void *)(v4 + 324);
  if ((*(void *)&v42 & 0x10000000000) != 0)
  {
    if ((v45 & 0x10000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsBluetoothSharing)
    {
      if (!v4[310]) {
        goto LABEL_454;
      }
    }
    else if (v4[310])
    {
      goto LABEL_454;
    }
  }
  else if ((v45 & 0x10000000000) != 0)
  {
    goto LABEL_454;
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((void *)v4 + 11)
    && !-[NSString isEqual:](deviceEnclosureColor, "isEqual:"))
  {
    goto LABEL_454;
  }
  playingPairedDeviceName = self->_playingPairedDeviceName;
  if ((unint64_t)playingPairedDeviceName | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](playingPairedDeviceName, "isEqual:")) {
      goto LABEL_454;
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v48 = self->_has;
  uint64_t v49 = *(void *)(v4 + 324);
  if ((*(void *)&v48 & 0x800000000000) != 0)
  {
    if ((v49 & 0x800000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsRapport)
    {
      if (!v4[317]) {
        goto LABEL_454;
      }
    }
    else if (v4[317])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x800000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v48 & 0x40000000) != 0)
  {
    if ((v49 & 0x40000000) == 0) {
      goto LABEL_454;
    }
    if (self->_isPickedOnPairedDevice)
    {
      if (!v4[300]) {
        goto LABEL_454;
      }
    }
    else if (v4[300])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x40000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(void *)&v48 & 0x200000000000) != 0)
  {
    if ((v49 & 0x200000000000) == 0) {
      goto LABEL_454;
    }
    if (self->_supportsHeadTrackedSpatialAudio)
    {
      if (!v4[315]) {
        goto LABEL_454;
      }
    }
    else if (v4[315])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x200000000000) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_WORD *)&v48 & 0x400) != 0)
  {
    if ((v49 & 0x400) == 0) {
      goto LABEL_454;
    }
    if (self->_allowsHeadTrackedSpatialAudio)
    {
      if (!v4[280]) {
        goto LABEL_454;
      }
    }
    else if (v4[280])
    {
      goto LABEL_454;
    }
  }
  else if ((v49 & 0x400) != 0)
  {
    goto LABEL_454;
  }
  if ((*(_DWORD *)&v48 & 0x10000000) == 0)
  {
    if ((v49 & 0x10000000) == 0) {
      goto LABEL_450;
    }
LABEL_454:
    char v52 = 0;
    goto LABEL_455;
  }
  if ((v49 & 0x10000000) == 0) {
    goto LABEL_454;
  }
  if (self->_isHeadTrackedSpatialAudioActive)
  {
    if (!v4[298]) {
      goto LABEL_454;
    }
  }
  else if (v4[298])
  {
    goto LABEL_454;
  }
LABEL_450:
  headTrackedSpatialAudioMode = self->_headTrackedSpatialAudioMode;
  if ((unint64_t)headTrackedSpatialAudioMode | *((void *)v4 + 18)
    && !-[NSString isEqual:](headTrackedSpatialAudioMode, "isEqual:"))
  {
    goto LABEL_454;
  }
  dnsNames = self->_dnsNames;
  if ((unint64_t)dnsNames | *((void *)v4 + 14)) {
    char v52 = -[NSMutableArray isEqual:](dnsNames, "isEqual:");
  }
  else {
    char v52 = 1;
  }
LABEL_455:

  return v52;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (int)transportType
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (int)deviceType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_deviceType;
  }
  else {
    return 0;
  }
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (int)deviceSubType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_deviceSubType;
  }
  else {
    return 0;
  }
}

- (BOOL)usingJSONProtocol
{
  return self->_usingJSONProtocol;
}

- (BOOL)supportsHAP
{
  return self->_supportsHAP;
}

- (BOOL)supportsBufferedAirPlay
{
  return self->_supportsBufferedAirPlay;
}

- (BOOL)supportsBluetoothSharing
{
  return self->_supportsBluetoothSharing;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return self->_parentGroupContainsDiscoverableLeader;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)isRemoteControllable
{
  return self->_isRemoteControllable;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (BOOL)isGroupable
{
  return self->_isGroupable;
}

- (BOOL)isGroupLeader
{
  return self->_isGroupLeader;
}

- (BOOL)isDeviceGroupable
{
  return self->_isDeviceGroupable;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return self->_isAirPlayReceiverSessionActive;
}

- (BOOL)isAddedToHomeKit
{
  return self->_isAddedToHomeKit;
}

- (BOOL)hasBatteryLevel
{
  return *(_DWORD *)&self->_has & 1;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (BOOL)groupContainsGroupLeader
{
  return self->_groupContainsGroupLeader;
}

- (unsigned)clusterType
{
  return self->_clusterType;
}

- (BOOL)canRelayCommunicationChannel
{
  return self->_canRelayCommunicationChannel;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return self->_canAccessiCloudMusicLibrary;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (BOOL)canAccessAppleMusic
{
  return self->_canAccessAppleMusic;
}

- (NSString)bluetoothID
{
  return self->_bluetoothID;
}

- (int)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (BOOL)volumeMuted
{
  return self->_volumeMuted;
}

- (float)volume
{
  return self->_volume;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v6;

  uint64_t v8 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v8;

  uint64_t v10 = [(NSString *)self->_groupID copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v10;

  uint64_t v12 = [(NSString *)self->_modelID copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v12;

  uint64_t v14 = [(NSData *)self->_macAddress copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v14;

  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 282) = self->_canAccessRemoteAssets;
    *(void *)(v5 + 324) |= 0x1000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_112;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 302) = self->_isRemoteControllable;
  *(void *)(v5 + 324) |= 0x100000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(unsigned char *)(v5 + 296) = self->_isGroupLeader;
  *(void *)(v5 + 324) |= 0x4000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(unsigned char *)(v5 + 297) = self->_isGroupable;
  *(void *)(v5 + 324) |= 0x8000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_114:
  *(_DWORD *)(v5 + 100) = self->_deviceType;
  *(void *)(v5 + 324) |= 0x10uLL;
  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 96) = self->_deviceSubType;
    *(void *)(v5 + 324) |= 8uLL;
  }
LABEL_8:
  uint64_t v17 = [(NSData *)self->_modelSpecificInfoData copyWithZone:a3];
  v18 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v17;

  $F5690C47DB6193B0809CC40AF9394DD6 v19 = self->_has;
  if (*(unsigned char *)&v19)
  {
    *(float *)(v5 + 40) = self->_batteryLevel;
    *(void *)(v5 + 324) |= 1uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x20000000) == 0)
    {
LABEL_10:
      if ((*(void *)&v19 & 0x80000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_118;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x20000000) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 299) = self->_isLocalDevice;
  *(void *)(v5 + 324) |= 0x20000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v19 = self->_has;
  if ((*(void *)&v19 & 0x80000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&v19 & 0x4000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(unsigned char *)(v5 + 313) = self->_supportsExternalScreen;
  *(void *)(v5 + 324) |= 0x80000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v19 = self->_has;
  if ((*(void *)&v19 & 0x4000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&v19 & 0x8000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_119:
  *(unsigned char *)(v5 + 308) = self->_requiresAuthorization;
  *(void *)(v5 + 324) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x8000000000) != 0)
  {
LABEL_13:
    *(unsigned char *)(v5 + 309) = self->_shouldForceRemoteControlabillity;
    *(void *)(v5 + 324) |= 0x8000000000uLL;
  }
LABEL_14:
  id v20 = [(_MRAVOutputDeviceSourceInfoProtobuf *)self->_sourceInfo copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v20;

  $F5690C47DB6193B0809CC40AF9394DD6 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 295) = self->_isDeviceGroupable;
    *(void *)(v5 + 324) |= 0x2000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v22 = self->_has;
  }
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    *(unsigned char *)(v5 + 286) = self->_canRelayCommunicationChannel;
    *(void *)(v5 + 324) |= 0x10000uLL;
  }
  uint64_t v23 = [(NSString *)self->_logicalDeviceID copyWithZone:a3];
  v24 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v23;

  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 301) = self->_isProxyGroupPlayer;
    *(void *)(v5 + 324) |= 0x80000000uLL;
  }
  uint64_t v25 = [(NSString *)self->_firmwareVersion copyWithZone:a3];
  v26 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v25;

  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x100) != 0)
  {
    *(float *)(v5 + 272) = self->_volume;
    *(void *)(v5 + 324) |= 0x100uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
    if ((*(void *)&v27 & 0x200000000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v27 & 0x800) == 0) {
        goto LABEL_23;
      }
      goto LABEL_123;
    }
  }
  else if ((*(void *)&v27 & 0x200000000) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v5 + 303) = self->_isVolumeControlAvailable;
  *(void *)(v5 + 324) |= 0x200000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v27 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(unsigned char *)(v5 + 281) = self->_canAccessAppleMusic;
  *(void *)(v5 + 324) |= 0x800uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v27 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(unsigned char *)(v5 + 283) = self->_canAccessiCloudMusicLibrary;
  *(void *)(v5 + 324) |= 0x2000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(void *)&v27 & 0x20000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_126;
  }
LABEL_125:
  *(unsigned char *)(v5 + 290) = self->_groupContainsGroupLeader;
  *(void *)(v5 + 324) |= 0x100000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(void *)&v27 & 0x20000000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v27 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_127;
  }
LABEL_126:
  *(unsigned char *)(v5 + 311) = self->_supportsBufferedAirPlay;
  *(void *)(v5 + 324) |= 0x20000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v27 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(unsigned char *)(v5 + 285) = self->_canPlayEncryptedProgressiveDownloadAssets;
  *(void *)(v5 + 324) |= 0x8000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(void *)&v27 & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(unsigned char *)(v5 + 284) = self->_canFetchMediaDataFromSender;
  *(void *)(v5 + 324) |= 0x4000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(void *)&v27 & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v27 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_129:
  *(unsigned char *)(v5 + 306) = self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
  *(void *)(v5 + 324) |= 0x1000000000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_30:
    *(unsigned char *)(v5 + 292) = self->_isAirPlayReceiverSessionActive;
    *(void *)(v5 + 324) |= 0x400000uLL;
  }
LABEL_31:
  uint64_t v28 = [(NSString *)self->_parentGroupIdentifier copyWithZone:a3];
  v29 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v28;

  $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  if ((*(void *)&v30 & 0x400000000) != 0)
  {
    *(unsigned char *)(v5 + 304) = self->_parentGroupContainsDiscoverableLeader;
    *(void *)(v5 + 324) |= 0x400000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
    if ((*(_DWORD *)&v30 & 0x200000) == 0)
    {
LABEL_33:
      if ((*(_WORD *)&v30 & 0x200) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&v30 & 0x200000) == 0)
  {
    goto LABEL_33;
  }
  *(unsigned char *)(v5 + 291) = self->_isAddedToHomeKit;
  *(void *)(v5 + 324) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x200) != 0)
  {
LABEL_34:
    *(_DWORD *)(v5 + 276) = self->_volumeCapabilities;
    *(void *)(v5 + 324) |= 0x200uLL;
  }
LABEL_35:
  uint64_t v31 = [(NSString *)self->_bluetoothID copyWithZone:a3];
  v32 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v31;

  $F5690C47DB6193B0809CC40AF9394DD6 v33 = self->_has;
  if ((*(void *)&v33 & 0x100000000000) != 0)
  {
    *(unsigned char *)(v5 + 314) = self->_supportsHAP;
    *(void *)(v5 + 324) |= 0x100000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v33 = self->_has;
  }
  if ((*(void *)&v33 & 0x4000000000000) != 0)
  {
    *(unsigned char *)(v5 + 320) = self->_usingJSONProtocol;
    *(void *)(v5 + 324) |= 0x4000000000000uLL;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v34 = self->_clusterCompositions;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v112;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v112 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = (void *)[*(id *)(*((void *)&v111 + 1) + 8 * v38) copyWithZone:a3];
        [(id)v5 addClusterComposition:v39];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v111 objects:v119 count:16];
    }
    while (v36);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_clusterType;
    *(void *)(v5 + 324) |= 2uLL;
  }
  uint64_t v40 = [(NSString *)self->_primaryUID copyWithZone:a3];
  v41 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v40;

  $F5690C47DB6193B0809CC40AF9394DD6 v42 = self->_has;
  if ((*(unsigned char *)&v42 & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_configuredClusterSize;
    *(void *)(v5 + 324) |= 4uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v42 = self->_has;
  }
  if ((*(void *)&v42 & 0x1000000000000) != 0)
  {
    *(unsigned char *)(v5 + 318) = self->_supportsRapportRemoteControlTransport;
    *(void *)(v5 + 324) |= 0x1000000000000uLL;
  }
  uint64_t v43 = [(NSString *)self->_currentBluetoothListeningMode copyWithZone:a3];
  v44 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v43;

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v45 = self->_availableBluetoothListeningModes;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v108;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v108 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * v49) copyWithZone:a3];
        [(id)v5 addAvailableBluetoothListeningModes:v50];

        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v107 objects:v118 count:16];
    }
    while (v47);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v51 = self->_has;
  if ((*(void *)&v51 & 0x400000000000) != 0)
  {
    *(unsigned char *)(v5 + 316) = self->_supportsMultiplayer;
    *(void *)(v5 + 324) |= 0x400000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v51 = self->_has;
    if ((*(void *)&v51 & 0x2000000000) == 0)
    {
LABEL_61:
      if ((*(unsigned char *)&v51 & 0x40) == 0) {
        goto LABEL_63;
      }
      goto LABEL_62;
    }
  }
  else if ((*(void *)&v51 & 0x2000000000) == 0)
  {
    goto LABEL_61;
  }
  *(unsigned char *)(v5 + 307) = self->_producesLowFidelityAudio;
  *(void *)(v5 + 324) |= 0x2000000000uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_62:
    *(_DWORD *)(v5 + 152) = self->_hostDeviceClass;
    *(void *)(v5 + 324) |= 0x40uLL;
  }
LABEL_63:
  uint64_t v52 = [(NSString *)self->_airPlayGroupID copyWithZone:a3];
  v53 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v52;

  $F5690C47DB6193B0809CC40AF9394DD6 v54 = self->_has;
  if ((*(void *)&v54 & 0x2000000000000) != 0)
  {
    *(unsigned char *)(v5 + 319) = self->_supportsSharePlayHandoff;
    *(void *)(v5 + 324) |= 0x2000000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v54 = self->_has;
    if ((*(unsigned char *)&v54 & 0x20) == 0)
    {
LABEL_65:
      if ((*(_DWORD *)&v54 & 0x40000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_66;
    }
  }
  else if ((*(unsigned char *)&v54 & 0x20) == 0)
  {
    goto LABEL_65;
  }
  *(float *)(v5 + 104) = self->_distance;
  *(void *)(v5 + 324) |= 0x20uLL;
  if ((*(void *)&self->_has & 0x40000) != 0)
  {
LABEL_66:
    *(unsigned char *)(v5 + 288) = self->_discoveredOnSameInfra;
    *(void *)(v5 + 324) |= 0x40000uLL;
  }
LABEL_67:
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v55 = self->_activatedClusterMembers;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v104;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v104 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * v59) copyWithZone:a3];
        [(id)v5 addActivatedClusterMembers:v60];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v103 objects:v117 count:16];
    }
    while (v57);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v61 = self->_has;
  if ((*(void *)&v61 & 0x800000000) != 0)
  {
    *(unsigned char *)(v5 + 305) = self->_pickable;
    *(void *)(v5 + 324) |= 0x800000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v61 = self->_has;
  }
  if ((*(unsigned char *)&v61 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_transportType;
    *(void *)(v5 + 324) |= 0x80uLL;
  }
  uint64_t v62 = [(NSString *)self->_clusterID copyWithZone:a3];
  v63 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v62;

  $F5690C47DB6193B0809CC40AF9394DD6 v64 = self->_has;
  if ((*(_DWORD *)&v64 & 0x1000000) != 0)
  {
    *(unsigned char *)(v5 + 294) = self->_isClusterLeader;
    *(void *)(v5 + 324) |= 0x1000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v64 = self->_has;
  }
  if ((*(_DWORD *)&v64 & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 293) = self->_isAppleAccessory;
    *(void *)(v5 + 324) |= 0x800000uLL;
  }
  uint64_t v65 = [(NSString *)self->_parentUniqueIdentifier copyWithZone:a3];
  v66 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v65;

  uint64_t v67 = [(NSString *)self->_roomID copyWithZone:a3];
  v68 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v67;

  uint64_t v69 = [(NSString *)self->_roomName copyWithZone:a3];
  v70 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v69;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v71 = self->_allClusterMembers;
  uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v99 objects:v116 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v100;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v100 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * v75) copyWithZone:a3];
        [(id)v5 addAllClusterMembers:v76];

        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v99 objects:v116 count:16];
    }
    while (v73);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v77 = self->_has;
  if ((*(void *)&v77 & 0x40000000000) != 0)
  {
    *(unsigned char *)(v5 + 312) = self->_supportsConversationDetection;
    *(void *)(v5 + 324) |= 0x40000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v77 = self->_has;
    if ((*(_DWORD *)&v77 & 0x20000) == 0)
    {
LABEL_91:
      if ((*(_DWORD *)&v77 & 0x80000) == 0) {
        goto LABEL_92;
      }
      goto LABEL_142;
    }
  }
  else if ((*(_DWORD *)&v77 & 0x20000) == 0)
  {
    goto LABEL_91;
  }
  *(unsigned char *)(v5 + 287) = self->_conversationDetectionEnabled;
  *(void *)(v5 + 324) |= 0x20000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v77 = self->_has;
  if ((*(_DWORD *)&v77 & 0x80000) == 0)
  {
LABEL_92:
    if ((*(void *)&v77 & 0x8000000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_142:
  *(unsigned char *)(v5 + 289) = self->_engageOnClusterActivate;
  *(void *)(v5 + 324) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_93:
    *(unsigned char *)(v5 + 321) = self->_volumeMuted;
    *(void *)(v5 + 324) |= 0x8000000000000uLL;
  }
LABEL_94:
  id v78 = [(_MRGroupSessionInfoProtobuf *)self->_groupSessionInfo copyWithZone:a3];
  v79 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v78;

  if (*((unsigned char *)&self->_has + 5))
  {
    *(unsigned char *)(v5 + 310) = self->_supportsBluetoothSharing;
    *(void *)(v5 + 324) |= 0x10000000000uLL;
  }
  uint64_t v80 = [(NSString *)self->_deviceEnclosureColor copyWithZone:a3];
  v81 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v80;

  uint64_t v82 = [(NSString *)self->_playingPairedDeviceName copyWithZone:a3];
  v83 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v82;

  $F5690C47DB6193B0809CC40AF9394DD6 v84 = self->_has;
  if ((*(void *)&v84 & 0x800000000000) != 0)
  {
    *(unsigned char *)(v5 + 317) = self->_supportsRapport;
    *(void *)(v5 + 324) |= 0x800000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v84 = self->_has;
    if ((*(_DWORD *)&v84 & 0x40000000) == 0)
    {
LABEL_98:
      if ((*(void *)&v84 & 0x200000000000) == 0) {
        goto LABEL_99;
      }
      goto LABEL_146;
    }
  }
  else if ((*(_DWORD *)&v84 & 0x40000000) == 0)
  {
    goto LABEL_98;
  }
  *(unsigned char *)(v5 + 300) = self->_isPickedOnPairedDevice;
  *(void *)(v5 + 324) |= 0x40000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v84 = self->_has;
  if ((*(void *)&v84 & 0x200000000000) == 0)
  {
LABEL_99:
    if ((*(_WORD *)&v84 & 0x400) == 0) {
      goto LABEL_100;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(unsigned char *)(v5 + 315) = self->_supportsHeadTrackedSpatialAudio;
  *(void *)(v5 + 324) |= 0x200000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v84 = self->_has;
  if ((*(_WORD *)&v84 & 0x400) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v84 & 0x10000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_101;
  }
LABEL_147:
  *(unsigned char *)(v5 + 280) = self->_allowsHeadTrackedSpatialAudio;
  *(void *)(v5 + 324) |= 0x400uLL;
  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_101:
    *(unsigned char *)(v5 + 298) = self->_isHeadTrackedSpatialAudioActive;
    *(void *)(v5 + 324) |= 0x10000000uLL;
  }
LABEL_102:
  uint64_t v85 = [(NSString *)self->_headTrackedSpatialAudioMode copyWithZone:a3];
  v86 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v85;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v87 = self->_dnsNames;
  uint64_t v88 = [(NSMutableArray *)v87 countByEnumeratingWithState:&v95 objects:v115 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v96;
    do
    {
      uint64_t v91 = 0;
      do
      {
        if (*(void *)v96 != v90) {
          objc_enumerationMutation(v87);
        }
        v92 = objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * v91), "copyWithZone:", a3, (void)v95);
        [(id)v5 addDnsNames:v92];

        ++v91;
      }
      while (v89 != v91);
      uint64_t v89 = [(NSMutableArray *)v87 countByEnumeratingWithState:&v95 objects:v115 count:16];
    }
    while (v89);
  }

  id v93 = (id)v5;
  return v93;
}

- (void)addAvailableBluetoothListeningModes:(id)a3
{
  id v4 = a3;
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  id v8 = v4;
  if (!availableBluetoothListeningModes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_availableBluetoothListeningModes;
    self->_availableBluetoothListeningModes = v6;

    id v4 = v8;
    availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  }
  [(NSMutableArray *)availableBluetoothListeningModes addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_uniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupID) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelID) {
    PBDataWriterWriteStringField();
  }
  if (self->_macAddress) {
    PBDataWriterWriteDataField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_156;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_158:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  if (self->_modelSpecificInfoData) {
    PBDataWriterWriteDataField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    PBDataWriterWriteFloatField();
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((*(void *)&v6 & 0x80000000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_162;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if ((*(void *)&v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v6 & 0x8000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_163:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x8000000000) != 0) {
LABEL_25:
  }
    PBDataWriterWriteBOOLField();
LABEL_26:
  if (self->_sourceInfo) {
    PBDataWriterWriteSubmessage();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_logicalDeviceID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_firmwareVersion) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
    if ((*(void *)&v8 & 0x200000000) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v8 & 0x800) == 0) {
        goto LABEL_41;
      }
      goto LABEL_167;
    }
  }
  else if ((*(void *)&v8 & 0x200000000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_43:
    if ((*(void *)&v8 & 0x20000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(void *)&v8 & 0x20000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(void *)&v8 & 0x1000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_173:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x400000) != 0) {
LABEL_48:
  }
    PBDataWriterWriteBOOLField();
LABEL_49:
  if (self->_parentGroupIdentifier) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
    {
LABEL_53:
      if ((*(_WORD *)&v9 & 0x200) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x200) != 0) {
LABEL_54:
  }
    PBDataWriterWriteInt32Field();
LABEL_55:
  if (self->_bluetoothID) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v10 = self->_has;
  }
  if ((*(void *)&v10 & 0x4000000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v11 = self->_clusterCompositions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_primaryUID) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F5690C47DB6193B0809CC40AF9394DD6 v16 = self->_has;
  }
  if ((*(void *)&v16 & 0x1000000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_currentBluetoothListeningMode) {
    PBDataWriterWriteStringField();
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v17 = self->_availableBluetoothListeningModes;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v56;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v19);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v22 = self->_has;
  if ((*(void *)&v22 & 0x400000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v22 = self->_has;
    if ((*(void *)&v22 & 0x2000000000) == 0)
    {
LABEL_87:
      if ((*(unsigned char *)&v22 & 0x40) == 0) {
        goto LABEL_89;
      }
      goto LABEL_88;
    }
  }
  else if ((*(void *)&v22 & 0x2000000000) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x40) != 0) {
LABEL_88:
  }
    PBDataWriterWriteInt32Field();
LABEL_89:
  if (self->_airPlayGroupID) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v23 = self->_has;
  if ((*(void *)&v23 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v23 = self->_has;
    if ((*(unsigned char *)&v23 & 0x20) == 0)
    {
LABEL_93:
      if ((*(_DWORD *)&v23 & 0x40000) == 0) {
        goto LABEL_95;
      }
      goto LABEL_94;
    }
  }
  else if ((*(unsigned char *)&v23 & 0x20) == 0)
  {
    goto LABEL_93;
  }
  PBDataWriterWriteFloatField();
  if ((*(void *)&self->_has & 0x40000) != 0) {
LABEL_94:
  }
    PBDataWriterWriteBOOLField();
LABEL_95:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v24 = self->_activatedClusterMembers;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v52;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v52 != v27) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v26);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v29 = self->_has;
  if ((*(void *)&v29 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v29 = self->_has;
  }
  if ((*(unsigned char *)&v29 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_parentUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomID) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomName) {
    PBDataWriterWriteStringField();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v31 = self->_allClusterMembers;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v47 objects:v64 count:16];
    }
    while (v33);
  }

  $F5690C47DB6193B0809CC40AF9394DD6 v36 = self->_has;
  if ((*(void *)&v36 & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v36 = self->_has;
    if ((*(_DWORD *)&v36 & 0x20000) == 0)
    {
LABEL_127:
      if ((*(_DWORD *)&v36 & 0x80000) == 0) {
        goto LABEL_128;
      }
      goto LABEL_186;
    }
  }
  else if ((*(_DWORD *)&v36 & 0x20000) == 0)
  {
    goto LABEL_127;
  }
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_128:
    if ((*(void *)&v36 & 0x8000000000000) == 0) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
LABEL_186:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x8000000000000) != 0) {
LABEL_129:
  }
    PBDataWriterWriteBOOLField();
LABEL_130:
  if (self->_groupSessionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (*((unsigned char *)&self->_has + 5)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_deviceEnclosureColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_playingPairedDeviceName) {
    PBDataWriterWriteStringField();
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(void *)&v37 & 0x800000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
    if ((*(_DWORD *)&v37 & 0x40000000) == 0)
    {
LABEL_140:
      if ((*(void *)&v37 & 0x200000000000) == 0) {
        goto LABEL_141;
      }
      goto LABEL_190;
    }
  }
  else if ((*(_DWORD *)&v37 & 0x40000000) == 0)
  {
    goto LABEL_140;
  }
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(void *)&v37 & 0x200000000000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v37 & 0x400) == 0) {
      goto LABEL_142;
    }
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteBOOLField();
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x400) == 0)
  {
LABEL_142:
    if ((*(_DWORD *)&v37 & 0x10000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_143;
  }
LABEL_191:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x10000000) != 0) {
LABEL_143:
  }
    PBDataWriterWriteBOOLField();
LABEL_144:
  if (self->_headTrackedSpatialAudioMode) {
    PBDataWriterWriteStringField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v38 = self->_dnsNames;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v43 objects:v63 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v44;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v38);
        }
        PBDataWriterWriteStringField();
        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v43 objects:v63 count:16];
    }
    while (v40);
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (void)setHasCanAccessRemoteAssets:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCanAccessRemoteAssets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasIsRemoteControllable:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsRemoteControllable
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setHasIsGroupLeader:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasIsGroupable:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsGroupable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasDeviceType:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDeviceType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D9D60[a3];
  }

  return v3;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AirPlay"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Bluetooth"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CarPlay"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BuiltIn"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Wired"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasDeviceSubType:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDeviceSubType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)deviceSubTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D9D90[a3];
  }

  return v3;
}

- (int)StringAsDeviceSubType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Speaker"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Headphones"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Headset"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Receiver"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LineOut"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USB"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DisplayPort"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HDMI"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LowEnergy"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPDIF"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AppleTV"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Vehicle"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Cluster"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SetTopBox"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TVStick"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"Mac"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"iOS"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"Vision"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasModelSpecificInfoData
{
  return self->_modelSpecificInfoData != 0;
}

- (void)setBatteryLevel:(float)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_batteryLevel = a3;
}

- (void)setHasBatteryLevel:(BOOL)a3
{
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setHasIsLocalDevice:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsLocalDevice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasSupportsExternalScreen:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsExternalScreen
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setHasRequiresAuthorization:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasRequiresAuthorization
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setShouldForceRemoteControlabillity:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_shouldForceRemoteControlabillity = a3;
}

- (void)setHasShouldForceRemoteControlabillity:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasShouldForceRemoteControlabillity
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasSourceInfo
{
  return self->_sourceInfo != 0;
}

- (void)setHasIsDeviceGroupable:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsDeviceGroupable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasCanRelayCommunicationChannel:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCanRelayCommunicationChannel
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasLogicalDeviceID
{
  return self->_logicalDeviceID != 0;
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsProxyGroupPlayer
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasFirmwareVersion
{
  return self->_firmwareVersion != 0;
}

- (BOOL)hasVolume
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasIsVolumeControlAvailable
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasCanAccessAppleMusic:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCanAccessAppleMusic
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasCanAccessiCloudMusicLibrary:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCanAccessiCloudMusicLibrary
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasGroupContainsGroupLeader:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasGroupContainsGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasSupportsBufferedAirPlay:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsBufferedAirPlay
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHasCanPlayEncryptedProgressiveDownloadAssets:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCanPlayEncryptedProgressiveDownloadAssets
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasCanFetchMediaDataFromSender:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCanFetchMediaDataFromSender
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasPresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasIsAirPlayReceiverSessionActive:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsAirPlayReceiverSessionActive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasParentGroupIdentifier
{
  return self->_parentGroupIdentifier != 0;
}

- (void)setHasParentGroupContainsDiscoverableLeader:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasParentGroupContainsDiscoverableLeader
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasIsAddedToHomeKit:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasIsAddedToHomeKit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasVolumeCapabilities:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasVolumeCapabilities
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasBluetoothID
{
  return self->_bluetoothID != 0;
}

- (void)setHasSupportsHAP:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsHAP
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setHasUsingJSONProtocol:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUsingJSONProtocol
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)clearClusterCompositions
{
}

- (void)addClusterComposition:(id)a3
{
  id v4 = a3;
  clusterCompositions = self->_clusterCompositions;
  id v8 = v4;
  if (!clusterCompositions)
  {
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_clusterCompositions;
    self->_clusterCompositions = v6;

    id v4 = v8;
    clusterCompositions = self->_clusterCompositions;
  }
  [(NSMutableArray *)clusterCompositions addObject:v4];
}

- (unint64_t)clusterCompositionsCount
{
  return [(NSMutableArray *)self->_clusterCompositions count];
}

- (id)clusterCompositionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusterCompositions objectAtIndex:a3];
}

+ (Class)clusterCompositionType
{
  return (Class)objc_opt_class();
}

- (void)setHasClusterType:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasClusterType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPrimaryUID
{
  return self->_primaryUID != 0;
}

- (void)setHasConfiguredClusterSize:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasConfiguredClusterSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSupportsRapportRemoteControlTransport:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsRapportRemoteControlTransport
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (BOOL)hasCurrentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode != 0;
}

- (void)clearAvailableBluetoothListeningModes
{
}

- (unint64_t)availableBluetoothListeningModesCount
{
  return [(NSMutableArray *)self->_availableBluetoothListeningModes count];
}

- (id)availableBluetoothListeningModesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableBluetoothListeningModes objectAtIndex:a3];
}

+ (Class)availableBluetoothListeningModesType
{
  return (Class)objc_opt_class();
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setHasProducesLowFidelityAudio:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasProducesLowFidelityAudio
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (int)hostDeviceClass
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_hostDeviceClass;
  }
  else {
    return -1;
  }
}

- (void)setHasHostDeviceClass:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasHostDeviceClass
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)hostDeviceClassAsString:(int)a3
{
  int v3 = a3 + 1;
  if (a3 + 1) < 0xF && ((0x7FFDu >> v3))
  {
    id v4 = off_1E57D9E40[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)StringAsHostDeviceClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"iPhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"iPod"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"iPad"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AppleTV"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"iFPGA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Accessory"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Bridge"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Mac"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Android"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Web"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AppleDisplay"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"RealityDevice"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasAirPlayGroupID
{
  return self->_airPlayGroupID != 0;
}

- (void)setHasSupportsSharePlayHandoff:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsSharePlayHandoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setDistance:(float)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDistance
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)discoveredOnSameInfra
{
  return (*((unsigned char *)&self->_has + 2) & 4) == 0 || self->_discoveredOnSameInfra;
}

- (void)setDiscoveredOnSameInfra:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_discoveredOnSameInfra = a3;
}

- (void)setHasDiscoveredOnSameInfra:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDiscoveredOnSameInfra
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)clearActivatedClusterMembers
{
}

- (void)addActivatedClusterMembers:(id)a3
{
  id v4 = a3;
  activatedClusterMembers = self->_activatedClusterMembers;
  id v8 = v4;
  if (!activatedClusterMembers)
  {
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_activatedClusterMembers;
    self->_activatedClusterMembers = v6;

    id v4 = v8;
    activatedClusterMembers = self->_activatedClusterMembers;
  }
  [(NSMutableArray *)activatedClusterMembers addObject:v4];
}

- (unint64_t)activatedClusterMembersCount
{
  return [(NSMutableArray *)self->_activatedClusterMembers count];
}

- (id)activatedClusterMembersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activatedClusterMembers objectAtIndex:a3];
}

+ (Class)activatedClusterMembersType
{
  return (Class)objc_opt_class();
}

- (BOOL)pickable
{
  return (*((unsigned char *)&self->_has + 4) & 8) == 0 || self->_pickable;
}

- (void)setHasPickable:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPickable
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTransportType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D9EB8[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AirPlay"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Rapport"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Companion"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IDS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OutputContext"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GroupSession"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (void)setHasIsClusterLeader:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIsClusterLeader
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasIsAppleAccessory:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsAppleAccessory
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasParentUniqueIdentifier
{
  return self->_parentUniqueIdentifier != 0;
}

- (BOOL)hasRoomID
{
  return self->_roomID != 0;
}

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
}

- (void)clearAllClusterMembers
{
}

- (void)addAllClusterMembers:(id)a3
{
  id v4 = a3;
  allClusterMembers = self->_allClusterMembers;
  id v8 = v4;
  if (!allClusterMembers)
  {
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_allClusterMembers;
    self->_allClusterMembers = v6;

    id v4 = v8;
    allClusterMembers = self->_allClusterMembers;
  }
  [(NSMutableArray *)allClusterMembers addObject:v4];
}

- (unint64_t)allClusterMembersCount
{
  return [(NSMutableArray *)self->_allClusterMembers count];
}

- (id)allClusterMembersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allClusterMembers objectAtIndex:a3];
}

+ (Class)allClusterMembersType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsConversationDetection:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_supportsConversationDetection = a3;
}

- (void)setHasSupportsConversationDetection:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsConversationDetection
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setConversationDetectionEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_conversationDetectionEnabled = a3;
}

- (void)setHasConversationDetectionEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasConversationDetectionEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setEngageOnClusterActivate:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_engageOnClusterActivate = a3;
}

- (void)setHasEngageOnClusterActivate:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEngageOnClusterActivate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasVolumeMuted
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (BOOL)hasGroupSessionInfo
{
  return self->_groupSessionInfo != 0;
}

- (void)setSupportsBluetoothSharing:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_supportsBluetoothSharing = a3;
}

- (void)setHasSupportsBluetoothSharing:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsBluetoothSharing
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (BOOL)hasPlayingPairedDeviceName
{
  return self->_playingPairedDeviceName != 0;
}

- (void)setSupportsRapport:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_supportsRapport = a3;
}

- (void)setHasSupportsRapport:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsRapport
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setIsPickedOnPairedDevice:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_isPickedOnPairedDevice = a3;
}

- (void)setHasIsPickedOnPairedDevice:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsPickedOnPairedDevice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setSupportsHeadTrackedSpatialAudio:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_supportsHeadTrackedSpatialAudio = a3;
}

- (void)setHasSupportsHeadTrackedSpatialAudio:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsHeadTrackedSpatialAudio
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_allowsHeadTrackedSpatialAudio = a3;
}

- (void)setHasAllowsHeadTrackedSpatialAudio:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasAllowsHeadTrackedSpatialAudio
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsHeadTrackedSpatialAudioActive:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_isHeadTrackedSpatialAudioActive = a3;
}

- (void)setHasIsHeadTrackedSpatialAudioActive:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$F5690C47DB6193B0809CC40AF9394DD6 has = ($F5690C47DB6193B0809CC40AF9394DD6)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsHeadTrackedSpatialAudioActive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasHeadTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode != 0;
}

- (void)clearDnsNames
{
}

- (void)addDnsNames:(id)a3
{
  id v4 = a3;
  dnsNames = self->_dnsNames;
  id v8 = v4;
  if (!dnsNames)
  {
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_dnsNames;
    self->_dnsNames = v6;

    id v4 = v8;
    dnsNames = self->_dnsNames;
  }
  [(NSMutableArray *)dnsNames addObject:v4];
}

- (unint64_t)dnsNamesCount
{
  return [(NSMutableArray *)self->_dnsNames count];
}

- (id)dnsNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dnsNames objectAtIndex:a3];
}

+ (Class)dnsNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAVOutputDeviceDescriptorProtobuf;
  id v4 = [(_MRAVOutputDeviceDescriptorProtobuf *)&v8 description];
  uint64_t v5 = [(_MRAVOutputDeviceDescriptorProtobuf *)self dictionaryRepresentation];
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v5 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v5 setObject:groupID forKey:@"groupID"];
  }
  modelID = self->_modelID;
  if (modelID) {
    [v5 setObject:modelID forKey:@"modelID"];
  }
  macAddress = self->_macAddress;
  if (macAddress) {
    [v5 setObject:macAddress forKey:@"macAddress"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:self->_canAccessRemoteAssets];
    [v5 setObject:v12 forKey:@"canAccessRemoteAssets"];

    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_20;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  uint64_t v13 = [NSNumber numberWithBool:self->_isRemoteControllable];
  [v5 setObject:v13 forKey:@"isRemoteControllable"];

  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v14 = [NSNumber numberWithBool:self->_isGroupLeader];
  [v5 setObject:v14 forKey:@"isGroupLeader"];

  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v15 = [NSNumber numberWithBool:self->_isGroupable];
  [v5 setObject:v15 forKey:@"isGroupable"];

  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_22:
  uint64_t deviceType = self->_deviceType;
  if (deviceType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceType);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = off_1E57D9D60[deviceType];
  }
  [v5 setObject:v17 forKey:@"deviceType"];

  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_26:
    uint64_t deviceSubType = self->_deviceSubType;
    if (deviceSubType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceSubType);
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v19 = off_1E57D9D90[deviceSubType];
    }
    [v5 setObject:v19 forKey:@"deviceSubType"];
  }
LABEL_30:
  modelSpecificInfoData = self->_modelSpecificInfoData;
  if (modelSpecificInfoData) {
    [v5 setObject:modelSpecificInfoData forKey:@"modelSpecificInfoData"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
  if (*(unsigned char *)&v21)
  {
    *(float *)&double v4 = self->_batteryLevel;
    long long v56 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v56 forKey:@"batteryLevel"];

    $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x20000000) == 0)
    {
LABEL_34:
      if ((*(void *)&v21 & 0x80000000000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x20000000) == 0)
  {
    goto LABEL_34;
  }
  long long v57 = [NSNumber numberWithBool:self->_isLocalDevice];
  [v5 setObject:v57 forKey:@"isLocalDevice"];

  $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
  if ((*(void *)&v21 & 0x80000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v21 & 0x4000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_101;
  }
LABEL_100:
  long long v58 = [NSNumber numberWithBool:self->_supportsExternalScreen];
  [v5 setObject:v58 forKey:@"supportsExternalScreen"];

  $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
  if ((*(void *)&v21 & 0x4000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v21 & 0x8000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_101:
  long long v59 = [NSNumber numberWithBool:self->_requiresAuthorization];
  [v5 setObject:v59 forKey:@"requiresAuthorization"];

  if ((*(void *)&self->_has & 0x8000000000) != 0)
  {
LABEL_37:
    $F5690C47DB6193B0809CC40AF9394DD6 v22 = [NSNumber numberWithBool:self->_shouldForceRemoteControlabillity];
    [v5 setObject:v22 forKey:@"shouldForceRemoteControlabillity"];
  }
LABEL_38:
  sourceInfo = self->_sourceInfo;
  if (sourceInfo)
  {
    v24 = [(_MRAVOutputDeviceSourceInfoProtobuf *)sourceInfo dictionaryRepresentation];
    [v5 setObject:v24 forKey:@"sourceInfo"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x2000000) != 0)
  {
    uint64_t v26 = [NSNumber numberWithBool:self->_isDeviceGroupable];
    [v5 setObject:v26 forKey:@"isDeviceGroupable"];

    $F5690C47DB6193B0809CC40AF9394DD6 v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    uint64_t v27 = [NSNumber numberWithBool:self->_canRelayCommunicationChannel];
    [v5 setObject:v27 forKey:@"canRelayCommunicationChannel"];
  }
  logicalDeviceID = self->_logicalDeviceID;
  if (logicalDeviceID) {
    [v5 setObject:logicalDeviceID forKey:@"logicalDeviceID"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    $F5690C47DB6193B0809CC40AF9394DD6 v29 = [NSNumber numberWithBool:self->_isProxyGroupPlayer];
    [v5 setObject:v29 forKey:@"isProxyGroupPlayer"];
  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion) {
    [v5 setObject:firmwareVersion forKey:@"firmwareVersion"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x100) != 0)
  {
    *(float *)&double v4 = self->_volume;
    long long v60 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v60 forKey:@"volume"];

    $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
    if ((*(void *)&v31 & 0x200000000) == 0)
    {
LABEL_52:
      if ((*(_WORD *)&v31 & 0x800) == 0) {
        goto LABEL_53;
      }
      goto LABEL_105;
    }
  }
  else if ((*(void *)&v31 & 0x200000000) == 0)
  {
    goto LABEL_52;
  }
  long long v61 = [NSNumber numberWithBool:self->_isVolumeControlAvailable];
  [v5 setObject:v61 forKey:@"isVolumeControlAvailable"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v31 & 0x2000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_106;
  }
LABEL_105:
  long long v62 = [NSNumber numberWithBool:self->_canAccessAppleMusic];
  [v5 setObject:v62 forKey:@"canAccessAppleMusic"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x2000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v31 & 0x100000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_107;
  }
LABEL_106:
  v63 = [NSNumber numberWithBool:self->_canAccessiCloudMusicLibrary];
  [v5 setObject:v63 forKey:@"canAccessiCloudMusicLibrary"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x100000) == 0)
  {
LABEL_55:
    if ((*(void *)&v31 & 0x20000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_108;
  }
LABEL_107:
  $F5690C47DB6193B0809CC40AF9394DD6 v64 = [NSNumber numberWithBool:self->_groupContainsGroupLeader];
  [v5 setObject:v64 forKey:@"groupContainsGroupLeader"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(void *)&v31 & 0x20000000000) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v31 & 0x8000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v65 = [NSNumber numberWithBool:self->_supportsBufferedAirPlay];
  [v5 setObject:v65 forKey:@"supportsBufferedAirPlay"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x8000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v31 & 0x4000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_110;
  }
LABEL_109:
  v66 = [NSNumber numberWithBool:self->_canPlayEncryptedProgressiveDownloadAssets];
  [v5 setObject:v66 forKey:@"canPlayEncryptedProgressiveDownloadAssets"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(void *)&v31 & 0x1000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v67 = [NSNumber numberWithBool:self->_canFetchMediaDataFromSender];
  [v5 setObject:v67 forKey:@"canFetchMediaDataFromSender"];

  $F5690C47DB6193B0809CC40AF9394DD6 v31 = self->_has;
  if ((*(void *)&v31 & 0x1000000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v31 & 0x400000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_111:
  uint64_t v68 = [NSNumber numberWithBool:self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
  [v5 setObject:v68 forKey:@"presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"];

  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_60:
    uint64_t v32 = [NSNumber numberWithBool:self->_isAirPlayReceiverSessionActive];
    [v5 setObject:v32 forKey:@"isAirPlayReceiverSessionActive"];
  }
LABEL_61:
  parentGroupIdentifier = self->_parentGroupIdentifier;
  if (parentGroupIdentifier) {
    [v5 setObject:parentGroupIdentifier forKey:@"parentGroupIdentifier"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v34 = self->_has;
  if ((*(void *)&v34 & 0x400000000) != 0)
  {
    uint64_t v69 = [NSNumber numberWithBool:self->_parentGroupContainsDiscoverableLeader];
    [v5 setObject:v69 forKey:@"parentGroupContainsDiscoverableLeader"];

    $F5690C47DB6193B0809CC40AF9394DD6 v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x200000) == 0)
    {
LABEL_65:
      if ((*(_WORD *)&v34 & 0x200) == 0) {
        goto LABEL_67;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x200000) == 0)
  {
    goto LABEL_65;
  }
  v70 = [NSNumber numberWithBool:self->_isAddedToHomeKit];
  [v5 setObject:v70 forKey:@"isAddedToHomeKit"];

  if ((*(void *)&self->_has & 0x200) != 0)
  {
LABEL_66:
    uint64_t v35 = [NSNumber numberWithInt:self->_volumeCapabilities];
    [v5 setObject:v35 forKey:@"volumeCapabilities"];
  }
LABEL_67:
  bluetoothID = self->_bluetoothID;
  if (bluetoothID) {
    [v5 setObject:bluetoothID forKey:@"bluetoothID"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(void *)&v37 & 0x100000000000) != 0)
  {
    uint64_t v38 = [NSNumber numberWithBool:self->_supportsHAP];
    [v5 setObject:v38 forKey:@"supportsHAP"];

    $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  }
  if ((*(void *)&v37 & 0x4000000000000) != 0)
  {
    uint64_t v39 = [NSNumber numberWithBool:self->_usingJSONProtocol];
    [v5 setObject:v39 forKey:@"usingJSONProtocol"];
  }
  if ([(NSMutableArray *)self->_clusterCompositions count])
  {
    uint64_t v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clusterCompositions, "count"));
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    uint64_t v42 = self->_clusterCompositions;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v133 objects:v139 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v134;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v134 != v45) {
            objc_enumerationMutation(v42);
          }
          long long v47 = [*(id *)(*((void *)&v133 + 1) + 8 * i) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v133 objects:v139 count:16];
      }
      while (v44);
    }

    [v5 setObject:v41 forKey:@"clusterComposition"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v48 = [NSNumber numberWithUnsignedInt:self->_clusterType];
    [v5 setObject:v48 forKey:@"clusterType"];
  }
  primaryUID = self->_primaryUID;
  if (primaryUID) {
    [v5 setObject:primaryUID forKey:@"primaryUID"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v50 = self->_has;
  if ((*(unsigned char *)&v50 & 4) != 0)
  {
    long long v51 = [NSNumber numberWithUnsignedInt:self->_configuredClusterSize];
    [v5 setObject:v51 forKey:@"configuredClusterSize"];

    $F5690C47DB6193B0809CC40AF9394DD6 v50 = self->_has;
  }
  if ((*(void *)&v50 & 0x1000000000000) != 0)
  {
    long long v52 = [NSNumber numberWithBool:self->_supportsRapportRemoteControlTransport];
    [v5 setObject:v52 forKey:@"supportsRapportRemoteControlTransport"];
  }
  currentBluetoothListeningMode = self->_currentBluetoothListeningMode;
  if (currentBluetoothListeningMode) {
    [v5 setObject:currentBluetoothListeningMode forKey:@"currentBluetoothListeningMode"];
  }
  availableBluetoothListeningModes = self->_availableBluetoothListeningModes;
  if (availableBluetoothListeningModes) {
    [v5 setObject:availableBluetoothListeningModes forKey:@"availableBluetoothListeningModes"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v55 = self->_has;
  if ((*(void *)&v55 & 0x400000000000) != 0)
  {
    v71 = [NSNumber numberWithBool:self->_supportsMultiplayer];
    [v5 setObject:v71 forKey:@"supportsMultiplayer"];

    $F5690C47DB6193B0809CC40AF9394DD6 v55 = self->_has;
    if ((*(void *)&v55 & 0x2000000000) == 0)
    {
LABEL_96:
      if ((*(unsigned char *)&v55 & 0x40) == 0) {
        goto LABEL_123;
      }
      goto LABEL_118;
    }
  }
  else if ((*(void *)&v55 & 0x2000000000) == 0)
  {
    goto LABEL_96;
  }
  uint64_t v72 = [NSNumber numberWithBool:self->_producesLowFidelityAudio];
  [v5 setObject:v72 forKey:@"producesLowFidelityAudio"];

  if ((*(void *)&self->_has & 0x40) == 0) {
    goto LABEL_123;
  }
LABEL_118:
  unsigned int v73 = self->_hostDeviceClass + 1;
  if (v73 < 0xF && ((0x7FFDu >> v73) & 1) != 0)
  {
    uint64_t v74 = off_1E57D9E40[v73];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_hostDeviceClass);
    uint64_t v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v5 setObject:v74 forKey:@"hostDeviceClass"];

LABEL_123:
  airPlayGroupID = self->_airPlayGroupID;
  if (airPlayGroupID) {
    [v5 setObject:airPlayGroupID forKey:@"airPlayGroupID"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v76 = self->_has;
  if ((*(void *)&v76 & 0x2000000000000) != 0)
  {
    uint64_t v89 = [NSNumber numberWithBool:self->_supportsSharePlayHandoff];
    [v5 setObject:v89 forKey:@"supportsSharePlayHandoff"];

    $F5690C47DB6193B0809CC40AF9394DD6 v76 = self->_has;
    if ((*(unsigned char *)&v76 & 0x20) == 0)
    {
LABEL_127:
      if ((*(_DWORD *)&v76 & 0x40000) == 0) {
        goto LABEL_129;
      }
      goto LABEL_128;
    }
  }
  else if ((*(unsigned char *)&v76 & 0x20) == 0)
  {
    goto LABEL_127;
  }
  *(float *)&double v40 = self->_distance;
  uint64_t v90 = [NSNumber numberWithFloat:v40];
  [v5 setObject:v90 forKey:@"distance"];

  if ((*(void *)&self->_has & 0x40000) != 0)
  {
LABEL_128:
    $F5690C47DB6193B0809CC40AF9394DD6 v77 = [NSNumber numberWithBool:self->_discoveredOnSameInfra];
    [v5 setObject:v77 forKey:@"discoveredOnSameInfra"];
  }
LABEL_129:
  if ([(NSMutableArray *)self->_activatedClusterMembers count])
  {
    id v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activatedClusterMembers, "count"));
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v79 = self->_activatedClusterMembers;
    uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v129 objects:v138 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v130;
      do
      {
        for (uint64_t j = 0; j != v81; ++j)
        {
          if (*(void *)v130 != v82) {
            objc_enumerationMutation(v79);
          }
          $F5690C47DB6193B0809CC40AF9394DD6 v84 = [*(id *)(*((void *)&v129 + 1) + 8 * j) dictionaryRepresentation];
          [v78 addObject:v84];
        }
        uint64_t v81 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v129 objects:v138 count:16];
      }
      while (v81);
    }

    [v5 setObject:v78 forKey:@"activatedClusterMembers"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v85 = self->_has;
  if ((*(void *)&v85 & 0x800000000) != 0)
  {
    v86 = [NSNumber numberWithBool:self->_pickable];
    [v5 setObject:v86 forKey:@"pickable"];

    $F5690C47DB6193B0809CC40AF9394DD6 v85 = self->_has;
  }
  if ((*(unsigned char *)&v85 & 0x80) != 0)
  {
    uint64_t transportType = self->_transportType;
    if (transportType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportType);
      uint64_t v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v88 = off_1E57D9EB8[transportType];
    }
    [v5 setObject:v88 forKey:@"transportType"];
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v5 setObject:clusterID forKey:@"clusterID"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v92 = self->_has;
  if ((*(_DWORD *)&v92 & 0x1000000) != 0)
  {
    id v93 = [NSNumber numberWithBool:self->_isClusterLeader];
    [v5 setObject:v93 forKey:@"isClusterLeader"];

    $F5690C47DB6193B0809CC40AF9394DD6 v92 = self->_has;
  }
  if ((*(_DWORD *)&v92 & 0x800000) != 0)
  {
    v94 = [NSNumber numberWithBool:self->_isAppleAccessory];
    [v5 setObject:v94 forKey:@"isAppleAccessory"];
  }
  parentUniqueIdentifier = self->_parentUniqueIdentifier;
  if (parentUniqueIdentifier) {
    [v5 setObject:parentUniqueIdentifier forKey:@"parentUniqueIdentifier"];
  }
  roomID = self->_roomID;
  if (roomID) {
    [v5 setObject:roomID forKey:@"roomID"];
  }
  roomName = self->_roomName;
  if (roomName) {
    [v5 setObject:roomName forKey:@"roomName"];
  }
  if ([(NSMutableArray *)self->_allClusterMembers count])
  {
    long long v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_allClusterMembers, "count"));
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v99 = self->_allClusterMembers;
    uint64_t v100 = [(NSMutableArray *)v99 countByEnumeratingWithState:&v125 objects:v137 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v126;
      do
      {
        for (uint64_t k = 0; k != v101; ++k)
        {
          if (*(void *)v126 != v102) {
            objc_enumerationMutation(v99);
          }
          long long v104 = [*(id *)(*((void *)&v125 + 1) + 8 * k) dictionaryRepresentation];
          [v98 addObject:v104];
        }
        uint64_t v101 = [(NSMutableArray *)v99 countByEnumeratingWithState:&v125 objects:v137 count:16];
      }
      while (v101);
    }

    [v5 setObject:v98 forKey:@"allClusterMembers"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v105 = self->_has;
  if ((*(void *)&v105 & 0x40000000000) != 0)
  {
    v118 = [NSNumber numberWithBool:self->_supportsConversationDetection];
    [v5 setObject:v118 forKey:@"supportsConversationDetection"];

    $F5690C47DB6193B0809CC40AF9394DD6 v105 = self->_has;
    if ((*(_DWORD *)&v105 & 0x20000) == 0)
    {
LABEL_171:
      if ((*(_DWORD *)&v105 & 0x80000) == 0) {
        goto LABEL_172;
      }
      goto LABEL_195;
    }
  }
  else if ((*(_DWORD *)&v105 & 0x20000) == 0)
  {
    goto LABEL_171;
  }
  v119 = [NSNumber numberWithBool:self->_conversationDetectionEnabled];
  [v5 setObject:v119 forKey:@"conversationDetectionEnabled"];

  $F5690C47DB6193B0809CC40AF9394DD6 v105 = self->_has;
  if ((*(_DWORD *)&v105 & 0x80000) == 0)
  {
LABEL_172:
    if ((*(void *)&v105 & 0x8000000000000) == 0) {
      goto LABEL_174;
    }
    goto LABEL_173;
  }
LABEL_195:
  uint64_t v120 = [NSNumber numberWithBool:self->_engageOnClusterActivate];
  [v5 setObject:v120 forKey:@"engageOnClusterActivate"];

  if ((*(void *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_173:
    long long v106 = [NSNumber numberWithBool:self->_volumeMuted];
    [v5 setObject:v106 forKey:@"volumeMuted"];
  }
LABEL_174:
  groupSessionInfo = self->_groupSessionInfo;
  if (groupSessionInfo)
  {
    long long v108 = [(_MRGroupSessionInfoProtobuf *)groupSessionInfo dictionaryRepresentation];
    [v5 setObject:v108 forKey:@"groupSessionInfo"];
  }
  if (*((unsigned char *)&self->_has + 5))
  {
    long long v109 = [NSNumber numberWithBool:self->_supportsBluetoothSharing];
    [v5 setObject:v109 forKey:@"supportsBluetoothSharing"];
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor) {
    [v5 setObject:deviceEnclosureColor forKey:@"deviceEnclosureColor"];
  }
  playingPairedDeviceName = self->_playingPairedDeviceName;
  if (playingPairedDeviceName) {
    [v5 setObject:playingPairedDeviceName forKey:@"playingPairedDeviceName"];
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v112 = self->_has;
  if ((*(void *)&v112 & 0x800000000000) != 0)
  {
    v121 = [NSNumber numberWithBool:self->_supportsRapport];
    [v5 setObject:v121 forKey:@"supportsRapport"];

    $F5690C47DB6193B0809CC40AF9394DD6 v112 = self->_has;
    if ((*(_DWORD *)&v112 & 0x40000000) == 0)
    {
LABEL_184:
      if ((*(void *)&v112 & 0x200000000000) == 0) {
        goto LABEL_185;
      }
      goto LABEL_199;
    }
  }
  else if ((*(_DWORD *)&v112 & 0x40000000) == 0)
  {
    goto LABEL_184;
  }
  v122 = [NSNumber numberWithBool:self->_isPickedOnPairedDevice];
  [v5 setObject:v122 forKey:@"isPickedOnPairedDevice"];

  $F5690C47DB6193B0809CC40AF9394DD6 v112 = self->_has;
  if ((*(void *)&v112 & 0x200000000000) == 0)
  {
LABEL_185:
    if ((*(_WORD *)&v112 & 0x400) == 0) {
      goto LABEL_186;
    }
    goto LABEL_200;
  }
LABEL_199:
  v123 = [NSNumber numberWithBool:self->_supportsHeadTrackedSpatialAudio];
  [v5 setObject:v123 forKey:@"supportsHeadTrackedSpatialAudio"];

  $F5690C47DB6193B0809CC40AF9394DD6 v112 = self->_has;
  if ((*(_WORD *)&v112 & 0x400) == 0)
  {
LABEL_186:
    if ((*(_DWORD *)&v112 & 0x10000000) == 0) {
      goto LABEL_188;
    }
    goto LABEL_187;
  }
LABEL_200:
  v124 = [NSNumber numberWithBool:self->_allowsHeadTrackedSpatialAudio];
  [v5 setObject:v124 forKey:@"allowsHeadTrackedSpatialAudio"];

  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_187:
    long long v113 = [NSNumber numberWithBool:self->_isHeadTrackedSpatialAudioActive];
    [v5 setObject:v113 forKey:@"isHeadTrackedSpatialAudioActive"];
  }
LABEL_188:
  headTrackedSpatialAudioMode = self->_headTrackedSpatialAudioMode;
  if (headTrackedSpatialAudioMode) {
    [v5 setObject:headTrackedSpatialAudioMode forKey:@"headTrackedSpatialAudioMode"];
  }
  dnsNames = self->_dnsNames;
  if (dnsNames) {
    [v5 setObject:dnsNames forKey:@"dnsNames"];
  }
  id v116 = v5;

  return v116;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVOutputDeviceDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  double v4 = (char *)a3;
  uint64_t v42 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    double v4 = v42;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v42, "setUniqueIdentifier:");
    double v4 = v42;
  }
  if (self->_groupID)
  {
    objc_msgSend(v42, "setGroupID:");
    double v4 = v42;
  }
  if (self->_modelID)
  {
    objc_msgSend(v42, "setModelID:");
    double v4 = v42;
  }
  if (self->_macAddress)
  {
    objc_msgSend(v42, "setMacAddress:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v4[282] = self->_canAccessRemoteAssets;
    *(void *)(v4 + 324) |= 0x1000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_143;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  v4[302] = self->_isRemoteControllable;
  *(void *)(v4 + 324) |= 0x100000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_144;
  }
LABEL_143:
  v4[296] = self->_isGroupLeader;
  *(void *)(v4 + 324) |= 0x4000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_145;
  }
LABEL_144:
  v4[297] = self->_isGroupable;
  *(void *)(v4 + 324) |= 0x8000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_145:
  *((_DWORD *)v4 + 25) = self->_deviceType;
  *(void *)(v4 + 324) |= 0x10uLL;
  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 24) = self->_deviceSubType;
    *(void *)(v4 + 324) |= 8uLL;
  }
LABEL_18:
  if (self->_modelSpecificInfoData)
  {
    objc_msgSend(v42, "setModelSpecificInfoData:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_batteryLevel);
    *(void *)(v4 + 324) |= 1uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((*(void *)&v6 & 0x80000000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_149;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  v4[299] = self->_isLocalDevice;
  *(void *)(v4 + 324) |= 0x20000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if ((*(void *)&v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_150;
  }
LABEL_149:
  v4[313] = self->_supportsExternalScreen;
  *(void *)(v4 + 324) |= 0x80000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v6 & 0x8000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_150:
  v4[308] = self->_requiresAuthorization;
  *(void *)(v4 + 324) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x8000000000) != 0)
  {
LABEL_25:
    v4[309] = self->_shouldForceRemoteControlabillity;
    *(void *)(v4 + 324) |= 0x8000000000uLL;
  }
LABEL_26:
  if (self->_sourceInfo)
  {
    objc_msgSend(v42, "setSourceInfo:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    v4[295] = self->_isDeviceGroupable;
    *(void *)(v4 + 324) |= 0x2000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
    v4[286] = self->_canRelayCommunicationChannel;
    *(void *)(v4 + 324) |= 0x10000uLL;
  }
  if (self->_logicalDeviceID)
  {
    objc_msgSend(v42, "setLogicalDeviceID:");
    double v4 = v42;
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    v4[301] = self->_isProxyGroupPlayer;
    *(void *)(v4 + 324) |= 0x80000000uLL;
  }
  if (self->_firmwareVersion)
  {
    objc_msgSend(v42, "setFirmwareVersion:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 68) = LODWORD(self->_volume);
    *(void *)(v4 + 324) |= 0x100uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
    if ((*(void *)&v8 & 0x200000000) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v8 & 0x800) == 0) {
        goto LABEL_41;
      }
      goto LABEL_154;
    }
  }
  else if ((*(void *)&v8 & 0x200000000) == 0)
  {
    goto LABEL_40;
  }
  v4[303] = self->_isVolumeControlAvailable;
  *(void *)(v4 + 324) |= 0x200000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_155;
  }
LABEL_154:
  v4[281] = self->_canAccessAppleMusic;
  *(void *)(v4 + 324) |= 0x800uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_156;
  }
LABEL_155:
  v4[283] = self->_canAccessiCloudMusicLibrary;
  *(void *)(v4 + 324) |= 0x2000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_43:
    if ((*(void *)&v8 & 0x20000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_157;
  }
LABEL_156:
  v4[290] = self->_groupContainsGroupLeader;
  *(void *)(v4 + 324) |= 0x100000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(void *)&v8 & 0x20000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_158;
  }
LABEL_157:
  v4[311] = self->_supportsBufferedAirPlay;
  *(void *)(v4 + 324) |= 0x20000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_159;
  }
LABEL_158:
  v4[285] = self->_canPlayEncryptedProgressiveDownloadAssets;
  *(void *)(v4 + 324) |= 0x8000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(void *)&v8 & 0x1000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_160;
  }
LABEL_159:
  v4[284] = self->_canFetchMediaDataFromSender;
  *(void *)(v4 + 324) |= 0x4000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_160:
  v4[306] = self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
  *(void *)(v4 + 324) |= 0x1000000000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_48:
    v4[292] = self->_isAirPlayReceiverSessionActive;
    *(void *)(v4 + 324) |= 0x400000uLL;
  }
LABEL_49:
  if (self->_parentGroupIdentifier)
  {
    objc_msgSend(v42, "setParentGroupIdentifier:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) != 0)
  {
    v4[304] = self->_parentGroupContainsDiscoverableLeader;
    *(void *)(v4 + 324) |= 0x400000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
    {
LABEL_53:
      if ((*(_WORD *)&v9 & 0x200) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
    goto LABEL_53;
  }
  v4[291] = self->_isAddedToHomeKit;
  *(void *)(v4 + 324) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x200) != 0)
  {
LABEL_54:
    *((_DWORD *)v4 + 69) = self->_volumeCapabilities;
    *(void *)(v4 + 324) |= 0x200uLL;
  }
LABEL_55:
  if (self->_bluetoothID)
  {
    objc_msgSend(v42, "setBluetoothID:");
    double v4 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000000) != 0)
  {
    v4[314] = self->_supportsHAP;
    *(void *)(v4 + 324) |= 0x100000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v10 = self->_has;
  }
  if ((*(void *)&v10 & 0x4000000000000) != 0)
  {
    v4[320] = self->_usingJSONProtocol;
    *(void *)(v4 + 324) |= 0x4000000000000uLL;
  }
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self clusterCompositionsCount])
  {
    [v42 clearClusterCompositions];
    unint64_t v11 = [(_MRAVOutputDeviceDescriptorProtobuf *)self clusterCompositionsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = [(_MRAVOutputDeviceDescriptorProtobuf *)self clusterCompositionAtIndex:i];
        [v42 addClusterComposition:v14];
      }
    }
  }
  uint64_t v15 = v42;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v42 + 18) = self->_clusterType;
    *(void *)(v42 + 324) |= 2uLL;
  }
  if (self->_primaryUID)
  {
    objc_msgSend(v42, "setPrimaryUID:");
    uint64_t v15 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    *((_DWORD *)v15 + 19) = self->_configuredClusterSize;
    *(void *)(v15 + 324) |= 4uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v16 = self->_has;
  }
  if ((*(void *)&v16 & 0x1000000000000) != 0)
  {
    v15[318] = self->_supportsRapportRemoteControlTransport;
    *(void *)(v15 + 324) |= 0x1000000000000uLL;
  }
  if (self->_currentBluetoothListeningMode) {
    objc_msgSend(v42, "setCurrentBluetoothListeningMode:");
  }
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self availableBluetoothListeningModesCount])
  {
    [v42 clearAvailableBluetoothListeningModes];
    unint64_t v17 = [(_MRAVOutputDeviceDescriptorProtobuf *)self availableBluetoothListeningModesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t j = 0; j != v18; ++j)
      {
        uint64_t v20 = [(_MRAVOutputDeviceDescriptorProtobuf *)self availableBluetoothListeningModesAtIndex:j];
        [v42 addAvailableBluetoothListeningModes:v20];
      }
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
  $F5690C47DB6193B0809CC40AF9394DD6 v22 = v42;
  if ((*(void *)&v21 & 0x400000000000) != 0)
  {
    v42[316] = self->_supportsMultiplayer;
    *(void *)(v42 + 324) |= 0x400000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
    if ((*(void *)&v21 & 0x2000000000) == 0)
    {
LABEL_81:
      if ((*(unsigned char *)&v21 & 0x40) == 0) {
        goto LABEL_83;
      }
      goto LABEL_82;
    }
  }
  else if ((*(void *)&v21 & 0x2000000000) == 0)
  {
    goto LABEL_81;
  }
  v42[307] = self->_producesLowFidelityAudio;
  *(void *)(v42 + 324) |= 0x2000000000uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_82:
    *((_DWORD *)v42 + 38) = self->_hostDeviceClass;
    *(void *)(v42 + 324) |= 0x40uLL;
  }
LABEL_83:
  if (self->_airPlayGroupID)
  {
    objc_msgSend(v42, "setAirPlayGroupID:");
    $F5690C47DB6193B0809CC40AF9394DD6 v22 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v23 = self->_has;
  if ((*(void *)&v23 & 0x2000000000000) == 0)
  {
    if ((*(unsigned char *)&v23 & 0x20) == 0) {
      goto LABEL_87;
    }
LABEL_169:
    *((_DWORD *)v22 + 26) = LODWORD(self->_distance);
    *(void *)(v22 + 324) |= 0x20uLL;
    if ((*(void *)&self->_has & 0x40000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
  v22[319] = self->_supportsSharePlayHandoff;
  *(void *)(v22 + 324) |= 0x2000000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x20) != 0) {
    goto LABEL_169;
  }
LABEL_87:
  if ((*(_DWORD *)&v23 & 0x40000) != 0)
  {
LABEL_88:
    v22[288] = self->_discoveredOnSameInfra;
    *(void *)(v22 + 324) |= 0x40000uLL;
  }
LABEL_89:
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self activatedClusterMembersCount])
  {
    [v42 clearActivatedClusterMembers];
    unint64_t v24 = [(_MRAVOutputDeviceDescriptorProtobuf *)self activatedClusterMembersCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t k = 0; k != v25; ++k)
      {
        uint64_t v27 = [(_MRAVOutputDeviceDescriptorProtobuf *)self activatedClusterMembersAtIndex:k];
        [v42 addActivatedClusterMembers:v27];
      }
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v28 = self->_has;
  $F5690C47DB6193B0809CC40AF9394DD6 v29 = v42;
  if ((*(void *)&v28 & 0x800000000) != 0)
  {
    v42[305] = self->_pickable;
    *(void *)(v42 + 324) |= 0x800000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v28 = self->_has;
  }
  if ((*(unsigned char *)&v28 & 0x80) != 0)
  {
    *((_DWORD *)v42 + 64) = self->_transportType;
    *(void *)(v42 + 324) |= 0x80uLL;
  }
  if (self->_clusterID)
  {
    objc_msgSend(v42, "setClusterID:");
    $F5690C47DB6193B0809CC40AF9394DD6 v29 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x1000000) != 0)
  {
    v29[294] = self->_isClusterLeader;
    *(void *)(v29 + 324) |= 0x1000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v30 = self->_has;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    v29[293] = self->_isAppleAccessory;
    *(void *)(v29 + 324) |= 0x800000uLL;
  }
  if (self->_parentUniqueIdentifier) {
    objc_msgSend(v42, "setParentUniqueIdentifier:");
  }
  if (self->_roomID) {
    objc_msgSend(v42, "setRoomID:");
  }
  if (self->_roomName) {
    objc_msgSend(v42, "setRoomName:");
  }
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self allClusterMembersCount])
  {
    [v42 clearAllClusterMembers];
    unint64_t v31 = [(_MRAVOutputDeviceDescriptorProtobuf *)self allClusterMembersCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (uint64_t m = 0; m != v32; ++m)
      {
        $F5690C47DB6193B0809CC40AF9394DD6 v34 = [(_MRAVOutputDeviceDescriptorProtobuf *)self allClusterMembersAtIndex:m];
        [v42 addAllClusterMembers:v34];
      }
    }
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v35 = self->_has;
  $F5690C47DB6193B0809CC40AF9394DD6 v36 = v42;
  if ((*(void *)&v35 & 0x40000000000) != 0)
  {
    v42[312] = self->_supportsConversationDetection;
    *(void *)(v42 + 324) |= 0x40000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v35 = self->_has;
    if ((*(_DWORD *)&v35 & 0x20000) == 0)
    {
LABEL_115:
      if ((*(_DWORD *)&v35 & 0x80000) == 0) {
        goto LABEL_116;
      }
      goto LABEL_173;
    }
  }
  else if ((*(_DWORD *)&v35 & 0x20000) == 0)
  {
    goto LABEL_115;
  }
  v42[287] = self->_conversationDetectionEnabled;
  *(void *)(v42 + 324) |= 0x20000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x80000) == 0)
  {
LABEL_116:
    if ((*(void *)&v35 & 0x8000000000000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_117;
  }
LABEL_173:
  v42[289] = self->_engageOnClusterActivate;
  *(void *)(v42 + 324) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x8000000000000) != 0)
  {
LABEL_117:
    v42[321] = self->_volumeMuted;
    *(void *)(v42 + 324) |= 0x8000000000000uLL;
  }
LABEL_118:
  if (self->_groupSessionInfo)
  {
    objc_msgSend(v42, "setGroupSessionInfo:");
    $F5690C47DB6193B0809CC40AF9394DD6 v36 = v42;
  }
  if (*((unsigned char *)&self->_has + 5))
  {
    v36[310] = self->_supportsBluetoothSharing;
    *(void *)(v36 + 324) |= 0x10000000000uLL;
  }
  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v42, "setDeviceEnclosureColor:");
    $F5690C47DB6193B0809CC40AF9394DD6 v36 = v42;
  }
  if (self->_playingPairedDeviceName)
  {
    objc_msgSend(v42, "setPlayingPairedDeviceName:");
    $F5690C47DB6193B0809CC40AF9394DD6 v36 = v42;
  }
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(void *)&v37 & 0x800000000000) != 0)
  {
    v36[317] = self->_supportsRapport;
    *(void *)(v36 + 324) |= 0x800000000000uLL;
    $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
    if ((*(_DWORD *)&v37 & 0x40000000) == 0)
    {
LABEL_128:
      if ((*(void *)&v37 & 0x200000000000) == 0) {
        goto LABEL_129;
      }
      goto LABEL_177;
    }
  }
  else if ((*(_DWORD *)&v37 & 0x40000000) == 0)
  {
    goto LABEL_128;
  }
  v36[300] = self->_isPickedOnPairedDevice;
  *(void *)(v36 + 324) |= 0x40000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(void *)&v37 & 0x200000000000) == 0)
  {
LABEL_129:
    if ((*(_WORD *)&v37 & 0x400) == 0) {
      goto LABEL_130;
    }
    goto LABEL_178;
  }
LABEL_177:
  v36[315] = self->_supportsHeadTrackedSpatialAudio;
  *(void *)(v36 + 324) |= 0x200000000000uLL;
  $F5690C47DB6193B0809CC40AF9394DD6 v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x400) == 0)
  {
LABEL_130:
    if ((*(_DWORD *)&v37 & 0x10000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_131;
  }
LABEL_178:
  v36[280] = self->_allowsHeadTrackedSpatialAudio;
  *(void *)(v36 + 324) |= 0x400uLL;
  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_131:
    v36[298] = self->_isHeadTrackedSpatialAudioActive;
    *(void *)(v36 + 324) |= 0x10000000uLL;
  }
LABEL_132:
  if (self->_headTrackedSpatialAudioMode) {
    objc_msgSend(v42, "setHeadTrackedSpatialAudioMode:");
  }
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self dnsNamesCount])
  {
    [v42 clearDnsNames];
    unint64_t v38 = [(_MRAVOutputDeviceDescriptorProtobuf *)self dnsNamesCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (uint64_t n = 0; n != v39; ++n)
      {
        uint64_t v41 = [(_MRAVOutputDeviceDescriptorProtobuf *)self dnsNamesAtIndex:n];
        [v42 addDnsNames:v41];
      }
    }
  }
}

- (unint64_t)hash
{
  NSUInteger v110 = [(NSString *)self->_name hash];
  NSUInteger v109 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v108 = [(NSString *)self->_groupID hash];
  NSUInteger v107 = [(NSString *)self->_modelID hash];
  uint64_t v106 = [(NSData *)self->_macAddress hash];
  $F5690C47DB6193B0809CC40AF9394DD6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    uint64_t v105 = 2654435761 * self->_canAccessRemoteAssets;
    if ((*(void *)&has & 0x100000000) != 0)
    {
LABEL_3:
      uint64_t v104 = 2654435761 * self->_isRemoteControllable;
      if ((*(_DWORD *)&has & 0x4000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v105 = 0;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v104 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    uint64_t v103 = 2654435761 * self->_isGroupLeader;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v103 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_5:
    uint64_t v102 = 2654435761 * self->_isGroupable;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v101 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v102 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v101 = 2654435761 * self->_deviceType;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_7:
    uint64_t v100 = 2654435761 * self->_deviceSubType;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v100 = 0;
LABEL_14:
  uint64_t v99 = [(NSData *)self->_modelSpecificInfoData hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v4 = self->_has;
  if (*(unsigned char *)&v4)
  {
    float batteryLevel = self->_batteryLevel;
    float v7 = -batteryLevel;
    if (batteryLevel >= 0.0) {
      float v7 = self->_batteryLevel;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((*(_DWORD *)&v4 & 0x20000000) == 0)
  {
    uint64_t v97 = 0;
    if ((*(void *)&v4 & 0x80000000000) != 0) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v96 = 0;
    if ((*(void *)&v4 & 0x4000000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  uint64_t v97 = 2654435761 * self->_isLocalDevice;
  if ((*(void *)&v4 & 0x80000000000) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v96 = 2654435761 * self->_supportsExternalScreen;
  if ((*(void *)&v4 & 0x4000000000) != 0)
  {
LABEL_25:
    uint64_t v95 = 2654435761 * self->_requiresAuthorization;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v95 = 0;
LABEL_29:
  unint64_t v98 = v5;
  if ((*(void *)&v4 & 0x8000000000) != 0) {
    uint64_t v94 = 2654435761 * self->_shouldForceRemoteControlabillity;
  }
  else {
    uint64_t v94 = 0;
  }
  unint64_t v93 = [(_MRAVOutputDeviceSourceInfoProtobuf *)self->_sourceInfo hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    uint64_t v92 = 2654435761 * self->_isDeviceGroupable;
    if ((*(_DWORD *)&v10 & 0x10000) != 0) {
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v92 = 0;
    if ((*(_DWORD *)&v10 & 0x10000) != 0)
    {
LABEL_34:
      uint64_t v91 = 2654435761 * self->_canRelayCommunicationChannel;
      goto LABEL_37;
    }
  }
  uint64_t v91 = 0;
LABEL_37:
  NSUInteger v90 = [(NSString *)self->_logicalDeviceID hash];
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    uint64_t v89 = 2654435761 * self->_isProxyGroupPlayer;
  }
  else {
    uint64_t v89 = 0;
  }
  NSUInteger v88 = [(NSString *)self->_firmwareVersion hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    float volume = self->_volume;
    float v14 = -volume;
    if (volume >= 0.0) {
      float v14 = self->_volume;
    }
    float v15 = floorf(v14 + 0.5);
    float v16 = (float)(v14 - v15) * 1.8447e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabsf(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((*(void *)&v11 & 0x200000000) != 0)
  {
    uint64_t v86 = 2654435761 * self->_isVolumeControlAvailable;
    if ((*(_WORD *)&v11 & 0x800) != 0)
    {
LABEL_50:
      uint64_t v85 = 2654435761 * self->_canAccessAppleMusic;
      if ((*(_WORD *)&v11 & 0x2000) != 0) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v86 = 0;
    if ((*(_WORD *)&v11 & 0x800) != 0) {
      goto LABEL_50;
    }
  }
  uint64_t v85 = 0;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
LABEL_51:
    uint64_t v84 = 2654435761 * self->_canAccessiCloudMusicLibrary;
    if ((*(_DWORD *)&v11 & 0x100000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v84 = 0;
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
LABEL_52:
    uint64_t v83 = 2654435761 * self->_groupContainsGroupLeader;
    if ((*(void *)&v11 & 0x20000000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v83 = 0;
  if ((*(void *)&v11 & 0x20000000000) != 0)
  {
LABEL_53:
    uint64_t v82 = 2654435761 * self->_supportsBufferedAirPlay;
    if ((*(_WORD *)&v11 & 0x8000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v82 = 0;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_54:
    uint64_t v81 = 2654435761 * self->_canPlayEncryptedProgressiveDownloadAssets;
    if ((*(_WORD *)&v11 & 0x4000) != 0) {
      goto LABEL_55;
    }
LABEL_63:
    uint64_t v80 = 0;
    if ((*(void *)&v11 & 0x1000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_64;
  }
LABEL_62:
  uint64_t v81 = 0;
  if ((*(_WORD *)&v11 & 0x4000) == 0) {
    goto LABEL_63;
  }
LABEL_55:
  uint64_t v80 = 2654435761 * self->_canFetchMediaDataFromSender;
  if ((*(void *)&v11 & 0x1000000000) != 0)
  {
LABEL_56:
    uint64_t v79 = 2654435761 * self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v79 = 0;
LABEL_65:
  unint64_t v87 = v12;
  if ((*(_DWORD *)&v11 & 0x400000) != 0) {
    uint64_t v78 = 2654435761 * self->_isAirPlayReceiverSessionActive;
  }
  else {
    uint64_t v78 = 0;
  }
  NSUInteger v77 = [(NSString *)self->_parentGroupIdentifier hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v17 = self->_has;
  if ((*(void *)&v17 & 0x400000000) == 0)
  {
    uint64_t v76 = 0;
    if ((*(_DWORD *)&v17 & 0x200000) != 0) {
      goto LABEL_70;
    }
LABEL_73:
    uint64_t v75 = 0;
    if ((*(_WORD *)&v17 & 0x200) != 0) {
      goto LABEL_71;
    }
    goto LABEL_74;
  }
  uint64_t v76 = 2654435761 * self->_parentGroupContainsDiscoverableLeader;
  if ((*(_DWORD *)&v17 & 0x200000) == 0) {
    goto LABEL_73;
  }
LABEL_70:
  uint64_t v75 = 2654435761 * self->_isAddedToHomeKit;
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
LABEL_71:
    uint64_t v74 = 2654435761 * self->_volumeCapabilities;
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v74 = 0;
LABEL_75:
  NSUInteger v73 = [(NSString *)self->_bluetoothID hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v18 = self->_has;
  if ((*(void *)&v18 & 0x100000000000) != 0)
  {
    uint64_t v72 = 2654435761 * self->_supportsHAP;
    if ((*(void *)&v18 & 0x4000000000000) != 0) {
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v72 = 0;
    if ((*(void *)&v18 & 0x4000000000000) != 0)
    {
LABEL_77:
      uint64_t v71 = 2654435761 * self->_usingJSONProtocol;
      goto LABEL_80;
    }
  }
  uint64_t v71 = 0;
LABEL_80:
  uint64_t v70 = [(NSMutableArray *)self->_clusterCompositions hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v69 = 2654435761 * self->_clusterType;
  }
  else {
    uint64_t v69 = 0;
  }
  NSUInteger v68 = [(NSString *)self->_primaryUID hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    uint64_t v67 = 2654435761 * self->_configuredClusterSize;
    if ((*(void *)&v19 & 0x1000000000000) != 0) {
      goto LABEL_85;
    }
  }
  else
  {
    uint64_t v67 = 0;
    if ((*(void *)&v19 & 0x1000000000000) != 0)
    {
LABEL_85:
      uint64_t v66 = 2654435761 * self->_supportsRapportRemoteControlTransport;
      goto LABEL_88;
    }
  }
  uint64_t v66 = 0;
LABEL_88:
  NSUInteger v65 = [(NSString *)self->_currentBluetoothListeningMode hash];
  uint64_t v64 = [(NSMutableArray *)self->_availableBluetoothListeningModes hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v20 = self->_has;
  if ((*(void *)&v20 & 0x400000000000) == 0)
  {
    uint64_t v63 = 0;
    if ((*(void *)&v20 & 0x2000000000) != 0) {
      goto LABEL_90;
    }
LABEL_93:
    uint64_t v62 = 0;
    if ((*(unsigned char *)&v20 & 0x40) != 0) {
      goto LABEL_91;
    }
    goto LABEL_94;
  }
  uint64_t v63 = 2654435761 * self->_supportsMultiplayer;
  if ((*(void *)&v20 & 0x2000000000) == 0) {
    goto LABEL_93;
  }
LABEL_90:
  uint64_t v62 = 2654435761 * self->_producesLowFidelityAudio;
  if ((*(unsigned char *)&v20 & 0x40) != 0)
  {
LABEL_91:
    uint64_t v61 = 2654435761 * self->_hostDeviceClass;
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v61 = 0;
LABEL_95:
  NSUInteger v60 = [(NSString *)self->_airPlayGroupID hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v21 = self->_has;
  if ((*(void *)&v21 & 0x2000000000000) != 0)
  {
    uint64_t v59 = 2654435761 * self->_supportsSharePlayHandoff;
    if ((*(unsigned char *)&v21 & 0x20) != 0) {
      goto LABEL_97;
    }
LABEL_102:
    unint64_t v26 = 0;
    goto LABEL_105;
  }
  uint64_t v59 = 0;
  if ((*(unsigned char *)&v21 & 0x20) == 0) {
    goto LABEL_102;
  }
LABEL_97:
  float distance = self->_distance;
  float v23 = -distance;
  if (distance >= 0.0) {
    float v23 = self->_distance;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  unint64_t v26 = 2654435761u * (unint64_t)fmodf(v24, 1.8447e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0) {
      v26 += (unint64_t)v25;
    }
  }
  else
  {
    v26 -= (unint64_t)fabsf(v25);
  }
LABEL_105:
  unint64_t v58 = v26;
  if ((*(_DWORD *)&v21 & 0x40000) != 0) {
    uint64_t v57 = 2654435761 * self->_discoveredOnSameInfra;
  }
  else {
    uint64_t v57 = 0;
  }
  uint64_t v56 = [(NSMutableArray *)self->_activatedClusterMembers hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v27 = self->_has;
  if ((*(void *)&v27 & 0x800000000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_pickable;
    if ((*(unsigned char *)&v27 & 0x80) != 0) {
      goto LABEL_110;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(unsigned char *)&v27 & 0x80) != 0)
    {
LABEL_110:
      uint64_t v54 = 2654435761 * self->_transportType;
      goto LABEL_113;
    }
  }
  uint64_t v54 = 0;
LABEL_113:
  NSUInteger v53 = [(NSString *)self->_clusterID hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    uint64_t v52 = 2654435761 * self->_isClusterLeader;
    if ((*(_DWORD *)&v28 & 0x800000) != 0) {
      goto LABEL_115;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((*(_DWORD *)&v28 & 0x800000) != 0)
    {
LABEL_115:
      uint64_t v51 = 2654435761 * self->_isAppleAccessory;
      goto LABEL_118;
    }
  }
  uint64_t v51 = 0;
LABEL_118:
  NSUInteger v50 = [(NSString *)self->_parentUniqueIdentifier hash];
  NSUInteger v49 = [(NSString *)self->_roomID hash];
  NSUInteger v48 = [(NSString *)self->_roomName hash];
  uint64_t v47 = [(NSMutableArray *)self->_allClusterMembers hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v29 = self->_has;
  if ((*(void *)&v29 & 0x40000000000) != 0)
  {
    uint64_t v30 = 2654435761 * self->_supportsConversationDetection;
    if ((*(_DWORD *)&v29 & 0x20000) != 0)
    {
LABEL_120:
      uint64_t v31 = 2654435761 * self->_conversationDetectionEnabled;
      if ((*(_DWORD *)&v29 & 0x80000) != 0) {
        goto LABEL_121;
      }
LABEL_125:
      uint64_t v32 = 0;
      if ((*(void *)&v29 & 0x8000000000000) != 0) {
        goto LABEL_122;
      }
      goto LABEL_126;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(_DWORD *)&v29 & 0x20000) != 0) {
      goto LABEL_120;
    }
  }
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v29 & 0x80000) == 0) {
    goto LABEL_125;
  }
LABEL_121:
  uint64_t v32 = 2654435761 * self->_engageOnClusterActivate;
  if ((*(void *)&v29 & 0x8000000000000) != 0)
  {
LABEL_122:
    uint64_t v33 = 2654435761 * self->_volumeMuted;
    goto LABEL_127;
  }
LABEL_126:
  uint64_t v33 = 0;
LABEL_127:
  unint64_t v34 = [(_MRGroupSessionInfoProtobuf *)self->_groupSessionInfo hash];
  if (*((unsigned char *)&self->_has + 5)) {
    uint64_t v35 = 2654435761 * self->_supportsBluetoothSharing;
  }
  else {
    uint64_t v35 = 0;
  }
  NSUInteger v36 = [(NSString *)self->_deviceEnclosureColor hash];
  NSUInteger v37 = [(NSString *)self->_playingPairedDeviceName hash];
  $F5690C47DB6193B0809CC40AF9394DD6 v38 = self->_has;
  if ((*(void *)&v38 & 0x800000000000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_supportsRapport;
    if ((*(_DWORD *)&v38 & 0x40000000) != 0)
    {
LABEL_132:
      uint64_t v40 = 2654435761 * self->_isPickedOnPairedDevice;
      if ((*(void *)&v38 & 0x200000000000) != 0) {
        goto LABEL_133;
      }
      goto LABEL_138;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(_DWORD *)&v38 & 0x40000000) != 0) {
      goto LABEL_132;
    }
  }
  uint64_t v40 = 0;
  if ((*(void *)&v38 & 0x200000000000) != 0)
  {
LABEL_133:
    uint64_t v41 = 2654435761 * self->_supportsHeadTrackedSpatialAudio;
    if ((*(_WORD *)&v38 & 0x400) != 0) {
      goto LABEL_134;
    }
LABEL_139:
    uint64_t v42 = 0;
    if ((*(_DWORD *)&v38 & 0x10000000) != 0) {
      goto LABEL_135;
    }
LABEL_140:
    uint64_t v43 = 0;
    goto LABEL_141;
  }
LABEL_138:
  uint64_t v41 = 0;
  if ((*(_WORD *)&v38 & 0x400) == 0) {
    goto LABEL_139;
  }
LABEL_134:
  uint64_t v42 = 2654435761 * self->_allowsHeadTrackedSpatialAudio;
  if ((*(_DWORD *)&v38 & 0x10000000) == 0) {
    goto LABEL_140;
  }
LABEL_135:
  uint64_t v43 = 2654435761 * self->_isHeadTrackedSpatialAudioActive;
LABEL_141:
  NSUInteger v44 = v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  NSUInteger v45 = v35 ^ v36 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ [(NSString *)self->_headTrackedSpatialAudioMode hash];
  return v44 ^ v45 ^ [(NSMutableArray *)self->_dnsNames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  $F5690C47DB6193B0809CC40AF9394DD6 v4 = (char *)a3;
  if (*((void *)v4 + 24)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setName:](self, "setName:");
  }
  if (*((void *)v4 + 33)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
  if (*((void *)v4 + 16)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setGroupID:](self, "setGroupID:");
  }
  if (*((void *)v4 + 22)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](self, "setModelID:");
  }
  if (*((void *)v4 + 21)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setMacAddress:](self, "setMacAddress:");
  }
  uint64_t v5 = *(void *)(v4 + 324);
  if ((v5 & 0x1000) != 0)
  {
    self->_canAccessRemoteAssets = v4[282];
    *(void *)&self->_has |= 0x1000uLL;
    uint64_t v5 = *(void *)(v4 + 324);
    if ((v5 & 0x100000000) == 0)
    {
LABEL_13:
      if ((v5 & 0x4000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x100000000) == 0)
  {
    goto LABEL_13;
  }
  self->_isRemoteControllable = v4[302];
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *(void *)(v4 + 324);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_isGroupLeader = v4[296];
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *(void *)(v4 + 324);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_isGroupable = v4[297];
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *(void *)(v4 + 324);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_33:
  self->_uint64_t deviceType = *((_DWORD *)v4 + 25);
  *(void *)&self->_has |= 0x10uLL;
  if ((*(void *)(v4 + 324) & 8) != 0)
  {
LABEL_17:
    self->_uint64_t deviceSubType = *((_DWORD *)v4 + 24);
    *(void *)&self->_has |= 8uLL;
  }
LABEL_18:
  if (*((void *)v4 + 23)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setModelSpecificInfoData:](self, "setModelSpecificInfoData:");
  }
  uint64_t v6 = *(void *)(v4 + 324);
  if (v6)
  {
    self->_float batteryLevel = *((float *)v4 + 10);
    *(void *)&self->_has |= 1uLL;
    uint64_t v6 = *(void *)(v4 + 324);
    if ((v6 & 0x20000000) == 0)
    {
LABEL_22:
      if ((v6 & 0x80000000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x20000000) == 0)
  {
    goto LABEL_22;
  }
  self->_isLocalDevice = v4[299];
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v6 = *(void *)(v4 + 324);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_supportsExternalScreeuint64_t n = v4[313];
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v6 = *(void *)(v4 + 324);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_38:
  self->_requiresAuthorizatiouint64_t n = v4[308];
  *(void *)&self->_has |= 0x4000000000uLL;
  if ((*(void *)(v4 + 324) & 0x8000000000) != 0)
  {
LABEL_25:
    self->_shouldForceRemoteControlabillity = v4[309];
    *(void *)&self->_has |= 0x8000000000uLL;
  }
LABEL_26:
  sourceInfo = self->_sourceInfo;
  uint64_t v8 = *((void *)v4 + 31);
  if (sourceInfo)
  {
    if (v8) {
      -[_MRAVOutputDeviceSourceInfoProtobuf mergeFrom:](sourceInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setSourceInfo:](self, "setSourceInfo:");
  }
  uint64_t v9 = *(void *)(v4 + 324);
  if ((v9 & 0x2000000) != 0)
  {
    self->_isDeviceGroupable = v4[295];
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v9 = *(void *)(v4 + 324);
  }
  if ((v9 & 0x10000) != 0)
  {
    self->_canRelayCommunicationChannel = v4[286];
    *(void *)&self->_has |= 0x10000uLL;
  }
  if (*((void *)v4 + 20)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setLogicalDeviceID:](self, "setLogicalDeviceID:");
  }
  if (v4[327] < 0)
  {
    self->_isProxyGroupPlayer = v4[301];
    *(void *)&self->_has |= 0x80000000uLL;
  }
  if (*((void *)v4 + 15)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setFirmwareVersion:](self, "setFirmwareVersion:");
  }
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x100) != 0)
  {
    self->_float volume = *((float *)v4 + 68);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v10 = *(void *)(v4 + 324);
    if ((v10 & 0x200000000) == 0)
    {
LABEL_54:
      if ((v10 & 0x800) == 0) {
        goto LABEL_55;
      }
      goto LABEL_149;
    }
  }
  else if ((v10 & 0x200000000) == 0)
  {
    goto LABEL_54;
  }
  self->_isVolumeControlAvailable = v4[303];
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x800) == 0)
  {
LABEL_55:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_canAccessAppleMusic = v4[281];
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x2000) == 0)
  {
LABEL_56:
    if ((v10 & 0x100000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_canAccessiCloudMusicLibrary = v4[283];
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x100000) == 0)
  {
LABEL_57:
    if ((v10 & 0x20000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_152;
  }
LABEL_151:
  self->_groupContainsGroupLeader = v4[290];
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x20000000000) == 0)
  {
LABEL_58:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_153;
  }
LABEL_152:
  self->_supportsBufferedAirPlay = v4[311];
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x8000) == 0)
  {
LABEL_59:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_canPlayEncryptedProgressiveDownloadAssets = v4[285];
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x4000) == 0)
  {
LABEL_60:
    if ((v10 & 0x1000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_canFetchMediaDataFromSender = v4[284];
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v10 = *(void *)(v4 + 324);
  if ((v10 & 0x1000000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_155:
  self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets = v4[306];
  *(void *)&self->_has |= 0x1000000000uLL;
  if ((*(void *)(v4 + 324) & 0x400000) != 0)
  {
LABEL_62:
    self->_isAirPlayReceiverSessionActive = v4[292];
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_63:
  if (*((void *)v4 + 25)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setParentGroupIdentifier:](self, "setParentGroupIdentifier:");
  }
  uint64_t v11 = *(void *)(v4 + 324);
  if ((v11 & 0x400000000) != 0)
  {
    self->_parentGroupContainsDiscoverableLeader = v4[304];
    *(void *)&self->_has |= 0x400000000uLL;
    uint64_t v11 = *(void *)(v4 + 324);
    if ((v11 & 0x200000) == 0)
    {
LABEL_67:
      if ((v11 & 0x200) == 0) {
        goto LABEL_69;
      }
      goto LABEL_68;
    }
  }
  else if ((v11 & 0x200000) == 0)
  {
    goto LABEL_67;
  }
  self->_isAddedToHomeKit = v4[291];
  *(void *)&self->_has |= 0x200000uLL;
  if ((*(void *)(v4 + 324) & 0x200) != 0)
  {
LABEL_68:
    self->_volumeCapabilities = *((_DWORD *)v4 + 69);
    *(void *)&self->_has |= 0x200uLL;
  }
LABEL_69:
  if (*((void *)v4 + 6)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setBluetoothID:](self, "setBluetoothID:");
  }
  uint64_t v12 = *(void *)(v4 + 324);
  if ((v12 & 0x100000000000) != 0)
  {
    self->_supportsHAP = v4[314];
    *(void *)&self->_has |= 0x100000000000uLL;
    uint64_t v12 = *(void *)(v4 + 324);
  }
  if ((v12 & 0x4000000000000) != 0)
  {
    self->_usingJSONProtocol = v4[320];
    *(void *)&self->_has |= 0x4000000000000uLL;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v13);
        }
        [(_MRAVOutputDeviceDescriptorProtobuf *)self addClusterComposition:*(void *)(*((void *)&v63 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v15);
  }

  if ((v4[324] & 2) != 0)
  {
    self->_clusterType = *((_DWORD *)v4 + 18);
    *(void *)&self->_has |= 2uLL;
  }
  if (*((void *)v4 + 28)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setPrimaryUID:](self, "setPrimaryUID:");
  }
  uint64_t v18 = *(void *)(v4 + 324);
  if ((v18 & 4) != 0)
  {
    self->_configuredClusterSize = *((_DWORD *)v4 + 19);
    *(void *)&self->_has |= 4uLL;
    uint64_t v18 = *(void *)(v4 + 324);
  }
  if ((v18 & 0x1000000000000) != 0)
  {
    self->_supportsRapportRemoteControlTransport = v4[318];
    *(void *)&self->_has |= 0x1000000000000uLL;
  }
  if (*((void *)v4 + 10)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setCurrentBluetoothListeningMode:](self, "setCurrentBluetoothListeningMode:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v19 = *((id *)v4 + 4);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v19);
        }
        [(_MRAVOutputDeviceDescriptorProtobuf *)self addAvailableBluetoothListeningModes:*(void *)(*((void *)&v59 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v21);
  }

  uint64_t v24 = *(void *)(v4 + 324);
  if ((v24 & 0x400000000000) != 0)
  {
    self->_supportsMultiplayer = v4[316];
    *(void *)&self->_has |= 0x400000000000uLL;
    uint64_t v24 = *(void *)(v4 + 324);
    if ((v24 & 0x2000000000) == 0)
    {
LABEL_101:
      if ((v24 & 0x40) == 0) {
        goto LABEL_103;
      }
      goto LABEL_102;
    }
  }
  else if ((v24 & 0x2000000000) == 0)
  {
    goto LABEL_101;
  }
  self->_producesLowFidelityAudio = v4[307];
  *(void *)&self->_has |= 0x2000000000uLL;
  if ((*(void *)(v4 + 324) & 0x40) != 0)
  {
LABEL_102:
    self->_hostDeviceClass = *((_DWORD *)v4 + 38);
    *(void *)&self->_has |= 0x40uLL;
  }
LABEL_103:
  if (*((void *)v4 + 2)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setAirPlayGroupID:](self, "setAirPlayGroupID:");
  }
  uint64_t v25 = *(void *)(v4 + 324);
  if ((v25 & 0x2000000000000) != 0)
  {
    self->_supportsSharePlayHandoff = v4[319];
    *(void *)&self->_has |= 0x2000000000000uLL;
    uint64_t v25 = *(void *)(v4 + 324);
    if ((v25 & 0x20) == 0)
    {
LABEL_107:
      if ((v25 & 0x40000) == 0) {
        goto LABEL_109;
      }
      goto LABEL_108;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_107;
  }
  self->_float distance = *((float *)v4 + 26);
  *(void *)&self->_has |= 0x20uLL;
  if ((*(void *)(v4 + 324) & 0x40000) != 0)
  {
LABEL_108:
    self->_discoveredOnSameInfra = v4[288];
    *(void *)&self->_has |= 0x40000uLL;
  }
LABEL_109:
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v26 = *((id *)v4 + 1);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(v26);
        }
        [(_MRAVOutputDeviceDescriptorProtobuf *)self addActivatedClusterMembers:*(void *)(*((void *)&v55 + 1) + 8 * k)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v28);
  }

  uint64_t v31 = *(void *)(v4 + 324);
  if ((v31 & 0x800000000) != 0)
  {
    self->_pickable = v4[305];
    *(void *)&self->_has |= 0x800000000uLL;
    uint64_t v31 = *(void *)(v4 + 324);
  }
  if ((v31 & 0x80) != 0)
  {
    self->_uint64_t transportType = *((_DWORD *)v4 + 64);
    *(void *)&self->_has |= 0x80uLL;
  }
  if (*((void *)v4 + 8)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setClusterID:](self, "setClusterID:");
  }
  uint64_t v32 = *(void *)(v4 + 324);
  if ((v32 & 0x1000000) != 0)
  {
    self->_isClusterLeader = v4[294];
    *(void *)&self->_has |= 0x1000000uLL;
    uint64_t v32 = *(void *)(v4 + 324);
  }
  if ((v32 & 0x800000) != 0)
  {
    self->_isAppleAccessory = v4[293];
    *(void *)&self->_has |= 0x800000uLL;
  }
  if (*((void *)v4 + 26)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setParentUniqueIdentifier:](self, "setParentUniqueIdentifier:");
  }
  if (*((void *)v4 + 29)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setRoomID:](self, "setRoomID:");
  }
  if (*((void *)v4 + 30)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setRoomName:](self, "setRoomName:");
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v33 = *((id *)v4 + 3);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v33);
        }
        [(_MRAVOutputDeviceDescriptorProtobuf *)self addAllClusterMembers:*(void *)(*((void *)&v51 + 1) + 8 * m)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v35);
  }

  uint64_t v38 = *(void *)(v4 + 324);
  if ((v38 & 0x40000000000) != 0)
  {
    self->_supportsConversationDetectiouint64_t n = v4[312];
    *(void *)&self->_has |= 0x40000000000uLL;
    uint64_t v38 = *(void *)(v4 + 324);
    if ((v38 & 0x20000) == 0)
    {
LABEL_141:
      if ((v38 & 0x80000) == 0) {
        goto LABEL_142;
      }
      goto LABEL_168;
    }
  }
  else if ((v38 & 0x20000) == 0)
  {
    goto LABEL_141;
  }
  self->_conversationDetectionEnabled = v4[287];
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v38 = *(void *)(v4 + 324);
  if ((v38 & 0x80000) == 0)
  {
LABEL_142:
    if ((v38 & 0x8000000000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_143;
  }
LABEL_168:
  self->_engageOnClusterActivate = v4[289];
  *(void *)&self->_has |= 0x80000uLL;
  if ((*(void *)(v4 + 324) & 0x8000000000000) != 0)
  {
LABEL_143:
    self->_volumeMuted = v4[321];
    *(void *)&self->_has |= 0x8000000000000uLL;
  }
LABEL_144:
  groupSessionInfo = self->_groupSessionInfo;
  uint64_t v40 = *((void *)v4 + 17);
  if (groupSessionInfo)
  {
    if (v40) {
      -[_MRGroupSessionInfoProtobuf mergeFrom:](groupSessionInfo, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setGroupSessionInfo:](self, "setGroupSessionInfo:");
  }
  if (v4[329])
  {
    self->_supportsBluetoothSharing = v4[310];
    *(void *)&self->_has |= 0x10000000000uLL;
  }
  if (*((void *)v4 + 11)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
  }
  if (*((void *)v4 + 27)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setPlayingPairedDeviceName:](self, "setPlayingPairedDeviceName:");
  }
  uint64_t v41 = *(void *)(v4 + 324);
  if ((v41 & 0x800000000000) != 0)
  {
    self->_supportsRapport = v4[317];
    *(void *)&self->_has |= 0x800000000000uLL;
    uint64_t v41 = *(void *)(v4 + 324);
    if ((v41 & 0x40000000) == 0)
    {
LABEL_180:
      if ((v41 & 0x200000000000) == 0) {
        goto LABEL_181;
      }
      goto LABEL_196;
    }
  }
  else if ((v41 & 0x40000000) == 0)
  {
    goto LABEL_180;
  }
  self->_isPickedOnPairedDevice = v4[300];
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v41 = *(void *)(v4 + 324);
  if ((v41 & 0x200000000000) == 0)
  {
LABEL_181:
    if ((v41 & 0x400) == 0) {
      goto LABEL_182;
    }
    goto LABEL_197;
  }
LABEL_196:
  self->_supportsHeadTrackedSpatialAudio = v4[315];
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v41 = *(void *)(v4 + 324);
  if ((v41 & 0x400) == 0)
  {
LABEL_182:
    if ((v41 & 0x10000000) == 0) {
      goto LABEL_184;
    }
    goto LABEL_183;
  }
LABEL_197:
  self->_allowsHeadTrackedSpatialAudio = v4[280];
  *(void *)&self->_has |= 0x400uLL;
  if ((*(void *)(v4 + 324) & 0x10000000) != 0)
  {
LABEL_183:
    self->_isHeadTrackedSpatialAudioActive = v4[298];
    *(void *)&self->_has |= 0x10000000uLL;
  }
LABEL_184:
  if (*((void *)v4 + 18)) {
    -[_MRAVOutputDeviceDescriptorProtobuf setHeadTrackedSpatialAudioMode:](self, "setHeadTrackedSpatialAudioMode:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v42 = *((id *)v4 + 14);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v48;
    do
    {
      for (uint64_t n = 0; n != v44; ++n)
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(v42);
        }
        -[_MRAVOutputDeviceDescriptorProtobuf addDnsNames:](self, "addDnsNames:", *(void *)(*((void *)&v47 + 1) + 8 * n), (void)v47);
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v44);
  }
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)supportsExternalScreen
{
  return self->_supportsExternalScreen;
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (BOOL)shouldForceRemoteControlabillity
{
  return self->_shouldForceRemoteControlabillity;
}

- (NSString)logicalDeviceID
{
  return self->_logicalDeviceID;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (BOOL)isVolumeControlAvailable
{
  return self->_isVolumeControlAvailable;
}

- (void)setClusterCompositions:(id)a3
{
}

- (NSString)primaryUID
{
  return self->_primaryUID;
}

- (unsigned)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return self->_supportsRapportRemoteControlTransport;
}

- (NSString)currentBluetoothListeningMode
{
  return self->_currentBluetoothListeningMode;
}

- (NSMutableArray)availableBluetoothListeningModes
{
  return self->_availableBluetoothListeningModes;
}

- (BOOL)producesLowFidelityAudio
{
  return self->_producesLowFidelityAudio;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (BOOL)supportsSharePlayHandoff
{
  return self->_supportsSharePlayHandoff;
}

- (float)distance
{
  return self->_distance;
}

- (void)setActivatedClusterMembers:(id)a3
{
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (BOOL)isAppleAccessory
{
  return self->_isAppleAccessory;
}

- (NSString)parentUniqueIdentifier
{
  return self->_parentUniqueIdentifier;
}

- (NSString)roomID
{
  return self->_roomID;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setAllClusterMembers:(id)a3
{
}

- (BOOL)supportsConversationDetection
{
  return self->_supportsConversationDetection;
}

- (BOOL)conversationDetectionEnabled
{
  return self->_conversationDetectionEnabled;
}

- (BOOL)engageOnClusterActivate
{
  return self->_engageOnClusterActivate;
}

- (_MRGroupSessionInfoProtobuf)groupSessionInfo
{
  return self->_groupSessionInfo;
}

- (void)setGroupSessionInfo:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (BOOL)supportsRapport
{
  return self->_supportsRapport;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_isPickedOnPairedDevice;
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
  return self->_isHeadTrackedSpatialAudioActive;
}

- (NSString)headTrackedSpatialAudioMode
{
  return self->_headTrackedSpatialAudioMode;
}

- (NSMutableArray)dnsNames
{
  return self->_dnsNames;
}

- (void)setDnsNames:(id)a3
{
}

@end