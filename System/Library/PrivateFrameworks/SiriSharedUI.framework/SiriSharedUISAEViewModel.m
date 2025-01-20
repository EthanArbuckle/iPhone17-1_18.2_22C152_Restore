@interface SiriSharedUISAEViewModel
- (NSArray)conversationTranscriptItems;
- (NSArray)serverUtterances;
- (SiriSharedUISAEUserUtteranceViewModel)userUtterance;
- (SiriSharedUISAEViewModel)init;
- (SiriSharedUISAEViewModel)initWithInputType:(int64_t)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 userUtterance:(id)a6;
- (id)copyWithConversationTranscriptItems:(id)a3 serverUtterances:(id)a4 speechRecognitionHypothesis:(id)a5;
- (id)copyWithInputType:(int64_t)a3;
- (id)copyWithInputType:(int64_t)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 speechRecognitionHypothesis:(id)a6;
- (id)copyWithServerUtterances:(id)a3 speechRecognitionHypothesis:(id)a4;
- (id)copyWithSpeechRecognitionHypothesis:(id)a3;
- (id)copyWithUserUtterance:(id)a3;
- (int64_t)inputType;
@end

@implementation SiriSharedUISAEViewModel

- (int64_t)inputType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_inputType);
}

- (NSArray)conversationTranscriptItems
{
  return (NSArray *)sub_20CA3F1E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SiriSharedUISAEViewModel_conversationTranscriptItems, (unint64_t *)&unk_2676ECB00);
}

- (NSArray)serverUtterances
{
  return (NSArray *)sub_20CA3F1E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SiriSharedUISAEViewModel_serverUtterances, (unint64_t *)&unk_2676ECB70);
}

- (SiriSharedUISAEUserUtteranceViewModel)userUtterance
{
  return (SiriSharedUISAEUserUtteranceViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR___SiriSharedUISAEViewModel_userUtterance));
}

- (SiriSharedUISAEViewModel)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_inputType) = 0;
  v3 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_conversationTranscriptItems) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_serverUtterances) = v3;
  id v4 = objc_allocWithZone((Class)SiriSharedUISAEUserUtteranceViewModel);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_initWithSpeech_latencySummary_shouldShow_taskIdentifier_, 0, 0, 0, 0);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_userUtterance) = v6;

  v8.receiver = v5;
  v8.super_class = (Class)SiriSharedUISAEViewModel;
  return [(SiriSharedUISAEViewModel *)&v8 init];
}

- (SiriSharedUISAEViewModel)initWithInputType:(int64_t)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 userUtterance:(id)a6
{
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB00);
  v9 = (objc_class *)sub_20CA82FB8();
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB70);
  v10 = (objc_class *)sub_20CA82FB8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_inputType) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_conversationTranscriptItems) = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_serverUtterances) = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_userUtterance) = (Class)a6;
  v13.receiver = self;
  v13.super_class = (Class)SiriSharedUISAEViewModel;
  id v11 = a6;
  return [(SiriSharedUISAEViewModel *)&v13 init];
}

- (id)copyWithInputType:(int64_t)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 speechRecognitionHypothesis:(id)a6
{
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB00);
  uint64_t v9 = sub_20CA82FB8();
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB70);
  uint64_t v10 = sub_20CA82FB8();
  id v11 = a6;
  v12 = self;
  id v13 = sub_20CA3F400(a3, v9, v10, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)copyWithConversationTranscriptItems:(id)a3 serverUtterances:(id)a4 speechRecognitionHypothesis:(id)a5
{
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB00);
  sub_20CA82FB8();
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB70);
  sub_20CA82FB8();
  id v7 = a5;
  objc_super v8 = self;
  id v9 = [(SiriSharedUISAEViewModel *)v8 inputType];
  uint64_t v10 = (void *)sub_20CA82FA8();
  id v11 = (void *)sub_20CA82FA8();
  id v12 = [(SiriSharedUISAEViewModel *)v8 copyWithInputType:v9 conversationTranscriptItems:v10 serverUtterances:v11 speechRecognitionHypothesis:v7];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)copyWithInputType:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_20CA3F830(a3);

  return v5;
}

- (id)copyWithSpeechRecognitionHypothesis:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_20CA3F9C0(a3);

  return v7;
}

- (id)copyWithServerUtterances:(id)a3 speechRecognitionHypothesis:(id)a4
{
  sub_20CA20160(0, (unint64_t *)&unk_2676ECB70);
  sub_20CA82FB8();
  v6 = self;
  id v7 = a4;
  id v8 = [(SiriSharedUISAEViewModel *)v6 inputType];
  id v9 = [(SiriSharedUISAEViewModel *)v6 conversationTranscriptItems];
  if (!v9)
  {
    sub_20CA20160(0, (unint64_t *)&unk_2676ECB00);
    sub_20CA82FB8();
    id v9 = (NSArray *)sub_20CA82FA8();
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = (void *)sub_20CA82FA8();
  id v11 = [(SiriSharedUISAEViewModel *)v6 copyWithInputType:v8 conversationTranscriptItems:v9 serverUtterances:v10 speechRecognitionHypothesis:v7];

  swift_bridgeObjectRelease();
  return v11;
}

- (id)copyWithUserUtterance:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_20CA3FDD4(v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModel_userUtterance);
}

@end