@interface UpsellArtworkGrid
- (_TtC16MusicApplication17UpsellArtworkGrid)initWithCoder:(id)a3;
- (_TtC16MusicApplication17UpsellArtworkGrid)initWithFrame:(CGRect)a3;
@end

@implementation UpsellArtworkGrid

- (_TtC16MusicApplication17UpsellArtworkGrid)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworks) = (Class)_swiftEmptyArrayStorage;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication17UpsellArtworkGrid_artworkCachingReference;
  type metadata accessor for Artwork.Caching.Reference();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)swift_allocObject();
  id v6 = a3;

  result = (_TtC16MusicApplication17UpsellArtworkGrid *)sub_AB8280();
  __break(1u);
  return result;
}

- (_TtC16MusicApplication17UpsellArtworkGrid)initWithFrame:(CGRect)a3
{
  result = (_TtC16MusicApplication17UpsellArtworkGrid *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end