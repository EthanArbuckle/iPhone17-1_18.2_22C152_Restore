@interface Client
- (_TtC12SidecarRelay6Client)init;
- (void)relayDelegateSendDataRequest:(id)a3 completion:(id)a4;
- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4;
- (void)relayDiagnose:(id)a3;
- (void)relayFetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4;
- (void)relayFetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3;
- (void)relayIgnoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4;
- (void)relayIssueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)relayIssueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)relayOptOutOfReconnect:(id)a3;
- (void)relayPresenterServiceExtensionReady:(id)a3;
- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4;
- (void)relayRegisterServicePresenter:(id)a3;
- (void)relayRegisterServiceProvider:(id)a3;
- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4;
- (void)relayServiceProviderReady:(id)a3;
- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6;
- (void)relaySession:(int64_t)a3 closeStream:(id)a4;
- (void)relaySession:(int64_t)a3 closedWithError:(id)a4;
- (void)relaySession:(int64_t)a3 connectStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6;
- (void)relaySession:(int64_t)a3 listenStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6;
- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5;
- (void)relaySession:(int64_t)a3 sendOPACKData:(id)a4 completion:(id)a5;
- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(int64_t)a5;
- (void)relaySession:(int64_t)a3 timeSyncWithCompletion:(id)a4;
- (void)relaySessionClose:(int64_t)a3 error:(id)a4 completion:(id)a5;
- (void)relaySessionDealloc:(id)a3 completion:(id)a4;
- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8;
- (void)relayTerminateService;
@end

@implementation Client

- (_TtC12SidecarRelay6Client)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a4;
  v14 = self;
  sub_1000085F8((uint64_t)v12, (uint64_t)v13, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)relaySession:(int64_t)a3 closedWithError:(id)a4
{
  v5 = self;
  id v6 = a4;
  sub_1000087D4();
}

- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5
{
  id v6 = a4;
  uint64_t v10 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_100008B40();
  sub_1000048D0(v7, v9);
}

- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(int64_t)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = self;
  sub_100008F0C();

  swift_bridgeObjectRelease();
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = self;
  sub_100009014();

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
}

- (void)relayTerminateService
{
  v2 = self;
  sub_1000092E4();
}

- (void)relayIgnoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4
{
}

- (void)relayFetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1000094E8((uint64_t)sub_100013038, v5);

  swift_release();
}

- (void)relayIssueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)relayIssueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)relayFetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = self;
  sub_1000099CC();

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)relayDelegateSendDataRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  *(void *)(swift_allocObject() + 16) = v6;
  sub_100009BB4();
  swift_release();
  sub_1000048D0(v8, v10);
}

- (void)relayRegisterServiceProvider:(id)a3
{
}

- (void)relayRegisterServicePresenter:(id)a3
{
}

- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4
{
}

- (void)relayServiceProviderReady:(id)a3
{
}

- (void)relayOptOutOfReconnect:(id)a3
{
}

- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  unint64_t v9 = self;
  sub_10000A8A0(v6, v8, v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8
{
  v27 = self;
  uint64_t v28 = a7;
  uint64_t v10 = sub_1000116B8(&qword_1000A2EC0);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v27 - v18;
  v20 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  sub_100012E34((uint64_t)v12, v21, 1, v13);
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v20);
  v25 = v27;
  sub_10000AE0C((uint64_t)v19, (uint64_t)v12, v22, v24, (uint64_t)v17, v28, v25, (void (**)(void, void))v20);
  _Block_release(v20);

  swift_bridgeObjectRelease();
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v13);
  sub_1000131C8((uint64_t)v12, &qword_1000A2EC0);
  v26(v19, v13);
}

- (void)relaySessionClose:(int64_t)a3 error:(id)a4 completion:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  unint64_t v9 = self;
  id v10 = a4;
  sub_10000C558(a3, (uint8_t *)a4, v9, (void (**)(void, void))v8);
  _Block_release(v8);
}

- (void)relaySessionDealloc:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_10000CB28((uint64_t)v9, v11, (void (**)(void, void))v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)relaySession:(int64_t)a3 sendOPACKData:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a4;
  uint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_10000D1E8(a3, v10, v12, v13, v8);
  _Block_release(v8);
  sub_1000048D0(v10, v12);
}

- (void)relaySession:(int64_t)a3 connectStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6
{
}

- (void)relaySession:(int64_t)a3 listenStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6
{
}

- (void)relaySession:(int64_t)a3 closeStream:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_10000F934();

  swift_bridgeObjectRelease();
}

- (void)relaySession:(int64_t)a3 timeSyncWithCompletion:(id)a4
{
}

- (void)relayDiagnose:(id)a3
{
}

@end