@interface MRAVEndpoint
+ (id)_notificationSerialQueue;
+ (id)_userInfoFromEndpoint:(id)a3 outputDevice:(id)a4;
+ (void)_notifyDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 endpoint:(id)a5;
+ (void)_notifyDidAddOutputDevice:(id)a3 endpoint:(id)a4;
+ (void)_notifyDidChangeOutputDevice:(id)a3 endpoint:(id)a4;
+ (void)_notifyDidChangePredictedOutputDevice:(id)a3 endpoint:(id)a4;
+ (void)_notifyDidRemoveOutputDevice:(id)a3 endpoint:(id)a4;
+ (void)_notifyEndpointDidConnect:(id)a3;
+ (void)_notifyEndpointDidDisconnect:(id)a3 withError:(id)a4;
+ (void)_notifyGroupSessionHostingEligibilityDidChangeForEndpoint:(id)a3;
+ (void)_notifyGroupSessionInfoDidChange:(id)a3 endpoint:(id)a4;
+ (void)_notifyVolumeCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4 endpoint:(id)a5;
+ (void)_notifyVolumeDidChange:(float)a3 outputDevice:(id)a4 endpoint:(id)a5;
+ (void)_notifyVolumeMutedDidChange:(BOOL)a3 outputDevice:(id)a4 endpoint:(id)a5;
+ (void)connectToEndpointContainingOutputDeviceUID:(id)a3 options:(unsigned int)a4 details:(id)a5 completion:(id)a6;
+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
+ (void)directEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
+ (void)findMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)hostedEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8;
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 nowPlayingClient:(id)a6 timeout:(double)a7 queue:(id)a8 completion:(id)a9;
- (BOOL)canModifyGroupMembership;
- (BOOL)containsOutputDeviceWithUID:(id)a3;
- (BOOL)effectivelyEqual:(id)a3;
- (BOOL)groupContainsDiscoverableGroupLeader;
- (BOOL)isCompanionEndpoint;
- (BOOL)isConnected;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpoint:(id)a3;
- (BOOL)isGroupable;
- (BOOL)isLocalEndpoint;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isVolumeMuted;
- (BOOL)volumeMutedForOutputDeviceUID:(id)a3;
- (MRAVOutputDevice)designatedGroupLeader;
- (MRAVOutputDevice)designatedProxyGroupLeader;
- (MRAVOutputDevice)predictedOutputDevice;
- (MRDeviceInfo)deviceInfo;
- (MRExternalDevice)externalDevice;
- (MRGroupSessionInfo)groupSessionInfo;
- (MROrigin)origin;
- (MROutputContextDataSource)outputContextDataSource;
- (NSArray)effectiveOutputDevices;
- (NSArray)outputDeviceUIDs;
- (NSArray)outputDevices;
- (NSArray)personalOutputDevices;
- (NSArray)predictedOutputDeviceUIDs;
- (NSArray)resolvedOutputDevices;
- (NSArray)syncedOutputDevices;
- (NSDictionary)jsonEncodableDictionaryRepresentation;
- (NSString)debugName;
- (NSString)localizedName;
- (NSString)shortDescription;
- (NSString)uniqueIdentifier;
- (_MRAVEndpointDescriptorProtobuf)descriptor;
- (__CFString)_createLocalizedNameWithBuiltInDeviceNameBlock:(void *)a1;
- (float)volume;
- (float)volumeForOutputDeviceUID:(id)a3;
- (id)_externalDiscoverySessionDestinationUID;
- (id)_externalOutputContext;
- (id)_init;
- (id)_initiatorStringWithInitiator:(void *)a3 uid:;
- (id)debugDescription;
- (id)description;
- (id)discoverySessionWithConfiguration:(id)a3;
- (id)outputDeviceForUID:(id)a3;
- (id)outputDeviceUIDsMatchingPredicate:(id)a3;
- (id)outputDeviceWithUID:(id)a3;
- (id)outputDevicesMatchingPredicate:(id)a3;
- (id)translateClusterUIDIfNeeded:(void *)a1;
- (int64_t)connectionType;
- (uint64_t)supportsExternalDiscovery;
- (unint64_t)hash;
- (unint64_t)logicalOutputDeviceCount;
- (unsigned)volumeCapabilities;
- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3;
- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_prepareToMigrateToEndpoint:(void *)a3 queue:(void *)a4 completion:;
- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_willStartingPlaybackToOutputDeviceInterruptPlayback:(void *)a3 duration:(void *)a4 requestID:(void *)a5 queue:(double)a6 completion:;
- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7;
- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)adjustVolume:(int64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)canMigrateToEndpoint:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 details:(id)a4 completion:(id)a5;
- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)connectToExternalDeviceWithUserInfo:(id)a3 completion:(id)a4;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)migrateToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)migrateToEndpointOrModifyTopology:(id)a3 migrationRequest:(id)a4 topologyModificationRequest:(id)a5 withReplyQueue:(id)a6 completion:(id)a7;
- (void)migrateToOrAddOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)migrateToOrSetOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)migrateToOutputDevice:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)migrateToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)muteVolume:(BOOL)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)muteVolume:(BOOL)a3 queue:(id)a4 completion:(id)a5;
- (void)outputContextDataSource;
- (void)outputContextDataSourceDidAddOutputDevice:(id)a3;
- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3;
- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3;
- (void)outputContextDidChangePredictedOutputDevice:(id)a3;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeMuted:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)performMigrationToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)performMigrationToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7;
- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithQueue:(id)a3 completion:(id)a4;
- (void)scheduleEndpointOutputDevicesDidChangeNotification;
- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setLocalizedName:(id)a3;
- (void)setOutputContextDataSource:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7;
- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVolume:(float)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setVolume:(float)a3 queue:(id)a4 completion:(id)a5;
- (void)volumeControlCapabilitiesOnQueue:(id)a3 completion:(id)a4;
- (void)volumeMutedOnQueue:(id)a3 completion:(id)a4;
- (void)volumeOnQueue:(id)a3 completion:(id)a4;
- (void)waitForPlaybackWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)willStartingPlaybackToOutputDeviceInterruptPlayback:(id)a3 duration:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)willStartingPlaybackToOutputDevicesInterruptPlayback:(id)a3 originatingOutputDeviceUID:(id)a4 duration:(double)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation MRAVEndpoint

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MRAVEndpoint *)self connectionType];
  if (v5 > 6) {
    v6 = 0;
  }
  else {
    v6 = off_1E57D8860[v5];
  }
  v7 = [(MRAVEndpoint *)self uniqueIdentifier];
  v8 = [(MRAVEndpoint *)self outputDevices];
  v9 = [v3 stringWithFormat:@"<%@:%p (%@) uid=\"%@\" outputDevices = %@>", v4, self, v6, v7, v8];

  return v9;
}

- (NSArray)outputDeviceUIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(MRAVEndpoint *)self outputDevices];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
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
        v10 = objc_msgSend(v9, "uid", (void)v13);

        if (v10)
        {
          v11 = [v9 uid];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MRAVEndpoint;
  return [(MRAVEndpoint *)&v3 init];
}

- (_MRAVEndpointDescriptorProtobuf)descriptor
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
  id v4 = [(MRAVEndpoint *)self localizedName];
  [(_MRAVEndpointDescriptorProtobuf *)v3 setName:v4];

  uint64_t v5 = [(MRAVEndpoint *)self designatedGroupLeader];
  uint64_t v6 = [v5 descriptor];
  [(_MRAVEndpointDescriptorProtobuf *)v3 setDesignatedGroupLeader:v6];

  uint64_t v7 = [(MRAVEndpoint *)self uniqueIdentifier];
  [(_MRAVEndpointDescriptorProtobuf *)v3 setUniqueIdentifier:v7];

  [(_MRAVEndpointDescriptorProtobuf *)v3 setConnectionType:[(MRAVEndpoint *)self connectionType]];
  [(_MRAVEndpointDescriptorProtobuf *)v3 setCanModifyGroupMembership:[(MRAVEndpoint *)self canModifyGroupMembership]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(MRAVEndpoint *)self outputDevices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) descriptor];
        [(_MRAVEndpointDescriptorProtobuf *)v3 addOutputDevices:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (NSString)localizedName
{
  return (NSString *)-[MRAVEndpoint _createLocalizedNameWithBuiltInDeviceNameBlock:](self, &__block_literal_global_87);
}

- (__CFString)_createLocalizedNameWithBuiltInDeviceNameBlock:(void *)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_38;
  }
  id v4 = [a1 outputDevices];
  if ((unint64_t)[v4 count] > 1)
  {
    v39 = v3;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (!v14) {
      goto LABEL_25;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v19 = [v18 name];
        if ([v19 length])
        {
          uint64_t v20 = [v18 logicalDeviceID];
          if (![v20 length]) {
            goto LABEL_21;
          }
          if (([v12 containsObject:v20] & 1) == 0)
          {
            [v12 addObject:v20];
LABEL_21:
            [v5 addObject:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (!v15)
      {
LABEL_25:

        v21 = [a1 groupLeader];
        int v22 = [v21 isProxyGroupPlayer];

        if (v22)
        {
          objc_super v3 = v39;
          if ([a1 isLocalEndpoint])
          {
            v23 = v39[2](v39);
          }
          else
          {
            v31 = [a1 designatedGroupLeader];
            v23 = [v31 name];

            [v5 removeObject:v23];
          }
          v32 = NSString;
          v33 = MRLocalizedStringWithFormat(@"ROUTE_NAME_ARROW_FORMAT");
          v34 = MRLocalizedString(@"ROUTE_NAMES_CONCAT_DELIMITER");
          v35 = [v5 componentsJoinedByString:v34];
          objc_msgSend(v32, "stringWithFormat:", v33, v23, v35);
          uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          [v5 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v23 = MRLocalizedString(@"ROUTE_NAMES_CONCAT_DELIMITER");
          uint64_t v11 = [v5 componentsJoinedByString:v23];
          objc_super v3 = v39;
        }

        goto LABEL_34;
      }
    }
  }
  uint64_t v5 = [v4 firstObject];
  int v6 = [v5 deviceType];
  int v7 = [v5 deviceType];
  int v8 = [a1 isLocalEndpoint];
  BOOL v10 = v6 == 4 || v7 == 5;
  if (v8 && v10)
  {
    v3[2](v3);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = [a1 groupLeader];
    int v25 = [v24 isProxyGroupPlayer];

    if (v25)
    {
      v26 = NSString;
      v27 = MRLocalizedStringWithFormat(@"ROUTE_NAME_ARROW_FORMAT");
      v28 = [a1 groupLeader];
      v29 = [v28 name];
      v30 = [v5 name];
      objc_msgSend(v26, "stringWithFormat:", v27, v29, v30);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v5;
      if (!v5)
      {
        v12 = [a1 groupLeader];
      }
      uint64_t v11 = [v12 name];
      if (!v5) {
LABEL_34:
      }
    }
  }

  v36 = &stru_1EE60E7D8;
  if (v11) {
    v36 = v11;
  }
  v37 = v36;

LABEL_38:

  return v37;
}

- (BOOL)isLocalEndpoint
{
  return [(MRAVEndpoint *)self connectionType] == 1;
}

id __29__MRAVEndpoint_localizedName__block_invoke()
{
  return +[MRAVOutputDevice localDeviceLocalizedName];
}

id __25__MRAVEndpoint_debugName__block_invoke()
{
  return +[MRAVOutputDevice localDeviceUID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (MRAVEndpoint *)v4;
    if (self == v5)
    {
      char v10 = 1;
    }
    else
    {
      int v6 = [(MRAVEndpoint *)self uniqueIdentifier];
      if (v6)
      {
        int v7 = [(MRAVEndpoint *)v5 uniqueIdentifier];
        if (v7)
        {
          int v8 = [(MRAVEndpoint *)self uniqueIdentifier];
          uint64_t v9 = [(MRAVEndpoint *)v5 uniqueIdentifier];
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

- (unint64_t)hash
{
  v2 = [(MRAVEndpoint *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v8 = [v5 objectForKeyedSubscript:@"MROutputContextDataSourceVolumeCapabilitiesUserInfoKey"];

  int v6 = [v4 userInfo];

  int v7 = [v6 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  objc_msgSend((id)objc_opt_class(), "_notifyVolumeCapabilitiesDidChange:outputDevice:endpoint:", objc_msgSend(v8, "intValue"), v7, self);
}

+ (void)_notifyVolumeCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v11 = [a1 _userInfoFromEndpoint:v8 outputDevice:a4];
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v6];
  [v11 setObject:v9 forKeyedSubscript:@"kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"];

  char v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification" object:v8 userInfo:v11];
}

+ (id)_userInfoFromEndpoint:(id)a3 outputDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 uniqueIdentifier];
  int v7 = [v5 uid];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:v6 forKeyedSubscript:@"kMRAVEndpointIdentifierUserInfoKey"];
  if (v5)
  {
    [v8 setObject:v5 forKeyedSubscript:@"MRAVEndpointOutputDeviceUserInfoKey"];
    [v8 setObject:v7 forKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];
  }

  return v8;
}

+ (void)_notifyDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 endpoint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [a1 _userInfoFromEndpoint:v8 outputDevice:0];
  [v12 setObject:v10 forKeyedSubscript:@"MRAVEndpointDeviceInfoUserInfoKey"];

  [v12 setObject:v9 forKeyedSubscript:@"MRAVEndpointPreviousDeviceInfoUserInfoKey"];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MRAVEndpointDeviceInfoDidChangeNotification" object:v8 userInfo:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_outputContextDataSource, 0);
}

- (BOOL)isEqualToEndpoint:(id)a3
{
  id v4 = a3;
  if ([(MRAVEndpoint *)self isEqual:v4])
  {
    id v5 = [(MRAVEndpoint *)self descriptor];
    uint64_t v6 = [v4 descriptor];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __66__MRAVEndpoint_scheduleEndpointOutputDevicesDidChangeNotification__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:*(void *)(a1 + 32)];
}

uint64_t __44__MRAVEndpoint_translateClusterUIDIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)setOutputContextDataSource:(id)a3
{
  id v8 = (MROutputContextDataSource *)a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  outputContextDataSource = v6->_outputContextDataSource;
  if (outputContextDataSource != v8)
  {
    if (outputContextDataSource)
    {
      objc_msgSend(v5, "removeObserver:name:object:", v6, @"MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification");
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification" object:v6->_outputContextDataSource];
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification" object:v6->_outputContextDataSource];
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceDidAddOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceDidChangeOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceDidRemoveOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 removeObserver:v6 name:@"MROutputContextDataSourceDidChangePredictedOutputDeviceNotification" object:v6->_outputContextDataSource];
    }
    objc_storeStrong((id *)&v6->_outputContextDataSource, a3);
    if (v6->_outputContextDataSource)
    {
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities_, @"MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification");
      [v5 addObserver:v6 selector:sel_outputContextDataSourceOutputDeviceDidChangeVolume_ name:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification" object:v6->_outputContextDataSource];
      [v5 addObserver:v6 selector:sel_outputContextDataSourceOutputDeviceDidChangeVolumeMuted_ name:@"MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification" object:v6->_outputContextDataSource];
      [v5 addObserver:v6 selector:sel_outputContextDataSourceDidAddOutputDevice_ name:@"MROutputContextDataSourceDidAddOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 addObserver:v6 selector:sel_outputContextDataSourceDidChangeOutputDevice_ name:@"MROutputContextDataSourceDidChangeOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 addObserver:v6 selector:sel_outputContextDataSourceDidRemoveOutputDevice_ name:@"MROutputContextDataSourceDidRemoveOutputDeviceNotification" object:v6->_outputContextDataSource];
      [v5 addObserver:v6 selector:sel_outputContextDidChangePredictedOutputDevice_ name:@"MROutputContextDataSourceDidChangePredictedOutputDeviceNotification" object:v6->_outputContextDataSource];
    }
  }
  objc_sync_exit(v6);
}

- (void)scheduleEndpointOutputDevicesDidChangeNotification
{
  if (!self->_outputDevicesDidChangeNotificationScheduled)
  {
    self->_outputDevicesDidChangeNotificationScheduled = 1;
    unint64_t v3 = +[MRAVEndpoint _notificationSerialQueue]();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MRAVEndpoint_scheduleEndpointOutputDevicesDidChangeNotification__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

+ (id)_notificationSerialQueue
{
  self;
  if (_notificationSerialQueue___once_1 != -1) {
    dispatch_once(&_notificationSerialQueue___once_1, &__block_literal_global_484);
  }
  v0 = (void *)_notificationSerialQueue___notificationSerialQueue_1;

  return v0;
}

- (NSArray)resolvedOutputDevices
{
  unint64_t v3 = [(MRAVEndpoint *)self syncedOutputDevices];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__35;
  v13[4] = __Block_byref_object_dispose__35;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__MRAVEndpoint_resolvedOutputDevices__block_invoke;
  v9[3] = &unk_1E57D8038;
  id v4 = v3;
  id v11 = self;
  id v12 = v13;
  id v10 = v4;
  id v5 = (unsigned int (**)(void))MEMORY[0x1997190F0](v9);
  if (v5[2]())
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(MRAVEndpoint *)self outputDevices];
  }
  char v7 = v6;

  _Block_object_dispose(v13, 8);

  return (NSArray *)v7;
}

uint64_t __37__MRAVEndpoint_resolvedOutputDevices__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = *(void **)(a1 + 40);
    return [v2 groupContainsDiscoverableGroupLeader];
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = @"outputContext is uninitialized";

    return 0;
  }
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];

  id v14 = @"Endpoint.outputDeviceVolume";
  if (!v8) {
    id v14 = @"Endpoint.volume";
  }
  uint64_t v15 = v14;
  id v16 = [NSString alloc];
  uint64_t v17 = [(MRAVEndpoint *)self debugName];
  long long v18 = (void *)v17;
  if (v8) {
    uint64_t v19 = [v16 initWithFormat:@"endpoint=%@, outputDevice=%@", v17, v8];
  }
  else {
    uint64_t v19 = [v16 initWithFormat:@"endpoint=%@", v17, v38];
  }
  uint64_t v20 = (void *)v19;

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v15, v13];
  int v22 = v21;
  if (v20) {
    [v21 appendFormat:@" for %@", v20];
  }
  v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke;
  v49[3] = &unk_1E57D84F8;
  id v50 = v20;
  v51 = v15;
  id v52 = v13;
  id v53 = v11;
  id v54 = v9;
  id v55 = v10;
  id v40 = v9;
  id v39 = v10;
  id v24 = v11;
  id v25 = v13;
  v26 = v15;
  id v27 = v20;
  v28 = (void *)MEMORY[0x1997190F0](v49);
  v29 = [MRBlockGuard alloc];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_2;
  v47[3] = &unk_1E57D0FE8;
  id v30 = v28;
  id v48 = v30;
  v31 = [(MRBlockGuard *)v29 initWithTimeout:v26 reason:v47 handler:7.0];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_3;
  v44[3] = &unk_1E57D1E90;
  uint64_t v45 = v31;
  id v46 = v30;
  id v32 = v30;
  v33 = v31;
  v34 = (void *)MEMORY[0x1997190F0](v44);
  v56[0] = @"MREndpointConnectionReasonUserInfoKey";
  v56[1] = @"MREndpointConnectionCorrelationIDUserInfoKey";
  v57[0] = v26;
  v57[1] = v25;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_4;
  v41[3] = &unk_1E57D10A8;
  v41[4] = self;
  id v42 = v8;
  id v43 = v34;
  id v36 = v34;
  id v37 = v8;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v35 completion:v41];
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];

  id v14 = [NSString alloc];
  uint64_t v15 = [(MRAVEndpoint *)self debugName];
  id v16 = (void *)[v14 initWithFormat:@"endpoint=%@, outputDevice=%@", v15, v8];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"outputDeviceVolumeControlCapabilities", v13];
  long long v18 = v17;
  if (v16) {
    [v17 appendFormat:@" for %@", v16];
  }
  uint64_t v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v53 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v43[3] = &unk_1E57D84A8;
  id v44 = v16;
  uint64_t v45 = @"outputDeviceVolumeControlCapabilities";
  id v46 = v13;
  id v47 = v11;
  id v48 = v9;
  id v49 = v10;
  id v34 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v13;
  id v23 = v16;
  id v24 = (void *)MEMORY[0x1997190F0](v43);
  id v25 = [MRBlockGuard alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
  v41[3] = &unk_1E57D0FE8;
  id v26 = v24;
  id v42 = v26;
  id v27 = [(MRBlockGuard *)v25 initWithTimeout:@"outputDeviceVolumeControlCapabilities" reason:v41 handler:7.0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_3;
  v38[3] = &unk_1E57D1E18;
  id v39 = v27;
  id v40 = v26;
  id v28 = v26;
  v29 = v27;
  id v30 = (void *)MEMORY[0x1997190F0](v38);
  v50[0] = @"MREndpointConnectionReasonUserInfoKey";
  v50[1] = @"MREndpointConnectionCorrelationIDUserInfoKey";
  v51[0] = @"outputDeviceVolumeControlCapabilities";
  v51[1] = v22;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_4;
  v35[3] = &unk_1E57D10A8;
  v35[4] = self;
  id v36 = v8;
  id v37 = v30;
  id v32 = v30;
  id v33 = v8;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v31 completion:v35];
}

