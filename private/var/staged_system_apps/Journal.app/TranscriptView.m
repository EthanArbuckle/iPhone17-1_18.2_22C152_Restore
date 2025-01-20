@interface TranscriptView
- (_TtC7Journal14TranscriptView)initWithCoder:(id)a3;
- (_TtC7Journal14TranscriptView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation TranscriptView

- (_TtC7Journal14TranscriptView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC7Journal14TranscriptView_waitingUIRange;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal14TranscriptView_waitingUIAttachment) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Journal14TranscriptView_shouldShowWaitingUI) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC7Journal14TranscriptView_activeSegmentRange;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtC7Journal14TranscriptView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Journal14TranscriptView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal14TranscriptView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal14TranscriptView_waitingUIAttachment);
}

@end