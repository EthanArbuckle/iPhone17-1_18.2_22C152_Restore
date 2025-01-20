@interface LegacyPrimaryButtonView
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView)initWithFrame:(CGRect)a3;
@end

@implementation LegacyPrimaryButtonView

- (_TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView *)sub_EE5B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_EED9C();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView_hStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView_icon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23LegacyPrimaryButtonView_button));

  swift_release();
}

@end