@interface BeaconManagerTrampoline
- (_TtC12searchpartyd23BeaconManagerTrampoline)init;
- (void)acceptUTForBeaconUUID:(id)a3;
- (void)activeCompanionWithCompletion:(id)a3;
- (void)addSafeLocation:(id)a3 completion:(id)a4;
- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsWithCompletion:(id)a3;
- (void)allDuriansWithCompletion:(id)a3;
- (void)allObservationsForBeacon:(id)a3 completion:(id)a4;
- (void)allPairingErrorsWithCompletion:(id)a3;
- (void)alwaysBeaconWildStateWithCompletion:(id)a3;
- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5;
- (void)beaconForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconForUUID:(id)a3 completion:(id)a4;
- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4;
- (void)beaconStoreStatusWithCompletion:(id)a3;
- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4;
- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)beaconingKeysOfType:(int64_t)a3 withCompletion:(id)a4;
- (void)beaconingStateWithCompletion:(id)a3;
- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)beaconsToMaintainPersistentConnection:(id)a3;
- (void)beaconsToMaintainWithCompletion:(id)a3;
- (void)beaconsToMonitorForSeparation:(id)a3;
- (void)bluetoothConnectionKeysFor:(id)a3 completion:(id)a4;
- (void)bluetoothPowerStateUpdated:(int64_t)a3;
- (void)clientConfigurationWithCompletion:(id)a3;
- (void)commandKeysForUUID:(id)a3 withCriteria:(id)a4 completion:(id)a5;
- (void)commandKeysForUUIDs:(id)a3 completion:(id)a4;
- (void)commandKeysForUUIDs:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5;
- (void)connectedToBeacon:(id)a3 withIndex:(int64_t)a4 completion:(id)a5;
- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6;
- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4;
- (void)currentBeaconingKeyWithCompletion:(id)a3;
- (void)delegatedLocationForContext:(id)a3 completion:(id)a4;
- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4;
- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4;
- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)executeCommand:(id)a3 completion:(id)a4;
- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4;
- (void)fetchAllKeyMapFileDescriptorsWithCompletion:(id)a3;
- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4;
- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4;
- (void)fetchSeparationMonitoringStatus:(id)a3;
- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4;
- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4;
- (void)finalizePairingUsing:(id)a3 completion:(id)a4;
- (void)firmwareUpdateCandidateBeaconsWithCompletion:(id)a3;
- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4;
- (void)forceDistributeKeysWithCompletion:(id)a3;
- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6;
- (void)forceLOIBasedSafeLocationRefresh:(id)a3;
- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5;
- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4;
- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4;
- (void)getLocalPairingDataWithCompletion:(id)a3;
- (void)getMacBeaconConfigWithCompletion:(id)a3;
- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4;
- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6;
- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4;
- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)ignoreTrackingFor:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoreTrackingForUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3;
- (void)initiatePairingSessionWithCompletion:(id)a3;
- (void)invalidatePairingSession:(id)a3 completion:(id)a4;
- (void)isLPEMModeSupportedWithCompletion:(id)a3;
- (void)isUTAppAlertDisabled:(id)a3;
- (void)keySyncMetadataWithcompletion:(id)a3;
- (void)latestLocationsForIdentifiers:(id)a3 fetchLimit:(id)a4 sources:(id)a5 completion:(id)a6;
- (void)leechScannerDiscoveredAdvertisementData:(id)a3 rssi:(int)a4 completion:(id)a5;
- (void)locationForContext:(id)a3 completion:(id)a4;
- (void)nearOwnerCommandKeysWithCompletion:(id)a3;
- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4;
- (void)offlineAdvertisingKeysForReason:(int64_t)a3 completion:(id)a4;
- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)ownerSessionStateWithCompletion:(id)a3;
- (void)pairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4;
- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4;
- (void)playUnauthorizedSoundOnBeaconUUID:(id)a3 completion:(id)a4;
- (void)poisonBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4;
- (void)primaryAccountModified;
- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6;
- (void)publishWildModeRecordsWithCompletion:(id)a3;
- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)rawSearchResultsForIdentifier:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)readAISMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)readRawAISMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)removeBeacon:(id)a3 completion:(id)a4;
- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4;
- (void)removeDuplicateBeaconsWithCompletion:(id)a3;
- (void)removeLocalAccountDataWithCompletion:(id)a3;
- (void)removeSafeLocation:(id)a3 completion:(id)a4;
- (void)repairDataStore:(id)a3;
- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4;
- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4;
- (void)roleCategoriesWithCompletion:(id)a3;
- (void)safeLocationsWithCompletion:(id)a3;
- (void)sendRegisterIntentWithCompletion:(id)a3;
- (void)sendUnregisterIntentWithCompletion:(id)a3;
- (void)setAlignmentUncertainty:(double)a3 atIndex:(int64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4;
- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5;
- (void)setKeyRollInterval:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setRole:(int64_t)a3 beaconId:(id)a4 completion:(id)a5;
- (void)setServiceState:(id)a3 completion:(id)a4;
- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4;
- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4;
- (void)setWildKeyBase:(int64_t)a3 interval:(int64_t)a4 fallback:(int64_t)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6;
- (void)standaloneBeaconsForUUIDs:(NSArray *)a3 completion:(id)a4;
- (void)startScanningIncludeServiceCharacterstics:(BOOL)a3 completion:(id)a4;
- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4;
- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3;
- (void)stopScanningWithCompletion:(id)a3;
- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6;
- (void)successfulConnectionForUserIdentifier:(id)a3 beaconIdentifier:(id)a4 primaryIndex:(unint64_t)a5 leMAC:(id)a6 ltkIndex:(unint64_t)a7 ltk:(id)a8 completion:(id)a9;
- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6;
- (void)unacceptedBeaconsWithCompletion:(id)a3;
- (void)unassignSafeLocation:(id)a3 from:(id)a4 completion:(id)a5;
- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4;
- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4;
- (void)unpairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4;
- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateBeaconObservations:(id)a3 completion:(id)a4;
- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7;
- (void)updateObfuscatedIdentifierWithCompletion:(id)a3;
- (void)updateSafeLocation:(id)a3 completion:(id)a4;
- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3;
- (void)verifyPairingInfoUsing:(id)a3 completion:(id)a4;
- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3;
@end

@implementation BeaconManagerTrampoline

- (void)firmwareUpdateCandidateBeaconsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10027E518((uint64_t)sub_10028964C, v5);

  swift_release();
}

- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  _Block_copy(v16);
  v19 = self;
  id v20 = a6;
  sub_100286EE4((uint64_t)v15, a4, v17, (uint64_t)a5, (uint64_t)a6, (uint64_t)v19, (void (**)(void, void))v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for DateInterval();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  uint64_t v13 = self;
  sub_1002870EC(a3, v11, (char *)v13, (uint64_t)v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100287404((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = self;
  sub_10027EC9C((unint64_t)v9, (uint64_t)sub_100131888, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10001D4B0(0, (unint64_t *)&unk_10164DC20);
  sub_10012E2E4(&qword_10164DCB0, (unint64_t *)&unk_10164DC20);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v5);
  uint64_t v7 = self;
  uint64_t v8 = sub_100A46B88();
  sub_1007A72A4(v6, v8, v5);
  _Block_release(v5);
  swift_release();
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)clientConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10047BAC8((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)standaloneBeaconsForUUIDs:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10164DC88;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10164DC90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10103831C((uint64_t)v9, (uint64_t)&unk_10164DC98, (uint64_t)v14);
  swift_release();
}

- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4
{
}

- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4
{
}

- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  _Block_copy(v8);
  sub_1007C1B48(v11, v13, v14, v16, (uint64_t)v17, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001CFB8(v14, v16);
  sub_10001CFB8(v11, v13);
}

- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4
{
}

- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  unint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_1007C238C(v10, v12, v5, (uint64_t)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001CFB8(v10, v12);
}

- (void)beaconForIdentifier:(id)a3 completion:(id)a4
{
}

- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4
{
}

- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v8 = self;
  sub_10065CAC4(v6, (uint64_t)sub_1007C7CB0, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)ownerSessionStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  BOOL v5 = self;
  _Block_copy(v4);
  sub_100AB24F0();
  QueueSynchronizer.conditionalSync<A>(_:)();
  swift_release();
  sub_1007C2A9C(v6, (uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);

  _Block_release(v4);
}

- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6
{
  id v9 = _Block_copy(a6);
  uint64_t v10 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  uint64_t v13 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v9);
  id v14 = a3;
  unint64_t v15 = self;
  sub_1006B5D00(v14, v10, v12, a5, v13, (uint64_t)v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  unint64_t v12 = self;
  static os_log_type_t.default.getter();
  if (qword_1016372F0 != -1) {
    swift_once();
  }
  sub_10000588C((uint64_t *)&unk_10163AD00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_101342130;
  uint64_t v14 = UUID.uuidString.getter();
  uint64_t v16 = v15;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_10000B4CC();
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  sub_10001CD44((Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_100663AFC((uint64_t)v9, (uint64_t)sub_1007C7CA8, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1007BC154((uint64_t)sub_1001E06E0, v5);

  swift_release();
}

- (void)beaconStoreStatusWithCompletion:(id)a3
{
  v4 = (void (**)(void *, void))_Block_copy(a3);
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v5 = self;
  sub_100AB24F0();
  QueueSynchronizer.conditionalSync<A>(_:)();
  swift_release();
  v4[2](v4, v6);
  _Block_release(v4);
}

- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v14;
  uint64_t v15 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  id v16 = a4;
  uint64_t v17 = self;
  sub_1004807F8((uint64_t)v13, v16, a5, v15, (void (*)(void *, void *))sub_1007C7CA0);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6
{
  unint64_t v50 = a5;
  uint64_t v43 = (uint64_t)a3;
  v45 = self;
  uint64_t v8 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v8 - 8);
  uint64_t v51 = (uint64_t)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v48 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  uint64_t v11 = *(void *)(v48 + 64);
  uint64_t v12 = __chkstk_darwin(v10);
  v46 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v39 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v15);
  v40 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v20 = (char *)&v38 - v19;
  uint64_t v21 = _Block_copy(a6);
  v47 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v44 = v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v21;
  uint64_t v41 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v22 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v51, 1, 1, v22);
  uint64_t v23 = v16;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))((char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v15);
  uint64_t v25 = v48;
  uint64_t v24 = v49;
  v26 = v46;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v46, v14, v49);
  uint64_t v27 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v42 = v23;
  uint64_t v28 = (v27 + 40) & ~v27;
  unint64_t v29 = (v17 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (*(unsigned __int8 *)(v25 + 80) + v29 + 8) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v31 = (char *)swift_allocObject();
  *((void *)v31 + 2) = 0;
  *((void *)v31 + 3) = 0;
  v32 = v40;
  *((void *)v31 + 4) = v41;
  v33 = &v31[v28];
  uint64_t v34 = v39;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v33, v32, v39);
  *(void *)&v31[v29] = v50;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v31[v30], v26, v24);
  v35 = &v31[(v11 + v30 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v36 = v43;
  *(void *)v35 = sub_1001E06E0;
  *((void *)v35 + 1) = v36;
  v37 = v45;
  swift_retain();
  swift_retain();
  sub_1008F5E44(v51, (uint64_t)&unk_10164DC48, (uint64_t)v31);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v44, v24);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v47, v34);
}

- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4
{
}

- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char **)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10001D4B0(0, (unint64_t *)&qword_10164DC40);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  uint64_t v13 = self;
  sub_1007C3260(v10, v12, (uint64_t)v13, v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char **, uint64_t))(v8 + 8))(v10, v7);
}

- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)(*sub_10001CD44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16])+ 280);
  uint64_t v7 = self;
  sub_100B4378C(v6, (void (*)(uint64_t))sub_1006CA9F8, v5);

  swift_release();
}

- (void)beaconsToMaintainWithCompletion:(id)a3
{
}

- (void)beaconsToMaintainPersistentConnection:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v4);
  uint64_t v6 = self;
  sub_100480AC4(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = self;
  sub_1007BCE30((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_1007BD06C(v6, (uint64_t)sub_1007C7850, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10001D4B0(0, (unint64_t *)&unk_10164DC20);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1007C3A3C(v6, (uint64_t)v7, (uint64_t)v5, (uint64_t)"detected unauthorized tracking", 30, 0x8000000101407340, (void (*)(uint64_t, void *, uint64_t))sub_1007A828C);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1007C3A3C((uint64_t)v7, (uint64_t)v8, (uint64_t)v6, (uint64_t)"update unauthorized tracking", 28, 0x8000000101406EC0, (void (*)(uint64_t, void *, uint64_t))sub_1007ACCC0);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10001D4B0(0, (unint64_t *)&unk_10164DC20);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  id v7 = self;
  sub_1007C3C30(v6, (uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
}

- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4
{
}

- (void)acceptUTForBeaconUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1007BD5CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)playUnauthorizedSoundOnBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_1007C425C((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)ignoreTrackingForUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = (void (*)(uint64_t))sub_1001E06E0;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = self;
  sub_1007BD8FC((uint64_t)v11, a4, v12, v13);
  sub_1000A1534((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v15 = (void (*)(uint64_t))sub_1001E06E0;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = self;
  sub_1007BDBE8((uint64_t)v14, (uint64_t)v10, v15, v16);
  sub_1000A1534((uint64_t)v15);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)ignoreTrackingFor:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = (void (*)(uint64_t))sub_1001E06E0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1007BDF74(v10, a4, v8, v9);
  sub_1000A1534((uint64_t)v8);
}

- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v7 = sub_1001E06E0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = qword_101636CD8;
  uint64_t v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  sub_1000A5940();
  sub_100F17140(a3);
  swift_release();
  if (v6)
  {
    ((void (*)(void))v7)(0);
    sub_1000A1534((uint64_t)v7);
  }
}

- (void)isUTAppAlertDisabled:(id)a3
{
  uint64_t v4 = (void (**)(void *, id))_Block_copy(a3);
  uint64_t v5 = qword_101636CD8;
  uint64_t v9 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_1000A5940();
  id v6 = sub_100F16154();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 BOOLForKey:v7];
  swift_release();

  v4[2](v4, v8);
  _Block_release(v4);
}

- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v14 = self;
  sub_1004645B4(v6, (uint64_t)v11, (uint64_t)sub_1001E06E0, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)latestLocationsForIdentifiers:(id)a3 fetchLimit:(id)a4 sources:(id)a5 completion:(id)a6
{
  uint64_t v9 = sub_10000588C((uint64_t *)&unk_10163AC90);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a6);
  type metadata accessor for UUID();
  uint64_t v13 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  }
  type metadata accessor for SPBeaconLocationSource(0);
  sub_1007C7800(&qword_101638790, type metadata accessor for SPBeaconLocationSource);
  uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = self;
  sub_1007BE548(v13, (uint64_t)v11, v16, (uint64_t)sub_1007C7848, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10001DAB4((uint64_t)v11, (uint64_t *)&unk_10163AC90);
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10113B780(v8, (uint64_t)v11);
  uint64_t v10 = *sub_10001CD44((Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&v9->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  swift_retain();
  sub_10047BFF4((uint64_t)v11, v10, (void (*)(id, void))sub_1007C77E4, v7);
  swift_release();
  sub_10048257C((uint64_t)v11);

  swift_release();
}

- (void)delegatedLocationForContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction();
  id v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1007C84EC;
  v8[5] = v7;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)rawSearchResultsForIdentifier:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  uint64_t v17 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction();
  uint64_t v20 = v17;
  uint64_t v21 = v14;
  uint64_t v22 = sub_1007C76A4;
  uint64_t v23 = v16;
  uint64_t v18 = self;
  static Transaction.named<A>(_:with:)();

  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)forceDistributeKeysWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  if (*(void *)(*sub_10001CD44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16])+ 40))
  {
    uint64_t v6 = self;
    swift_retain();
    sub_1004EED90((uint64_t)sub_1001E06E0, v5);

    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_101638CF0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  uint64_t v13 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v10);
  uint64_t v14 = self;
  sub_10047FA5C((uint64_t)v9, v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  sub_10001DAB4((uint64_t)v9, &qword_101638CF0);
}

- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4
{
}

- (void)removeBeacon:(id)a3 completion:(id)a4
{
}

- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4
{
}

- (void)executeCommand:(id)a3 completion:(id)a4
{
}

- (void)sendRegisterIntentWithCompletion:(id)a3
{
}

- (void)sendUnregisterIntentWithCompletion:(id)a3
{
}

- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = v12;
  uint64_t v16 = v9;
  uint64_t v17 = sub_1007C84F0;
  uint64_t v18 = v11;
  uint64_t v13 = self;
  static Transaction.named<A>(_:with:)();

  swift_release();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  *(void *)(swift_allocObject() + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v9 = self;
  sub_100470A30(v6, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)allObservationsForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_100A5C2D0((uint64_t)v9, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v28 = self;
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v8;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1001DFD28;
  *(void *)(v19 + 24) = v17;
  uint64_t v20 = *v18;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v23 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  *((void *)v24 + 4) = v20;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v22], v13, v9);
  uint64_t v25 = (void (**)(void *, char))&v24[v23];
  *uint64_t v25 = sub_1007C71C8;
  v25[1] = (void (*)(void *, char))v19;
  v26 = v28;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1008F5E44((uint64_t)v27, (uint64_t)&unk_10164DBC8, (uint64_t)v24);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
}

- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
}

- (void)readRawAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v13 = self;
  sub_1006CAE80((uint64_t)v9, v12, (void (*)(void *, uint64_t))sub_1007C84EC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)readAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v13 = self;
  sub_1006CB9E8((uint64_t)v9, v12, (void (*)(void *, uint64_t))sub_1007C84EC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)publishWildModeRecordsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1001DF814;
  *(void *)(v6 + 24) = v5;
  type metadata accessor for Transaction();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1007C05A8;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = self;
  swift_retain();
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();

  swift_release();
}

- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
}

- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
}

- (void)addSafeLocation:(id)a3 completion:(id)a4
{
}

- (void)removeSafeLocation:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_100A2A960((uint64_t)v9, (uint64_t)v11, (void (**)(void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateSafeLocation:(id)a3 completion:(id)a4
{
}

- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5
{
}

- (void)unassignSafeLocation:(id)a3 from:(id)a4 completion:(id)a5
{
}

- (void)fetchSeparationMonitoringStatus:(id)a3
{
}

- (void)safeLocationsWithCompletion:(id)a3
{
}

- (void)beaconsToMonitorForSeparation:(id)a3
{
}

- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  type metadata accessor for UUID();
  sub_100A24444(&qword_10163BC60, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  id v13 = a5;
  uint64_t v14 = self;
  sub_100A2CCC4(v10, a4, v13, v12, (void (*)(uint64_t, void *))sub_10013148C, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)forceLOIBasedSafeLocationRefresh:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100A08D58((uint64_t)sub_100287680, v5);

  swift_release();
}

- (void)activeCompanionWithCompletion:(id)a3
{
}

- (void)updateObfuscatedIdentifierWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = self;
  sub_1010C6190((uint64_t)sub_1001E06E0, v5);

  swift_release();
}

- (void)primaryAccountModified
{
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v3 = self;
  sub_10037CC38();
}

- (void)removeLocalAccountDataWithCompletion:(id)a3
{
}

- (void)beaconingStateWithCompletion:(id)a3
{
}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
}

- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
}

- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4
{
}

- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
}

- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4
{
}

- (void)allBeaconsWithCompletion:(id)a3
{
}

- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  type metadata accessor for SPBeaconType(0);
  sub_100FCF628(&qword_101637E10, type metadata accessor for SPBeaconType);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = self;
  sub_100FC4590(v10, a4, a5, (uint64_t)sub_100FCFCA0, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1006BB090(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
}

- (void)beaconingKeysOfType:(int64_t)a3 withCompletion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_100FC4908(a3, (uint64_t)sub_100FCFB38, v7);

  swift_release();
}

- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v15);
  uint64_t v16 = self;
  sub_100FCCCC4((uint64_t)v14, (uint64_t)v10, (uint64_t)v16, (void (**)(void, void))v15);
  _Block_release(v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)setServiceState:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = qword_101636CD8;
  id v8 = a3;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once();
  }
  id v9 = v8;
  sub_1000A5940();
  sub_100F161E8(v9);
  swift_release();
  v6[2](v6, 0);
  _Block_release(v6);
}

