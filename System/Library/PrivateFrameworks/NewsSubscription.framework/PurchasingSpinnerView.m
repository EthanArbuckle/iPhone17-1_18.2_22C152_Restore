@interface PurchasingSpinnerView
- (_TtC16NewsSubscription21PurchasingSpinnerView)init;
- (_TtC16NewsSubscription21PurchasingSpinnerView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription21PurchasingSpinnerView)initWithFrame:(CGRect)a3;
@end

@implementation PurchasingSpinnerView

- (_TtC16NewsSubscription21PurchasingSpinnerView)init
{
  return (_TtC16NewsSubscription21PurchasingSpinnerView *)sub_1BFA8941C();
}

- (_TtC16NewsSubscription21PurchasingSpinnerView)initWithCoder:(id)a3
{
  result = (_TtC16NewsSubscription21PurchasingSpinnerView *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (_TtC16NewsSubscription21PurchasingSpinnerView)initWithFrame:(CGRect)a3
{
  result = (_TtC16NewsSubscription21PurchasingSpinnerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PurchasingSpinnerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PurchasingSpinnerView_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PurchasingSpinnerView_purchasingSpinnerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription21PurchasingSpinnerView_purchasingScrim);
}

@end