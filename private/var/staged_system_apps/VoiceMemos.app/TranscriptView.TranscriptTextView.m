@interface TranscriptView.TranscriptTextView
- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithCoder:(id)a3;
- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
@end

@implementation TranscriptView.TranscriptTextView

- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->findInteractionObserver[OBJC_IVAR____TtCC10VoiceMemos14TranscriptView18TranscriptTextView_findInteractionObserver] = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TranscriptView.TranscriptTextView();
  return -[TranscriptView.TranscriptTextView initWithFrame:textContainer:](&v11, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100141D0C();
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100141E9C();
}

- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithCoder:(id)a3
{
  *(void *)&self->findInteractionObserver[OBJC_IVAR____TtCC10VoiceMemos14TranscriptView18TranscriptTextView_findInteractionObserver] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscriptView.TranscriptTextView();
  return [(TranscriptView.TranscriptTextView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end