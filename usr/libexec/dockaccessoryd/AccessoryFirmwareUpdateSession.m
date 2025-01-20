@interface AccessoryFirmwareUpdateSession
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateSession)init;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)dealloc;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)socket:(id)a3 didFailWithError:(id)a4;
- (void)socketDidClose:(id)a3;
- (void)socketDidReceiveData:(id)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation AccessoryFirmwareUpdateSession

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socket);
  v4 = self;
  if (v3) {
    [v3 close];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccessoryFirmwareUpdateSession();
  [(AccessoryFirmwareUpdateSession *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_uarpAccessory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_workQueue));
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_socketIdleTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_assetID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_stagedAssetID));
  sub_1000C8D10((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_msgFeedback);
  objc_super v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateSession_profile);
}

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateSession)init
{
  result = (_TtC14dockaccessoryd30AccessoryFirmwareUpdateSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000C1FCC(v6, v7);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  sub_1000C3B10(v7, v10, v12);
  sub_1000A6240(v10, v12);
  return 1;
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = self;
  sub_1000C7FA4(a5, a6);
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1000C43C4(v8, v9, a5);
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1000C594C(v6, a4);
}

- (void)socketDidClose:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1000C83C8();
  swift_unknownObjectRelease();
}

- (void)socket:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v6 = self;
  sub_1000C8648();
  swift_unknownObjectRelease();
}

- (void)socketDidReceiveData:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v5 = self;
  sub_1000C6C38((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1000C88D8();
}

@end