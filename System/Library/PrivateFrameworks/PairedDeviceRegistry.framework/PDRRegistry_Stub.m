@interface PDRRegistry_Stub
+ (BOOL)supportsPairedDevice;
+ (id)sharedInstance;
- (BOOL)isPaired;
- (BOOL)removeDelegate:(id)a3;
- (BOOL)started;
- (OS_dispatch_queue)callbackQueue;
- (PDRRegistry_Stub)init;
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
- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4;
- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6;
- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PDRRegistry_Stub

- (PDRRegistry_Stub)init
{
  return (PDRRegistry_Stub *)Registry_Stub.init()();
}

- (BOOL)started
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_);
}

- (int64_t)status
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_status_);
}

- (OS_dispatch_queue)callbackQueue
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Registry_Stub();
  v2 = [(PDRRegistry *)&v4 callbackQueue];
  return v2;
}

- (void)setCallbackQueue:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_amSingleton) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for Registry_Stub();
    [(PDRRegistry *)&v4 setCallbackQueue:a3];
  }
}

- (int64_t)compatibilityState
{
  return 0;
}

+ (id)sharedInstance
{
  if (one-time initialization token for sharedInstance_ != -1) {
    swift_once();
  }
  v2 = (void *)static Registry_Stub.sharedInstance_;
  return v2;
}

+ (BOOL)supportsPairedDevice
{
  return 0;
}

- (void)start
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *((unsigned char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_) = 1;
  }
}

- (void)stop
{
}

- (id)getDevicesExcluding:(unint64_t)a3
{
  type metadata accessor for PDRDevice();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  return v3.super.isa;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  return 0;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  return 0;
}

- (id)getActiveDevice
{
  return 0;
}

- (id)pairingStorePath
{
  return 0;
}

- (id)pairingID
{
  return 0;
}

- (BOOL)isPaired
{
  return 0;
}

- (void)addDelegate:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v4 = self;
  Registry_Stub.add(delegate:)();
  swift_unknownObjectRelease();
}

- (BOOL)removeDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  char v6 = Registry_Stub.remove(delegate:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)switchIndex
{
  return 0;
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  objc_super v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (id)unpairWithDevice:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (id)failsafeUnpairWithOptions:(id)a3
{
  return 0;
}

- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4
{
  char v6 = _Block_copy(a4);
  v7 = (void (*)(void *, void, void))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);
}

- (int64_t)lastSyncSwitchIndex
{
  return 0;
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  v9 = (void (*)(void *, void))v8[2];
  id v10 = a5;
  v11 = self;
  v9(v8, 0);
  _Block_release(v8);
}

- (int64_t)maxPairedDeviceCount
{
  return 0;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  return 0;
}

@end