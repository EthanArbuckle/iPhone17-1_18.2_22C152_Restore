@interface SPOwnerSession
- (FMQueueSynchronizer)queueSynchronizer;
- (FMTokenBucket)tokenBucket;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (NSDate)fetchLimit;
- (NSDictionary)locationCache;
- (NSMutableDictionary)batteryStatusCache;
- (NSMutableDictionary)darwinHandlers;
- (NSOperationQueue)notificationQueue;
- (NSSet)allBeacons;
- (NSSet)allBeaconsCache;
- (NSSet)clientObservedBeacons;
- (NSSet)locationSources;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)connectionExpiryDispatchTimer;
- (OS_dispatch_source)registerIntentDispatchTimer;
- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface;
- (SPOwnerSession)init;
- (SPOwnerSessionDelegatedLocation)delegationUpdate;
- (SPOwnerSessionLocationFetch)locationFetch;
- (SPOwnerSessionState)_ownerSessionState;
- (SPOwnerSessionState)ownerSessionState;
- (SPOwnerSessionXPCProtocol)proxy;
- (id)_enforceRateLimit;
- (id)beaconAddedBlock;
- (id)beaconRemovedBlock;
- (id)beaconsChangedBlock;
- (id)executeCommand:(id)a3;
- (id)executeUTPlaySoundCommand:(id)a3;
- (id)latestLocationsUpdatedBlock;
- (id)maintainedBeaconsChangedBlock;
- (id)maintainedUnknownBeaconsChangedBlock;
- (id)maintenanceConnectionUpdateBlock;
- (id)ownerSessionStateUpdatedBlock;
- (id)remoteInterface;
- (id)tagSeparationBeaconsChangedBlock;
- (void)_cacheBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4;
- (void)_invalidate;
- (void)_unregisterDarwinNotificationName:(id)a3;
- (void)_updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)_updateOwnerSessionState;
- (void)acceptUTForBeaconUUID:(id)a3;
- (void)activeCompanionWithCompletion:(id)a3;
- (void)addBeaconChangedListener:(id)a3 beaconUUID:(id)a4 taskName:(id)a5 commandIdentifier:(id)a6 commandIssueDate:(id)a7;
- (void)addSafeLocation:(id)a3 completion:(id)a4;
- (void)allBeaconsWithCompletion:(id)a3;
- (void)allObservationsForBeacon:(id)a3 completion:(id)a4;
- (void)assignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5;
- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5;
- (void)beaconForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconForUUID:(id)a3 completion:(id)a4;
- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4;
- (void)beaconStoreStatusWithCompletion:(id)a3;
- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4;
- (void)beaconsToMaintainPersistentConnection:(id)a3;
- (void)beaconsToMonitorForSeparation:(id)a3;
- (void)clientConfigurationWithCompletion:(id)a3;
- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5;
- (void)connectionExpiryTimerFired;
- (void)dealloc;
- (void)delegatedLocationForContext:(id)a3 completion:(id)a4;
- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)disableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4;
- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4;
- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4;
- (void)enableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4;
- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)executeCommand:(id)a3 completion:(id)a4;
- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4;
- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4;
- (void)fetchSeparationMonitoringStatus:(id)a3;
- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4;
- (void)finishBeaconFuture:(id)a3 beaconUUID:(id)a4;
- (void)finishBeaconGroupFuture:(id)a3 command:(id)a4 commandIssueDate:(id)a5;
- (void)forceDistributeKeysWithCompletion:(id)a3;
- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6;
- (void)forceLOIBasedSafeLocationRefresh:(id)a3;
- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5;
- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4;
- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4;
- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6;
- (void)ignoreBeaconByAdvertisement:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4;
- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)invalidateRegisterIntentDispatchTimer;
- (void)isUTAppAlertDisabled:(id)a3;
- (void)locationForContext:(id)a3 completion:(id)a4;
- (void)locationsForBeacons:(id)a3 completion:(id)a4;
- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4;
- (void)playUnauthorizedSoundOnBeaconByUUID:(id)a3 completion:(id)a4;
- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6;
- (void)publishWildModeRecordsWithCompletion:(id)a3;
- (void)rawSearchResultsForBeacon:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)readAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)readRawAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)registerDarwinNotificationName:(id)a3 block:(id)a4;
- (void)registerIntentTimerFired;
- (void)removeBeacon:(id)a3 completion:(id)a4;
- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4;
- (void)removeSafeLocation:(id)a3 completion:(id)a4;
- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4;
- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4;
- (void)safeLocationsForSeparationMonitoring:(id)a3;
- (void)sendRegisterIntentWithCompletion:(id)a3;
- (void)sendUnregisterIntentWithCompletion:(id)a3;
- (void)setAllBeaconsCache:(id)a3;
- (void)setBatteryStatusCache:(id)a3;
- (void)setBeaconAddedBlock:(id)a3;
- (void)setBeaconRemovedBlock:(id)a3;
- (void)setBeaconsChangedBlock:(id)a3;
- (void)setClientObservedBeacons:(id)a3;
- (void)setConnectionExpiryDispatchTimer:(id)a3;
- (void)setConnectionExpiryDispatchTimerWithInterval:(double)a3;
- (void)setDarwinHandlers:(id)a3;
- (void)setDelegatedLocationUpdateBlock:(id)a3;
- (void)setDelegationUpdate:(id)a3;
- (void)setDeviceEventUpdateBlock:(id)a3;
- (void)setFetchLimit:(id)a3;
- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5;
- (void)setInvalidationBlock:(id)a3;
- (void)setLatestLocationsUpdatedBlock:(id)a3;
- (void)setLocationCache:(id)a3;
- (void)setLocationFetch:(id)a3;
- (void)setLocationSources:(id)a3;
- (void)setLocationUpdateBlock:(id)a3;
- (void)setMaintainedBeaconsChangedBlock:(id)a3;
- (void)setMaintainedUnknownBeaconsChangedBlock:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setOwnerSessionStateUpdatedBlock:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueSynchronizer:(id)a3;
- (void)setRegisterIntentDispatchTimer:(id)a3;
- (void)setRegisterIntentDispatchTimerWithInterval:(double)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSimpleBeaconUpdateInterface:(id)a3;
- (void)setTagSeparationBeaconsChangedBlock:(id)a3;
- (void)setTokenBucket:(id)a3;
- (void)setUserAgentProxy:(id)a3;
- (void)set_ownerSessionState:(id)a3;
- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6;
- (void)standaloneBeaconsForUUIDs:(id)a3 completion:(id)a4;
- (void)startRefreshing;
- (void)startRefreshingBeacons:(id)a3;
- (void)startRefreshingBeaconsForSeparationMonitoringWithBlock:(id)a3;
- (void)startRefreshingPersistentConnectionWithBlock:(id)a3;
- (void)startRefreshingSafeLocationWithBlock:(id)a3;
- (void)startRefreshingSeparationMonitoringState:(id)a3;
- (void)startRefreshingTagSeparationWithBlock:(id)a3;
- (void)startUpdatingApplicationBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5;
- (void)startUpdatingMaintenanceConnection;
- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3;
- (void)stopRefreshing;
- (void)stopRefreshingBeaconsForSeparationMonitoringWithBlock;
- (void)stopRefreshingPersistentConnection;
- (void)stopRefreshingSafeLocations;
- (void)stopRefreshingSeparationMonitoringState;
- (void)stopUpdatingApplicationBeaconsWithCompletion:(id)a3;
- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4;
- (void)subscribeDelegatedLocationUpdatesForContext:(id)a3 completion:(id)a4;
- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6;
- (void)unacceptedBeaconsWithCompletion:(id)a3;
- (void)unassignSafeLocation:(id)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)unassignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5;
- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4;
- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4;
- (void)unregisterDarwinNotificationName:(id)a3;
- (void)unsubscribeDelegatedLocationUpdatesWithCompletion:(id)a3;
- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3;
- (void)updateAllBeacons;
- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)updateBeaconObservations:(id)a3 completion:(id)a4;
- (void)updateConnectionExpiryDispatchTimerWithBeacons:(id)a3;
- (void)updateSafeLocation:(id)a3 completion:(id)a4;
- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3;
@end

@implementation SPOwnerSession

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Dealloc %@", buf, 0xCu);
  }

  [(SPOwnerSession *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SPOwnerSession;
  [(SPOwnerSession *)&v4 dealloc];
}

- (void)_invalidate
{
  v3 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];

  if (v3)
  {
    objc_super v4 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];
    dispatch_source_cancel(v4);
  }
  [(SPOwnerSession *)self setConnectionExpiryDispatchTimer:0];
  v5 = objc_opt_new();
  [(SPOwnerSession *)self setClientObservedBeacons:v5];

  v6 = [(SPOwnerSession *)self session];
  [v6 invalidate];

  [(SPOwnerSession *)self setSession:0];
  [(SPOwnerSession *)self _unregisterDarwinNotificationName:@"SPBeaconsChangedNotification"];
  [(SPOwnerSession *)self _unregisterDarwinNotificationName:@"com.apple.locationd.authorization"];
  [(SPOwnerSession *)self _unregisterDarwinNotificationName:@"com.apple.locationd/Prefs"];

  [(SPOwnerSession *)self _unregisterDarwinNotificationName:@"com.apple.icloud.searchparty.ServiceSettingsChanged"];
}

- (void)_unregisterDarwinNotificationName:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self darwinHandlers];
  [v5 removeObjectForKey:v4];
}

- (NSMutableDictionary)darwinHandlers
{
  return self->_darwinHandlers;
}

- (void)setSession:(id)a3
{
}

- (void)setConnectionExpiryDispatchTimer:(id)a3
{
}

