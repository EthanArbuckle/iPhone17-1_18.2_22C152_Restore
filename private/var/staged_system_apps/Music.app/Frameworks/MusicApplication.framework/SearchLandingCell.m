@interface SearchLandingCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC16MusicApplication17SearchLandingCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication17SearchLandingCell)initWithFrame:(CGRect)a3;
- (id)title;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SearchLandingCell

- (_TtC16MusicApplication17SearchLandingCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication17SearchLandingCell *)sub_416FCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication17SearchLandingCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4185C8();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v7 = v6;
  id v9 = a3;
  v8 = self;
  sub_416F34(v5, v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_417858();
}

- (void)clearArtworkCatalogs
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_artworkComponent);
  id v3 = (void *)v2[18];
  v4 = self;
  [v3 clearArtworkCatalogs];
  *(void *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease();
}

- (BOOL)isHighlighted
{
  return sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isSelected
{
  return sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (id)title
{
  swift_bridgeObjectRetain();
  NSString v0 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return v0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_lockupImageArtworkCatalog));
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_titleLabel);
}

@end