- (void)getMacBeaconConfigWithCompletion:(id)a3
{
}

- (void)bluetoothPowerStateUpdated:(int64_t)a3
{
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v5 = self;
  sub_100F2DD88(a3);
}

- (void)isLPEMModeSupportedWithCompletion:(id)a3
{
}

- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void *, id))_Block_copy(a3);
  uint64_t v5 = self;
  id v8 = self;
  id v6 = [v5 standardUserDefaults];
  id v7 = [v6 userHasAcknowledgedFindMy];

  v4[2](v4, v7);
  _Block_release(v4);
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  id v8 = self;
  sub_1006BB40C(a3, v7, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  id v6 = self;
  sub_10066D4A8();

  swift_release();
}

- (void)offlineAdvertisingKeysForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  id v8 = self;
  sub_1006C8044(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)allPairingErrorsWithCompletion:(id)a3
{
}

- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4
{
}

- (void)commandKeysForUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  id v8 = self;
  sub_100FC53C4(v6, (uint64_t)sub_100FCFC9C, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)commandKeysForUUIDs:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  type metadata accessor for UUID();
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = self;
  sub_100FC56D8(v12, (uint64_t)v10, (uint64_t)sub_100FCFA64, v13);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6
{
  BOOL v19 = a5;
  uint64_t v8 = type metadata accessor for DateInterval();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v18[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v16);
  uint64_t v17 = self;
  sub_100FCD064((uint64_t)v15, (uint64_t)v11, v19, (uint64_t)v17, (void (**)(void, void))v16);
  _Block_release(v16);
  _Block_release(v16);

  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)commandKeysForUUID:(id)a3 withCriteria:(id)a4 completion:(id)a5
{
}

- (void)fetchAllKeyMapFileDescriptorsWithCompletion:(id)a3
{
}

- (void)allDuriansWithCompletion:(id)a3
{
}

- (void)roleCategoriesWithCompletion:(id)a3
{
}

- (void)setRole:(int64_t)a3 beaconId:(id)a4 completion:(id)a5
{
}

- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5
{
}

- (void)setWildKeyBase:(int64_t)a3 interval:(int64_t)a4 fallback:(int64_t)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v16);
  uint64_t v17 = self;
  sub_100FCD8C4(a3, a4, a5, (uint64_t)v15, (uint64_t)v17, v16);
  _Block_release(v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(int64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v22 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a7);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  uint64_t v20 = self;
  sub_100FC612C(a4, (uint64_t)v17, (uint64_t)v13, (uint64_t)sub_100131660, v19, a3);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)setKeyRollInterval:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  uint64_t v13 = self;
  sub_100FCDAFC(a3, (uint64_t)v11, (uint64_t)v13, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
}

