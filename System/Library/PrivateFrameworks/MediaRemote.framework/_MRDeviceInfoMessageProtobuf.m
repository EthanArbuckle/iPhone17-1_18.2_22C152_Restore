@interface _MRDeviceInfoMessageProtobuf
+ (Class)airplayReceiversType;
+ (Class)allClusteredDevicesType;
+ (Class)clusteredDevicesType;
+ (Class)groupedDevicesType;
- (BOOL)allowsPairing;
- (BOOL)connected;
- (BOOL)groupContainsDiscoverableGroupLeader;
- (BOOL)hasActiveSystemEndpointUID;
- (BOOL)hasAirPlayGroupID;
- (BOOL)hasAllowsPairing;
- (BOOL)hasApplicationBundleIdentifier;
- (BOOL)hasApplicationBundleVersion;
- (BOOL)hasBluetoothAddress;
- (BOOL)hasClusterID;
- (BOOL)hasClusterLeaderID;
- (BOOL)hasClusterType;
- (BOOL)hasComputerName;
- (BOOL)hasConfiguredClusterSize;
- (BOOL)hasConnected;
- (BOOL)hasDeviceClass;
- (BOOL)hasDeviceUID;
- (BOOL)hasGroupContainsDiscoverableGroupLeader;
- (BOOL)hasGroupName;
- (BOOL)hasGroupSessionToken;
- (BOOL)hasGroupUID;
- (BOOL)hasIsAirplayActive;
- (BOOL)hasIsClusterAware;
- (BOOL)hasIsClusterLeader;
- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)hasIsGroupLeader;
- (BOOL)hasIsProxyGroupPlayer;
- (BOOL)hasLastKnownClusterType;
- (BOOL)hasLastSupportedMessageType;
- (BOOL)hasLeaderDeviceInfo;
- (BOOL)hasLinkAgent;
- (BOOL)hasLocalizedModelName;
- (BOOL)hasLogicalDeviceCount;
- (BOOL)hasManagedConfigDeviceID;
- (BOOL)hasModelID;
- (BOOL)hasName;
- (BOOL)hasParentGroupContainsDiscoverableGroupLeader;
- (BOOL)hasPreferredEncoding;
- (BOOL)hasProtocolVersion;
- (BOOL)hasRoutingContextID;
- (BOOL)hasSenderDefaultGroupUID;
- (BOOL)hasSharedQueueVersion;
- (BOOL)hasSupportsACL;
- (BOOL)hasSupportsExtendedMotion;
- (BOOL)hasSupportsMultiplayer;
- (BOOL)hasSupportsOutputContextSync;
- (BOOL)hasSupportsSharedQueue;
- (BOOL)hasSupportsSystemPairing;
- (BOOL)hasSystemBooksApplication;
- (BOOL)hasSystemBuildVersion;
- (BOOL)hasSystemMediaApplication;
- (BOOL)hasSystemPodcastApplication;
- (BOOL)hasTightSyncUID;
- (BOOL)hasTightlySyncedGroup;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isAirplayActive;
- (BOOL)isClusterAware;
- (BOOL)isClusterLeader;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupLeader;
- (BOOL)isProxyGroupPlayer;
- (BOOL)parentGroupContainsDiscoverableGroupLeader;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsACL;
- (BOOL)supportsExtendedMotion;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsOutputContextSync;
- (BOOL)supportsSharedQueue;
- (BOOL)supportsSystemPairing;
- (BOOL)tightlySyncedGroup;
- (NSData)bluetoothAddress;
- (NSMutableArray)airplayReceivers;
- (NSMutableArray)allClusteredDevices;
- (NSMutableArray)clusteredDevices;
- (NSMutableArray)groupedDevices;
- (NSString)activeSystemEndpointUID;
- (NSString)airPlayGroupID;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationBundleVersion;
- (NSString)clusterID;
- (NSString)clusterLeaderID;
- (NSString)computerName;
- (NSString)deviceUID;
- (NSString)groupName;
- (NSString)groupUID;
- (NSString)linkAgent;
- (NSString)localizedModelName;
- (NSString)managedConfigDeviceID;
- (NSString)modelID;
- (NSString)name;
- (NSString)routingContextID;
- (NSString)senderDefaultGroupUID;
- (NSString)systemBooksApplication;
- (NSString)systemBuildVersion;
- (NSString)systemMediaApplication;
- (NSString)systemPodcastApplication;
- (NSString)tightSyncUID;
- (NSString)uniqueIdentifier;
- (_MRDeviceInfoMessageProtobuf)leaderDeviceInfo;
- (_MRGroupSessionTokenProtobuf)groupSessionToken;
- (id)airplayReceiversAtIndex:(unint64_t)a3;
- (id)allClusteredDevicesAtIndex:(unint64_t)a3;
- (id)clusteredDevicesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceClassAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)groupedDevicesAtIndex:(unint64_t)a3;
- (id)preferredEncodingAsString:(int)a3;
- (int)StringAsDeviceClass:(id)a3;
- (int)StringAsPreferredEncoding:(id)a3;
- (int)deviceClass;
- (int)preferredEncoding;
- (unint64_t)airplayReceiversCount;
- (unint64_t)allClusteredDevicesCount;
- (unint64_t)clusteredDevicesCount;
- (unint64_t)groupedDevicesCount;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (unsigned)clusterType;
- (unsigned)configuredClusterSize;
- (unsigned)lastKnownClusterType;
- (unsigned)lastSupportedMessageType;
- (unsigned)logicalDeviceCount;
- (unsigned)sharedQueueVersion;
- (void)addAirplayReceivers:(id)a3;
- (void)addAllClusteredDevices:(id)a3;
- (void)addClusteredDevices:(id)a3;
- (void)addGroupedDevices:(id)a3;
- (void)clearAirplayReceivers;
- (void)clearAllClusteredDevices;
- (void)clearClusteredDevices;
- (void)clearGroupedDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveSystemEndpointUID:(id)a3;
- (void)setAirPlayGroupID:(id)a3;
- (void)setAirplayReceivers:(id)a3;
- (void)setAllClusteredDevices:(id)a3;
- (void)setAllowsPairing:(BOOL)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setApplicationBundleVersion:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setClusterLeaderID:(id)a3;
- (void)setClusterType:(unsigned int)a3;
- (void)setClusteredDevices:(id)a3;
- (void)setComputerName:(id)a3;
- (void)setConfiguredClusterSize:(unsigned int)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDeviceUID:(id)a3;
- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupSessionToken:(id)a3;
- (void)setGroupUID:(id)a3;
- (void)setGroupedDevices:(id)a3;
- (void)setHasAllowsPairing:(BOOL)a3;
- (void)setHasClusterType:(BOOL)a3;
- (void)setHasConfiguredClusterSize:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setHasIsAirplayActive:(BOOL)a3;
- (void)setHasIsClusterAware:(BOOL)a3;
- (void)setHasIsClusterLeader:(BOOL)a3;
- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3;
- (void)setHasIsGroupLeader:(BOOL)a3;
- (void)setHasIsProxyGroupPlayer:(BOOL)a3;
- (void)setHasLastKnownClusterType:(BOOL)a3;
- (void)setHasLastSupportedMessageType:(BOOL)a3;
- (void)setHasLogicalDeviceCount:(BOOL)a3;
- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setHasPreferredEncoding:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasSharedQueueVersion:(BOOL)a3;
- (void)setHasSupportsACL:(BOOL)a3;
- (void)setHasSupportsExtendedMotion:(BOOL)a3;
- (void)setHasSupportsMultiplayer:(BOOL)a3;
- (void)setHasSupportsOutputContextSync:(BOOL)a3;
- (void)setHasSupportsSharedQueue:(BOOL)a3;
- (void)setHasSupportsSystemPairing:(BOOL)a3;
- (void)setHasTightlySyncedGroup:(BOOL)a3;
- (void)setIsAirplayActive:(BOOL)a3;
- (void)setIsClusterAware:(BOOL)a3;
- (void)setIsClusterLeader:(BOOL)a3;
- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3;
- (void)setIsGroupLeader:(BOOL)a3;
- (void)setIsProxyGroupPlayer:(BOOL)a3;
- (void)setLastKnownClusterType:(unsigned int)a3;
- (void)setLastSupportedMessageType:(unsigned int)a3;
- (void)setLeaderDeviceInfo:(id)a3;
- (void)setLinkAgent:(id)a3;
- (void)setLocalizedModelName:(id)a3;
- (void)setLogicalDeviceCount:(unsigned int)a3;
- (void)setManagedConfigDeviceID:(id)a3;
- (void)setModelID:(id)a3;
- (void)setName:(id)a3;
- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)setPreferredEncoding:(int)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setRoutingContextID:(id)a3;
- (void)setSenderDefaultGroupUID:(id)a3;
- (void)setSharedQueueVersion:(unsigned int)a3;
- (void)setSupportsACL:(BOOL)a3;
- (void)setSupportsExtendedMotion:(BOOL)a3;
- (void)setSupportsMultiplayer:(BOOL)a3;
- (void)setSupportsOutputContextSync:(BOOL)a3;
- (void)setSupportsSharedQueue:(BOOL)a3;
- (void)setSupportsSystemPairing:(BOOL)a3;
- (void)setSystemBooksApplication:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setSystemMediaApplication:(id)a3;
- (void)setSystemPodcastApplication:(id)a3;
- (void)setTightSyncUID:(id)a3;
- (void)setTightlySyncedGroup:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRDeviceInfoMessageProtobuf

- (BOOL)hasTightlySyncedGroup
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)tightlySyncedGroup
{
  return self->_tightlySyncedGroup;
}

- (NSString)tightSyncUID
{
  return self->_tightSyncUID;
}

- (NSString)systemPodcastApplication
{
  return self->_systemPodcastApplication;
}

- (NSString)systemMediaApplication
{
  return self->_systemMediaApplication;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
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

- (unsigned)sharedQueueVersion
{
  return self->_sharedQueueVersion;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setTightlySyncedGroup:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_tightlySyncedGroup = a3;
}

- (void)setTightSyncUID:(id)a3
{
}

- (void)setSystemPodcastApplication:(id)a3
{
}

- (void)setSystemMediaApplication:(id)a3
{
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (void)setSystemBooksApplication:(id)a3
{
}

- (void)setSupportsSystemPairing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_supportsSystemPairing = a3;
}

- (void)setSupportsSharedQueue:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_supportsSharedQueue = a3;
}

- (void)setSupportsOutputContextSync:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsOutputContextSync = a3;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_supportsMultiplayer = a3;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_supportsExtendedMotion = a3;
}

