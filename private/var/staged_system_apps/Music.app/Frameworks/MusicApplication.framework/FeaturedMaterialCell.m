@interface FeaturedMaterialCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (UIButton)accessibilityPlayButton;
- (_TtC16MusicApplication20FeaturedMaterialCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication20FeaturedMaterialCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation FeaturedMaterialCell

- (_TtC16MusicApplication20FeaturedMaterialCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedMaterialCell *)sub_4A8C64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedMaterialCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4A9DEC();
}

- (BOOL)isHighlighted
{
  return sub_4A9750(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_4A97F8(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_4A9750(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_4A97F8(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FeaturedMaterialCell();
  v2 = (char *)v12.receiver;
  [(VerticalLockupCollectionViewCell *)&v12 layoutSubviews];
  id v3 = [v2 contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_roundedArtworkView] setFrame:v5, v7, v9, v11];
  sub_4A8A68();
  sub_4A8590();
}

- (UIButton)accessibilityPlayButton
{
  v2 = self;
  id v3 = sub_4A841C();

  return (UIButton *)v3;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_roundedArtworkView));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_artworkAspectRatioDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_lockupVideoArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialLoadingView));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_playButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell____lazy_storage___playButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_renderer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialViewSnapshot));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialHighlightOverlayView);
}

@end