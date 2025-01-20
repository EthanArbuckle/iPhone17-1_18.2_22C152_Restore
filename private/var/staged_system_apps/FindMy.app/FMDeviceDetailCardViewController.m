@interface FMDeviceDetailCardViewController
- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithCoder:(id)a3;
- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMDeviceDetailCardViewController

- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithCoder:(id)a3
{
  type metadata accessor for FMSelectedSection();
  swift_storeEnumTagMultiPayload();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_selectionSubscription) = 0;
  id v5 = a3;

  result = (_TtC6FindMy32FMDeviceDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000710F8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10007167C(a3);
}

- (_TtC6FindMy32FMDeviceDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy32FMDeviceDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100028108((uint64_t)self + OBJC_IVAR____TtC6FindMy32FMDeviceDetailCardViewController_returnSelection);

  swift_release();
}

@end