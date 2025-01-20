@interface AccessoryManager
- (BOOL)isPaired:(id)a3;
- (BOOL)isPerformingGeneralScan;
- (_TtC14dockaccessoryd16AccessoryManager)init;
- (id)cachedAccessoryForIdentifier:(id)a3;
- (id)pairSetupSession:(id)a3 pairSetupType:(unint64_t)a4 enhancedEncryption:(BOOL)a5;
- (void)connectToBTLEAccessoryServer:(id)a3;
- (void)deRegisterAccessoryWithIdentifier:(id)a3;
- (void)disconnectFromBTLEAccessoryServer:(id)a3;
- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3;
- (void)pauseScans;
- (void)removeCachedAccessoryWithIdentifier:(id)a3;
- (void)saveCacheToDisk:(id)a3;
- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4;
- (void)startDiscoveringAccessoryServers;
- (void)stopDiscoveringAccessoryServers;
- (void)updateBroadcastKeyForIdentifer:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6;
- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4;
@end

@implementation AccessoryManager

- (_TtC14dockaccessoryd16AccessoryManager)init
{
  return (_TtC14dockaccessoryd16AccessoryManager *)sub_1000D05C8();
}

- (void)startDiscoveringAccessoryServers
{
  v2 = self;
  sub_1000DDB0C();
}

- (void)stopDiscoveringAccessoryServers
{
  v2 = self;
  sub_1000DDB60();
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
}

- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3
{
}

- (void)connectToBTLEAccessoryServer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000EA5D8("HAP requested BLE connect, ignoring.");
}

- (void)disconnectFromBTLEAccessoryServer:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000DE38C(a3);
}

- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_1000DE89C(a3, a4);
}

- (id)cachedAccessoryForIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  v8 = (void *)sub_1000DEB48(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)removeCachedAccessoryWithIdentifier:(id)a3
{
}

- (void)saveCacheToDisk:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000E00BC(a3);
}

- (void)updateBroadcastKeyForIdentifer:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v7 = a4;
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
    if (v7)
    {
LABEL_3:
      id v12 = v7;
      id v13 = a5;
      v14 = self;
      id v7 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v16 = v15;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  id v17 = a5;
  v18 = self;
  unint64_t v16 = 0xF000000000000000;
LABEL_6:
  sub_1000EA738(v9, v11, "updateBroadcastKey(%s)");
  sub_1000A9990((uint64_t)v7, v16);

  swift_bridgeObjectRelease();
}

- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a4;
  unint64_t v10 = self;
  sub_1000E0FE4(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)pauseScans
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager__performingGeneralScan) = 0;
  uint64_t v2 = qword_1002A7C20;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_1000EAB90();
}

- (BOOL)isPerformingGeneralScan
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager__performingGeneralScan);
}

- (BOOL)isPaired:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  BOOL v8 = sub_1000E1660(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)pairSetupSession:(id)a3 pairSetupType:(unint64_t)a4 enhancedEncryption:(BOOL)a5
{
  id v9 = a3;
  unint64_t v10 = self;
  unint64_t v11 = sub_1000EA960(a3, a4, a5);
  swift_unknownObjectRetain();

  return v11;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_cachePath, &qword_1002A7F70);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_firmwareUpdateManager));

  swift_release();
  swift_release();

  uint64_t v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_dockStatus;
  uint64_t v6 = type metadata accessor for DockStatus();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_deviceConnectionTimer);
}

@end