- (void)setClientObservedBeacons:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (OS_dispatch_source)connectionExpiryDispatchTimer
{
  return self->_connectionExpiryDispatchTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationUpdate, 0);
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, 0);
  objc_storeStrong((id *)&self->_locationFetch, 0);
  objc_storeStrong((id *)&self->_darwinHandlers, 0);
  objc_storeStrong((id *)&self->__ownerSessionState, 0);
  objc_storeStrong((id *)&self->_tokenBucket, 0);
  objc_storeStrong((id *)&self->_registerIntentDispatchTimer, 0);
  objc_storeStrong((id *)&self->_batteryStatusCache, 0);
  objc_storeStrong((id *)&self->_fetchLimit, 0);
  objc_storeStrong((id *)&self->_connectionExpiryDispatchTimer, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong(&self->_tagSeparationBeaconsChangedBlock, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientObservedBeacons, 0);
  objc_storeStrong((id *)&self->_allBeaconsCache, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong(&self->maintainedUnknownBeaconsChangedBlock, 0);
  objc_storeStrong(&self->maintainedBeaconsChangedBlock, 0);
  objc_storeStrong((id *)&self->_locationSources, 0);
  objc_storeStrong(&self->ownerSessionStateUpdatedBlock, 0);
  objc_storeStrong(&self->latestLocationsUpdatedBlock, 0);
  objc_storeStrong(&self->beaconsChangedBlock, 0);
  objc_storeStrong(&self->beaconRemovedBlock, 0);

  objc_storeStrong(&self->beaconAddedBlock, 0);
}

- (void)beaconsToMonitorForSeparation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SPOwnerSession_SeparationMonitoring__beaconsToMonitorForSeparation___block_invoke;
  block[3] = &unk_1E601B828;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__beaconsToMonitorForSeparation___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 beaconsToMonitorForSeparation:*(void *)(a1 + 40)];
}

- (void)startRefreshingBeaconsForSeparationMonitoringWithBlock:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke;
  aBlock[3] = &unk_1E601C070;
  id v5 = v4;
  id v12 = v5;
  id v6 = _Block_copy(aBlock);
  [(SPOwnerSession *)self beaconsToMonitorForSeparation:v6];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_3;
  v8[3] = &unk_1E601B828;
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.icloud.searchparty.separation_monitoring.beacons_changed" block:v8];

  objc_destroyWeak(&location);
}

void __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_2;
  v6[3] = &unk_1E601B828;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

uint64_t __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) beaconsToMonitorForSeparation:*(void *)(a1 + 40)];
}

- (void)stopRefreshingBeaconsForSeparationMonitoringWithBlock
{
}

- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SPOwnerSession_SeparationMonitoring__enableSeparationMonitoringForBeacons_completion___block_invoke;
  v11[3] = &unk_1E601B878;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __88__SPOwnerSession_SeparationMonitoring__enableSeparationMonitoringForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 enableSeparationMonitoringForBeacons:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__SPOwnerSession_SeparationMonitoring__disableSeparationMonitoringForBeacons_completion___block_invoke;
  v11[3] = &unk_1E601B878;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __89__SPOwnerSession_SeparationMonitoring__disableSeparationMonitoringForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 disableSeparationMonitoringForBeacons:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)enableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[SPOwnerSession enableSeparationMonitoringForBeacons:completion:](self, "enableSeparationMonitoringForBeacons:completion:", v9, v7, v10, v11);
}

- (void)disableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[SPOwnerSession disableSeparationMonitoringForBeacons:completion:](self, "disableSeparationMonitoringForBeacons:completion:", v9, v7, v10, v11);
}

- (void)safeLocationsForSeparationMonitoring:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke;
  block[3] = &unk_1E601B828;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke_2;
  v4[3] = &unk_1E601C098;
  id v5 = *(id *)(a1 + 40);
  [v3 safeLocationsWithCompletion:v4];
}

uint64_t __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRefreshingSafeLocationWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(SPOwnerSession *)self safeLocationsForSeparationMonitoring:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.icloud.searchparty.separation_monitoring.safelocations_changed" block:v6];

  objc_destroyWeak(&location);
}

void __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_2;
  v3[3] = &unk_1E601C070;
  v1 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v2 = v1;
  [v2 safeLocationsForSeparationMonitoring:v3];
}

void __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_3;
  v7[3] = &unk_1E601C0C0;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)stopRefreshingSafeLocations
{
}

- (void)addSafeLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__SPOwnerSession_SeparationMonitoring__addSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E601B878;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __67__SPOwnerSession_SeparationMonitoring__addSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 addSafeLocation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeSafeLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SPOwnerSession_SeparationMonitoring__removeSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E601B878;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__removeSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 removeSafeLocation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)updateSafeLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SPOwnerSession_SeparationMonitoring__updateSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E601B878;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__updateSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 updateSafeLocation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v13 count:1];

  -[SPOwnerSession assignSafeLocation:beaconUUIDs:completion:](self, "assignSafeLocation:beaconUUIDs:completion:", v11, v12, v9, v13, v14);
}

- (void)unassignSafeLocation:(id)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v13 count:1];

  -[SPOwnerSession unassignSafeLocation:beaconUUIDs:completion:](self, "unassignSafeLocation:beaconUUIDs:completion:", v11, v12, v9, v13, v14);
}

- (void)assignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SPOwnerSession_SeparationMonitoring__assignSafeLocation_beaconUUIDs_completion___block_invoke;
  block[3] = &unk_1E601BBB0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&location);
}

void __82__SPOwnerSession_SeparationMonitoring__assignSafeLocation_beaconUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 assignSafeLocation:*(void *)(a1 + 40) to:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)unassignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SPOwnerSession_SeparationMonitoring__unassignSafeLocation_beaconUUIDs_completion___block_invoke;
  block[3] = &unk_1E601BBB0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&location);
}

void __84__SPOwnerSession_SeparationMonitoring__unassignSafeLocation_beaconUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 unassignSafeLocation:*(void *)(a1 + 40) from:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(SPOwnerSession *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__SPOwnerSession_SeparationMonitoring__publishSeparationEventForBeacons_eventType_region_completion___block_invoke;
  v17[3] = &unk_1E601C0E8;
  v17[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&location);
}

void __101__SPOwnerSession_SeparationMonitoring__publishSeparationEventForBeacons_eventType_region_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 publishSeparationEventForBeacons:*(void *)(a1 + 40) eventType:*(void *)(a1 + 64) region:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)activeCompanionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SPOwnerSession_SeparationMonitoring__activeCompanionWithCompletion___block_invoke;
  block[3] = &unk_1E601B828;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__activeCompanionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 activeCompanionWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchSeparationMonitoringStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SPOwnerSession_SeparationMonitoring__fetchSeparationMonitoringStatus___block_invoke;
  block[3] = &unk_1E601B828;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __72__SPOwnerSession_SeparationMonitoring__fetchSeparationMonitoringStatus___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 userAgentProxy];
  [v3 fetchSeparationMonitoringStatus:*(void *)(a1 + 40)];
}

- (void)startRefreshingSeparationMonitoringState:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(SPOwnerSession *)self fetchSeparationMonitoringStatus:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__SPOwnerSession_SeparationMonitoring__startRefreshingSeparationMonitoringState___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.icloud.searchparty.separation_monitoring.state_changed" block:v6];

  objc_destroyWeak(&location);
}

uint64_t __81__SPOwnerSession_SeparationMonitoring__startRefreshingSeparationMonitoringState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchSeparationMonitoringStatus:*(void *)(a1 + 40)];
}

- (void)stopRefreshingSeparationMonitoringState
{
}

- (void)forceLOIBasedSafeLocationRefresh:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = self;
  id v6 = [(SPOwnerSession *)v5 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_SeparationMonitoring__forceLOIBasedSafeLocationRefresh___block_invoke;
  block[3] = &unk_1E601B828;
  block[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&location);
}

void __73__SPOwnerSession_SeparationMonitoring__forceLOIBasedSafeLocationRefresh___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 forceLOIBasedSafeLocationRefresh:*(void *)(a1 + 40)];
}

- (id)maintenanceConnectionUpdateBlock
{
  id v3 = [(SPOwnerSession *)self queue];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke;
  aBlock[3] = &unk_1E601BD10;
  id v9 = v3;
  id v4 = v3;
  objc_copyWeak(&v10, &location);
  id v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke(uint64_t a1)
{
  id v2 = LogCategory_MaintenanceConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Updating maintenance connection.", buf, 2u);
  }

  id v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_1;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_1(uint64_t a1)
{
  id v2 = dispatch_group_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_group_enter(v2);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  id v19 = 0;
  id v4 = [WeakRetained userAgentProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2;
  v15[3] = &unk_1E601C210;
  id v17 = v18;
  id v5 = v2;
  id v16 = v5;
  [v4 beaconsToMaintainWithCompletion:v15];

  dispatch_group_enter(v5);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__3;
  v13[4] = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v6 = [WeakRetained userAgentProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2;
  v10[3] = &unk_1E601C238;
  id v12 = v13;
  id v7 = v5;
  id v11 = v7;
  [v6 unknownBeaconsForUUIDs:MEMORY[0x1E4F1CBF0] completion:v10];

  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_3;
  block[3] = &unk_1E601C260;
  void block[4] = WeakRetained;
  void block[5] = v18;
  block[6] = v13;
  dispatch_group_notify(v7, v8, block);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v18, 8);
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

{
  id v4;
  uint64_t vars8;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maintainedBeaconsChangedBlock];
  v2[2](v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  id v4 = [*(id *)(a1 + 32) maintainedUnknownBeaconsChangedBlock];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v4[2](v4, v3);
}

- (void)startUpdatingMaintenanceConnection
{
  id v3 = [(SPOwnerSession *)self maintenanceConnectionUpdateBlock];
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.nanoregistry.watchdidbecomeactive" block:v3];
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.mobile.keybagd.first_unlock" block:v3];
  [(SPOwnerSession *)self registerDarwinNotificationName:@"SPMaintenancePolicyChangedNotification" block:v3];
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__SPOwnerSession_MaintenanceConnection__startUpdatingMaintenanceConnection__block_invoke;
  activity_block[3] = &unk_1E601C288;
  id v6 = v3;
  id v4 = v3;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling initial maintenanceConnectionUpdateBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __75__SPOwnerSession_MaintenanceConnection__startUpdatingMaintenanceConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRefreshingPersistentConnectionWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(SPOwnerSession *)self registerDarwinNotificationName:@"com.apple.icloud.searchparty.PersistentConnectionChanged" block:v6];

  objc_destroyWeak(&location);
}

void __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_2;
  v3[3] = &unk_1E601C070;
  v1 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v2 = v1;
  [v2 beaconsToMaintainPersistentConnection:v3];
}

void __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_3;
  v7[3] = &unk_1E601C0C0;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)beaconsToMaintainPersistentConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SPOwnerSession_PersistentConnection__beaconsToMaintainPersistentConnection___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__SPOwnerSession_PersistentConnection__beaconsToMaintainPersistentConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxy];
  [v2 beaconsToMaintainPersistentConnection:*(void *)(a1 + 32)];
}

