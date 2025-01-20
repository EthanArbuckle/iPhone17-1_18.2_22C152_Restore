@interface LargeLockupView
- (UIAccessibilityElement)accessibilityPrimaryTitleLabel;
- (UILabel)accessibilityOrdinalLabel;
- (UILabel)accessibilitySecondaryTitleLabel;
- (UILabel)accessibilitySubtitleLabel;
- (UIView)accessibilityArtworkContainer;
- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)subtitleTapped;
@end

@implementation LargeLockupView

- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2120BC();
}

- (void)subtitleTapped
{
  v2 = self;
  sub_2103DC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_210624();
}

- (UILabel)accessibilityOrdinalLabel
{
  v2 = self;
  id v3 = sub_20F4CC();

  return (UILabel *)v3;
}

- (UIAccessibilityElement)accessibilityPrimaryTitleLabel
{
  return (UIAccessibilityElement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_titleAccessibilityLabel));
}

- (UILabel)accessibilitySecondaryTitleLabel
{
  v2 = self;
  id v3 = sub_20F60C(&OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___titleLabel, (uint64_t (*)(void))sub_211F80);

  return (UILabel *)v3;
}

- (UILabel)accessibilitySubtitleLabel
{
  v2 = self;
  id v3 = sub_20F60C(&OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___subtitleLabel, (uint64_t (*)(void))sub_20F66C);

  return (UILabel *)v3;
}

- (UIView)accessibilityArtworkContainer
{
  v2 = self;
  id v3 = sub_20F40C();

  return (UIView *)v3;
}

- (_TtC23ShelfKitCollectionViews15LargeLockupView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews15LargeLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_cachingArtworkView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___artworkContainer));
  sub_FFD98(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_titleAccessibilityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15LargeLockupView_explicitLabel));
  swift_release();

  swift_release();
}

@end