@interface PlaylistCell
- (BOOL)isDisabled;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication12PlaylistCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication12PlaylistCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaylistCell

- (_TtC16MusicApplication12PlaylistCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12PlaylistCell *)sub_1D3948(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12PlaylistCell)initWithCoder:(id)a3
{
  v4 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_title];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;
  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_subtitle];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents];
  id v7 = a3;
  uint64_t *v6 = sub_1D46E8();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication12PlaylistCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled;
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  v6 = self;
  sub_22CEF0();
  double v5 = 1.0;
  if (self->super.UICollectionViewTableCell_opaque[v4]) {
    double v5 = 0.5;
  }
  [*(id *)(*(void *)&v6->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkComponent]+ 144) setAlpha:v5];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = [(PlaylistCell *)v5 traitCollection];
  sub_23065C(v6, *(void *)&v5->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents + 8]);

  [v4 frame];
  [v4 setFrame:];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1D4328((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end