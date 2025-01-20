@interface FMInitialCardController
- (_TtC6FindMy23FMInitialCardController)initWithCoder:(id)a3;
- (_TtC6FindMy23FMInitialCardController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMInitialCardController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100012E84(a3);
}

- (_TtC6FindMy23FMInitialCardController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy23FMInitialCardController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy23FMInitialCardController_discoveryCoordinator) = 0;
  id v4 = a3;

  result = (_TtC6FindMy23FMInitialCardController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100480E00(a3);
}

- (_TtC6FindMy23FMInitialCardController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy23FMInitialCardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy23FMInitialCardController_discoveryCoordinator);
}

@end