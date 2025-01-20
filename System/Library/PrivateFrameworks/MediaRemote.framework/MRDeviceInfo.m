@interface MRDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)dataFromDeviceInfos:(id)a3;
+ (id)deviceInfosFromData:(id)a3;
+ (int64_t)deviceClass;
- (BOOL)containsDevice:(id)a3;
- (BOOL)containsLocalDevice;
- (BOOL)effectiveParentGroupContainsDiscoverableGroupLeader;
- (BOOL)groupContainsDiscoverableGroupLeader;
- (BOOL)hasAirPlayActive;
- (BOOL)hasClusterType;
- (BOOL)hasConfiguredClusterSize;
- (BOOL)hasConnected;
- (BOOL)hasDeviceClass;
- (BOOL)hasGroupContainsDiscoverableGroupLeader;
- (BOOL)hasGroupLeader;
- (BOOL)hasGroupLogicalDeviceCount;
- (BOOL)hasGroupedDeviceCount;
- (BOOL)hasIsClusterAware;
- (BOOL)hasIsClusterLeader;
- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)hasLastSupportedClusterType;
- (BOOL)hasLastSupportedProtocolMessageType;
- (BOOL)hasPairingAllowed;
- (BOOL)hasParentGroupContainsDiscoverableGroupLeader;
- (BOOL)hasPlaceholderGroupSession;
- (BOOL)hasPreferredEncoding;
- (BOOL)hasProtocolVersion;
- (BOOL)hasProxyGroupPlayer;
- (BOOL)hasSharedQueueVersion;
- (BOOL)hasSupportsACL;
- (BOOL)hasSupportsExtendedMotion;
- (BOOL)hasSupportsMultiplayer;
- (BOOL)hasSupportsOutputContextSync;
- (BOOL)hasSupportsSharedQueue;
- (BOOL)hasSupportsSystemPairing;
- (BOOL)hasTightSyncGroup;
- (BOOL)isAirPlayActive;
- (BOOL)isAwareOfCluster:(unsigned int)a3;
- (BOOL)isClusterAware;
- (BOOL)isClusterLeader;
- (BOOL)isCompanion;
- (BOOL)isConnected;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGizmo;
- (BOOL)isGroupLeader;
- (BOOL)isPairingAllowed;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isTightSyncGroup;
- (BOOL)matchesUID:(id)a3;
- (BOOL)parentGroupContainsDiscoverableGroupLeader;
- (BOOL)supportsACL;
- (BOOL)supportsExtendedMotion;
- (BOOL)supportsImplicitChangeShuffleAndRepeatModeInSetPlaybackQueueCommandOptions;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsOutputContextSync;
- (BOOL)supportsSharedQueue;
- (BOOL)supportsSystemPairing;
- (BOOL)supportsTwoHop;
- (MRDeviceInfo)initWithCoder:(id)a3;
- (MRDeviceInfo)initWithData:(id)a3;
- (MRDeviceInfo)initWithOutputDevice:(id)a3;
- (MRDeviceInfo)initWithOutputDeviceDescription:(id)a3;
- (MRDeviceInfo)initWithProtobuf:(id)a3;
- (MRDeviceInfo)leaderDeviceInfo;
- (MRDeviceInfo)skeleton;
- (MRGroupSessionToken)groupSessionToken;
- (NSArray)airPlayReceivers;
- (NSArray)allClusteredDevices;
- (NSArray)clusteredDevices;
- (NSArray)groupedDevices;
- (NSData)bluetoothAddress;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSString)WHAIdentifier;
- (NSString)activeSystemEndpointUID;
- (NSString)airPlayGroupUID;
- (NSString)buildVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)clusterID;
- (NSString)clusterLeaderID;
- (NSString)computerName;
- (NSString)deviceUID;
- (NSString)effectiveID;
- (NSString)groupName;
- (NSString)groupUID;
- (NSString)identifier;
- (NSString)linkAgent;
- (NSString)localReceiverPairingIdentity;
- (NSString)localizedModelName;
- (NSString)managedConfigurationDeviceIdentifier;
- (NSString)minimalDescription;
- (NSString)modelID;
- (NSString)name;
- (NSString)parentGroupID;
- (NSString)routingContextID;
- (NSString)senderDefaultGroupUID;
- (NSString)systemBooksApplication;
- (NSString)systemMediaApplication;
- (NSString)systemPodcastApplication;
- (NSString)tightSyncUID;
- (_MRDeviceInfoMessageProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltaDescriptionFromDeviceInfo:(id)a3;
- (id)deltaDescriptionFromDeviceInfo:(id)a3 minimal:(BOOL)a4;
- (id)description;
- (id)minimalDeltaDescriptionFromDeviceInfo:(id)a3;
- (int64_t)deviceClass;
- (int64_t)preferredEncoding;
- (unint64_t)configuredClusterSize;
- (unint64_t)groupLogicalDeviceCount;
- (unint64_t)groupedDeviceCount;
- (unint64_t)hash;
- (unint64_t)lastSupportedProtocolMessageType;
- (unint64_t)protocolVersion;
- (unint64_t)sharedQueueVersion;
- (unsigned)clusterType;
- (unsigned)lastSupportedClusterType;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveSystemEndpointUID:(id)a3;
- (void)setAirPlayActive:(BOOL)a3;
- (void)setAirPlayGroupUID:(id)a3;
- (void)setAirPlayReceivers:(id)a3;
- (void)setAllClusteredDevices:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setClusterAware:(BOOL)a3;
- (void)setClusterID:(id)a3;
- (void)setClusterLeader:(BOOL)a3;
- (void)setClusterLeaderID:(id)a3;
- (void)setClusterType:(unsigned int)a3;
- (void)setClusteredDevices:(id)a3;
- (void)setComputerName:(id)a3;
- (void)setConfiguredClusterSize:(unint64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDeviceClass:(int64_t)a3;
- (void)setDeviceUID:(id)a3;
- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setGroupLeader:(BOOL)a3;
- (void)setGroupLogicalDeviceCount:(unint64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupSessionToken:(id)a3;
- (void)setGroupUID:(id)a3;
- (void)setGroupedDeviceCount:(unint64_t)a3;
- (void)setGroupedDevices:(id)a3;
- (void)setHasAirPlayActive:(BOOL)a3;
- (void)setHasClusterType:(BOOL)a3;
- (void)setHasConfiguredClusterSize:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setHasGroupLeader:(BOOL)a3;
- (void)setHasGroupLogicalDeviceCount:(BOOL)a3;
- (void)setHasGroupedDeviceCount:(BOOL)a3;
- (void)setHasIsClusterAware:(BOOL)a3;
- (void)setHasIsClusterLeader:(BOOL)a3;
- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3;
- (void)setHasLastSupportedClusterType:(BOOL)a3;
- (void)setHasLastSupportedProtocolMessageType:(BOOL)a3;
- (void)setHasPairingAllowed:(BOOL)a3;
- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasProxyGroupPlayer:(BOOL)a3;
- (void)setHasSharedQueueVersion:(BOOL)a3;
- (void)setHasSupportsACL:(BOOL)a3;
- (void)setHasSupportsExtendedMotion:(BOOL)a3;
- (void)setHasSupportsMultiplayer:(BOOL)a3;
- (void)setHasSupportsOutputContextSync:(BOOL)a3;
- (void)setHasSupportsSharedQueue:(BOOL)a3;
- (void)setHasSupportsSystemPairing:(BOOL)a3;
- (void)setHasTightSyncGroup:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3;
- (void)setLastSupportedClusterType:(unsigned int)a3;
- (void)setLastSupportedProtocolMessageType:(unint64_t)a3;
- (void)setLeaderDeviceInfo:(id)a3;
- (void)setLinkAgent:(id)a3;
- (void)setLocalReceiverPairingIdentity:(id)a3;
- (void)setLocalizedModelName:(id)a3;
- (void)setManagedConfigurationDeviceIdentifier:(id)a3;
- (void)setModelID:(id)a3;
- (void)setName:(id)a3;
- (void)setPairingAllowed:(BOOL)a3;
- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setPreferredEncoding:(int64_t)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setProxyGroupPlayer:(BOOL)a3;
- (void)setRoutingContextID:(id)a3;
- (void)setSenderDefaultGroupUID:(id)a3;
- (void)setSharedQueueVersion:(unint64_t)a3;
- (void)setSupportsACL:(BOOL)a3;
- (void)setSupportsExtendedMotion:(BOOL)a3;
- (void)setSupportsMultiplayer:(BOOL)a3;
- (void)setSupportsOutputContextSync:(BOOL)a3;
- (void)setSupportsSharedQueue:(BOOL)a3;
- (void)setSupportsSystemPairing:(BOOL)a3;
- (void)setSystemBooksApplication:(id)a3;
- (void)setSystemMediaApplication:(id)a3;
- (void)setSystemPodcastApplication:(id)a3;
- (void)setTightSyncGroup:(BOOL)a3;
- (void)setTightSyncUID:(id)a3;
@end

@implementation MRDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSystemEndpointUID, 0);
  objc_storeStrong((id *)&self->_leaderDeviceInfo, 0);
  objc_storeStrong((id *)&self->_groupSessionToken, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_clusterLeaderID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_linkAgent, 0);
  objc_storeStrong((id *)&self->_airPlayReceivers, 0);
  objc_storeStrong((id *)&self->_allClusteredDevices, 0);
  objc_storeStrong((id *)&self->_clusteredDevices, 0);
  objc_storeStrong((id *)&self->_groupedDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_senderDefaultGroupUID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_airPlayGroupUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_tightSyncUID, 0);
  objc_storeStrong((id *)&self->_managedConfigurationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localReceiverPairingIdentity, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_systemBooksApplication, 0);
  objc_storeStrong((id *)&self->_systemPodcastApplication, 0);
  objc_storeStrong((id *)&self->_systemMediaApplication, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_localizedModelName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setDeviceClass:", -[MRDeviceInfo deviceClass](self, "deviceClass"));
  objc_msgSend(v5, "setHasDeviceClass:", -[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"));
  objc_msgSend(v5, "setProtocolVersion:", -[MRDeviceInfo protocolVersion](self, "protocolVersion"));
  objc_msgSend(v5, "setHasProtocolVersion:", -[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"));
  objc_msgSend(v5, "setGroupedDeviceCount:", -[MRDeviceInfo groupedDeviceCount](self, "groupedDeviceCount"));
  objc_msgSend(v5, "setHasGroupedDeviceCount:", -[MRDeviceInfo hasGroupedDeviceCount](self, "hasGroupedDeviceCount"));
  objc_msgSend(v5, "setSharedQueueVersion:", -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"));
  objc_msgSend(v5, "setHasSharedQueueVersion:", -[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"));
  objc_msgSend(v5, "setGroupLogicalDeviceCount:", -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"));
  objc_msgSend(v5, "setHasGroupLogicalDeviceCount:", -[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"));
  objc_msgSend(v5, "setSupportsSystemPairing:", -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"));
  objc_msgSend(v5, "setHasSupportsSystemPairing:", -[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"));
  objc_msgSend(v5, "setSupportsACL:", -[MRDeviceInfo supportsACL](self, "supportsACL"));
  objc_msgSend(v5, "setHasSupportsACL:", -[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"));
  objc_msgSend(v5, "setSupportsSharedQueue:", -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"));
  objc_msgSend(v5, "setHasSupportsSharedQueue:", -[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"));
  objc_msgSend(v5, "setSupportsExtendedMotion:", -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"));
  objc_msgSend(v5, "setHasSupportsExtendedMotion:", -[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"));
  objc_msgSend(v5, "setTightSyncGroup:", -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"));
  objc_msgSend(v5, "setHasTightSyncGroup:", -[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"));
  objc_msgSend(v5, "setPairingAllowed:", -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"));
  objc_msgSend(v5, "setHasPairingAllowed:", -[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"));
  objc_msgSend(v5, "setProxyGroupPlayer:", -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  objc_msgSend(v5, "setHasProxyGroupPlayer:", -[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"));
  objc_msgSend(v5, "setConnected:", -[MRDeviceInfo isConnected](self, "isConnected"));
  objc_msgSend(v5, "setHasConnected:", -[MRDeviceInfo hasConnected](self, "hasConnected"));
  objc_msgSend(v5, "setGroupLeader:", -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"));
  objc_msgSend(v5, "setHasGroupLeader:", -[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"));
  objc_msgSend(v5, "setAirPlayActive:", -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"));
  objc_msgSend(v5, "setHasAirPlayActive:", -[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"));
  objc_msgSend(v5, "setSupportsMultiplayer:", -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"));
  objc_msgSend(v5, "setHasSupportsMultiplayer:", -[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"));
  objc_msgSend(v5, "setParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setHasParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setHasGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  objc_msgSend(v5, "setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo hasIsEligibleForHostingGroupSessionExcludingAcknowledgements](self, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements"));
  objc_msgSend(v5, "setClusterType:", -[MRDeviceInfo clusterType](self, "clusterType"));
  objc_msgSend(v5, "setHasClusterType:", -[MRDeviceInfo hasClusterType](self, "hasClusterType"));
  objc_msgSend(v5, "setClusterAware:", -[MRDeviceInfo isClusterAware](self, "isClusterAware"));
  objc_msgSend(v5, "setHasIsClusterAware:", -[MRDeviceInfo hasIsClusterAware](self, "hasIsClusterAware"));
  objc_msgSend(v5, "setClusterLeader:", -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"));
  objc_msgSend(v5, "setHasIsClusterLeader:", -[MRDeviceInfo hasIsClusterLeader](self, "hasIsClusterLeader"));
  objc_msgSend(v5, "setConfiguredClusterSize:", -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"));
  objc_msgSend(v5, "setHasConfiguredClusterSize:", -[MRDeviceInfo hasConfiguredClusterSize](self, "hasConfiguredClusterSize"));
  objc_msgSend(v5, "setLastSupportedClusterType:", -[MRDeviceInfo lastSupportedClusterType](self, "lastSupportedClusterType"));
  objc_msgSend(v5, "setHasLastSupportedClusterType:", -[MRDeviceInfo hasLastSupportedClusterType](self, "hasLastSupportedClusterType"));
  objc_msgSend(v5, "setSupportsOutputContextSync:", -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"));
  objc_msgSend(v5, "setHasSupportsOutputContextSync:", -[MRDeviceInfo hasSupportsOutputContextSync](self, "hasSupportsOutputContextSync"));
  objc_msgSend(v5, "setLastSupportedProtocolMessageType:", -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"));
  objc_msgSend(v5, "setHasLastSupportedProtocolMessageType:", -[MRDeviceInfo hasLastSupportedProtocolMessageType](self, "hasLastSupportedProtocolMessageType"));
  v6 = [(MRDeviceInfo *)self name];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setName:v7];

  v8 = [(MRDeviceInfo *)self identifier];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setIdentifier:v9];

  v10 = [(MRDeviceInfo *)self localizedModelName];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setLocalizedModelName:v11];

  v12 = [(MRDeviceInfo *)self buildVersion];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBuildVersion:v13];

  v14 = [(MRDeviceInfo *)self bundleIdentifier];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setBundleIdentifier:v15];

  v16 = [(MRDeviceInfo *)self bundleVersion];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setBundleVersion:v17];

  v18 = [(MRDeviceInfo *)self systemMediaApplication];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSystemMediaApplication:v19];

  v20 = [(MRDeviceInfo *)self systemPodcastApplication];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setSystemPodcastApplication:v21];

  v22 = [(MRDeviceInfo *)self systemBooksApplication];
  v23 = (void *)[v22 copyWithZone:a3];
  [v5 setSystemBooksApplication:v23];

  v24 = [(MRDeviceInfo *)self deviceUID];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setDeviceUID:v25];

  v26 = [(MRDeviceInfo *)self localReceiverPairingIdentity];
  v27 = (void *)[v26 copyWithZone:a3];
  [v5 setLocalReceiverPairingIdentity:v27];

  v28 = [(MRDeviceInfo *)self managedConfigurationDeviceIdentifier];
  v29 = (void *)[v28 copyWithZone:a3];
  [v5 setManagedConfigurationDeviceIdentifier:v29];

  v30 = [(MRDeviceInfo *)self tightSyncUID];
  v31 = (void *)[v30 copyWithZone:a3];
  [v5 setTightSyncUID:v31];

  v32 = [(MRDeviceInfo *)self groupUID];
  v33 = (void *)[v32 copyWithZone:a3];
  [v5 setGroupUID:v33];

  v34 = [(MRDeviceInfo *)self airPlayGroupUID];
  v35 = (void *)[v34 copyWithZone:a3];
  [v5 setAirPlayGroupUID:v35];

  v36 = [(MRDeviceInfo *)self groupName];
  v37 = (void *)[v36 copyWithZone:a3];
  [v5 setGroupName:v37];

  v38 = [(MRDeviceInfo *)self senderDefaultGroupUID];
  v39 = (void *)[v38 copyWithZone:a3];
  [v5 setSenderDefaultGroupUID:v39];

  v40 = [(MRDeviceInfo *)self bluetoothAddress];
  v41 = (void *)[v40 copyWithZone:a3];
  [v5 setBluetoothAddress:v41];

  v42 = [(MRDeviceInfo *)self groupedDevices];
  v43 = (void *)[v42 copyWithZone:a3];
  [v5 setGroupedDevices:v43];

  v44 = [(MRDeviceInfo *)self clusteredDevices];
  v45 = (void *)[v44 copyWithZone:a3];
  [v5 setClusteredDevices:v45];

  v46 = [(MRDeviceInfo *)self allClusteredDevices];
  v47 = (void *)[v46 copyWithZone:a3];
  [v5 setAllClusteredDevices:v47];

  v48 = [(MRDeviceInfo *)self airPlayReceivers];
  v49 = (void *)[v48 copyWithZone:a3];
  [v5 setAirPlayReceivers:v49];

  v50 = [(MRDeviceInfo *)self linkAgent];
  v51 = (void *)[v50 copyWithZone:a3];
  [v5 setLinkAgent:v51];

  v52 = [(MRDeviceInfo *)self clusterID];
  v53 = (void *)[v52 copyWithZone:a3];
  [v5 setClusterID:v53];

  v54 = [(MRDeviceInfo *)self clusterLeaderID];
  v55 = (void *)[v54 copyWithZone:a3];
  [v5 setClusterLeaderID:v55];

  v56 = [(MRDeviceInfo *)self modelID];
  v57 = (void *)[v56 copyWithZone:a3];
  [v5 setModelID:v57];

  v58 = [(MRDeviceInfo *)self routingContextID];
  v59 = (void *)[v58 copyWithZone:a3];
  [v5 setRoutingContextID:v59];

  v60 = [(MRDeviceInfo *)self computerName];
  v61 = (void *)[v60 copyWithZone:a3];
  [v5 setComputerName:v61];

  v62 = [(MRDeviceInfo *)self groupSessionToken];
  v63 = (void *)[v62 copyWithZone:a3];
  [v5 setGroupSessionToken:v63];

  v64 = [(MRDeviceInfo *)self leaderDeviceInfo];
  v65 = (void *)[v64 copyWithZone:a3];
  [v5 setLeaderDeviceInfo:v65];

  v66 = [(MRDeviceInfo *)self activeSystemEndpointUID];
  v67 = (void *)[v66 copyWithZone:a3];
  [v5 setActiveSystemEndpointUID:v67];

  return v5;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSString)airPlayGroupUID
{
  return self->_airPlayGroupUID;
}

- (BOOL)isAirPlayActive
{
  return self->_airPlayActive;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return self->_groupContainsDiscoverableGroupLeader;
}

- (BOOL)isGroupLeader
{
  return self->_groupLeader;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (NSString)senderDefaultGroupUID
{
  return self->_senderDefaultGroupUID;
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (MRDeviceInfo)leaderDeviceInfo
{
  return self->_leaderDeviceInfo;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (NSString)systemPodcastApplication
{
  return self->_systemPodcastApplication;
}

- (NSString)systemMediaApplication
{
  return self->_systemMediaApplication;
}

- (NSString)tightSyncUID
{
  return self->_tightSyncUID;
}

- (NSString)systemBooksApplication
{
  return self->_systemBooksApplication;
}

- (BOOL)supportsSystemPairing
{
  return self->_supportsSystemPairing;
}

- (BOOL)supportsSharedQueue
{
  return self->_supportsSharedQueue;
}

- (BOOL)supportsOutputContextSync
{
  return self->_supportsOutputContextSync;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (BOOL)supportsExtendedMotion
{
  return self->_supportsExtendedMotion;
}

- (BOOL)supportsACL
{
  return self->_supportsACL;
}

- (unint64_t)sharedQueueVersion
{
  return self->_sharedQueueVersion;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)managedConfigurationDeviceIdentifier
{
  return self->_managedConfigurationDeviceIdentifier;
}

- (NSString)localizedModelName
{
  return self->_localizedModelName;
}

- (NSString)linkAgent
{
  return self->_linkAgent;
}

- (unint64_t)lastSupportedProtocolMessageType
{
  return self->_lastSupportedProtocolMessageType;
}

- (BOOL)isTightSyncGroup
{
  return self->_tightSyncGroup;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_proxyGroupPlayer;
}

- (BOOL)isPairingAllowed
{
  return self->_pairingAllowed;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)isClusterLeader
{
  return self->_clusterLeader;
}

- (BOOL)isClusterAware
{
  return self->_clusterAware;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasTightSyncGroup
{
  return self->_hasTightSyncGroup;
}

- (BOOL)hasSupportsSystemPairing
{
  return self->_hasSupportsSystemPairing;
}

- (BOOL)hasSupportsSharedQueue
{
  return self->_hasSupportsSharedQueue;
}

- (BOOL)hasSupportsMultiplayer
{
  return self->_hasSupportsMultiplayer;
}

- (BOOL)hasSupportsExtendedMotion
{
  return self->_hasSupportsExtendedMotion;
}

- (BOOL)hasSupportsACL
{
  return self->_hasSupportsACL;
}

- (BOOL)hasSharedQueueVersion
{
  return self->_hasSharedQueueVersion;
}

- (BOOL)hasProxyGroupPlayer
{
  return self->_hasProxyGroupPlayer;
}

- (BOOL)hasProtocolVersion
{
  return self->_hasProtocolVersion;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return self->_hasParentGroupContainsDiscoverableGroupLeader;
}

- (BOOL)hasPairingAllowed
{
  return self->_hasPairingAllowed;
}

- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (BOOL)hasGroupLogicalDeviceCount
{
  return self->_hasGroupLogicalDeviceCount;
}

- (BOOL)hasGroupLeader
{
  return self->_hasGroupLeader;
}

- (BOOL)hasGroupContainsDiscoverableGroupLeader
{
  return self->_hasGroupContainsDiscoverableGroupLeader;
}

- (BOOL)hasDeviceClass
{
  return self->_hasDeviceClass;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (BOOL)hasAirPlayActive
{
  return self->_hasAirPlayActive;
}

- (NSArray)groupedDevices
{
  return self->_groupedDevices;
}

- (MRGroupSessionToken)groupSessionToken
{
  return self->_groupSessionToken;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (unint64_t)groupLogicalDeviceCount
{
  return self->_groupLogicalDeviceCount;
}

- (unint64_t)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (NSString)computerName
{
  return self->_computerName;
}

- (NSArray)clusteredDevices
{
  return self->_clusteredDevices;
}

- (unsigned)clusterType
{
  return self->_clusterType;
}

- (NSString)clusterLeaderID
{
  return self->_clusterLeaderID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSArray)allClusteredDevices
{
  return self->_allClusteredDevices;
}

- (NSArray)airPlayReceivers
{
  return self->_airPlayReceivers;
}

- (NSString)activeSystemEndpointUID
{
  return self->_activeSystemEndpointUID;
}

- (void)setTightSyncUID:(id)a3
{
}

- (void)setTightSyncGroup:(BOOL)a3
{
  self->_tightSyncGroup = a3;
  self->_hasTightSyncGroup = 1;
}

- (void)setSystemPodcastApplication:(id)a3
{
}

- (void)setSystemMediaApplication:(id)a3
{
}

- (void)setSystemBooksApplication:(id)a3
{
}

- (void)setSupportsSystemPairing:(BOOL)a3
{
  self->_supportsSystemPairing = a3;
  self->_hasSupportsSystemPairing = 1;
}

- (void)setSupportsSharedQueue:(BOOL)a3
{
  self->_supportsSharedQueue = a3;
  self->_hasSupportsSharedQueue = 1;
}

- (void)setSupportsOutputContextSync:(BOOL)a3
{
  self->_supportsOutputContextSync = a3;
  self->_hasSupportsOutputContextSync = 1;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  self->_supportsMultiplayer = a3;
  self->_hasSupportsMultiplayer = 1;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  self->_supportsExtendedMotion = a3;
  self->_hasSupportsExtendedMotion = 1;
}

- (void)setSupportsACL:(BOOL)a3
{
  self->_supportsACL = a3;
  self->_hasSupportsACL = 1;
}

- (void)setSharedQueueVersion:(unint64_t)a3
{
  self->_sharedQueueVersion = a3;
  self->_hasSharedQueueVersion = 1;
}

- (void)setSenderDefaultGroupUID:(id)a3
{
}

- (void)setRoutingContextID:(id)a3
{
}

- (void)setProxyGroupPlayer:(BOOL)a3
{
  self->_proxyGroupPlayer = a3;
  self->_hasProxyGroupPlayer = 1;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
  self->_hasProtocolVersion = 1;
}

- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_parentGroupContainsDiscoverableGroupLeader = a3;
  self->_hasParentGroupContainsDiscoverableGroupLeader = 1;
}

- (void)setPairingAllowed:(BOOL)a3
{
  self->_pairingAllowed = a3;
  self->_hasPairingAllowed = 1;
}

- (void)setName:(id)a3
{
}

- (void)setModelID:(id)a3
{
}

- (void)setManagedConfigurationDeviceIdentifier:(id)a3
{
}

- (void)setLocalizedModelName:(id)a3
{
}

- (void)setLocalReceiverPairingIdentity:(id)a3
{
}

- (void)setLinkAgent:(id)a3
{
}

- (void)setLeaderDeviceInfo:(id)a3
{
}

- (void)setLastSupportedProtocolMessageType:(unint64_t)a3
{
  self->_lastSupportedProtocolMessageType = a3;
  self->_hasLastSupportedProtocolMessageType = 1;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
  self->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements = 1;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setHasTightSyncGroup:(BOOL)a3
{
  self->_hasTightSyncGroup = a3;
}

- (void)setHasSupportsSystemPairing:(BOOL)a3
{
  self->_hasSupportsSystemPairing = a3;
}

- (void)setHasSupportsSharedQueue:(BOOL)a3
{
  self->_hasSupportsSharedQueue = a3;
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  self->_hasSupportsMultiplayer = a3;
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  self->_hasSupportsExtendedMotion = a3;
}

- (void)setHasSupportsACL:(BOOL)a3
{
  self->_hasSupportsACL = a3;
}

- (void)setHasSharedQueueVersion:(BOOL)a3
{
  self->_hasSharedQueueVersion = a3;
}

- (void)setHasProxyGroupPlayer:(BOOL)a3
{
  self->_hasProxyGroupPlayer = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  self->_hasProtocolVersion = a3;
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasParentGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setHasPairingAllowed:(BOOL)a3
{
  self->_hasPairingAllowed = a3;
}

- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (void)setHasGroupedDeviceCount:(BOOL)a3
{
  self->_hasGroupedDeviceCount = a3;
}

- (void)setHasGroupLogicalDeviceCount:(BOOL)a3
{
  self->_hasGroupLogicalDeviceCount = a3;
}

- (void)setHasGroupLeader:(BOOL)a3
{
  self->_hasGroupLeader = a3;
}

- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  self->_hasDeviceClass = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (void)setHasAirPlayActive:(BOOL)a3
{
  self->_hasAirPlayActive = a3;
}

- (void)setGroupedDevices:(id)a3
{
}

- (void)setGroupedDeviceCount:(unint64_t)a3
{
  self->_groupedDeviceCount = a3;
  self->_hasGroupedDeviceCount = 1;
}

- (void)setGroupUID:(id)a3
{
}

- (void)setGroupSessionToken:(id)a3
{
}

- (void)setGroupName:(id)a3
{
}

- (void)setGroupLogicalDeviceCount:(unint64_t)a3
{
  self->_groupLogicalDeviceCount = a3;
  self->_hasGroupLogicalDeviceCount = 1;
}

- (void)setGroupLeader:(BOOL)a3
{
  self->_groupLeader = a3;
  self->_hasGroupLeader = 1;
}

- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_groupContainsDiscoverableGroupLeader = a3;
  self->_hasGroupContainsDiscoverableGroupLeader = 1;
}

- (void)setDeviceUID:(id)a3
{
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_deviceClass = a3;
  self->_hasDeviceClass = 1;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
  self->_hasConnected = 1;
}

- (void)setConfiguredClusterSize:(unint64_t)a3
{
  self->_configuredClusterSize = a3;
  self->_hasConfiguredClusterSize = 1;
}

- (void)setComputerName:(id)a3
{
}

- (void)setClusteredDevices:(id)a3
{
}

- (void)setClusterType:(unsigned int)a3
{
  self->_clusterType = a3;
  self->_hasClusterType = 1;
}

- (void)setClusterLeaderID:(id)a3
{
}

- (void)setClusterLeader:(BOOL)a3
{
  self->_clusterLeader = a3;
  self->_hasIsClusterLeader = 1;
}

- (void)setClusterID:(id)a3
{
}

- (void)setClusterAware:(BOOL)a3
{
  self->_clusterAware = a3;
  self->_hasIsClusterAware = 1;
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBuildVersion:(id)a3
{
}

- (void)setBluetoothAddress:(id)a3
{
}

- (void)setAllClusteredDevices:(id)a3
{
}

- (void)setAirPlayReceivers:(id)a3
{
}

- (void)setAirPlayGroupUID:(id)a3
{
}

- (void)setAirPlayActive:(BOOL)a3
{
  self->_airPlayActive = a3;
  self->_hasAirPlayActive = 1;
}

- (void)setActiveSystemEndpointUID:(id)a3
{
}

- (NSString)localReceiverPairingIdentity
{
  return self->_localReceiverPairingIdentity;
}

- (BOOL)hasGroupedDeviceCount
{
  return self->_hasGroupedDeviceCount;
}

- (unint64_t)groupedDeviceCount
{
  return self->_groupedDeviceCount;
}

- (BOOL)supportsTwoHop
{
  return [(MRDeviceInfo *)self deviceClass] == 4;
}

- (NSData)data
{
  v2 = [(MRDeviceInfo *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRDeviceInfoMessageProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
  [(_MRDeviceInfoMessageProtobuf *)v3 setProtocolVersion:[(MRDeviceInfo *)self protocolVersion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasProtocolVersion:[(MRDeviceInfo *)self hasProtocolVersion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setDeviceClass:_MRDeviceInfoMessageProtobuf_DeviceClassFromModel([(MRDeviceInfo *)self deviceClass])];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasDeviceClass:[(MRDeviceInfo *)self hasDeviceClass]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setTightlySyncedGroup:[(MRDeviceInfo *)self isTightSyncGroup]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasTightlySyncedGroup:[(MRDeviceInfo *)self hasTightSyncGroup]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setAllowsPairing:[(MRDeviceInfo *)self isPairingAllowed]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasAllowsPairing:[(MRDeviceInfo *)self hasPairingAllowed]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsSystemPairing:[(MRDeviceInfo *)self supportsSystemPairing]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsSystemPairing:[(MRDeviceInfo *)self hasSupportsSystemPairing]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsACL:[(MRDeviceInfo *)self supportsACL]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsACL:[(MRDeviceInfo *)self hasSupportsACL]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsSharedQueue:[(MRDeviceInfo *)self supportsSharedQueue]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsSharedQueue:[(MRDeviceInfo *)self hasSupportsSharedQueue]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSharedQueueVersion:[(MRDeviceInfo *)self sharedQueueVersion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSharedQueueVersion:[(MRDeviceInfo *)self hasSharedQueueVersion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsProxyGroupPlayer:[(MRDeviceInfo *)self isProxyGroupPlayer]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsProxyGroupPlayer:[(MRDeviceInfo *)self hasProxyGroupPlayer]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setConnected:[(MRDeviceInfo *)self isConnected]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasConnected:[(MRDeviceInfo *)self hasConnected]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsExtendedMotion:[(MRDeviceInfo *)self supportsExtendedMotion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsExtendedMotion:[(MRDeviceInfo *)self hasSupportsExtendedMotion]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setLogicalDeviceCount:[(MRDeviceInfo *)self groupLogicalDeviceCount]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasLogicalDeviceCount:[(MRDeviceInfo *)self hasGroupLogicalDeviceCount]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsGroupLeader:[(MRDeviceInfo *)self isGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsGroupLeader:[(MRDeviceInfo *)self hasGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsAirplayActive:[(MRDeviceInfo *)self isAirPlayActive]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsAirplayActive:[(MRDeviceInfo *)self hasAirPlayActive]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsMultiplayer:[(MRDeviceInfo *)self supportsMultiplayer]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsMultiplayer:[(MRDeviceInfo *)self hasSupportsMultiplayer]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setParentGroupContainsDiscoverableGroupLeader:[(MRDeviceInfo *)self parentGroupContainsDiscoverableGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasParentGroupContainsDiscoverableGroupLeader:[(MRDeviceInfo *)self hasParentGroupContainsDiscoverableGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setGroupContainsDiscoverableGroupLeader:[(MRDeviceInfo *)self groupContainsDiscoverableGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasGroupContainsDiscoverableGroupLeader:[(MRDeviceInfo *)self hasGroupContainsDiscoverableGroupLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setPreferredEncoding:[(MRDeviceInfo *)self preferredEncoding] == 1];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasPreferredEncoding:[(MRDeviceInfo *)self hasPreferredEncoding]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsEligibleForHostingGroupSessionExcludingAcknowledgements:[(MRDeviceInfo *)self isEligibleForHostingGroupSessionExcludingAcknowledgements]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:[(MRDeviceInfo *)self hasIsEligibleForHostingGroupSessionExcludingAcknowledgements]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setClusterType:[(MRDeviceInfo *)self clusterType]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasClusterType:[(MRDeviceInfo *)self hasClusterType]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsClusterAware:[(MRDeviceInfo *)self isClusterAware]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsClusterAware:[(MRDeviceInfo *)self hasIsClusterAware]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setConfiguredClusterSize:[(MRDeviceInfo *)self configuredClusterSize]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasConfiguredClusterSize:[(MRDeviceInfo *)self hasConfiguredClusterSize]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setIsClusterLeader:[(MRDeviceInfo *)self isClusterLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasIsClusterLeader:[(MRDeviceInfo *)self isClusterLeader]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setLastKnownClusterType:[(MRDeviceInfo *)self lastSupportedClusterType]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasLastKnownClusterType:[(MRDeviceInfo *)self hasLastSupportedClusterType]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSupportsOutputContextSync:[(MRDeviceInfo *)self supportsOutputContextSync]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasSupportsOutputContextSync:[(MRDeviceInfo *)self hasSupportsOutputContextSync]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setLastSupportedMessageType:[(MRDeviceInfo *)self lastSupportedProtocolMessageType]];
  [(_MRDeviceInfoMessageProtobuf *)v3 setHasLastSupportedMessageType:[(MRDeviceInfo *)self hasLastSupportedProtocolMessageType]];
  v4 = [(MRDeviceInfo *)self name];
  v5 = (void *)[v4 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setName:v5];

  v6 = [(MRDeviceInfo *)self identifier];
  v7 = (void *)[v6 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setUniqueIdentifier:v7];

  v8 = [(MRDeviceInfo *)self localizedModelName];
  v9 = (void *)[v8 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setLocalizedModelName:v9];

  v10 = [(MRDeviceInfo *)self buildVersion];
  v11 = (void *)[v10 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSystemBuildVersion:v11];

  v12 = [(MRDeviceInfo *)self bundleIdentifier];
  v13 = (void *)[v12 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setApplicationBundleIdentifier:v13];

  v14 = [(MRDeviceInfo *)self bundleVersion];
  v15 = (void *)[v14 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setApplicationBundleVersion:v15];

  v16 = [(MRDeviceInfo *)self systemMediaApplication];
  v17 = (void *)[v16 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSystemMediaApplication:v17];

  v18 = [(MRDeviceInfo *)self systemPodcastApplication];
  v19 = (void *)[v18 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSystemPodcastApplication:v19];

  v20 = [(MRDeviceInfo *)self systemBooksApplication];
  v21 = (void *)[v20 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSystemBooksApplication:v21];

  v22 = [(MRDeviceInfo *)self deviceUID];
  v23 = (void *)[v22 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setDeviceUID:v23];

  v24 = [(MRDeviceInfo *)self managedConfigurationDeviceIdentifier];
  v25 = (void *)[v24 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setManagedConfigDeviceID:v25];

  v26 = [(MRDeviceInfo *)self tightSyncUID];
  v27 = (void *)[v26 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setTightSyncUID:v27];

  v28 = [(MRDeviceInfo *)self groupUID];
  v29 = (void *)[v28 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setGroupUID:v29];

  v30 = [(MRDeviceInfo *)self airPlayGroupUID];
  [(_MRDeviceInfoMessageProtobuf *)v3 setAirPlayGroupID:v30];

  v31 = [(MRDeviceInfo *)self groupName];
  v32 = (void *)[v31 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setGroupName:v32];

  v33 = [(MRDeviceInfo *)self senderDefaultGroupUID];
  v34 = (void *)[v33 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setSenderDefaultGroupUID:v34];

  v35 = [(MRDeviceInfo *)self bluetoothAddress];
  v36 = (void *)[v35 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setBluetoothAddress:v36];

  v37 = [(MRDeviceInfo *)self airPlayReceivers];
  v38 = (void *)[v37 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setAirplayReceivers:v38];

  v39 = [(MRDeviceInfo *)self linkAgent];
  v40 = (void *)[v39 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setLinkAgent:v40];

  v41 = [(MRDeviceInfo *)self clusterID];
  v42 = (void *)[v41 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setClusterID:v42];

  v43 = [(MRDeviceInfo *)self clusterLeaderID];
  v44 = (void *)[v43 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setClusterLeaderID:v44];

  v45 = [(MRDeviceInfo *)self computerName];
  v46 = (void *)[v45 copy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setComputerName:v46];

  v47 = [(MRDeviceInfo *)self modelID];
  [(_MRDeviceInfoMessageProtobuf *)v3 setModelID:v47];

  v48 = [(MRDeviceInfo *)self routingContextID];
  [(_MRDeviceInfoMessageProtobuf *)v3 setRoutingContextID:v48];

  v49 = [(MRDeviceInfo *)self activeSystemEndpointUID];
  [(_MRDeviceInfoMessageProtobuf *)v3 setActiveSystemEndpointUID:v49];

  v50 = [(MRDeviceInfo *)self groupSessionToken];

  if (v50)
  {
    v51 = [(MRDeviceInfo *)self groupSessionToken];
    v52 = [v51 protobuf];
    [(_MRDeviceInfoMessageProtobuf *)v3 setGroupSessionToken:v52];
  }
  v53 = [(MRDeviceInfo *)self leaderDeviceInfo];

  if (v53)
  {
    v54 = [(MRDeviceInfo *)self leaderDeviceInfo];
    v55 = [v54 protobuf];
    [(_MRDeviceInfoMessageProtobuf *)v3 setLeaderDeviceInfo:v55];
  }
  v56 = [(MRDeviceInfo *)self groupedDevices];
  v57 = objc_msgSend(v56, "mr_map:", &__block_literal_global_23_1);
  v58 = (void *)[v57 mutableCopy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setGroupedDevices:v58];

  v59 = [(MRDeviceInfo *)self clusteredDevices];
  v60 = objc_msgSend(v59, "mr_map:", &__block_literal_global_25_0);
  v61 = (void *)[v60 mutableCopy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setClusteredDevices:v61];

  v62 = [(MRDeviceInfo *)self allClusteredDevices];
  v63 = objc_msgSend(v62, "mr_map:", &__block_literal_global_27);
  v64 = (void *)[v63 mutableCopy];
  [(_MRDeviceInfoMessageProtobuf *)v3 setAllClusteredDevices:v64];

  return v3;
}

- (MRDeviceInfo)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [[_MRDeviceInfoMessageProtobuf alloc] initWithData:v4];
    v6 = [(MRDeviceInfo *)self initWithProtobuf:v5];
  }
  else
  {
    v6 = [(MRDeviceInfo *)self initWithProtobuf:0];
  }

  return v6;
}

- (MRDeviceInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v99.receiver = self;
    v99.super_class = (Class)MRDeviceInfo;
    v5 = [(MRDeviceInfo *)&v99 init];
    if (v5)
    {
      v5->_protocolVersion = [v4 protocolVersion];
      v5->_hasProtocolVersion = [v4 hasProtocolVersion];
      v5->_deviceClass = MRDeviceClassFromProtobuf([v4 deviceClass]);
      v5->_hasDeviceClass = [v4 hasDeviceClass];
      v5->_groupedDeviceCount = [v4 groupedDevicesCount];
      v5->_tightSyncGroup = [v4 tightlySyncedGroup];
      v5->_hasTightSyncGroup = [v4 hasTightlySyncedGroup];
      v5->_pairingAllowed = [v4 allowsPairing];
      v5->_hasPairingAllowed = [v4 hasAllowsPairing];
      v5->_supportsSystemPairing = [v4 supportsSystemPairing];
      v5->_hasSupportsSystemPairing = [v4 hasSupportsSystemPairing];
      v5->_supportsACL = [v4 supportsACL];
      v5->_hasSupportsACL = [v4 hasSupportsACL];
      v5->_supportsSharedQueue = [v4 supportsSharedQueue];
      v5->_hasSupportsSharedQueue = [v4 hasSupportsSharedQueue];
      v5->_sharedQueueVersion = [v4 sharedQueueVersion];
      v5->_hasSharedQueueVersion = [v4 hasSharedQueueVersion];
      v5->_proxyGroupPlayer = [v4 isProxyGroupPlayer];
      v5->_hasProxyGroupPlayer = [v4 hasIsProxyGroupPlayer];
      v5->_connected = [v4 connected];
      v5->_hasConnected = [v4 hasConnected];
      v5->_supportsExtendedMotion = [v4 supportsExtendedMotion];
      v5->_hasSupportsExtendedMotion = [v4 hasSupportsExtendedMotion];
      v5->_groupLogicalDeviceCount = [v4 logicalDeviceCount];
      v5->_hasGroupLogicalDeviceCount = [v4 hasLogicalDeviceCount];
      v5->_groupLeader = [v4 isGroupLeader];
      v5->_hasGroupLeader = [v4 hasIsGroupLeader];
      v5->_airPlayActive = [v4 isAirplayActive];
      v5->_hasAirPlayActive = [v4 hasIsAirplayActive];
      v5->_supportsMultiplayer = [v4 supportsMultiplayer];
      v5->_hasSupportsMultiplayer = [v4 hasSupportsMultiplayer];
      v5->_parentGroupContainsDiscoverableGroupLeader = [v4 parentGroupContainsDiscoverableGroupLeader];
      v5->_hasParentGroupContainsDiscoverableGroupLeader = [v4 hasParentGroupContainsDiscoverableGroupLeader];
      v5->_groupContainsDiscoverableGroupLeader = [v4 groupContainsDiscoverableGroupLeader];
      v5->_hasGroupContainsDiscoverableGroupLeader = [v4 hasGroupContainsDiscoverableGroupLeader];
      v5->_preferredEncoding = [v4 preferredEncoding] == 1;
      v5->_hasPreferredEncoding = [v4 hasPreferredEncoding];
      v5->_isEligibleForHostingGroupSessionExcludingAcknowledgements = [v4 isEligibleForHostingGroupSessionExcludingAcknowledgements];
      v5->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements = [v4 hasIsEligibleForHostingGroupSessionExcludingAcknowledgements];
      v5->_clusterType = [v4 clusterType];
      v5->_hasClusterType = [v4 hasClusterType];
      v5->_clusterAware = [v4 isClusterAware];
      v5->_hasIsClusterAware = [v4 hasIsClusterAware];
      v5->_configuredClusterSize = [v4 configuredClusterSize];
      v5->_hasConfiguredClusterSize = [v4 hasConfiguredClusterSize];
      v5->_clusterLeader = [v4 isClusterLeader];
      v5->_hasIsClusterLeader = [v4 hasIsClusterLeader];
      v5->_lastSupportedClusterType = [v4 lastKnownClusterType];
      v5->_hasLastSupportedClusterType = [v4 hasLastKnownClusterType];
      v5->_supportsOutputContextSync = [v4 supportsOutputContextSync];
      v5->_hasSupportsOutputContextSync = [v4 hasSupportsOutputContextSync];
      v5->_lastSupportedProtocolMessageType = [v4 lastSupportedMessageType];
      v5->_hasLastSupportedProtocolMessageType = [v4 hasLastSupportedMessageType];
      v6 = [v4 name];
      uint64_t v7 = [v6 copy];
      name = v5->_name;
      v5->_name = (NSString *)v7;

      v9 = [v4 uniqueIdentifier];
      uint64_t v10 = [v9 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      v12 = [v4 localizedModelName];
      uint64_t v13 = [v12 copy];
      localizedModelName = v5->_localizedModelName;
      v5->_localizedModelName = (NSString *)v13;

      v15 = [v4 systemBuildVersion];
      uint64_t v16 = [v15 copy];
      buildVersion = v5->_buildVersion;
      v5->_buildVersion = (NSString *)v16;

      v18 = [v4 applicationBundleIdentifier];
      uint64_t v19 = [v18 copy];
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v19;

      v21 = [v4 applicationBundleVersion];
      uint64_t v22 = [v21 copy];
      bundleVersion = v5->_bundleVersion;
      v5->_bundleVersion = (NSString *)v22;

      v24 = [v4 systemMediaApplication];
      uint64_t v25 = [v24 copy];
      systemMediaApplication = v5->_systemMediaApplication;
      v5->_systemMediaApplication = (NSString *)v25;

      v27 = [v4 systemPodcastApplication];
      uint64_t v28 = [v27 copy];
      systemPodcastApplication = v5->_systemPodcastApplication;
      v5->_systemPodcastApplication = (NSString *)v28;

      v30 = [v4 systemBooksApplication];
      uint64_t v31 = [v30 copy];
      systemBooksApplication = v5->_systemBooksApplication;
      v5->_systemBooksApplication = (NSString *)v31;

      v33 = [v4 deviceUID];
      uint64_t v34 = [v33 copy];
      deviceUID = v5->_deviceUID;
      v5->_deviceUID = (NSString *)v34;

      v36 = [v4 managedConfigDeviceID];
      uint64_t v37 = [v36 copy];
      managedConfigurationDeviceIdentifier = v5->_managedConfigurationDeviceIdentifier;
      v5->_managedConfigurationDeviceIdentifier = (NSString *)v37;

      v39 = [v4 tightSyncUID];
      uint64_t v40 = [v39 copy];
      tightSyncUID = v5->_tightSyncUID;
      v5->_tightSyncUID = (NSString *)v40;

      v42 = [v4 groupUID];
      uint64_t v43 = [v42 copy];
      groupUID = v5->_groupUID;
      v5->_groupUID = (NSString *)v43;

      v45 = [v4 airPlayGroupID];
      uint64_t v46 = [v45 copy];
      airPlayGroupUID = v5->_airPlayGroupUID;
      v5->_airPlayGroupUID = (NSString *)v46;

      v48 = [v4 groupName];
      uint64_t v49 = [v48 copy];
      groupName = v5->_groupName;
      v5->_groupName = (NSString *)v49;

      v51 = [v4 senderDefaultGroupUID];
      uint64_t v52 = [v51 copy];
      senderDefaultGroupUID = v5->_senderDefaultGroupUID;
      v5->_senderDefaultGroupUID = (NSString *)v52;

      v54 = [v4 bluetoothAddress];
      uint64_t v55 = [v54 copy];
      bluetoothAddress = v5->_bluetoothAddress;
      v5->_bluetoothAddress = (NSData *)v55;

      v57 = [v4 airplayReceivers];
      uint64_t v58 = [v57 copy];
      airPlayReceivers = v5->_airPlayReceivers;
      v5->_airPlayReceivers = (NSArray *)v58;

      v60 = [v4 linkAgent];
      uint64_t v61 = [v60 copy];
      linkAgent = v5->_linkAgent;
      v5->_linkAgent = (NSString *)v61;

      v63 = [v4 clusterID];
      uint64_t v64 = [v63 copy];
      clusterID = v5->_clusterID;
      v5->_clusterID = (NSString *)v64;

      v66 = [v4 clusterLeaderID];
      uint64_t v67 = [v66 copy];
      clusterLeaderID = v5->_clusterLeaderID;
      v5->_clusterLeaderID = (NSString *)v67;

      v69 = [v4 modelID];
      uint64_t v70 = [v69 copy];
      modelID = v5->_modelID;
      v5->_modelID = (NSString *)v70;

      v72 = [v4 routingContextID];
      uint64_t v73 = [v72 copy];
      routingContextID = v5->_routingContextID;
      v5->_routingContextID = (NSString *)v73;

      v75 = [v4 computerName];
      uint64_t v76 = [v75 copy];
      computerName = v5->_computerName;
      v5->_computerName = (NSString *)v76;

      uint64_t v78 = [v4 activeSystemEndpointUID];
      activeSystemEndpointUID = v5->_activeSystemEndpointUID;
      v5->_activeSystemEndpointUID = (NSString *)v78;

      v80 = [v4 groupSessionToken];
      if (v80)
      {
        v81 = [[MRGroupSessionToken alloc] initWithProtobuf:v80];
        groupSessionToken = v5->_groupSessionToken;
        v5->_groupSessionToken = v81;
      }
      v83 = [v4 leaderDeviceInfo];

      if (v83)
      {
        v84 = [MRDeviceInfo alloc];
        v85 = [v4 leaderDeviceInfo];
        uint64_t v86 = [(MRDeviceInfo *)v84 initWithProtobuf:v85];
        leaderDeviceInfo = v5->_leaderDeviceInfo;
        v5->_leaderDeviceInfo = (MRDeviceInfo *)v86;
      }
      v88 = [v4 groupedDevices];
      uint64_t v89 = objc_msgSend(v88, "mr_map:", &__block_literal_global_6_0);
      groupedDevices = v5->_groupedDevices;
      v5->_groupedDevices = (NSArray *)v89;

      v91 = [v4 clusteredDevices];
      uint64_t v92 = objc_msgSend(v91, "mr_map:", &__block_literal_global_8_2);
      clusteredDevices = v5->_clusteredDevices;
      v5->_clusteredDevices = (NSArray *)v92;

      v94 = [v4 allClusteredDevices];
      uint64_t v95 = objc_msgSend(v94, "mr_map:", &__block_literal_global_10_1);
      allClusteredDevices = v5->_allClusteredDevices;
      v5->_allClusteredDevices = (NSArray *)v95;
    }
    self = v5;
    v97 = self;
  }
  else
  {
    v97 = 0;
  }

  return v97;
}

- (int64_t)preferredEncoding
{
  return self->_preferredEncoding;
}

- (BOOL)hasPreferredEncoding
{
  return self->_hasPreferredEncoding;
}

- (BOOL)effectiveParentGroupContainsDiscoverableGroupLeader
{
  v3 = [(MRDeviceInfo *)self leaderDeviceInfo];
  if (v3)
  {
    id v4 = [(MRDeviceInfo *)self leaderDeviceInfo];
    char v5 = [v4 parentGroupContainsDiscoverableGroupLeader];
  }
  else
  {
    char v5 = [(MRDeviceInfo *)self parentGroupContainsDiscoverableGroupLeader];
  }

  return v5;
}

- (MRDeviceInfo)initWithOutputDevice:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MRDeviceInfo;
  char v5 = [(MRDeviceInfo *)&v22 init];
  if (v5)
  {
    v6 = [v4 name];
    [(MRDeviceInfo *)v5 setName:v6];

    uint64_t v7 = [v4 primaryID];
    [(MRDeviceInfo *)v5 setDeviceUID:v7];

    v8 = [v4 modelID];
    [(MRDeviceInfo *)v5 setLocalizedModelName:v8];

    v9 = [v4 logicalDeviceID];
    [(MRDeviceInfo *)v5 setTightSyncUID:v9];

    uint64_t v10 = [v4 groupID];
    [(MRDeviceInfo *)v5 setGroupUID:v10];

    v11 = [v4 airPlayGroupID];
    [(MRDeviceInfo *)v5 setAirPlayGroupUID:v11];

    v12 = [v4 modelID];
    [(MRDeviceInfo *)v5 setModelID:v12];

    if ([v4 clusterType])
    {
      -[MRDeviceInfo setClusterType:](v5, "setClusterType:", [v4 clusterType]);
      uint64_t v13 = [v4 uid];
      [(MRDeviceInfo *)v5 setClusterID:v13];

      -[MRDeviceInfo setConfiguredClusterSize:](v5, "setConfiguredClusterSize:", [v4 configuredClusterSize]);
    }
    if ([v4 groupContainsGroupLeader]) {
      [(MRDeviceInfo *)v5 setGroupContainsDiscoverableGroupLeader:1];
    }
    if ([v4 parentGroupContainsDiscoverableLeader]) {
      [(MRDeviceInfo *)v5 setParentGroupContainsDiscoverableGroupLeader:1];
    }
    int v14 = [v4 deviceSubtype];
    uint64_t v15 = 7;
    if (v14 != 12) {
      uint64_t v15 = -1;
    }
    if (v14 == 13) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v15;
    }
    [(MRDeviceInfo *)v5 setDeviceClass:v16];
    v17 = [v4 clusterCompositionOutputDevices];
    v18 = objc_msgSend(v17, "msv_map:", &__block_literal_global_34);
    [(MRDeviceInfo *)v5 setClusteredDevices:v18];

    uint64_t v19 = [v4 allClusterMembersOutputDevices];
    v20 = objc_msgSend(v19, "msv_map:", &__block_literal_global_2);
    [(MRDeviceInfo *)v5 setAllClusteredDevices:v20];
  }
  return v5;
}

MRDeviceInfo *__37__MRDeviceInfo_initWithOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithOutputDevice:v2];

  return v3;
}

MRDeviceInfo *__37__MRDeviceInfo_initWithOutputDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithOutputDevice:v2];

  return v3;
}

- (MRDeviceInfo)initWithOutputDeviceDescription:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRDeviceInfo;
  char v5 = [(MRDeviceInfo *)&v13 init];
  if (v5)
  {
    v6 = [v4 name];
    [(MRDeviceInfo *)v5 setName:v6];

    uint64_t v7 = [v4 uid];
    [(MRDeviceInfo *)v5 setDeviceUID:v7];

    v8 = [v4 modelID];
    [(MRDeviceInfo *)v5 setModelID:v8];

    int v9 = [v4 deviceSubtype];
    uint64_t v10 = 7;
    if (v9 != 12) {
      uint64_t v10 = -1;
    }
    if (v9 == 13) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = v10;
    }
    [(MRDeviceInfo *)v5 setDeviceClass:v11];
  }

  return v5;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithProtobuf:v2];

  return v3;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithProtobuf:v2];

  return v3;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithProtobuf:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDeviceInfo *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (MRDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [MRDeviceInfo alloc];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  uint64_t v7 = [(MRDeviceInfo *)v5 initWithProtobuf:v6];
  return v7;
}

+ (id)deviceInfosFromData:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
    uint64_t v7 = MSVUnarchivedObjectOfClasses();

    v8 = objc_msgSend(v7, "mr_map:", &__block_literal_global_18);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

MRDeviceInfo *__36__MRDeviceInfo_deviceInfosFromData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRDeviceInfo alloc] initWithData:v2];

  return v3;
}

+ (id)dataFromDeviceInfos:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(a3, "mr_map:", &__block_literal_global_21);
    id v4 = MSVArchivedDataWithRootObject();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __36__MRDeviceInfo_dataFromDeviceInfos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 data];
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MRDeviceInfo *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  uint64_t v5 = [(MRDeviceInfo *)self identifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  v6 = [(MRDeviceInfo *)self localizedModelName];
  [v3 setObject:v6 forKeyedSubscript:@"localizedModelName"];

  uint64_t v7 = [(MRDeviceInfo *)self buildVersion];
  [v3 setObject:v7 forKeyedSubscript:@"buildVersion"];

  v8 = [(MRDeviceInfo *)self bundleIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"bundleIdentifier"];

  int v9 = [(MRDeviceInfo *)self bundleVersion];
  [v3 setObject:v9 forKeyedSubscript:@"bundleVersion"];

  uint64_t v10 = [(MRDeviceInfo *)self systemMediaApplication];
  [v3 setObject:v10 forKeyedSubscript:@"systemMediaApplication"];

  uint64_t v11 = [(MRDeviceInfo *)self systemPodcastApplication];
  [v3 setObject:v11 forKeyedSubscript:@"systemPodcastApplication"];

  v12 = [(MRDeviceInfo *)self systemBooksApplication];
  [v3 setObject:v12 forKeyedSubscript:@"systemBooksApplication"];

  objc_super v13 = [(MRDeviceInfo *)self deviceUID];
  [v3 setObject:v13 forKeyedSubscript:@"deviceUID"];

  int v14 = [(MRDeviceInfo *)self localReceiverPairingIdentity];
  [v3 setObject:v14 forKeyedSubscript:@"localReceiverPairingIdentity"];

  uint64_t v15 = [(MRDeviceInfo *)self managedConfigurationDeviceIdentifier];
  [v3 setObject:v15 forKeyedSubscript:@"managedConfigurationDeviceIdentifier"];

  uint64_t v16 = [(MRDeviceInfo *)self tightSyncUID];
  [v3 setObject:v16 forKeyedSubscript:@"tightSyncUID"];

  v17 = [(MRDeviceInfo *)self groupUID];
  [v3 setObject:v17 forKeyedSubscript:@"groupUID"];

  v18 = [(MRDeviceInfo *)self airPlayGroupUID];
  [v3 setObject:v18 forKeyedSubscript:@"airPlayGroupUID"];

  uint64_t v19 = [(MRDeviceInfo *)self groupName];
  [v3 setObject:v19 forKeyedSubscript:@"groupName"];

  v20 = [(MRDeviceInfo *)self senderDefaultGroupUID];
  [v3 setObject:v20 forKeyedSubscript:@"senderDefaultGroupUID"];

  v21 = [(MRDeviceInfo *)self bluetoothAddress];
  [v3 setObject:v21 forKeyedSubscript:@"bluetoothAddress"];

  objc_super v22 = [(MRDeviceInfo *)self groupedDevices];
  [v3 setObject:v22 forKeyedSubscript:@"groupedDevices"];

  v23 = [(MRDeviceInfo *)self clusteredDevices];
  [v3 setObject:v23 forKeyedSubscript:@"clusteredDevices"];

  v24 = [(MRDeviceInfo *)self allClusteredDevices];
  [v3 setObject:v24 forKeyedSubscript:@"allClusteredDevices"];

  uint64_t v25 = [(MRDeviceInfo *)self airPlayReceivers];
  [v3 setObject:v25 forKeyedSubscript:@"airPlayReceivers"];

  v26 = [(MRDeviceInfo *)self linkAgent];
  [v3 setObject:v26 forKeyedSubscript:@"linkAgent"];

  v27 = [(MRDeviceInfo *)self clusterID];
  [v3 setObject:v27 forKeyedSubscript:@"clusterID"];

  uint64_t v28 = [(MRDeviceInfo *)self clusterLeaderID];
  [v3 setObject:v28 forKeyedSubscript:@"clusterLeaderID"];

  v29 = [(MRDeviceInfo *)self modelID];
  [v3 setObject:v29 forKeyedSubscript:@"modelID"];

  v30 = [(MRDeviceInfo *)self routingContextID];
  [v3 setObject:v30 forKeyedSubscript:@"routingContextID"];

  uint64_t v31 = [(MRDeviceInfo *)self parentGroupID];
  [v3 setObject:v31 forKeyedSubscript:@"parentGroupID"];

  v32 = [(MRDeviceInfo *)self computerName];
  [v3 setObject:v32 forKeyedSubscript:@"computerName"];

  if ([(MRDeviceInfo *)self hasDeviceClass])
  {
    v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRDeviceInfo deviceClass](self, "deviceClass"));
    [v3 setObject:v33 forKeyedSubscript:@"deviceClass"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"deviceClass"];
  }
  if ([(MRDeviceInfo *)self hasProtocolVersion])
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo protocolVersion](self, "protocolVersion"));
    [v3 setObject:v34 forKeyedSubscript:@"protocolVersion"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"protocolVersion"];
  }
  if ([(MRDeviceInfo *)self hasGroupedDeviceCount])
  {
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo groupedDeviceCount](self, "groupedDeviceCount"));
    [v3 setObject:v35 forKeyedSubscript:@"groupedDeviceCount"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"groupedDeviceCount"];
  }
  if ([(MRDeviceInfo *)self hasSharedQueueVersion])
  {
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"));
    [v3 setObject:v36 forKeyedSubscript:@"sharedQueueVersion"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"sharedQueueVersion"];
  }
  if ([(MRDeviceInfo *)self hasGroupLogicalDeviceCount])
  {
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"));
    [v3 setObject:v37 forKeyedSubscript:@"groupLogicalDeviceCount"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"groupLogicalDeviceCount"];
  }
  if ([(MRDeviceInfo *)self hasSupportsSystemPairing])
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"));
    [v3 setObject:v38 forKeyedSubscript:@"supportsSystemPairing"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsSystemPairing"];
  }
  if ([(MRDeviceInfo *)self hasSupportsACL])
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsACL](self, "supportsACL"));
    [v3 setObject:v39 forKeyedSubscript:@"supportsACL"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsACL"];
  }
  if ([(MRDeviceInfo *)self hasSupportsSharedQueue])
  {
    uint64_t v40 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"));
    [v3 setObject:v40 forKeyedSubscript:@"supportsSharedQueue"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsSharedQueue"];
  }
  if ([(MRDeviceInfo *)self hasSupportsExtendedMotion])
  {
    v41 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"));
    [v3 setObject:v41 forKeyedSubscript:@"supportsExtendedMotion"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsExtendedMotion"];
  }
  if ([(MRDeviceInfo *)self hasTightSyncGroup])
  {
    v42 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"));
    [v3 setObject:v42 forKeyedSubscript:@"tightSyncGroup"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"tightSyncGroup"];
  }
  if ([(MRDeviceInfo *)self hasPairingAllowed])
  {
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"));
    [v3 setObject:v43 forKeyedSubscript:@"pairingAllowed"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"pairingAllowed"];
  }
  if ([(MRDeviceInfo *)self hasProxyGroupPlayer])
  {
    v44 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"));
    [v3 setObject:v44 forKeyedSubscript:@"proxyGroupPlayer"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"proxyGroupPlayer"];
  }
  if ([(MRDeviceInfo *)self hasConnected])
  {
    v45 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isConnected](self, "isConnected"));
    [v3 setObject:v45 forKeyedSubscript:@"connected"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"connected"];
  }
  if ([(MRDeviceInfo *)self hasGroupLeader])
  {
    uint64_t v46 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"));
    [v3 setObject:v46 forKeyedSubscript:@"groupLeader"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"groupLeader"];
  }
  if ([(MRDeviceInfo *)self hasAirPlayActive])
  {
    v47 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"));
    [v3 setObject:v47 forKeyedSubscript:@"airPlayActive"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"airPlayActive"];
  }
  if ([(MRDeviceInfo *)self clusterType])
  {
    v48 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MRDeviceInfo clusterType](self, "clusterType"));
    [v3 setObject:v48 forKeyedSubscript:@"clusterType"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"clusterType"];
  }
  if ([(MRDeviceInfo *)self isClusterAware])
  {
    uint64_t v49 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isClusterAware](self, "isClusterAware"));
    [v3 setObject:v49 forKeyedSubscript:@"clusterAware"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"clusterAware"];
  }
  if ([(MRDeviceInfo *)self configuredClusterSize])
  {
    v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"));
    [v3 setObject:v50 forKeyedSubscript:@"configuredClusterSize"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"configuredClusterSize"];
  }
  if ([(MRDeviceInfo *)self isClusterLeader])
  {
    v51 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"));
    [v3 setObject:v51 forKeyedSubscript:@"clusterLeader"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"clusterLeader"];
  }
  if ([(MRDeviceInfo *)self hasSupportsMultiplayer])
  {
    uint64_t v52 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"));
    [v3 setObject:v52 forKeyedSubscript:@"supportsMultiplayer"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsMultiplayer"];
  }
  if ([(MRDeviceInfo *)self hasParentGroupContainsDiscoverableGroupLeader])
  {
    v53 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
    [v3 setObject:v53 forKeyedSubscript:@"parentGroupContainsGroupLeader"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"parentGroupContainsGroupLeader"];
  }
  if ([(MRDeviceInfo *)self hasGroupContainsDiscoverableGroupLeader])
  {
    v54 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"));
    [v3 setObject:v54 forKeyedSubscript:@"groupContainsGroupLeader"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"groupContainsGroupLeader"];
  }
  if ([(MRDeviceInfo *)self hasPreferredEncoding])
  {
    uint64_t v55 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRDeviceInfo preferredEncoding](self, "preferredEncoding"));
    [v3 setObject:v55 forKeyedSubscript:@"preferredEncoding"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"preferredEncoding"];
  }
  if ([(MRDeviceInfo *)self lastSupportedClusterType])
  {
    v56 = off_1E57D3208[[(MRDeviceInfo *)self lastSupportedClusterType]];
    v57 = v3;
  }
  else
  {
    v57 = v3;
    v56 = 0;
  }
  [v57 setObject:v56 forKeyedSubscript:@"lastSupportedClusterType"];
  if ([(MRDeviceInfo *)self supportsOutputContextSync])
  {
    uint64_t v58 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"));
    [v3 setObject:v58 forKeyedSubscript:@"supportsOutputContextSync"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"supportsOutputContextSync"];
  }
  if ([(MRDeviceInfo *)self lastSupportedProtocolMessageType])
  {
    v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"));
    [v3 setObject:v59 forKeyedSubscript:@"lastSupportedMessageType"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"lastSupportedMessageType"];
  }
  v60 = [(MRDeviceInfo *)self groupSessionToken];
  [v3 setObject:v60 forKeyedSubscript:@"groupSessionToken"];

  if ([(MRDeviceInfo *)self isEligibleForHostingGroupSessionExcludingAcknowledgements])
  {
    uint64_t v61 = objc_msgSend(NSNumber, "numberWithBool:", -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
    [v3 setObject:v61 forKeyedSubscript:@"isEligibleForHostingGroupSessionExcludingAcknowledgements"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"isEligibleForHostingGroupSessionExcludingAcknowledgements"];
  }
  v62 = [(MRDeviceInfo *)self activeSystemEndpointUID];
  [v3 setObject:v62 forKeyedSubscript:@"activeSystemEndpointUID"];

  v63 = [(MRDeviceInfo *)self leaderDeviceInfo];
  uint64_t v64 = [v63 dictionaryRepresentation];
  [v3 setObject:v64 forKeyedSubscript:@"leaderDeviceInfo"];

  return (NSDictionary *)v3;
}

- (MRDeviceInfo)skeleton
{
  id v3 = objc_alloc_init(MRDeviceInfo);
  id v4 = [(MRDeviceInfo *)self identifier];
  [(MRDeviceInfo *)v3 setIdentifier:v4];

  uint64_t v5 = [(MRDeviceInfo *)self name];

  if (v5)
  {
    v6 = [(MRDeviceInfo *)self name];
    [(MRDeviceInfo *)v3 setName:v6];
  }
  uint64_t v7 = [(MRDeviceInfo *)self deviceUID];

  if (v7)
  {
    v8 = [(MRDeviceInfo *)self deviceUID];
    [(MRDeviceInfo *)v3 setDeviceUID:v8];
  }
  int v9 = [(MRDeviceInfo *)self groupUID];

  if (v9)
  {
    uint64_t v10 = [(MRDeviceInfo *)self groupUID];
    [(MRDeviceInfo *)v3 setGroupUID:v10];
  }
  uint64_t v11 = [(MRDeviceInfo *)self airPlayGroupUID];

  if (v11)
  {
    v12 = [(MRDeviceInfo *)self airPlayGroupUID];
    [(MRDeviceInfo *)v3 setAirPlayGroupUID:v12];
  }
  objc_super v13 = [(MRDeviceInfo *)self groupName];

  if (v13)
  {
    int v14 = [(MRDeviceInfo *)self groupName];
    [(MRDeviceInfo *)v3 setGroupName:v14];
  }
  if ([(MRDeviceInfo *)self isProxyGroupPlayer]) {
    [(MRDeviceInfo *)v3 setProxyGroupPlayer:1];
  }
  if ([(MRDeviceInfo *)self isAirPlayActive]) {
    [(MRDeviceInfo *)v3 setAirPlayActive:1];
  }
  if ([(MRDeviceInfo *)self isGroupLeader]) {
    [(MRDeviceInfo *)v3 setGroupLeader:1];
  }
  uint64_t v15 = [(MRDeviceInfo *)self tightSyncUID];

  if (v15)
  {
    uint64_t v16 = [(MRDeviceInfo *)self tightSyncUID];
    [(MRDeviceInfo *)v3 setTightSyncUID:v16];
  }
  v17 = [(MRDeviceInfo *)self routingContextID];

  if (v17)
  {
    v18 = [(MRDeviceInfo *)self routingContextID];
    [(MRDeviceInfo *)v3 setRoutingContextID:v18];
  }

  return v3;
}

- (NSString)minimalDescription
{
  id v2 = [(MRDeviceInfo *)self skeleton];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (BOOL)isCompanion
{
  return +[MRDeviceInfo deviceClass] == 6
      && [(MRDeviceInfo *)self deviceClass] == 1;
}

- (BOOL)isGizmo
{
  return +[MRDeviceInfo deviceClass] == 1
      && [(MRDeviceInfo *)self deviceClass] == 6;
}

+ (int64_t)deviceClass
{
  unsigned int v2 = MGGetSInt32Answer() - 1;
  if (v2 > 0xA) {
    return -1;
  }
  else {
    return qword_195224398[v2];
  }
}

- (NSString)WHAIdentifier
{
  id v3 = [(MRDeviceInfo *)self clusterID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(MRDeviceInfo *)self deviceUID];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(MRDeviceInfo *)self identifier];
    }
    id v5 = v8;
  }

  return (NSString *)v5;
}

- (BOOL)supportsImplicitChangeShuffleAndRepeatModeInSetPlaybackQueueCommandOptions
{
  return [(MRDeviceInfo *)self sharedQueueVersion] > 2;
}

- (NSString)parentGroupID
{
  if ([(MRDeviceInfo *)self isAirPlayActive])
  {
    id v3 = [(MRDeviceInfo *)self groupUID];
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)hasPlaceholderGroupSession
{
  id v3 = [(MRDeviceInfo *)self groupSessionToken];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(MRDeviceInfo *)self isEligibleForHostingGroupSessionExcludingAcknowledgements];
  }

  return v4;
}

- (void)setPreferredEncoding:(int64_t)a3
{
  self->_preferredEncoding = a3;
  self->_hasPreferredEncoding = 1;
}

- (void)setLastSupportedClusterType:(unsigned int)a3
{
  self->_lastSupportedClusterType = a3;
  self->_hasLastSupportedClusterType = 1;
}

- (BOOL)containsLocalDevice
{
  id v3 = (void *)MRMediaRemoteCopyDeviceUID();
  LOBYTE(self) = [(MRDeviceInfo *)self containsDevice:v3];

  return (char)self;
}

- (BOOL)containsDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRDeviceInfo *)self clusterID];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(MRDeviceInfo *)self deviceUID];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v10 = [(MRDeviceInfo *)self groupedDevices];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v30 + 1) + 8 * v14) containsDevice:v4]) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (v12) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = [(MRDeviceInfo *)self clusteredDevices];
        uint64_t v15 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
LABEL_14:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v26 + 1) + 8 * v18) containsDevice:v4]) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
              if (v16) {
                goto LABEL_14;
              }
              goto LABEL_20;
            }
          }
        }
        else
        {
LABEL_20:

          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v10 = [(MRDeviceInfo *)self allClusteredDevices];
          uint64_t v9 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
          if (!v9)
          {
LABEL_30:

            goto LABEL_31;
          }
          uint64_t v19 = *(void *)v23;
LABEL_22:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v22 + 1) + 8 * v20) containsDevice:v4]) {
              break;
            }
            if (v9 == ++v20)
            {
              uint64_t v9 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
              if (v9) {
                goto LABEL_22;
              }
              goto LABEL_30;
            }
          }
        }
      }
      LOBYTE(v9) = 1;
      goto LABEL_30;
    }
  }
  LOBYTE(v9) = 1;
LABEL_31:

  return v9;
}

- (BOOL)matchesUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDeviceInfo *)self deviceUID];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(MRDeviceInfo *)self clusterID];
    if ([v7 isEqualToString:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v8 = [(MRDeviceInfo *)self identifier];
      char v6 = [v8 isEqualToString:v4];
    }
  }

  return v6;
}

