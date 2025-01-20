@interface CardStackViewController
- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)popWithCard:(id)a3;
- (void)viewDidLoad;
@end

@implementation CardStackViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1003AE154();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_1003AE630();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003AE72C(v4);
}

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController *)sub_1003AF7A4(v5, v7, a4);
}

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_cardStackView) = 0;
  *(void *)&self->cardStackView[OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_maximumNumberOfCards) = (Class)3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CardStackViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_cardStackView));
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_delegate;

  sub_100092F18((uint64_t)v3);
}

@end