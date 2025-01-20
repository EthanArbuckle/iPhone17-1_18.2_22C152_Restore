@interface SongCell
- (BOOL)accessibilityIsExplicit;
- (BOOL)accessibilityIsVideoTrack;
- (BOOL)isDisabled;
- (BOOL)isFavorite;
- (BOOL)isHighlighted;
- (BOOL)isPopular;
- (BOOL)isProminentItem;
- (BOOL)isSelected;
- (NSString)accessibilityTrackNumberString;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)title;
- (_TtC16MusicApplication8SongCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication8SongCell)initWithFrame:(CGRect)a3;
- (double)duration;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsProminentItem:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SongCell

- (_TtC16MusicApplication8SongCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication8SongCell *)sub_1655A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication8SongCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_16F504();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)artistName
{
  return (NSString *)sub_42EA8();
}

- (void)setArtistName:(id)a3
{
}

- (NSString)albumTitle
{
  return (NSString *)sub_42EA8();
}

- (void)setAlbumTitle:(id)a3
{
}

- (double)duration
{
  return *(double *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_duration];
}

- (void)setDuration:(double)a3
{
  v4 = self;
  sub_165EB8(a3);
}

- (BOOL)isProminentItem
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_isProminentItem];
}

- (void)setIsProminentItem:(BOOL)a3
{
  v4 = self;
  sub_166040(a3);
}

- (BOOL)isFavorite
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isFavorite];
}

- (void)setIsFavorite:(BOOL)a3
{
  v4 = self;
  sub_1661E8(a3);
}

- (BOOL)isPopular
{
  if (self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_popularity]) {
    return 0;
  }
  double v4 = *(double *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_popularity];
  v5 = self;
  v6 = self;
  id v7 = [v5 standardUserDefaults];
  float v8 = sub_10DC54();

  return v4 >= v8;
}

- (BOOL)isHighlighted
{
  return sub_16680C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  double v4 = self;
  sub_1668B4(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_16680C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  double v4 = self;
  sub_1668B4(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (BOOL)isDisabled
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  id v3 = self;
  sub_22CEF0();
  sub_166A68();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  [v4 size];
  [(SongCell *)v5 music_inheritedLayoutInsets];
  sub_AB7790();
  double v7 = v6;
  id v8 = [(SongCell *)v5 traitCollection];
  sub_16F260(v8, 0, v7);

  [v4 size];
  [v4 setSize:];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_16766C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_167890();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5 = sub_AB24B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB2480();
  id v9 = a3;
  v10 = self;
  sub_16CEAC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (NSString)accessibilityTrackNumberString
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)accessibilityIsVideoTrack
{
  unsigned int v2 = *(unsigned __int16 *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_layoutStyle];
  return (v2 >> 13 == 3 || v2 >> 13 == 1) && (v2 & 1) != 0;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeView];
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_34BEC(*(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder + 8], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder + 16]);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell____lazy_storage___favoriteSizingView];
}

@end