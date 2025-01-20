@interface DeviceManager
+ (_TtC15audioaccessoryd13DeviceManager)singleton;
- (OS_dispatch_queue)clientQueue;
- (_TtC15audioaccessoryd13DeviceManager)init;
- (_TtP15audioaccessoryd14DeviceManaging_)deviceDelegate;
- (_TtP15audioaccessoryd16HMDeviceManaging_)hmDeviceDelegate;
- (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_)aaDeviceDelegate;
- (id)cloudAccountInfo;
- (id)createSoundProfileRecordStagingURL;
- (id)fetchAADeviceRecordSyncWithAddress:(id)a3;
- (id)fetchAAProxCardsInfoSyncWithAddress:(id)a3;
- (id)fetchDeviceSyncWithAddress:(id)a3;
- (id)fetchHMDeviceCloudRecordSyncWithAddress:(id)a3;
- (id)printDebug;
- (void)addAccountMagicKeysWithCloudRecord:(id)a3;
- (void)addDeviceMagicSettingsWithRecord:(id)a3 completion:(id)a4;
- (void)addDeviceSupportInformationWithRecord:(id)a3 completion:(id)a4;
- (void)addDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)addLegacyMagicPairingRecordsWithCloudRecord:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)addSoundProfileRecordWithURL:(id)a3 completion:(id)a4;
- (void)deactivate;
- (void)dealloc;
- (void)deleteAccountMagicKeys;
- (void)deleteLegacyMagicPairingRecordsWithUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)fetchAADeviceRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAAProxCardsInfoWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAccountMagicKeysBlobWithCompletion:(id)a3;
- (void)fetchCached;
- (void)fetchDeviceRecordsWithCompletion:(id)a3;
- (void)fetchDeviceSupportInformationRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchDeviceSupportInformationRecordsWithCompletion:(id)a3;
- (void)fetchDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)fetchHMDeviceCloudRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchLegacyMagicPairingRecordsWithCompletion:(id)a3;
- (void)fetchMagicPairingSettingsRecordsWithCompletion:(id)a3;
- (void)fetchMagicSettingsRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchSoundProfileRecordFromCloudWithCompletion:(id)a3;
- (void)fetchSoundProfileRecordWithCompletion:(id)a3;
- (void)removeAADeviceRecordWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeAAProxCardsInfoWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceMagicSettingsWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceSupportInformationWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)removeHMDeviceCloudRecordWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeSoundProfileRecordWithCompletion:(id)a3;
- (void)resetCachedDataWithCompletion:(id)a3;
- (void)resetCloudDataWithCompletion:(id)a3;
- (void)setAaDeviceDelegate:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setHmDeviceDelegate:(id)a3;
- (void)updateAADeviceRecordWithRecord:(id)a3 completion:(id)a4;
- (void)updateAAProxCardsInfoWithProxCardsInfo:(id)a3 completion:(id)a4;
- (void)updateDeviceMagicSettingsWithMagicPairingSettings:(id)a3 completion:(id)a4;
- (void)updateDeviceSupportInformationWithDevice:(id)a3 completion:(id)a4;
- (void)updateDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)updateHMDeviceCloudRecordInfoWithRecordInfo:(id)a3 completion:(id)a4;
@end

@implementation DeviceManager

- (void)fetchAADeviceRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchAADeviceRecordSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_1000AD784(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)removeAADeviceRecordWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)updateAADeviceRecordWithRecord:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1000AEC14(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

+ (_TtC15audioaccessoryd13DeviceManager)singleton
{
  if (qword_100261880 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10026AB80;

  return (_TtC15audioaccessoryd13DeviceManager *)v2;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue));
}

- (void)setClientQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtP15audioaccessoryd14DeviceManaging_)deviceDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP15audioaccessoryd14DeviceManaging_ *)Strong;
}

- (void)setDeviceDelegate:(id)a3
{
}

- (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_)aaDeviceDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_ *)Strong;
}

- (void)setAaDeviceDelegate:(id)a3
{
}

- (_TtP15audioaccessoryd16HMDeviceManaging_)hmDeviceDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP15audioaccessoryd16HMDeviceManaging_ *)Strong;
}

- (void)setHmDeviceDelegate:(id)a3
{
}

