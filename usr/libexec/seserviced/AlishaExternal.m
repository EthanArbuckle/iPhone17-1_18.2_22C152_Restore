@interface AlishaExternal
+ (_TtC10seserviced14AlishaExternal)shared;
- (BOOL)isPassiveEntryAvailableFor:(id)a3;
- (BOOL)isPeerConnectedWithClientUUID:(id)a3;
- (_TtC10seserviced14AlishaExternal)init;
- (id)cancelRKERequestWithFunctionIdentifier:(unsigned __int16)a3 keyIdentifier:(id)a4;
- (id)continueExecutingRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6;
- (id)getAllEndpoints;
- (id)getEndpointWithKeyIdentifier:(id)a3;
- (id)getEndpointWithReaderIdentifier:(id)a3;
- (id)getEnduringRKERequestsInProgress;
- (id)getReportsWithIsInternalClient:(BOOL)a3;
- (id)sendPassthroughWithMessage:(id)a3 clientUUID:(id)a4;
- (void)addHighPriorityRequestFor:(id)a3 client:(id)a4;
- (void)onAssertionAcquiredWithIdentifier:(id)a3 for:(id)a4;
- (void)onAssertionReleasedWithIdentifier:(id)a3 for:(id)a4;
- (void)onTrackingCompleteFor:(id)a3;
- (void)pauseRangingFor:(id)a3;
- (void)removeHighPriorityRequestFor:(id)a3 client:(id)a4;
- (void)resetDisconnectionHistoryFor:(id)a3;
- (void)sendDeviceIntentFor:(id)a3;
- (void)sendRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 keyIdentifier:(id)a5 requestType:(unint64_t)a6 enduringRequestHandler:(id)a7 authorization:(id)a8 completion:(id)a9;
- (void)subscribeToVehicleFunctionStatusEventsWithRange:(_NSRange)a3 peerUUID:(id)a4;
- (void)triggerHeadUnitPairingWith:(id)a3 keyIdentifier:(id)a4;
@end

@implementation AlishaExternal

+ (_TtC10seserviced14AlishaExternal)shared
{
  if (qword_1004538A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100468988;

  return (_TtC10seserviced14AlishaExternal *)v2;
}

- (id)getAllEndpoints
{
  sub_10027C76C((uint64_t)self, (uint64_t)a2);
  sub_10007582C(0, (unint64_t *)&qword_100458810);
  sub_1001F7C04();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (id)getEndpointWithKeyIdentifier:(id)a3
{
  return sub_100276A78(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_10027B6D0);
}

- (id)getEndpointWithReaderIdentifier:(id)a3
{
  return sub_100276A78(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_10027BEB4);
}

- (BOOL)isPassiveEntryAvailableFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  LOBYTE(v4) = sub_10027C864(v6, v8);
  sub_10006D144(v6, v8);

  return v4 & 1;
}

- (BOOL)isPeerConnectedWithClientUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  unint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  char v8 = sub_10027CA10((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v8 & 1;
}

- (id)cancelRKERequestWithFunctionIdentifier:(unsigned __int16)a3 keyIdentifier:(id)a4
{
  id v6 = a4;
  unint64_t v7 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  v11 = (void *)sub_10027CBB0(a3, v8, v10);
  sub_10006D144(v8, v10);

  return v11;
}

- (id)continueExecutingRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6
{
  unint64_t v7 = a5;
  if (a5)
  {
    id v11 = a6;
    v12 = self;
    id v13 = v7;
    unint64_t v7 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;
  }
  else
  {
    id v16 = a6;
    v17 = self;
    unint64_t v15 = 0xF000000000000000;
  }
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  v21 = (void *)sub_10027CD70(a3, a4, (uint64_t)v7, v15, v18, v20);
  sub_10006D144(v18, v20);
  sub_100075868((uint64_t)v7, v15);

  return v21;
}

- (id)getReportsWithIsInternalClient:(BOOL)a3
{
  sub_10027CF50(a3);
  sub_10007582C(0, &qword_10045A4A8);
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)sendPassthroughWithMessage:(id)a3 clientUUID:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = (void *)sub_10027D100(v15, v17, (uint64_t)v11);
  sub_10006D144(v15, v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v18;
}

- (id)getEnduringRKERequestsInProgress
{
  uint64_t v3 = type metadata accessor for DispatchPredicate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = qword_100453928;
  uint64_t v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_100468A38;
  *uint64_t v7 = qword_100468A38;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v7, enum case for DispatchPredicate.notOnQueue(_:), v3);
  id v11 = (id)v10;
  LOBYTE(v10) = _dispatchPreconditionTest(_:)();
  id result = (id)(*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v7, v3);
  if (v10)
  {
    sub_10006C51C(&qword_10045A498);
    OS_dispatch_queue.sync<A>(execute:)();

    type metadata accessor for AlishaExternal.RequestInProgress();
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return v13.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)sendRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 keyIdentifier:(id)a5 requestType:(unint64_t)a6 enduringRequestHandler:(id)a7 authorization:(id)a8 completion:(id)a9
{
  uint64_t v14 = _Block_copy(a7);
  uint64_t v15 = _Block_copy(a9);
  id v16 = a5;
  v28 = self;
  id v17 = a8;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  if (v14)
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v14;
    v22 = sub_10027EDBC;
    if (v17)
    {
LABEL_3:
      uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = v24;

      goto LABEL_6;
    }
  }
  else
  {
    v22 = 0;
    uint64_t v21 = 0;
    if (v17) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  unint64_t v25 = 0xF000000000000000;
LABEL_6:
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v15;
  sub_10027D2C0(a3, a4, v18, v20, a6, (uint64_t)v22, v21, v23, v25, (uint64_t)sub_1001D3B88, v26);
  swift_release();
  sub_100075868(v23, v25);
  sub_10008BECC((uint64_t)v22);
  sub_10006D144(v18, v20);
}

- (void)pauseRangingFor:(id)a3
{
}

- (void)onAssertionAcquiredWithIdentifier:(id)a3 for:(id)a4
{
}

- (void)onAssertionReleasedWithIdentifier:(id)a3 for:(id)a4
{
}

- (void)resetDisconnectionHistoryFor:(id)a3
{
}

- (void)subscribeToVehicleFunctionStatusEventsWithRange:(_NSRange)a3 peerUUID:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10027DBD8(location, length, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)addHighPriorityRequestFor:(id)a3 client:(id)a4
{
}

- (void)removeHighPriorityRequestFor:(id)a3 client:(id)a4
{
}

- (void)sendDeviceIntentFor:(id)a3
{
}

- (void)triggerHeadUnitPairingWith:(id)a3 keyIdentifier:(id)a4
{
  uint64_t v5 = a3;
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    id v8 = v5;
    uint64_t v5 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a4;
    id v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  sub_10027E2B8((uint64_t)v5, v10, v13, v15);
  sub_10006D144(v13, v15);
  sub_100075868((uint64_t)v5, v10);
}

- (void)onTrackingCompleteFor:(id)a3
{
}

- (_TtC10seserviced14AlishaExternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AlishaExternal *)&v3 init];
}

@end