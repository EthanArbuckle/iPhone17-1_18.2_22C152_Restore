@interface AccessoryFirmwareUpdateManager
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateManager)init;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
@end

@implementation AccessoryFirmwareUpdateManager

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateManager)init
{
  return (_TtC14dockaccessoryd30AccessoryFirmwareUpdateManager *)sub_100149C68();
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10014B644(v6, v7);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  sub_10014C27C(v7, v10, v12);
  sub_1000A6240(v10, (unint64_t)v12);
  return 1;
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_10014C894(v10, (uint64_t)v11, a5, (void *)a6);
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_10014CC28(v8, (uint64_t)v9, a5);
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10014CFB4(v6, a4);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_uarpController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateManager_reachabilityTimer);
}

@end