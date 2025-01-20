@interface TranscriptViewController
- (_TtC7Journal24TranscriptViewController)initWithCoder:(id)a3;
- (_TtC7Journal24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTap:(id)a3;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation TranscriptViewController

- (_TtC7Journal24TranscriptViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100391278();
}

- (void)loadView
{
  v2 = self;
  sub_10038D3A8();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038D868((uint64_t)v4);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038F26C(v4);
}

- (_TtC7Journal24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal24TranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24TranscriptViewController_selectionFeedbackGenerator));
  swift_unknownObjectRelease();
  sub_100390B2C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7Journal24TranscriptViewController_representableAdapter), *(void *)&self->selectionFeedbackGenerator[OBJC_IVAR____TtC7Journal24TranscriptViewController_representableAdapter]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24TranscriptViewController_transcriptTimer));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal24TranscriptViewController_activeSegment, &qword_10080A410);
}

@end