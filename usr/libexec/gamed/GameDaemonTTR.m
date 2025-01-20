@interface GameDaemonTTR
- (_TtC14GameDaemonCore13GameDaemonTTR)init;
- (_TtC14GameDaemonCore13GameDaemonTTR)initWithClientProxyBundleIdentifier:(id)a3 localPlayer:(id)a4;
- (id)getURLForExistingMultiplayerRadarWithRadarID:(id)a3;
- (id)getURLForNewMultiplayerRadarWithCallbackIdentifier:(id)a3 descriptionAddition:(id)a4;
@end

@implementation GameDaemonTTR

- (_TtC14GameDaemonCore13GameDaemonTTR)initWithClientProxyBundleIdentifier:(id)a3 localPlayer:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC14GameDaemonCore13GameDaemonTTR *)GameDaemonTTR.init(clientProxyBundleIdentifier:localPlayer:)(v5, v6, a4);
}

- (id)getURLForNewMultiplayerRadarWithCallbackIdentifier:(id)a3 descriptionAddition:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v4)
    {
LABEL_3:
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v4 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  v11 = self;
  v12.value._countAndFlagsBits = v6;
  v12.value._object = v8;
  v13.value._countAndFlagsBits = v9;
  v13.value._object = v4;
  object = GameDaemonTTR.getURLForNewMultiplayerRadar(callbackIdentifier:descriptionAddition:)(v12, v13).value._object;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }

  return v15;
}

- (id)getURLForExistingMultiplayerRadarWithRadarID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = GameDaemonTTR.getURLForExistingMultiplayerRadar(radarID:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (_TtC14GameDaemonCore13GameDaemonTTR)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore13GameDaemonTTR_localPlayer);
}

@end