- (void)stopRefreshingPersistentConnection
{
}

- (SPOwnerSession)init
{
  v32.receiver = self;
  v32.super_class = (Class)SPOwnerSession;
  id v2 = [(SPOwnerSession *)&v32 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPOwnerSession", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
    id v6 = v4;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F61558]) initWithQueue:v2->_queue];
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v7;

    id v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v9;

    uint64_t v11 = objc_opt_new();
    clientObservedBeacons = v2->_clientObservedBeacons;
    v2->_clientObservedBeacons = (NSSet *)v11;

    uint64_t v13 = objc_opt_new();
    locationSources = v2->_locationSources;
    v2->_locationSources = (NSSet *)v13;

    uint64_t v15 = objc_opt_new();
    darwinHandlers = v2->_darwinHandlers;
    v2->_darwinHandlers = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    locationFetch = v2->_locationFetch;
    v2->_locationFetch = (SPOwnerSessionLocationFetch *)v17;

    uint64_t v19 = objc_opt_new();
    delegationUpdate = v2->_delegationUpdate;
    v2->_delegationUpdate = (SPOwnerSessionDelegatedLocation *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F61570]) initWithFillRate:10.0 capacity:50.0];
    tokenBucket = v2->_tokenBucket;
    v2->_tokenBucket = (FMTokenBucket *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4F61588]);
    v24 = [(SPOwnerSession *)v2 remoteInterface];
    uint64_t v25 = [v23 initWithMachServiceName:@"com.apple.icloud.searchpartyd.ownersession" options:0 remoteObjectInterface:v24 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v25;

    v27 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    locationCache = v2->_locationCache;
    v2->_locationCache = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    batteryStatusCache = v2->_batteryStatusCache;
    v2->_batteryStatusCache = v29;
  }
  return v2;
}

- (SPOwnerSessionXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(SPOwnerSession *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    id v6 = [(SPOwnerSession *)self serviceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPOwnerSession *)self setSession:v7];

    id v8 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(SPOwnerSession *)self serviceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = [(SPOwnerSession *)self session];
    [v11 resume];
  }
  id v12 = [(SPOwnerSession *)self session];
  uint64_t v13 = [v12 proxy];

  return (SPOwnerSessionXPCProtocol *)v13;
}

- (id)remoteInterface
{
  v83[4] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44290];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v83[0] = objc_opt_class();
  v83[1] = objc_opt_class();
  v83[2] = objc_opt_class();
  v83[3] = objc_opt_class();
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:4];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_latestLocationsForIdentifiers_fetchLimit_sources_completion_ argumentIndex:0 ofReply:1];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  id v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_rawSearchResultsForIdentifier_dateInterval_completion_ argumentIndex:0 ofReply:1];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_allBeaconsWithCompletion_ argumentIndex:0 ofReply:1];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  id v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_unacceptedBeaconsWithCompletion_ argumentIndex:0 ofReply:1];

  int v15 = (void *)MEMORY[0x1E4F1CAD0];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  uint64_t v17 = [v15 setWithArray:v16];
  [v2 setClasses:v17 forSelector:sel_beaconGroupsForUUIDs_completion_ argumentIndex:0 ofReply:1];

  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  id v20 = [v18 setWithArray:v19];
  [v2 setClasses:v20 forSelector:sel_standaloneBeaconsForUUIDs_completion_ argumentIndex:0 ofReply:1];

  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  v77[0] = objc_opt_class();
  v77[1] = objc_opt_class();
  v77[2] = objc_opt_class();
  v77[3] = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
  id v23 = [v21 setWithArray:v22];
  [v2 setClasses:v23 forSelector:sel_didObserveUnauthorizedTrackingWithCompletion_completion_ argumentIndex:0 ofReply:0];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v76[0] = objc_opt_class();
  v76[1] = objc_opt_class();
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v26 = [v24 setWithArray:v25];
  [v2 setClasses:v26 forSelector:sel_didObserveUnauthorizedTrackingWithCompletion_completion_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  v75[0] = objc_opt_class();
  v75[1] = objc_opt_class();
  v75[2] = objc_opt_class();
  v75[3] = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
  v29 = [v27 setWithArray:v28];
  [v2 setClasses:v29 forSelector:sel_didDetectUnauthorizedTrackingWithCompletion_completion_ argumentIndex:0 ofReply:0];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  v74[0] = objc_opt_class();
  v74[1] = objc_opt_class();
  v74[2] = objc_opt_class();
  v74[3] = objc_opt_class();
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
  objc_super v32 = [v30 setWithArray:v31];
  [v2 setClasses:v32 forSelector:sel_didUpdateUnauthorizedTrackingWithCompletion_completion_ argumentIndex:0 ofReply:0];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  v73[2] = objc_opt_class();
  v73[3] = objc_opt_class();
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  v35 = [v33 setWithArray:v34];
  [v2 setClasses:v35 forSelector:sel_didWithdrawUnauthorizedTrackingWithCompletion_completion_ argumentIndex:0 ofReply:0];

  v36 = (void *)MEMORY[0x1E4F1CAD0];
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  v38 = [v36 setWithArray:v37];
  [v2 setClasses:v38 forSelector:sel_beaconsToMaintainWithCompletion_ argumentIndex:0 ofReply:1];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  v41 = [v39 setWithArray:v40];
  [v2 setClasses:v41 forSelector:sel_unknownBeaconsForUUIDs_completion_ argumentIndex:0 ofReply:1];

  v42 = (void *)MEMORY[0x1E4F1CAD0];
  v70[0] = objc_opt_class();
  v70[1] = objc_opt_class();
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  v44 = [v42 setWithArray:v43];
  [v2 setClasses:v44 forSelector:sel_beaconsToMaintainPersistentConnection_ argumentIndex:0 ofReply:1];

  v45 = (void *)MEMORY[0x1E4F1CAD0];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  v47 = [v45 setWithArray:v46];
  [v2 setClasses:v47 forSelector:sel_safeLocationsWithCompletion_ argumentIndex:0 ofReply:1];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v50 = [v48 setWithArray:v49];
  [v2 setClasses:v50 forSelector:sel_beaconsToMonitorForSeparation_ argumentIndex:0 ofReply:1];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v67 = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v53 = [v51 setWithArray:v52];
  [v2 setClasses:v53 forSelector:sel_publishSeparationEventForBeacons_eventType_region_completion_ argumentIndex:0 ofReply:1];

  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v56 = [v54 setWithArray:v55];
  [v2 setClasses:v56 forSelector:sel_activeCompanionWithCompletion_ argumentIndex:0 ofReply:1];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  v65[0] = objc_opt_class();
  v65[1] = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  v59 = [v57 setWithArray:v58];
  [v2 setClasses:v59 forSelector:sel_allObservationsForBeacon_completion_ argumentIndex:0 ofReply:1];

  v60 = (void *)MEMORY[0x1E4F1CAD0];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v62 = objc_msgSend(v60, "setWithArray:", v61, v64[0]);
  [v2 setClasses:v62 forSelector:sel_addSafeLocation_completion_ argumentIndex:1 ofReply:1];

  return v2;
}

- (void)locationsForBeacons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke;
  block[3] = &unk_1E601C668;
  id v12 = v6;
  id v9 = v6;
  objc_copyWeak(&v15, &location);
  uint64_t v13 = self;
  id v14 = v7;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "fm_map:", &__block_literal_global_11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained userAgentProxy];
  id v6 = [*(id *)(a1 + 40) fetchLimit];
  id v7 = [*(id *)(a1 + 40) locationSources];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_3;
  v10[3] = &unk_1E601C640;
  id v8 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v2;
  id v12 = v8;
  id v9 = v2;
  [v5 latestLocationsForIdentifiers:v3 fetchLimit:v6 sources:v7 completion:v10];
}

uint64_t __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_4;
  v7[3] = &unk_1E601BBB0;
  id v5 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_sync(v4, v7);
}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setFetchLimit:*(void *)(a1 + 40)];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) fetchLimit];
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: fetchLimit set to %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setLocationCache:*(void *)(a1 + 48)];
  dispatch_queue_t v4 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 48);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: updated location cache: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = [*(id *)(a1 + 32) locationCache];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (id)_enforceRateLimit
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  id v3 = [(SPOwnerSession *)self queueSynchronizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SPOwnerSession__enforceRateLimit__block_invoke;
  v6[3] = &unk_1E601C1E0;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 conditionalSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__SPOwnerSession__enforceRateLimit__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tokenBucket];
  char v3 = [v2 operationAllowed];

  if ((v3 & 1) == 0)
  {
    v13[0] = @"delay";
    id v4 = NSNumber;
    id v5 = [*(id *)(a1 + 32) tokenBucket];
    [v5 timeIntervalUntilOperationAllowed];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
    v13[1] = @"stats";
    v14[0] = v6;
    uint64_t v7 = [*(id *)(a1 + 32) tokenBucket];
    int v8 = [v7 dumpStatistics];
    v14[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:20 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPOwnerSession *)self locationFetch];
  [v8 locationForContext:v7 completion:v6];
}

- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPOwnerSession *)self locationFetch];
  [v8 subscribeAndFetchLocationForContext:v7 completion:v6];
}

- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self locationFetch];
  [v5 unsubscribeLocationUpdatesWithCompletion:v4];
}

- (void)setLocationUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self locationFetch];
  [v5 setLocationUpdateBlock:v4];
}

- (void)setDeviceEventUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self locationFetch];
  [v5 setDeviceEventUpdateBlock:v4];
}

- (void)setInvalidationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self locationFetch];
  [v5 setInvalidationBlock:v4];
}

- (void)delegatedLocationForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPOwnerSession *)self delegationUpdate];
  [v8 delegatedLocationForContext:v7 completion:v6];
}

- (void)setDelegatedLocationUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self delegationUpdate];
  [v5 setDelegatedLocationUpdateBlock:v4];
}

- (void)subscribeDelegatedLocationUpdatesForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPOwnerSession *)self delegationUpdate];
  [v8 subscribeDelegatedLocationUpdatesForContext:v7 completion:v6];
}

- (void)unsubscribeDelegatedLocationUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self delegationUpdate];
  [v5 unsubscribeDelegatedLocationUpdatesWithCompletion:v4];
}

