@interface SDB389SetupAgent
+ (_TtC16DaemoniOSLibrary16SDB389SetupAgent)shared;
- (CUXPCAgentConnection)nfcXPCCnx;
- (OS_dispatch_queue)queue;
- (_TtC16DaemoniOSLibrary16SDB389SetupAgent)init;
- (uint64_t)contactIDForEmailHash:(uint64_t)a3 phoneHash:(uint64_t)a4 completion:(void *)aBlock;
- (uint64_t)openSetupURL:(uint64_t)a3 completion:(const void *)a4;
- (void)activate;
- (void)advertisingB389Found:(id)a3;
- (void)advertisingB389Lost:(id)a3;
- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5;
- (void)dismissNFCPrompt;
- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5;
- (void)getDeviceAssets:(id)a3 completion:(id)a4;
- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)retriggerProximitySetup:(id)a3;
- (void)setAudioRoutingScore:(int)a3 completion:(id)a4;
- (void)setNfcXPCCnx:(id)a3;
- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5;
- (void)showNFCPromptWithConfig:(id)a3 responseHandler:(id)a4;
- (void)updateNFCPromptConfig:(id)a3 responseHandler:(id)a4;
@end

@implementation SDB389SetupAgent

+ (_TtC16DaemoniOSLibrary16SDB389SetupAgent)shared
{
  if (qword_10096A180 != -1) {
    swift_once();
  }
  v2 = (void *)static SDB389SetupAgent.shared;

  return (_TtC16DaemoniOSLibrary16SDB389SetupAgent *)v2;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_queue));
}

- (_TtC16DaemoniOSLibrary16SDB389SetupAgent)init
{
  return (_TtC16DaemoniOSLibrary16SDB389SetupAgent *)sub_1006B2698();
}

- (void)activate
{
  v2 = self;
  SDB389SetupAgent.activate()();
}

- (void)advertisingB389Found:(id)a3
{
  id v4 = a3;
  v5 = self;
  SDB389SetupAgent.advertisingB389Found(_:)(v4);
}

- (void)advertisingB389Lost:(id)a3
{
  uint64_t v5 = sub_10000A844(&qword_100974EA0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  SDB389SetupAgent.advertisingB389Lost(_:)((uint64_t)v7);

  sub_10000A7E8((uint64_t)v7, &qword_100974EA0);
}

- (void)showNFCPromptWithConfig:(id)a3 responseHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  _s16DaemoniOSLibrary16SDB389SetupAgentC23showNFCPromptWithConfig_15responseHandlerySo06SFB389G13ConfigurationC_ys5Error_pSg_SdSo0L11NFCResponseVtctF_0(v7);
  _Block_release(v6);
}

- (CUXPCAgentConnection)nfcXPCCnx
{
  return (CUXPCAgentConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx));
}

- (void)setNfcXPCCnx:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx) = (Class)a3;
  id v3 = a3;
}

- (void)updateNFCPromptConfig:(id)a3 responseHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1006BA210;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  SDB389SetupAgent.updateNFCPromptConfig(_:responseHandler:)(a3, (uint64_t)v6, v7);
  sub_1002CA430((uint64_t)v6);
}

- (void)dismissNFCPrompt
{
  v2 = self;
  SDB389SetupAgent.updateNFCPromptConfig(_:responseHandler:)(0, 0, 0);
  id v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcConfig);
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcConfig) = 0;
}

- (void).cxx_destruct
{
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcResponseHandler));

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx);
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v8 = self;
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (uint64_t)contactIDForEmailHash:(uint64_t)a3 phoneHash:(uint64_t)a4 completion:(void *)aBlock
{
  id v8 = _Block_copy(aBlock);
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a1;
  _Block_release(v8);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  uint64_t v5 = _Block_copy(a5);

  _Block_release(v5);
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v5 = _Block_copy(a5);

  _Block_release(v5);
}

- (void)retriggerProximitySetup:(id)a3
{
  id v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v7 = sub_10000A844(&qword_100974EA0);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  if (a4)
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
  _Block_release(v10);
  sub_10000A7E8((uint64_t)v9, &qword_100974EA0);
}

- (uint64_t)openSetupURL:(uint64_t)a3 completion:(const void *)a4
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_release(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SDB389SetupAgent.remoteAlertHandleDidActivate(_:)(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  sub_1006B9CC4((uint64_t)a4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SDB389SetupAgent.remoteAlertHandleDidDeactivate(_:)(v4);
}

@end