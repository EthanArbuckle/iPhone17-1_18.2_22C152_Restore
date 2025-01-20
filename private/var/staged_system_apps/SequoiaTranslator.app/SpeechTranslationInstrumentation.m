@interface SpeechTranslationInstrumentation
- (_TtC17SequoiaTranslator32SpeechTranslationInstrumentation)init;
@end

@implementation SpeechTranslationInstrumentation

- (_TtC17SequoiaTranslator32SpeechTranslationInstrumentation)init
{
  return (_TtC17SequoiaTranslator32SpeechTranslationInstrumentation *)sub_1001C423C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_localePair));
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_sourceLocale, (uint64_t *)&unk_1002F4110);
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_start;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstResult, &qword_1002F8BA0);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstTranslation, &qword_1002F8BA0);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstTTS, &qword_1002F8BA0);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator32SpeechTranslationInstrumentation_firstLID, &qword_1002F8BA0);
}

@end