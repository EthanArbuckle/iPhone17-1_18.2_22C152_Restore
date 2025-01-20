@interface SiriSharedUISAEUserUtteranceViewModel
- (BOOL)shouldShow;
- (NSString)latencySummary;
- (NSString)taskIdentifier;
- (SRUIFSpeechRecognitionHypothesis)speech;
- (SiriSharedUISAEUserUtteranceViewModel)init;
- (SiriSharedUISAEUserUtteranceViewModel)initWithSpeech:(id)a3 latencySummary:(id)a4 shouldShow:(BOOL)a5 taskIdentifier:(id)a6;
- (void)setLatencySummary:(id)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)setSpeech:(id)a3;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation SiriSharedUISAEUserUtteranceViewModel

- (SRUIFSpeechRecognitionHypothesis)speech
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_speech);
  swift_beginAccess();
  return (SRUIFSpeechRecognitionHypothesis *)*v2;
}

- (void)setSpeech:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_speech);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)latencySummary
{
  return (NSString *)sub_20CA38AF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_latencySummary);
}

- (void)setLatencySummary:(id)a3
{
}

- (BOOL)shouldShow
{
  v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_shouldShow;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShow:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_shouldShow;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)taskIdentifier
{
  return (NSString *)sub_20CA38AF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUISAEUserUtteranceViewModel_taskIdentifier);
}

- (void)setTaskIdentifier:(id)a3
{
}

- (SiriSharedUISAEUserUtteranceViewModel)initWithSpeech:(id)a3 latencySummary:(id)a4 shouldShow:(BOOL)a5 taskIdentifier:(id)a6
{
  uint64_t v6 = (uint64_t)a6;
  if (!a4)
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = sub_20CA82F08();
  uint64_t v11 = v10;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = sub_20CA82F08();
  uint64_t v13 = v12;
LABEL_6:
  id v14 = a3;
  v15 = (SiriSharedUISAEUserUtteranceViewModel *)sub_20CA390D8(a3, v9, v11, a5, v6, v13);

  return v15;
}

- (SiriSharedUISAEUserUtteranceViewModel)init
{
  result = (SiriSharedUISAEUserUtteranceViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end