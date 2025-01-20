@interface SpeechManager
- (_TtC17SequoiaTranslator13SpeechManager)init;
- (void)handleAudioInterruptionWithNotification:(id)a3;
- (void)languageDetectionResult:(id)a3;
- (void)speechActivityDetected;
- (void)speechRecognitionResult:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation SpeechManager

- (void)handleAudioInterruptionWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1001B7DDC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC17SequoiaTranslator13SpeechManager)init
{
  result = (_TtC17SequoiaTranslator13SpeechManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator13SpeechManager_delegate;

  sub_100013384((uint64_t)v3);
}

- (void)languageDetectionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001B8B48(v4, (uint64_t)&unk_1002D1FC0, (uint64_t)sub_1001BB1E0, (uint64_t)&unk_1002D1FD8);
}

- (void)speechRecognitionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001B8B48(v4, (uint64_t)&unk_1002D1F70, (uint64_t)sub_1001BB194, (uint64_t)&unk_1002D1F88);
}

- (void)translatorDidTranslate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001B8B48(v4, (uint64_t)&unk_1002D1F20, (uint64_t)sub_1001BAC28, (uint64_t)&unk_1002D1F38);
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_1001BA2B0((uint64_t)a3);
}

- (void)speechActivityDetected
{
  uint64_t v2 = qword_1002EE630;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100011554(v4, (uint64_t)qword_10030EA98);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Speech activity detected", v6, 2u);
    swift_slowDealloc();
  }
}

@end