- (_TtC15audioaccessoryd13DeviceManager)init
{
  return (_TtC15audioaccessoryd13DeviceManager *)sub_1000C2470();
}

- (void)dealloc
{
  v2 = self;
  static os_log_type_t.default.getter();
  if (qword_100261940 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DeviceManager();
  [(DeviceManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_firstUnlockStateWatcher));

  swift_release();
  sub_1000D8DD0((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate);
  sub_1000D8DD0((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_hmDeviceDelegate;

  sub_1000D8DD0((uint64_t)v3);
}

- (void)deactivate
{
  v2 = self;
  sub_1000C34D0();
}

- (void)fetchCached
{
  v2 = self;
  sub_1000C368C();
}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
}

- (void)fetchDeviceWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchDeviceSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  v8 = (void *)sub_1000C5E68(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)addAccountMagicKeysWithCloudRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000C66AC(v4);
}

- (void)deleteAccountMagicKeys
{
  v2 = self;
  sub_1000C6A84();
}

- (void)fetchAccountMagicKeysBlobWithCompletion:(id)a3
{
}

- (void)addDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)fetchDeviceSupportInformationRecordsWithCompletion:(id)a3
{
}

- (void)fetchDeviceSupportInformationRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (void)addDeviceSupportInformationWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceSupportInformationWithDevice:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceSupportInformationWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)addLegacyMagicPairingRecordsWithCloudRecord:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  v11 = self;
  sub_1000CD67C(v10, v5, (uint64_t)sub_1000AF2EC, v9);

  swift_release();
}

- (void)deleteLegacyMagicPairingRecordsWithUserInitiated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1000CDAEC(a3, (uint64_t)sub_1000AF2EC, v7);

  swift_release();
}

- (void)fetchLegacyMagicPairingRecordsWithCompletion:(id)a3
{
}

- (void)fetchMagicPairingSettingsRecordsWithCompletion:(id)a3
{
}

- (void)fetchMagicSettingsRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (void)addDeviceMagicSettingsWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceMagicSettingsWithMagicPairingSettings:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceMagicSettingsWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (id)createSoundProfileRecordStagingURL
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_1000D1C54((uint64_t)v6);

  URL._bridgeToObjectiveC()(v8);
  id v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v10;
}

- (void)addSoundProfileRecordWithURL:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = self;
  sub_1000D2070((uint64_t)v9, (uint64_t)sub_1000AF2EC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
}

- (void)fetchSoundProfileRecordFromCloudWithCompletion:(id)a3
{
}

- (void)removeSoundProfileRecordWithCompletion:(id)a3
{
}

- (void)resetCachedDataWithCompletion:(id)a3
{
}

- (void)resetCloudDataWithCompletion:(id)a3
{
}

- (id)cloudAccountInfo
{
  v2 = self;
  uint64_t v3 = sub_1000D48F8();

  return v3;
}

- (id)printDebug
{
  v2 = self;
  uint64_t v3 = sub_1000C2280();
  sub_1000D4C3C(v3);
  swift_release();
  v4._countAndFlagsBits = 2570;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)fetchAAProxCardsInfoWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchAAProxCardsInfoSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_100134CBC(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)removeAAProxCardsInfoWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)updateAAProxCardsInfoWithProxCardsInfo:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1001364CC(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)fetchHMDeviceCloudRecordWithAddress:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = self;
  sub_1001378E8(v6, v8, (uint64_t)sub_1000AF25C, v9, (uint64_t)&unk_10023B2A8, (uint64_t)sub_100139008, (uint64_t)&unk_10023B2C0);

  swift_bridgeObjectRelease();

  swift_release();
}

- (id)fetchHMDeviceCloudRecordSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_10013759C(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)removeHMDeviceCloudRecordWithBluetoothAddress:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = self;
  sub_1001378E8(v6, v8, (uint64_t)sub_1000AF2EC, v9, (uint64_t)&unk_10023B1B8, (uint64_t)sub_100138E4C, (uint64_t)&unk_10023B1D0);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)updateHMDeviceCloudRecordInfoWithRecordInfo:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_100137E3C(v8, (uint64_t)sub_1000AEFE0, v7);

  swift_release();
}

@end