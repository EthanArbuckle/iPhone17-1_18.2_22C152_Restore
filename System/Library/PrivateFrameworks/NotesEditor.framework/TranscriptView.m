@interface TranscriptView
- (BOOL)supportsTextReplacement;
- (NSArray)accessibilityElements;
- (_TtC11NotesEditor14TranscriptView)initWithCoder:(id)a3;
- (_TtC11NotesEditor14TranscriptView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation TranscriptView

- (_TtC11NotesEditor14TranscriptView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor14TranscriptView_scrollAnimationDuration) = (Class)0x3FD0000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC11NotesEditor14TranscriptView_bottomInset) = (Class)0x4035000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC11NotesEditor14TranscriptView_padding) = (Class)0x4018000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor14TranscriptView_summaryButton) = 0;
  id v5 = a3;

  result = (_TtC11NotesEditor14TranscriptView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (BOOL)supportsTextReplacement
{
  return 0;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_20C127390((uint64_t)v8, (uint64_t)v6);
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_20C1274B8(v8, (uint64_t)v6);
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_20C129948();

  if (v3)
  {
    v4 = (void *)sub_20C162CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    sub_20C162CF0();
    v4 = self;
    id v5 = (void *)sub_20C162CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = self;
    id v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TranscriptView();
  [(TranscriptView *)&v7 setAccessibilityElements:v5];
}

- (_TtC11NotesEditor14TranscriptView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor14TranscriptView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor14TranscriptView_summaryButton);
}

@end