- (void)connectedToBeacon:(id)a3 withIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  uint64_t v13 = self;
  sub_100FCDE5C((uint64_t)v11, a4, (uint64_t)v13, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4
{
}

- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4
{
}

- (void)nearOwnerCommandKeysWithCompletion:(id)a3
{
}

- (void)updateBeaconObservations:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10001D4B0(0, (unint64_t *)&unk_1016566A0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_100FCE054(v6, (uint64_t)v7, (void (**)(uint64_t, uint64_t))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6
{
  BOOL v22 = a4;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v16 = self;
  uint64_t v17 = self;
  _Block_copy(v13);
  id v18 = [v16 sharedInstance];
  unsigned int v19 = [v18 isInternalBuild];

  if (v19)
  {
    uint64_t v20 = type metadata accessor for Transaction();
    __chkstk_darwin(v20);
    *(void *)&v21[-48] = v15;
    *(void *)&v21[-40] = v12;
    *(void *)&v21[-32] = a5;
    *(void *)&v21[-24] = sub_1001E06E0;
    *(void *)&v21[-16] = v14;
    v21[-8] = v22;
    static Transaction.named<A>(_:with:)();
  }
  else
  {
    (*((void (**)(void *, void))v13 + 2))(v13, 0);
  }
  swift_release();
  _Block_release(v13);

  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)removeDuplicateBeaconsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100FCF9C0;
  *(void *)(v6 + 24) = v5;
  type metadata accessor for Transaction();
  uint64_t v7 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)();

  swift_release();
  swift_release();
}

- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6
{
  LODWORD(v51) = a4;
  uint64_t v9 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v9 - 8);
  uint64_t v50 = (uint64_t)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000588C(&qword_101638CF0);
  uint64_t v48 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v48 + 64);
  uint64_t v13 = __chkstk_darwin(v11 - 8);
  uint64_t v49 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v44 - v14;
  uint64_t v53 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v53 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v53);
  v47 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v44 - v19;
  uint64_t v21 = _Block_copy(a6);
  v52 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v15, v22, 1, v53);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  char v24 = sub_1004C69B8(v51);
  if (v24 == 8)
  {
    sub_1007C74BC();
    swift_allocError();
    *uint64_t v25 = 0;
    v26 = self;
    _Block_copy(v21);
    uint64_t v27 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))v21 + 2))(v21, v27);

    swift_errorRelease();
  }
  else
  {
    char v28 = v24;
    uint64_t v29 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16]);
    uint64_t v30 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v50, 1, 1, v30);
    v31 = v47;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v47, v52, v53);
    uint64_t v45 = v23;
    uint64_t v32 = v49;
    sub_1003C5E38((uint64_t)v15, v49);
    uint64_t v33 = *(unsigned __int8 *)(v16 + 80);
    v46 = v21;
    uint64_t v34 = (v33 + 41) & ~v33;
    uint64_t v35 = *(unsigned __int8 *)(v48 + 80);
    uint64_t v51 = v15;
    uint64_t v36 = self;
    uint64_t v37 = (v17 + v35 + v34) & ~v35;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = 0;
    *(void *)(v38 + 24) = 0;
    *(void *)(v38 + 32) = v29;
    *(unsigned char *)(v38 + 40) = v28;
    uint64_t v39 = v38 + v34;
    uint64_t v21 = v46;
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v39, v31, v53);
    v40 = v36;
    uint64_t v15 = v51;
    sub_10001D608(v32, v38 + v37, &qword_101638CF0);
    uint64_t v41 = (void *)(v38 + ((v12 + v37 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v42 = v45;
    *uint64_t v41 = sub_1001E06E0;
    v41[1] = v42;
    self = v40;
    uint64_t v43 = v40;
    _Block_copy(v21);
    swift_retain();
    swift_retain();
    sub_1008F5E44(v50, (uint64_t)&unk_101665F90, v38);
    swift_release();
  }
  swift_release();
  _Block_release(v21);

  sub_10001DAB4((uint64_t)v15, &qword_101638CF0);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v52, v53);
}

- (void)keySyncMetadataWithcompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_100FCFD5C;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_101665F70, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)initiatePairingSessionWithCompletion:(id)a3
{
}

- (void)invalidatePairingSession:(id)a3 completion:(id)a4
{
}

- (void)verifyPairingInfoUsing:(id)a3 completion:(id)a4
{
}

- (void)finalizePairingUsing:(id)a3 completion:(id)a4
{
}

- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  uint64_t v13 = self;
  sub_100FCE1C4((uint64_t)v11, a4, (uint64_t)v13, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)getLocalPairingDataWithCompletion:(id)a3
{
}

- (void)currentBeaconingKeyWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100131888;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_100658018(0, (uint64_t)sub_100FCF480, v6);

  swift_release();

  swift_release();
}

- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_100FCE49C(a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)alwaysBeaconWildStateWithCompletion:(id)a3
{
}

- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = self;
  if (a3)
  {
    id v7 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v9 = 0xF000000000000000;
  }
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v10 = sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_1003AFE84(*v10, sub_100FCF478);
  swift_release();
  sub_100037A24((uint64_t)a3, v9);
}

- (void)poisonBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_1003B04E8((uint64_t)v9, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)repairDataStore:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = self;
  sub_100A55FBC((uint64_t)sub_1006CA9F8, v5);

  swift_release();
}

