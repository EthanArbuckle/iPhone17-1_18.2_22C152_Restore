@interface BackgroundLockupCollectionViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BackgroundLockupCollectionViewCell

- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication34BackgroundLockupCollectionViewCell *)BackgroundLockupCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication34BackgroundLockupCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  sub_37B314(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  BackgroundLockupCollectionViewCell.frame.setter(x, y, width, height);
}

- (CGRect)bounds
{
  sub_37B314(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  BackgroundLockupCollectionViewCell.bounds.setter(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  BackgroundLockupCollectionViewCell.layoutSubviews()();
}

- (void)clearArtworkCatalogs
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkComponent);
  double v3 = (void *)v2[18];
  double v4 = self;
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
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  BackgroundLockupCollectionViewCell.traitCollectionDidChange(_:)(v9);
}

- (BOOL)isHighlighted
{
  return sub_37B314(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isSelected
{
  return sub_37B314(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (void).cxx_destruct
{
  sub_9289C((uint64_t)self + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkCornerTreatment);
  sub_34BEC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder), *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_lockupImageArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_textStackView));
  swift_release();
  swift_release();

  swift_release();
}

@end