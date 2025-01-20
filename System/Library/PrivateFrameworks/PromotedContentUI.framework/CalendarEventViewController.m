@interface CalendarEventViewController
- (_TtC17PromotedContentUI27CalendarEventViewController)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI27CalendarEventViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CalendarEventViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5CFE7D4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1B5CFEF64(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B5CFF604(a3);
}

- (_TtC17PromotedContentUI27CalendarEventViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5D001A8();
}

- (_TtC17PromotedContentUI27CalendarEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17PromotedContentUI27CalendarEventViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_actionResult;
  uint64_t v4 = sub_1B5DB9E88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_eventStore));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5CEF924((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_backgroundedTime, (uint64_t *)&unk_1EB8493A0);
  v5 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI27CalendarEventViewController_actionDelegate;
  sub_1B5CF6804((uint64_t)v5);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B5D00304(a4);
}

@end