- (void)setConnectionExpiryDispatchTimerWithInterval:(double)a3
{
  id v5 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];

  if (v6)
  {
    id v7 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];
    dispatch_source_cancel(v7);

    [(SPOwnerSession *)self setConnectionExpiryDispatchTimer:0];
  }
  if ((a3 < 0.0 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(void *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    uint64_t v12 = -1;
    dispatch_time_t v11 = -1;
  }
  else
  {
    double v10 = a3 * 1000000000.0;
    dispatch_time_t v11 = dispatch_walltime(0, (uint64_t)v10);
    uint64_t v12 = (unint64_t)((double)(uint64_t)v10 * 0.02);
  }
  uint64_t v13 = [(SPOwnerSession *)self queue];
  dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v13);
  [(SPOwnerSession *)self setConnectionExpiryDispatchTimer:v14];

  id v15 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];
  dispatch_source_set_timer(v15, v11, 0xFFFFFFFFFFFFFFFFLL, v12);

  objc_initWeak(&location, self);
  id v16 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __63__SPOwnerSession_setConnectionExpiryDispatchTimerWithInterval___block_invoke;
  uint64_t v21 = &unk_1E601BA30;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v16, &v18);

  uint64_t v17 = [(SPOwnerSession *)self connectionExpiryDispatchTimer];
  dispatch_resume(v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __63__SPOwnerSession_setConnectionExpiryDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession connection expiry dispatch timer fired", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionExpiryTimerFired];
}

- (void)connectionExpiryTimerFired
{
  char v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManager connectionExpiryTimerFired", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SPOwnerSession_connectionExpiryTimerFired__block_invoke;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __44__SPOwnerSession_connectionExpiryTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAllBeacons];
}

- (void)updateConnectionExpiryDispatchTimerWithBeacons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPBeaconManager considering update for connection expiry timer", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v13 = buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SPOwnerSession_updateConnectionExpiryDispatchTimerWithBeacons___block_invoke;
  v11[3] = &unk_1E601C690;
  v11[4] = buf;
  [v4 enumerateObjectsUsingBlock:v11];
  if (*((void *)v13 + 5))
  {
    id v7 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)v13 + 5);
      *(_DWORD *)uint64_t v18 = 138412290;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPBeaconManager updating connection expiry timer with fire date %@", v18, 0xCu);
    }

    [*((id *)v13 + 5) timeIntervalSinceNow];
    if (v9 < 1.0) {
      double v9 = 1.0;
    }
    [(SPOwnerSession *)self setConnectionExpiryDispatchTimerWithInterval:v9];
  }
  else
  {
    double v10 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPBeaconManager not updating connection expiry timer, there are no expiring beacons.", v18, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

void __65__SPOwnerSession_updateConnectionExpiryDispatchTimerWithBeacons___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  char v3 = [v9 connectedStateExpiryDate];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v4 + 40);
    id v5 = (id *)(v4 + 40);
    id v6 = v7;
    if (v7)
    {
      [v6 timeIntervalSinceDate:v3];
      if (v8 <= 0.0) {
        goto LABEL_6;
      }
      id v5 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    objc_storeStrong(v5, v3);
  }
LABEL_6:
}

- (void)rawSearchResultsForBeacon:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  dispatch_time_t v11 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SPOwnerSession_rawSearchResultsForBeacon_dateInterval_completion___block_invoke;
  block[3] = &unk_1E601C6B8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __68__SPOwnerSession_rawSearchResultsForBeacon_dateInterval_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  char v3 = [*(id *)(a1 + 32) identifier];
  [v2 rawSearchResultsForIdentifier:v3 dateInterval:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __43__SPOwnerSession_beaconForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601BC00;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: beaconForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SPOwnerSession beaconForUUID:completion:]_block_invoke";
      _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1[5]);
    char v3 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SPOwnerSession_beaconForUUID_completion___block_invoke_262;
    block[3] = &unk_1E601B850;
    objc_copyWeak(&v8, (id *)buf);
    id v6 = a1[4];
    id v7 = a1[6];
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v4 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __43__SPOwnerSession_beaconForUUID_completion___block_invoke_cold_1();
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke_262(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)forceDistributeKeysWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_forceDistributeKeysWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__SPOwnerSession_forceDistributeKeysWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 forceDistributeKeysWithCompletion:*(void *)(a1 + 32)];
}

- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_forceUpdateKeyMapsForUUID_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SPOwnerSession_forceUpdateKeyMapsForUUID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 forceUpdateKeyMapsForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SPOwnerSession_forceUpdateKeyAlignmentRecordForUUID_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__SPOwnerSession_forceUpdateKeyAlignmentRecordForUUID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 forceUpdateKeyAlignmentRecordForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E601C6E0;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  objc_copyWeak(&v14, &location);
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling beaconForIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  char v3 = LogCategory_OwnerSession();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[SPOwnerSession beaconForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    id v5 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_263;
    block[3] = &unk_1E601B850;
    objc_copyWeak(&v11, a1 + 7);
    id v9 = a1[4];
    id v10 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_cold_1();
    }

    id v6 = (void (**)(id, void, void *))a1[6];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:2 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_263(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconForIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E601C6E0;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  objc_copyWeak(&v14, &location);
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling beaconGroupForIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  char v3 = LogCategory_OwnerSession();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[SPOwnerSession beaconGroupForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    id v5 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_264;
    block[3] = &unk_1E601B850;
    objc_copyWeak(&v11, a1 + 7);
    id v9 = a1[4];
    id v10 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_cold_1();
    }

    id v6 = (void (**)(id, void, void *))a1[6];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:17 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_264(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconGroupForIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SPOwnerSession_beaconGroupsForUUIDs_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __50__SPOwnerSession_beaconGroupsForUUIDs_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconGroupsForUUIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)standaloneBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_standaloneBeaconsForUUIDs_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SPOwnerSession_standaloneBeaconsForUUIDs_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 standaloneBeaconsForUUIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SPOwnerSession_beaconingIdentifierForMACAddress_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SPOwnerSession_beaconingIdentifierForMACAddress_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconingIdentifierForMACAddress:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)clientConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_clientConfigurationWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__SPOwnerSession_clientConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 clientConfigurationWithCompletion:*(void *)(a1 + 32)];
}

- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: fetchFindMyNetworkStatusForMACAddress: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SPOwnerSession_fetchFindMyNetworkStatusForMACAddress_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __67__SPOwnerSession_fetchFindMyNetworkStatusForMACAddress_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 fetchFindMyNetworkStatusForMACAddress:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: setFindMyNetworkStatus: %d for MACAddress: %@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  id v11 = [(SPOwnerSession *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__SPOwnerSession_setFindMyNetworkStatusForMACAddress_status_completion___block_invoke;
  void v14[3] = &unk_1E601C360;
  objc_copyWeak(&v17, &buf);
  BOOL v18 = v6;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);
}

void __72__SPOwnerSession_setFindMyNetworkStatusForMACAddress_status_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setFindMyNetworkStatusForMACAddress:*(void *)(a1 + 32) status:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SPOwnerSession_connectUsingMACAddress_longTermKey_completion___block_invoke;
  block[3] = &unk_1E601C6B8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__SPOwnerSession_connectUsingMACAddress_longTermKey_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 connectUsingMACAddress:*(void *)(a1 + 32) longTermKey:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SPOwnerSession_disconnectFromMACAddress_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SPOwnerSession_disconnectFromMACAddress_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 disconnectFromMACAddress:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(SPOwnerSession *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__SPOwnerSession_simulateAccessoryPairing_name_isAirPods_completion___block_invoke;
  v17[3] = &unk_1E601C708;
  objc_copyWeak(&v21, &location);
  id v18 = v10;
  id v19 = v11;
  BOOL v22 = a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __69__SPOwnerSession_simulateAccessoryPairing_name_isAirPods_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 simulateAccessoryPairing:*(void *)(a1 + 32) name:*(void *)(a1 + 40) isAirPods:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(SPOwnerSession *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__SPOwnerSession_forceKeySyncForBeaconUUID_lastObservationDate_lastObservationIndex_completion___block_invoke;
  v17[3] = &unk_1E601C730;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __96__SPOwnerSession_forceKeySyncForBeaconUUID_lastObservationDate_lastObservationIndex_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 forceKeySyncForBeaconUUID:*(void *)(a1 + 32) lastObservationDate:*(void *)(a1 + 40) lastObservationIndex:*(void *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SPOwnerSession_fakeClassicPairingWithMACAddress_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SPOwnerSession_fakeClassicPairingWithMACAddress_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 fakeClassicPairingWithMACAddress:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SPOwnerSession_forceRePairingWithUUID_partIds_completion___block_invoke;
  block[3] = &unk_1E601C6B8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __60__SPOwnerSession_forceRePairingWithUUID_partIds_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 forceRePairingWithUUID:*(void *)(a1 + 32) partIds:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)executeCommand:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeCommand: %@", buf, 0xCu);
  }

  [(SPOwnerSession *)self startRefreshing];
  id v6 = objc_alloc_init(MEMORY[0x1E4F61548]);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __33__SPOwnerSession_executeCommand___block_invoke;
  id v17 = &unk_1E601C758;
  id v18 = v4;
  id v8 = v6;
  id v19 = v8;
  id v20 = self;
  id v21 = v7;
  id v9 = v7;
  id v10 = v4;
  id v11 = _Block_copy(&v14);
  -[SPOwnerSession executeCommand:completion:](self, "executeCommand:completion:", v10, v11, v14, v15, v16, v17);
  id v12 = v8;

  return v12;
}