- (void)setSupportsACL:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_supportsACL = a3;
}

- (void)setSharedQueueVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_sharedQueueVersion = a3;
}

- (void)setSenderDefaultGroupUID:(id)a3
{
}

- (void)setRoutingContextID:(id)a3
{
}

- (void)setProtocolVersion:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setPreferredEncoding:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_preferredEncoding = a3;
}

- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_parentGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setName:(id)a3
{
}

- (void)setManagedConfigDeviceID:(id)a3
{
}

- (void)setLogicalDeviceCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_logicalDeviceCount = a3;
}

- (void)setLocalizedModelName:(id)a3
{
}

- (void)setLinkAgent:(id)a3
{
}

- (void)setLastSupportedMessageType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lastSupportedMessageType = a3;
}

- (void)setLastKnownClusterType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lastKnownClusterType = a3;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isProxyGroupPlayer = a3;
}

- (void)setIsGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isGroupLeader = a3;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (void)setIsClusterLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isClusterLeader = a3;
}

- (void)setIsClusterAware:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isClusterAware = a3;
}

- (void)setIsAirplayActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isAirplayActive = a3;
}

- (void)setHasTightlySyncedGroup:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)setHasSupportsSystemPairing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)setHasSupportsSharedQueue:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setHasSupportsACL:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setHasSharedQueueVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setHasPreferredEncoding:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setHasLogicalDeviceCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setHasIsGroupLeader:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)setHasIsAirplayActive:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setHasConnected:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setHasAllowsPairing:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setGroupedDevices:(id)a3
{
}

- (void)setGroupUID:(id)a3
{
}

- (void)setGroupName:(id)a3
{
}

- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_groupContainsDiscoverableGroupLeader = a3;
}

- (void)setDeviceUID:(id)a3
{
}

- (void)setDeviceClass:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_deviceClass = a3;
}

- (void)setConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_connected = a3;
}

- (void)setConfiguredClusterSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_configuredClusterSize = a3;
}

- (void)setComputerName:(id)a3
{
}

- (void)setClusteredDevices:(id)a3
{
}

- (void)setClusterType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_clusterType = a3;
}

- (void)setClusterLeaderID:(id)a3
{
}

- (void)setClusterID:(id)a3
{
}

- (void)setBluetoothAddress:(id)a3
{
}

- (void)setApplicationBundleVersion:(id)a3
{
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (void)setAllowsPairing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_allowsPairing = a3;
}

- (void)setAllClusteredDevices:(id)a3
{
}

- (void)setAirplayReceivers:(id)a3
{
}

- (void)setAirPlayGroupID:(id)a3
{
}

- (void)setActiveSystemEndpointUID:(id)a3
{
}

- (NSString)senderDefaultGroupUID
{
  return self->_senderDefaultGroupUID;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (int)preferredEncoding
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_preferredEncoding;
  }
  else {
    return 0;
  }
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)managedConfigDeviceID
{
  return self->_managedConfigDeviceID;
}

- (unsigned)logicalDeviceCount
{
  return self->_logicalDeviceCount;
}

- (NSString)localizedModelName
{
  return self->_localizedModelName;
}

- (NSString)linkAgent
{
  return self->_linkAgent;
}

- (_MRDeviceInfoMessageProtobuf)leaderDeviceInfo
{
  return self->_leaderDeviceInfo;
}

- (unsigned)lastSupportedMessageType
{
  return self->_lastSupportedMessageType;
}

- (unsigned)lastKnownClusterType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_lastKnownClusterType;
  }
  else {
    return 2;
  }
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (BOOL)isGroupLeader
{
  return self->_isGroupLeader;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (BOOL)isClusterAware
{
  return self->_isClusterAware;
}

- (BOOL)isAirplayActive
{
  return self->_isAirplayActive;
}

- (BOOL)hasSupportsSystemPairing
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasSupportsSharedQueue
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasSupportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasSupportsExtendedMotion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasSupportsACL
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasSharedQueueVersion
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasProtocolVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasPreferredEncoding
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasIsProxyGroupPlayer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasIsGroupLeader
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasIsAirplayActive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasGroupContainsDiscoverableGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasConnected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasAllowsPairing
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (NSMutableArray)groupedDevices
{
  return self->_groupedDevices;
}

- (unint64_t)groupedDevicesCount
{
  return [(NSMutableArray *)self->_groupedDevices count];
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (_MRGroupSessionTokenProtobuf)groupSessionToken
{
  return self->_groupSessionToken;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return self->_groupContainsDiscoverableGroupLeader;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (int)deviceClass
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_deviceClass;
  }
  else {
    return -1;
  }
}

- (BOOL)connected
{
  return self->_connected;
}

- (unsigned)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (NSString)computerName
{
  return self->_computerName;
}

- (NSMutableArray)clusteredDevices
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

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)applicationBundleVersion
{
  return self->_applicationBundleVersion;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (BOOL)allowsPairing
{
  return self->_allowsPairing;
}

- (NSMutableArray)allClusteredDevices
{
  return self->_allClusteredDevices;
}

- (NSMutableArray)airplayReceivers
{
  return self->_airplayReceivers;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (NSString)activeSystemEndpointUID
{
  return self->_activeSystemEndpointUID;
}

- (void)setModelID:(id)a3
{
}

- (BOOL)readFrom:(id)a3
{
  return _MRDeviceInfoMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_tightSyncUID, 0);
  objc_storeStrong((id *)&self->_systemPodcastApplication, 0);
  objc_storeStrong((id *)&self->_systemMediaApplication, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemBooksApplication, 0);
  objc_storeStrong((id *)&self->_senderDefaultGroupUID, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_managedConfigDeviceID, 0);
  objc_storeStrong((id *)&self->_localizedModelName, 0);
  objc_storeStrong((id *)&self->_linkAgent, 0);
  objc_storeStrong((id *)&self->_leaderDeviceInfo, 0);
  objc_storeStrong((id *)&self->_groupedDevices, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_groupSessionToken, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_clusteredDevices, 0);
  objc_storeStrong((id *)&self->_clusterLeaderID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_applicationBundleVersion, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allClusteredDevices, 0);
  objc_storeStrong((id *)&self->_airplayReceivers, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);

  objc_storeStrong((id *)&self->_activeSystemEndpointUID, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_systemBuildVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationBundleVersion) {
    PBDataWriterWriteStringField();
  }
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_125;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_126:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
  if (self->_systemMediaApplication) {
    PBDataWriterWriteStringField();
  }
  $87FBF03E59C4EA3D4DF569759040E686 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $87FBF03E59C4EA3D4DF569759040E686 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v6 & 0x100000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
  if (self->_bluetoothAddress) {
    PBDataWriterWriteDataField();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_deviceUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_managedConfigDeviceID) {
    PBDataWriterWriteStringField();
  }
  $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_133;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteUint32Field();
  $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_133:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_37:
  }
    PBDataWriterWriteBOOLField();
LABEL_38:
  if (self->_tightSyncUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupName) {
    PBDataWriterWriteStringField();
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v8 = self->_groupedDevices;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v10);
  }

  $87FBF03E59C4EA3D4DF569759040E686 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $87FBF03E59C4EA3D4DF569759040E686 v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_systemPodcastApplication) {
    PBDataWriterWriteStringField();
  }
  if (self->_senderDefaultGroupUID) {
    PBDataWriterWriteStringField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v14 = self->_airplayReceivers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v16);
  }

  if (self->_linkAgent) {
    PBDataWriterWriteStringField();
  }
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_clusterLeaderID) {
    PBDataWriterWriteStringField();
  }
  $87FBF03E59C4EA3D4DF569759040E686 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    $87FBF03E59C4EA3D4DF569759040E686 v19 = self->_has;
  }
  if ((*(_WORD *)&v19 & 0x2000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_modelID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_routingContextID) {
    PBDataWriterWriteStringField();
  }
  if (self->_airPlayGroupID) {
    PBDataWriterWriteStringField();
  }
  if (self->_systemBooksApplication) {
    PBDataWriterWriteStringField();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v20 = self->_clusteredDevices;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v22);
  }

  $87FBF03E59C4EA3D4DF569759040E686 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $87FBF03E59C4EA3D4DF569759040E686 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x800) == 0)
    {
LABEL_95:
      if ((*(unsigned char *)&v25 & 0x10) == 0) {
        goto LABEL_97;
      }
      goto LABEL_96;
    }
  }
  else if ((*(_WORD *)&v25 & 0x800) == 0)
  {
    goto LABEL_95;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_96:
  }
    PBDataWriterWriteUint32Field();
LABEL_97:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v26 = self->_allClusteredDevices;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v28);
  }

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_computerName) {
    PBDataWriterWriteStringField();
  }
  $87FBF03E59C4EA3D4DF569759040E686 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $87FBF03E59C4EA3D4DF569759040E686 v31 = self->_has;
  }
  if ((*(unsigned char *)&v31 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_groupSessionToken) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_leaderDeviceInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_activeSystemEndpointUID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLocalizedModelName
{
  return self->_localizedModelName != 0;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasApplicationBundleIdentifier
{
  return self->_applicationBundleIdentifier != 0;
}

- (BOOL)hasApplicationBundleVersion
{
  return self->_applicationBundleVersion != 0;
}

- (void)setHasLastSupportedMessageType:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLastSupportedMessageType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasSystemMediaApplication
{
  return self->_systemMediaApplication != 0;
}

- (BOOL)hasBluetoothAddress
{
  return self->_bluetoothAddress != 0;
}

- (BOOL)hasDeviceUID
{
  return self->_deviceUID != 0;
}

- (BOOL)hasManagedConfigDeviceID
{
  return self->_managedConfigDeviceID != 0;
}

- (id)deviceClassAsString:(int)a3
{
  int v3 = a3 + 1;
  if (a3 + 1) < 0xF && ((0x7FFDu >> v3))
  {
    id v4 = off_1E57D7910[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)StringAsDeviceClass:(id)a3
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

- (BOOL)hasLogicalDeviceCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasTightSyncUID
{
  return self->_tightSyncUID != 0;
}

- (BOOL)hasGroupUID
{
  return self->_groupUID != 0;
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)clearGroupedDevices
{
}

- (void)addGroupedDevices:(id)a3
{
  id v4 = a3;
  groupedDevices = self->_groupedDevices;
  id v8 = v4;
  if (!groupedDevices)
  {
    $87FBF03E59C4EA3D4DF569759040E686 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_groupedDevices;
    self->_groupedDevices = v6;

    id v4 = v8;
    groupedDevices = self->_groupedDevices;
  }
  [(NSMutableArray *)groupedDevices addObject:v4];
}

- (id)groupedDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groupedDevices objectAtIndex:a3];
}

+ (Class)groupedDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSystemPodcastApplication
{
  return self->_systemPodcastApplication != 0;
}

- (BOOL)hasSenderDefaultGroupUID
{
  return self->_senderDefaultGroupUID != 0;
}

- (void)clearAirplayReceivers
{
}

- (void)addAirplayReceivers:(id)a3
{
  id v4 = a3;
  airplayReceivers = self->_airplayReceivers;
  id v8 = v4;
  if (!airplayReceivers)
  {
    $87FBF03E59C4EA3D4DF569759040E686 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_airplayReceivers;
    self->_airplayReceivers = v6;

    id v4 = v8;
    airplayReceivers = self->_airplayReceivers;
  }
  [(NSMutableArray *)airplayReceivers addObject:v4];
}

- (unint64_t)airplayReceiversCount
{
  return [(NSMutableArray *)self->_airplayReceivers count];
}

- (id)airplayReceiversAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_airplayReceivers objectAtIndex:a3];
}

