@interface HiddenCardViewController
- (_TtC8StocksUI24HiddenCardViewController)init;
- (_TtC8StocksUI24HiddenCardViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI24HiddenCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation HiddenCardViewController

- (_TtC8StocksUI24HiddenCardViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_20A8C8ED0();
  sub_20A8C8970();

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(HiddenCardViewController *)&v6 initWithNibName:0 bundle:0];
}

- (_TtC8StocksUI24HiddenCardViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_20A8C8ED0();
  sub_20A8C8970();

  result = (_TtC8StocksUI24HiddenCardViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI24HiddenCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI24HiddenCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI24HiddenCardViewController_cardViewAppearance;
  uint64_t v4 = sub_20A8C8EE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8StocksUI24HiddenCardViewController_cardViewBehavior;
  uint64_t v6 = sub_20A8C89A0();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end