void __33__SPOwnerSession_executeCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)id buf = 138412290;
    uint64_t v25 = v5;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: commandCompletion: %@", buf, 0xCu);
  }

  if (v3)
  {
    id v6 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      id v8 = [v7 UUIDString];
      *(_DWORD *)id buf = 138412546;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      id v27 = v3;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with error %@", buf, 0x16u);
    }
    id v9 = dispatch_get_global_queue(0, 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    id v21[2] = __33__SPOwnerSession_executeCommand___block_invoke_266;
    v21[3] = &unk_1E601B920;
    id v22 = *(id *)(a1 + 40);
    id v23 = v3;
    dispatch_async(v9, v21);
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) taskName];

    id v11 = LogCategory_OwnerSession();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = [*(id *)(a1 + 32) identifier];
        uint64_t v14 = [v13 UUIDString];
        uint64_t v15 = [*(id *)(a1 + 32) taskName];
        *(_DWORD *)id buf = 138412546;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with task: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 48) finishBeaconGroupFuture:*(void *)(a1 + 40) command:*(void *)(a1 + 32) commandIssueDate:*(void *)(a1 + 56)];
    }
    else
    {
      if (v12)
      {
        id v16 = [*(id *)(a1 + 32) identifier];
        id v17 = [v16 UUIDString];
        *(_DWORD *)id buf = 138412290;
        uint64_t v25 = v17;
        _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with no task.", buf, 0xCu);
      }
      uint64_t v19 = *(void *)(a1 + 40);
      id v18 = *(void **)(a1 + 48);
      id v20 = [*(id *)(a1 + 32) beaconIdentifier];
      [v18 finishBeaconFuture:v19 beaconUUID:v20];
    }
  }
}

uint64_t __33__SPOwnerSession_executeCommand___block_invoke_266(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

- (void)finishBeaconGroupFuture:(id)a3 command:(id)a4 commandIssueDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1C978];
  BOOL v12 = [v9 beaconIdentifier];
  id v13 = [v11 arrayWithObject:v12];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke;
  v18[3] = &unk_1E601C7A8;
  id v19 = v9;
  id v20 = v8;
  id v21 = self;
  id v22 = v13;
  id v23 = v10;
  id v14 = v10;
  id v15 = v13;
  id v16 = v8;
  id v17 = v9;
  [(SPOwnerSession *)self beaconGroupsForUUIDs:v15 completion:v18];
}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a2 count])
  {
    id v3 = objc_opt_new();
    id v4 = [*(id *)(a1 + 32) beaconIdentifier];
    [v3 setIdentifier:v4];

    id v5 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) beaconIdentifier];
      *(_DWORD *)id buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finishBeaconGroupFuture: GroupUUID: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithResult:v3];
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_268;
    v11[3] = &unk_1E601C780;
    id v12 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = *(id *)(a1 + 64);
    [v7 unknownBeaconsForUUIDs:v8 completion:v11];

    id v3 = v12;
  }
}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a2 count])
  {
    id v3 = objc_opt_new();
    id v4 = [*(id *)(a1 + 32) beaconIdentifier];
    [v3 setIdentifier:v4];

    id v5 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) beaconIdentifier];
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finish future with unknown beacon: %@", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithResult:v3];
  }
  else
  {
    id v7 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_268_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void **)(a1 + 48);
    id v3 = [*(id *)(a1 + 32) beaconIdentifier];
    uint64_t v10 = [*(id *)(a1 + 32) taskName];
    id v11 = [*(id *)(a1 + 32) identifier];
    [v8 addBeaconChangedListener:v9 beaconUUID:v3 taskName:v10 commandIdentifier:v11 commandIssueDate:*(void *)(a1 + 56)];
  }
}

- (void)finishBeaconFuture:(id)a3 beaconUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke;
  v10[3] = &unk_1E601C7F8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SPOwnerSession *)self allBeaconsWithCompletion:v10];
}

void __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_2;
  v9[3] = &unk_1E601C7D0;
  id v10 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "fm_firstObjectPassingTest:", v9);
  id v5 = LogCategory_OwnerSession();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)id buf = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finishBeaconFuture: BeaconUUID: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithResult:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_cold_1();
    }

    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:2 userInfo:0];
    [*(id *)(a1 + 40) finishWithError:v8];
  }
}

uint64_t __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)addBeaconChangedListener:(id)a3 beaconUUID:(id)a4 taskName:(id)a5 commandIdentifier:(id)a6 commandIssueDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SPOwnerSession *)self queue];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke;
  aBlock[3] = &unk_1E601C820;
  id v18 = v17;
  id v43 = v18;
  id v19 = v15;
  id v44 = v19;
  v45 = self;
  id v20 = v13;
  id v46 = v20;
  id v21 = v14;
  id v47 = v21;
  id v22 = v16;
  id v48 = v22;
  id v23 = v12;
  id v49 = v23;
  uint64_t v24 = _Block_copy(aBlock);
  uint64_t v25 = SPOwnerBeaconsChangedLocalNotification;
  __int16 v26 = [(SPOwnerSession *)self notificationQueue];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_2;
  v39[3] = &unk_1E601C848;
  id v27 = v18;
  v40 = v27;
  id v28 = v24;
  id v41 = v28;
  v29 = objc_msgSend(v23, "fm_addNotificationBlockObserverForName:object:queue:usingBlock:", v25, v23, v26, v39);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_4;
  block[3] = &unk_1E601C288;
  id v30 = v28;
  id v38 = v30;
  dispatch_async(v27, block);
  objc_initWeak(&location, v23);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_5;
  v33[3] = &unk_1E601C870;
  objc_copyWeak(&v35, &location);
  id v31 = v29;
  id v34 = v31;
  id v32 = (id)[v23 addCompletionBlock:v33];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 40);
    *(_DWORD *)id buf = 138412290;
    id v31 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: notifiedBeaconsChangedBlock: %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 48) allBeaconsCache];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_272;
  v28[3] = &unk_1E601C7D0;
  id v29 = *(id *)(a1 + 56);
  id v5 = objc_msgSend(v4, "fm_firstObjectPassingTest:", v28);

  id v6 = [v5 taskInformation];
  uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 64)];

  if (v7)
  {
    id v8 = [v7 lastUpdated];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [*(id *)(a1 + 72) timeIntervalSinceReferenceDate];
    if (v10 > v11)
    {
    }
    else
    {
      id v12 = [v7 commandIdentifier];
      int v13 = [v12 isEqual:*(void *)(a1 + 40)];

      if (!v13) {
        goto LABEL_16;
      }
    }
    id v18 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v7 name];
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      id v31 = v19;
      __int16 v32 = 2112;
      uint64_t v33 = v20;
      _os_log_impl(&dword_1B2FD8000, v18, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: task completed: %@ command: %@", buf, 0x16u);
    }
    id v21 = dispatch_get_global_queue(0, 0);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_273;
    v25[3] = &unk_1E601B920;
    id v26 = *(id *)(a1 + 80);
    id v27 = v5;
    dispatch_async(v21, v25);

    id v17 = v26;
    goto LABEL_15;
  }
  if (v5)
  {
    id v14 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_cold_1((uint64_t *)(a1 + 64), v14);
    }

    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:3 userInfo:0];
    id v16 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_274;
    block[3] = &unk_1E601B920;
    id v23 = *(id *)(a1 + 80);
    id v24 = v15;
    id v17 = v15;
    dispatch_async(v16, block);

LABEL_15:
  }
LABEL_16:
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_272(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_273(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_274(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_3;
  block[3] = &unk_1E601C288;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "fm_removeNotificationBlockObserver:", *(void *)(a1 + 32));
}

- (void)executeCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPOwnerSession_executeCommand_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling executeCommand:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __44__SPOwnerSession_executeCommand_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  id v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SPOwnerSession_executeCommand_completion___block_invoke_2;
  v3[3] = &unk_1E601B850;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__SPOwnerSession_executeCommand_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 executeCommand:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)startRefreshing
{
  id v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: startRefreshing", buf, 2u);
  }

  id v4 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SPOwnerSession_startRefreshing__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __33__SPOwnerSession_startRefreshing__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__SPOwnerSession_startRefreshing__block_invoke_2;
  void v14[3] = &unk_1E601BA30;
  objc_copyWeak(&v15, &location);
  [v2 registerDarwinNotificationName:@"SPBeaconsChangedNotification" block:v14];
  id v3 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__SPOwnerSession_startRefreshing__block_invoke_3;
  v12[3] = &unk_1E601BA30;
  objc_copyWeak(&v13, &location);
  [v3 registerDarwinNotificationName:@"com.apple.locationd.authorization" block:v12];
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__SPOwnerSession_startRefreshing__block_invoke_4;
  v10[3] = &unk_1E601BA30;
  objc_copyWeak(&v11, &location);
  [v4 registerDarwinNotificationName:@"com.apple.locationd/Prefs" block:v10];
  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__SPOwnerSession_startRefreshing__block_invoke_5;
  v8[3] = &unk_1E601BA30;
  objc_copyWeak(&v9, &location);
  [v5 registerDarwinNotificationName:@"com.apple.icloud.searchparty.ServiceSettingsChanged" block:v8];
  [*(id *)(a1 + 32) updateAllBeacons];
  [*(id *)(a1 + 32) _updateOwnerSessionState];
  id v6 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SPOwnerSession_startRefreshing__block_invoke_6;
  v7[3] = &unk_1E601B790;
  void v7[4] = *(void *)(a1 + 32);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __33__SPOwnerSession_startRefreshing__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAllBeacons];
}

void __33__SPOwnerSession_startRefreshing__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAllBeacons];
}

void __33__SPOwnerSession_startRefreshing__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAllBeacons];
}

void __33__SPOwnerSession_startRefreshing__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateOwnerSessionState];
}

uint64_t __33__SPOwnerSession_startRefreshing__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerIntentTimerFired];
}

- (void)setRegisterIntentDispatchTimerWithInterval:(double)a3
{
  id v6 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v6);

  if ((a3 < 0.0 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(void *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    uint64_t v11 = -1;
    dispatch_time_t v10 = -1;
  }
  else
  {
    double v9 = a3 * 1000000000.0;
    dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)v9);
    uint64_t v11 = (unint64_t)((double)(uint64_t)v9 * 0.02);
  }
  [(SPOwnerSession *)self invalidateRegisterIntentDispatchTimer];
  id v12 = [(SPOwnerSession *)self queue];
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
  [(SPOwnerSession *)self setRegisterIntentDispatchTimer:v13];

  id v14 = [(SPOwnerSession *)self registerIntentDispatchTimer];
  dispatch_source_set_timer(v14, v10, 0xFFFFFFFFFFFFFFFFLL, v11);

  objc_initWeak(&location, self);
  id v15 = [(SPOwnerSession *)self registerIntentDispatchTimer];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __61__SPOwnerSession_setRegisterIntentDispatchTimerWithInterval___block_invoke;
  uint64_t v20 = &unk_1E601BA30;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v15, &v17);

  id v16 = [(SPOwnerSession *)self registerIntentDispatchTimer];
  dispatch_resume(v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __61__SPOwnerSession_setRegisterIntentDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession register intent dispatch timer fired", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained registerIntentTimerFired];
}

