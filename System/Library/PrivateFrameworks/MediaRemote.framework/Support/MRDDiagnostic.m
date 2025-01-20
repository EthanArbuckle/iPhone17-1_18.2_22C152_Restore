@interface MRDDiagnostic
- (BOOL)groupSessionDiscoveryEnabled;
- (BOOL)isAdvertisingProximity;
- (BOOL)lockScreenWidgetActive;
- (BOOL)lockScreenWidgetVisible;
- (MRApplicationActivity)currentAppActivity;
- (MRDCommandClientRestriction)commandClientsRestriction;
- (MRDDiagnostic)init;
- (MRDMediaRemoteClient)daemonClient;
- (MRDMediaRemoteClient)frontmostClient;
- (MRDMediaRemoteClient)localNowPlayingClient;
- (MRDMediaRemoteClient)systemMediaClient;
- (MRDPreemptiveRemoteControlConnectionManager)automaticRemoteControlConnections;
- (MRDRemoteControlService)remoteControlService;
- (MRDVolumeController)volumeController;
- (MROrigin)activeOrigin;
- (MRPlayerPath)electedPlayer;
- (MRPlayerPath)lockScreenPlayerPath;
- (NSArray)activeClients;
- (NSArray)activeTransactions;
- (NSArray)autoConnectedEndpoints;
- (NSArray)autoConnectingEndpoints;
- (NSArray)connectedExternalDevices;
- (NSArray)discoveredGroupSessions;
- (NSArray)discoverySessions;
- (NSArray)endpoints;
- (NSArray)groupSessionAdvertiserEvents;
- (NSArray)hostedDiscoverySessions;
- (NSArray)immediateDevices;
- (NSArray)mediumDevices;
- (NSArray)migratingDevices;
- (NSArray)migrationEvents;
- (NSArray)nearbyDevices;
- (NSArray)notifiedGroupSessions;
- (NSArray)originClients;
- (NSArray)originForwarders;
- (NSArray)promptingDevices;
- (NSArray)queuedInitiatePlaybackMessages;
- (NSArray)recentlyDismissedSystemEndpoints;
- (NSArray)recordingEndpointClients;
- (NSArray)registeredVirtualAudioDevices;
- (NSArray)remoteControlContexts;
- (NSArray)televisionEndpoints;
- (NSArray)transactions;
- (NSDate)dateCreated;
- (NSDictionary)enqueuedCommands;
- (NSDictionary)hostedExternalDevices;
- (NSDictionary)systemActiveEndpoints;
- (NSDictionary)uiActivitiesInfo;
- (NSString)advertisingReasonDescription;
- (NSString)batchedNowPlayingState;
- (NSString)currentGroupSession;
- (NSString)discoverySession;
- (NSString)electedPlayerReason;
- (NSString)groupSessionAdvertiserState;
- (NSString)groupSessionAssertionManagerState;
- (NSString)groupSessionCoordinatorState;
- (NSString)groupSessionManagerAdvertiseReason;
- (NSString)localReceiverPairingIdentity;
- (NSString)mediaControlDiagnostic;
- (NSString)remoteASEState;
- (_MRAVAirPlaySecuritySettingsProtobuf)airplaySecuritySettings;
- (double)transactionWaitDuration;
- (id)createDiagnosticInfo;
- (id)mediaSuggestions:(id)a3;
- (unint64_t)allowedTransactionMemory;
- (unint64_t)usedTransactionMemory;
- (unsigned)hostedRouteDiscoveryMode;
- (unsigned)systemDiscoveryMode;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6 usingDebugDescription:(BOOL)a7;
- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5 usingDebugDescription:(BOOL)a6;
- (void)_appendSubheader:(id)a3 toString:(id)a4;
- (void)setActiveClients:(id)a3;
- (void)setActiveOrigin:(id)a3;
- (void)setActiveTransactions:(id)a3;
- (void)setAdvertisingReasonDescription:(id)a3;
- (void)setAirplaySecuritySettings:(id)a3;
- (void)setAllowedTransactionMemory:(unint64_t)a3;
- (void)setAutoConnectedEndpoints:(id)a3;
- (void)setAutoConnectingEndpoints:(id)a3;
- (void)setAutomaticRemoteControlConnections:(id)a3;
- (void)setBatchedNowPlayingState:(id)a3;
- (void)setCommandClientsRestriction:(id)a3;
- (void)setConnectedExternalDevices:(id)a3;
- (void)setCurrentAppActivity:(id)a3;
- (void)setCurrentGroupSession:(id)a3;
- (void)setDaemonClient:(id)a3;
- (void)setDiscoveredGroupSessions:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setDiscoverySessions:(id)a3;
- (void)setElectedPlayer:(id)a3;
- (void)setElectedPlayerReason:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setEnqueuedCommands:(id)a3;
- (void)setFrontmostClient:(id)a3;
- (void)setGroupSessionAdvertiserEvents:(id)a3;
- (void)setGroupSessionAdvertiserState:(id)a3;
- (void)setGroupSessionAssertionManagerState:(id)a3;
- (void)setGroupSessionCoordinatorState:(id)a3;
- (void)setGroupSessionDiscoveryEnabled:(BOOL)a3;
- (void)setGroupSessionManagerAdvertiseReason:(id)a3;
- (void)setHostedDiscoverySessions:(id)a3;
- (void)setHostedExternalDevices:(id)a3;
- (void)setHostedRouteDiscoveryMode:(unsigned int)a3;
- (void)setImmediateDevices:(id)a3;
- (void)setIsAdvertisingProximity:(BOOL)a3;
- (void)setLocalNowPlayingClient:(id)a3;
- (void)setLocalReceiverPairingIdentity:(id)a3;
- (void)setLockScreenPlayerPath:(id)a3;
- (void)setLockScreenWidgetActive:(BOOL)a3;
- (void)setLockScreenWidgetVisible:(BOOL)a3;
- (void)setMediaControlDiagnostic:(id)a3;
- (void)setMediumDevices:(id)a3;
- (void)setMigratingDevices:(id)a3;
- (void)setMigrationEvents:(id)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setNotifiedGroupSessions:(id)a3;
- (void)setOriginClients:(id)a3;
- (void)setOriginForwarders:(id)a3;
- (void)setPromptingDevices:(id)a3;
- (void)setQueuedInitiatePlaybackMessages:(id)a3;
- (void)setRecentlyDismissedSystemEndpoints:(id)a3;
- (void)setRecordingEndpointClients:(id)a3;
- (void)setRegisteredVirtualAudioDevices:(id)a3;
- (void)setRemoteASEState:(id)a3;
- (void)setRemoteControlContexts:(id)a3;
- (void)setRemoteControlService:(id)a3;
- (void)setSystemActiveEndpoints:(id)a3;
- (void)setSystemDiscoveryMode:(unsigned int)a3;
- (void)setSystemMediaClient:(id)a3;
- (void)setTelevisionEndpoints:(id)a3;
- (void)setTransactionWaitDuration:(double)a3;
- (void)setTransactions:(id)a3;
- (void)setUiActivitiesInfo:(id)a3;
- (void)setUsedTransactionMemory:(unint64_t)a3;
- (void)setVolumeController:(id)a3;
@end