+ (Class)airplayReceiversType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLinkAgent
{
  return self->_linkAgent != 0;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasClusterLeaderID
{
  return self->_clusterLeaderID != 0;
}

- (void)setHasClusterType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasClusterType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIsClusterAware:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsClusterAware
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
}

- (BOOL)hasRoutingContextID
{
  return self->_routingContextID != 0;
}

- (BOOL)hasAirPlayGroupID
{
  return self->_airPlayGroupID != 0;
}

- (BOOL)hasSystemBooksApplication
{
  return self->_systemBooksApplication != 0;
}

- (void)clearClusteredDevices
{
}

- (void)addClusteredDevices:(id)a3
{
  id v4 = a3;
  clusteredDevices = self->_clusteredDevices;
  id v8 = v4;
  if (!clusteredDevices)
  {
    $87FBF03E59C4EA3D4DF569759040E686 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_clusteredDevices;
    self->_clusteredDevices = v6;

    id v4 = v8;
    clusteredDevices = self->_clusteredDevices;
  }
  [(NSMutableArray *)clusteredDevices addObject:v4];
}

- (unint64_t)clusteredDevicesCount
{
  return [(NSMutableArray *)self->_clusteredDevices count];
}

- (id)clusteredDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusteredDevices objectAtIndex:a3];
}

+ (Class)clusteredDevicesType
{
  return (Class)objc_opt_class();
}

- (void)setHasLastKnownClusterType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLastKnownClusterType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearAllClusteredDevices
{
}

- (void)addAllClusteredDevices:(id)a3
{
  id v4 = a3;
  allClusteredDevices = self->_allClusteredDevices;
  id v8 = v4;
  if (!allClusteredDevices)
  {
    $87FBF03E59C4EA3D4DF569759040E686 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_allClusteredDevices;
    self->_allClusteredDevices = v6;

    id v4 = v8;
    allClusteredDevices = self->_allClusteredDevices;
  }
  [(NSMutableArray *)allClusteredDevices addObject:v4];
}

- (unint64_t)allClusteredDevicesCount
{
  return [(NSMutableArray *)self->_allClusteredDevices count];
}

- (id)allClusteredDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allClusteredDevices objectAtIndex:a3];
}

+ (Class)allClusteredDevicesType
{
  return (Class)objc_opt_class();
}

- (void)setHasSupportsOutputContextSync:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsOutputContextSync
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasComputerName
{
  return self->_computerName != 0;
}

- (void)setHasConfiguredClusterSize:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConfiguredClusterSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)preferredEncodingAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"JSON";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"Default";
  }
  return v4;
}

- (int)StringAsPreferredEncoding:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"JSON"];
  }

  return v4;
}

- (BOOL)hasGroupSessionToken
{
  return self->_groupSessionToken != 0;
}

- (BOOL)hasLeaderDeviceInfo
{
  return self->_leaderDeviceInfo != 0;
}

- (void)setHasIsClusterLeader:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$87FBF03E59C4EA3D4DF569759040E686 has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsClusterLeader
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasActiveSystemEndpointUID
{
  return self->_activeSystemEndpointUID != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRDeviceInfoMessageProtobuf;
  int v4 = [(_MRDeviceInfoMessageProtobuf *)&v8 description];
  v5 = [(_MRDeviceInfoMessageProtobuf *)self dictionaryRepresentation];
  $87FBF03E59C4EA3D4DF569759040E686 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  localizedModelName = self->_localizedModelName;
  if (localizedModelName) {
    [v4 setObject:localizedModelName forKey:@"localizedModelName"];
  }
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion) {
    [v4 setObject:systemBuildVersion forKey:@"systemBuildVersion"];
  }
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier) {
    [v4 setObject:applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
  }
  applicationBundleVersion = self->_applicationBundleVersion;
  if (applicationBundleVersion) {
    [v4 setObject:applicationBundleVersion forKey:@"applicationBundleVersion"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v71 = [NSNumber numberWithUnsignedLongLong:self->_protocolVersion];
    [v4 setObject:v71 forKey:@"protocolVersion"];

    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_117;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  v72 = [NSNumber numberWithUnsignedInt:self->_lastSupportedMessageType];
  [v4 setObject:v72 forKey:@"lastSupportedMessageType"];

  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_118;
  }
LABEL_117:
  v73 = [NSNumber numberWithBool:self->_supportsSystemPairing];
  [v4 setObject:v73 forKey:@"supportsSystemPairing"];

  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_118:
  v74 = [NSNumber numberWithBool:self->_allowsPairing];
  [v4 setObject:v74 forKey:@"allowsPairing"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    uint64_t v12 = [NSNumber numberWithBool:self->_connected];
    [v4 setObject:v12 forKey:@"connected"];
  }
LABEL_19:
  systemMediaApplication = self->_systemMediaApplication;
  if (systemMediaApplication) {
    [v4 setObject:systemMediaApplication forKey:@"systemMediaApplication"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    v75 = [NSNumber numberWithBool:self->_supportsACL];
    [v4 setObject:v75 forKey:@"supportsACL"];

    $87FBF03E59C4EA3D4DF569759040E686 v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v14 & 0x100000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  v76 = [NSNumber numberWithBool:self->_supportsSharedQueue];
  [v4 setObject:v76 forKey:@"supportsSharedQueue"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    uint64_t v15 = [NSNumber numberWithBool:self->_supportsExtendedMotion];
    [v4 setObject:v15 forKey:@"supportsExtendedMotion"];
  }
LABEL_25:
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress) {
    [v4 setObject:bluetoothAddress forKey:@"bluetoothAddress"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_sharedQueueVersion];
    [v4 setObject:v17 forKey:@"sharedQueueVersion"];
  }
  deviceUID = self->_deviceUID;
  if (deviceUID) {
    [v4 setObject:deviceUID forKey:@"deviceUID"];
  }
  managedConfigDeviceID = self->_managedConfigDeviceID;
  if (managedConfigDeviceID) {
    [v4 setObject:managedConfigDeviceID forKey:@"managedConfigDeviceID"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 8) != 0)
  {
    unsigned int v77 = self->_deviceClass + 1;
    if (v77 < 0xF && ((0x7FFDu >> v77) & 1) != 0)
    {
      v78 = off_1E57D7910[v77];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceClass);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v78 forKey:@"deviceClass"];

    $87FBF03E59C4EA3D4DF569759040E686 v20 = self->_has;
    if ((*(unsigned char *)&v20 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v20 & 0x2000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_146;
    }
  }
  else if ((*(unsigned char *)&v20 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  v90 = [NSNumber numberWithUnsignedInt:self->_logicalDeviceCount];
  [v4 setObject:v90 forKey:@"logicalDeviceCount"];

  $87FBF03E59C4EA3D4DF569759040E686 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v20 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_146:
  v91 = [NSNumber numberWithBool:self->_tightlySyncedGroup];
  [v4 setObject:v91 forKey:@"tightlySyncedGroup"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    uint64_t v21 = [NSNumber numberWithBool:self->_isProxyGroupPlayer];
    [v4 setObject:v21 forKey:@"isProxyGroupPlayer"];
  }
LABEL_38:
  tightSyncUID = self->_tightSyncUID;
  if (tightSyncUID) {
    [v4 setObject:tightSyncUID forKey:@"tightSyncUID"];
  }
  groupUID = self->_groupUID;
  if (groupUID) {
    [v4 setObject:groupUID forKey:@"groupUID"];
  }
  groupName = self->_groupName;
  if (groupName) {
    [v4 setObject:groupName forKey:@"groupName"];
  }
  if ([(NSMutableArray *)self->_groupedDevices count])
  {
    $87FBF03E59C4EA3D4DF569759040E686 v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_groupedDevices, "count"));
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v26 = self->_groupedDevices;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v100 objects:v106 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v101;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v101 != v29) {
            objc_enumerationMutation(v26);
          }
          $87FBF03E59C4EA3D4DF569759040E686 v31 = [*(id *)(*((void *)&v100 + 1) + 8 * i) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v100 objects:v106 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"groupedDevices"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000) != 0)
  {
    long long v33 = [NSNumber numberWithBool:self->_isGroupLeader];
    [v4 setObject:v33 forKey:@"isGroupLeader"];

    $87FBF03E59C4EA3D4DF569759040E686 v32 = self->_has;
  }
  if ((*(_WORD *)&v32 & 0x1000) != 0)
  {
    long long v34 = [NSNumber numberWithBool:self->_isAirplayActive];
    [v4 setObject:v34 forKey:@"isAirplayActive"];
  }
  systemPodcastApplication = self->_systemPodcastApplication;
  if (systemPodcastApplication) {
    [v4 setObject:systemPodcastApplication forKey:@"systemPodcastApplication"];
  }
  senderDefaultGroupUID = self->_senderDefaultGroupUID;
  if (senderDefaultGroupUID) {
    [v4 setObject:senderDefaultGroupUID forKey:@"senderDefaultGroupUID"];
  }
  airplayReceivers = self->_airplayReceivers;
  if (airplayReceivers) {
    [v4 setObject:airplayReceivers forKey:@"airplayReceivers"];
  }
  linkAgent = self->_linkAgent;
  if (linkAgent) {
    [v4 setObject:linkAgent forKey:@"linkAgent"];
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v4 setObject:clusterID forKey:@"clusterID"];
  }
  clusterLeaderID = self->_clusterLeaderID;
  if (clusterLeaderID) {
    [v4 setObject:clusterLeaderID forKey:@"clusterLeaderID"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  if ((*(unsigned char *)&v41 & 2) != 0)
  {
    long long v42 = [NSNumber numberWithUnsignedInt:self->_clusterType];
    [v4 setObject:v42 forKey:@"clusterType"];

    $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  }
  if ((*(_WORD *)&v41 & 0x2000) != 0)
  {
    long long v43 = [NSNumber numberWithBool:self->_isClusterAware];
    [v4 setObject:v43 forKey:@"isClusterAware"];
  }
  modelID = self->_modelID;
  if (modelID) {
    [v4 setObject:modelID forKey:@"modelID"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    long long v45 = [NSNumber numberWithBool:self->_supportsMultiplayer];
    [v4 setObject:v45 forKey:@"supportsMultiplayer"];
  }
  routingContextID = self->_routingContextID;
  if (routingContextID) {
    [v4 setObject:routingContextID forKey:@"routingContextID"];
  }
  airPlayGroupID = self->_airPlayGroupID;
  if (airPlayGroupID) {
    [v4 setObject:airPlayGroupID forKey:@"airPlayGroupID"];
  }
  systemBooksApplication = self->_systemBooksApplication;
  if (systemBooksApplication) {
    [v4 setObject:systemBooksApplication forKey:@"systemBooksApplication"];
  }
  if ([(NSMutableArray *)self->_clusteredDevices count])
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clusteredDevices, "count"));
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v50 = self->_clusteredDevices;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v97 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v96 + 1) + 8 * j) dictionaryRepresentation];
          [v49 addObject:v55];
        }
        uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v52);
    }

    [v4 setObject:v49 forKey:@"clusteredDevices"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    v79 = [NSNumber numberWithBool:self->_parentGroupContainsDiscoverableGroupLeader];
    [v4 setObject:v79 forKey:@"parentGroupContainsDiscoverableGroupLeader"];

    $87FBF03E59C4EA3D4DF569759040E686 v56 = self->_has;
    if ((*(_WORD *)&v56 & 0x800) == 0)
    {
LABEL_94:
      if ((*(unsigned char *)&v56 & 0x10) == 0) {
        goto LABEL_96;
      }
      goto LABEL_95;
    }
  }
  else if ((*(_WORD *)&v56 & 0x800) == 0)
  {
    goto LABEL_94;
  }
  v80 = [NSNumber numberWithBool:self->_groupContainsDiscoverableGroupLeader];
  [v4 setObject:v80 forKey:@"groupContainsDiscoverableGroupLeader"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_95:
    v57 = [NSNumber numberWithUnsignedInt:self->_lastKnownClusterType];
    [v4 setObject:v57 forKey:@"lastKnownClusterType"];
  }
