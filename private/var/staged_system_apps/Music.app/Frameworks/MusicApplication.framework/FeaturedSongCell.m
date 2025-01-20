@interface FeaturedSongCell
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication16FeaturedSongCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication16FeaturedSongCell)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setHeadline:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FeaturedSongCell

- (_TtC16MusicApplication16FeaturedSongCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16FeaturedSongCell *)sub_204F18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16FeaturedSongCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_206A04();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_headline);
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v10 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Swift::String v9 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v9._countAndFlagsBits, (uint64_t)v9._object);
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_title);
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v10 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Swift::String v9 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v9._countAndFlagsBits, (uint64_t)v9._object);
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_subtitle);
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v10 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Swift::String v9 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v9._countAndFlagsBits, (uint64_t)v9._object);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_205B24();
}

- (void)clearArtworkCatalogs
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_artworkComponent);
  id v3 = (void *)v2[18];
  v4 = self;
  [v3 clearArtworkCatalogs];
  *(void *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_205E34(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_featuredArtworkCatalog));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_textStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_addButton));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end