- (void)invalidateRegisterIntentDispatchTimer
{
  id v3 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPOwnerSession *)self registerIntentDispatchTimer];

  if (v4)
  {
    id v5 = [(SPOwnerSession *)self registerIntentDispatchTimer];
    dispatch_source_cancel(v5);

    [(SPOwnerSession *)self setRegisterIntentDispatchTimer:0];
  }
}

- (void)registerIntentTimerFired
{
  id v3 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager registerIntentTimerFired", buf, 2u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SPOwnerSession_registerIntentTimerFired__block_invoke;
  v5[3] = &unk_1E601C898;
  v5[4] = self;
  [(SPOwnerSession *)self sendRegisterIntentWithCompletion:v5];
}

void __42__SPOwnerSession_registerIntentTimerFired__block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = LogCategory_OwnerSession();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)id buf = 138412290;
      double v10 = *(double *)&v5;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Error scheduling intents: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)id buf = 134217984;
      double v10 = a3;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Successfully sent RegisterIntent message (retryInterval: %f)", buf, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SPOwnerSession_registerIntentTimerFired__block_invoke_277;
    v8[3] = &unk_1E601BB60;
    void v8[4] = *(void *)(a1 + 32);
    *(double *)&void v8[5] = a3;
    dispatch_async(v6, v8);
  }
}

uint64_t __42__SPOwnerSession_registerIntentTimerFired__block_invoke_277(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRegisterIntentDispatchTimerWithInterval:*(double *)(a1 + 40)];
}

- (void)startRefreshingBeacons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: startRefreshingBeacons: %lu", buf, 0xCu);
  }

  id v6 = [(SPOwnerSession *)self queue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __41__SPOwnerSession_startRefreshingBeacons___block_invoke;
  uint64_t v11 = &unk_1E601B920;
  id v12 = self;
  id v13 = v4;
  id v7 = v4;
  dispatch_async(v6, &v8);

  [(SPOwnerSession *)self startRefreshing];
}

void __41__SPOwnerSession_startRefreshingBeacons___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setClientObservedBeacons:v2];
}

- (void)stopRefreshing
{
  id v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: stopRefreshing", buf, 2u);
  }

  id v4 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SPOwnerSession_stopRefreshing__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_async(v4, block);

  [(SPOwnerSession *)self sendUnregisterIntentWithCompletion:&__block_literal_global_280];
  id v5 = [(SPOwnerSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__SPOwnerSession_stopRefreshing__block_invoke_281;
  v6[3] = &unk_1E601B790;
  void v6[4] = self;
  dispatch_sync(v5, v6);
}

uint64_t __32__SPOwnerSession_stopRefreshing__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateRegisterIntentDispatchTimer];
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "set_ownerSessionState:", 0);
}

void __32__SPOwnerSession_stopRefreshing__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = LogCategory_OwnerSession();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "SPOwnerSession: Error stopping intent session: %@";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "SPOwnerSession: Successfully sent UnregisterIntent message";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

uint64_t __32__SPOwnerSession_stopRefreshing__block_invoke_281(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)updateAllBeacons
{
  id v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: updateAllBeacons:", v4, 2u);
  }

  [(SPOwnerSession *)self allBeaconsWithCompletion:&__block_literal_global_283];
}

void __34__SPOwnerSession_updateAllBeacons__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:SPOwnerBeaconsChangedLocalNotification object:0];
}

- (void)setLocationSources:(id)a3
{
}

- (NSSet)allBeacons
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  id v3 = [(SPOwnerSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SPOwnerSession_allBeacons__block_invoke;
  v6[3] = &unk_1E601BA08;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __28__SPOwnerSession_allBeacons__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) allBeaconsCache];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)allBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E601B850;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = v5;
  dispatch_async(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained userAgentProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E601C8E0;
  id v6 = a1[4];
  objc_copyWeak(&v8, v2);
  id v7 = a1[5];
  [v4 allBeaconsWithCompletion:v5];

  objc_destroyWeak(&v8);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E601BB38;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v5 = v3;
  id v9 = v5;
  dispatch_async(v4, v8);
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v7);

  objc_destroyWeak(&v10);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAllBeaconsCache:*(void *)(a1 + 32)];
  [WeakRetained updateConnectionExpiryDispatchTimerWithBeacons:*(void *)(a1 + 32)];
  id v3 = [WeakRetained tagSeparationBeaconsChangedBlock];
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_4;
    v5[3] = &unk_1E601C0C0;
    void v5[4] = WeakRetained;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) beaconsToLeash];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startUpdatingApplicationBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136446210;
    uint64_t v25 = "-[SPOwnerSession startUpdatingApplicationBeaconsWithContext:collectionDifference:completion:]";
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %{public}s", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke;
  aBlock[3] = &unk_1E601C950;
  void aBlock[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = [(SPOwnerSession *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_4;
  v18[3] = &unk_1E601B828;
  void v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  dispatch_async(v16, v18);
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  [*(id *)(a1 + 32) setSimpleBeaconUpdateInterface:v2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_2;
  v3[3] = &unk_1E601C928;
  id v4 = *(id *)(a1 + 48);
  [v2 setSimpleBeaconDifferenceBlock:v3];
  [v2 startUpdatingSimpleBeaconsWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [v5 insertions];
    uint64_t v7 = [v11 removals];
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];
    id v9 = objc_msgSend(v8, "fm_map:", &__block_literal_global_288);

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v9];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SPApplicationBeacon alloc];
  id v4 = [v2 object];
  id v5 = [(SPApplicationBeacon *)v3 initWithInternalSimpleBeacon:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F28F18]);
  uint64_t v7 = [v2 changeType];
  uint64_t v8 = [v2 index];

  id v9 = (void *)[v6 initWithObject:v5 type:v7 index:v8];

  return v9;
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) simpleBeaconUpdateInterface];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_5;
    v5[3] = &unk_1E601C4B0;
    void v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    [v3 stopUpdatingApplicationBeaconsWithCompletion:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_6;
  block[3] = &unk_1E601C288;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopUpdatingApplicationBeaconsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136446210;
    id v11 = "-[SPOwnerSession stopUpdatingApplicationBeaconsWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %{public}s", buf, 0xCu);
  }

  id v6 = [(SPOwnerSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SPOwnerSession_stopUpdatingApplicationBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E601B828;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __63__SPOwnerSession_stopUpdatingApplicationBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) simpleBeaconUpdateInterface];
  if (v2)
  {
    [*(id *)(a1 + 32) setSimpleBeaconUpdateInterface:0];
    [v2 stopUpdatingSimpleBeaconsWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SPOwnerSession_unacceptedBeaconsWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SPOwnerSession_unacceptedBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 unacceptedBeaconsWithCompletion:*(void *)(a1 + 32)];
}

- (void)removeBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SPOwnerSession_removeBeacon_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__SPOwnerSession_removeBeacon_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 removeBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__SPOwnerSession_removeBeaconFromGroup_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__SPOwnerSession_removeBeaconFromGroup_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 removeBeaconFromGroup:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconStoreStatusWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SPOwnerSession_beaconStoreStatusWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SPOwnerSession_beaconStoreStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconStoreStatusWithCompletion:*(void *)(a1 + 32)];
}

- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SPOwnerSession_waitForBeaconStoreAvailableWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__SPOwnerSession_waitForBeaconStoreAvailableWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 waitForBeaconStoreAvailableWithCompletion:*(void *)(a1 + 32)];
}

- (void)sendRegisterIntentWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SPOwnerSession_sendRegisterIntentWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__SPOwnerSession_sendRegisterIntentWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 sendRegisterIntentWithCompletion:*(void *)(a1 + 32)];
}

- (void)sendUnregisterIntentWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SPOwnerSession_sendUnregisterIntentWithCompletion___block_invoke;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__SPOwnerSession_sendUnregisterIntentWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 sendUnregisterIntentWithCompletion:*(void *)(a1 + 32)];
}

- (void)updateBeaconObservations:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "update beacon observations %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPOwnerSession_updateBeaconObservations_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __54__SPOwnerSession_updateBeaconObservations_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 updateBeaconObservations:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (id)executeUTPlaySoundCommand:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@", buf, 0xCu);
  }

  [(SPOwnerSession *)self startRefreshing];
  id v6 = objc_alloc_init(MEMORY[0x1E4F61548]);
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "playSoundContext"));
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0B31ED0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke;
  id v19 = &unk_1E601C758;
  id v20 = v4;
  id v9 = v6;
  id v21 = v9;
  id v22 = v8;
  id v23 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v4;
  id v13 = _Block_copy(&v16);
  -[SPOwnerSession executeCommand:completion:](self, "executeCommand:completion:", v12, v13, v16, v17, v18, v19);
  id v14 = v9;

  return v14;
}

void __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)id buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: commandCompletion: %@", buf, 0xCu);
  }

  if (v3)
  {
    id v6 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      id v8 = [v7 UUIDString];
      *(_DWORD *)id buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v3;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@ finishing with error %@", buf, 0x16u);
    }
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_299;
    block[3] = &unk_1E601B920;
    id v22 = *(id *)(a1 + 40);
    id v23 = v3;
    dispatch_async(v9, block);

    id v10 = v22;
  }
  else
  {
    int v11 = [*(id *)(a1 + 48) containsObject:*(void *)(a1 + 56)];
    id v12 = LogCategory_OwnerSession();
    id v10 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 32) identifier];
        id v14 = [v13 UUIDString];
        *(_DWORD *)id buf = 138412290;
        id v25 = v14;
        _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@ finished.", buf, 0xCu);
      }
      id v15 = objc_opt_new();
      uint64_t v16 = [*(id *)(a1 + 32) beaconIdentifier];
      [v15 setIdentifier:v16];

      uint64_t v17 = dispatch_get_global_queue(0, 0);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_300;
      v18[3] = &unk_1E601B920;
      id v19 = *(id *)(a1 + 40);
      id v20 = v15;
      id v10 = v15;
      dispatch_async(v17, v18);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_cold_1(a1, (uint64_t *)(a1 + 56), v10);
    }
  }
}