LABEL_96:
  if ([(NSMutableArray *)self->_allClusteredDevices count])
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_allClusteredDevices, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v59 = self->_allClusteredDevices;
    uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v93;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v93 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = [*(id *)(*((void *)&v92 + 1) + 8 * k) dictionaryRepresentation];
          [v58 addObject:v64];
        }
        uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v61);
    }

    [v4 setObject:v58 forKey:@"allClusteredDevices"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    v65 = [NSNumber numberWithBool:self->_supportsOutputContextSync];
    [v4 setObject:v65 forKey:@"supportsOutputContextSync"];
  }
  computerName = self->_computerName;
  if (computerName) {
    [v4 setObject:computerName forKey:@"computerName"];
  }
  $87FBF03E59C4EA3D4DF569759040E686 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 4) != 0)
  {
    v68 = [NSNumber numberWithUnsignedInt:self->_configuredClusterSize];
    [v4 setObject:v68 forKey:@"configuredClusterSize"];

    $87FBF03E59C4EA3D4DF569759040E686 v67 = self->_has;
  }
  if ((*(unsigned char *)&v67 & 0x80) != 0)
  {
    int preferredEncoding = self->_preferredEncoding;
    if (preferredEncoding)
    {
      if (preferredEncoding == 1)
      {
        v70 = @"JSON";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_preferredEncoding);
        v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v70 = @"Default";
    }
    [v4 setObject:v70 forKey:@"preferredEncoding"];
  }
  groupSessionToken = self->_groupSessionToken;
  if (groupSessionToken)
  {
    v82 = [(_MRGroupSessionTokenProtobuf *)groupSessionToken dictionaryRepresentation];
    [v4 setObject:v82 forKey:@"groupSessionToken"];
  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  if (leaderDeviceInfo)
  {
    v84 = [(_MRDeviceInfoMessageProtobuf *)leaderDeviceInfo dictionaryRepresentation];
    [v4 setObject:v84 forKey:@"leaderDeviceInfo"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v85 = [NSNumber numberWithBool:self->_isClusterLeader];
    [v4 setObject:v85 forKey:@"isClusterLeader"];
  }
  activeSystemEndpointUID = self->_activeSystemEndpointUID;
  if (activeSystemEndpointUID) {
    [v4 setObject:activeSystemEndpointUID forKey:@"activeSystemEndpointUID"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    v87 = [NSNumber numberWithBool:self->_isEligibleForHostingGroupSessionExcludingAcknowledgements];
    [v4 setObject:v87 forKey:@"isEligibleForHostingGroupSessionExcludingAcknowledgements"];
  }
  id v88 = v4;

  return v88;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v30 = v4;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "setUniqueIdentifier:");
    id v4 = v30;
  }
  if (self->_name)
  {
    objc_msgSend(v30, "setName:");
    id v4 = v30;
  }
  if (self->_localizedModelName)
  {
    objc_msgSend(v30, "setLocalizedModelName:");
    id v4 = v30;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v30, "setSystemBuildVersion:");
    id v4 = v30;
  }
  if (self->_applicationBundleIdentifier)
  {
    objc_msgSend(v30, "setApplicationBundleIdentifier:");
    id v4 = v30;
  }
  if (self->_applicationBundleVersion)
  {
    objc_msgSend(v30, "setApplicationBundleVersion:");
    id v4 = v30;
  }
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)v4 + 1) = self->_protocolVersion;
    *((_DWORD *)v4 + 81) |= 1u;
    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_115;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 41) = self->_lastSupportedMessageType;
  *((_DWORD *)v4 + 81) |= 0x20u;
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((unsigned char *)v4 + 319) = self->_supportsSystemPairing;
  *((_DWORD *)v4 + 81) |= 0x1000000u;
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_116:
  *((unsigned char *)v4 + 304) = self->_allowsPairing;
  *((_DWORD *)v4 + 81) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    *((unsigned char *)v4 + 305) = self->_connected;
    *((_DWORD *)v4 + 81) |= 0x400u;
  }
LABEL_19:
  if (self->_systemMediaApplication)
  {
    objc_msgSend(v30, "setSystemMediaApplication:");
    id v4 = v30;
  }
  $87FBF03E59C4EA3D4DF569759040E686 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((unsigned char *)v4 + 314) = self->_supportsACL;
    *((_DWORD *)v4 + 81) |= 0x80000u;
    $87FBF03E59C4EA3D4DF569759040E686 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v6 & 0x100000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  *((unsigned char *)v4 + 318) = self->_supportsSharedQueue;
  *((_DWORD *)v4 + 81) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    *((unsigned char *)v4 + 315) = self->_supportsExtendedMotion;
    *((_DWORD *)v4 + 81) |= 0x100000u;
  }
LABEL_25:
  if (self->_bluetoothAddress)
  {
    objc_msgSend(v30, "setBluetoothAddress:");
    id v4 = v30;
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    *((_DWORD *)v4 + 62) = self->_sharedQueueVersion;
    *((_DWORD *)v4 + 81) |= 0x100u;
  }
  if (self->_deviceUID)
  {
    objc_msgSend(v30, "setDeviceUID:");
    id v4 = v30;
  }
  if (self->_managedConfigDeviceID)
  {
    objc_msgSend(v30, "setManagedConfigDeviceID:");
    id v4 = v30;
  }
  $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_deviceClass;
    *((_DWORD *)v4 + 81) |= 8u;
    $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_123;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v4 + 48) = self->_logicalDeviceCount;
  *((_DWORD *)v4 + 81) |= 0x40u;
  $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_123:
  *((unsigned char *)v4 + 320) = self->_tightlySyncedGroup;
  *((_DWORD *)v4 + 81) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    *((unsigned char *)v4 + 312) = self->_isProxyGroupPlayer;
    *((_DWORD *)v4 + 81) |= 0x20000u;
  }
