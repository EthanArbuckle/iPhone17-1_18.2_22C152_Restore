@interface SRSSSpeechRecognitionPhoneticChecker
- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)init;
- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)initWithLocaleIdentifier:(id)a3;
- (id)guessesForString:(id)a3 maxResults:(int64_t)a4;
- (id)guessesForString:(id)a3 maxResults:(int64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6;
@end

@implementation SRSSSpeechRecognitionPhoneticChecker

- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)initWithLocaleIdentifier:(id)a3
{
  return (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *)SRSSSpeechRecognitionPhoneticChecker.init(localeIdentifier:)();
}

- (id)guessesForString:(id)a3 maxResults:(int64_t)a4
{
  uint64_t v6 = sub_25E339720();
  uint64_t v8 = v7;
  v9 = self;
  sub_25E31AB1C(v6, v8, a4);

  swift_bridgeObjectRelease();
  sub_25E31BFA8();
  v10 = (void *)sub_25E3397C0();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)guessesForString:(id)a3 maxResults:(int64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6
{
  uint64_t v8 = sub_25E339720();
  uint64_t v10 = v9;
  v11 = self;
  sub_25E31AB1C(v8, v10, a4);

  swift_bridgeObjectRelease();
  sub_25E31BFA8();
  v12 = (void *)sub_25E3397C0();
  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker)init
{
  result = (_TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC30SpeechRecognitionSharedSupport36SRSSSpeechRecognitionPhoneticChecker_logger;
  uint64_t v4 = sub_25E339670();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end