- (void)connectToExternalDeviceWithUserInfo:(id)a3 completion:(id)a4
{
}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    char v7 = [*(id *)(a1 + 32) outputContextDataSource];
    id v8 = 0;
    [v7 volumeControlCapabilitiesForOutputDeviceUID:v6 error:&v8];
    id v5 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v14 = MRMediaRemoteVolumeControlCapabilitiesDescription(a2);

    uint64_t v15 = a1[4];
    char v7 = _MRLogForCategory(0xAuLL);
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v17 = a1[5];
        uint64_t v18 = a1[6];
        id v12 = MRMediaRemoteVolumeControlCapabilitiesDescription(a2);
        uint64_t v19 = a1[4];
        id v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544386;
        uint64_t v47 = v17;
        __int16 v48 = 2114;
        uint64_t v49 = v18;
        __int16 v50 = 2112;
        id v51 = v12;
        __int16 v52 = 2114;
        uint64_t v53 = v19;
        __int16 v54 = 2048;
        uint64_t v55 = v21;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v23 = v7;
        uint32_t v24 = 52;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v32 = a1[5];
        uint64_t v33 = a1[6];
        id v12 = MRMediaRemoteVolumeControlCapabilitiesDescription(a2);
        id v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v32;
        __int16 v48 = 2114;
        uint64_t v49 = v33;
        __int16 v50 = 2112;
        id v51 = v12;
        __int16 v52 = 2048;
        uint64_t v53 = v34;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v23 = v7;
        uint32_t v24 = 42;
      }
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
    else
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v26 = a1[5];
        uint64_t v25 = a1[6];
        id v27 = (void *)a1[4];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v26;
        __int16 v48 = 2114;
        uint64_t v49 = v25;
        __int16 v50 = 2114;
        id v51 = v27;
        __int16 v52 = 2048;
        uint64_t v53 = v28;
        v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v30 = v7;
        uint32_t v31 = 42;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v35 = a1[5];
        uint64_t v36 = a1[6];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = v35;
        __int16 v48 = 2114;
        uint64_t v49 = v36;
        __int16 v50 = 2048;
        id v51 = v37;
        v29 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v30 = v7;
        uint32_t v31 = 32;
      }
      _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
    goto LABEL_20;
  }
  uint64_t v6 = a1[4];
  char v7 = _MRLogForCategory(0xAuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v10 = a1[5];
    uint64_t v9 = a1[6];
    uint64_t v11 = a1[4];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v47 = v10;
    __int16 v48 = 2114;
    uint64_t v49 = v9;
    __int16 v50 = 2114;
    id v51 = v5;
    __int16 v52 = 2114;
    uint64_t v53 = v11;
    __int16 v54 = 2048;
    uint64_t v55 = v13;
    _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v5, v7);
  }
LABEL_21:

  uint64_t v38 = (void *)a1[9];
  if (v38)
  {
    id v39 = a1[8];
    id v40 = v39;
    if (!v39)
    {
      id v40 = MEMORY[0x1E4F14428];
      id v41 = MEMORY[0x1E4F14428];
      uint64_t v38 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_421;
    block[3] = &unk_1E57D1DF0;
    id v44 = v38;
    int v45 = a2;
    id v43 = v5;
    dispatch_async(v40, block);
    if (!v39) {
  }
    }
}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = 0.0;
  id v5 = v3;
  if (!v3)
  {
    uint64_t v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    char v7 = [*(id *)(a1 + 32) outputContextDataSource];
    id v9 = 0;
    [v7 volumeForOutputDeviceUID:v6 error:&v9];
    float v4 = v8;
    id v5 = v9;
  }
  (*(void (**)(float))(*(void *)(a1 + 48) + 16))(v4);
}

- (id)translateClusterUIDIfNeeded:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    float v4 = [a1 outputDevices];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__MRAVEndpoint_translateClusterUIDIfNeeded___block_invoke;
    v15[3] = &unk_1E57D07B8;
    id v5 = v3;
    id v16 = v5;
    uint64_t v6 = objc_msgSend(v4, "mr_first:", v15);

    char v7 = [a1 externalDevice];
    float v8 = [v7 deviceInfo];
    char v9 = [v8 isClusterAware];

    if ((v9 & 1) == 0 && [v6 deviceSubtype] == 15)
    {
      uint64_t v10 = [v6 uid];
      int v11 = [v5 isEqualToString:v10];

      if (v11)
      {
        uint64_t v12 = [v6 primaryID];

        id v5 = (id)v12;
      }
    }
    id v3 = v5;

    uint64_t v13 = v3;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (MRExternalDevice)externalDevice
{
  return 0;
}

- (NSArray)syncedOutputDevices
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__35;
  v8[4] = __Block_byref_object_dispose__35;
  id v9 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MRAVEndpoint_syncedOutputDevices__block_invoke;
  v7[3] = &unk_1E57D8010;
  v7[4] = self;
  v7[5] = v8;
  id v3 = (unsigned int (**)(void))MEMORY[0x1997190F0](v7, a2);
  if (v3[2]())
  {
    float v4 = [(MRAVEndpoint *)self outputContextDataSource];
    id v5 = [v4 outputDevices];
  }
  else
  {
    id v5 = 0;
  }

  _Block_object_dispose(v8, 8);

  return (NSArray *)v5;
}

- (MROutputContextDataSource)outputContextDataSource
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  outputContextDataSource = v2->_outputContextDataSource;
  if (!outputContextDataSource)
  {
    float v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [(MRAVEndpoint *)v2 debugName];
      [(MRAVEndpoint *)v5 outputContextDataSource];
    }

    uint64_t v6 = [(MRAVEndpoint *)v2 _externalOutputContext];
    [(MRAVEndpoint *)v2 setOutputContextDataSource:v6];

    outputContextDataSource = v2->_outputContextDataSource;
  }
  char v7 = outputContextDataSource;
  objc_sync_exit(v2);

  return v7;
}

uint64_t __35__MRAVEndpoint_syncedOutputDevices__block_invoke(uint64_t a1)
{
  id v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 supportOutputContextSync];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    char v7 = @"FF disabled";
    goto LABEL_5;
  }
  if (([*(id *)(a1 + 32) isLocalEndpoint] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) externalDevice];
    if (v9)
    {
      uint64_t v6 = v9;
      uint64_t v10 = [v9 deviceInfo];
      int v11 = v10;
      if (v10)
      {
        if ([v10 supportsOutputContextSync])
        {

          uint64_t v4 = 1;
          goto LABEL_6;
        }
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        id v14 = @"endpoint does not support outputContextSync";
      }
      else
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        id v14 = @"deviceInfo==nil";
      }
      *(void *)(v12 + 40) = v14;

      uint64_t v4 = 0;
      goto LABEL_6;
    }
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    char v7 = @"not connected";
LABEL_5:
    *(void *)(v5 + 40) = v7;
LABEL_6:

    return v4;
  }
  return 1;
}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(float))(*(void *)(a1 + 40) + 16))(a3);
  }
}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke(void *a1, void *a2, float a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5)
  {
    *(float *)&double v6 = a3;
    uint64_t v15 = [NSNumber numberWithFloat:v6];

    uint64_t v16 = a1[4];
    float v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v19 = a1[5];
        uint64_t v20 = a1[6];
        *(float *)&double v18 = a3;
        uint64_t v13 = [NSNumber numberWithFloat:v18];
        uint64_t v21 = a1[4];
        id v22 = [MEMORY[0x1E4F1C9C8] date];
        [v22 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544386;
        uint64_t v49 = v19;
        __int16 v50 = 2114;
        uint64_t v51 = v20;
        __int16 v52 = 2112;
        id v53 = v13;
        __int16 v54 = 2114;
        uint64_t v55 = v21;
        __int16 v56 = 2048;
        uint64_t v57 = v23;
        uint32_t v24 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        uint64_t v25 = v8;
        uint32_t v26 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v34 = a1[5];
        uint64_t v35 = a1[6];
        *(float *)&double v18 = a3;
        uint64_t v13 = [NSNumber numberWithFloat:v18];
        id v22 = [MEMORY[0x1E4F1C9C8] date];
        [v22 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v49 = v34;
        __int16 v50 = 2114;
        uint64_t v51 = v35;
        __int16 v52 = 2112;
        id v53 = v13;
        __int16 v54 = 2048;
        uint64_t v55 = v36;
        uint32_t v24 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        uint64_t v25 = v8;
        uint32_t v26 = 42;
      }
      _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v28 = a1[5];
        uint64_t v27 = a1[6];
        v29 = (void *)a1[4];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v49 = v28;
        __int16 v50 = 2114;
        uint64_t v51 = v27;
        __int16 v52 = 2114;
        id v53 = v29;
        __int16 v54 = 2048;
        uint64_t v55 = v30;
        uint32_t v31 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint64_t v32 = v8;
        uint32_t v33 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v37 = a1[5];
        uint64_t v38 = a1[6];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v37;
        __int16 v50 = 2114;
        uint64_t v51 = v38;
        __int16 v52 = 2048;
        id v53 = v39;
        uint32_t v31 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint64_t v32 = v8;
        uint32_t v33 = 32;
      }
      _os_log_impl(&dword_194F3C000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
    goto LABEL_20;
  }
  uint64_t v7 = a1[4];
  float v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v11 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v12 = a1[4];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v49 = v11;
    __int16 v50 = 2114;
    uint64_t v51 = v10;
    __int16 v52 = 2114;
    id v53 = v5;
    __int16 v54 = 2114;
    uint64_t v55 = v12;
    __int16 v56 = 2048;
    uint64_t v57 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v5, v8);
  }
LABEL_21:

  id v40 = (void *)a1[9];
  if (v40)
  {
    id v41 = a1[8];
    id v42 = v41;
    if (!v41)
    {
      id v42 = MEMORY[0x1E4F14428];
      id v43 = MEMORY[0x1E4F14428];
      id v40 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_443;
    block[3] = &unk_1E57D1DF0;
    id v46 = v40;
    float v47 = a3;
    id v45 = v5;
    dispatch_async(v42, block);
    if (!v41) {
  }
    }
}

- (NSString)debugName
{
  char v3 = -[MRAVEndpoint _createLocalizedNameWithBuiltInDeviceNameBlock:](self, &__block_literal_global_134);
  id v4 = [NSString alloc];
  id v5 = [(MRAVEndpoint *)self uniqueIdentifier];
  double v6 = (void *)[v4 initWithFormat:@"%@-%@", v5, v3];

  return (NSString *)v6;
}

uint64_t __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_421(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_443(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(float *)(a1 + 48));
}

void __40__MRAVEndpoint__notificationSerialQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRAVEndpoint.NotificationQueue", v2);
  v1 = (void *)_notificationSerialQueue___notificationSerialQueue_1;
  _notificationSerialQueue___notificationSerialQueue_1 = (uint64_t)v0;
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v9 = [v5 objectForKeyedSubscript:@"MROutputContextDataSourceVolumeUserInfoKey"];

  double v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  float v8 = objc_opt_class();
  [v9 floatValue];
  objc_msgSend(v8, "_notifyVolumeDidChange:outputDevice:endpoint:", v7, self);
}

+ (void)_notifyVolumeDidChange:(float)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  id v8 = a5;
  id v12 = [a1 _userInfoFromEndpoint:v8 outputDevice:a4];
  *(float *)&double v9 = a3;
  uint64_t v10 = [NSNumber numberWithFloat:v9];
  [v12 setObject:v10 forKeyedSubscript:@"kMRAVEndpointVolumeUserInfoKey"];

  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"kMRAVEndpointVolumeDidChangeNotification" object:v8 userInfo:v12];
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a8;
  uint64_t v15 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v37 = a7;
  id v16 = a4;
  BOOL v17 = (void *)[[v15 alloc] initWithDictionary:v16];

  double v18 = [v17 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];

  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v20 = [v19 UUIDString];
    [v17 setObject:v20 forKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  }
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
  id v22 = [v17 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  uint64_t v23 = [NSString stringWithFormat:@"UIDs=(%@)", v13];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke;
  v40[3] = &unk_1E57D86D8;
  id v41 = @"sendCommandToOutputDeviceUIDs";
  id v24 = v22;
  id v42 = v24;
  id v35 = v21;
  id v43 = v35;
  id v36 = v14;
  id v44 = v36;
  uint64_t v25 = (void *)MEMORY[0x1997190F0](v40);
  uint32_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"sendCommandToOutputDeviceUIDs", v24];
  uint64_t v27 = v26;
  if (v23) {
    [v26 appendFormat:@" for %@", v23];
  }
  uint64_t v28 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v27;
    _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29 = MRCreateXPCMessage(0x300000000000031uLL);
  xpc_dictionary_set_uint64(v29, "command", a3);
  MRAddPropertyListToXPCMessage(v29, (uint64_t)v17, "commandOptions");
  uint64_t v30 = v13;
  MRAddPropertyListToXPCMessage(v29, (uint64_t)v13, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  xpc_dictionary_set_double(v29, "timeout", a6);
  uint32_t v31 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v32 = [v31 service];
  uint32_t v33 = [v32 mrXPCConnection];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_555;
  v38[3] = &unk_1E57D1490;
  id v39 = v25;
  id v34 = v25;
  [v33 sendMessage:v29 queue:v37 reply:v38];
}

- (id)debugDescription
{
  id v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MRAVEndpoint *)v2 connectionType];
  if (v5 > 6) {
    double v6 = 0;
  }
  else {
    double v6 = off_1E57D8860[v5];
  }
  uint64_t v7 = [(MRAVEndpoint *)v2 uniqueIdentifier];
  id v8 = [v3 stringWithFormat:@"<%@:%p (%@) uid=\"%@\"", v4, v2, v6, v7];

  double v9 = [(MRAVEndpoint *)v2 outputDevices];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(MRAVEndpoint *)v2 outputDevices];
    id v12 = objc_msgSend(v11, "mr_formattedDebugDescription");
    [v8 appendFormat:@"  outputDevices = %@\n", v12];
  }
  id v13 = [(MRAVEndpoint *)v2 personalOutputDevices];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [(MRAVEndpoint *)v2 personalOutputDevices];
    id v16 = objc_msgSend(v15, "mr_formattedDebugDescription");
    [v8 appendFormat:@"  personalDevices = %@\n", v16];
  }
  outputContextDataSource = v2->_outputContextDataSource;
  if (outputContextDataSource)
  {
    double v18 = [outputContextDataSource mr_formattedDebugDescription];
    [v8 appendFormat:@"  outputContextDataSource debug= %@\n", v18];
  }
  objc_sync_exit(v2);

  return v8;
}

- (NSArray)outputDevices
{
  return 0;
}

- (NSArray)personalOutputDevices
{
  id v2 = [(MRAVEndpoint *)self externalDevice];
  char v3 = [v2 personalOutputDevices];

  return (NSArray *)v3;
}

- (MRAVOutputDevice)predictedOutputDevice
{
  return 0;
}

- (NSArray)predictedOutputDeviceUIDs
{
  return 0;
}

- (NSArray)effectiveOutputDevices
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRAVEndpoint *)self predictedOutputDevice];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v5 = [(MRAVEndpoint *)self outputDevices];
  }
  double v6 = (void *)v5;

  return (NSArray *)v6;
}

- (unint64_t)logicalOutputDeviceCount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [(MRAVEndpoint *)self outputDevices];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "logicalDeviceID", (void)v17);
        uint64_t v11 = [v10 length];

        if (v11)
        {
          uint64_t v12 = [v9 logicalDeviceID];
        }
        else
        {
          id v13 = [v9 uid];

          if (!v13) {
            continue;
          }
          uint64_t v12 = [v9 uid];
        }
        uint64_t v14 = (void *)v12;
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  unint64_t v15 = [v3 count];
  return v15;
}

- (MROrigin)origin
{
  id v2 = [(MRAVEndpoint *)self externalDevice];
  uint64_t v3 = [v2 customOrigin];

  return (MROrigin *)v3;
}

- (MRAVOutputDevice)designatedGroupLeader
{
  return 0;
}

- (MRAVOutputDevice)designatedProxyGroupLeader
{
  id v3 = [(MRAVEndpoint *)self designatedGroupLeader];
  id v4 = [v3 uid];
  BOOL v5 = [(MRAVEndpoint *)self containsOutputDeviceWithUID:v4];

  uint64_t v6 = v3;
  if (!v5)
  {
    uint64_t v7 = [(MRAVEndpoint *)self outputDevices];
    id v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_118];
    uint64_t v6 = [v8 firstObject];
  }

  return (MRAVOutputDevice *)v6;
}

uint64_t __42__MRAVEndpoint_designatedProxyGroupLeader__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 uid];
  uint64_t v6 = [v4 uid];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)uniqueIdentifier
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVEndpoint uniqueIdentifier]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  uint64_t v3 = [(MRAVEndpoint *)self designatedGroupLeader];
  int v4 = [v3 isAirPlayReceiverSessionActive];

  id v5 = [(MRAVEndpoint *)self designatedGroupLeader];
  uint64_t v6 = v5;
  if (v4) {
    char v7 = [v5 parentGroupContainsDiscoverableLeader];
  }
  else {
    char v7 = [v5 groupContainsGroupLeader];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)canModifyGroupMembership
{
  return 0;
}

- (BOOL)isProxyGroupPlayer
{
  return 0;
}

- (NSString)shortDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MRAVEndpoint *)self connectionType];
  if (v5 > 6) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E57D8860[v5];
  }
  char v7 = [(MRAVEndpoint *)self uniqueIdentifier];
  BOOL v8 = [(MRAVEndpoint *)self designatedGroupLeader];
  double v9 = [v8 name];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p (%@) uid=\"%@\" leader=\"%@\">", v4, self, v6, v7, v9];

  return (NSString *)v10;
}

- (NSDictionary)jsonEncodableDictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"uid";
  uint64_t v3 = [(MRAVEndpoint *)self uniqueIdentifier];
  uint64_t v4 = (void *)v3;
  if (v3) {
    unint64_t v5 = (__CFString *)v3;
  }
  else {
    unint64_t v5 = &stru_1EE60E7D8;
  }
  v12[1] = @"output-devices";
  v13[0] = v5;
  uint64_t v6 = [(MRAVEndpoint *)self outputDevices];
  uint64_t v7 = [v6 valueForKey:@"jsonEncodableDictionaryRepresentation"];
  BOOL v8 = (void *)v7;
  uint64_t v9 = MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v9 = v7;
  }
  v13[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return (NSDictionary *)v10;
}

- (BOOL)isCompanionEndpoint
{
  id v2 = [(MRAVEndpoint *)self groupLeader];
  BOOL v3 = [v2 hostDeviceClass] == 1;

  return v3;
}

- (BOOL)isGroupable
{
  id v2 = [(MRAVEndpoint *)self outputDevices];
  BOOL v3 = objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_157_0);
  BOOL v4 = v3 == 0;

  return v4;
}

uint64_t __27__MRAVEndpoint_isGroupable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isGroupable] ^ 1;
}

- (BOOL)isConnected
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVEndpoint isConnected]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)_externalOutputContext
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVEndpoint _externalOutputContext]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MRGroupSessionInfo)groupSessionInfo
{
  id v2 = [(MRAVEndpoint *)self designatedGroupLeader];
  uint64_t v3 = [v2 groupSessionInfo];

  return (MRGroupSessionInfo *)v3;
}

- (MRDeviceInfo)deviceInfo
{
  id v2 = [(MRAVEndpoint *)self externalDevice];
  uint64_t v3 = [v2 deviceInfo];

  return (MRDeviceInfo *)v3;
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"MREndpointConnectionReasonUserInfoKey"];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:@"MRExternalDeviceConnectionReasonUserInfoKey"];
  }
  id v13 = v12;

  uint64_t v14 = [v8 objectForKeyedSubscript:@"MREndpointConnectionCorrelationIDUserInfoKey"];
  unint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    long long v17 = [v8 objectForKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
    long long v18 = v17;
    if (v17)
    {
      id v16 = v17;
    }
    else
    {
      [MEMORY[0x1E4F29128] UUID];
      long long v20 = v19 = a3;
      id v16 = [v20 UUIDString];

      a3 = v19;
    }
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke;
  v37[3] = &unk_1E57D0FE8;
  id v21 = v9;
  id v38 = v21;
  uint64_t v22 = (void *)MEMORY[0x1997190F0](v37);
  uint64_t v23 = [(MRAVEndpoint *)self externalDevice];
  if (v23)
  {
    unsigned int v33 = a3;
    if (!v13) {
      id v13 = @"MRAVEndpoint";
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v24 setObject:v13 forKeyedSubscript:@"MRExternalDeviceConnectionReasonUserInfoKey"];
    [v24 setObject:v16 forKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"MRExternalDeviceConnectionClientBundleIDUserInfoKey"];
    if (v25)
    {
      [v24 setObject:v25 forKeyedSubscript:@"MRExternalDeviceConnectionClientBundleIDUserInfoKey"];
    }
    else
    {
      [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v30 = v32 = v21;
      uint32_t v31 = [v30 bundleIdentifier];
      [v24 setObject:v31 forKeyedSubscript:@"MRExternalDeviceConnectionClientBundleIDUserInfoKey"];

      id v21 = v32;
    }

    [v23 connectWithOptions:v33 userInfo:v24 completion:v22];
  }
  else
  {
    uint32_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:100 description:@"Cannot connect to external device. This endpoint doesn't have a usable pipe."];
    qos_class_t v27 = qos_class_self();
    dispatch_get_global_queue(v27, 0);
    v29 = id v28 = v21;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke_2;
    block[3] = &unk_1E57D0DB8;
    id v35 = v26;
    id v36 = v22;
    id v24 = v26;
    dispatch_async(v29, block);

    id v21 = v28;
  }
}

uint64_t __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 details:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v13 = objc_alloc_init(v8);
  uint64_t v11 = [v10 requestID];
  [v13 setObject:v11 forKeyedSubscript:@"MREndpointConnectionCorrelationIDUserInfoKey"];

  uint64_t v12 = [v10 reason];

  [v13 setObject:v12 forKeyedSubscript:@"MREndpointConnectionReasonUserInfoKey"];
  [(MRAVEndpoint *)self connectToExternalDeviceWithOptions:v6 userInfo:v13 completion:v9];
}

+ (void)connectToEndpointContainingOutputDeviceUID:(id)a3 options:(unsigned int)a4 details:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"MRAVEndpoint.m", 544, @"Invalid parameter not satisfying: %@", @"details" object file lineNumber description];
  }
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  id v14 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v15 = [v11 requestID];
  id v16 = (void *)[v14 initWithFormat:@"%@<%@>", @"connectToEndpointWithOutputDeviceUID", v15];

  if (v10) {
    [v16 appendFormat:@" for %@", v10];
  }
  long long v17 = [v11 reason];

  if (v17)
  {
    long long v18 = [v11 reason];
    [v16 appendFormat:@" because %@", v18];
  }
  unsigned int v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v16;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke;
  v38[3] = &unk_1E57D80A0;
  id v39 = v10;
  id v20 = v11;
  id v40 = v20;
  id v41 = v13;
  id v42 = v12;
  id v21 = v12;
  id v22 = v13;
  id v23 = v10;
  id v24 = (void *)MEMORY[0x1997190F0](v38);
  uint64_t v25 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  uint32_t v26 = +[MRUserSettings currentSettings];
  [v26 discoverEndpointTimeoutInterval];
  double v28 = v27;
  v29 = [v20 requestReasonID];
  qos_class_t v30 = qos_class_self();
  uint32_t v31 = dispatch_get_global_queue(v30, 0);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_195;
  v35[3] = &unk_1E57D23E0;
  id v36 = v20;
  id v37 = v24;
  id v32 = v24;
  id v33 = v20;
  [(MRAVLightweightReconnaissanceSession *)v25 searchEndpointsForOutputDeviceUID:v23 timeout:v29 reason:v31 queue:v35 completion:v28];
}

