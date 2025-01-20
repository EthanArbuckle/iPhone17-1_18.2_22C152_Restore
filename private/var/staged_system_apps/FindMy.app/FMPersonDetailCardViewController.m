@interface FMPersonDetailCardViewController
- (_TtC6FindMy32FMPersonDetailCardViewController)initWithCoder:(id)a3;
- (_TtC6FindMy32FMPersonDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMPersonDetailCardViewController

- (_TtC6FindMy32FMPersonDetailCardViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_conditionsSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMPersonDetailCardViewController_selectionSubscription) = 0;
  id v4 = a3;

  result = (_TtC6FindMy32FMPersonDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1004E85C4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1004E8E30(a3);
}

- (_TtC6FindMy32FMPersonDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy32FMPersonDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end