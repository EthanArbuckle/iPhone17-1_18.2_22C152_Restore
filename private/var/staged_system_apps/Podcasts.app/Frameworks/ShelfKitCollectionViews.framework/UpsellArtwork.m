@interface UpsellArtwork
- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithFrame:(CGRect)a3;
@end

@implementation UpsellArtwork

- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_titleBar;
  type metadata accessor for UpsellTitleBar();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC23ShelfKitCollectionViews13UpsellArtwork *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews13UpsellArtwork)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews13UpsellArtwork *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_titleBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_upsellShowGridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13UpsellArtwork_upsellInformation));

  swift_release();
}

@end