void __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v14 = [v5 debugName];

    uint64_t v15 = *(void *)(a1 + 32);
    id v8 = _MRLogForCategory(0xAuLL);
    BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        id v10 = [*(id *)(a1 + 40) requestID];
        id v12 = [v5 debugName];
        uint64_t v17 = *(void *)(a1 + 32);
        long long v18 = [MEMORY[0x1E4F1C9C8] date];
        [v18 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v31 = 138544386;
        id v32 = @"connectToEndpointWithOutputDeviceUID";
        __int16 v33 = 2114;
        id v34 = v10;
        __int16 v35 = 2112;
        id v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = v17;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        id v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v21 = v8;
        uint32_t v22 = 52;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        id v10 = [*(id *)(a1 + 40) requestID];
        id v12 = [v5 debugName];
        long long v18 = [MEMORY[0x1E4F1C9C8] date];
        [v18 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v31 = 138544130;
        id v32 = @"connectToEndpointWithOutputDeviceUID";
        __int16 v33 = 2114;
        id v34 = v10;
        __int16 v35 = 2112;
        id v36 = v12;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        id v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v21 = v8;
        uint32_t v22 = 42;
      }
      _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v22);
    }
    else
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        id v10 = [*(id *)(a1 + 40) requestID];
        id v23 = *(void **)(a1 + 32);
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v31 = 138544130;
        id v32 = @"connectToEndpointWithOutputDeviceUID";
        __int16 v33 = 2114;
        id v34 = v10;
        __int16 v35 = 2114;
        id v36 = v23;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        uint64_t v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint32_t v26 = v8;
        uint32_t v27 = 42;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        id v10 = [*(id *)(a1 + 40) requestID];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v31 = 138543874;
        id v32 = @"connectToEndpointWithOutputDeviceUID";
        __int16 v33 = 2114;
        id v34 = v10;
        __int16 v35 = 2048;
        id v36 = v29;
        uint64_t v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint32_t v26 = v8;
        uint32_t v27 = 32;
      }
      _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v31, v27);
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    id v10 = [*(id *)(a1 + 40) requestID];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v31 = 138544386;
    id v32 = @"connectToEndpointWithOutputDeviceUID";
    __int16 v33 = 2114;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v6;
    __int16 v37 = 2114;
    uint64_t v38 = v11;
    __int16 v39 = 2048;
    uint64_t v40 = v13;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v31, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  uint64_t v30 = *(void *)(a1 + 56);
  if (v30) {
    (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v5, v6);
  }
}

void __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_195(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_2;
    v5[3] = &unk_1E57D0DE0;
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v6 connectToExternalDeviceWithOptions:0 details:v4 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)migrateToOrAddOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v15 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  [(MRPlaybackSessionMigrateRequest *)v15 setInitiator:@"routePicker"];
  BOOL v16 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v17 = [(MRPlaybackSessionMigrateRequest *)v15 requestID];
  id v49 = v11;
  id v44 = -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v11, v17);
  id v18 = [NSString alloc];
  __int16 v50 = self;
  uint64_t v19 = [(MRAVEndpoint *)self debugName];
  uint64_t v45 = v10;
  id v20 = MRAVOutputDeviceArrayDescription(v10);
  id v21 = (void *)[v18 initWithFormat:@"source=%@ destination=%@", v19, v20];

  uint32_t v22 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"migrateToOrAddOutputDevices", v17];
  id v23 = v22;
  if (v21) {
    [(__CFString *)v22 appendFormat:@" for %@", v21];
  }
  uint64_t v24 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v23;
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v58[3] = &unk_1E57D80C8;
  id v59 = v21;
  uint64_t v60 = @"migrateToOrAddOutputDevices";
  id v25 = v17;
  id v61 = v25;
  id v62 = v16;
  uint32_t v26 = v15;
  v63 = v26;
  id v65 = v13;
  id v27 = v12;
  id v64 = v27;
  id v48 = v13;
  id v47 = v16;
  id v46 = v21;
  uint64_t v28 = (void *)MEMORY[0x1997190F0](v58);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  void v51[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v51[3] = &unk_1E57D80F0;
  v29 = v26;
  __int16 v52 = v29;
  id v53 = v50;
  id v30 = v45;
  id v54 = v30;
  id v55 = v44;
  id v31 = v27;
  id v56 = v31;
  id v32 = v28;
  id v57 = v32;
  id v33 = v44;
  id v34 = (void (**)(void))MEMORY[0x1997190F0](v51);
  __int16 v35 = (void *)MRMediaRemoteCopyDeviceUID();

  if (v35)
  {
    id v36 = _MRLogForCategory(0xAuLL);
    __int16 v37 = v49;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = @"migrateToOrAddOutputDevices";
      __int16 v68 = 2114;
      id v69 = v25;
      __int16 v70 = 2112;
      v71 = @"Not attempting to migrate because local device is groupable...";
      _os_log_impl(&dword_194F3C000, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v38 = v29;
    uint64_t v39 = 1;
LABEL_19:
    [(MRPlaybackSessionMigrateRequest *)v38 setFallbackReason:v39];
    v34[2](v34);
    goto LABEL_20;
  }
  if (!MRGroupSessionAllowsMigrationForEndpoint(v50))
  {
    id v43 = _MRLogForCategory(0xAuLL);
    __int16 v37 = v49;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = @"migrateToOrAddOutputDevices";
      __int16 v68 = 2114;
      id v69 = v25;
      __int16 v70 = 2112;
      v71 = @"Not attempting to migrate because endpoint is migration-restricted group session endpoint";
      _os_log_impl(&dword_194F3C000, v43, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v38 = v29;
    uint64_t v39 = 15;
    goto LABEL_19;
  }
  uint64_t v40 = objc_msgSend(v30, "mr_filter:", &__block_literal_global_215);
  uint64_t v41 = [v40 count];

  if (v41)
  {
    id v42 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = @"migrateToOrAddOutputDevices";
      __int16 v68 = 2114;
      id v69 = v25;
      __int16 v70 = 2112;
      v71 = @"Not attempting to migrate because device doesn't support migration..";
      _os_log_impl(&dword_194F3C000, v42, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    [(MRPlaybackSessionMigrateRequest *)v29 setFallbackReason:3];
    v34[2](v34);
    __int16 v37 = v49;
  }
  else
  {
    [(MRPlaybackSessionMigrateRequest *)v29 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v29 endpointOptions] | 2];
    [(MRPlaybackSessionMigrateRequest *)v29 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v29 endpointOptions] & 0xFFFFFFFFFFFFFFFBLL];
    [(MRPlaybackSessionMigrateRequest *)v29 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v29 endpointOptions] | 8];
    -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v29, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v29, "endpointOptions") & 0xFFFFFFFFFFFFFFEFLL | (16 * ((unint64_t)[v30 count] > 1)));
    [(MRPlaybackSessionMigrateRequest *)v29 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v29 endpointOptions] & 0xFFFFFFFFFFFFFFDFLL];
    [(MRPlaybackSessionMigrateRequest *)v29 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v29 endpointOptions] & 0xFFFFFFFFFFFFFFBFLL];
    __int16 v37 = v49;
    [(MRAVEndpoint *)v50 migrateToOutputDevices:v30 request:v29 initiator:v49 queue:v31 completion:v32];
  }
LABEL_20:
}

- (id)_initiatorStringWithInitiator:(void *)a3 uid:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    a1 = [MEMORY[0x1E4F28E78] string];
    if ([v5 length])
    {
      [a1 appendString:v5];
      if ([v6 length]) {
        [a1 appendString:@"/"];
      }
    }
    [a1 appendString:v6];
  }

  return a1;
}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      BOOL v16 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      id v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v16;
      __int16 v35 = 2048;
      uint64_t v36 = v17;
      id v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      id v21 = *(void **)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      id v30 = v21;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      id v34 = v23;
      id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    BOOL v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    id v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    id v34 = v3;
    __int16 v35 = 2114;
    uint64_t v36 = v10;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v3, v6);
  }
LABEL_14:

  [*(id *)(a1 + 64) finalize];
  uint64_t v24 = MRLogCategoryMigrationOversize();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [*(id *)(a1 + 64) report];
    *(_DWORD *)buf = 138412290;
    id v30 = v25;
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint32_t v26 = *(void **)(a1 + 80);
  if (v26)
  {
    id v28 = v26;
    id v27 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_203(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) startEvent:@"addOutputDevices"];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v6[3] = &unk_1E57D1DA0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 72);
  [v2 addOutputDevices:v3 initiator:v4 withReplyQueue:v5 completion:v6];
}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"addOutputDevices" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_213(uint64_t a1, void *a2)
{
  return [a2 supportsMigration] ^ 1;
}

- (void)migrateToOrSetOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v15 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  [(MRPlaybackSessionMigrateRequest *)v15 setInitiator:@"routePicker"];
  BOOL v16 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v17 = [(MRPlaybackSessionMigrateRequest *)v15 requestID];
  id v47 = v11;
  id v43 = -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v11, v17);
  id v18 = [NSString alloc];
  uint64_t v19 = [(MRAVEndpoint *)self debugName];
  id v44 = v10;
  uint32_t v20 = MRAVOutputDeviceArrayDescription(v10);
  id v21 = (void *)[v18 initWithFormat:@"source=%@ destination=%@", v19, v20];

  uint64_t v22 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"migrateToOrSetOutputDevices", v17];
  id v23 = v22;
  if (v21) {
    [(__CFString *)v22 appendFormat:@" for %@", v21];
  }
  uint64_t v24 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v64 = v23;
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v55[3] = &unk_1E57D80C8;
  id v56 = v21;
  id v57 = @"migrateToOrSetOutputDevices";
  id v25 = v17;
  id v58 = v25;
  id v59 = v16;
  uint32_t v26 = v15;
  uint64_t v60 = v26;
  id v62 = v13;
  id v27 = v12;
  id v61 = v27;
  id v46 = v13;
  id v45 = v16;
  id v28 = v21;
  v29 = (void *)MEMORY[0x1997190F0](v55);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v48[3] = &unk_1E57D80F0;
  id v30 = v26;
  id v49 = v30;
  __int16 v50 = self;
  id v31 = v44;
  id v51 = v31;
  id v52 = v43;
  id v32 = v27;
  id v53 = v32;
  id v33 = v29;
  id v54 = v33;
  id v34 = v43;
  __int16 v35 = (void (**)(void))MEMORY[0x1997190F0](v48);
  if ([(MRAVEndpoint *)self isCompanionEndpoint])
  {
    uint64_t v36 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v64 = @"migrateToOrSetOutputDevices";
      __int16 v65 = 2114;
      id v66 = v25;
      __int16 v67 = 2112;
      __int16 v68 = @"Not attempting to migrate because destination is companion...";
      _os_log_impl(&dword_194F3C000, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    __int16 v37 = v30;
    uint64_t v38 = 13;
LABEL_24:
    [(MRPlaybackSessionMigrateRequest *)v37 setFallbackReason:v38];
    v35[2](v35);
    goto LABEL_25;
  }
  uint64_t v39 = (void *)MRMediaRemoteCopyDeviceUID();

  if (v39)
  {
    uint64_t v40 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v64 = @"migrateToOrSetOutputDevices";
      __int16 v65 = 2114;
      id v66 = v25;
      __int16 v67 = 2112;
      __int16 v68 = @"Not attempting to migrate because local device is groupable...";
      _os_log_impl(&dword_194F3C000, v40, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    __int16 v37 = v30;
    uint64_t v38 = 1;
    goto LABEL_24;
  }
  if (!MRGroupSessionAllowsMigrationForEndpoint(self))
  {
    uint64_t v41 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v64 = @"migrateToOrSetOutputDevices";
      __int16 v65 = 2114;
      id v66 = v25;
      __int16 v67 = 2112;
      __int16 v68 = @"Not attempting to migrate because endpoint is migration-restricted group session endpoint";
      _os_log_impl(&dword_194F3C000, v41, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    __int16 v37 = v30;
    uint64_t v38 = 15;
    goto LABEL_24;
  }
  if (MRAVOutputDeviceArrayNumberOfLogicalDevices(v31) != 1)
  {
    id v42 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v64 = @"migrateToOrSetOutputDevices";
      __int16 v65 = 2114;
      id v66 = v25;
      __int16 v67 = 2112;
      __int16 v68 = @"Not attempting to migrate because more than one logical device requested...";
      _os_log_impl(&dword_194F3C000, v42, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    __int16 v37 = v30;
    uint64_t v38 = 2;
    goto LABEL_24;
  }
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 2];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 4];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] & 0xFFFFFFFFFFFFFFF7];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 0x20];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 0x10];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] & 0xFFFFFFFFFFFFFFBFLL];
  [(MRAVEndpoint *)self migrateToOutputDevices:v31 request:v30 initiator:v47 queue:v32 completion:v33];
LABEL_25:
}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      BOOL v16 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      id v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v16;
      __int16 v35 = 2048;
      uint64_t v36 = v17;
      id v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      id v21 = *(void **)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      id v30 = v21;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      id v34 = v23;
      id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    BOOL v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    id v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    id v34 = v3;
    __int16 v35 = 2114;
    uint64_t v36 = v10;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v3, v6);
  }
LABEL_14:

  [*(id *)(a1 + 64) finalize];
  uint64_t v24 = MRLogCategoryMigrationOversize();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [*(id *)(a1 + 64) report];
    *(_DWORD *)buf = 138412290;
    id v30 = v25;
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint32_t v26 = *(void **)(a1 + 80);
  if (v26)
  {
    id v28 = v26;
    id v27 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) startEvent:@"setOutputDevices"];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v6[3] = &unk_1E57D1DA0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 72);
  [v2 setOutputDevices:v3 initiator:v4 withReplyQueue:v5 completion:v6];
}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"setOutputDevices" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)migrateToOutputDevice:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  uint64_t v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 arrayWithObjects:&v19 count:1];

  -[MRAVEndpoint migrateToOutputDevices:request:initiator:queue:completion:](self, "migrateToOutputDevices:request:initiator:queue:completion:", v18, v16, v15, v14, v13, v19, v20);
}

- (void)migrateToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[MRUserSettings currentSettings];
  int v17 = [v16 supportOutOfProcessMigration];

  if (v17)
  {
    id v18 = (void *)MRGetSharedService();
    if ([(MRAVEndpoint *)self isLocalEndpoint])
    {
      MRMediaRemoteServiceMigrateFromEndpointToOutputDevices(v18, 0, v20, v12, v14, v15);
    }
    else
    {
      id v19 = [(MRAVEndpoint *)self uniqueIdentifier];
      MRMediaRemoteServiceMigrateFromEndpointToOutputDevices(v18, v19, v20, v12, v14, v15);
    }
  }
  else
  {
    [(MRAVEndpoint *)self performMigrationToOutputDevices:v20 request:v12 initiator:v13 queue:v14 completion:v15];
  }
}

- (void)migrateToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[MRUserSettings currentSettings];
  int v14 = [v13 supportOutOfProcessMigration];

  if (!v14)
  {
    [(MRAVEndpoint *)self performMigrationToEndpoint:v19 request:v10 queue:v11 completion:v12];
    goto LABEL_11;
  }
  id v15 = (void *)MRGetSharedService();
  BOOL v16 = [(MRAVEndpoint *)self isLocalEndpoint];
  if (v16)
  {
    int v17 = 0;
  }
  else
  {
    int v17 = [(MRAVEndpoint *)self uniqueIdentifier];
  }
  if (![v19 isLocalEndpoint])
  {
    id v18 = [v19 uniqueIdentifier];
    MRMediaRemoteServiceMigrateFromEndpointToEndpoint(v15, v17, v18, v10, v11, v12);

    if (v16) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  MRMediaRemoteServiceMigrateFromEndpointToEndpoint(v15, v17, 0, v10, v11, v12);
  if (!v16) {
LABEL_10:
  }

LABEL_11:
}

- (void)migrateToEndpointOrModifyTopology:(id)a3 migrationRequest:(id)a4 topologyModificationRequest:(id)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __121__MRAVEndpoint_migrateToEndpointOrModifyTopology_migrationRequest_topologyModificationRequest_withReplyQueue_completion___block_invoke;
  v18[3] = &unk_1E57D6188;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v15 = v13;
  id v16 = v12;
  id v17 = v14;
  [(MRAVEndpoint *)self migrateToEndpoint:a3 request:a4 queue:v15 completion:v18];
}

uint64_t __121__MRAVEndpoint_migrateToEndpointOrModifyTopology_migrationRequest_topologyModificationRequest_withReplyQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) modifyTopologyWithRequest:*(void *)(a1 + 40) withReplyQueue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)performMigrationToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v89 = a7;
  if (v13)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    id v16 = (id)MEMORY[0x1E4F14428];
    id v19 = MEMORY[0x1E4F14428];
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 789, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  if (v14)
  {
LABEL_4:
    id v17 = (MRPlaybackSessionMigrateRequest *)v14;
    goto LABEL_8;
  }
LABEL_7:
  id v17 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
LABEL_8:
  id v20 = v17;
  v93 = [MEMORY[0x1E4F1C9C8] date];
  id v21 = [(MRPlaybackSessionMigrateRequest *)v20 requestID];
  v95 = v15;
  v87 = -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v15, v21);
  id v22 = [NSString alloc];
  id v23 = [(MRAVEndpoint *)self debugName];
  uint64_t v24 = MRAVOutputDeviceArrayDescription(v13);
  id v25 = (void *)[v22 initWithFormat:@"source=%@ destination=%@", v23, v24];

  uint32_t v26 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"migrateToOutputDevice", v21];
  id v27 = v26;
  if (v25) {
    [(__CFString *)v26 appendFormat:@" for %@", v25];
  }
  id v28 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v169 = v27;
    _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke;
  v159[3] = &unk_1E57D8140;
  id v92 = v25;
  id v160 = v92;
  v161 = @"migrateToOutputDevice";
  id v29 = v21;
  id v162 = v29;
  id v91 = v93;
  id v163 = v91;
  id v94 = v14;
  id v164 = v94;
  id v30 = v20;
  v165 = v30;
  id v90 = v89;
  id v167 = v90;
  id v31 = v16;
  id v166 = v31;
  uint64_t v32 = (void *)MEMORY[0x1997190F0](v159);
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2;
  v150[3] = &unk_1E57D6160;
  __int16 v33 = v30;
  v151 = v33;
  v152 = @"migrateToOutputDevice";
  id v34 = v29;
  id v153 = v34;
  v154 = self;
  id v35 = v13;
  id v155 = v35;
  id v88 = v87;
  id v156 = v88;
  id v36 = v31;
  id v157 = v36;
  id v37 = v32;
  id v158 = v37;
  uint64_t v38 = (void *)MEMORY[0x1997190F0](v150);
  v145[0] = MEMORY[0x1E4F143A8];
  v145[1] = 3221225472;
  v145[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3;
  v145[3] = &unk_1E57D8190;
  v145[4] = self;
  uint64_t v39 = v33;
  v146 = v39;
  id v40 = v36;
  id v147 = v40;
  id v41 = v37;
  id v148 = v41;
  id v42 = v38;
  id v149 = v42;
  id v43 = (void *)MEMORY[0x1997190F0](v145);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5;
  v136[3] = &unk_1E57D81E0;
  v137 = @"migrateToOutputDevice";
  id v44 = v34;
  id v138 = v44;
  id v45 = v39;
  v139 = v45;
  id v46 = v35;
  id v140 = v46;
  id v86 = v95;
  id v141 = v86;
  id v47 = v40;
  id v142 = v47;
  id v48 = v41;
  id v143 = v48;
  id v49 = v43;
  id v144 = v49;
  v81 = (void *)MEMORY[0x1997190F0](v136);
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_262;
  v131[3] = &unk_1E57D8230;
  __int16 v50 = v45;
  v132 = v50;
  id v51 = v47;
  id v133 = v51;
  id v52 = v44;
  id v134 = v52;
  id v53 = v48;
  id v135 = v53;
  id v54 = (void *)MEMORY[0x1997190F0](v131);
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_276;
  v124[3] = &unk_1E57D8280;
  id v55 = v50;
  v125 = v55;
  id v83 = v54;
  id v128 = v83;
  v126 = @"migrateToOutputDevice";
  id v56 = v42;
  id v129 = v56;
  id v85 = v53;
  id v130 = v85;
  v127 = self;
  id v57 = (void *)MEMORY[0x1997190F0](v124);
  id v58 = objc_msgSend(v46, "mr_filter:", &__block_literal_global_296);
  uint64_t v59 = [v58 count];

  if (v59)
  {
    uint64_t v60 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v169 = @"migrateToOutputDevice";
      __int16 v170 = 2114;
      id v171 = v52;
      __int16 v172 = 2112;
      v173 = @"Migrating to silent primary. Will break any pre-existing groups...";
      _os_log_impl(&dword_194F3C000, v60, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    [(MRPlaybackSessionMigrateRequest *)v55 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v55 endpointOptions] | 4];
  }
  v96 = objc_msgSend(v46, "mr_map:", &__block_literal_global_303);
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_304;
  v115[3] = &unk_1E57D82D0;
  id v61 = v55;
  v116 = v61;
  id v62 = v46;
  id v117 = v62;
  v118 = @"migrateToOutputDevice";
  id v63 = v52;
  id v119 = v63;
  id v82 = v49;
  id v121 = v82;
  id v84 = v51;
  id v120 = v84;
  id v64 = v56;
  id v122 = v64;
  id v65 = v81;
  id v123 = v65;
  id v66 = (void *)MEMORY[0x1997190F0](v115);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_319;
  v108[3] = &unk_1E57D8318;
  v109 = @"migrateToOutputDevice";
  id v67 = v63;
  id v110 = v67;
  v111 = self;
  id v68 = v57;
  id v113 = v68;
  id v69 = v62;
  id v112 = v69;
  id v70 = v66;
  id v114 = v70;
  v71 = (void *)MEMORY[0x1997190F0](v108);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_347;
  v101[3] = &unk_1E57D8340;
  v102 = @"migrateToOutputDevice";
  id v72 = v67;
  id v103 = v72;
  v73 = v61;
  id v104 = v73;
  id v74 = v64;
  id v105 = v74;
  id v75 = v71;
  id v106 = v75;
  id v76 = v70;
  id v107 = v76;
  v77 = (void (**)(void, void, void, void))MEMORY[0x1997190F0](v101);
  if (objc_msgSend(v69, "mr_all:", &__block_literal_global_360))
  {
    id LocalEndpoint = MRAVEndpointGetLocalEndpoint(0);
    ((void (**)(void, void, id, void))v77)[2](v77, 0, LocalEndpoint, 0);
  }
  else
  {
    [v73 startEvent:@"search"];
    v79 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v96 outputDeviceGroupID:0 features:8];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_365;
    v97[3] = &unk_1E57D7E88;
    v98 = v79;
    id v99 = v73;
    v100 = v77;
    v80 = v79;
    [(MRAVReconnaissanceSession *)v80 beginSearchWithTimeout:v97 endpointsCompletion:7.0];
  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      id v15 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      id v16 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      id v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v16;
      __int16 v35 = 2048;
      uint64_t v36 = v17;
      id v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      id v21 = *(void **)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      id v30 = v21;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      id v34 = v23;
      id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    BOOL v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    id v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    id v34 = v3;
    __int16 v35 = 2114;
    uint64_t v36 = v10;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v3, v6);
  }
