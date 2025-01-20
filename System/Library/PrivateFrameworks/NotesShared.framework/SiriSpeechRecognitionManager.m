@interface SiriSpeechRecognitionManager
- (_TtC11NotesShared28SiriSpeechRecognitionManager)init;
@end

@implementation SiriSpeechRecognitionManager

- (_TtC11NotesShared28SiriSpeechRecognitionManager)init
{
  return (_TtC11NotesShared28SiriSpeechRecognitionManager *)SiriSpeechRecognitionManager.init()();
}

- (void).cxx_destruct
{
  sub_1C3C2A448((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_audioTaskContinuation, &qword_1EA3883D8);
  sub_1C3C2A448((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_inputSequence, &qword_1EA388368);
  sub_1C3C2A448((uint64_t)self + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_inputBuilder, &qword_1EA388360);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared28SiriSpeechRecognitionManager_analyzerFormat);
}

@end