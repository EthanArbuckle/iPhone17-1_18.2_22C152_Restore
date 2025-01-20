@interface GKOverlayServiceUtils
+ (void)showDashboardWithGame:(id)a3 deepLink:(id)a4 launchContext:(id)a5;
- (GKOverlayServiceUtils)init;
- (void)emitMultiplayerEventWithMessage:(id)a3;
@end

@implementation GKOverlayServiceUtils

+ (void)showDashboardWithGame:(id)a3 deepLink:(id)a4 launchContext:(id)a5
{
  if (a4)
  {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  id v7 = a3;
  static OverlayServiceUtils.showDashboard(game:deepLink:launchContext:)();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)emitMultiplayerEventWithMessage:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  OverlayServiceUtils.emitMultiplayerEvent(message:)(v8);

  swift_bridgeObjectRelease();
}

- (GKOverlayServiceUtils)init
{
  return (GKOverlayServiceUtils *)OverlayServiceUtils.init()();
}

- (void).cxx_destruct
{
}

@end