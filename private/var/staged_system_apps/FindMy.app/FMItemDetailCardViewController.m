@interface FMItemDetailCardViewController
- (_TtC6FindMy30FMItemDetailCardViewController)initWithCoder:(id)a3;
- (_TtC6FindMy30FMItemDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMItemDetailCardViewController

- (_TtC6FindMy30FMItemDetailCardViewController)initWithCoder:(id)a3
{
  type metadata accessor for FMSelectedSection();
  swift_storeEnumTagMultiPayload();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_selectionSubscription) = 0;
  id v5 = a3;

  result = (_TtC6FindMy30FMItemDetailCardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003EF1AC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003EF6E4(a3);
}

- (_TtC6FindMy30FMItemDetailCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy30FMItemDetailCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100028108((uint64_t)self + OBJC_IVAR____TtC6FindMy30FMItemDetailCardViewController_returnSelection);

  swift_release();
}

@end