@implementation MRDDiagnostic

- (MRDDiagnostic)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRDDiagnostic;
  v2 = [(MRDDiagnostic *)&v6 init];
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init((Class)NSDate);
    dateCreated = v2->_dateCreated;
    v2->_dateCreated = v3;
  }
  return v2;
}

- (id)createDiagnosticInfo
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendString:@"MediaRemote Diagnostic\n"];
  [v3 appendFormat:@"Collected at: %@\n", self->_dateCreated];
  [v3 appendString:@"================================================================================\n\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_activeClients toString:v3 withTitle:@"Active Clients" indentLevel:0 usingDebugDescription:1];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_activeTransactions toString:v3 withTitle:@"Active Transactions"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_currentAppActivity toString:v3 withTitle:@"Current App Activity"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_localNowPlayingClient toString:v3 withTitle:@"Local Now Playing Client"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_systemMediaClient toString:v3 withTitle:@"System Media Client"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_frontmostClient toString:v3 withTitle:@"Frontmost Client"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_daemonClient toString:v3 withTitle:@"Daemon Client"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_volumeController toString:v3 withTitle:@"VolumeController" usingDebugDescription:1];
  [(MRDDiagnostic *)self _appendSubheader:@"UI Server" toString:v3];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_uiActivitiesInfo toString:v3 withTitle:@"UI Activities Info"];
  [(MRDDiagnostic *)self _appendSubheader:@"Now Playing Server" toString:v3];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_originClients toString:v3 withTitle:@"Origin Clients" indentLevel:0 usingDebugDescription:1];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_activeOrigin toString:v3 withTitle:@"Active Origin"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_electedPlayer toString:v3 withTitle:@"Elected Player"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_electedPlayerReason toString:v3 withTitle:@"Elected Player Reason"];
  [v3 appendString:@"\n"];
  v4 = +[NSNumber numberWithBool:self->_lockScreenWidgetActive];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v4 toString:v3 withTitle:@"LockScreen Widget Active"];

  v5 = +[NSNumber numberWithBool:self->_lockScreenWidgetActive];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v5 toString:v3 withTitle:@"LockScreen Widget Visible"];

  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_lockScreenPlayerPath toString:v3 withTitle:@"LockScreen Widget PlayerPath"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_originForwarders toString:v3 withTitle:@"Origin Forwarders"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendSubheader:@"Remote Control Server" toString:v3];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_enqueuedCommands toString:v3 withTitle:@"Enqueued Commands"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_remoteControlContexts toString:v3 withTitle:@"Remote Control Contexts"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_commandClientsRestriction toString:v3 withTitle:@"RestrictedCommandClient Mode Restriction"];
  [(MRDDiagnostic *)self _appendSubheader:@"Browsable Content Server" toString:v3];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_queuedInitiatePlaybackMessages toString:v3 withTitle:@"Queued \"Initiate Playback\" Messages"];
  [(MRDDiagnostic *)self _appendSubheader:@"External Device Server" toString:v3];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_connectedExternalDevices toString:v3 withTitle:@"Connected Devices" indentLevel:0 usingDebugDescription:1];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_televisionEndpoints toString:v3 withTitle:@"Television Endpoints"];
  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_discoverySessions toString:v3 withTitle:@"External Discovery Sessions" usingDebugDescription:0];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_remoteControlService toString:v3 withTitle:@"RemoteControlService" usingDebugDescription:1];
  objc_super v6 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v6 toString:v3 withTitle:@"LocalEndpoint" usingDebugDescription:1];

  [v3 appendString:@"\n"];
  v7 = +[MRDAVOutputContextManager sharedManager];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v7 toString:v3 withTitle:@"OutputContexts" usingDebugDescription:1];

  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_batchedNowPlayingState toString:v3 withTitle:@"BatchedNowPlayingState" usingDebugDescription:0];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_remoteASEState toString:v3 withTitle:@"RemoteASEState" usingDebugDescription:0];
  [(MRDDiagnostic *)self _appendSubheader:@"Routing Server" toString:v3];
  v8 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v8 toString:v3 withTitle:@"System Discovery Mode (Legacy)"];

  v9 = [(_MRAVAirPlaySecuritySettingsProtobuf *)self->_airplaySecuritySettings description];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v9 toString:v3 withTitle:@"AirPlay Security Settings"];

  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_localReceiverPairingIdentity toString:v3 withTitle:@"Local Receiver Pairing Identity"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_systemActiveEndpoints toString:v3 withTitle:@"System Active Endpoints"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_recentlyDismissedSystemEndpoints toString:v3 withTitle:@"Recently Dissmised Recommendations"];
  if ([(NSArray *)self->_autoConnectedEndpoints count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_autoConnectingEndpoints toString:v3 withTitle:@"Auto Connecting Endpoints"];
  }
  if ([(NSArray *)self->_autoConnectedEndpoints count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_autoConnectedEndpoints toString:v3 withTitle:@"Auto Connected Endpoints"];
  }
  if ([(NSArray *)self->_migrationEvents count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_migrationEvents toString:v3 withTitle:@"Proximity Events"];
  }
  if ([(NSArray *)self->_nearbyDevices count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_nearbyDevices toString:v3 withTitle:@"Nearby Devices"];
  }
  if ([(NSArray *)self->_mediumDevices count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_mediumDevices toString:v3 withTitle:@"Medium Devices"];
  }
  if ([(NSArray *)self->_immediateDevices count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_immediateDevices toString:v3 withTitle:@"Immediate Devices"];
  }
  if ([(NSArray *)self->_migratingDevices count]) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_migratingDevices toString:v3 withTitle:@"Proximal Migrating Devices"];
  }
  automaticRemoteControlConnections = self->_automaticRemoteControlConnections;
  if (automaticRemoteControlConnections) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:automaticRemoteControlConnections toString:v3 withTitle:@"Preemptive RemoteControl Connections" usingDebugDescription:1];
  }
  [(MRDDiagnostic *)self _appendSubheader:@"Hosted Routing" toString:v3];
  v11 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v11 toString:v3 withTitle:@"Hosted Discovery Mode"];

  [v3 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_hostedDiscoverySessions toString:v3 withTitle:@"Discovery Sessions" indentLevel:0 usingDebugDescription:1];
  [v3 appendString:@"\n"];
  [v3 appendString:@"Endpoints:\n"];
  v12 = +[NSMutableArray arrayWithCapacity:[(NSDictionary *)self->_hostedExternalDevices count]];
  endpoints = self->_endpoints;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100117178;
  v65[3] = &unk_10041D5A0;
  id v14 = v12;
  id v66 = v14;
  v67 = self;
  id v15 = v3;
  id v68 = v15;
  [(NSArray *)endpoints enumerateObjectsUsingBlock:v65];
  id v16 = [(NSDictionary *)self->_hostedExternalDevices mutableCopy];
  v52 = v14;
  [v16 removeObjectsForKeys:v14];
  if ([v16 count])
  {
    [v15 appendString:@"Remaining External Devices\n"];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1001172C4;
    v62[3] = &unk_10041D5C8;
    id v17 = v15;
    id v63 = v17;
    v64 = self;
    [v16 enumerateKeysAndObjectsUsingBlock:v62];
    [v17 appendString:@"\n"];
  }
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_discoverySession toString:v15 withTitle:@"Concrete Discovery Session" usingDebugDescription:1];
  v18 = +[MRUserSettings currentSettings];
  unsigned int v19 = [v18 supportMultiplayerHost];

  if (v19)
  {
    v20 = +[MRDStreamCapacityManager sharedManager];
    [(MRDDiagnostic *)self _appendNullableObjectDescription:v20 toString:v15 withTitle:@"Stream Count" usingDebugDescription:1];
  }
  v51 = v16;
  [(MRDDiagnostic *)self _appendSubheader:@"Virtual Audio Server" toString:v15];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_recordingEndpointClients toString:v15 withTitle:@"Recording Endpoint Clients"];
  [v15 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_registeredVirtualAudioDevices toString:v15 withTitle:@"Registered Virtual Audio Devices"];
  [(MRDDiagnostic *)self _appendSubheader:@"Transaction Server" toString:v15];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_transactions toString:v15 withTitle:@"Transactions"];
  [v15 appendString:@"\n"];
  objc_msgSend(v15, "appendFormat:", @"Used Transaction Memory: %llu bytes\n", self->_usedTransactionMemory);
  objc_msgSend(v15, "appendFormat:", @"Allowed Transaction Memory: %llu bytes\n", self->_allowedTransactionMemory);
  objc_msgSend(v15, "appendFormat:", @"Transaction Wait Duration: %f seconds\n", *(void *)&self->_transactionWaitDuration);
  [(MRDDiagnostic *)self _appendSubheader:@"Group Sessions" toString:v15];
  groupSessionAssertionManagerState = self->_groupSessionAssertionManagerState;
  if (groupSessionAssertionManagerState) {
    [(MRDDiagnostic *)self _appendNullableObjectDescription:groupSessionAssertionManagerState toString:v15 withTitle:@"Assertion manager state"];
  }
  [v15 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_currentGroupSession toString:v15 withTitle:@"Current group session"];
  [v15 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_groupSessionManagerAdvertiseReason toString:v15 withTitle:@"Advertiser reason"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_groupSessionAdvertiserState toString:v15 withTitle:@"Advertiser state"];
  [(MRDDiagnostic *)self _appendDescribableArray:self->_groupSessionAdvertiserEvents toString:v15 withTitle:@"Advertiser log history" indentLevel:1];
  [v15 appendString:@"\n"];
  v22 = +[NSNumber numberWithBool:self->_groupSessionDiscoveryEnabled];
  v23 = [v22 stringValue];
  [v15 appendFormat:@"GroupSession discovery enabled: %@\n", v23];

  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_discoveredGroupSessions toString:v15 withTitle:@"Discovered group sessions"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_notifiedGroupSessions toString:v15 withTitle:@"Notified group sessions"];
  [v15 appendString:@"\n"];
  [(MRDDiagnostic *)self _appendNullableObjectDescription:self->_groupSessionCoordinatorState toString:v15 withTitle:@"Coordinator state"];
  [(MRDDiagnostic *)self _appendSubheader:@"Media Suggestions Data Source" toString:v15];
  uint64_t v24 = objc_opt_new();
  v25 = [(MRDDiagnostic *)self mediaSuggestions:v24];
  v50 = (void *)v24;
  [(MRDDiagnostic *)self _appendNullableObjectDescription:v24 toString:v15 withTitle:@"Suggestion Preferences"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v26 = v25;
  id v27 = [v26 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v32 = [v26 objectForKeyedSubscript:v31];
        [(MRDDiagnostic *)self _appendDescribableArray:v32 toString:v15 withTitle:v31];
      }
      id v28 = [v26 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v28);
  }
  v49 = v26;

  v33 = self;
  [(MRDDiagnostic *)self _appendSubheader:@"Companion Link" toString:v15];
  v34 = +[MRCompanionLinkClient sharedCompanionLinkClient];
  v35 = [v34 companionLinkDevices];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v35;
  id v36 = [obj countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(obj);
        }
        v69 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        v40 = v69;
        v41 = +[NSArray arrayWithObjects:&v69 count:1];
        v42 = [v40 mediaRouteIdentifier];
        v43 = +[NSString stringWithFormat:@"RPDevice<routeID: %@>", v42, v49];
        [(MRDDiagnostic *)v33 _appendDescribableArray:v41 toString:v15 withTitle:v43];

        v44 = [v40 homeKitUserIdentifiers];
        [(MRDDiagnostic *)v33 _appendDescribableArray:v44 toString:v15 withTitle:@"Home Users"];

        [v15 appendString:@"\n"];
      }
      id v37 = [obj countByEnumeratingWithState:&v54 objects:v70 count:16];
    }
    while (v37);
  }

  [(MRDDiagnostic *)v33 _appendSubheader:@"MediaRemote User defaults" toString:v15];
  id v45 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaremote"];
  v46 = [v45 dictionaryRepresentation];
  [(MRDDiagnostic *)v33 _appendNullableObjectDescription:v46 toString:v15 withTitle:@"UserDefaults"];
  [v15 appendString:@"\n"];
  [(MRDDiagnostic *)v33 _appendSubheader:@"Media Control" toString:v15];
  [v15 appendString:v33->_mediaControlDiagnostic];
  v47 = (void *)MRDiagnosticCreate();

  return v47;
}

