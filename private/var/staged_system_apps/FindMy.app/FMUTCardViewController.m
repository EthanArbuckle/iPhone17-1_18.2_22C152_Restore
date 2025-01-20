@interface FMUTCardViewController
- (_TtC6FindMy22FMUTCardViewController)initWithCoder:(id)a3;
- (_TtC6FindMy22FMUTCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleCloseAction;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMUTCardViewController

- (_TtC6FindMy22FMUTCardViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_selectionSubscription) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_returnSelection;
  uint64_t v6 = type metadata accessor for FMSelectedSection();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_bypassWelcomeScreen) = 0;
  id v7 = a3;

  result = (_TtC6FindMy22FMUTCardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003ED514(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003ED740(a3);
}

- (void)handleCloseAction
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content);
  if (v2)
  {
    id v5 = v2;
    v4 = self;
    sub_100255968();
  }
}

- (_TtC6FindMy22FMUTCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy22FMUTCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1003EE590((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_returnSelection);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMUTCardViewController_content);
}

@end