LABEL_38:
  if (self->_tightSyncUID) {
    objc_msgSend(v30, "setTightSyncUID:");
  }
  if (self->_groupUID) {
    objc_msgSend(v30, "setGroupUID:");
  }
  if (self->_groupName) {
    objc_msgSend(v30, "setGroupName:");
  }
  if ([(_MRDeviceInfoMessageProtobuf *)self groupedDevicesCount])
  {
    [v30 clearGroupedDevices];
    unint64_t v8 = [(_MRDeviceInfoMessageProtobuf *)self groupedDevicesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [(_MRDeviceInfoMessageProtobuf *)self groupedDevicesAtIndex:i];
        [v30 addGroupedDevices:v11];
      }
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    *((unsigned char *)v30 + 311) = self->_isGroupLeader;
    *((_DWORD *)v30 + 81) |= 0x10000u;
    $87FBF03E59C4EA3D4DF569759040E686 v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    *((unsigned char *)v30 + 307) = self->_isAirplayActive;
    *((_DWORD *)v30 + 81) |= 0x1000u;
  }
  if (self->_systemPodcastApplication) {
    objc_msgSend(v30, "setSystemPodcastApplication:");
  }
  if (self->_senderDefaultGroupUID) {
    objc_msgSend(v30, "setSenderDefaultGroupUID:");
  }
  if ([(_MRDeviceInfoMessageProtobuf *)self airplayReceiversCount])
  {
    [v30 clearAirplayReceivers];
    unint64_t v13 = [(_MRDeviceInfoMessageProtobuf *)self airplayReceiversCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t j = 0; j != v14; ++j)
      {
        uint64_t v16 = [(_MRDeviceInfoMessageProtobuf *)self airplayReceiversAtIndex:j];
        [v30 addAirplayReceivers:v16];
      }
    }
  }
  if (self->_linkAgent) {
    objc_msgSend(v30, "setLinkAgent:");
  }
  uint64_t v17 = v30;
  if (self->_clusterID)
  {
    objc_msgSend(v30, "setClusterID:");
    uint64_t v17 = v30;
  }
  if (self->_clusterLeaderID)
  {
    objc_msgSend(v30, "setClusterLeaderID:");
    uint64_t v17 = v30;
  }
  $87FBF03E59C4EA3D4DF569759040E686 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 2) != 0)
  {
    v17[22] = self->_clusterType;
    v17[81] |= 2u;
    $87FBF03E59C4EA3D4DF569759040E686 v18 = self->_has;
  }
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    *((unsigned char *)v17 + 308) = self->_isClusterAware;
    v17[81] |= 0x2000u;
  }
  if (self->_modelID)
  {
    objc_msgSend(v30, "setModelID:");
    uint64_t v17 = v30;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *((unsigned char *)v17 + 316) = self->_supportsMultiplayer;
    v17[81] |= 0x200000u;
  }
  if (self->_routingContextID) {
    objc_msgSend(v30, "setRoutingContextID:");
  }
  if (self->_airPlayGroupID) {
    objc_msgSend(v30, "setAirPlayGroupID:");
  }
  if (self->_systemBooksApplication) {
    objc_msgSend(v30, "setSystemBooksApplication:");
  }
  if ([(_MRDeviceInfoMessageProtobuf *)self clusteredDevicesCount])
  {
    [v30 clearClusteredDevices];
    unint64_t v19 = [(_MRDeviceInfoMessageProtobuf *)self clusteredDevicesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t k = 0; k != v20; ++k)
      {
        uint64_t v22 = [(_MRDeviceInfoMessageProtobuf *)self clusteredDevicesAtIndex:k];
        [v30 addClusteredDevices:v22];
      }
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000) == 0)
  {
    if ((*(_WORD *)&v23 & 0x800) == 0) {
      goto LABEL_86;
    }
LABEL_126:
    *((unsigned char *)v30 + 306) = self->_groupContainsDiscoverableGroupLeader;
    *((_DWORD *)v30 + 81) |= 0x800u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
  *((unsigned char *)v30 + 313) = self->_parentGroupContainsDiscoverableGroupLeader;
  *((_DWORD *)v30 + 81) |= 0x40000u;
  $87FBF03E59C4EA3D4DF569759040E686 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) != 0) {
    goto LABEL_126;
  }
LABEL_86:
  if ((*(unsigned char *)&v23 & 0x10) != 0)
  {
LABEL_87:
    *((_DWORD *)v30 + 40) = self->_lastKnownClusterType;
    *((_DWORD *)v30 + 81) |= 0x10u;
  }
LABEL_88:
  if ([(_MRDeviceInfoMessageProtobuf *)self allClusteredDevicesCount])
  {
    [v30 clearAllClusteredDevices];
    unint64_t v24 = [(_MRDeviceInfoMessageProtobuf *)self allClusteredDevicesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t m = 0; m != v25; ++m)
      {
        uint64_t v27 = [(_MRDeviceInfoMessageProtobuf *)self allClusteredDevicesAtIndex:m];
        [v30 addAllClusteredDevices:v27];
      }
    }
  }
  uint64_t v28 = v30;
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *((unsigned char *)v30 + 317) = self->_supportsOutputContextSync;
    *((_DWORD *)v30 + 81) |= 0x400000u;
  }
  if (self->_computerName)
  {
    objc_msgSend(v30, "setComputerName:");
    uint64_t v28 = v30;
  }
  $87FBF03E59C4EA3D4DF569759040E686 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
    v28[28] = self->_configuredClusterSize;
    v28[81] |= 4u;
    $87FBF03E59C4EA3D4DF569759040E686 v29 = self->_has;
  }
  if ((*(unsigned char *)&v29 & 0x80) != 0)
  {
    v28[56] = self->_preferredEncoding;
    v28[81] |= 0x80u;
  }
  if (self->_groupSessionToken)
  {
    objc_msgSend(v30, "setGroupSessionToken:");
    uint64_t v28 = v30;
  }
  if (self->_leaderDeviceInfo)
  {
    objc_msgSend(v30, "setLeaderDeviceInfo:");
    uint64_t v28 = v30;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((unsigned char *)v28 + 309) = self->_isClusterLeader;
    v28[81] |= 0x4000u;
  }
  if (self->_activeSystemEndpointUID)
  {
    objc_msgSend(v30, "setActiveSystemEndpointUID:");
    uint64_t v28 = v30;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v28 + 310) = self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
    v28[81] |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  $87FBF03E59C4EA3D4DF569759040E686 v7 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v8;

  uint64_t v10 = [(NSString *)self->_localizedModelName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v10;

  uint64_t v12 = [(NSString *)self->_systemBuildVersion copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v12;

  uint64_t v14 = [(NSString *)self->_applicationBundleIdentifier copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_applicationBundleVersion copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_protocolVersion;
    *(_DWORD *)(v5 + 324) |= 1u;
    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 164) = self->_lastSupportedMessageType;
  *(_DWORD *)(v5 + 324) |= 0x20u;
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(unsigned char *)(v5 + 319) = self->_supportsSystemPairing;
  *(_DWORD *)(v5 + 324) |= 0x1000000u;
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_74:
  *(unsigned char *)(v5 + 304) = self->_allowsPairing;
  *(_DWORD *)(v5 + 324) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 305) = self->_connected;
    *(_DWORD *)(v5 + 324) |= 0x400u;
  }
LABEL_7:
  uint64_t v19 = [(NSString *)self->_systemMediaApplication copyWithZone:a3];
  unint64_t v20 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v19;

  $87FBF03E59C4EA3D4DF569759040E686 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    *(unsigned char *)(v5 + 314) = self->_supportsACL;
    *(_DWORD *)(v5 + 324) |= 0x80000u;
    $87FBF03E59C4EA3D4DF569759040E686 v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x800000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v21 & 0x100000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
    goto LABEL_9;
  }
  *(unsigned char *)(v5 + 318) = self->_supportsSharedQueue;
  *(_DWORD *)(v5 + 324) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 315) = self->_supportsExtendedMotion;
    *(_DWORD *)(v5 + 324) |= 0x100000u;
  }
LABEL_11:
  uint64_t v22 = [(NSData *)self->_bluetoothAddress copyWithZone:a3];
  $87FBF03E59C4EA3D4DF569759040E686 v23 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v22;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v5 + 248) = self->_sharedQueueVersion;
    *(_DWORD *)(v5 + 324) |= 0x100u;
  }
  uint64_t v24 = [(NSString *)self->_deviceUID copyWithZone:a3];
  unint64_t v25 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v24;

  uint64_t v26 = [(NSString *)self->_managedConfigDeviceID copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v26;

  $87FBF03E59C4EA3D4DF569759040E686 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_deviceClass;
    *(_DWORD *)(v5 + 324) |= 8u;
    $87FBF03E59C4EA3D4DF569759040E686 v28 = self->_has;
    if ((*(unsigned char *)&v28 & 0x40) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&v28 & 0x2000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_81;
    }
  }
  else if ((*(unsigned char *)&v28 & 0x40) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 192) = self->_logicalDeviceCount;
  *(_DWORD *)(v5 + 324) |= 0x40u;
  $87FBF03E59C4EA3D4DF569759040E686 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x2000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v28 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_81:
  *(unsigned char *)(v5 + 320) = self->_tightlySyncedGroup;
  *(_DWORD *)(v5 + 324) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_17:
    *(unsigned char *)(v5 + 312) = self->_isProxyGroupPlayer;
    *(_DWORD *)(v5 + 324) |= 0x20000u;
  }
LABEL_18:
  uint64_t v29 = [(NSString *)self->_tightSyncUID copyWithZone:a3];
  id v30 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v29;

  uint64_t v31 = [(NSString *)self->_groupUID copyWithZone:a3];
  $87FBF03E59C4EA3D4DF569759040E686 v32 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v31;

  uint64_t v33 = [(NSString *)self->_groupName copyWithZone:a3];
  long long v34 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v33;

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v35 = self->_groupedDevices;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v104;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v104 != v38) {
          objc_enumerationMutation(v35);
        }
        long long v40 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * v39) copyWithZone:a3];
        [(id)v5 addGroupedDevices:v40];

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v103 objects:v110 count:16];
    }
    while (v37);
  }

  $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x10000) != 0)
  {
    *(unsigned char *)(v5 + 311) = self->_isGroupLeader;
    *(_DWORD *)(v5 + 324) |= 0x10000u;
    $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  }
  if ((*(_WORD *)&v41 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 307) = self->_isAirplayActive;
    *(_DWORD *)(v5 + 324) |= 0x1000u;
  }
  uint64_t v42 = [(NSString *)self->_systemPodcastApplication copyWithZone:a3];
  long long v43 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v42;

  uint64_t v44 = [(NSString *)self->_senderDefaultGroupUID copyWithZone:a3];
  long long v45 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v44;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v46 = self->_airplayReceivers;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v100;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v100 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * v50) copyWithZone:a3];
        [(id)v5 addAirplayReceivers:v51];

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v48);
  }

  uint64_t v52 = [(NSString *)self->_linkAgent copyWithZone:a3];
  uint64_t v53 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v52;

  uint64_t v54 = [(NSString *)self->_clusterID copyWithZone:a3];
  v55 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v54;

  uint64_t v56 = [(NSString *)self->_clusterLeaderID copyWithZone:a3];
  v57 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v56;

  $87FBF03E59C4EA3D4DF569759040E686 v58 = self->_has;
  if ((*(unsigned char *)&v58 & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_clusterType;
    *(_DWORD *)(v5 + 324) |= 2u;
    $87FBF03E59C4EA3D4DF569759040E686 v58 = self->_has;
  }
  if ((*(_WORD *)&v58 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 308) = self->_isClusterAware;
    *(_DWORD *)(v5 + 324) |= 0x2000u;
  }
  uint64_t v59 = [(NSString *)self->_modelID copyWithZone:a3];
  uint64_t v60 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v59;

  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 316) = self->_supportsMultiplayer;
    *(_DWORD *)(v5 + 324) |= 0x200000u;
  }
  uint64_t v61 = [(NSString *)self->_routingContextID copyWithZone:a3];
  uint64_t v62 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v61;

  uint64_t v63 = [(NSString *)self->_airPlayGroupID copyWithZone:a3];
  v64 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v63;

  uint64_t v65 = [(NSString *)self->_systemBooksApplication copyWithZone:a3];
  v66 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v65;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  $87FBF03E59C4EA3D4DF569759040E686 v67 = self->_clusteredDevices;
  uint64_t v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v96;
    do
    {
      uint64_t v71 = 0;
      do
      {
        if (*(void *)v96 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * v71) copyWithZone:a3];
        [(id)v5 addClusteredDevices:v72];

        ++v71;
      }
      while (v69 != v71);
      uint64_t v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v69);
  }

  $87FBF03E59C4EA3D4DF569759040E686 v73 = self->_has;
  if ((*(_DWORD *)&v73 & 0x40000) != 0)
  {
    *(unsigned char *)(v5 + 313) = self->_parentGroupContainsDiscoverableGroupLeader;
    *(_DWORD *)(v5 + 324) |= 0x40000u;
    $87FBF03E59C4EA3D4DF569759040E686 v73 = self->_has;
    if ((*(_WORD *)&v73 & 0x800) == 0)
    {
LABEL_51:
      if ((*(unsigned char *)&v73 & 0x10) == 0) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v73 & 0x800) == 0)
  {
    goto LABEL_51;
  }
  *(unsigned char *)(v5 + 306) = self->_groupContainsDiscoverableGroupLeader;
  *(_DWORD *)(v5 + 324) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_52:
    *(_DWORD *)(v5 + 160) = self->_lastKnownClusterType;
    *(_DWORD *)(v5 + 324) |= 0x10u;
  }