- (BOOL)isAwareOfCluster:(unsigned int)a3
{
  return [(MRDeviceInfo *)self lastSupportedClusterType] >= a3;
}

- (id)deltaDescriptionFromDeviceInfo:(id)a3 minimal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 dictionaryRepresentation];
  char v8 = [(MRDeviceInfo *)self dictionaryRepresentation];
  id v22 = 0;
  id v23 = 0;
  id v21 = 0;
  MRDictionaryCalculateDeltas(v7, v8, &v23, &v22, &v21);
  id v9 = v23;
  id v10 = v22;
  id v11 = v21;

  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v13 = [NSString alloc];
  uint64_t v14 = v13;
  if (v4)
  {
    uint64_t v15 = [(MRDeviceInfo *)self skeleton];
    uint64_t v16 = (void *)[v14 initWithFormat:@"%@", v15];
    [v12 appendString:v16];
  }
  else
  {
    uint64_t v15 = (void *)[v13 initWithFormat:@"DeviceInfo changed from\n %@ \nto\n %@\n", v6, self];
    [v12 appendString:v15];
  }

  if ([v9 count])
  {
    [v12 appendString:@"\n"];
    [v12 appendString:@"Added Fields:\n"];
    uint64_t v17 = [v9 description];
    [v12 appendString:v17];
  }
  if ([v10 count])
  {
    [v12 appendString:@"\n"];
    [v12 appendString:@"Removed Fields: \n"];
    uint64_t v18 = [v10 description];
    [v12 appendString:v18];
  }
  if ([v11 count])
  {
    [v12 appendString:@"\n"];
    [v12 appendString:@"Updated values: \n"];
    uint64_t v19 = [v11 description];
    [v12 appendString:v19];
  }
  [v12 appendString:@"\n"];

  return v12;
}