- (_TtC12searchpartyd23BeaconManagerTrampoline)init
{
  result = (_TtC12searchpartyd23BeaconManagerTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((uint64_t)self + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation);

  swift_release();
}

- (void)bluetoothConnectionKeysFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1007C84EC;
  v8[5] = v7;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)successfulConnectionForUserIdentifier:(id)a3 beaconIdentifier:(id)a4 primaryIndex:(unint64_t)a5 leMAC:(id)a6 ltkIndex:(unint64_t)a7 ltk:(id)a8 completion:(id)a9
{
  v61 = self;
  id v62 = a8;
  unint64_t v65 = a5;
  unint64_t v66 = a7;
  uint64_t v67 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v67 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v67);
  v68 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v53 - v14;
  v54 = (char *)&v53 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v53 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v53 - v19;
  uint64_t v21 = _Block_copy(a9);
  v64 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v18;
  v63 = v18;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v23 = a6;
  id v24 = v62;
  v56 = v61;
  uint64_t v25 = (_TtC12searchpartyd23BeaconManagerTrampoline *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v60 = v26;
  v61 = v25;

  uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v58 = v28;
  uint64_t v59 = v27;

  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = v21;
  id v62 = (id)type metadata accessor for Transaction();
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v30 = v67;
  v29(v15, v20, v67);
  v29(v68, v22, v30);
  uint64_t v31 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v32 = v10;
  uint64_t v57 = v10;
  uint64_t v33 = (v31 + 24) & ~v31;
  uint64_t v34 = (v11 + v31 + v33) & ~v31;
  unint64_t v35 = (v11 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (v37 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v53 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v39 = swift_allocObject();
  v40 = v56;
  *(void *)(v39 + 16) = v56;
  uint64_t v41 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 32);
  v41(v39 + v33, v54, v30);
  v41(v39 + v34, v68, v30);
  *(void *)(v39 + v35) = v65;
  uint64_t v42 = (_TtC12searchpartyd23BeaconManagerTrampoline **)(v39 + v36);
  unint64_t v44 = v60;
  uint64_t v43 = v61;
  *uint64_t v42 = v61;
  v42[1] = (_TtC12searchpartyd23BeaconManagerTrampoline *)v44;
  *(void *)(v39 + v37) = v66;
  uint64_t v45 = (uint64_t *)(v39 + v38);
  unint64_t v47 = v58;
  uint64_t v46 = v59;
  uint64_t *v45 = v59;
  v45[1] = v47;
  uint64_t v48 = (void *)(v39 + v53);
  uint64_t v49 = v55;
  *uint64_t v48 = sub_1001E06E0;
  v48[1] = v49;
  uint64_t v50 = v40;
  sub_1000361E0((uint64_t)v43, v44);
  sub_1000361E0(v46, v47);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v46, v47);
  sub_10001CFB8((uint64_t)v43, v44);

  uint64_t v51 = *(void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v52 = v67;
  v51(v63, v67);
  v51(v64, v52);
}

- (void)leechScannerDiscoveredAdvertisementData:(id)a3 rssi:(int)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  type metadata accessor for Transaction();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = self;
  *(void *)(v10 + 24) = v8;
  *(_DWORD *)(v10 + 32) = a4;
  *(void *)(v10 + 40) = sub_1001E06E0;
  *(void *)(v10 + 48) = v9;
  uint64_t v11 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)pairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  uint64_t v18 = (void *)(v17 + v16);
  void *v18 = sub_1001E06E0;
  v18[1] = v14;
  uint64_t v19 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)unpairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  uint64_t v18 = (void *)(v17 + v16);
  void *v18 = sub_1001E06E0;
  v18[1] = v14;
  uint64_t v19 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)startScanningIncludeServiceCharacterstics:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_100FCB780(a3, (uint64_t)sub_1001E06E0, v7);

  swift_release();
}

- (void)stopScanningWithCompletion:(id)a3
{
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v14);
  id v15 = a3;
  id v16 = a5;
  uint64_t v17 = self;
  sub_1011E910C((uint64_t)v15, (uint64_t)v13, (uint64_t)v17, (uint64_t)v14);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

@end