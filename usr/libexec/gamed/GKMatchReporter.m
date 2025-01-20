@interface GKMatchReporter
+ (GKMatchReporter)shared;
+ (void)onInviteReceivedWithBulletin:(id)a3;
- (GKMatchReporter)init;
- (void)recordActiveDevicesWithCount:(id)a3;
- (void)recordGameCompleteWithCompletion:(id)a3;
- (void)recordGameStart;
- (void)recordMatchCompleteWithMatchType:(id)a3 result:(id)a4 completion:(id)a5;
- (void)recordMatchServerWithType:(id)a3;
- (void)recordMatchStartWithType:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5;
- (void)recordSharePlayDevicesWithCount:(id)a3;
@end

@implementation GKMatchReporter

+ (GKMatchReporter)shared
{
  id matched = static MatchReporter.shared.getter();

  return (GKMatchReporter *)matched;
}

- (GKMatchReporter)init
{
  return (GKMatchReporter *)sub_1001C9384();
}

- (void)recordMatchStartWithType:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  MatchReporter.recordMatchStart(type:minPlayers:maxPlayers:)(v14, (NSNumber)v11, (NSNumber)v12);

  swift_bridgeObjectRelease();
}

- (void)recordMatchServerWithType:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  MatchReporter.recordMatchServer(type:)(v8);

  swift_bridgeObjectRelease();
}

- (void)recordActiveDevicesWithCount:(id)a3
{
  id v4 = a3;
  v5 = self;
  MatchReporter.recordActiveDevices(count:)((NSNumber)v4);
}

- (void)recordSharePlayDevicesWithCount:(id)a3
{
  id v4 = a3;
  v5 = self;
  MatchReporter.recordSharePlayDevices(count:)((NSNumber)v4);
}

- (void)recordMatchCompleteWithMatchType:(id)a3 result:(id)a4 completion:(id)a5
{
  Swift::String v8 = _Block_copy(a5);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  *(void *)(swift_allocObject() + 16) = v8;
  v9 = self;
  MatchReporter.recordMatchComplete(matchType:result:completion:)();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)recordGameStart
{
  v2 = self;
  MatchReporter.recordGameStart()();
}

- (void)recordGameCompleteWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  MatchReporter.recordGameComplete(completion:)();

  swift_release();
}

+ (void)onInviteReceivedWithBulletin:(id)a3
{
  id v3 = a3;
  static MatchReporter.onInviteReceived(bulletin:)();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMatchReporter_matchQueue);
}

@end