LABEL_14:

  if (!*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 72) finalize];
    uint64_t v24 = MRLogCategoryMigrationOversize();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [*(id *)(a1 + 72) report];
      *(_DWORD *)buf = 138412290;
      id v30 = v25;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  uint32_t v26 = *(void **)(a1 + 88);
  if (v26)
  {
    id v28 = v26;
    id v27 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_242(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) endpointOptions] & 8) != 0)
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Falling back to addOutputDevices because %@...", v3];
    uint64_t v5 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v4;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) startEvent:@"addOutputDevices"];
    unint64_t v8 = ((unint64_t)[*(id *)(a1 + 32) playerOptions] >> 6) & 1;
    BOOL v9 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 80);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_246;
    void v13[3] = &unk_1E57D10A8;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 88);
    [v9 addOutputDevices:v10 initiator:v11 fadeAudio:v8 withReplyQueue:v12 completion:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_246(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) endEvent:@"addOutputDevices" withError:v3];
  if (!v3 && ([*(id *)(a1 + 32) playerOptions] & 4) != 0)
  {
    [*(id *)(a1 + 32) startEvent:@"play"];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) requestID];
    unint64_t v8 = (void *)[v5 initWithFormat:@"%@<%@>", v6, v7];
    [v4 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_247;
    v9[3] = &unk_1E57D3900;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_247(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"play" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4;
  v7[3] = &unk_1E57D8168;
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 64);
  [v4 performMigrationToEndpoint:a2 request:v5 queue:v6 completion:v7];
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", MRPlaybackSessionMigrateFallbackReasonFromMRMediaRemoteError(objc_msgSend(v3, "code")));
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = @"Migrating back to local. Route to selected output device then migrate.";
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, v3);
  [*(id *)(a1 + 48) startEvent:@"routeToDevice"];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_255;
  v10[3] = &unk_1E57D81B8;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 88);
  [v3 setOutputDevices:v7 initiator:v8 withReplyQueue:v9 completion:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_255(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) endEvent:@"routeToDevice" withError:v3];
    uint64_t v5 = _MRLogForCategory(0xAuLL);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        int v16 = 138543874;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        __int16 v21 = @"Failed to set route. Cancel migration.";
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
      }

      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (v6)
      {
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        int v16 = 138543874;
        uint64_t v17 = v14;
        __int16 v18 = 2114;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        __int16 v21 = @"Successfully set route. Begin migration.";
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
      }

      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v9();
  }
  else
  {
    id v10 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v16 = 138543874;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = @"Failed to set route. Cancel migration.";
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
    }

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:118];
    [*(id *)(a1 + 32) endEvent:@"routeToDevice" withError:v13];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_262(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] startEvent:@"discoverDestinationEndpoint"];
  id v4 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_266;
  v8[3] = &unk_1E57D8208;
  uint64_t v9 = v4;
  id v5 = a1[5];
  id v10 = a1[4];
  id v11 = a1[6];
  id v12 = v3;
  id v13 = a1[5];
  id v14 = a1[7];
  id v6 = v3;
  uint64_t v7 = v4;
  [(MRAVLightweightReconnaissanceSession *)v7 searchEndpointsForLeaderOutputDeviceUID:v6 timeout:@"discoverDestinationEndpoint" reason:v5 queue:v8 completion:7.0];
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_266(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v5 endEvent:@"discoverDestinationEndpoint" withError:a3];
  [*(id *)(a1 + 40) startEvent:@"updateActiveSystemEndpoint"];
  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"migrationPlaybackSession<%@> for Expanse handoff", *(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_273;
  v10[3] = &unk_1E57D26E8;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 72);
  MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType(v8, 0, 0, (uint64_t)v7, v9, v10);
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_273(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"updateActiveSystemEndpoint" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_276(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_277;
  v22[3] = &unk_1E57D8258;
  id v23 = a1[4];
  id v26 = a1[7];
  id v24 = a1[5];
  id v4 = v3;
  id v25 = v4;
  id v27 = a1[8];
  id v28 = a1[9];
  id v5 = (void *)MEMORY[0x1997190F0](v22);
  [a1[4] setRequestType:3];
  [a1[4] startEvent:@"expanseMigration"];
  id v6 = [a1[6] groupLeader];
  int v7 = [v6 containsUID:v4];

  uint64_t v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v30 = v10;
      __int16 v31 = 2114;
      id v32 = v4;
      __int16 v33 = 2112;
      id v34 = @"Removing Apple TV from Expanse session.";
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v11 = +[MRExpanseManager sharedManager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_289;
    v20[3] = &unk_1E57D0FE8;
    id v12 = &v21;
    __int16 v21 = v5;
    id v13 = v5;
    [v11 removeTelevisionWithRouteIdentifierFromSession:v4 completion:v20];
  }
  else
  {
    if (v9)
    {
      id v14 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v30 = v14;
      __int16 v31 = 2114;
      id v32 = v4;
      __int16 v33 = 2112;
      id v34 = @"Migrating to Apple TV using Expanse handoff.";
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v15 = +[MRExpanseManager sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_293;
    v17[3] = &unk_1E57D0DE0;
    id v12 = &v19;
    uint64_t v19 = v5;
    id v18 = v4;
    id v16 = v5;
    [v15 addTelevisionWithRouteIdentifierToSession:v18 completion:v17];

    id v11 = v18;
  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_277(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) endEvent:@"expanseMigration" withError:v6];
  if (v6)
  {
    int v7 = objc_msgSend(v6, "mr_errorByEnvelopingWithMRError:", 174);
    uint64_t v8 = +[MRExpanseManager sharedManager];
    int v9 = [v8 errorIsTelevisionCapabilitiesError:v6];

    if (v9)
    {
      id v10 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 48);
        int v14 = 138543874;
        uint64_t v15 = v11;
        __int16 v16 = 2114;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        uint64_t v19 = @"Expanse fallback due to insufficient capabilities.";
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v14, 0x20u);
      }

      [*(id *)(a1 + 32) setFallbackReason:14];
      uint64_t v13 = *(void *)(a1 + 64);
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 72);
    }
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_293(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_294(uint64_t a1, void *a2)
{
  return [a2 isProxyGroupPlayer];
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_300(uint64_t a1, void *a2)
{
  return [a2 uid];
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_304(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) endpointOptions] & 0x40) == 0
    || (unint64_t)[v3 logicalOutputDeviceCount] < 2)
  {
    if ([v3 isLocalEndpoint])
    {
      uint64_t v8 = *(void *)(a1 + 88);
LABEL_12:
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v8 = *(void *)(a1 + 72);
    goto LABEL_12;
  }
  id v4 = [v3 designatedGroupLeader];
  id v5 = [v4 uid];
  id v6 = [*(id *)(a1 + 40) firstObject];
  int v7 = [v6 uid];
  if ([v5 isEqualToString:v7])
  {

LABEL_8:
    uint64_t v13 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      __int16 v31 = @"Migrating to group leader with group break behavior. Will reset output context on destination.";
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 4);
    goto LABEL_11;
  }
  int v9 = [v3 designatedGroupLeader];
  id v10 = [v9 logicalDeviceID];
  uint64_t v11 = [*(id *)(a1 + 40) firstObject];
  uint64_t v12 = [v11 logicalDeviceID];
  char v21 = [v10 isEqualToString:v12];

  if (v21) {
    goto LABEL_8;
  }
  __int16 v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = @"Migrating to secondary with group break behavior. Will form endpoint for secondary and migrate.";
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  uint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "mr_map:", &__block_literal_global_314);
  [*(id *)(a1 + 32) startEvent:@"createSecondaryEndpoint"];
  uint64_t v20 = *(void *)(a1 + 64);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_318;
  v22[3] = &unk_1E57D82A8;
  id v23 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 72);
  id v25 = *(id *)(a1 + 80);
  +[MRAVEndpoint directEndpointForOutputDeviceUIDs:v19 queue:v20 completion:v22];

LABEL_13:
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_311(uint64_t a1, void *a2)
{
  return [a2 uid];
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_318(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) endEvent:@"createSecondaryEndpoint" withError:v5];
  if (v7)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) setFallbackReason:12];
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_319(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v5;
    __int16 v52 = 2114;
    uint64_t v53 = v6;
    __int16 v54 = 2112;
    id v55 = @"Checking for conversation handoff support.";
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (![v3 isLocalEndpoint]
    || (+[MRExpanseManager sharedManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 expanseSessionHasRemoteActivity],
        v7,
        !v8))
  {
    if ([*(id *)(a1 + 48) isLocalEndpoint])
    {
      __int16 v31 = +[MRExpanseManager sharedManager];
      if (![(__CFString *)v31 expanseHandoffSupported]) {
        goto LABEL_32;
      }
      uint64_t v32 = +[MRExpanseManager sharedManager];
      int v33 = [v32 expanseSessionHasActiveActivity];

      if (v33)
      {
        id v34 = _MRLogForCategory(0xAuLL);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = *(void *)(a1 + 32);
          uint64_t v36 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = v35;
          __int16 v52 = 2114;
          uint64_t v53 = v36;
          __int16 v54 = 2112;
          id v55 = @"Evaluating possible conversation push.";
          _os_log_impl(&dword_194F3C000, v34, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 56), "mr_compactMap:", &__block_literal_global_341);
        __int16 v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (![(__CFString *)v31 count]) {
          goto LABEL_32;
        }
        if ([*(id *)(a1 + 56) count] != 1)
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_345;
          v48[3] = &unk_1E57D2A90;
          id v44 = v3;
          id v49 = v44;
          id v45 = [(__CFString *)v31 msv_firstWhere:v48];
          if (!v45
            || ([v44 groupLeader],
                id v46 = objc_claimAutoreleasedReturnValue(),
                int v47 = [v46 supportsSharePlayHandoff],
                v46,
                !v47))
          {

            id v41 = v49;
LABEL_31:

            goto LABEL_32;
          }
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

          id v40 = v49;
LABEL_29:

          goto LABEL_34;
        }
        __int16 v37 = [*(id *)(a1 + 56) firstObject];
        int v38 = [v37 supportsSharePlayHandoff];

        if (v38)
        {
          uint64_t v39 = *(void *)(a1 + 64);
          id v40 = [(__CFString *)v31 firstObject];
          (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);
          goto LABEL_29;
        }
LABEL_32:
      }
    }
LABEL_33:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_34;
  }
  int v9 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v10;
    __int16 v52 = 2114;
    uint64_t v53 = v11;
    __int16 v54 = 2112;
    id v55 = @"Evaluating possible conversation pull.";
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  uint64_t v12 = +[MRExpanseManager sharedManager];
  uint64_t v13 = [*(id *)(a1 + 48) groupLeader];
  int v14 = [v12 deviceIsActiveTelevision:v13];

  uint64_t v15 = NSString;
  __int16 v16 = +[MRExpanseManager sharedManager];
  uint64_t v17 = [v16 activeTelevisionRouteID];
  uint64_t v18 = [*(id *)(a1 + 48) groupLeader];
  uint64_t v19 = (void *)v18;
  if (!v14)
  {
    __int16 v31 = [v15 stringWithFormat:@"Failed to match activeTV: %@ to groupLeader: %@", v17, v18];

    id v41 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = *(void *)(a1 + 32);
      uint64_t v43 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v43;
      __int16 v54 = 2112;
      id v55 = v31;
      _os_log_impl(&dword_194F3C000, v41, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    goto LABEL_31;
  }
  uint64_t v20 = [v15 stringWithFormat:@"Matched activeTV: %@ to groupLeader: %@", v17, v18];

  char v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v22;
    __int16 v52 = 2114;
    uint64_t v53 = v23;
    __int16 v54 = 2112;
    id v55 = v20;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  id v24 = [*(id *)(a1 + 48) groupLeader];
  int v25 = [v24 deviceSubtype];

  id v26 = [*(id *)(a1 + 48) groupLeader];
  uint64_t v27 = v26;
  if (v25 == 15)
  {
    __int16 v28 = [v26 clusterComposition];
    uint64_t v29 = objc_msgSend(v28, "msv_firstWhere:", &__block_literal_global_332);
    __int16 v30 = [v29 uid];
  }
  else
  {
    __int16 v30 = [v26 uid];
  }

  if (!v30) {
    goto LABEL_33;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_34:
}

BOOL __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_329(uint64_t a1, void *a2)
{
  return [a2 deviceSubtype] == 13;
}

id __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_339(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 deviceSubtype] == 13)
  {
    id v3 = [v2 uid];
  }
  else if ([v2 deviceSubtype] == 15)
  {
    id v4 = [v2 clusterComposition];
    uint64_t v5 = objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_344);
    id v3 = [v5 uid];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

BOOL __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_342(uint64_t a1, void *a2)
{
  return [a2 deviceSubtype] == 13;
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_345(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 groupLeader];
  uint64_t v5 = [v4 containsUID:v3];

  return v5;
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_347(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (([v8 isLocalEndpoint] & 1) == 0)
    {
      if (![v7 count]
        || (objc_msgSend(v7, "mr_filter:", &__block_literal_global_350),
            int v14 = objc_claimAutoreleasedReturnValue(),
            uint64_t v15 = [v14 count],
            v14,
            v15))
      {
        __int16 v16 = _MRLogForCategory(0xAuLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = *(void *)(a1 + 40);
          int v21 = 138543874;
          uint64_t v22 = v17;
          __int16 v23 = 2114;
          uint64_t v24 = v18;
          __int16 v25 = 2112;
          id v26 = @"Not attempting to migrate because device is not remote controllable.";
          _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v21, 0x20u);
        }

        [*(id *)(a1 + 48) setFallbackReason:3];
        uint64_t v19 = *(void *)(a1 + 56);
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
        (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
        goto LABEL_16;
      }
    }
    uint64_t v10 = +[MRUserSettings currentSettings];
    int v11 = [v10 supportExpanseMigration];

    if (v11) {
      uint64_t v12 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v12 = *(void *)(a1 + 72);
    }
    uint64_t v13 = *(void (**)(void))(v12 + 16);
  }
  else
  {
    [*(id *)(a1 + 48) setFallbackReason:5];
    if (!v9)
    {
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"Output devices are not in the same endpoint"];
      (*(void (**)(void, void *))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v20);
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v13();
LABEL_17:
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_348(uint64_t a1, void *a2)
{
  return [a2 isRemoteControllable] ^ 1;
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_358(uint64_t a1, void *a2)
{
  return [a2 isLocalDevice];
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_365(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = a5;
  id v12 = a4;
  id v13 = a2;
  [v9 endEvent:@"search" withError:v11];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performMigrationToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v59 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    id v13 = (id)MEMORY[0x1E4F14428];
    id v16 = MEMORY[0x1E4F14428];
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 1068, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  if (v12)
  {
LABEL_4:
    int v14 = (MRPlaybackSessionMigrateRequest *)v12;
    goto LABEL_8;
  }
LABEL_7:
  int v14 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
LABEL_8:
  uint64_t v17 = v14;
  [(MRPlaybackSessionMigrateRequest *)v14 setOriginatorType:MRAnalyticsCompositionForEndpoint(self)];
  [(MRPlaybackSessionMigrateRequest *)v17 addDestinationType:MRAnalyticsCompositionForEndpoint(v11)];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v19 = [(MRPlaybackSessionMigrateRequest *)v17 requestID];
  id v20 = [NSString alloc];
  int v21 = [(MRAVEndpoint *)self debugName];
  id v64 = v11;
  uint64_t v22 = [v11 debugName];
  __int16 v23 = (void *)[v20 initWithFormat:@"source=%@ destination=%@", v21, v22];

  uint64_t v24 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"migrateToEndpoint", v19];
  __int16 v25 = v24;
  if (v23) {
    [(__CFString *)v24 appendFormat:@" for %@", v23];
  }
  id v26 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v90 = v25;
    _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke;
  v80[3] = &unk_1E57D8140;
  id v62 = v23;
  id v81 = v62;
  id v82 = @"migrateToEndpoint";
  id v27 = v19;
  id v83 = v27;
  id v61 = v18;
  id v84 = v61;
  id v63 = v12;
  id v85 = v63;
  __int16 v28 = v17;
  id v86 = v28;
  id v60 = v59;
  id v88 = v60;
  id v29 = v13;
  id v87 = v29;
  __int16 v30 = (void (**)(void, void))MEMORY[0x1997190F0](v80);
  if (-[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint") && [v64 isLocalEndpoint])
  {
    __int16 v31 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [(MRPlaybackSessionMigrateRequest *)v28 requestID];
      *(_DWORD *)buf = 138543874;
      id v90 = @"migrateToEndpoint";
      __int16 v91 = 2114;
      id v92 = v32;
      __int16 v93 = 2112;
      id v94 = @"Already airplaying to device. Removing All outputDevices instead...";
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    [(MRPlaybackSessionMigrateRequest *)v28 setRequestType:1];
    [(MRPlaybackSessionMigrateRequest *)v28 startEvent:@"removeOutputDevices"];
    ErrorWithDescription = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    unint64_t v34 = ((unint64_t)[(MRPlaybackSessionMigrateRequest *)v28 playerOptions] >> 6) & 1;
    id v35 = [NSString alloc];
    uint64_t v36 = [(MRPlaybackSessionMigrateRequest *)v28 initiator];
    __int16 v37 = [(MRPlaybackSessionMigrateRequest *)v28 requestID];
    int v38 = (void *)[v35 initWithFormat:@"%@-%@", v36, v37];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_378;
    v76[3] = &unk_1E57D10A8;
    v77 = v28;
    v78 = @"migrateToEndpoint";
    v79 = v30;
    [ErrorWithDescription setOutputDevices:0 initiator:v38 fadeAudio:v34 withReplyQueue:v29 completion:v76];

    goto LABEL_20;
  }
  if (([(MRPlaybackSessionMigrateRequest *)v28 endpointOptions] & 0x20) == 0)
  {
    uint64_t v39 = [(MRAVEndpoint *)self outputDevicesMatchingPredicate:&__block_literal_global_380];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      id v41 = [NSString alloc];
      uint64_t v42 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(32);
      uint64_t v43 = [(MRAVEndpoint *)self outputDevices];
      id v44 = MRAVOutputDeviceArrayDescription(v43);
      id v45 = (void *)[v41 initWithFormat:@"%@ option is not present and source contains %@", v42, v44];
      ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(150, (uint64_t)v45);

      ((void (**)(void, void *))v30)[2](v30, ErrorWithDescription);
LABEL_20:
      id v46 = v64;
      goto LABEL_25;
    }
  }
  id v46 = v64;
  if (([(MRPlaybackSessionMigrateRequest *)v28 endpointOptions] & 0x10) != 0
    || ([v64 outputDevices],
        int v47 = objc_claimAutoreleasedReturnValue(),
        unint64_t v48 = MRAVOutputDeviceArrayNumberOfLogicalDevices(v47),
        v47,
        v48 < 2))
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_4;
    v71[3] = &unk_1E57D8230;
    __int16 v54 = v28;
    id v72 = v54;
    id v73 = v27;
    id v55 = v29;
    id v74 = v55;
    uint64_t v56 = v30;
    id v75 = v56;
    id v57 = (void *)MEMORY[0x1997190F0](v71);
    [(MRPlaybackSessionMigrateRequest *)v54 startEvent:@"connect"];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_6;
    v65[3] = &unk_1E57D83B8;
    id v66 = v54;
    id v67 = v55;
    id v68 = v64;
    id v69 = v57;
    id v70 = v56;
    id v58 = v57;
    -[MRAVEndpoint _prepareToMigrateToEndpoint:queue:completion:](self, v68, v67, v65);

    ErrorWithDescription = v72;
  }
  else
  {
    id v49 = [NSString alloc];
    __int16 v50 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(16);
    uint64_t v51 = [v64 outputDevices];
    __int16 v52 = MRAVOutputDeviceArrayDescription(v51);
    uint64_t v53 = (void *)[v49 initWithFormat:@"%@ option is not present and destination contains %@", v50, v52];
    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(151, (uint64_t)v53);

    ((void (**)(void, void *))v30)[2](v30, ErrorWithDescription);
  }
LABEL_25:
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  uint64_t v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      id v16 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      __int16 v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v16;
      __int16 v35 = 2048;
      uint64_t v36 = v17;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      int v21 = *(void **)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      __int16 v30 = v21;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      id v34 = v23;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    id v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    __int16 v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    id v34 = v3;
    __int16 v35 = 2114;
    uint64_t v36 = v10;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v3, v6);
  }
LABEL_14:

  if (!*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 72) finalize];
    uint64_t v24 = MRLogCategoryMigrationOversize();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = [*(id *)(a1 + 72) report];
      *(_DWORD *)buf = 138412290;
      __int16 v30 = v25;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v26 = *(void **)(a1 + 88);
  if (v26)
  {
    id v28 = v26;
    id v27 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_370(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_378(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) endEvent:@"removeOutputDevices" withError:v3];
  if (!v3 && ([*(id *)(a1 + 32) playerOptions] & 4) != 0)
  {
    [*(id *)(a1 + 32) startEvent:@"play"];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    BOOL v7 = [*(id *)(a1 + 32) requestID];
    uint64_t v8 = (void *)[v5 initWithFormat:@"%@<%@>", v6, v7];
    [v4 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_2;
    v9[3] = &unk_1E57D3900;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"play" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 1;
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 startEvent:@"updateActiveSystemEndpoint"];
  id v5 = [NSString alloc];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(2);
  uint64_t v8 = (void *)[v5 initWithFormat:@"migrationPlaybackSession<%@> for option %@", v6, v7];

  id v9 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_5;
  v10[3] = &unk_1E57D26E8;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType((uint64_t)v4, 0, 0, (uint64_t)v8, v9, v10);
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"updateActiveSystemEndpoint" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_6(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [a1[4] endEvent:@"connect" withError:v9];
  if (v7 && v8)
  {
    id v10 = a1[4];
    id v11 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_7;
    v12[3] = &unk_1E57D8390;
    id v13 = a1[6];
    id v14 = a1[4];
    id v15 = a1[5];
    id v16 = a1[7];
    id v17 = a1[8];
    MRMediaRemotePlaybackSessionMigrateForOriginWithRequest(v10, (uint64_t)v7, v8, v11, v12);
  }
  else
  {
    (*((void (**)(void))a1[8] + 2))();
  }
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) groupLeader];
    id v5 = [v4 uid];

    uint64_t v6 = [*(id *)(a1 + 32) outputDeviceUIDs];
    if ([v6 containsObject:v5])
    {
      id v7 = v5;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) outputDeviceUIDs];
      id v7 = [v8 firstObject];
    }
    if (([*(id *)(a1 + 40) endpointOptions] & 0x40) != 0)
    {
      [*(id *)(a1 + 40) startEvent:@"discoverDestinationEndpoint"];
      id v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_8;
      v12[3] = &unk_1E57D8368;
      id v13 = v9;
      uint64_t v10 = *(void *)(a1 + 48);
      id v14 = *(id *)(a1 + 40);
      id v15 = *(id *)(a1 + 56);
      id v11 = v9;
      [(MRAVLightweightReconnaissanceSession *)v11 searchEndpointsForLeaderOutputDeviceUID:v7 timeout:@"discoverDestinationEndpoint" reason:v10 queue:v12 completion:7.0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v7 = a2;
  [v6 endEvent:@"discoverDestinationEndpoint" withError:a3];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [v7 designatedGroupLeader];

  uint64_t v10 = [v9 uid];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
}

- (void)_prepareToMigrateToEndpoint:(void *)a3 queue:(void *)a4 completion:
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_5:
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x3032000000;
        v44[3] = __Block_byref_object_copy__35;
        void v44[4] = __Block_byref_object_dispose__35;
        id v45 = 0;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = __Block_byref_object_copy__35;
        v42[4] = __Block_byref_object_dispose__35;
        id v43 = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__35;
        void v40[4] = __Block_byref_object_dispose__35;
        id v41 = 0;
        id v11 = dispatch_group_create();
        id v46 = @"MREndpointConnectionReasonUserInfoKey";
        v47[0] = @"prepareToMigrateToEndpoint";
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
        dispatch_group_enter(v11);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke;
        v36[3] = &unk_1E57D3A68;
        uint64_t v38 = v40;
        uint64_t v39 = v44;
        v36[4] = a1;
        id v13 = v11;
        __int16 v37 = v13;
        [a1 connectToExternalDeviceWithUserInfo:v12 completion:v36];
        dispatch_group_enter(v13);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_2;
        v31[3] = &unk_1E57D3A68;
        id v34 = v40;
        __int16 v35 = v42;
        id v14 = v7;
        id v32 = v14;
        id v15 = v13;
        __int16 v33 = v15;
        [v14 connectToExternalDeviceWithUserInfo:v12 completion:v31];
        id v16 = [MRBlockGuard alloc];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_3;
        v29[3] = &unk_1E57D0FE8;
        id v17 = v9;
        id v30 = v17;
        uint64_t v18 = [(MRBlockGuard *)v16 initWithTimeout:@"prepareToMigrateToEndpoint" reason:v8 queue:v29 handler:7.0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_4;
        block[3] = &unk_1E57D8430;
        uint64_t v22 = v18;
        id v25 = v17;
        id v26 = v40;
        id v27 = v44;
        id v28 = v42;
        id v23 = v14;
        uint64_t v24 = a1;
        uint64_t v19 = v18;
        dispatch_group_notify(v15, v8, block);

        _Block_object_dispose(v40, 8);
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        goto LABEL_6;
      }
    }
    else
    {
      uint32_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:sel__prepareToMigrateToEndpoint_queue_completion_, a1, @"MRAVEndpoint.m", 1205, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

      if (v8) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)canMigrateToEndpoint:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 1179, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v10)
  {
LABEL_3:
    id v10 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
LABEL_4:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke;
  v22[3] = &unk_1E57D0DE0;
  id v24 = v11;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v15 = (void *)MEMORY[0x1997190F0](v22);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_3;
  v19[3] = &unk_1E57D8408;
  id v20 = v13;
  id v21 = v15;
  id v16 = v15;
  id v17 = v13;
  -[MRAVEndpoint _prepareToMigrateToEndpoint:queue:completion:](self, v9, v17, v19);
}