uint64_t __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_299(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

uint64_t __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_300(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "unknownBeaconsForUUIDs %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_unknownBeaconsForUUIDs_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __52__SPOwnerSession_unknownBeaconsForUUIDs_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 unknownBeaconsForUUIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  int v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 UUIDString];
    *(_DWORD *)id buf = 67109378;
    int v20 = v6;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "updateBatteryStatus %d for beacon %@.", buf, 0x12u);
  }
  id v12 = [(SPOwnerSession *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__SPOwnerSession_updateBatteryStatus_beaconUUID_completion___block_invoke;
  v15[3] = &unk_1E601C550;
  void v15[4] = self;
  id v16 = v8;
  char v18 = v6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

void __60__SPOwnerSession_updateBatteryStatus_beaconUUID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) batteryStatusCache];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    goto LABEL_7;
  }
  int v4 = [v3 unsignedCharValue];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  if (v4 != v5)
  {
LABEL_7:
    [*(id *)(a1 + 32) _updateBatteryStatus:v5 beaconUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    goto LABEL_8;
  }
  int v6 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "updateBatteryStatus: value has not changed. Not updating.", v8, 2u);
  }

  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain" code:4 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_8:
}

- (void)_updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = objc_initWeak(&location, self);
  id v12 = [(SPOwnerSession *)self userAgentProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke;
  v15[3] = &unk_1E601C9A0;
  void v15[4] = self;
  char v18 = v6;
  id v13 = v8;
  id v16 = v13;
  id v14 = v9;
  id v17 = v14;
  [v12 updateBatteryStatus:v6 beaconUUID:v13 completion:v15];

  objc_destroyWeak(&location);
}

void __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke_2;
  block[3] = &unk_1E601C978;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  char v13 = *(unsigned char *)(a1 + 56);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v3 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      int v4 = "Battery status updated successfully. Saving new status to local cache.";
      uint64_t v5 = buf;
      goto LABEL_7;
    }
LABEL_8:

    [*(id *)(a1 + 40) _cacheBatteryStatus:*(unsigned __int8 *)(a1 + 64) beaconUUID:*(void *)(a1 + 48)];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
  }
  if ([v2 code] == 4)
  {
    id v3 = LogCategory_OwnerSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      int v4 = "Battery status has NOT changed. Saving status to local cache to save an XPC call next time.";
      uint64_t v5 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
}

- (void)_cacheBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  __int16 v7 = [(SPOwnerSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v9 = [NSNumber numberWithUnsignedChar:v4];
  id v8 = [(SPOwnerSession *)self batteryStatusCache];
  [v8 setObject:v9 forKeyedSubscript:v6];
}

- (SPOwnerSessionState)ownerSessionState
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  id v3 = [(SPOwnerSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SPOwnerSession_ownerSessionState__block_invoke;
  v6[3] = &unk_1E601BA08;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPOwnerSessionState *)v4;
}

void __35__SPOwnerSession_ownerSessionState__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _ownerSessionState];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_updateOwnerSessionState
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke;
  block[3] = &unk_1E601BD10;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ownerSessionStateUpdatedBlock];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained userAgentProxy];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_2;
    v5[3] = &unk_1E601C9C8;
    void v5[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v6 = v2;
    [v4 ownerSessionStateWithCompletion:v5];

    objc_destroyWeak(&v7);
  }
}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_3;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "set_ownerSessionState:", a1[4]);
  id v3 = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_4;
  v4[3] = &unk_1E601C0C0;
  id v6 = a1[5];
  id v5 = a1[4];
  dispatch_async(v3, v4);
}

uint64_t __42__SPOwnerSession__updateOwnerSessionState__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "disableUTAppAlert %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  id v8 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SPOwnerSession_disableUTAppAlert_completion___block_invoke;
  block[3] = &unk_1E601C3B0;
  objc_copyWeak(&v12, &buf);
  BOOL v13 = v4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&buf);
}

void __47__SPOwnerSession_disableUTAppAlert_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 disableUTAppAlert:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)isUTAppAlertDisabled:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "isUTAppAlertDisabled", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = [(SPOwnerSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SPOwnerSession_isUTAppAlertDisabled___block_invoke;
  v8[3] = &unk_1E601C338;
  objc_copyWeak(&v10, buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __39__SPOwnerSession_isUTAppAlertDisabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 isUTAppAlertDisabled:*(void *)(a1 + 32)];
}

- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession.fetchUnauthorizedEncryptedPayload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] UUIDString];
    *(_DWORD *)id buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "fetchUnauthorizedEncryptedPayload %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, a1[5]);
  id v4 = [a1[5] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke_302;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v8, (id *)buf);
  id v6 = a1[4];
  id v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke_302(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 fetchUnauthorizedEncryptedPayload:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession.stopFetchingUnauthorizedEncryptedPayload", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "stopFetchingUnauthorizedEncryptedPayload", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke_303;
  v4[3] = &unk_1E601C338;
  objc_copyWeak(&v6, buf);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke_303(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 stopFetchingUnauthorizedEncryptedPayloadWithCompletion:*(void *)(a1 + 32)];
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession.peripheralConnectionMaterialForAccessoryIdentifier", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] UUIDString];
    *(_DWORD *)id buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "peripheralConnectionMaterial for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, a1[5]);
  id v4 = [a1[5] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_304;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v8, (id *)buf);
  id v6 = a1[4];
  id v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_304(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 peripheralConnectionMaterialForAccessoryIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession.requestLiveLocationForUUID", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke_2;
  v3[3] = &unk_1E601B850;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 requestLiveLocationForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession.requestLiveLocationForFriend", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke_2;
  v3[3] = &unk_1E601B850;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 requestLiveLocationForFriend:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)registerDarwinNotificationName:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SPOwnerSession *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_registerDarwinNotificationName_block___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SPOwnerSession_registerDarwinNotificationName_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained darwinHandlers];
  id v3 = [[SPDarwinNotificationHandler alloc] initWithNotificationName:*(void *)(a1 + 32) changeBlock:*(void *)(a1 + 40)];
  [v2 setValue:v3 forKey:*(void *)(a1 + 32)];
}

- (void)unregisterDarwinNotificationName:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SPOwnerSession_unregisterDarwinNotificationName___block_invoke;
  v7[3] = &unk_1E601B920;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __51__SPOwnerSession_unregisterDarwinNotificationName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterDarwinNotificationName:*(void *)(a1 + 40)];
}

- (void)allObservationsForBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke;
  block[3] = &unk_1E601B878;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userAgentProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E601C9F0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 allObservationsForBeacon:v3 completion:v4];
}

void __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_3;
  v7[3] = &unk_1E601C0C0;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke;
  block[3] = &unk_1E601C978;
  void block[4] = self;
  id v18 = v10;
  unsigned __int8 v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userAgentProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_2;
  v6[3] = &unk_1E601CA18;
  id v7 = *(id *)(a1 + 56);
  [v2 hintBasedIndexSearchForBeacon:v3 baseIndex:v4 hint:v5 completion:v6];
}

void __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_3;
  block[3] = &unk_1E601BE70;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(SPOwnerSession *)self _enforceRateLimit];
  if (v10)
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke;
    block[3] = &unk_1E601C0C0;
    id v22 = v9;
    id v21 = v10;
    id v12 = v9;
    dispatch_async(v11, block);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2;
    v15[3] = &unk_1E601CA68;
    void v15[4] = self;
    objc_copyWeak(&v18, &location);
    id v13 = v8;
    BOOL v19 = a4;
    id v16 = v13;
    id v17 = v9;
    id v14 = v9;
    _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: readRawAISMetadataFromMACAddress:useOwnerControlPoint:completion:", OS_ACTIVITY_FLAG_DEFAULT, v15);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
}

uint64_t __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3;
  v3[3] = &unk_1E601C360;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)id buf = 141558530;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    __int16 v20 = 1024;
    int v21 = v5;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d called", buf, 0x1Cu);
  }

  id v6 = [WeakRetained userAgentProxy];
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_307;
  v12[3] = &unk_1E601CA40;
  id v13 = v7;
  char v15 = *(unsigned char *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  [v6 readRawAISMetadataFromMACAddress:v13 useOwnerControlPoint:v8 completion:v12];

  id v9 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)id buf = 141558530;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    int v21 = v11;
    _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ userOwnerControlPoint:%d", buf, 0x1Cu);
  }
}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  char v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 141558530;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d completion called", (uint8_t *)&v10, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  int v10 = [(SPOwnerSession *)self _enforceRateLimit];
  if (v10)
  {
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke;
    block[3] = &unk_1E601C0C0;
    id v22 = v9;
    id v21 = v10;
    id v12 = v9;
    dispatch_async(v11, block);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2;
    v15[3] = &unk_1E601CA68;
    void v15[4] = self;
    objc_copyWeak(&v18, &location);
    id v13 = v8;
    BOOL v19 = a4;
    id v16 = v13;
    id v17 = v9;
    id v14 = v9;
    _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: readAISMetadataFromMACAddress:useOwnerControlPoint:completion:", OS_ACTIVITY_FLAG_DEFAULT, v15);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
}

uint64_t __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3;
  v3[3] = &unk_1E601C360;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)id buf = 141558530;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    __int16 v20 = 1024;
    int v21 = v5;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d called", buf, 0x1Cu);
  }

  id v6 = [WeakRetained userAgentProxy];
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_309;
  v12[3] = &unk_1E601CA90;
  id v13 = v7;
  char v15 = *(unsigned char *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  [v6 readAISMetadataFromMACAddress:v13 useOwnerControlPoint:v8 completion:v12];

  id v9 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)id buf = 141558530;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    int v21 = v11;
    _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ userOwnerControlPoint:%d", buf, 0x1Cu);
  }
}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  char v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 141558530;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d completion called", (uint8_t *)&v10, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readRawAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(SPOwnerSession *)self _enforceRateLimit];
  if (v8)
  {
    int v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke;
    block[3] = &unk_1E601C0C0;
    id v18 = v7;
    id v17 = v8;
    id v10 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_2;
    activity_block[3] = &unk_1E601C668;
    activity_void block[4] = self;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    id v11 = v7;
    _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: readRawAISMetadataFromBeaconIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak(&location);
}

