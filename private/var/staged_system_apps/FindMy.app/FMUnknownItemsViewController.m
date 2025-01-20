@interface FMUnknownItemsViewController
- (_TtC6FindMy28FMUnknownItemsViewController)initWithCoder:(id)a3;
- (_TtC6FindMy28FMUnknownItemsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMUnknownItemsViewController

- (_TtC6FindMy28FMUnknownItemsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_deviceSubscription) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy28FMUnknownItemsViewController_shownLandingView) = 0;
  id v4 = a3;

  result = (_TtC6FindMy28FMUnknownItemsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100435A3C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100435DC4(a3);
}

- (_TtC6FindMy28FMUnknownItemsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy28FMUnknownItemsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end