LABEL_53:
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v74 = self->_allClusteredDevices;
  uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v92;
    do
    {
      uint64_t v78 = 0;
      do
      {
        if (*(void *)v92 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * v78), "copyWithZone:", a3, (void)v91);
        [(id)v5 addAllClusteredDevices:v79];

        ++v78;
      }
      while (v76 != v78);
      uint64_t v76 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v76);
  }

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 317) = self->_supportsOutputContextSync;
    *(_DWORD *)(v5 + 324) |= 0x400000u;
  }
  uint64_t v80 = -[NSString copyWithZone:](self->_computerName, "copyWithZone:", a3, (void)v91);
  v81 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v80;

  $87FBF03E59C4EA3D4DF569759040E686 v82 = self->_has;
  if ((*(unsigned char *)&v82 & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_configuredClusterSize;
    *(_DWORD *)(v5 + 324) |= 4u;
    $87FBF03E59C4EA3D4DF569759040E686 v82 = self->_has;
  }
  if ((*(unsigned char *)&v82 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_preferredEncoding;
    *(_DWORD *)(v5 + 324) |= 0x80u;
  }
  id v83 = [(_MRGroupSessionTokenProtobuf *)self->_groupSessionToken copyWithZone:a3];
  v84 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v83;

  id v85 = [(_MRDeviceInfoMessageProtobuf *)self->_leaderDeviceInfo copyWithZone:a3];
  v86 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v85;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 309) = self->_isClusterLeader;
    *(_DWORD *)(v5 + 324) |= 0x4000u;
  }
  uint64_t v87 = [(NSString *)self->_activeSystemEndpointUID copyWithZone:a3];
  id v88 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v87;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 310) = self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
    *(_DWORD *)(v5 + 324) |= 0x8000u;
  }
  id v89 = (id)v5;

  return v89;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_244;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_244;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_244;
    }
  }
  localizedModelName = self->_localizedModelName;
  if ((unint64_t)localizedModelName | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](localizedModelName, "isEqual:")) {
      goto LABEL_244;
    }
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](systemBuildVersion, "isEqual:")) {
      goto LABEL_244;
    }
  }
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if ((unint64_t)applicationBundleIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifier, "isEqual:")) {
      goto LABEL_244;
    }
  }
  applicationBundleVersion = self->_applicationBundleVersion;
  if ((unint64_t)applicationBundleVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](applicationBundleVersion, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  int v12 = *((_DWORD *)v4 + 81);
  if (*(unsigned char *)&has)
  {
    if ((v12 & 1) == 0 || self->_protocolVersion != *((void *)v4 + 1)) {
      goto LABEL_244;
    }
  }
  else if (v12)
  {
    goto LABEL_244;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_lastSupportedMessageType != *((_DWORD *)v4 + 41)) {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsSystemPairing)
    {
      if (!*((unsigned char *)v4 + 319)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 319))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0) {
      goto LABEL_244;
    }
    if (self->_allowsPairing)
    {
      if (!*((unsigned char *)v4 + 304)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 304))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0) {
      goto LABEL_244;
    }
    if (self->_connected)
    {
      if (!*((unsigned char *)v4 + 305)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 305))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_244;
  }
  systemMediaApplication = self->_systemMediaApplication;
  if ((unint64_t)systemMediaApplication | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](systemMediaApplication, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  }
  int v14 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsACL)
    {
      if (!*((unsigned char *)v4 + 314)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 314))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsSharedQueue)
    {
      if (!*((unsigned char *)v4 + 318)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 318))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsExtendedMotion)
    {
      if (!*((unsigned char *)v4 + 315)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 315))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_244;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if ((unint64_t)bluetoothAddress | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](bluetoothAddress, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  }
  int v16 = *((_DWORD *)v4 + 81);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v16 & 0x100) == 0 || self->_sharedQueueVersion != *((_DWORD *)v4 + 62)) {
      goto LABEL_244;
    }
  }
  else if ((v16 & 0x100) != 0)
  {
    goto LABEL_244;
  }
  deviceUID = self->_deviceUID;
  if ((unint64_t)deviceUID | *((void *)v4 + 15) && !-[NSString isEqual:](deviceUID, "isEqual:")) {
    goto LABEL_244;
  }
  managedConfigDeviceID = self->_managedConfigDeviceID;
  if ((unint64_t)managedConfigDeviceID | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](managedConfigDeviceID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v19 = self->_has;
  int v20 = *((_DWORD *)v4 + 81);
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_deviceClass != *((_DWORD *)v4 + 29)) {
      goto LABEL_244;
    }
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_244;
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_logicalDeviceCount != *((_DWORD *)v4 + 48)) {
      goto LABEL_244;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&v19 & 0x2000000) != 0)
  {
    if ((v20 & 0x2000000) == 0) {
      goto LABEL_244;
    }
    if (self->_tightlySyncedGroup)
    {
      if (!*((unsigned char *)v4 + 320)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 320))
    {
      goto LABEL_244;
    }
  }
  else if ((v20 & 0x2000000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&v19 & 0x20000) != 0)
  {
    if ((v20 & 0x20000) == 0) {
      goto LABEL_244;
    }
    if (self->_isProxyGroupPlayer)
    {
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 312))
    {
      goto LABEL_244;
    }
  }
  else if ((v20 & 0x20000) != 0)
  {
    goto LABEL_244;
  }
  tightSyncUID = self->_tightSyncUID;
  if ((unint64_t)tightSyncUID | *((void *)v4 + 36)
    && !-[NSString isEqual:](tightSyncUID, "isEqual:"))
  {
    goto LABEL_244;
  }
  groupUID = self->_groupUID;
  if ((unint64_t)groupUID | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](groupUID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  groupName = self->_groupName;
  if ((unint64_t)groupName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](groupName, "isEqual:")) {
      goto LABEL_244;
    }
  }
  groupedDevices = self->_groupedDevices;
  if ((unint64_t)groupedDevices | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](groupedDevices, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v25 = self->_has;
  int v26 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0) {
      goto LABEL_244;
    }
    if (self->_isGroupLeader)
    {
      if (!*((unsigned char *)v4 + 311)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 311))
    {
      goto LABEL_244;
    }
  }
  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v25 & 0x1000) != 0)
  {
    if ((v26 & 0x1000) == 0) {
      goto LABEL_244;
    }
    if (self->_isAirplayActive)
    {
      if (!*((unsigned char *)v4 + 307)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 307))
    {
      goto LABEL_244;
    }
  }
  else if ((v26 & 0x1000) != 0)
  {
    goto LABEL_244;
  }
  systemPodcastApplication = self->_systemPodcastApplication;
  if ((unint64_t)systemPodcastApplication | *((void *)v4 + 35)
    && !-[NSString isEqual:](systemPodcastApplication, "isEqual:"))
  {
    goto LABEL_244;
  }
  senderDefaultGroupUID = self->_senderDefaultGroupUID;
  if ((unint64_t)senderDefaultGroupUID | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](senderDefaultGroupUID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  airplayReceivers = self->_airplayReceivers;
  if ((unint64_t)airplayReceivers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](airplayReceivers, "isEqual:")) {
      goto LABEL_244;
    }
  }
  linkAgent = self->_linkAgent;
  if ((unint64_t)linkAgent | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](linkAgent, "isEqual:")) {
      goto LABEL_244;
    }
  }
  clusterID = self->_clusterID;
  if ((unint64_t)clusterID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](clusterID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  clusterLeaderID = self->_clusterLeaderID;
  if ((unint64_t)clusterLeaderID | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](clusterLeaderID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v33 = self->_has;
  int v34 = *((_DWORD *)v4 + 81);
  if ((*(unsigned char *)&v33 & 2) != 0)
  {
    if ((v34 & 2) == 0 || self->_clusterType != *((_DWORD *)v4 + 22)) {
      goto LABEL_244;
    }
  }
  else if ((v34 & 2) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v33 & 0x2000) != 0)
  {
    if ((v34 & 0x2000) == 0) {
      goto LABEL_244;
    }
    if (self->_isClusterAware)
    {
      if (!*((unsigned char *)v4 + 308)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 308))
    {
      goto LABEL_244;
    }
  }
  else if ((v34 & 0x2000) != 0)
  {
    goto LABEL_244;
  }
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](modelID, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 v33 = self->_has;
  }
  int v36 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v33 & 0x200000) != 0)
  {
    if ((v36 & 0x200000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsMultiplayer)
    {
      if (!*((unsigned char *)v4 + 316)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 316))
    {
      goto LABEL_244;
    }
  }
  else if ((v36 & 0x200000) != 0)
  {
    goto LABEL_244;
  }
  routingContextID = self->_routingContextID;
  if ((unint64_t)routingContextID | *((void *)v4 + 29)
    && !-[NSString isEqual:](routingContextID, "isEqual:"))
  {
    goto LABEL_244;
  }
  airPlayGroupID = self->_airPlayGroupID;
  if ((unint64_t)airPlayGroupID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](airPlayGroupID, "isEqual:")) {
      goto LABEL_244;
    }
  }
  systemBooksApplication = self->_systemBooksApplication;
  if ((unint64_t)systemBooksApplication | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](systemBooksApplication, "isEqual:")) {
      goto LABEL_244;
    }
  }
  clusteredDevices = self->_clusteredDevices;
  if ((unint64_t)clusteredDevices | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](clusteredDevices, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  int v42 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    if ((v42 & 0x40000) == 0) {
      goto LABEL_244;
    }
    if (self->_parentGroupContainsDiscoverableGroupLeader)
    {
      if (!*((unsigned char *)v4 + 313)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 313))
    {
      goto LABEL_244;
    }
  }
  else if ((v42 & 0x40000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v41 & 0x800) != 0)
  {
    if ((v42 & 0x800) == 0) {
      goto LABEL_244;
    }
    if (self->_groupContainsDiscoverableGroupLeader)
    {
      if (!*((unsigned char *)v4 + 306)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 306))
    {
      goto LABEL_244;
    }
  }
  else if ((v42 & 0x800) != 0)
  {
    goto LABEL_244;
  }
  if ((*(unsigned char *)&v41 & 0x10) != 0)
  {
    if ((v42 & 0x10) == 0 || self->_lastKnownClusterType != *((_DWORD *)v4 + 40)) {
      goto LABEL_244;
    }
  }
  else if ((v42 & 0x10) != 0)
  {
    goto LABEL_244;
  }
  allClusteredDevices = self->_allClusteredDevices;
  if ((unint64_t)allClusteredDevices | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](allClusteredDevices, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  }
  int v44 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v41 & 0x400000) != 0)
  {
    if ((v44 & 0x400000) == 0) {
      goto LABEL_244;
    }
    if (self->_supportsOutputContextSync)
    {
      if (!*((unsigned char *)v4 + 317)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 317))
    {
      goto LABEL_244;
    }
  }
  else if ((v44 & 0x400000) != 0)
  {
    goto LABEL_244;
  }
  computerName = self->_computerName;
  if ((unint64_t)computerName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](computerName, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 v41 = self->_has;
  }
  int v46 = *((_DWORD *)v4 + 81);
  if ((*(unsigned char *)&v41 & 4) != 0)
  {
    if ((v46 & 4) == 0 || self->_configuredClusterSize != *((_DWORD *)v4 + 28)) {
      goto LABEL_244;
    }
  }
  else if ((v46 & 4) != 0)
  {
    goto LABEL_244;
  }
  if ((*(unsigned char *)&v41 & 0x80) != 0)
  {
    if ((v46 & 0x80) == 0 || self->_preferredEncoding != *((_DWORD *)v4 + 56)) {
      goto LABEL_244;
    }
  }
  else if ((v46 & 0x80) != 0)
  {
    goto LABEL_244;
  }
  groupSessionToken = self->_groupSessionToken;
  if ((unint64_t)groupSessionToken | *((void *)v4 + 17)
    && !-[_MRGroupSessionTokenProtobuf isEqual:](groupSessionToken, "isEqual:"))
  {
    goto LABEL_244;
  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  if ((unint64_t)leaderDeviceInfo | *((void *)v4 + 21))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](leaderDeviceInfo, "isEqual:")) {
      goto LABEL_244;
    }
  }
  $87FBF03E59C4EA3D4DF569759040E686 v49 = self->_has;
  int v50 = *((_DWORD *)v4 + 81);
  if ((*(_WORD *)&v49 & 0x4000) != 0)
  {
    if ((v50 & 0x4000) == 0) {
      goto LABEL_244;
    }
    if (self->_isClusterLeader)
    {
      if (!*((unsigned char *)v4 + 309)) {
        goto LABEL_244;
      }
    }
    else if (*((unsigned char *)v4 + 309))
    {
      goto LABEL_244;
    }
  }
  else if ((v50 & 0x4000) != 0)
  {
    goto LABEL_244;
  }
  activeSystemEndpointUID = self->_activeSystemEndpointUID;
  if ((unint64_t)activeSystemEndpointUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeSystemEndpointUID, "isEqual:")) {
      goto LABEL_244;
    }
    $87FBF03E59C4EA3D4DF569759040E686 v49 = self->_has;
  }
  if ((*(_WORD *)&v49 & 0x8000) != 0)
  {
    if ((*((_DWORD *)v4 + 81) & 0x8000) != 0)
    {
      if (self->_isEligibleForHostingGroupSessionExcludingAcknowledgements)
      {
        if (!*((unsigned char *)v4 + 310)) {
          goto LABEL_244;
        }
      }
      else if (*((unsigned char *)v4 + 310))
      {
        goto LABEL_244;
      }
      BOOL v52 = 1;
      goto LABEL_245;
    }
LABEL_244:
    BOOL v52 = 0;
    goto LABEL_245;
  }
  BOOL v52 = (*((_DWORD *)v4 + 81) & 0x8000) == 0;