void __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v6 = v4;
    id v5 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 && a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_4;
    v7[3] = &unk_1E57D83E0;
    id v5 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    MRMediaRemotePlaybackSessionRequestSupportedTypeForOrigin(a2, a3, v5, v7);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  uint64_t v4 = [*(id *)(a1 + 32) origin];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  uint64_t v4 = [*(id *)(a1 + 32) origin];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

uint64_t __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
        && (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
         || !*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)))
      {
        id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v4 = 40;
        if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
          uint64_t v4 = 48;
        }
        uint64_t v5 = [v3 initWithMRError:121, @"Both endpoints successfully connected but could not fetch the origin for %@", *(void *)(a1 + v4) format];
        uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
        id v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;

        uint64_t result = *(void *)(a1 + 56);
      }
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = (id)MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }
  id v20 = @"MREndpointConnectionReasonUserInfoKey";
  v21[0] = @"removeOutputDeviceFromParentGroup";
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke;
  v16[3] = &unk_1E57D8458;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v12 completion:v16];
}

void __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 56);
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke_2;
      block[3] = &unk_1E57D0DB8;
      id v11 = v4;
      id v10 = v3;
      dispatch_async(v5, block);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) externalDevice];
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[MRAVEndpoint removeOutputDeviceFromParentGroup:queue:completion:]_block_invoke"];
      [v7 handleFailureInFunction:v8, @"MRAVEndpoint.m", 1257, @"Invalid parameter not satisfying: %@", @"externalDevice" file lineNumber description];
    }
    [v6 removeFromParentGroup:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)requestGroupSessionWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [MRRequestDetails alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];
  id v11 = [(MRRequestDetails *)v8 initWithName:@"requestGroupSession" requestID:v10 reason:0];

  [(MRAVEndpoint *)self requestGroupSessionWithDetails:v11 queue:v7 completion:v6];
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = [(MRAVEndpoint *)self debugName];
  id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v14 = [v8 name];
  id v15 = [v8 requestID];
  id v16 = (void *)[v13 initWithFormat:@"%@<%@>", v14, v15];

  if (v12) {
    [v16 appendFormat:@" for %@", v12];
  }
  id v17 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v16;
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v30[3] = &unk_1E57D8480;
  id v31 = v12;
  id v18 = v8;
  id v32 = v18;
  id v33 = v11;
  id v34 = v10;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  uint64_t v22 = (void *)MEMORY[0x1997190F0](v30);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_414;
  v26[3] = &unk_1E57D8458;
  v26[4] = self;
  id v27 = v18;
  id v28 = v9;
  id v29 = v22;
  id v23 = v22;
  id v24 = v9;
  id v25 = v18;
  [(MRAVEndpoint *)self connectToExternalDeviceWithOptions:0 details:v25 completion:v26];
}

void __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        id v11 = [*(id *)(a1 + 40) name];
        id v12 = [*(id *)(a1 + 40) requestID];
        uint64_t v13 = *(void *)(a1 + 32);
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v27 = 138544386;
        id v28 = v11;
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        __int16 v35 = 2048;
        uint64_t v36 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    id v11 = [*(id *)(a1 + 40) name];
    id v12 = [*(id *)(a1 + 40) requestID];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v27 = 138544130;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v5;
    __int16 v33 = 2048;
    uint64_t v34 = v25;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        id v11 = [*(id *)(a1 + 40) name];
        id v12 = [*(id *)(a1 + 40) requestID];
        uint64_t v20 = *(void *)(a1 + 32);
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v27 = 138544386;
        id v28 = v11;
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        uint64_t v34 = v20;
        __int16 v35 = 2048;
        uint64_t v36 = v21;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  BOOL v22 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v22) {
      goto LABEL_22;
    }
    id v11 = [*(id *)(a1 + 40) name];
    id v12 = [*(id *)(a1 + 40) requestID];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v27 = 138543874;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2048;
    id v32 = v26;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v22)
  {
    id v11 = [*(id *)(a1 + 40) name];
    id v12 = [*(id *)(a1 + 40) requestID];
    id v23 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v27 = 138544130;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v23;
    __int16 v33 = 2048;
    uint64_t v34 = v24;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_414(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
    v6[3] = &unk_1E57D0DB8;
    uint64_t v4 = *(NSObject **)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v7 = v3;
    dispatch_async(v4, v6);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) externalDevice];
    [v5 requestGroupSessionWithDetails:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)volumeControlCapabilitiesOnQueue:(id)a3 completion:(id)a4
{
}

- (unsigned)volumeCapabilities
{
  id v2 = [(MRAVEndpoint *)self outputContextDataSource];
  unsigned int v3 = [v2 volumeControlCapabilitiesForOutputDeviceUID:0 error:0];

  return v3;
}

uint64_t __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRAVEndpoint *)self outputContextDataSource];
  id v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);

  LODWORD(v4) = [v5 volumeControlCapabilitiesForOutputDeviceUID:v6 error:0];
  return v4;
}

- (void)setVolume:(float)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)setVolume:(float)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MEMORY[0x1E4F1C9C8] now];
  id v17 = @"Endpoint.setOutputDeviceVolume";
  if (!v12) {
    id v17 = @"Endpoint.setVolume";
  }
  uint32_t v18 = v17;
  id v19 = [NSString alloc];
  int v47 = self;
  uint64_t v20 = [(MRAVEndpoint *)self debugName];
  uint64_t v21 = (void *)v20;
  if (v12) {
    uint64_t v22 = [v19 initWithFormat:@"endpoint=%@, outputDevice=%@", v20, v12];
  }
  else {
    uint64_t v22 = [v19 initWithFormat:@"endpoint=%@", v20, v46];
  }
  id v23 = (void *)v22;

  unint64_t v48 = v13;
  if (v13)
  {
    uint64_t v24 = (MRRequestDetails *)v13;
  }
  else
  {
    uint64_t v25 = [MRRequestDetails alloc];
    id v26 = [MEMORY[0x1E4F29128] UUID];
    int v27 = [v26 UUIDString];
    uint64_t v24 = [(MRRequestDetails *)v25 initWithName:v18 requestID:v27 reason:0];
  }
  id v28 = objc_alloc(MEMORY[0x1E4F28E78]);
  __int16 v29 = [(MRRequestDetails *)v24 requestID];
  id v30 = (void *)[v28 initWithFormat:@"%@<%@>", v18, v29];

  if (v23) {
    [v30 appendFormat:@" for %@", v23];
  }
  __int16 v31 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v63 = v30;
    _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v54[3] = &unk_1E57D84D0;
  float v61 = a3;
  id v55 = v23;
  uint64_t v56 = v18;
  id v57 = v24;
  id v58 = v16;
  id v59 = v14;
  id v60 = v15;
  id v32 = v14;
  id v33 = v15;
  id v34 = v16;
  __int16 v35 = v24;
  uint64_t v36 = v18;
  id v37 = v23;
  uint64_t v38 = (void *)MEMORY[0x1997190F0](v54);
  uint64_t v39 = [MRBlockGuard alloc];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2;
  v52[3] = &unk_1E57D0FE8;
  id v40 = v38;
  id v53 = v40;
  id v41 = [(MRBlockGuard *)v39 initWithTimeout:v36 reason:v52 handler:7.0];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3;
  v49[3] = &unk_1E57D1DA0;
  __int16 v50 = v41;
  id v51 = v40;
  id v42 = v40;
  id v43 = v41;
  id v44 = (void *)MEMORY[0x1997190F0](v49);
  *(float *)&double v45 = a3;
  [(MRAVEndpoint *)v47 _setOutputDeviceVolume:v12 outputDevice:v35 details:v32 queue:v44 completion:v45];
}

void __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
    id v13 = [NSNumber numberWithFloat:v4];

    uint64_t v14 = *(void *)(a1 + 32);
    id v6 = _MRLogForCategory(0xAuLL);
    BOOL v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v14)
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v16 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        LODWORD(v17) = *(_DWORD *)(a1 + 80);
        id v11 = [NSNumber numberWithFloat:v17];
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v43 = v16;
        __int16 v44 = 2114;
        double v45 = v9;
        __int16 v46 = 2112;
        id v47 = v11;
        __int16 v48 = 2114;
        uint64_t v49 = v18;
        __int16 v50 = 2048;
        uint64_t v51 = v20;
        uint64_t v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        uint64_t v22 = v6;
        uint32_t v23 = 52;
      }
      else
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v30 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        LODWORD(v31) = *(_DWORD *)(a1 + 80);
        id v11 = [NSNumber numberWithFloat:v31];
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v43 = v30;
        __int16 v44 = 2114;
        double v45 = v9;
        __int16 v46 = 2112;
        id v47 = v11;
        __int16 v48 = 2048;
        uint64_t v49 = v32;
        uint64_t v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        uint64_t v22 = v6;
        uint32_t v23 = 42;
      }
      _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
    else
    {
      if (v14)
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v24 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        uint64_t v25 = *(void **)(a1 + 32);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        double v45 = v9;
        __int16 v46 = 2114;
        id v47 = v25;
        __int16 v48 = 2048;
        uint64_t v49 = v26;
        int v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v28 = v6;
        uint32_t v29 = 42;
      }
      else
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        double v45 = v9;
        __int16 v46 = 2048;
        id v47 = v34;
        int v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v28 = v6;
        uint32_t v29 = 32;
      }
      _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    }
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v7) {
      goto LABEL_21;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) requestID];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    uint64_t v43 = v8;
    __int16 v44 = 2114;
    double v45 = v9;
    __int16 v46 = 2114;
    id v47 = v3;
    __int16 v48 = 2114;
    uint64_t v49 = v10;
    __int16 v50 = 2048;
    uint64_t v51 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v7) {
    __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, v3, v6);
  }
LABEL_21:

  __int16 v35 = *(void **)(a1 + 72);
  if (v35)
  {
    uint64_t v36 = *(NSObject **)(a1 + 64);
    id v37 = v36;
    if (!v36)
    {
      id v37 = MEMORY[0x1E4F14428];
      id v38 = MEMORY[0x1E4F14428];
      __int16 v35 = *(void **)(a1 + 72);
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_433;
    v39[3] = &unk_1E57D0DB8;
    id v41 = v35;
    id v40 = v3;
    dispatch_async(v37, v39);
    if (!v36) {
  }
    }
}

uint64_t __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_433(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v27 = @"MREndpointConnectionReasonUserInfoKey";
  v28[0] = @"setOutputDeviceVolume";
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __77__MRAVEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v21[3] = &unk_1E57D2940;
  v21[4] = self;
  id v22 = v12;
  float v26 = a3;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v16 completion:v21];
}

void __77__MRAVEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = [*(id *)(a1 + 32) externalDevice];
    LODWORD(v5) = *(_DWORD *)(a1 + 72);
    [v4 setOutputDeviceVolume:v6 outputDeviceUID:*(void *)(a1 + 48) details:*(void *)(a1 + 56) queue:*(void *)(a1 + 64) completion:v5];
  }
}

- (float)volume
{
  id v2 = [(MRAVEndpoint *)self outputContextDataSource];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)volumeOnQueue:(id)a3 completion:(id)a4
{
}

uint64_t __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

- (float)volumeForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  double v5 = [(MRAVEndpoint *)self outputContextDataSource];
  id v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);

  [v5 volumeForOutputDeviceUID:v6 error:0];
  float v8 = v7;

  return v8;
}

- (void)adjustVolume:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = @"Endpoint.adjustOutputDeviceVolume";
  if (!v11) {
    id v15 = @"Endpoint.adjustVolume";
  }
  uint64_t v16 = v15;
  id v17 = [NSString alloc];
  id v37 = self;
  uint64_t v18 = [(MRAVEndpoint *)self debugName];
  id v19 = (void *)v18;
  if (v11) {
    uint64_t v20 = [v17 initWithFormat:@"endpoint=%@, outputDevice=%@", v18, v11];
  }
  else {
    uint64_t v20 = [v17 initWithFormat:@"endpoint=%@", v18, v36];
  }
  uint64_t v21 = (void *)v20;

  if (v12)
  {
    id v22 = (MRRequestDetails *)v12;
  }
  else
  {
    id v23 = [MRRequestDetails alloc];
    id v24 = [MEMORY[0x1E4F29128] UUID];
    id v25 = [v24 UUIDString];
    id v22 = [(MRRequestDetails *)v23 initWithName:v16 requestID:v25 reason:0];
  }
  id v26 = objc_alloc(MEMORY[0x1E4F28E78]);
  int v27 = [(MRRequestDetails *)v22 requestID];
  id v28 = (void *)[v26 initWithFormat:@"%@<%@>", v16, v27];

  if (v21) {
    [v28 appendFormat:@" for %@", v21];
  }
  uint32_t v29 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v46 = v28;
    _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v39[3] = &unk_1E57D8520;
  id v40 = v21;
  id v41 = v16;
  id v43 = v13;
  id v44 = v14;
  id v42 = v22;
  id v30 = v13;
  id v31 = v14;
  uint64_t v32 = v22;
  uint64_t v33 = v16;
  id v34 = v21;
  __int16 v35 = (void *)MEMORY[0x1997190F0](v39);
  [(MRAVEndpoint *)v37 _adjustOutputDeviceVolume:a3 outputDevice:v11 details:v32 queue:v30 completion:v35];
}

void __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      uint64_t v16 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      id v12 = [*(id *)(a1 + 48) startDate];
      [v11 timeIntervalSinceDate:v12];
      *(_DWORD *)buf = 138544130;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      uint32_t v29 = v9;
      __int16 v30 = 2114;
      id v31 = v16;
      __int16 v32 = 2048;
      uint64_t v33 = v17;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v21 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      id v12 = [*(id *)(a1 + 48) startDate];
      [v11 timeIntervalSinceDate:v12];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v21;
      __int16 v28 = 2114;
      uint32_t v29 = v9;
      __int16 v30 = 2048;
      id v31 = v22;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) requestID];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = [*(id *)(a1 + 48) startDate];
    [v11 timeIntervalSinceDate:v12];
    *(_DWORD *)buf = 138544386;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    uint32_t v29 = v9;
    __int16 v30 = 2114;
    id v31 = v3;
    __int16 v32 = 2114;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v13;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, v3, v6);
  }
LABEL_14:

  id v23 = *(void **)(a1 + 64);
  if (v23)
  {
    id v25 = v23;
    id v24 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_451(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v29[0] = @"MREndpointConnectionReasonUserInfoKey";
  uint64_t v16 = [v13 reason];
  v29[1] = @"MREndpointConnectionCorrelationIDUserInfoKey";
  v30[0] = v16;
  uint64_t v17 = [v13 requestID];
  v30[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__MRAVEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v23[3] = &unk_1E57D8548;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int64_t v28 = a3;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v18 completion:v23];
}

void __80__MRAVEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [*(id *)(a1 + 32) externalDevice];
    [v4 adjustOutputDeviceVolume:*(void *)(a1 + 72) outputDeviceUID:v5 details:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

- (void)muteVolume:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)muteVolume:(BOOL)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v47 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v16 = @"Endpoint.muteOutputDeviceVolume";
  if (!v11) {
    uint64_t v16 = @"Endpoint.muteVolume";
  }
  uint64_t v17 = v16;
  id v18 = [NSString alloc];
  __int16 v46 = self;
  uint64_t v19 = [(MRAVEndpoint *)self debugName];
  id v20 = (void *)v19;
  if (v11) {
    uint64_t v21 = [v18 initWithFormat:@"endpoint=%@, outputDevice=%@", v19, v11];
  }
  else {
    uint64_t v21 = [v18 initWithFormat:@"endpoint=%@", v19, v45];
  }
  id v22 = (void *)v21;

  __int16 v48 = v12;
  if (v12)
  {
    id v23 = (MRRequestDetails *)v12;
  }
  else
  {
    id v24 = [MRRequestDetails alloc];
    id v25 = [MEMORY[0x1E4F29128] UUID];
    id v26 = [v25 UUIDString];
    id v23 = [(MRRequestDetails *)v24 initWithName:v17 requestID:v26 reason:@"API"];
  }
  id v27 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v28 = [(MRRequestDetails *)v23 requestID];
  uint32_t v29 = (void *)[v27 initWithFormat:@"%@<%@>", v17, v28];

  if (v22) {
    [v29 appendFormat:@" for %@", v22];
  }
  __int16 v30 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v62 = v29;
    _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v54[3] = &unk_1E57D5660;
  id v55 = v22;
  uint64_t v56 = v17;
  id v57 = v23;
  id v58 = v15;
  id v59 = v13;
  id v60 = v14;
  id v31 = v13;
  id v32 = v14;
  id v33 = v15;
  __int16 v34 = v23;
  uint64_t v35 = v17;
  id v36 = v22;
  id v37 = (void *)MEMORY[0x1997190F0](v54);
  id v38 = [MRBlockGuard alloc];
  uint64_t v39 = [(MRRequestDetails *)v34 name];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2;
  v52[3] = &unk_1E57D0FE8;
  id v40 = v37;
  id v53 = v40;
  id v41 = [(MRBlockGuard *)v38 initWithTimeout:v39 reason:v52 handler:7.0];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3;
  v49[3] = &unk_1E57D1DA0;
  __int16 v50 = v41;
  id v51 = v40;
  id v42 = v40;
  id v43 = v41;
  id v44 = (void *)MEMORY[0x1997190F0](v49);
  [(MRAVEndpoint *)v46 _muteOutputDeviceVolume:v47 outputDevice:v11 details:v34 queue:v31 completion:v44];
}

