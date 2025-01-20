@interface FadedBlurView
- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation FadedBlurView

- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithEffect:(id)a3
{
  id v4 = a3;
  return (_TtC23ShelfKitCollectionViews13FadedBlurView *)sub_23CE6C(a3);
}

- (_TtC23ShelfKitCollectionViews13FadedBlurView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskLayer;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskGradientInPoints) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC23ShelfKitCollectionViews13FadedBlurView *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23D20C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13FadedBlurView_maskLayer));

  swift_bridgeObjectRelease();
}

@end