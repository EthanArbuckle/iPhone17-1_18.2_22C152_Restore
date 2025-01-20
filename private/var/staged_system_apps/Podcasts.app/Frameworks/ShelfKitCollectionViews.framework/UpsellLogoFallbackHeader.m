@interface UpsellLogoFallbackHeader
- (_TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader)initWithCoder:(id)a3;
@end

@implementation UpsellLogoFallbackHeader

- (_TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_backgroundArtworkView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_69328();
  uint64_t v6 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_logoArtworkView;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)sub_69424();
  uint64_t v7 = OBJC_IVAR____TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader_gradientView;
  type metadata accessor for UpsellTitleBarGradientView();
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  result = (_TtC23ShelfKitCollectionViews24UpsellLogoFallbackHeader *)sub_385890();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end