void __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      id v15 = *(void **)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      int64_t v28 = v9;
      __int16 v29 = 2114;
      id v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = v16;
      uint64_t v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v18 = v6;
      uint32_t v19 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v20 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      int64_t v28 = v9;
      __int16 v29 = 2048;
      id v30 = v21;
      uint64_t v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v18 = v6;
      uint32_t v19 = 32;
    }
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) requestID];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v8;
    __int16 v27 = 2114;
    int64_t v28 = v9;
    __int16 v29 = 2114;
    id v30 = v3;
    __int16 v31 = 2114;
    uint64_t v32 = v10;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, v3, v6);
  }
LABEL_14:

  id v22 = *(void **)(a1 + 72);
  if (v22)
  {
    id v24 = v22;
    id v23 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_461(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v29[0] = @"MREndpointConnectionReasonUserInfoKey";
  uint64_t v16 = [v13 reason];
  v29[1] = @"MREndpointConnectionCorrelationIDUserInfoKey";
  v30[0] = v16;
  uint64_t v17 = [v13 requestID];
  v30[1] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__MRAVEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v23[3] = &unk_1E57D8570;
  v23[4] = self;
  id v24 = v12;
  BOOL v28 = a3;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v18 completion:v23];
}

void __78__MRAVEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [*(id *)(a1 + 32) externalDevice];
    [v4 muteOutputDeviceVolume:*(unsigned __int8 *)(a1 + 72) outputDeviceUID:v5 details:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

- (BOOL)isVolumeMuted
{
  id v2 = [(MRAVEndpoint *)self outputContextDataSource];
  char v3 = [v2 isVolumeMuted];

  return v3;
}

- (void)volumeMutedOnQueue:(id)a3 completion:(id)a4
{
}

- (void)outputDeviceVolumeMuted:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];

  id v14 = @"Endpoint.outputDeviceVolumeMuted";
  if (!v8) {
    id v14 = @"Endpoint.volumeMuted";
  }
  id v15 = v14;
  id v16 = [NSString alloc];
  uint64_t v17 = [(MRAVEndpoint *)self debugName];
  id v18 = (void *)v17;
  if (v8) {
    uint64_t v19 = [v16 initWithFormat:@"endpoint=%@, outputDevice=%@", v17, v8];
  }
  else {
    uint64_t v19 = [v16 initWithFormat:@"endpoint=%@", v17, v38];
  }
  id v20 = (void *)v19;

  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v15, v13];
  id v22 = v21;
  if (v20) {
    [v21 appendFormat:@" for %@", v20];
  }
  id v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v59 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke;
  v49[3] = &unk_1E57D85C0;
  id v50 = v20;
  id v51 = v15;
  id v52 = v13;
  id v53 = v11;
  id v54 = v9;
  id v55 = v10;
  id v40 = v9;
  id v39 = v10;
  id v24 = v11;
  id v25 = v13;
  id v26 = v15;
  id v27 = v20;
  BOOL v28 = (void *)MEMORY[0x1997190F0](v49);
  __int16 v29 = [MRBlockGuard alloc];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_2;
  void v47[3] = &unk_1E57D0FE8;
  id v30 = v28;
  id v48 = v30;
  __int16 v31 = [(MRBlockGuard *)v29 initWithTimeout:v26 reason:v47 handler:7.0];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_3;
  v44[3] = &unk_1E57D85E8;
  uint64_t v45 = v31;
  id v46 = v30;
  id v32 = v30;
  __int16 v33 = v31;
  uint64_t v34 = (void *)MEMORY[0x1997190F0](v44);
  v56[0] = @"MREndpointConnectionReasonUserInfoKey";
  v56[1] = @"MREndpointConnectionCorrelationIDUserInfoKey";
  v57[0] = v26;
  v57[1] = v25;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_4;
  v41[3] = &unk_1E57D10A8;
  void v41[4] = self;
  id v42 = v8;
  id v43 = v34;
  id v36 = v34;
  id v37 = v8;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v35 completion:v41];
}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSNumber numberWithBool:a2];

    uint64_t v15 = a1[4];
    BOOL v7 = _MRLogForCategory(0xAuLL);
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v17 = a1[5];
        uint64_t v18 = a1[6];
        id v12 = [NSNumber numberWithBool:a2];
        uint64_t v19 = a1[4];
        id v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544386;
        uint64_t v47 = v17;
        __int16 v48 = 2114;
        uint64_t v49 = v18;
        __int16 v50 = 2112;
        id v51 = v12;
        __int16 v52 = 2114;
        uint64_t v53 = v19;
        __int16 v54 = 2048;
        uint64_t v55 = v21;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v23 = v7;
        uint32_t v24 = 52;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v32 = a1[5];
        uint64_t v33 = a1[6];
        id v12 = [NSNumber numberWithBool:a2];
        id v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v32;
        __int16 v48 = 2114;
        uint64_t v49 = v33;
        __int16 v50 = 2112;
        id v51 = v12;
        __int16 v52 = 2048;
        uint64_t v53 = v34;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v23 = v7;
        uint32_t v24 = 42;
      }
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
    else
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v26 = a1[5];
        uint64_t v25 = a1[6];
        id v27 = (void *)a1[4];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v26;
        __int16 v48 = 2114;
        uint64_t v49 = v25;
        __int16 v50 = 2114;
        id v51 = v27;
        __int16 v52 = 2048;
        uint64_t v53 = v28;
        __int16 v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v30 = v7;
        uint32_t v31 = 42;
      }
      else
      {
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v35 = a1[5];
        uint64_t v36 = a1[6];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = v35;
        __int16 v48 = 2114;
        uint64_t v49 = v36;
        __int16 v50 = 2048;
        id v51 = v37;
        __int16 v29 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v30 = v7;
        uint32_t v31 = 32;
      }
      _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
    goto LABEL_20;
  }
  uint64_t v6 = a1[4];
  BOOL v7 = _MRLogForCategory(0xAuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v10 = a1[5];
    uint64_t v9 = a1[6];
    uint64_t v11 = a1[4];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v47 = v10;
    __int16 v48 = 2114;
    uint64_t v49 = v9;
    __int16 v50 = 2114;
    id v51 = v5;
    __int16 v52 = 2114;
    uint64_t v53 = v11;
    __int16 v54 = 2048;
    uint64_t v55 = v13;
    _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v5, v7);
  }
LABEL_21:

  uint64_t v38 = (void *)a1[9];
  if (v38)
  {
    id v39 = a1[8];
    id v40 = v39;
    if (!v39)
    {
      id v40 = MEMORY[0x1E4F14428];
      id v41 = MEMORY[0x1E4F14428];
      uint64_t v38 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_468;
    block[3] = &unk_1E57D8598;
    id v44 = v38;
    char v45 = a2;
    id v43 = v5;
    dispatch_async(v40, block);
    if (!v39) {
  }
    }
}

uint64_t __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_468(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    BOOL v7 = [*(id *)(a1 + 32) outputContextDataSource];
    id v8 = 0;
    [v7 volumeMutedForOutputDeviceID:v6 error:&v8];
    id v5 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)volumeMutedForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRAVEndpoint *)self outputContextDataSource];
  uint64_t v6 = -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);

  LOBYTE(v4) = [v5 volumeMutedForOutputDeviceID:v6 error:0];
  return (char)v4;
}

- (void)waitForPlaybackWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];

  id v13 = [NSString alloc];
  id v14 = [(MRAVEndpoint *)self debugName];
  uint64_t v15 = (void *)[v13 initWithFormat:@"%@-%lf", v14, *(void *)&a3];

  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"Endpoint.waitForPlaybackWithTimeout", v12];
  uint64_t v17 = v16;
  if (v15) {
    [v16 appendFormat:@" for %@", v15];
  }
  uint64_t v18 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v19 = objc_alloc_init(MRNowPlayingControllerHelper);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__35;
  uint64_t v63 = __Block_byref_object_dispose__35;
  id v64 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  void v51[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke;
  v51[3] = &unk_1E57D8610;
  id v20 = v19;
  __int16 v52 = v20;
  p_long long buf = &buf;
  id v21 = v15;
  id v53 = v21;
  __int16 v54 = @"Endpoint.waitForPlaybackWithTimeout";
  id v22 = v12;
  id v55 = v22;
  id v23 = v10;
  id v56 = v23;
  id v39 = v9;
  id v58 = v39;
  id v38 = v8;
  id v57 = v38;
  uint32_t v24 = (void *)MEMORY[0x1997190F0](v51);
  uint64_t v25 = [MRBlockGuard alloc];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_2;
  v49[3] = &unk_1E57D0FE8;
  id v26 = v24;
  id v50 = v26;
  id v27 = [(MRBlockGuard *)v25 initWithTimeout:@"Endpoint.waitForPlaybackWithTimeout" reason:v49 handler:a3];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_3;
  v46[3] = &unk_1E57D1DA0;
  uint64_t v28 = v27;
  uint64_t v47 = v28;
  id v29 = v26;
  id v48 = v29;
  id v30 = (void *)MEMORY[0x1997190F0](v46);
  uint32_t v31 = [[MRDestination alloc] initWithEndpoint:self];
  uint64_t v32 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v31];
  [(MRNowPlayingControllerConfiguration *)v32 setRequestPlaybackState:1];
  uint64_t v33 = [[MRNowPlayingController alloc] initWithConfiguration:v32];
  uint64_t v34 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v33;

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_4;
  v44[3] = &unk_1E57D8638;
  id v35 = v30;
  id v45 = v35;
  [(MRNowPlayingControllerHelper *)v20 setDidLoadResponse:v44];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_5;
  v42[3] = &unk_1E57D0FE8;
  id v36 = v35;
  id v43 = v36;
  [(MRNowPlayingControllerHelper *)v20 setDidFailWithError:v42];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_6;
  v40[3] = &unk_1E57D4C70;
  id v37 = v36;
  id v41 = v37;
  [(MRNowPlayingControllerHelper *)v20 setPlaybackStateDidChange:v40];
  [*(id *)(*((void *)&buf + 1) + 40) setDelegate:v20];
  [*(id *)(*((void *)&buf + 1) + 40) beginLoadingUpdates];

  _Block_object_dispose(&buf, 8);
}

void __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) endLoadingUpdates];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = v6;
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v17 = *(void **)(a1 + 40);
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v33 = v16;
      __int16 v34 = 2114;
      uint64_t v35 = v15;
      __int16 v36 = 2114;
      id v37 = v17;
      __int16 v38 = 2048;
      uint64_t v39 = v18;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v20 = v7;
      uint32_t v21 = 42;
    }
    else
    {
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 56);
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      uint64_t v35 = v23;
      __int16 v36 = 2048;
      id v37 = v24;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v20 = v7;
      uint32_t v21 = 32;
    }
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_13;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)long long buf = 138544386;
    uint64_t v33 = v10;
    __int16 v34 = 2114;
    uint64_t v35 = v9;
    __int16 v36 = 2114;
    id v37 = v3;
    __int16 v38 = 2114;
    uint64_t v39 = v11;
    __int16 v40 = 2048;
    uint64_t v41 = v13;
    _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v8) {
    __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_cold_1(a1, v3, v7);
  }
LABEL_14:

  uint64_t v25 = *(void **)(a1 + 80);
  if (v25)
  {
    id v26 = *(NSObject **)(a1 + 72);
    id v27 = v26;
    if (!v26)
    {
      id v27 = MEMORY[0x1E4F14428];
      id v28 = MEMORY[0x1E4F14428];
      uint64_t v25 = *(void **)(a1 + 80);
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_477;
    v29[3] = &unk_1E57D0DB8;
    id v31 = v25;
    id v30 = v3;
    dispatch_async(v27, v29);
    if (!v26) {
  }
    }
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_477(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = MRMediaRemotePlaybackStateIsAdvancing([a2 playbackState]);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result = MRMediaRemotePlaybackStateIsAdvancing(a2);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v25 = @"MREndpointConnectionReasonUserInfoKey";
  v26[0] = @"setListeningMode";
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
  v20[3] = &unk_1E57D7680;
  void v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v15 completion:v20];
}

void __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 64);
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2;
      v7[3] = &unk_1E57D0DB8;
      id v9 = v4;
      id v8 = v3;
      dispatch_async(v5, v7);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) externalDevice];
    [v6 setListeningMode:*(void *)(a1 + 40) outputDeviceUID:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

uint64_t __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v8 = a6;
  if (!v7)
  {
    BOOL v7 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRAVEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke;
  block[3] = &unk_1E57D0FC0;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v7, block);
}

uint64_t __82__MRAVEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v8 = a6;
  if (!v7)
  {
    BOOL v7 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRAVEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke;
  block[3] = &unk_1E57D0FC0;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v7, block);
}

uint64_t __80__MRAVEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v11 = (id)MEMORY[0x1E4F14428];
    id v13 = MEMORY[0x1E4F14428];
  }
  id v23 = @"MREndpointConnectionReasonUserInfoKey";
  v24[0] = @"setConversationDetectionEnabled";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
  v18[3] = &unk_1E57D8660;
  BOOL v22 = a3;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(MRAVEndpoint *)self connectToExternalDeviceWithUserInfo:v14 completion:v18];
}

void __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 56);
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(a1 + 48);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2;
      v7[3] = &unk_1E57D0DB8;
      id v9 = v4;
      id v8 = v3;
      dispatch_async(v5, v7);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) externalDevice];
    [v6 setConversationDetectionEnabled:*(unsigned __int8 *)(a1 + 64) outputDeviceUID:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)outputDevicesMatchingPredicate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(MRAVEndpoint *)self outputDevices];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (id)outputDeviceUIDsMatchingPredicate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRAVEndpoint *)self outputDevicesMatchingPredicate:a3];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uid", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)effectivelyEqual:(id)a3
{
  id v4 = a3;
  if (![(MRAVEndpoint *)self isEqual:v4]) {
    goto LABEL_4;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  uint64_t v6 = [(MRAVEndpoint *)self outputDeviceUIDs];
  uint64_t v7 = (void *)[v5 initWithArray:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  uint64_t v9 = [v4 outputDeviceUIDs];
  id v10 = (void *)[v8 initWithArray:v9];

  LOBYTE(v9) = [v7 isEqualToOrderedSet:v10];
  if (v9) {
    BOOL v11 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v11 = 0;

  return v11;
}

- (BOOL)containsOutputDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRAVEndpoint *)self outputDeviceForUID:v4];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(MRAVEndpoint *)self groupLeader];
    BOOL v6 = ([v7 supportsMultiplayer] & 1) == 0 && (objc_msgSend(v7, "containsUID:", v4) & 1) != 0;
  }
  return v6;
}

- (id)outputDeviceForUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRAVEndpoint *)self outputDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__MRAVEndpoint_outputDeviceForUID___block_invoke;
  v9[3] = &unk_1E57D07B8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "msv_firstWhere:", v9);

  return v7;
}

uint64_t __35__MRAVEndpoint_outputDeviceForUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v8 = [v5 objectForKeyedSubscript:@"MROutputContextDataSourceVolumeMutedUserInfoKey"];

  id v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  objc_msgSend((id)objc_opt_class(), "_notifyVolumeMutedDidChange:outputDevice:endpoint:", objc_msgSend(v8, "BOOLValue"), v7, self);
}

- (void)outputContextDataSourceDidAddOutputDevice:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  [(id)objc_opt_class() _notifyDidAddOutputDevice:v5 endpoint:self];
}

- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  [(id)objc_opt_class() _notifyDidChangeOutputDevice:v5 endpoint:self];
}

- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  [(id)objc_opt_class() _notifyDidRemoveOutputDevice:v5 endpoint:self];
}

- (void)outputContextDidChangePredictedOutputDevice:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MROutputContextDataSourceOutputDeviceUserInfoKey"];

  [(id)objc_opt_class() _notifyDidChangePredictedOutputDevice:v5 endpoint:self];
}

+ (void)_notifyEndpointDidConnect:(id)a3
{
  id v4 = a3;
  id v6 = [a1 _userInfoFromEndpoint:v4 outputDevice:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MRAVEndpointDidConnectNotification" object:v4 userInfo:v6];
}

+ (void)_notifyEndpointDidDisconnect:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 _userInfoFromEndpoint:v7 outputDevice:0];
  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MRAVEndpointDidDisconnectNotification" object:v7 userInfo:v9];
}

+ (void)_notifyVolumeMutedDidChange:(BOOL)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v11 = [a1 _userInfoFromEndpoint:v8 outputDevice:a4];
  id v9 = [NSNumber numberWithBool:v6];
  [v11 setObject:v9 forKeyedSubscript:@"MRAVEndpointVolumeMutedUserInfoKey"];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"MRAVEndpointVolumeMutedDidChangeNotification" object:v8 userInfo:v11];
}

+ (void)_notifyDidAddOutputDevice:(id)a3 endpoint:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  id v9 = v7;
  if (!v14)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MRAVEndpoint.m", 2042, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];

    id v8 = 0;
  }
  id v10 = [a1 _userInfoFromEndpoint:v9 outputDevice:v8];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MRAVEndpointDidAddOutputDeviceNotification" object:v9 userInfo:v10];

  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:v9 userInfo:v10];
}

+ (void)_notifyDidChangeOutputDevice:(id)a3 endpoint:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  id v9 = v7;
  if (!v14)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MRAVEndpoint.m", 2054, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];

    id v8 = 0;
  }
  id v10 = [a1 _userInfoFromEndpoint:v9 outputDevice:v8];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MRAVEndpointDidChangeOutputDeviceNotification" object:v9 userInfo:v10];

  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:v9 userInfo:v10];
}

+ (void)_notifyDidRemoveOutputDevice:(id)a3 endpoint:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  id v9 = v7;
  if (!v14)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MRAVEndpoint.m", 2066, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];

    id v8 = 0;
  }
  id v10 = [a1 _userInfoFromEndpoint:v9 outputDevice:v8];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MRAVEndpointDidRemoveOutputDeviceNotification" object:v9 userInfo:v10];

  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"kMRAVEndpointOutputDevicesDidChangeNotification" object:v9 userInfo:v10];
}

+ (void)_notifyDidChangePredictedOutputDevice:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _userInfoFromEndpoint:v6 outputDevice:a3];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"kMRAVEndpointPredictedOutputDeviceDidChangeNotification" object:v6 userInfo:v8];
}

+ (void)_notifyGroupSessionInfoDidChange:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 _userInfoFromEndpoint:v6 outputDevice:0];
  [v9 setObject:v7 forKeyedSubscript:@"MRAVEndpointGroupSessionInfoUserInfoKey"];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MRAVEndpointGroupSessionInfoDidChangeNotification" object:v6 userInfo:v9];
}

+ (void)_notifyGroupSessionHostingEligibilityDidChangeForEndpoint:(id)a3
{
  id v4 = a3;
  id v6 = [a1 _userInfoFromEndpoint:v4 outputDevice:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MRAVEndpointGroupSessionHostingEligibilityDidChangeNotification" object:v4 userInfo:v6];
}

+ (void)hostedEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a4;
  id v11 = [v9 date];
  long long v12 = [MEMORY[0x1E4F29128] UUID];
  long long v13 = [v12 UUIDString];

  id v14 = [NSString stringWithFormat:@"UIDs=(%@)", v7];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke;
  void v30[3] = &unk_1E57D7DE8;
  id v15 = v14;
  id v31 = v15;
  uint64_t v32 = @"hostedEndpointForOutputDeviceUIDs";
  id v16 = v13;
  id v33 = v16;
  id v17 = v11;
  id v34 = v17;
  id v18 = v8;
  id v35 = v18;
  id v19 = (void *)MEMORY[0x1997190F0](v30);
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"hostedEndpointForOutputDeviceUIDs", v16];
  id v21 = v20;
  if (v15) {
    [v20 appendFormat:@" for %@", v15];
  }
  BOOL v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v37 = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v23 = (void *)MRGetSharedService();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke_517;
  v26[3] = &unk_1E57D8368;
  id v27 = @"hostedEndpointForOutputDeviceUIDs";
  id v28 = v16;
  id v29 = v19;
  id v24 = v19;
  id v25 = v16;
  MRMediaRemoteServiceCreateHostedEndpointForDevices(v23, (uint64_t)v7, v10, v26);
}

void __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = a1[5];
        uint64_t v11 = a1[6];
        uint64_t v13 = a1[4];
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[7]];
        int v35 = 138544386;
        uint64_t v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = v11;
        __int16 v39 = 2112;
        id v40 = v5;
        __int16 v41 = 2114;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        uint64_t v44 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = a1[5];
    uint64_t v30 = a1[6];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v29;
    __int16 v37 = 2114;
    uint64_t v38 = v30;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2048;
    uint64_t v42 = v31;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = a1[5];
        uint64_t v20 = a1[6];
        uint64_t v22 = a1[4];
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[7]];
        int v35 = 138544386;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = a1[5];
    uint64_t v33 = a1[6];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138543874;
    uint64_t v36 = v32;
    __int16 v37 = 2114;
    uint64_t v38 = v33;
    __int16 v39 = 2048;
    id v40 = v34;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = a1[5];
    uint64_t v25 = a1[6];
    id v27 = (void *)a1[4];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    uint64_t v38 = v25;
    __int16 v39 = 2114;
    id v40 = v27;
    __int16 v41 = 2048;
    uint64_t v42 = v28;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke_517(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [NSString stringWithFormat:@"Endpoint: %@", v5];
  id v8 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v6 && !MRMediaRemoteErrorIsInformational(v6)) {
    uint64_t v11 = *(void (**)(void))(a1[6] + 16);
  }
  else {
    uint64_t v11 = *(void (**)(void))(a1[6] + 16);
  }
  v11();
}