LABEL_245:

  return v52;
}

- (unint64_t)hash
{
  NSUInteger v67 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v66 = [(NSString *)self->_name hash];
  NSUInteger v65 = [(NSString *)self->_localizedModelName hash];
  NSUInteger v64 = [(NSString *)self->_systemBuildVersion hash];
  NSUInteger v63 = [(NSString *)self->_applicationBundleIdentifier hash];
  NSUInteger v62 = [(NSString *)self->_applicationBundleVersion hash];
  $87FBF03E59C4EA3D4DF569759040E686 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v61 = 2654435761u * self->_protocolVersion;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v60 = 2654435761 * self->_lastSupportedMessageType;
      if ((*(_DWORD *)&has & 0x1000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v61 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v60 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    uint64_t v59 = 2654435761 * self->_supportsSystemPairing;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v58 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v59 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v58 = 2654435761 * self->_allowsPairing;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v57 = 2654435761 * self->_connected;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v57 = 0;
LABEL_12:
  NSUInteger v56 = [(NSString *)self->_systemMediaApplication hash];
  $87FBF03E59C4EA3D4DF569759040E686 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
  {
    uint64_t v55 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v54 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v55 = 2654435761 * self->_supportsACL;
  if ((*(_DWORD *)&v4 & 0x800000) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v54 = 2654435761 * self->_supportsSharedQueue;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_15:
    uint64_t v53 = 2654435761 * self->_supportsExtendedMotion;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v53 = 0;
LABEL_19:
  uint64_t v52 = [(NSData *)self->_bluetoothAddress hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v51 = 2654435761 * self->_sharedQueueVersion;
  }
  else {
    uint64_t v51 = 0;
  }
  NSUInteger v50 = [(NSString *)self->_deviceUID hash];
  NSUInteger v49 = [(NSString *)self->_managedConfigDeviceID hash];
  $87FBF03E59C4EA3D4DF569759040E686 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
    uint64_t v48 = 2654435761 * self->_deviceClass;
    if ((*(unsigned char *)&v5 & 0x40) != 0)
    {
LABEL_24:
      uint64_t v47 = 2654435761 * self->_logicalDeviceCount;
      if ((*(_DWORD *)&v5 & 0x2000000) != 0) {
        goto LABEL_25;
      }
LABEL_29:
      uint64_t v46 = 0;
      if ((*(_DWORD *)&v5 & 0x20000) != 0) {
        goto LABEL_26;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if ((*(unsigned char *)&v5 & 0x40) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v47 = 0;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
    goto LABEL_29;
  }
LABEL_25:
  uint64_t v46 = 2654435761 * self->_tightlySyncedGroup;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_26:
    uint64_t v45 = 2654435761 * self->_isProxyGroupPlayer;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v45 = 0;
LABEL_31:
  NSUInteger v44 = [(NSString *)self->_tightSyncUID hash];
  NSUInteger v43 = [(NSString *)self->_groupUID hash];
  NSUInteger v42 = [(NSString *)self->_groupName hash];
  uint64_t v41 = [(NSMutableArray *)self->_groupedDevices hash];
  $87FBF03E59C4EA3D4DF569759040E686 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    uint64_t v40 = 2654435761 * self->_isGroupLeader;
    if ((*(_WORD *)&v6 & 0x1000) != 0) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(_WORD *)&v6 & 0x1000) != 0)
    {
LABEL_33:
      uint64_t v39 = 2654435761 * self->_isAirplayActive;
      goto LABEL_36;
    }
  }
  uint64_t v39 = 0;
LABEL_36:
  NSUInteger v38 = [(NSString *)self->_systemPodcastApplication hash];
  NSUInteger v37 = [(NSString *)self->_senderDefaultGroupUID hash];
  uint64_t v36 = [(NSMutableArray *)self->_airplayReceivers hash];
  NSUInteger v35 = [(NSString *)self->_linkAgent hash];
  NSUInteger v34 = [(NSString *)self->_clusterID hash];
  NSUInteger v33 = [(NSString *)self->_clusterLeaderID hash];
  $87FBF03E59C4EA3D4DF569759040E686 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    uint64_t v32 = 2654435761 * self->_clusterType;
    if ((*(_WORD *)&v7 & 0x2000) != 0) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&v7 & 0x2000) != 0)
    {
LABEL_38:
      uint64_t v31 = 2654435761 * self->_isClusterAware;
      goto LABEL_41;
    }
  }
  uint64_t v31 = 0;
LABEL_41:
  NSUInteger v30 = [(NSString *)self->_modelID hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    uint64_t v29 = 2654435761 * self->_supportsMultiplayer;
  }
  else {
    uint64_t v29 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_routingContextID hash];
  NSUInteger v27 = [(NSString *)self->_airPlayGroupID hash];
  NSUInteger v26 = [(NSString *)self->_systemBooksApplication hash];
  uint64_t v25 = [(NSMutableArray *)self->_clusteredDevices hash];
  $87FBF03E59C4EA3D4DF569759040E686 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    uint64_t v24 = 0;
    if ((*(_WORD *)&v8 & 0x800) != 0) {
      goto LABEL_46;
    }
LABEL_49:
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v8 & 0x10) != 0) {
      goto LABEL_47;
    }
    goto LABEL_50;
  }
  uint64_t v24 = 2654435761 * self->_parentGroupContainsDiscoverableGroupLeader;
  if ((*(_WORD *)&v8 & 0x800) == 0) {
    goto LABEL_49;
  }
