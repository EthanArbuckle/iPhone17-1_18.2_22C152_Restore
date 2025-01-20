@interface ConversationManager
- (_TtC17SequoiaTranslator19ConversationManager)init;
- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4;
- (void)handleAudioInterruptionWithNotification:(id)a3;
- (void)handleResignWithNotification:(id)a3;
- (void)handleRouteChangeWithNotification:(id)a3;
- (void)languageDetectionResult:(id)a3;
- (void)speechActivityDetected;
- (void)speechRecognitionResult:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation ConversationManager

- (_TtC17SequoiaTranslator19ConversationManager)init
{
  swift_getObjectType();
  v4[0] = 0;
  char v5 = 0;
  v2 = (_TtC17SequoiaTranslator19ConversationManager *)sub_1000991D8((uint64_t)v4);
  swift_deallocPartialClassInstance();
  return v2;
}

- (void)handleRouteChangeWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100099408();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)handleAudioInterruptionWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10008DDC4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleResignWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  v8 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v10 == 2)
  {

    sub_10009073C(0, 0, 0);
  }
  else
  {
    sub_10008B9C0((uint64_t)v9);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__useCannedSpeech);
  swift_release();
  swift_release();

  uint64_t v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__sourceLocale;
  uint64_t v5 = sub_100007620(&qword_1002F34A0);
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__targetLocale, v5);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__textTranslationLocale;
  uint64_t v8 = sub_100007620((uint64_t *)&unk_1002F6830);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v6((char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__visualTranslationLocale, v5);
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__state;
  uint64_t v10 = sub_100007620(&qword_1002F34A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__audioLevel;
  uint64_t v12 = sub_100007620((uint64_t *)&unk_1002F3470);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__currentlyPlayingTTS;
  uint64_t v14 = sub_100007620(&qword_1002EF7C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__lastPlayingWord;
  uint64_t v16 = sub_100007620((uint64_t *)&unk_1002F3460);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager_recordingHelper));

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)speechActivityDetected
{
  v2 = self;
  sub_1000958A4();
}

- (void)languageDetectionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100095D14(v4);
}

- (void)speechRecognitionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100096838(v4);
}

- (void)translatorDidTranslate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10009702C(v4);
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_100097868((uint64_t)a3);
}

- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  v11 = self;
  sub_10009A4F4(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end