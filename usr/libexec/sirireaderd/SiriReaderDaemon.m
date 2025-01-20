@interface SiriReaderDaemon
- (_TtC11sirireaderd16SiriReaderDaemon)init;
- (void)endMediaSessionForIdentifierWithTextIdentifier:(id)a3;
- (void)getPlaybackStatusForIdentifierWithTextIdentifier:(id)a3 reply:(id)a4;
- (void)handlePlaybackInterruptionWithNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pausePlaybackForIdentifierWithTextIdentifier:(id)a3;
- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7;
- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8;
- (void)resumePlaybackForIdentifierWithTextIdentifier:(id)a3;
@end

@implementation SiriReaderDaemon

- (_TtC11sirireaderd16SiriReaderDaemon)init
{
  return (_TtC11sirireaderd16SiriReaderDaemon *)sub_100004B40();
}

- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;
  id v18 = a7;
  v19 = self;
  sub_10000FE28(v9, v11, v12, v14, v15, v17, a7, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;
  id v20 = a7;
  v21 = self;
  sub_10000FE28(v11, v13, v14, v16, v17, v19, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)getPlaybackStatusForIdentifierWithTextIdentifier:(id)a3 reply:(id)a4
{
  v4 = _Block_copy(a4);
  v5 = (objc_class *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)&self->isCurrentlySeeking[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  if (v9
    && (*(objc_class **)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID) == v5
      ? (BOOL v10 = v9 == v8)
      : (BOOL v10 = 0),
        (v10 || (char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = self, (v11 & 1) != 0))
     && *((unsigned char *)&v6->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) == 1))
  {
    int v12 = *((unsigned __int8 *)&v6->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying);
    uint64_t v13 = (void (*)(void *, uint64_t))v4[2];
    uint64_t v14 = v6;
    uint64_t v15 = v4;
    if (v12 == 1) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 3;
    }
  }
  else
  {
    uint64_t v13 = (void (*)(void *, uint64_t))v4[2];
    uint64_t v17 = v6;
    uint64_t v15 = v4;
    uint64_t v16 = 1;
  }
  v13(v15, v16);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

- (void)pausePlaybackForIdentifierWithTextIdentifier:(id)a3
{
}

- (void)resumePlaybackForIdentifierWithTextIdentifier:(id)a3
{
}

- (void)endMediaSessionForIdentifierWithTextIdentifier:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    char v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v17, 0, sizeof(v17));
    id v15 = a5;
    uint64_t v16 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  char v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  uint64_t v13 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_100011628(&qword_10001D2E0, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v14 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  sub_100010D1C(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010C50((uint64_t)v17, &qword_10001D498);
}

- (void)handlePlaybackInterruptionWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10000B750();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000116D4((uint64_t)self + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_instrumentationUtil);
  sub_100010C50((uint64_t)self + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_10001D480);
}

@end