LABEL_46:
  uint64_t v23 = 2654435761 * self->_groupContainsDiscoverableGroupLeader;
  if ((*(unsigned char *)&v8 & 0x10) != 0)
  {
LABEL_47:
    uint64_t v22 = 2654435761 * self->_lastKnownClusterType;
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v22 = 0;
LABEL_51:
  uint64_t v20 = [(NSMutableArray *)self->_allClusteredDevices hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    uint64_t v9 = 2654435761 * self->_supportsOutputContextSync;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_computerName hash];
  $87FBF03E59C4EA3D4DF569759040E686 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    uint64_t v12 = 2654435761 * self->_configuredClusterSize;
    if ((*(unsigned char *)&v11 & 0x80) != 0) {
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((*(unsigned char *)&v11 & 0x80) != 0)
    {
LABEL_56:
      uint64_t v13 = 2654435761 * self->_preferredEncoding;
      goto LABEL_59;
    }
  }
  uint64_t v13 = 0;
LABEL_59:
  unint64_t v14 = [(_MRGroupSessionTokenProtobuf *)self->_groupSessionToken hash];
  unint64_t v15 = [(_MRDeviceInfoMessageProtobuf *)self->_leaderDeviceInfo hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v16 = 2654435761 * self->_isClusterLeader;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_activeSystemEndpointUID hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v18 = 2654435761 * self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
  }
  else {
    uint64_t v18 = 0;
  }
  return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 37)) {
    -[_MRDeviceInfoMessageProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
  if (*((void *)v4 + 27)) {
    -[_MRDeviceInfoMessageProtobuf setName:](self, "setName:");
  }
  if (*((void *)v4 + 23)) {
    -[_MRDeviceInfoMessageProtobuf setLocalizedModelName:](self, "setLocalizedModelName:");
  }
  if (*((void *)v4 + 33)) {
    -[_MRDeviceInfoMessageProtobuf setSystemBuildVersion:](self, "setSystemBuildVersion:");
  }
  if (*((void *)v4 + 6)) {
    -[_MRDeviceInfoMessageProtobuf setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[_MRDeviceInfoMessageProtobuf setApplicationBundleVersion:](self, "setApplicationBundleVersion:");
  }
  int v5 = *((_DWORD *)v4 + 81);
  if (v5)
  {
    self->_protocolVersion = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 81);
    if ((v5 & 0x20) == 0)
    {
LABEL_15:
      if ((v5 & 0x1000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_117;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  self->_lastSupportedMessageType = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 81);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_supportsSystemPairing = *((unsigned char *)v4 + 319);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 81);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_118:
  self->_allowsPairing = *((unsigned char *)v4 + 304);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)v4 + 81) & 0x400) != 0)
  {
LABEL_18:
    self->_connected = *((unsigned char *)v4 + 305);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_19:
  if (*((void *)v4 + 34)) {
    -[_MRDeviceInfoMessageProtobuf setSystemMediaApplication:](self, "setSystemMediaApplication:");
  }
  int v6 = *((_DWORD *)v4 + 81);
  if ((v6 & 0x80000) != 0)
  {
    self->_supportsACL = *((unsigned char *)v4 + 314);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v6 = *((_DWORD *)v4 + 81);
    if ((v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((v6 & 0x100000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  self->_supportsSharedQueue = *((unsigned char *)v4 + 318);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v4 + 81) & 0x100000) != 0)
  {
LABEL_24:
    self->_supportsExtendedMotion = *((unsigned char *)v4 + 315);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_25:
  if (*((void *)v4 + 8)) {
    -[_MRDeviceInfoMessageProtobuf setBluetoothAddress:](self, "setBluetoothAddress:");
  }
  if (*((unsigned char *)v4 + 325))
  {
    self->_sharedQueueVersion = *((_DWORD *)v4 + 62);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 15)) {
    -[_MRDeviceInfoMessageProtobuf setDeviceUID:](self, "setDeviceUID:");
  }
  if (*((void *)v4 + 25)) {
    -[_MRDeviceInfoMessageProtobuf setManagedConfigDeviceID:](self, "setManagedConfigDeviceID:");
  }
  int v7 = *((_DWORD *)v4 + 81);
  if ((v7 & 8) != 0)
  {
    self->_deviceClass = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_has |= 8u;
    int v7 = *((_DWORD *)v4 + 81);
    if ((v7 & 0x40) == 0)
    {
LABEL_35:
      if ((v7 & 0x2000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_125;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  self->_logicalDeviceCount = *((_DWORD *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x40u;
  int v7 = *((_DWORD *)v4 + 81);
  if ((v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_125:
  self->_tightlySyncedGroup = *((unsigned char *)v4 + 320);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 81) & 0x20000) != 0)
  {
LABEL_37:
    self->_isProxyGroupPlayer = *((unsigned char *)v4 + 312);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_38:
  if (*((void *)v4 + 36)) {
    -[_MRDeviceInfoMessageProtobuf setTightSyncUID:](self, "setTightSyncUID:");
  }
  if (*((void *)v4 + 18)) {
    -[_MRDeviceInfoMessageProtobuf setGroupUID:](self, "setGroupUID:");
  }
  if (*((void *)v4 + 16)) {
    -[_MRDeviceInfoMessageProtobuf setGroupName:](self, "setGroupName:");
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = *((id *)v4 + 19);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        [(_MRDeviceInfoMessageProtobuf *)self addGroupedDevices:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v4 + 81);
  if ((v13 & 0x10000) != 0)
  {
    self->_isGroupLeader = *((unsigned char *)v4 + 311);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v13 = *((_DWORD *)v4 + 81);
  }
  if ((v13 & 0x1000) != 0)
  {
    self->_isAirplayActive = *((unsigned char *)v4 + 307);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v4 + 35)) {
    -[_MRDeviceInfoMessageProtobuf setSystemPodcastApplication:](self, "setSystemPodcastApplication:");
  }
  if (*((void *)v4 + 30)) {
    -[_MRDeviceInfoMessageProtobuf setSenderDefaultGroupUID:](self, "setSenderDefaultGroupUID:");
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = *((id *)v4 + 4);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        [(_MRDeviceInfoMessageProtobuf *)self addAirplayReceivers:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v16);
  }

  if (*((void *)v4 + 22)) {
    -[_MRDeviceInfoMessageProtobuf setLinkAgent:](self, "setLinkAgent:");
  }
  if (*((void *)v4 + 9)) {
    -[_MRDeviceInfoMessageProtobuf setClusterID:](self, "setClusterID:");
  }
  if (*((void *)v4 + 10)) {
    -[_MRDeviceInfoMessageProtobuf setClusterLeaderID:](self, "setClusterLeaderID:");
  }
  int v19 = *((_DWORD *)v4 + 81);
  if ((v19 & 2) != 0)
  {
    self->_clusterType = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 2u;
    int v19 = *((_DWORD *)v4 + 81);
  }
  if ((v19 & 0x2000) != 0)
  {
    self->_isClusterAware = *((unsigned char *)v4 + 308);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 26)) {
    -[_MRDeviceInfoMessageProtobuf setModelID:](self, "setModelID:");
  }
  if ((*((unsigned char *)v4 + 326) & 0x20) != 0)
  {
    self->_supportsMultiplayer = *((unsigned char *)v4 + 316);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((void *)v4 + 29)) {
    [(_MRDeviceInfoMessageProtobuf *)self setRoutingContextID:"setRoutingContextID:"];
  }
  if (*((void *)v4 + 3)) {
    -[_MRDeviceInfoMessageProtobuf setAirPlayGroupID:](self, "setAirPlayGroupID:");
  }
  if (*((void *)v4 + 32)) {
    -[_MRDeviceInfoMessageProtobuf setSystemBooksApplication:](self, "setSystemBooksApplication:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v20 = *((id *)v4 + 12);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        [(_MRDeviceInfoMessageProtobuf *)self addClusteredDevices:*(void *)(*((void *)&v40 + 1) + 8 * k)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v22);
  }

  int v25 = *((_DWORD *)v4 + 81);
  if ((v25 & 0x40000) != 0)
  {
    self->_parentGroupContainsDiscoverableGroupLeader = *((unsigned char *)v4 + 313);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v25 = *((_DWORD *)v4 + 81);
    if ((v25 & 0x800) == 0)
    {
LABEL_95:
      if ((v25 & 0x10) == 0) {
        goto LABEL_97;
      }
      goto LABEL_96;
    }
  }
  else if ((v25 & 0x800) == 0)
  {
    goto LABEL_95;
  }
  self->_groupContainsDiscoverableGroupLeader = *((unsigned char *)v4 + 306);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 81) & 0x10) != 0)
  {
LABEL_96:
    self->_lastKnownClusterType = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_97:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v26 = *((id *)v4 + 5);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        -[_MRDeviceInfoMessageProtobuf addAllClusteredDevices:](self, "addAllClusteredDevices:", *(void *)(*((void *)&v36 + 1) + 8 * m), (void)v36);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v28);
  }

  if ((*((unsigned char *)v4 + 326) & 0x40) != 0)
  {
    self->_supportsOutputContextSync = *((unsigned char *)v4 + 317);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
  if (*((void *)v4 + 13)) {
    -[_MRDeviceInfoMessageProtobuf setComputerName:](self, "setComputerName:");
  }
  int v31 = *((_DWORD *)v4 + 81);
  if ((v31 & 4) != 0)
  {
    self->_configuredClusterSize = *((_DWORD *)v4 + 28);
    *(_DWORD *)&self->_has |= 4u;
    int v31 = *((_DWORD *)v4 + 81);
  }
  if ((v31 & 0x80) != 0)
  {
    self->_int preferredEncoding = *((_DWORD *)v4 + 56);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  groupSessionToken = self->_groupSessionToken;
  uint64_t v33 = *((void *)v4 + 17);
  if (groupSessionToken)
  {
    if (v33) {
      -[_MRGroupSessionTokenProtobuf mergeFrom:](groupSessionToken, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[_MRDeviceInfoMessageProtobuf setGroupSessionToken:](self, "setGroupSessionToken:");
  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  uint64_t v35 = *((void *)v4 + 21);
  if (leaderDeviceInfo)
  {
    if (v35) {
      -[_MRDeviceInfoMessageProtobuf mergeFrom:](leaderDeviceInfo, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[_MRDeviceInfoMessageProtobuf setLeaderDeviceInfo:](self, "setLeaderDeviceInfo:");
  }
  if ((*((unsigned char *)v4 + 325) & 0x40) != 0)
  {
    self->_isClusterLeader = *((unsigned char *)v4 + 309);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 2)) {
    -[_MRDeviceInfoMessageProtobuf setActiveSystemEndpointUID:](self, "setActiveSystemEndpointUID:");
  }
  if ((*((unsigned char *)v4 + 325) & 0x80) != 0)
  {
    self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = *((unsigned char *)v4 + 310);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (void)setGroupSessionToken:(id)a3
{
}

- (void)setLeaderDeviceInfo:(id)a3
{
}

@end