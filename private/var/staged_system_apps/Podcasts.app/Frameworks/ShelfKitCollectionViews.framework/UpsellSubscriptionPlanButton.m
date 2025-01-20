@interface UpsellSubscriptionPlanButton
- (BOOL)isSelected;
- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation UpsellSubscriptionPlanButton

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(UpsellSubscriptionPlanButton *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = [(UpsellSubscriptionPlanButton *)&v10 isSelected];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(UpsellSubscriptionPlanButton *)&v9 setSelected:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(UpsellSubscriptionPlanButton *)&v8 isSelected]) {
    sub_344294();
  }
}

- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___vStack) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___calloutLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___subtitleLabel) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___vStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___calloutLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___subtitleLabel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton_subscriptionPlan);
}

@end