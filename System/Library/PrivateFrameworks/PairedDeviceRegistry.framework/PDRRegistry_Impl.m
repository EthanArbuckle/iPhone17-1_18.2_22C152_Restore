@interface PDRRegistry_Impl
+ (BOOL)supportsWatch;
+ (id)sharedInstance;
- (BOOL)isPaired;
- (BOOL)removeDelegate:(id)a3;
- (BOOL)started;
- (OS_dispatch_queue)callbackQueue;
- (PDRRegistry_Impl)init;
- (id)deviceForBluetoothID:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (id)failsafeUnpairWithOptions:(id)a3;
- (id)getActiveDevice;
- (id)getActivePairedDeviceExcludingAltAccount;
- (id)getActivePairedDeviceIncludingAltAccount;
- (id)getDevicesExcluding:(unint64_t)a3;
- (id)pairingID;
- (id)pairingStorePath;
- (id)unpairWithDevice:(id)a3 withOptions:(id)a4;
- (int64_t)compatibilityState;
- (int64_t)lastSyncSwitchIndex;
- (int64_t)maxPairedDeviceCount;
- (int64_t)maxTinkerPairedDeviceCount;
- (int64_t)migrationCountForPairingID:(id)a3;
- (int64_t)status;
- (int64_t)switchIndex;
- (void)addDelegate:(id)a3;
- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4;
- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4;
- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6;
- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)waitForPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
@end

@implementation PDRRegistry_Impl

- (BOOL)started
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_started_);
}

+ (id)sharedInstance
{
  if (one-time initialization token for sharedInstance_ != -1) {
    swift_once();
  }
  v2 = (void *)static Registry_Impl.sharedInstance_;
  return v2;
}

- (void)start
{
  v2 = self;
  Registry_Impl.start()();
}

- (OS_dispatch_queue)callbackQueue
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Registry_Impl();
  v2 = [(PDRRegistry *)&v4 callbackQueue];
  return v2;
}

- (id)pairingID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  id v7 = [(PDRRegistry_Impl *)v6 getActiveDevice];
  if (v7)
  {
    v8 = v7;
    id v9 = objc_msgSend(v7, sel_pairingID);

    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = *(void *)(v10 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = *(void *)(v10 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
  }

  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v5, v10);
  }
  return isa;
}

- (id)getActiveDevice
{
  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(6);
  uint64_t v4 = v3;

  return v4;
}

- (void)addDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  Registry_Impl.add(delegate:)();
  swift_unknownObjectRelease();
}

- (id)getDevicesExcluding:(unint64_t)a3
{
  specialized Registry_Impl.getDevicesExcluding(_:)(a3);
  type metadata accessor for PDRDevice();
  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (void)setCallbackQueue:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_amSingleton) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for Registry_Impl();
    [(PDRRegistry *)&v4 setCallbackQueue:a3];
  }
}

- (PDRRegistry_Impl)init
{
  return (PDRRegistry_Impl *)Registry_Impl.init()();
}

+ (BOOL)supportsWatch
{
  if (one-time initialization token for supportWatch != -1) {
    swift_once();
  }
  return static RegistryCrux.supportWatch;
}

- (int64_t)status
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_status_);
}

- (int64_t)compatibilityState
{
  v2 = self;
  Registry_Impl.computeCompatibilityState()();
  int64_t v4 = v3;

  return v4;
}

- (void)stop
{
  v2 = self;
  Registry_Impl.stop()();
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(7);
  int64_t v4 = v3;

  return v4;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(39);
  int64_t v4 = v3;

  return v4;
}

- (id)pairingStorePath
{
  v2 = self;
  id v3 = [(PDRRegistry_Impl *)v2 getActiveDevice];
  if (v3
    && (int64_t v4 = v3, v5 = objc_msgSend(v3, sel_pairingStorePath), v4, v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    id v9 = (void *)MEMORY[0x25A2CA820](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {

    id v9 = 0;
  }
  return v9;
}

- (BOOL)isPaired
{
  v2 = self;
  id v3 = [(PDRRegistry_Impl *)v2 getDevicesExcluding:1];
  type metadata accessor for PDRDevice();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 != 0;
}

- (BOOL)removeDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = Registry_Impl.remove(delegate:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)switchIndex
{
  v2 = self;
  if ([(PDRRegistry_Impl *)v2 isPaired])
  {
    if (one-time initialization token for instance != -1) {
      swift_once();
    }
    swift_retain();
    Swift::Int v3 = RegistryCrux.switchIndex()();

    swift_release();
    return v3;
  }
  else
  {

    return 0;
  }
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  specialized Registry_Impl.getSwitchEvents(after:process:)(a3, (char *)v7, (char *)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (id)deviceForBluetoothID:(id)a3
{
  return @objc Registry_Impl.device(forBluetoothID:)(self, (uint64_t)a2, (uint64_t)a3, closure #1 in Registry_Impl.device(forBluetoothID:)partial apply);
}

- (id)deviceForPairingID:(id)a3
{
  return @objc Registry_Impl.device(forBluetoothID:)(self, (uint64_t)a2, (uint64_t)a3, closure #1 in Registry_Impl.device(forPairingID:)partial apply);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (id)unpairWithDevice:(id)a3 withOptions:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = one-time initialization token for instance;
  id v11 = a3;
  v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  swift_retain();
  id v13 = objc_msgSend(v11, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v14 = RegistryCrux.unpair(pairingID:options:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_bridgeObjectRelease();
  if (v14)
  {
    v15 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)failsafeUnpairWithOptions:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = one-time initialization token for instance;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v6 = RegistryCrux.failsafeUnpair(options:)();

  swift_bridgeObjectRelease();
  swift_release();
  if (v6)
  {
    uint64_t v7 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  specialized Registry_Impl.setActive(device:results:)(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (int64_t)lastSyncSwitchIndex
{
  uint64_t v2 = one-time initialization token for instance;
  Swift::Int v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_retain();
  Swift::Int v4 = RegistryCrux.lastSyncSwitchIndex()();

  swift_release();
  return v4;
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = one-time initialization token for instance;
  id v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  swift_retain();
  int64_t v10 = RegistryCrux.migrationCount(pairingID:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (void)waitForPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  id v9 = self;
  specialized Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  uint64_t v5 = (void (**)(void *, void, void *))_Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = one-time initialization token for instance;
  int64_t v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  swift_retain();
  char v11 = RegistryCrux.completeRTCPairingMetric(metricID:)(v6, v8);
  id v13 = v12;
  swift_release();
  if (v13) {
    uint64_t v14 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v14 = 0;
  }
  v5[2](v5, v11 & 1, v14);

  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  uint64_t v8 = (void (**)(void *, void *))_Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = one-time initialization token for instance;
  id v16 = a5;
  uint64_t v17 = self;
  if (v15 != -1) {
    swift_once();
  }
  swift_retain();
  v18 = RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(v9, v11, v12, v14, v16);
  swift_release();
  if (v18) {
    v19 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    v19 = 0;
  }
  v8[2](v8, v19);

  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)maxPairedDeviceCount
{
  return 5;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  return 5;
}

@end