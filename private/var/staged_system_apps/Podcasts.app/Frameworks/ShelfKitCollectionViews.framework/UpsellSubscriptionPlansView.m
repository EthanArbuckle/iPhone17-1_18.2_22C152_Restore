@interface UpsellSubscriptionPlansView
- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithFrame:(CGRect)a3;
- (void)planButtonTappedWithButton:(id)a3;
@end

@implementation UpsellSubscriptionPlansView

- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_subscriptionPlanButtons) = (Class)_swiftEmptyArrayStorage;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_didSelect);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView *)sub_385890();
  __break(1u);
  return result;
}

- (void)planButtonTappedWithButton:(id)a3
{
  v4 = (char *)a3;
  id v5 = self;
  sub_343608(v4);
}

- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_didSelect);

  sub_27760(v3);
}

@end