+ (void)directEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a4;
  uint64_t v11 = [v9 date];
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v13 = [v12 UUIDString];

  __int16 v14 = [NSString stringWithFormat:@"UIDs=(%@)", v7];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke;
  void v30[3] = &unk_1E57D7DE8;
  id v15 = v14;
  id v31 = v15;
  uint64_t v32 = @"directEndpointForOutputDeviceUIDs";
  id v16 = v13;
  id v33 = v16;
  id v17 = v11;
  id v34 = v17;
  id v18 = v8;
  id v35 = v18;
  BOOL v19 = (void *)MEMORY[0x1997190F0](v30);
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"directEndpointForOutputDeviceUIDs", v16];
  uint64_t v21 = v20;
  if (v15) {
    [v20 appendFormat:@" for %@", v15];
  }
  uint64_t v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    __int16 v37 = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v23 = (void *)MRGetSharedService();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke_524;
  v26[3] = &unk_1E57D8368;
  id v27 = @"directEndpointForOutputDeviceUIDs";
  id v28 = v16;
  id v29 = v19;
  id v24 = v19;
  id v25 = v16;
  MRMediaRemoteServiceCreateDirectEndpointForDevices(v23, (uint64_t)v7, v10, v26);
}

void __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = _MRLogForCategory(0xAuLL);
  uint64_t v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = a1[5];
        uint64_t v11 = a1[6];
        uint64_t v13 = a1[4];
        __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[7]];
        int v35 = 138544386;
        uint64_t v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = v11;
        __int16 v39 = 2112;
        id v40 = v5;
        __int16 v41 = 2114;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        uint64_t v44 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = a1[5];
    uint64_t v30 = a1[6];
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v29;
    __int16 v37 = 2114;
    uint64_t v38 = v30;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2048;
    uint64_t v42 = v31;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = a1[5];
        uint64_t v20 = a1[6];
        uint64_t v22 = a1[4];
        __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[7]];
        int v35 = 138544386;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = a1[5];
    uint64_t v33 = a1[6];
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138543874;
    uint64_t v36 = v32;
    __int16 v37 = 2114;
    uint64_t v38 = v33;
    __int16 v39 = 2048;
    id v40 = v34;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = a1[5];
    uint64_t v25 = a1[6];
    id v27 = (void *)a1[4];
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[7]];
    int v35 = 138544130;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    uint64_t v38 = v25;
    __int16 v39 = 2114;
    id v40 = v27;
    __int16 v41 = 2048;
    uint64_t v42 = v28;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke_524(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [NSString stringWithFormat:@"Endpoint: %@", v5];
  id v8 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v6 && !MRMediaRemoteErrorIsInformational(v6)) {
    uint64_t v11 = *(void (**)(void))(a1[6] + 16);
  }
  else {
    uint64_t v11 = *(void (**)(void))(a1[6] + 16);
  }
  v11();
}

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
}

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v13 = [v12 UUIDString];

  __int16 v14 = NSString;
  uint64_t v15 = [v8 componentsJoinedByString:@", "];
  __int16 v16 = [v14 stringWithFormat:@"UIDs=(%@)", v15];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke;
  v38[3] = &unk_1E57D8208;
  id v17 = v16;
  id v39 = v17;
  id v40 = @"createEndpointWithOutputDeviceUIDs";
  id v18 = v13;
  id v41 = v18;
  id v19 = v11;
  id v42 = v19;
  id v20 = v9;
  id v43 = v20;
  id v21 = v10;
  id v44 = v21;
  uint64_t v22 = (void *)MEMORY[0x1997190F0](v38);
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"createEndpointWithOutputDeviceUIDs", v18];
  BOOL v24 = v23;
  if (v17) {
    [v23 appendFormat:@" for %@", v17];
  }
  uint64_t v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v46 = v24;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v26 = (void *)MRGetSharedService();
  qos_class_t v27 = qos_class_self();
  uint64_t v28 = dispatch_get_global_queue(v27, 0);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_532;
  v33[3] = &unk_1E57D86B0;
  id v34 = @"createEndpointWithOutputDeviceUIDs";
  id v35 = v18;
  id v36 = v8;
  id v37 = v22;
  id v29 = v8;
  id v30 = v22;
  id v31 = v18;
  MRMediaRemoteServiceCreateGroupWithDevicesLeaderOptions(v26, (uint64_t)v29, v28, a4, v33);
}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v44 = v12;
        __int16 v45 = 2114;
        uint64_t v46 = v11;
        __int16 v47 = 2112;
        id v48 = v5;
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        __int16 v51 = 2048;
        uint64_t v52 = v15;
        __int16 v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v44 = v29;
    __int16 v45 = 2114;
    uint64_t v46 = v30;
    __int16 v47 = 2112;
    id v48 = v5;
    __int16 v49 = 2048;
    uint64_t v50 = v31;
    __int16 v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 32);
        __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v44 = v21;
        __int16 v45 = 2114;
        uint64_t v46 = v20;
        __int16 v47 = 2114;
        id v48 = v6;
        __int16 v49 = 2114;
        uint64_t v50 = v22;
        __int16 v51 = 2048;
        uint64_t v52 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = *(void *)(a1 + 40);
    uint64_t v33 = *(void *)(a1 + 48);
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v44 = v32;
    __int16 v45 = 2114;
    uint64_t v46 = v33;
    __int16 v47 = 2048;
    id v48 = v34;
    __int16 v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    qos_class_t v27 = *(void **)(a1 + 32);
    __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v44 = v26;
    __int16 v45 = 2114;
    uint64_t v46 = v25;
    __int16 v47 = 2114;
    id v48 = v27;
    __int16 v49 = 2048;
    uint64_t v50 = v28;
    __int16 v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_531;
  block[3] = &unk_1E57D0EA8;
  id v35 = *(NSObject **)(a1 + 64);
  id v36 = *(id *)(a1 + 72);
  id v41 = v6;
  id v42 = v36;
  id v40 = v5;
  id v37 = v6;
  id v38 = v5;
  dispatch_async(v35, block);
}

uint64_t __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_531(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_532(id *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"leader UID: %@", a2];
  uint64_t v7 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = a1[4];
    id v9 = a1[5];
    *(_DWORD *)long long buf = 138543874;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v5 && !MRMediaRemoteErrorIsInformational(v5))
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    BOOL v10 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:a1[6] outputDeviceGroupID:0 features:8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_536;
    v11[3] = &unk_1E57D8688;
    id v12 = a1[6];
    id v13 = a1[4];
    id v14 = a1[5];
    id v15 = a1[7];
    [(MRAVReconnaissanceSession *)v10 beginSearchWithTimeout:v11 completion:30.0];
  }
}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_536(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 outputDeviceUIDs];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [*(id *)(a1 + 32) count];

  if (v9 != v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v6 outputDeviceUIDs];
    id v14 = [v11 stringWithFormat:@"Missing devices in formed endpoint. Expected: %@, got: %@", v12, v13];

    id v15 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (MRRequestDetails *)a4;
  id v30 = a5;
  id v11 = a6;
  if (!v10) {
    uint64_t v10 = [[MRRequestDetails alloc] initWithName:@"pauseOutputDeviceUIDs" requestID:0 reason:@"API"];
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = [(MRRequestDetails *)v10 requestID];
  id v14 = [NSString stringWithFormat:@"UIDs=(%@)", v9];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke;
  v33[3] = &unk_1E57D7680;
  id v15 = v14;
  id v34 = v15;
  id v35 = @"pauseOutputDeviceUIDs";
  id v16 = v13;
  id v36 = v16;
  id v29 = v12;
  id v37 = v29;
  id v28 = v11;
  id v38 = v28;
  uint64_t v17 = (void *)MEMORY[0x1997190F0](v33);
  __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"pauseOutputDeviceUIDs", v16];
  uint64_t v19 = v18;
  if (v15) {
    [v18 appendFormat:@" for %@", v15];
  }
  __int16 v20 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v40 = v19;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v21 = MRCreateXPCMessage(0x30000000000002FuLL);
  __int16 v22 = v9;
  MRAddPropertyListToXPCMessage(v21, (uint64_t)v9, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  uint64_t v23 = [(MRRequestDetails *)v10 data];
  MRAddDataToXPCMessage(v21, v23, "MRXPC_REQUEST_DETAILS");

  uint64_t v24 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v25 = [v24 service];
  uint64_t v26 = [v25 mrXPCConnection];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke_546;
  v31[3] = &unk_1E57D1490;
  id v32 = v17;
  id v27 = v17;
  [v26 sendMessage:v21 queue:v30 reply:v31];
}

void __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      id v16 = (void *)a1[4];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v24 = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      id v29 = v16;
      __int16 v30 = 2048;
      uint64_t v31 = v17;
      __int16 v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v21 = a1[5];
      uint64_t v22 = a1[6];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v24 = 138543874;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      uint64_t v27 = v22;
      __int16 v28 = 2048;
      id v29 = v23;
      __int16 v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      uint64_t v9 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v10 = a1[4];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v24 = 138544386;
      uint64_t v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      id v29 = v3;
      __int16 v30 = 2114;
      uint64_t v31 = v10;
      __int16 v32 = 2048;
      uint64_t v33 = v12;
      _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v24, 0x34u);
LABEL_13:
    }
  }
  else if (v7)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v3, v6);
  }
LABEL_14:

  (*(void (**)(void))(a1[8] + 16))();
}

uint64_t __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke_546(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = _MRLogForCategory(0xAuLL);
  uint64_t v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[6]];
    int v20 = 138544130;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    BOOL v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    uint64_t v14 = v8;
    uint32_t v15 = 42;
LABEL_10:
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v16 = a1[4];
    uint64_t v17 = a1[5];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[6]];
    int v20 = 138543874;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 2048;
    id v25 = v18;
    BOOL v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    uint64_t v14 = v8;
    uint32_t v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_11:

  uint64_t v19 = a1[7];
  if (v19) {
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);
  }
}

void __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_555(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (UInt8 *)MRCreateDataFromXPCMessage(a2, "commandResultsData");
  MRCreateArrayFromData(v6, &__block_literal_global_559);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

MRCommandResult *__106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRCommandResult alloc] initWithData:v2];

  return v3;
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 nowPlayingClient:(id)a6 timeout:(double)a7 queue:(id)a8 completion:(id)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a9;
  uint64_t v16 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v41 = a8;
  id value_4 = a6;
  id v17 = a4;
  __int16 v18 = (void *)[[v16 alloc] initWithDictionary:v17];

  uint64_t v19 = [v18 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];

  if (!v19)
  {
    int v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];
    [v18 setObject:v21 forKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  }
  __int16 v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v23 = [v18 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  __int16 v24 = [NSString stringWithFormat:@"UIDs=(%@)", v14];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke;
  v44[3] = &unk_1E57D8700;
  __int16 v45 = @"sendCommandToNewGroupContainingOutputDeviceUIDs";
  id v25 = v23;
  id v46 = v25;
  id v39 = v22;
  id v47 = v39;
  id v40 = v15;
  id v48 = v40;
  __int16 v26 = (void *)MEMORY[0x1997190F0](v44);
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"sendCommandToNewGroupContainingOutputDeviceUIDs", v25];
  uint64_t v28 = v27;
  if (v24) {
    [v27 appendFormat:@" for %@", v24];
  }
  id v29 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v50 = v28;
    _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  __int16 v30 = MRCreateXPCMessage(0x300000000000032uLL);
  xpc_dictionary_set_uint64(v30, "command", a3);
  MRAddPropertyListToXPCMessage(v30, (uint64_t)v18, "commandOptions");
  uint64_t v31 = v14;
  MRAddPropertyListToXPCMessage(v30, (uint64_t)v14, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  __int16 v32 = [[MRPlayerPath alloc] initWithOrigin:0 client:value_4 player:0];

  MRAddPlayerPathToXPCMessage(v30, v32);
  xpc_dictionary_set_double(v30, "timeout", a7);
  uint64_t v33 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v34 = [v33 service];
  id v35 = [v34 mrXPCConnection];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_566;
  v42[3] = &unk_1E57D1490;
  id v43 = v26;
  id v36 = v26;
  [v35 sendMessage:v30 queue:v41 reply:v42];
}

void __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 error];

  if (v6 && !v7)
  {
    uint64_t v8 = [v5 debugName];

    uint64_t v9 = _MRLogForCategory(0xAuLL);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = a1[4];
        uint64_t v12 = a1[5];
        BOOL v13 = [v5 debugName];
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[6]];
        int v40 = 138544386;
        uint64_t v41 = v11;
        __int16 v42 = 2114;
        uint64_t v43 = v12;
        __int16 v44 = 2112;
        id v45 = v6;
        __int16 v46 = 2114;
        id v47 = v13;
        __int16 v48 = 2048;
        uint64_t v49 = v15;
        uint64_t v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_13:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v40, v18);
        goto LABEL_14;
      }
      goto LABEL_23;
    }
    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v31 = a1[4];
    uint64_t v32 = a1[5];
    BOOL v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[6]];
    int v40 = 138544130;
    uint64_t v41 = v31;
    __int16 v42 = 2114;
    uint64_t v43 = v32;
    __int16 v44 = 2112;
    id v45 = v6;
    __int16 v46 = 2048;
    id v47 = v33;
    uint64_t v34 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v35 = v9;
    uint32_t v36 = 42;
LABEL_21:
    _os_log_impl(&dword_194F3C000, v35, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v40, v36);
    goto LABEL_22;
  }
  uint64_t v19 = [v6 error];

  int v20 = [v5 debugName];

  uint64_t v21 = _MRLogForCategory(0xAuLL);
  uint64_t v9 = v21;
  if (v19)
  {
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        uint64_t v23 = a1[4];
        uint64_t v24 = a1[5];
        BOOL v13 = [v6 error];
        id v14 = [v5 debugName];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        [v25 timeIntervalSinceDate:a1[6]];
        int v40 = 138544386;
        uint64_t v41 = v23;
        __int16 v42 = 2114;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        id v45 = v13;
        __int16 v46 = 2114;
        id v47 = v14;
        __int16 v48 = 2048;
        uint64_t v49 = v26;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v40, 0x34u);

LABEL_14:
LABEL_22:

        goto LABEL_23;
      }
    }
    else if (v22)
    {
      __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_cold_1(a1, v6, v9);
    }
    goto LABEL_23;
  }
  BOOL v27 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (!v20)
  {
    if (!v27) {
      goto LABEL_23;
    }
    uint64_t v37 = a1[4];
    uint64_t v38 = a1[5];
    BOOL v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[6]];
    int v40 = 138543874;
    uint64_t v41 = v37;
    __int16 v42 = 2114;
    uint64_t v43 = v38;
    __int16 v44 = 2048;
    id v45 = v39;
    uint64_t v34 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v35 = v9;
    uint32_t v36 = 32;
    goto LABEL_21;
  }
  if (v27)
  {
    uint64_t v28 = a1[4];
    uint64_t v29 = a1[5];
    BOOL v13 = [v5 debugName];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:a1[6]];
    int v40 = 138544130;
    uint64_t v41 = v28;
    __int16 v42 = 2114;
    uint64_t v43 = v29;
    __int16 v44 = 2114;
    id v45 = v13;
    __int16 v46 = 2048;
    id v47 = v30;
    uint64_t v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_13;
  }
LABEL_23:

  (*(void (**)(void))(a1[7] + 16))();
}

void __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_566(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  MRCreateCommandResultFromXPCMessage(v8);
  id v6 = (MRCommandResult *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = [[MRCommandResult alloc] initWithError:v5];
  }
  id v7 = (void *)MRCreateEndpointFromXPCMessage(v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)findMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v14 = [v9 requestID];
  uint64_t v15 = (void *)[v13 initWithFormat:@"%@<%@>", @"findMyGroupLeader", v14];

  uint64_t v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    __int16 v42 = v15;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke;
  v34[3] = &unk_1E57D7E10;
  id v35 = @"findMyGroupLeader";
  id v17 = v9;
  id v36 = v17;
  id v18 = v12;
  id v37 = v18;
  id v19 = v11;
  id v39 = v19;
  id v20 = v10;
  id v38 = v20;
  uint64_t v21 = (void (**)(void, void, void))MEMORY[0x1997190F0](v34);
  BOOL v22 = +[MRDeviceInfoRequest localDeviceInfo];
  int v23 = [v22 groupContainsDiscoverableGroupLeader];
  int v24 = [v22 isAirPlayActive];
  uint64_t v25 = 1;
  if (v23) {
    uint64_t v25 = 2;
  }
  if (!v24) {
    uint64_t v25 = 0;
  }
  if (v25)
  {
    if (v25 == 1)
    {
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:33];
      ((void (**)(void, void, void *))v21)[2](v21, 0, v26);
    }
    else
    {
      uint64_t v26 = (void *)MRMediaRemoteCopyDeviceUID();
      if (v26)
      {
        BOOL v27 = [MRAVReconnaissanceSession alloc];
        int v40 = v26;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        uint64_t v29 = [(MRAVReconnaissanceSession *)v27 initWithOutputDeviceUIDs:v28 outputDeviceGroupID:0 features:8 details:v17];

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_2;
        v31[3] = &unk_1E57D7E38;
        uint64_t v32 = v29;
        uint64_t v33 = v21;
        __int16 v30 = v29;
        [(MRAVReconnaissanceSession *)v30 beginSearchWithTimeout:v31 completion:a3];
      }
      else
      {
        __int16 v30 = (MRAVReconnaissanceSession *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
        ((void (**)(void, void, MRAVReconnaissanceSession *))v21)[2](v21, 0, v30);
      }
    }
  }
  else
  {
    v21[2](v21, 0, 0);
  }
}

void __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _MRLogForCategory(0xAuLL);
  id v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) requestID];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = v5;
    __int16 v31 = 2048;
    uint64_t v32 = v12;
    id v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v14 = v8;
    uint32_t v15 = 42;
LABEL_10:
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) requestID];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    __int16 v29 = 2048;
    id v30 = v17;
    id v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v14 = v8;
    uint32_t v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_11:

  id v18 = *(void **)(a1 + 64);
  if (v18)
  {
    id v19 = *(NSObject **)(a1 + 56);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_570;
    v21[3] = &unk_1E57D0EA8;
    id v24 = v18;
    id v22 = v5;
    id v23 = v6;
    id v20 = MRCreateDonatedQosBlock(v21);
    dispatch_async(v19, v20);
  }
}

uint64_t __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_570(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  id v8 = *(id *)(a1 + 32);
  v7(v6, a3, a4);
}

- (void)willStartingPlaybackToOutputDeviceInterruptPlayback:(id)a3 duration:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v15 = [v10 UUID];
  id v14 = [v15 UUIDString];
  -[MRAVEndpoint _willStartingPlaybackToOutputDeviceInterruptPlayback:duration:requestID:queue:completion:](self, v13, v14, v12, v11, a4);
}

- (void)_willStartingPlaybackToOutputDeviceInterruptPlayback:(void *)a3 duration:(void *)a4 requestID:(void *)a5 queue:(double)a6 completion:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v14;
  if (a1)
  {
    if (!v14)
    {
      id v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:sel__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion_, a1, @"MRAVEndpoint.m", 2424, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
    }
    uint64_t v52 = v15;
    if (!v13)
    {
      __int16 v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:sel__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion_, a1, @"MRAVEndpoint.m", 2425, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
    }
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
    id v17 = [NSString alloc];
    id v18 = [a1 uniqueIdentifier];
    id v19 = [a1 localizedName];
    id v20 = (void *)[v17 initWithFormat:@"endpoint=%@(%@), outputDevice=%@", v18, v19, v11];

    uint64_t v21 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"willStartingPlaybackToOutputDeviceInterruptPlayback", v12];
    id v22 = v21;
    if (v20) {
      [(__CFString *)v21 appendFormat:@" for %@", v20];
    }
    id v23 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v83 = v22;
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke;
    v75[3] = &unk_1E57D8778;
    v75[4] = a1;
    id v49 = v20;
    id v76 = v49;
    v77 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
    id v51 = v12;
    id v24 = v12;
    id v78 = v24;
    id v25 = v16;
    id v79 = v25;
    id v50 = v13;
    id v26 = v13;
    id v80 = v26;
    id v15 = v52;
    id v81 = v52;
    __int16 v27 = (void (**)(void, void, void))MEMORY[0x1997190F0](v75);
    uint64_t v28 = +[MRUserSettings currentSettings];
    int v29 = [v28 supportMultiplayerHost];

    if (v29)
    {
      v27[2](v27, 0, 0);
      id v30 = v49;
LABEL_22:

      id v13 = v50;
      id v12 = v51;
      goto LABEL_23;
    }
    __int16 v31 = [MRBlockGuard alloc];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2;
    v71[3] = &unk_1E57D10A8;
    id v72 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
    id v32 = v24;
    id v73 = v32;
    uint64_t v33 = v27;
    id v74 = v33;
    uint64_t v34 = [(MRBlockGuard *)v31 initWithTimeout:@"willStartingPlaybackToOutputDeviceInterruptPlayback" reason:v71 handler:3.0];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_603;
    v68[3] = &unk_1E57D87A0;
    __int16 v48 = v34;
    id v69 = v48;
    id v70 = v33;
    id v47 = (void (**)(void, void, void))MEMORY[0x1997190F0](v68);
    if ([a1 isLocalEndpoint]
      && (+[MRAVClusterController sharedController],
          id v35 = objc_claimAutoreleasedReturnValue(),
          uint64_t v36 = [v35 clusterStatus],
          v35,
          v36 == 2))
    {
      id v37 = +[MRAVClusterController sharedController];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2_604;
      v61[3] = &unk_1E57D87C8;
      id v38 = (id *)&v62;
      id v62 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
      id v63 = v32;
      id v64 = v11;
      double v67 = a6;
      id v65 = v26;
      id v39 = v47;
      id v66 = v47;
      [v37 getClusterLeaderEndpoint:v61];

      id v40 = v63;
    }
    else
    {
      uint64_t v41 = [a1 outputDevices];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_608;
      v59[3] = &unk_1E57D07B8;
      id v38 = &v60;
      id v60 = v11;
      objc_msgSend(v41, "mr_filter:", v59);
      id v40 = (id)objc_claimAutoreleasedReturnValue();

      if (![v40 count])
      {
        __int16 v44 = _MRLogForCategory(0xAuLL);
        id v15 = v52;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543874;
          id v83 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
          __int16 v84 = 2114;
          id v85 = v32;
          __int16 v86 = 2112;
          id v87 = @"Endpoint is routed to specified outputDevice";
          _os_log_impl(&dword_194F3C000, v44, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        id v39 = v47;
        v47[2](v47, 0, 0);
        goto LABEL_21;
      }
      __int16 v42 = [[MRNowPlayingControllerConfiguration alloc] initWithEndpoint:a1];
      [(MRNowPlayingControllerConfiguration *)v42 setRequestPlaybackQueue:1];
      [(MRNowPlayingControllerConfiguration *)v42 setRequestPlaybackState:1];
      [(MRNowPlayingControllerConfiguration *)v42 setLabel:@"CheckForInterrupt"];
      uint64_t v43 = [[MRNowPlayingController alloc] initWithConfiguration:v42];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_615;
      v53[3] = &unk_1E57D87F0;
      __int16 v54 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
      id v55 = v32;
      id v39 = v47;
      id v57 = v47;
      double v58 = a6;
      id v40 = v40;
      id v56 = v40;
      [(MRNowPlayingController *)v43 performRequestWithCompletion:v53];
    }
    id v15 = v52;
LABEL_21:
    id v30 = v49;

    goto LABEL_22;
  }
