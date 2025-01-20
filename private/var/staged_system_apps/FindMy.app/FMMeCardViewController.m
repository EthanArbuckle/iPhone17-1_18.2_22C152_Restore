@interface FMMeCardViewController
- (_TtC6FindMy22FMMeCardViewController)initWithCoder:(id)a3;
- (_TtC6FindMy22FMMeCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMMeCardViewController

- (_TtC6FindMy22FMMeCardViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_selectionSubscription) = 0;
  id v4 = a3;

  result = (_TtC6FindMy22FMMeCardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10033F290(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10033F4C4(a3);
}

- (_TtC6FindMy22FMMeCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy22FMMeCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100028108((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMMeCardViewController_previousSelection);

  swift_release();
}

@end