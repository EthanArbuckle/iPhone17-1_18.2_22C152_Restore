@interface VerticalLockupCollectionViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation VerticalLockupCollectionViewCell

- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication32VerticalLockupCollectionViewCell *)VerticalLockupCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication32VerticalLockupCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  sub_38FBC8(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  VerticalLockupCollectionViewCell.frame.setter(x, y, width, height);
}

- (CGRect)bounds
{
  sub_38FBC8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  VerticalLockupCollectionViewCell.bounds.setter(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  VerticalLockupCollectionViewCell.layoutSubviews()();
}

- (void)clearArtworkCatalogs
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkComponent);
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
  VerticalLockupCollectionViewCell.traitCollectionDidChange(_:)(v9);
}

- (BOOL)isHighlighted
{
  return sub_38FBC8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for VerticalLockupCollectionViewCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(VerticalLockupCollectionViewCell *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(VerticalLockupCollectionViewCell *)&v8 setHighlighted:v3];
  if (v7 != [(VerticalLockupCollectionViewCell *)v6 isHighlighted]) {
    sub_38EBD4();
  }
}

- (BOOL)isSelected
{
  return sub_38FBC8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for VerticalLockupCollectionViewCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(VerticalLockupCollectionViewCell *)&v9 isSelected];
  v8.receiver = v6;
  v8.super_class = v5;
  [(VerticalLockupCollectionViewCell *)&v8 setSelected:v3];
  if (v7 != [(VerticalLockupCollectionViewCell *)v6 isSelected])
  {
    sub_38EBD4();
    sub_38E980();
  }
}

- (void).cxx_destruct
{
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkCornerTreatment, &qword_DC82A0);
  sub_34BEC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder), *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_lockupImageArtworkCatalog));
  sub_86DDC(*(id *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkAccessoryStyle));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_layoutInvalidationHandler));
  swift_release();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_imageDidChangeHandler));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_selectedBackgroundViewConfiguration);

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_textStackView));
  swift_release();
  double v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell____lazy_storage___selectedIndicatorView);
}

@end