LABEL_23:
}

- (void)willStartingPlaybackToOutputDevicesInterruptPlayback:(id)a3 originatingOutputDeviceUID:(id)a4 duration:(double)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 2372, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v50 = [MEMORY[0x1E4F28B00] currentHandler];
  [v50 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 2373, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  id v16 = [NSString alloc];
  id v17 = [(MRAVEndpoint *)self uniqueIdentifier];
  id v18 = [(MRAVEndpoint *)self localizedName];
  uint64_t v53 = v13;
  id v19 = (void *)[v16 initWithFormat:@"endpoint=%@(%@), outputDevices=%@ originatingOutputDeviceUID=%@", v17, v18, v12, v13];

  id v20 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
  id v22 = [v21 UUIDString];

  id v23 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"willStartingPlaybackToOutputDeviceInterruptPlayback", v22];
  id v24 = v23;
  if (v19) {
    [(__CFString *)v23 appendFormat:@" for %@", v19];
  }
  id v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    double v67 = v24;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke;
  v59[3] = &unk_1E57D8728;
  id v26 = v19;
  id v60 = v26;
  uint64_t v61 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
  id v27 = v22;
  id v62 = v27;
  id v28 = v20;
  id v63 = v28;
  id v29 = v14;
  id v64 = v29;
  id v30 = v15;
  id v65 = v30;
  __int16 v31 = (void (**)(void, void))MEMORY[0x1997190F0](v59);
  id v32 = +[MRDeviceInfoRequest localDeviceInfo];
  uint64_t v33 = +[MRUserSettings currentSettings];
  char v34 = [v33 canHostMultiplayerStream];

  if (v34)
  {
    if ([v12 count])
    {
      id v35 = v12;
    }
    else
    {
      id v35 = (void *)[v12 mutableCopy];
      uint64_t v37 = (uint64_t)v53;
      if (!v53)
      {
        uint64_t v37 = [v32 WHAIdentifier];
      }
      uint64_t v53 = (void *)v37;
      objc_msgSend(v35, "addObject:");
    }
    id v38 = [v32 WHAIdentifier];
    int v39 = [v35 containsObject:v38];

    if (v39
      && (+[MRAVClusterController sharedController],
          id v40 = objc_claimAutoreleasedReturnValue(),
          uint64_t v41 = [v40 clusterStatus],
          v40,
          v41 == 2))
    {
      uint64_t v36 = (MRNowPlayingRequest *)[[NSString alloc] initWithFormat:@"Cluster secondaries cannot answer this question. Defaulting to No"];
      __int16 v42 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        double v67 = @"willStartingPlaybackToOutputDeviceInterruptPlayback";
        __int16 v68 = 2114;
        id v69 = v27;
        __int16 v70 = 2112;
        v71 = v36;
        _os_log_impl(&dword_194F3C000, v42, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v31[2](v31, 0);
    }
    else
    {
      MRCreateXPCMessage(0x30000000000002AuLL);
      uint64_t v36 = (MRNowPlayingRequest *)objc_claimAutoreleasedReturnValue();
      MRAddPropertyListToXPCMessage(v36, (uint64_t)v35, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
      uint64_t v43 = +[MRMediaRemoteServiceClient sharedServiceClient];
      [v43 service];
      id v51 = v30;
      uint64_t v52 = v32;
      id v44 = v27;
      v46 = id v45 = v26;
      [v46 mrXPCConnection];
      __int16 v48 = v47 = v28;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_591;
      v54[3] = &unk_1E57D1490;
      id v55 = v31;
      [v48 sendMessage:v36 queue:v29 reply:v54];

      id v28 = v47;
      id v26 = v45;
      id v27 = v44;
      id v30 = v51;
      id v32 = v52;
    }
  }
  else
  {
    uint64_t v36 = objc_alloc_init(MRNowPlayingRequest);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    void v56[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_2;
    v56[3] = &unk_1E57D8750;
    double v58 = v31;
    id v57 = v32;
    [(MRNowPlayingRequest *)v36 requestIsPlayingOnQueue:v29 completion:v56];

    id v35 = v12;
  }
}

void __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithBool:a2];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      id v19 = *(void **)(a1 + 32);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v35 = v18;
      __int16 v36 = 2114;
      uint64_t v37 = v17;
      __int16 v38 = 2114;
      int v39 = v19;
      __int16 v40 = 2048;
      uint64_t v41 = v20;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v35 = v27;
      __int16 v36 = 2114;
      uint64_t v37 = v28;
      __int16 v38 = 2048;
      int v39 = v29;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_14;
  }
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [NSNumber numberWithBool:a2];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)long long buf = 138544386;
      uint64_t v35 = v8;
      __int16 v36 = 2114;
      uint64_t v37 = v9;
      __int16 v38 = 2112;
      int v39 = v10;
      __int16 v40 = 2114;
      uint64_t v41 = v11;
      __int16 v42 = 2048;
      uint64_t v43 = v13;
      id v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v15 = v6;
      uint32_t v16 = 52;
LABEL_10:
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

LABEL_14:
    }
  }
  else if (v7)
  {
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    id v10 = [NSNumber numberWithBool:a2];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v35 = v24;
    __int16 v36 = 2114;
    uint64_t v37 = v25;
    __int16 v38 = 2112;
    int v39 = v10;
    __int16 v40 = 2048;
    uint64_t v41 = v26;
    id v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v15 = v6;
    uint32_t v16 = 42;
    goto LABEL_10;
  }
LABEL_15:

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_584;
  v31[3] = &unk_1E57D0E08;
  id v30 = *(NSObject **)(a1 + 64);
  id v32 = *(id *)(a1 + 72);
  char v33 = a2;
  dispatch_async(v30, v31);
}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_584(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2) {
    a2 = [*(id *)(a1 + 32) isProxyGroupPlayer];
  }
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v3(v2, a2);
}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_591(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "MRXPC_BOOL_RESULT_KEY");
  uint64_t v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);

  return v4(v2, v3);
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (!v5) {
    goto LABEL_6;
  }
  id v8 = [NSString alloc];
  uint64_t v9 = [v6 metadata];
  id v10 = [v9 title];
  uint64_t v11 = (void *)[v8 initWithFormat:@"Will interrupt %@ on %@", v10, v5];

  if (!v11)
  {
LABEL_6:
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v13 = _MRLogForCategory(0xAuLL);
    BOOL v24 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t v25 = *(void *)(a1 + 56);
        uint64_t v27 = *(void **)(a1 + 40);
        uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
        [v28 timeIntervalSinceDate:*(void *)(a1 + 64)];
        *(_DWORD *)long long buf = 138544130;
        uint64_t v48 = v26;
        __int16 v49 = 2114;
        uint64_t v50 = v25;
        __int16 v51 = 2114;
        uint64_t v52 = v27;
        __int16 v53 = 2048;
        uint64_t v54 = v29;
        id v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        __int16 v31 = v13;
        uint32_t v32 = 42;
LABEL_11:
        _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
    else if (v24)
    {
      uint64_t v33 = *(void *)(a1 + 48);
      uint64_t v34 = *(void *)(a1 + 56);
      uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
      [v28 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v48 = v33;
      __int16 v49 = 2114;
      uint64_t v50 = v34;
      __int16 v51 = 2048;
      uint64_t v52 = v35;
      id v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      __int16 v31 = v13;
      uint32_t v32 = 32;
      goto LABEL_11;
    }
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = _MRLogForCategory(0xAuLL);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      [v18 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)long long buf = 138544386;
      uint64_t v48 = v16;
      __int16 v49 = 2114;
      uint64_t v50 = v15;
      __int16 v51 = 2112;
      uint64_t v52 = v11;
      __int16 v53 = 2114;
      uint64_t v54 = v17;
      __int16 v55 = 2048;
      uint64_t v56 = v19;
      uint64_t v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v21 = v13;
      uint32_t v22 = 52;
LABEL_15:
      _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
  else if (v14)
  {
    uint64_t v36 = *(void *)(a1 + 48);
    uint64_t v37 = *(void *)(a1 + 56);
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    [v18 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v48 = v36;
    __int16 v49 = 2114;
    uint64_t v50 = v37;
    __int16 v51 = 2112;
    uint64_t v52 = v11;
    __int16 v53 = 2048;
    uint64_t v54 = v38;
    uint64_t v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    uint64_t v21 = v13;
    uint32_t v22 = 42;
    goto LABEL_15;
  }
LABEL_16:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_601;
  block[3] = &unk_1E57D0EA8;
  int v39 = *(NSObject **)(a1 + 72);
  id v40 = *(id *)(a1 + 80);
  id v45 = v6;
  id v46 = v40;
  id v44 = v5;
  id v41 = v6;
  id v42 = v5;
  dispatch_async(v39, block);
}

uint64_t __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_601(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_603(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2_604(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = @"Redirected to cluster groupLeader";
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v7, 0x20u);
  }

  -[MRAVEndpoint _willStartingPlaybackToOutputDeviceInterruptPlayback:duration:requestID:queue:completion:](v3, *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_608(uint64_t a1, void *a2)
{
  id v3 = [a2 uid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_615(double *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = (void *)[[NSString alloc] initWithFormat:@"error requesting playbackQueue %@", v6];
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_4:

      (*(void (**)(void))(*((void *)a1 + 7) + 16))();
      goto LABEL_7;
    }
LABEL_3:
    uint64_t v9 = *((void *)a1 + 4);
    uint64_t v10 = *((void *)a1 + 5);
    *(_DWORD *)long long buf = 138543874;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    goto LABEL_4;
  }
  if ([v5 playbackState] != 1)
  {
    __int16 v11 = [v5 lastPlayingDate];
    [v11 timeIntervalSinceNow];
    double v13 = -v12;

    if (a1[8] <= v13)
    {
      int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"timeSincePlaying is greater than specified duration %lf > %lf", *(void *)&v13, *((void *)a1 + 8));
      uint64_t v8 = _MRLogForCategory(0xAuLL);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_4;
      }
      goto LABEL_3;
    }
  }
LABEL_7:
  uint64_t v16 = a1 + 6;
  uint64_t v14 = *((void *)a1 + 6);
  uint64_t v15 = v16[1];
  uint64_t v17 = [v5 playbackQueue];
  uint64_t v18 = [v17 contentItems];
  uint64_t v19 = [v18 firstObject];
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v14, v19);
}

- (id)discoverySessionWithConfiguration:(id)a3
{
  id v4 = a3;
  if ([(MRAVEndpoint *)self isLocalEndpoint]
    || (-[MRAVEndpoint supportsExternalDiscovery]((uint64_t)self) & 1) != 0)
  {
    id v5 = (void *)[v4 copy];
    id v6 = -[MRAVEndpoint _externalDiscoverySessionDestinationUID](self);
    [v5 setOutputDeviceUID:v6];

    int v7 = +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:v5];
  }
  else
  {
    uint64_t v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MRAVEndpoint discoverySessionWithConfiguration:]();
    }

    int v7 = 0;
  }

  return v7;
}

- (uint64_t)supportsExternalDiscovery
{
  if (result)
  {
    v1 = (void *)result;
    if ([(id)result isCompanionEndpoint])
    {
      return 1;
    }
    else
    {
      uint64_t v2 = [v1 externalDevice];
      uint64_t v3 = [v2 supportsExternalDiscovery];

      return v3;
    }
  }
  return result;
}

- (id)_externalDiscoverySessionDestinationUID
{
  id v1 = a1;
  if (a1)
  {
    if ([a1 isLocalEndpoint])
    {
      id v1 = +[MRAVOutputDevice localDeviceUID];
      goto LABEL_11;
    }
    uint64_t v2 = [v1 externalDevice];
    uint64_t v3 = [v2 deviceInfo];
    id v4 = [v3 buildVersion];
    int v5 = [v4 hasPrefix:@"19K"];

    if (v5)
    {
      id v6 = [v1 externalDevice];
      int v7 = [v6 deviceInfo];
      id v8 = [v7 deviceUID];
    }
    else
    {
      id v6 = [v1 designatedGroupLeader];
      uint64_t v9 = [v6 clusterID];
      int v7 = v9;
      if (!v9)
      {
        uint64_t v10 = [v1 designatedGroupLeader];
        id v1 = [v10 uid];

        goto LABEL_10;
      }
      id v8 = v9;
    }
    id v1 = v8;
LABEL_10:
  }
LABEL_11:

  return v1;
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = @"MREndpointConnectionReasonUserInfoKey";
  v20[0] = @"createHostedEndpoint";
  __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke;
  v15[3] = &unk_1E57D8458;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(MRAVEndpoint *)self connectToExternalDeviceWithOptions:0 userInfo:v11 completion:v15];
}

void __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2;
    v6[3] = &unk_1E57D0DB8;
    id v4 = *(NSObject **)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v7 = v3;
    dispatch_async(v4, v6);
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) externalDevice];
    [v5 createHostedEndpointWithOutputDeviceUIDs:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"MRAVEndpoint.m", 2554, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

  if (!v10)
  {
LABEL_3:
    id v10 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
LABEL_4:
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  id v14 = [(MRAVEndpoint *)self outputDevices];
  uint64_t v15 = [v14 count];

  int v16 = MRAnalyticsCompositionForEndpoint(self);
  id v17 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v18 = [v9 requestDetails];
  uint64_t v19 = [v18 requestID];
  uint64_t v20 = (void *)[v17 initWithFormat:@"%@<%@>", @"Endpoint.modifyTopologyWithRequest", v19];

  uint64_t v21 = [(MRAVEndpoint *)self debugName];

  if (v21)
  {
    __int16 v22 = [(MRAVEndpoint *)self debugName];
    [v20 appendFormat:@" for %@", v22];
  }
  if (v9) {
    [v20 appendFormat:@" because %@", v9];
  }
  uint64_t v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v43 = v20;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (MSVDeviceOSIsInternalInstall())
  {
    __int16 v24 = MRLogCategoryDiscoveryOversize();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v9 requestDetails];
      uint64_t v26 = [v25 requestID];
      [MEMORY[0x1E4F29060] callStackSymbols];
      id v35 = v11;
      int v27 = v16;
      v29 = uint64_t v28 = v15;
      *(_DWORD *)long long buf = 138412546;
      uint64_t v43 = v26;
      __int16 v44 = 2112;
      id v45 = v29;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Endpoint.modifyTopologyWithRequest<%@> %@", buf, 0x16u);

      uint64_t v15 = v28;
      int v16 = v27;
      id v11 = v35;
    }
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v36[3] = &unk_1E57D8818;
  v36[4] = self;
  id v37 = v9;
  id v38 = v13;
  id v39 = v11;
  int v41 = v16;
  uint64_t v40 = v15;
  id v30 = v11;
  id v31 = v13;
  id v32 = v9;
  uint64_t v33 = (void *)MEMORY[0x1997190F0](v36);
  [(MRAVEndpoint *)self _modifyTopologyWithRequest:v32 withReplyQueue:v10 completion:v33];
}

void __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  int v5 = [*(id *)(a1 + 32) debugName];

  id v6 = _MRLogForCategory(0xAuLL);
  id v7 = v6;
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (!v5)
    {
      if (!v14) {
        goto LABEL_14;
      }
      id v9 = [*(id *)(a1 + 40) requestDetails];
      id v10 = [v9 requestID];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v27 = 138543874;
      uint64_t v28 = @"Endpoint.modifyTopologyWithRequest";
      __int16 v29 = 2114;
      id v30 = v10;
      __int16 v31 = 2048;
      id v32 = v16;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v27, 0x20u);
      goto LABEL_13;
    }
    if (!v14) {
      goto LABEL_14;
    }
    id v9 = [*(id *)(a1 + 40) requestDetails];
    id v10 = [v9 requestID];
    id v11 = [*(id *)(a1 + 32) debugName];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v27 = 138544130;
    uint64_t v28 = @"Endpoint.modifyTopologyWithRequest";
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = v15;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x2Au);
LABEL_8:

LABEL_13:
    goto LABEL_14;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = [*(id *)(a1 + 40) requestDetails];
    id v10 = [v9 requestID];
    id v11 = [*(id *)(a1 + 32) debugName];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v27 = 138544386;
    uint64_t v28 = @"Endpoint.modifyTopologyWithRequest";
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v11;
    __int16 v35 = 2048;
    uint64_t v36 = v13;
    _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x34u);
    goto LABEL_8;
  }
  if (v8) {
    __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_cold_1(a1, v3, v7);
  }
LABEL_14:

  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v3);
  }
  uint64_t v18 = [*(id *)(a1 + 40) type];
  uint64_t v19 = kMRTopologyModificationTypeAdd;
  switch(v18)
  {
    case 0:
      goto LABEL_22;
    case 1:
      goto LABEL_20;
    case 2:
      uint64_t v19 = kMRTopologyModificationTypeRemove;
      goto LABEL_20;
    case 3:
      uint64_t v19 = kMRTopologyModificationTypeSet;
LABEL_20:
      uint64_t v20 = *v19;
      break;
    default:
      uint64_t v20 = 0;
      break;
  }
  uint64_t v21 = *(void **)(a1 + 48);
  __int16 v22 = [*(id *)(a1 + 40) requestDetails];
  uint64_t v23 = [v22 reason];
  int v24 = *(_DWORD *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 64);
  uint64_t v26 = [*(id *)(a1 + 40) outputDevices];
  MRAnalyticsTrackTopologyChangeEvent(@"set", v21, v23, v24, v25, v26, 0, v3);

LABEL_22:
}

- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__35;
  v25[4] = __Block_byref_object_dispose__35;
  id v11 = v8;
  id v26 = v11;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v22[3] = &unk_1E57D0DE0;
  id v12 = v10;
  id v24 = v12;
  id v13 = v9;
  id v23 = v13;
  BOOL v14 = (void *)MEMORY[0x1997190F0](v22);
  int v27 = @"MREndpointConnectionReasonUserInfoKey";
  v28[0] = @"modifyOutputContext";
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3;
  v18[3] = &unk_1E57D8840;
  uint64_t v21 = v25;
  v18[4] = self;
  id v16 = v13;
  id v19 = v16;
  id v17 = v14;
  id v20 = v17;
  [(MRAVEndpoint *)self connectToExternalDeviceWithOptions:1 userInfo:v15 completion:v18];

  _Block_object_dispose(v25, 8);
}

void __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v6 = v4;
    id v5 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) outputDevices];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = (void *)MRMediaRemoteCopyDeviceUID();
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) outputDevices];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_4;
      v14[3] = &unk_1E57D1838;
      id v15 = v6;
      id v8 = v6;
      id v9 = objc_msgSend(v7, "msv_map:", v14);

      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copyWithOutputDeviceUIDs:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    id v13 = [*(id *)(a1 + 32) externalDevice];
    [v13 modifyTopologyWithRequest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withReplyQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

id __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocalDevice] && (id v4 = *(void **)(a1 + 32)) != 0)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v3 uid];
  }
  id v6 = v5;

  return v6;
}

- (id)outputDeviceWithUID:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__MRAVEndpoint_outputDeviceWithUID___block_invoke;
  v9[3] = &unk_1E57D07B8;
  id v10 = v4;
  id v5 = v4;
  id v6 = [(MRAVEndpoint *)self outputDevicesMatchingPredicate:v9];
  id v7 = [v6 firstObject];

  return v7;
}

uint64_t __36__MRAVEndpoint_outputDeviceWithUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v12];

  BOOL v14 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v15 type:1 outputDevices:v13];
  [(MRAVEndpoint *)self modifyTopologyWithRequest:v14 withReplyQueue:v11 completion:v10];
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = _MRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:]();
  }

  [(MRAVEndpoint *)self addOutputDevices:v14 initiator:v13 withReplyQueue:v12 completion:v11];
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v12];

  id v14 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v15 type:2 outputDevices:v13];
  [(MRAVEndpoint *)self modifyTopologyWithRequest:v14 withReplyQueue:v11 completion:v10];
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = _MRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:]();
  }

  [(MRAVEndpoint *)self removeOutputDevices:v14 initiator:v13 withReplyQueue:v12 completion:v11];
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v12];

  id v14 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v15 type:3 outputDevices:v13];
  [(MRAVEndpoint *)self modifyTopologyWithRequest:v14 withReplyQueue:v11 completion:v10];
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = _MRLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:]();
  }

  [(MRAVEndpoint *)self setOutputDevices:v14 initiator:v13 withReplyQueue:v12 completion:v11];
}

- (void)outputContextDataSource
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[AVEndpoint] %@ OutputContextDataSource not set, fetching manually...", buf, 0xCu);
}

- (void)discoverySessionWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_194F3C000, v0, v1, "[AVEndpoint] Endpoint does not support external discovery", v2, v3, v4, v5, v6);
}

@end