uint64_t __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v6, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)id buf = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask}@ called", buf, 0xCu);
  }

  id v5 = [WeakRetained userAgentProxy];
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_311;
  v7[3] = &unk_1E601CAB8;
  id v8 = v6;
  id v9 = *(id *)(a1 + 40);
  [v5 readRawAISMetadataForIdentifier:v8 completion:v7];
}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_311(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  id v9 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(SPOwnerSession *)self _enforceRateLimit];
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke;
    block[3] = &unk_1E601C0C0;
    id v18 = v7;
    id v17 = v8;
    id v10 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_2;
    activity_block[3] = &unk_1E601C668;
    activity_void block[4] = self;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    id v11 = v7;
    _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: readAISMetadataFromBeaconIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak(&location);
}

uint64_t __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v6, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)id buf = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask}@ called", buf, 0xCu);
  }

  id v5 = [WeakRetained userAgentProxy];
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_312;
  v7[3] = &unk_1E601CAE0;
  id v8 = v6;
  id v9 = *(id *)(a1 + 40);
  [v5 readAISMetadataForIdentifier:v8 completion:v7];
}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_312(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  id v9 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)beaconAddedBlock
{
  return self->beaconAddedBlock;
}

- (void)setBeaconAddedBlock:(id)a3
{
}

- (id)beaconRemovedBlock
{
  return self->beaconRemovedBlock;
}

- (void)setBeaconRemovedBlock:(id)a3
{
}

- (id)beaconsChangedBlock
{
  return self->beaconsChangedBlock;
}

- (void)setBeaconsChangedBlock:(id)a3
{
}

- (id)latestLocationsUpdatedBlock
{
  return self->latestLocationsUpdatedBlock;
}

- (void)setLatestLocationsUpdatedBlock:(id)a3
{
}

- (id)ownerSessionStateUpdatedBlock
{
  return self->ownerSessionStateUpdatedBlock;
}

- (void)setOwnerSessionStateUpdatedBlock:(id)a3
{
}

- (NSSet)locationSources
{
  return self->_locationSources;
}

- (id)maintainedBeaconsChangedBlock
{
  return self->maintainedBeaconsChangedBlock;
}

- (void)setMaintainedBeaconsChangedBlock:(id)a3
{
}

- (id)maintainedUnknownBeaconsChangedBlock
{
  return self->maintainedUnknownBeaconsChangedBlock;
}

- (void)setMaintainedUnknownBeaconsChangedBlock:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (void)setUserAgentProxy:(id)a3
{
}

- (NSSet)allBeaconsCache
{
  return self->_allBeaconsCache;
}

- (void)setAllBeaconsCache:(id)a3
{
}

- (NSSet)clientObservedBeacons
{
  return self->_clientObservedBeacons;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (id)tagSeparationBeaconsChangedBlock
{
  return self->_tagSeparationBeaconsChangedBlock;
}

- (void)setTagSeparationBeaconsChangedBlock:(id)a3
{
}

- (NSDictionary)locationCache
{
  return self->_locationCache;
}

- (void)setLocationCache:(id)a3
{
}

- (NSDate)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(id)a3
{
}

- (NSMutableDictionary)batteryStatusCache
{
  return self->_batteryStatusCache;
}

- (void)setBatteryStatusCache:(id)a3
{
}

- (OS_dispatch_source)registerIntentDispatchTimer
{
  return self->_registerIntentDispatchTimer;
}

- (void)setRegisterIntentDispatchTimer:(id)a3
{
}

- (FMTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
}

- (SPOwnerSessionState)_ownerSessionState
{
  return self->__ownerSessionState;
}

- (void)set_ownerSessionState:(id)a3
{
}

- (void)setDarwinHandlers:(id)a3
{
}

- (SPOwnerSessionLocationFetch)locationFetch
{
  return self->_locationFetch;
}

- (void)setLocationFetch:(id)a3
{
}

- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface
{
  return self->_simpleBeaconUpdateInterface;
}

- (void)setSimpleBeaconUpdateInterface:(id)a3
{
}

- (SPOwnerSessionDelegatedLocation)delegationUpdate
{
  return self->_delegationUpdate;
}

- (void)setDelegationUpdate:(id)a3
{
}

- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) didDetectUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SPOwnerSession_TrackingAvoidance__didDetectUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __92__SPOwnerSession_TrackingAvoidance__didDetectUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 didDetectUnauthorizedTrackingWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) didUpdateUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SPOwnerSession_TrackingAvoidance__didUpdateUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __92__SPOwnerSession_TrackingAvoidance__didUpdateUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 didUpdateUnauthorizedTrackingWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) didWithdrawUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SPOwnerSession_TrackingAvoidance__didWithdrawUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __94__SPOwnerSession_TrackingAvoidance__didWithdrawUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 didWithdrawUnauthorizedTrackingWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) ignoringUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SPOwnerSession_TrackingAvoidance__ignoringUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __91__SPOwnerSession_TrackingAvoidance__ignoringUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 ignoringUnauthorizedTrackingWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) unauthorizedTrackingTypeWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SPOwnerSession_TrackingAvoidance__unauthorizedTrackingTypeWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __87__SPOwnerSession_TrackingAvoidance__unauthorizedTrackingTypeWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 unauthorizedTrackingTypeWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)playUnauthorizedSoundOnBeaconByUUID:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) playUnauthorizedSoundOnBeaconByUUID:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SPOwnerSession_TrackingAvoidance__playUnauthorizedSoundOnBeaconByUUID_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __84__SPOwnerSession_TrackingAvoidance__playUnauthorizedSoundOnBeaconByUUID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 playUnauthorizedSoundOnBeaconUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 UUIDString];
    *(_DWORD *)id buf = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until___block_invoke;
  block[3] = &unk_1E601CBE0;
  objc_copyWeak(v13, (id *)buf);
  id v12 = v6;
  v13[1] = (id)a4;
  id v10 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

void __62__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 ignoreBeaconByUUID:*(void *)(a1 + 32) until:*(void *)(a1 + 48)];
}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 UUIDString];
    *(_DWORD *)id buf = 138412290;
    __int16 v20 = v11;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v12 = [(SPOwnerSession *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until_completion___block_invoke;
  v15[3] = &unk_1E601CC08;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a4;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __73__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 ignoreTrackingForUUID:*(void *)(a1 + 32) until:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    *(_DWORD *)id buf = 138412290;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v13 = [(SPOwnerSession *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_untilDate_completion___block_invoke;
  v17[3] = &unk_1E601C6B8;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __77__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_untilDate_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 ignoreBeaconByUUID:*(void *)(a1 + 32) untilDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)ignoreBeaconByAdvertisement:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 data];
    id v12 = objc_msgSend(v11, "fm_hexString");
    *(_DWORD *)id buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v13 = [(SPOwnerSession *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SPOwnerSession_TrackingAvoidance__ignoreBeaconByAdvertisement_until_completion___block_invoke;
  v16[3] = &unk_1E601CC08;
  objc_copyWeak(v19, (id *)buf);
  v19[1] = (id)a4;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v13, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);
}

void __82__SPOwnerSession_TrackingAvoidance__ignoreBeaconByAdvertisement_until_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 ignoreTrackingFor:*(void *)(a1 + 32) until:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)acceptUTForBeaconUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUIDString];
    *(_DWORD *)id buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "received accept UT event for beacon %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(SPOwnerSession *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SPOwnerSession_TrackingAvoidance__acceptUTForBeaconUUID___block_invoke;
  v9[3] = &unk_1E601BB38;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __59__SPOwnerSession_TrackingAvoidance__acceptUTForBeaconUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 acceptUTForBeaconUUID:*(void *)(a1 + 32)];
}

- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v17 = "-[SPOwnerSession(TrackingAvoidance) didObserveUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPOwnerSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SPOwnerSession_TrackingAvoidance__didObserveUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __93__SPOwnerSession_TrackingAvoidance__didObserveUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 didObserveUnauthorizedTrackingWithCompletion:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)publishWildModeRecordsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v12 = "-[SPOwnerSession(TrackingAvoidance) publishWildModeRecordsWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(SPOwnerSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SPOwnerSession_TrackingAvoidance__publishWildModeRecordsWithCompletion___block_invoke;
  v8[3] = &unk_1E601C338;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __74__SPOwnerSession_TrackingAvoidance__publishWildModeRecordsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained userAgentProxy];
  [v2 publishWildModeRecordsWithCompletion:*(void *)(a1 + 32)];
}

- (void)startRefreshingTagSeparationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SPOwnerSession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke;
  v7[3] = &unk_1E601B828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTagSeparationBeaconsChangedBlock:*(void *)(a1 + 40)];
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke_2;
  block[3] = &unk_1E601B790;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRefreshing];
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 completion:(id)a5
{
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(SPOwnerSession *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__SPOwnerSession_TagSeparation__tagSeparationStateChanged_beaconUUID_location_completion___block_invoke;
  v16[3] = &unk_1E601BBB0;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __90__SPOwnerSession_TagSeparation__tagSeparationStateChanged_beaconUUID_location_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 tagSeparationStateChanged:*(void *)(a1 + 40) beaconUUID:*(void *)(a1 + 48) location:0 completion:*(void *)(a1 + 56)];
}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1B2FD8000, v0, v1, "SPOwnerSession beaconForUUID called with nil UUID.", v2, v3, v4, v5, v6);
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1B2FD8000, v0, v1, "SPOwnerSession beaconForIdentifier called with nil UUID.", v2, v3, v4, v5, v6);
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1B2FD8000, v0, v1, "SPOwnerSession beaconGroupForIdentifier called with nil UUID.", v2, v3, v4, v5, v6);
}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_268_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B2FD8000, v0, OS_LOG_TYPE_ERROR, "SPOwnerSession: finishBeaconGroupFuture. No beacon group or unknown beacon found. Fallback to SPBeacon", v1, 2u);
}

void __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B2FD8000, v0, OS_LOG_TYPE_ERROR, "SPOwnerSession: finishBeaconFuture: beacon not found.", v1, 2u);
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPOwnerSession: notifiedBeaconsChangedBlock: beacon does not support task %@", (uint8_t *)&v3, 0xCu);
}

void __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v6 UUIDString];
  id v8 = [*(id *)(a1 + 32) taskName];
  uint64_t v9 = *a2;
  int v10 = 138412802;
  id v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_1B2FD8000, a3, OS_LOG_TYPE_ERROR, "SPOwnerSession: executeUTPlaySoundCommand: %@ finishing with task: %@ playSoundContext %@. We should never get here", (uint8_t *)&v10, 0x20u);
}

@end