@interface LiveSpeechSyncController
- (_TtC13voicebankingd24LiveSpeechSyncController)init;
- (void)dealloc;
- (void)handleCloudPrefsChanged:(id)a3;
@end

@implementation LiveSpeechSyncController

- (_TtC13voicebankingd24LiveSpeechSyncController)init
{
  sub_10001C8B8();
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(LiveSpeechSyncController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_favoritePhrasesPrefObservation);
}

- (void)handleCloudPrefsChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10001D57C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end