- (void)_appendSubheader:(id)a3 toString:(id)a4
{
}

- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5 usingDebugDescription:(BOOL)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v12)
  {
    if (a6) {
      [v12 debugDescription];
    }
    else {
    v11 = [v12 description];
    }
  }
  else
  {
    v11 = @"(None)";
  }
  [v9 appendFormat:@"%@: %@\n", v10, v11];
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6
{
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6 usingDebugDescription:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  for (i = +[NSMutableString string];
    [i appendString:@"    "];
  [v12 appendFormat:@"%@%@:", i, v13];
  if ([v11 count])
  {
    id v22 = v13;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        unsigned int v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v19);
          if (v7) {
            [v20 debugDescription];
          }
          else {
          v21 = [v20 description];
          }
          [v12 appendFormat:@"\n%@%@", i, v21];

          unsigned int v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }

    id v13 = v22;
  }
  else
  {
    [v12 appendFormat:@"\n%@(None)", i];
  }
  [v12 appendString:@"\n"];
}

- (id)mediaSuggestions:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001177EC;
  id v16 = sub_1001177FC;
  id v17 = 0;
  v5 = +[MRMediaSuggestionRequest defaultRequest];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100117804;
  v9[3] = &unk_10041D5F0;
  id v11 = &v12;
  objc_super v6 = v4;
  id v10 = v6;
  [v5 performWithPreferences:v3 completion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSArray)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
}

