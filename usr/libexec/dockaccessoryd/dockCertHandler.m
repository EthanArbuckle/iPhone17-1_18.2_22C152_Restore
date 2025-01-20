@interface dockCertHandler
- (_TtC14dockaccessoryd15dockCertHandler)init;
- (void)dumpStateWithCompletion:(id)a3;
- (void)getAccessoryDescriptionWithInfo:(id)a3 completion:(id)a4;
- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5;
- (void)haltWithInfo:(id)a3 completion:(id)a4;
- (void)manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 completion:(id)a5;
- (void)rebootWithInfo:(id)a3 completion:(id)a4;
- (void)returnToBaseWithInfo:(id)a3 completion:(id)a4;
- (void)unpairAccessoryWithInfo:(id)a3 completion:(id)a4;
@end

@implementation dockCertHandler

- (_TtC14dockaccessoryd15dockCertHandler)init
{
  return (_TtC14dockaccessoryd15dockCertHandler *)sub_10009A9C0();
}

- (void)unpairAccessoryWithInfo:(id)a3 completion:(id)a4
{
}

- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1000A67A4();
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  id v9 = a3;
  v10 = self;
  sub_10009F730(a3, v8, v10, (void (**)(const void *, uint64_t, void *))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = v8;
  v10 = (void (*)(char *, uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1000A0AA0(v7, v9, v10, v12, (char *)v13, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)haltWithInfo:(id)a3 completion:(id)a4
{
}

- (void)rebootWithInfo:(id)a3 completion:(id)a4
{
}

- (void)dumpStateWithCompletion:(id)a3
{
  v4 = (void (**)(void *, NSString, void))_Block_copy(a3);
  v6 = self;
  sub_1001E5BA0();
  NSString v5 = String._bridgeToObjectiveC()();
  v4[2](v4, v5, 0);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)getAccessoryDescriptionWithInfo:(id)a3 completion:(id)a4
{
}

- (void)returnToBaseWithInfo:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10009EF84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_fwUpdateProxy), *(void **)&self->fwUpdateProxy[OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_fwUpdateProxy]);
  NSString v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_fwUpdateTimer);
}

@end