- (id)deltaDescriptionFromDeviceInfo:(id)a3
{
  return [(MRDeviceInfo *)self deltaDescriptionFromDeviceInfo:a3 minimal:0];
}

- (id)minimalDeltaDescriptionFromDeviceInfo:(id)a3
{
  return [(MRDeviceInfo *)self deltaDescriptionFromDeviceInfo:a3 minimal:1];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRDeviceInfo *)self protobuf];
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRDeviceInfo *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_215;
    }
    BOOL v5 = [(MRDeviceInfo *)v4 hasDeviceClass];
    if (v5 != [(MRDeviceInfo *)self hasDeviceClass]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasDeviceClass])
    {
      if ([(MRDeviceInfo *)self hasDeviceClass])
      {
        uint64_t v6 = [(MRDeviceInfo *)v4 deviceClass];
        if (v6 != [(MRDeviceInfo *)self deviceClass]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v7 = [(MRDeviceInfo *)v4 hasProtocolVersion];
    if (v7 != [(MRDeviceInfo *)self hasProtocolVersion]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasProtocolVersion])
    {
      if ([(MRDeviceInfo *)self hasProtocolVersion])
      {
        uint64_t v8 = [(MRDeviceInfo *)v4 protocolVersion];
        if (v8 != [(MRDeviceInfo *)self protocolVersion]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v9 = [(MRDeviceInfo *)v4 hasGroupedDeviceCount];
    if (v9 != [(MRDeviceInfo *)self hasGroupedDeviceCount]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasGroupedDeviceCount])
    {
      if ([(MRDeviceInfo *)self hasGroupedDeviceCount])
      {
        uint64_t v10 = [(MRDeviceInfo *)v4 groupedDeviceCount];
        if (v10 != [(MRDeviceInfo *)self groupedDeviceCount]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v11 = [(MRDeviceInfo *)v4 hasSharedQueueVersion];
    if (v11 != [(MRDeviceInfo *)self hasSharedQueueVersion]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSharedQueueVersion])
    {
      if ([(MRDeviceInfo *)self hasSharedQueueVersion])
      {
        uint64_t v12 = [(MRDeviceInfo *)v4 sharedQueueVersion];
        if (v12 != [(MRDeviceInfo *)self sharedQueueVersion]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v13 = [(MRDeviceInfo *)v4 hasGroupLogicalDeviceCount];
    if (v13 != [(MRDeviceInfo *)self hasGroupLogicalDeviceCount]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasGroupLogicalDeviceCount])
    {
      if ([(MRDeviceInfo *)self hasGroupLogicalDeviceCount])
      {
        uint64_t v14 = [(MRDeviceInfo *)v4 groupLogicalDeviceCount];
        if (v14 != [(MRDeviceInfo *)self groupLogicalDeviceCount]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v15 = [(MRDeviceInfo *)v4 hasSupportsSystemPairing];
    if (v15 != [(MRDeviceInfo *)self hasSupportsSystemPairing]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSupportsSystemPairing])
    {
      if ([(MRDeviceInfo *)self hasSupportsSystemPairing])
      {
        BOOL v16 = [(MRDeviceInfo *)v4 supportsSystemPairing];
        if (v16 != [(MRDeviceInfo *)self supportsSystemPairing]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v17 = [(MRDeviceInfo *)v4 hasSupportsACL];
    if (v17 != [(MRDeviceInfo *)self hasSupportsACL]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSupportsACL])
    {
      if ([(MRDeviceInfo *)self hasSupportsACL])
      {
        BOOL v18 = [(MRDeviceInfo *)v4 supportsACL];
        if (v18 != [(MRDeviceInfo *)self supportsACL]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v19 = [(MRDeviceInfo *)v4 hasSupportsSharedQueue];
    if (v19 != [(MRDeviceInfo *)self hasSupportsSharedQueue]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSupportsSharedQueue])
    {
      if ([(MRDeviceInfo *)self hasSupportsSharedQueue])
      {
        BOOL v20 = [(MRDeviceInfo *)v4 supportsSharedQueue];
        if (v20 != [(MRDeviceInfo *)self supportsSharedQueue]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v21 = [(MRDeviceInfo *)v4 hasSupportsExtendedMotion];
    if (v21 != [(MRDeviceInfo *)self hasSupportsExtendedMotion]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSupportsExtendedMotion])
    {
      if ([(MRDeviceInfo *)self hasSupportsExtendedMotion])
      {
        BOOL v22 = [(MRDeviceInfo *)v4 supportsExtendedMotion];
        if (v22 != [(MRDeviceInfo *)self supportsExtendedMotion]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v23 = [(MRDeviceInfo *)v4 hasTightSyncGroup];
    if (v23 != [(MRDeviceInfo *)self hasTightSyncGroup]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasTightSyncGroup])
    {
      if ([(MRDeviceInfo *)self hasTightSyncGroup])
      {
        BOOL v24 = [(MRDeviceInfo *)v4 isTightSyncGroup];
        if (v24 != [(MRDeviceInfo *)self isTightSyncGroup]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v25 = [(MRDeviceInfo *)v4 hasPairingAllowed];
    if (v25 != [(MRDeviceInfo *)self hasPairingAllowed]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasPairingAllowed])
    {
      if ([(MRDeviceInfo *)self hasPairingAllowed])
      {
        BOOL v26 = [(MRDeviceInfo *)v4 isPairingAllowed];
        if (v26 != [(MRDeviceInfo *)self isPairingAllowed]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v27 = [(MRDeviceInfo *)v4 hasProxyGroupPlayer];
    if (v27 != [(MRDeviceInfo *)self hasProxyGroupPlayer]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasProxyGroupPlayer])
    {
      if ([(MRDeviceInfo *)self hasProxyGroupPlayer])
      {
        BOOL v28 = [(MRDeviceInfo *)v4 isProxyGroupPlayer];
        if (v28 != [(MRDeviceInfo *)self isProxyGroupPlayer]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v29 = [(MRDeviceInfo *)v4 hasConnected];
    if (v29 != [(MRDeviceInfo *)self hasConnected]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasConnected])
    {
      if ([(MRDeviceInfo *)self hasConnected])
      {
        BOOL v30 = [(MRDeviceInfo *)v4 isConnected];
        if (v30 != [(MRDeviceInfo *)self isConnected]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v31 = [(MRDeviceInfo *)v4 hasGroupLeader];
    if (v31 != [(MRDeviceInfo *)self hasGroupLeader]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasGroupLeader])
    {
      if ([(MRDeviceInfo *)self hasGroupLeader])
      {
        BOOL v32 = [(MRDeviceInfo *)v4 isGroupLeader];
        if (v32 != [(MRDeviceInfo *)self isGroupLeader]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v33 = [(MRDeviceInfo *)v4 hasAirPlayActive];
    if (v33 != [(MRDeviceInfo *)self hasAirPlayActive]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasAirPlayActive])
    {
      if ([(MRDeviceInfo *)self hasAirPlayActive])
      {
        BOOL v34 = [(MRDeviceInfo *)v4 isAirPlayActive];
        if (v34 != [(MRDeviceInfo *)self isAirPlayActive]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v35 = [(MRDeviceInfo *)v4 hasSupportsMultiplayer];
    if (v35 != [(MRDeviceInfo *)self hasSupportsMultiplayer]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasSupportsMultiplayer])
    {
      if ([(MRDeviceInfo *)self hasSupportsMultiplayer])
      {
        BOOL v36 = [(MRDeviceInfo *)v4 supportsMultiplayer];
        if (v36 != [(MRDeviceInfo *)self supportsMultiplayer]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v37 = [(MRDeviceInfo *)v4 hasParentGroupContainsDiscoverableGroupLeader];
    if (v37 != [(MRDeviceInfo *)self hasParentGroupContainsDiscoverableGroupLeader])goto LABEL_215; {
    if ([(MRDeviceInfo *)v4 hasParentGroupContainsDiscoverableGroupLeader])
    }
    {
      if ([(MRDeviceInfo *)self hasParentGroupContainsDiscoverableGroupLeader])
      {
        BOOL v38 = [(MRDeviceInfo *)v4 parentGroupContainsDiscoverableGroupLeader];
        if (v38 != [(MRDeviceInfo *)self parentGroupContainsDiscoverableGroupLeader])goto LABEL_215; {
      }
        }
    }
    BOOL v39 = [(MRDeviceInfo *)v4 hasGroupContainsDiscoverableGroupLeader];
    if (v39 != [(MRDeviceInfo *)self hasGroupContainsDiscoverableGroupLeader]) {
      goto LABEL_215;
    }
    if ([(MRDeviceInfo *)v4 hasGroupContainsDiscoverableGroupLeader])
    {
      if ([(MRDeviceInfo *)self hasGroupContainsDiscoverableGroupLeader])
      {
        BOOL v40 = [(MRDeviceInfo *)v4 groupContainsDiscoverableGroupLeader];
        if (v40 != [(MRDeviceInfo *)self groupContainsDiscoverableGroupLeader]) {
          goto LABEL_215;
        }
      }
    }
    BOOL v41 = [(MRDeviceInfo *)v4 hasClusterType];
    if (v41 != [(MRDeviceInfo *)self hasClusterType]) {
      goto LABEL_215;
    }
    unsigned int v42 = [(MRDeviceInfo *)v4 clusterType];
    if (v42 != [(MRDeviceInfo *)self clusterType]) {
      goto LABEL_215;
    }
    BOOL v43 = [(MRDeviceInfo *)v4 hasIsClusterAware];
    if (v43 != [(MRDeviceInfo *)self hasIsClusterAware]) {
      goto LABEL_215;
    }
    BOOL v44 = [(MRDeviceInfo *)v4 isClusterAware];
    if (v44 != [(MRDeviceInfo *)self isClusterAware]) {
      goto LABEL_215;
    }
    BOOL v45 = [(MRDeviceInfo *)v4 hasConfiguredClusterSize];
    if (v45 != [(MRDeviceInfo *)self hasConfiguredClusterSize]) {
      goto LABEL_215;
    }
    uint64_t v46 = [(MRDeviceInfo *)v4 configuredClusterSize];
    if (v46 != [(MRDeviceInfo *)self configuredClusterSize]) {
      goto LABEL_215;
    }
    BOOL v47 = [(MRDeviceInfo *)v4 hasIsClusterLeader];
    if (v47 != [(MRDeviceInfo *)self hasIsClusterLeader]) {
      goto LABEL_215;
    }
    BOOL v48 = [(MRDeviceInfo *)v4 isClusterLeader];
    if (v48 != [(MRDeviceInfo *)self isClusterLeader]) {
      goto LABEL_215;
    }
    BOOL v49 = [(MRDeviceInfo *)v4 hasLastSupportedClusterType];
    if (v49 != [(MRDeviceInfo *)self hasLastSupportedClusterType]) {
      goto LABEL_215;
    }
    unsigned int v50 = [(MRDeviceInfo *)v4 lastSupportedClusterType];
    if (v50 != [(MRDeviceInfo *)self lastSupportedClusterType]) {
      goto LABEL_215;
    }
    BOOL v51 = [(MRDeviceInfo *)v4 hasSupportsOutputContextSync];
    if (v51 != [(MRDeviceInfo *)self hasSupportsOutputContextSync]) {
      goto LABEL_215;
    }
    BOOL v52 = [(MRDeviceInfo *)v4 supportsOutputContextSync];
    if (v52 != [(MRDeviceInfo *)self supportsOutputContextSync]) {
      goto LABEL_215;
    }
    BOOL v53 = [(MRDeviceInfo *)v4 hasLastSupportedProtocolMessageType];
    if (v53 != [(MRDeviceInfo *)self hasLastSupportedProtocolMessageType]) {
      goto LABEL_215;
    }
    uint64_t v54 = [(MRDeviceInfo *)v4 lastSupportedProtocolMessageType];
    if (v54 != [(MRDeviceInfo *)self lastSupportedProtocolMessageType]) {
      goto LABEL_215;
    }
    uint64_t v55 = [(MRDeviceInfo *)v4 name];
    uint64_t v56 = [(MRDeviceInfo *)self name];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      uint64_t v58 = [(MRDeviceInfo *)v4 name];
      v59 = [(MRDeviceInfo *)self name];
      int v60 = [v58 isEqualToString:v59];

      if (!v60)
      {
LABEL_215:
        LOBYTE(v61) = 0;
        goto LABEL_216;
      }
    }
    v62 = [(MRDeviceInfo *)v4 identifier];
    uint64_t v63 = [(MRDeviceInfo *)self identifier];
    if (v62 == (void *)v63)
    {
    }
    else
    {
      uint64_t v64 = (void *)v63;
      v65 = [(MRDeviceInfo *)v4 identifier];
      v66 = [(MRDeviceInfo *)self identifier];
      int v67 = [v65 isEqualToString:v66];

      if (!v67) {
        goto LABEL_215;
      }
    }
    v68 = [(MRDeviceInfo *)v4 localizedModelName];
    uint64_t v69 = [(MRDeviceInfo *)self localizedModelName];
    if (v68 == (void *)v69)
    {
    }
    else
    {
      uint64_t v70 = (void *)v69;
      v71 = [(MRDeviceInfo *)v4 localizedModelName];
      v72 = [(MRDeviceInfo *)self localizedModelName];
      int v73 = [v71 isEqualToString:v72];

      if (!v73) {
        goto LABEL_215;
      }
    }
    v74 = [(MRDeviceInfo *)v4 buildVersion];
    uint64_t v75 = [(MRDeviceInfo *)self buildVersion];
    if (v74 == (void *)v75)
    {
    }
    else
    {
      uint64_t v76 = (void *)v75;
      v77 = [(MRDeviceInfo *)v4 buildVersion];
      uint64_t v78 = [(MRDeviceInfo *)self buildVersion];
      int v79 = [v77 isEqualToString:v78];

      if (!v79) {
        goto LABEL_215;
      }
    }
    v80 = [(MRDeviceInfo *)v4 bundleIdentifier];
    uint64_t v81 = [(MRDeviceInfo *)self bundleIdentifier];
    if (v80 == (void *)v81)
    {
    }
    else
    {
      v82 = (void *)v81;
      v83 = [(MRDeviceInfo *)v4 bundleIdentifier];
      v84 = [(MRDeviceInfo *)self bundleIdentifier];
      int v85 = [v83 isEqualToString:v84];

      if (!v85) {
        goto LABEL_215;
      }
    }
    uint64_t v86 = [(MRDeviceInfo *)v4 bundleVersion];
    uint64_t v87 = [(MRDeviceInfo *)self bundleVersion];
    if (v86 == (void *)v87)
    {
    }
    else
    {
      v88 = (void *)v87;
      uint64_t v89 = [(MRDeviceInfo *)v4 bundleVersion];
      v90 = [(MRDeviceInfo *)self bundleVersion];
      int v91 = [v89 isEqualToString:v90];

      if (!v91) {
        goto LABEL_215;
      }
    }
    uint64_t v92 = [(MRDeviceInfo *)v4 systemMediaApplication];
    uint64_t v93 = [(MRDeviceInfo *)self systemMediaApplication];
    if (v92 == (void *)v93)
    {
    }
    else
    {
      v94 = (void *)v93;
      uint64_t v95 = [(MRDeviceInfo *)v4 systemMediaApplication];
      v96 = [(MRDeviceInfo *)self systemMediaApplication];
      int v97 = [v95 isEqualToString:v96];

      if (!v97) {
        goto LABEL_215;
      }
    }
    v98 = [(MRDeviceInfo *)v4 systemPodcastApplication];
    uint64_t v99 = [(MRDeviceInfo *)self systemPodcastApplication];
    if (v98 == (void *)v99)
    {
    }
    else
    {
      v100 = (void *)v99;
      v101 = [(MRDeviceInfo *)v4 systemPodcastApplication];
      v102 = [(MRDeviceInfo *)self systemPodcastApplication];
      int v103 = [v101 isEqualToString:v102];

      if (!v103) {
        goto LABEL_215;
      }
    }
    v104 = [(MRDeviceInfo *)v4 systemBooksApplication];
    uint64_t v105 = [(MRDeviceInfo *)self systemBooksApplication];
    if (v104 == (void *)v105)
    {
    }
    else
    {
      v106 = (void *)v105;
      v107 = [(MRDeviceInfo *)v4 systemBooksApplication];
      v108 = [(MRDeviceInfo *)self systemBooksApplication];
      int v109 = [v107 isEqualToString:v108];

      if (!v109) {
        goto LABEL_215;
      }
    }
    v110 = [(MRDeviceInfo *)v4 deviceUID];
    uint64_t v111 = [(MRDeviceInfo *)self deviceUID];
    if (v110 == (void *)v111)
    {
    }
    else
    {
      v112 = (void *)v111;
      v113 = [(MRDeviceInfo *)v4 deviceUID];
      v114 = [(MRDeviceInfo *)self deviceUID];
      int v115 = [v113 isEqualToString:v114];

      if (!v115) {
        goto LABEL_215;
      }
    }
    v116 = [(MRDeviceInfo *)v4 localReceiverPairingIdentity];
    uint64_t v117 = [(MRDeviceInfo *)self localReceiverPairingIdentity];
    if (v116 == (void *)v117)
    {
    }
    else
    {
      v118 = (void *)v117;
      v119 = [(MRDeviceInfo *)v4 localReceiverPairingIdentity];
      v120 = [(MRDeviceInfo *)self localReceiverPairingIdentity];
      int v121 = [v119 isEqualToString:v120];

      if (!v121) {
        goto LABEL_215;
      }
    }
    v122 = [(MRDeviceInfo *)v4 managedConfigurationDeviceIdentifier];
    uint64_t v123 = [(MRDeviceInfo *)self managedConfigurationDeviceIdentifier];
    if (v122 == (void *)v123)
    {
    }
    else
    {
      v124 = (void *)v123;
      v125 = [(MRDeviceInfo *)v4 managedConfigurationDeviceIdentifier];
      v126 = [(MRDeviceInfo *)self managedConfigurationDeviceIdentifier];
      int v127 = [v125 isEqualToString:v126];

      if (!v127) {
        goto LABEL_215;
      }
    }
    v128 = [(MRDeviceInfo *)v4 tightSyncUID];
    uint64_t v129 = [(MRDeviceInfo *)self tightSyncUID];
    if (v128 == (void *)v129)
    {
    }
    else
    {
      v130 = (void *)v129;
      v131 = [(MRDeviceInfo *)v4 tightSyncUID];
      v132 = [(MRDeviceInfo *)self tightSyncUID];
      int v133 = [v131 isEqualToString:v132];

      if (!v133) {
        goto LABEL_215;
      }
    }
    v134 = [(MRDeviceInfo *)v4 groupUID];
    uint64_t v135 = [(MRDeviceInfo *)self groupUID];
    if (v134 == (void *)v135)
    {
    }
    else
    {
      v136 = (void *)v135;
      v137 = [(MRDeviceInfo *)v4 groupUID];
      v138 = [(MRDeviceInfo *)self groupUID];
      int v139 = [v137 isEqualToString:v138];

      if (!v139) {
        goto LABEL_215;
      }
    }
    v140 = [(MRDeviceInfo *)v4 airPlayGroupUID];
    uint64_t v141 = [(MRDeviceInfo *)self airPlayGroupUID];
    if (v140 == (void *)v141)
    {
    }
    else
    {
      v142 = (void *)v141;
      v143 = [(MRDeviceInfo *)v4 airPlayGroupUID];
      v144 = [(MRDeviceInfo *)self airPlayGroupUID];
      int v145 = [v143 isEqualToString:v144];

      if (!v145) {
        goto LABEL_215;
      }
    }
    v146 = [(MRDeviceInfo *)v4 groupName];
    uint64_t v147 = [(MRDeviceInfo *)self groupName];
    if (v146 == (void *)v147)
    {
    }
    else
    {
      v148 = (void *)v147;
      v149 = [(MRDeviceInfo *)v4 groupName];
      v150 = [(MRDeviceInfo *)self groupName];
      int v151 = [v149 isEqualToString:v150];

      if (!v151) {
        goto LABEL_215;
      }
    }
    v152 = [(MRDeviceInfo *)v4 senderDefaultGroupUID];
    uint64_t v153 = [(MRDeviceInfo *)self senderDefaultGroupUID];
    if (v152 == (void *)v153)
    {
    }
    else
    {
      v154 = (void *)v153;
      v155 = [(MRDeviceInfo *)v4 senderDefaultGroupUID];
      v156 = [(MRDeviceInfo *)self senderDefaultGroupUID];
      int v157 = [v155 isEqualToString:v156];

      if (!v157) {
        goto LABEL_215;
      }
    }
    v158 = [(MRDeviceInfo *)v4 bluetoothAddress];
    uint64_t v159 = [(MRDeviceInfo *)self bluetoothAddress];
    if (v158 == (void *)v159)
    {
    }
    else
    {
      v160 = (void *)v159;
      v161 = [(MRDeviceInfo *)v4 bluetoothAddress];
      v162 = [(MRDeviceInfo *)self bluetoothAddress];
      int v163 = [v161 isEqualToData:v162];

      if (!v163) {
        goto LABEL_215;
      }
    }
    v164 = [(MRDeviceInfo *)v4 groupedDevices];
    uint64_t v165 = [(MRDeviceInfo *)self groupedDevices];
    if (v164 == (void *)v165)
    {
    }
    else
    {
      v166 = (void *)v165;
      v167 = [(MRDeviceInfo *)v4 groupedDevices];
      v168 = [(MRDeviceInfo *)self groupedDevices];
      int v169 = [v167 isEqualToArray:v168];

      if (!v169) {
        goto LABEL_215;
      }
    }
    v170 = [(MRDeviceInfo *)v4 clusteredDevices];
    uint64_t v171 = [(MRDeviceInfo *)self clusteredDevices];
    if (v170 == (void *)v171)
    {
    }
    else
    {
      v172 = (void *)v171;
      v173 = [(MRDeviceInfo *)v4 clusteredDevices];
      v174 = [(MRDeviceInfo *)self clusteredDevices];
      int v175 = [v173 isEqualToArray:v174];

      if (!v175) {
        goto LABEL_215;
      }
    }
    v176 = [(MRDeviceInfo *)v4 allClusteredDevices];
    uint64_t v177 = [(MRDeviceInfo *)self allClusteredDevices];
    if (v176 == (void *)v177)
    {
    }
    else
    {
      v178 = (void *)v177;
      v179 = [(MRDeviceInfo *)v4 allClusteredDevices];
      v180 = [(MRDeviceInfo *)self allClusteredDevices];
      int v181 = [v179 isEqualToArray:v180];

      if (!v181) {
        goto LABEL_215;
      }
    }
    v182 = [(MRDeviceInfo *)v4 airPlayReceivers];
    uint64_t v183 = [(MRDeviceInfo *)self airPlayReceivers];
    if (v182 == (void *)v183)
    {
    }
    else
    {
      v184 = (void *)v183;
      v185 = [(MRDeviceInfo *)v4 airPlayReceivers];
      v186 = [(MRDeviceInfo *)self airPlayReceivers];
      int v187 = [v185 isEqualToArray:v186];

      if (!v187) {
        goto LABEL_215;
      }
    }
    v188 = [(MRDeviceInfo *)v4 linkAgent];
    uint64_t v189 = [(MRDeviceInfo *)self linkAgent];
    if (v188 == (void *)v189)
    {
    }
    else
    {
      v190 = (void *)v189;
      v191 = [(MRDeviceInfo *)v4 linkAgent];
      v192 = [(MRDeviceInfo *)self linkAgent];
      int v193 = [v191 isEqualToString:v192];

      if (!v193) {
        goto LABEL_215;
      }
    }
    v194 = [(MRDeviceInfo *)v4 clusterID];
    uint64_t v195 = [(MRDeviceInfo *)self clusterID];
    if (v194 == (void *)v195)
    {
    }
    else
    {
      v196 = (void *)v195;
      v197 = [(MRDeviceInfo *)v4 clusterID];
      v198 = [(MRDeviceInfo *)self clusterID];
      int v199 = [v197 isEqualToString:v198];

      if (!v199) {
        goto LABEL_215;
      }
    }
    v200 = [(MRDeviceInfo *)v4 clusterLeaderID];
    uint64_t v201 = [(MRDeviceInfo *)self clusterLeaderID];
    if (v200 == (void *)v201)
    {
    }
    else
    {
      v202 = (void *)v201;
      v203 = [(MRDeviceInfo *)v4 clusterLeaderID];
      v204 = [(MRDeviceInfo *)self clusterLeaderID];
      int v205 = [v203 isEqualToString:v204];

      if (!v205) {
        goto LABEL_215;
      }
    }
    v206 = [(MRDeviceInfo *)v4 computerName];
    uint64_t v207 = [(MRDeviceInfo *)self computerName];
    if (v206 == (void *)v207)
    {
    }
    else
    {
      v208 = (void *)v207;
      v209 = [(MRDeviceInfo *)v4 computerName];
      v210 = [(MRDeviceInfo *)self computerName];
      int v211 = [v209 isEqualToString:v210];

      if (!v211) {
        goto LABEL_215;
      }
    }
    v212 = [(MRDeviceInfo *)v4 modelID];
    v213 = [(MRDeviceInfo *)self modelID];
    id v214 = v212;
    id v215 = v213;
    if (v214 == v215)
    {
    }
    else
    {
      v216 = v215;
      char v217 = [v214 isEqual:v215];

      if ((v217 & 1) == 0) {
        goto LABEL_215;
      }
    }
    v218 = [(MRDeviceInfo *)v4 routingContextID];
    v219 = [(MRDeviceInfo *)self routingContextID];
    id v220 = v218;
    id v221 = v219;
    if (v220 == v221)
    {
    }
    else
    {
      v222 = v221;
      char v223 = [v220 isEqual:v221];

      if ((v223 & 1) == 0) {
        goto LABEL_215;
      }
    }
    v224 = [(MRDeviceInfo *)v4 groupSessionToken];
    v225 = [(MRDeviceInfo *)self groupSessionToken];
    id v226 = v224;
    id v227 = v225;
    if (v226 == v227)
    {
    }
    else
    {
      v228 = v227;
      char v229 = [v226 isEqual:v227];

      if ((v229 & 1) == 0) {
        goto LABEL_215;
      }
    }
    v230 = [(MRDeviceInfo *)v4 leaderDeviceInfo];
    v231 = [(MRDeviceInfo *)self leaderDeviceInfo];
    id v232 = v230;
    id v233 = v231;
    if (v232 == v233)
    {
    }
    else
    {
      v234 = v233;
      char v235 = [v232 isEqual:v233];

      if ((v235 & 1) == 0) {
        goto LABEL_215;
      }
    }
    v236 = [(MRDeviceInfo *)v4 activeSystemEndpointUID];
    v237 = [(MRDeviceInfo *)self activeSystemEndpointUID];
    id v238 = v236;
    id v239 = v237;
    if (v238 == v239)
    {
    }
    else
    {
      v240 = v239;
      char v241 = [v238 isEqual:v239];

      if ((v241 & 1) == 0) {
        goto LABEL_215;
      }
    }
    BOOL v242 = [(MRDeviceInfo *)v4 hasIsEligibleForHostingGroupSessionExcludingAcknowledgements];
    if (v242 == [(MRDeviceInfo *)self hasIsEligibleForHostingGroupSessionExcludingAcknowledgements])
    {
      BOOL v244 = [(MRDeviceInfo *)v4 isEligibleForHostingGroupSessionExcludingAcknowledgements];
      int v61 = v244 ^ [(MRDeviceInfo *)self isEligibleForHostingGroupSessionExcludingAcknowledgements] ^ 1;
      goto LABEL_216;
    }
    goto LABEL_215;
  }
  LOBYTE(v61) = 1;
LABEL_216:

  return v61;
}

- (unint64_t)hash
{
  unsigned int v2 = [(MRDeviceInfo *)self WHAIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)hasClusterType
{
  return self->_hasClusterType;
}

- (void)setHasClusterType:(BOOL)a3
{
  self->_hasClusterType = a3;
}

- (BOOL)hasIsClusterAware
{
  return self->_hasIsClusterAware;
}

- (void)setHasIsClusterAware:(BOOL)a3
{
  self->_hasIsClusterAware = a3;
}

- (BOOL)hasConfiguredClusterSize
{
  return self->_hasConfiguredClusterSize;
}

- (void)setHasConfiguredClusterSize:(BOOL)a3
{
  self->_hasConfiguredClusterSize = a3;
}

- (BOOL)hasIsClusterLeader
{
  return self->_hasIsClusterLeader;
}

- (void)setHasIsClusterLeader:(BOOL)a3
{
  self->_hasIsClusterLeader = a3;
}

- (unsigned)lastSupportedClusterType
{
  return self->_lastSupportedClusterType;
}

- (BOOL)hasLastSupportedClusterType
{
  return self->_hasLastSupportedClusterType;
}

- (void)setHasLastSupportedClusterType:(BOOL)a3
{
  self->_hasLastSupportedClusterType = a3;
}

- (BOOL)hasSupportsOutputContextSync
{
  return self->_hasSupportsOutputContextSync;
}

- (void)setHasSupportsOutputContextSync:(BOOL)a3
{
  self->_hasSupportsOutputContextSync = a3;
}

- (BOOL)hasLastSupportedProtocolMessageType
{
  return self->_hasLastSupportedProtocolMessageType;
}

- (void)setHasLastSupportedProtocolMessageType:(BOOL)a3
{
  self->_hasLastSupportedProtocolMessageType = a3;
}

- (NSString)effectiveID
{
  unint64_t v3 = [(MRDeviceInfo *)self clusterID];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(MRDeviceInfo *)self deviceUID];
    BOOL v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      uint64_t v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
      BOOL v9 = [v8 outputDevices];
      uint64_t v10 = [v9 firstObject];
      id v5 = [v10 uid];
    }
  }

  return (NSString *)v5;
}

@end