- (NSArray)activeTransactions
{
  return self->_activeTransactions;
}

- (void)setActiveTransactions:(id)a3
{
}

- (MRApplicationActivity)currentAppActivity
{
  return self->_currentAppActivity;
}

- (void)setCurrentAppActivity:(id)a3
{
}

- (MRDMediaRemoteClient)localNowPlayingClient
{
  return self->_localNowPlayingClient;
}

- (void)setLocalNowPlayingClient:(id)a3
{
}

- (MRDMediaRemoteClient)systemMediaClient
{
  return self->_systemMediaClient;
}

- (void)setSystemMediaClient:(id)a3
{
}

- (MRDMediaRemoteClient)frontmostClient
{
  return self->_frontmostClient;
}

- (void)setFrontmostClient:(id)a3
{
}

- (MRDMediaRemoteClient)daemonClient
{
  return self->_daemonClient;
}

- (void)setDaemonClient:(id)a3
{
}

- (MRDVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (NSArray)originClients
{
  return self->_originClients;
}

- (void)setOriginClients:(id)a3
{
}

- (MROrigin)activeOrigin
{
  return self->_activeOrigin;
}

- (void)setActiveOrigin:(id)a3
{
}

- (MRPlayerPath)electedPlayer
{
  return self->_electedPlayer;
}

- (void)setElectedPlayer:(id)a3
{
}

- (NSString)electedPlayerReason
{
  return self->_electedPlayerReason;
}

- (void)setElectedPlayerReason:(id)a3
{
}

- (BOOL)lockScreenWidgetActive
{
  return self->_lockScreenWidgetActive;
}

- (void)setLockScreenWidgetActive:(BOOL)a3
{
  self->_lockScreenWidgetActive = a3;
}

- (BOOL)lockScreenWidgetVisible
{
  return self->_lockScreenWidgetVisible;
}

- (void)setLockScreenWidgetVisible:(BOOL)a3
{
  self->_lockScreenWidgetVisible = a3;
}

- (MRPlayerPath)lockScreenPlayerPath
{
  return self->_lockScreenPlayerPath;
}

- (void)setLockScreenPlayerPath:(id)a3
{
}

- (NSArray)originForwarders
{
  return self->_originForwarders;
}

- (void)setOriginForwarders:(id)a3
{
}

- (NSDictionary)enqueuedCommands
{
  return self->_enqueuedCommands;
}

- (void)setEnqueuedCommands:(id)a3
{
}

- (NSArray)remoteControlContexts
{
  return self->_remoteControlContexts;
}

- (void)setRemoteControlContexts:(id)a3
{
}

- (MRDCommandClientRestriction)commandClientsRestriction
{
  return self->_commandClientsRestriction;
}

- (void)setCommandClientsRestriction:(id)a3
{
}

- (NSArray)queuedInitiatePlaybackMessages
{
  return self->_queuedInitiatePlaybackMessages;
}

- (void)setQueuedInitiatePlaybackMessages:(id)a3
{
}

- (NSArray)connectedExternalDevices
{
  return self->_connectedExternalDevices;
}

- (void)setConnectedExternalDevices:(id)a3
{
}

- (NSArray)televisionEndpoints
{
  return self->_televisionEndpoints;
}

- (void)setTelevisionEndpoints:(id)a3
{
}

- (NSArray)discoverySessions
{
  return self->_discoverySessions;
}

- (void)setDiscoverySessions:(id)a3
{
}

- (MRDRemoteControlService)remoteControlService
{
  return self->_remoteControlService;
}

- (void)setRemoteControlService:(id)a3
{
}

- (NSString)batchedNowPlayingState
{
  return self->_batchedNowPlayingState;
}

- (void)setBatchedNowPlayingState:(id)a3
{
}

- (NSString)remoteASEState
{
  return self->_remoteASEState;
}

- (void)setRemoteASEState:(id)a3
{
}

- (unsigned)systemDiscoveryMode
{
  return self->_systemDiscoveryMode;
}

- (void)setSystemDiscoveryMode:(unsigned int)a3
{
  self->_systemDiscoveryMode = a3;
}

- (_MRAVAirPlaySecuritySettingsProtobuf)airplaySecuritySettings
{
  return self->_airplaySecuritySettings;
}

- (void)setAirplaySecuritySettings:(id)a3
{
}

- (NSString)localReceiverPairingIdentity
{
  return self->_localReceiverPairingIdentity;
}

- (void)setLocalReceiverPairingIdentity:(id)a3
{
}

- (NSDictionary)systemActiveEndpoints
{
  return self->_systemActiveEndpoints;
}

- (void)setSystemActiveEndpoints:(id)a3
{
}

- (NSArray)recentlyDismissedSystemEndpoints
{
  return self->_recentlyDismissedSystemEndpoints;
}

- (void)setRecentlyDismissedSystemEndpoints:(id)a3
{
}

- (NSArray)autoConnectedEndpoints
{
  return self->_autoConnectedEndpoints;
}

- (void)setAutoConnectedEndpoints:(id)a3
{
}

- (NSArray)autoConnectingEndpoints
{
  return self->_autoConnectingEndpoints;
}

- (void)setAutoConnectingEndpoints:(id)a3
{
}

- (NSArray)migrationEvents
{
  return self->_migrationEvents;
}

- (void)setMigrationEvents:(id)a3
{
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (NSArray)mediumDevices
{
  return self->_mediumDevices;
}

- (void)setMediumDevices:(id)a3
{
}

- (NSArray)promptingDevices
{
  return self->_promptingDevices;
}

- (void)setPromptingDevices:(id)a3
{
}

- (NSArray)immediateDevices
{
  return self->_immediateDevices;
}

- (void)setImmediateDevices:(id)a3
{
}

- (NSArray)migratingDevices
{
  return self->_migratingDevices;
}

- (void)setMigratingDevices:(id)a3
{
}

- (BOOL)isAdvertisingProximity
{
  return self->_isAdvertisingProximity;
}

- (void)setIsAdvertisingProximity:(BOOL)a3
{
  self->_isAdvertisingProximity = a3;
}

- (NSString)advertisingReasonDescription
{
  return self->_advertisingReasonDescription;
}

- (void)setAdvertisingReasonDescription:(id)a3
{
}

- (MRDPreemptiveRemoteControlConnectionManager)automaticRemoteControlConnections
{
  return self->_automaticRemoteControlConnections;
}

- (void)setAutomaticRemoteControlConnections:(id)a3
{
}

- (unsigned)hostedRouteDiscoveryMode
{
  return self->_hostedRouteDiscoveryMode;
}

- (void)setHostedRouteDiscoveryMode:(unsigned int)a3
{
  self->_hostedRouteDiscoveryMode = a3;
}

- (NSArray)hostedDiscoverySessions
{
  return self->_hostedDiscoverySessions;
}

- (void)setHostedDiscoverySessions:(id)a3
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (NSDictionary)hostedExternalDevices
{
  return self->_hostedExternalDevices;
}

- (void)setHostedExternalDevices:(id)a3
{
}

- (NSString)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (NSArray)recordingEndpointClients
{
  return self->_recordingEndpointClients;
}

- (void)setRecordingEndpointClients:(id)a3
{
}

- (NSArray)registeredVirtualAudioDevices
{
  return self->_registeredVirtualAudioDevices;
}

- (void)setRegisteredVirtualAudioDevices:(id)a3
{
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (unint64_t)usedTransactionMemory
{
  return self->_usedTransactionMemory;
}

- (void)setUsedTransactionMemory:(unint64_t)a3
{
  self->_usedTransactionMemory = a3;
}

- (unint64_t)allowedTransactionMemory
{
  return self->_allowedTransactionMemory;
}

- (void)setAllowedTransactionMemory:(unint64_t)a3
{
  self->_allowedTransactionMemory = a3;
}

- (double)transactionWaitDuration
{
  return self->_transactionWaitDuration;
}

- (void)setTransactionWaitDuration:(double)a3
{
  self->_transactionWaitDuration = a3;
}

- (NSDictionary)uiActivitiesInfo
{
  return self->_uiActivitiesInfo;
}

- (void)setUiActivitiesInfo:(id)a3
{
}

- (NSString)currentGroupSession
{
  return self->_currentGroupSession;
}

- (void)setCurrentGroupSession:(id)a3
{
}

- (NSString)groupSessionManagerAdvertiseReason
{
  return self->_groupSessionManagerAdvertiseReason;
}

- (void)setGroupSessionManagerAdvertiseReason:(id)a3
{
}

- (NSString)groupSessionAdvertiserState
{
  return self->_groupSessionAdvertiserState;
}

- (void)setGroupSessionAdvertiserState:(id)a3
{
}

- (NSArray)groupSessionAdvertiserEvents
{
  return self->_groupSessionAdvertiserEvents;
}

- (void)setGroupSessionAdvertiserEvents:(id)a3
{
}

- (BOOL)groupSessionDiscoveryEnabled
{
  return self->_groupSessionDiscoveryEnabled;
}

- (void)setGroupSessionDiscoveryEnabled:(BOOL)a3
{
  self->_groupSessionDiscoveryEnabled = a3;
}

- (NSArray)discoveredGroupSessions
{
  return self->_discoveredGroupSessions;
}

- (void)setDiscoveredGroupSessions:(id)a3
{
}

- (NSArray)notifiedGroupSessions
{
  return self->_notifiedGroupSessions;
}

- (void)setNotifiedGroupSessions:(id)a3
{
}

- (NSString)groupSessionCoordinatorState
{
  return self->_groupSessionCoordinatorState;
}

- (void)setGroupSessionCoordinatorState:(id)a3
{
}

- (NSString)groupSessionAssertionManagerState
{
  return self->_groupSessionAssertionManagerState;
}

- (void)setGroupSessionAssertionManagerState:(id)a3
{
}

- (NSString)mediaControlDiagnostic
{
  return self->_mediaControlDiagnostic;
}

- (void)setMediaControlDiagnostic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControlDiagnostic, 0);
  objc_storeStrong((id *)&self->_groupSessionAssertionManagerState, 0);
  objc_storeStrong((id *)&self->_groupSessionCoordinatorState, 0);
  objc_storeStrong((id *)&self->_notifiedGroupSessions, 0);
  objc_storeStrong((id *)&self->_discoveredGroupSessions, 0);
  objc_storeStrong((id *)&self->_groupSessionAdvertiserEvents, 0);
  objc_storeStrong((id *)&self->_groupSessionAdvertiserState, 0);
  objc_storeStrong((id *)&self->_groupSessionManagerAdvertiseReason, 0);
  objc_storeStrong((id *)&self->_currentGroupSession, 0);
  objc_storeStrong((id *)&self->_uiActivitiesInfo, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_registeredVirtualAudioDevices, 0);
  objc_storeStrong((id *)&self->_recordingEndpointClients, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_hostedExternalDevices, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_hostedDiscoverySessions, 0);
  objc_storeStrong((id *)&self->_automaticRemoteControlConnections, 0);
  objc_storeStrong((id *)&self->_advertisingReasonDescription, 0);
  objc_storeStrong((id *)&self->_migratingDevices, 0);
  objc_storeStrong((id *)&self->_immediateDevices, 0);
  objc_storeStrong((id *)&self->_promptingDevices, 0);
  objc_storeStrong((id *)&self->_mediumDevices, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_migrationEvents, 0);
  objc_storeStrong((id *)&self->_autoConnectingEndpoints, 0);
  objc_storeStrong((id *)&self->_autoConnectedEndpoints, 0);
  objc_storeStrong((id *)&self->_recentlyDismissedSystemEndpoints, 0);
  objc_storeStrong((id *)&self->_systemActiveEndpoints, 0);
  objc_storeStrong((id *)&self->_localReceiverPairingIdentity, 0);
  objc_storeStrong((id *)&self->_airplaySecuritySettings, 0);
  objc_storeStrong((id *)&self->_remoteASEState, 0);
  objc_storeStrong((id *)&self->_batchedNowPlayingState, 0);
  objc_storeStrong((id *)&self->_remoteControlService, 0);
  objc_storeStrong((id *)&self->_discoverySessions, 0);
  objc_storeStrong((id *)&self->_televisionEndpoints, 0);
  objc_storeStrong((id *)&self->_connectedExternalDevices, 0);
  objc_storeStrong((id *)&self->_queuedInitiatePlaybackMessages, 0);
  objc_storeStrong((id *)&self->_commandClientsRestriction, 0);
  objc_storeStrong((id *)&self->_remoteControlContexts, 0);
  objc_storeStrong((id *)&self->_enqueuedCommands, 0);
  objc_storeStrong((id *)&self->_originForwarders, 0);
  objc_storeStrong((id *)&self->_lockScreenPlayerPath, 0);
  objc_storeStrong((id *)&self->_electedPlayerReason, 0);
  objc_storeStrong((id *)&self->_electedPlayer, 0);
  objc_storeStrong((id *)&self->_activeOrigin, 0);
  objc_storeStrong((id *)&self->_originClients, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_frontmostClient, 0);
  objc_storeStrong((id *)&self->_systemMediaClient, 0);
  objc_storeStrong((id *)&self->_localNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_currentAppActivity, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end