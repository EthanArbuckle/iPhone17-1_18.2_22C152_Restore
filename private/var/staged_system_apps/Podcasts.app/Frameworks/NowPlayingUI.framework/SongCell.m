@interface SongCell
- (BOOL)accessibilityIsAddButtonSelected;
- (BOOL)accessibilityIsExplicit;
- (BOOL)accessibilityIsPopular;
- (BOOL)accessibilityIsVideoTrack;
- (BOOL)accessibilityWantsNowPlayingIndicator;
- (BOOL)isAddButtonSelected;
- (BOOL)isEditing;
- (BOOL)isExplicit;
- (BOOL)isHighlighted;
- (BOOL)isPopular;
- (BOOL)isProminentItem;
- (BOOL)isSelected;
- (BOOL)wantsNowPlayingIndicator;
- (NSString)accessibilityAlbumTitle;
- (NSString)accessibilityArtistName;
- (NSString)accessibilityTitle;
- (NSString)accessibilityTrackNumberString;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)title;
- (_TtC12NowPlayingUI8SongCell)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI8SongCell)initWithFrame:(CGRect)a3;
- (double)accessibilityDuration;
- (double)duration;
- (int64_t)accessibilityPlaybackState;
- (int64_t)playbackState;
- (void)layoutSubviews;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)prepareForReuse;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAddButtonSelected:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsProminentItem:(BOOL)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setWantsNowPlayingIndicator:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SongCell

- (_TtC12NowPlayingUI8SongCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI8SongCell *)sub_10D38C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI8SongCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_116580();
}

- (NSString)title
{
  return (NSString *)sub_7FFD0();
}

- (void)setTitle:(id)a3
{
}

- (NSString)artistName
{
  return (NSString *)sub_7FFD0();
}

- (void)setArtistName:(id)a3
{
}

- (NSString)albumTitle
{
  return (NSString *)sub_7FFD0();
}

- (void)setAlbumTitle:(id)a3
{
}

- (double)duration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_duration];
}

- (void)setDuration:(double)a3
{
  v4 = self;
  sub_10E19C(a3);
}

- (BOOL)isProminentItem
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem];
}

- (void)setIsProminentItem:(BOOL)a3
{
  id v3 = (void *)self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem] = a3;
  v4 = self;
  sub_10E348(v3);
}

- (BOOL)isExplicit
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isExplicit];
}

- (void)setIsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_10E6BC((id)v3);
}

- (BOOL)isPopular
{
  if (self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity]) {
    return 0;
  }
  double v4 = *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity];
  v5 = self;
  v6 = self;
  id v7 = [v5 standardUserDefaults];
  float v8 = sub_D0B30();

  return v4 >= v8;
}

- (BOOL)wantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
}

- (void)setWantsNowPlayingIndicator:(BOOL)a3
{
  int v3 = self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator] = a3;
  if (v3 != a3) {
    [(SongCell *)self setNeedsLayout];
  }
}

- (BOOL)isAddButtonSelected
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isAddButtonSelected];
}

- (void)setIsAddButtonSelected:(BOOL)a3
{
  double v4 = self;
  sub_10EBD0(a3);
}

- (int64_t)playbackState
{
  return *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
}

- (void)setPlaybackState:(int64_t)a3
{
  uint64_t v3 = *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
  *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState] = a3;
  if (v3 != a3) {
    [(SongCell *)self setNeedsLayout];
  }
}

- (BOOL)isHighlighted
{
  return sub_10EFC0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  double v4 = self;
  sub_10EE6C(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_10EFC0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  double v4 = self;
  sub_10EE6C(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (void)prepareForReuse
{
  uint64_t v2 = *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkComponent];
  id v4 = *(id *)(v2 + 80);
  *(void *)(v2 + 80) = 0;
  uint64_t v3 = self;
  sub_D83A0(v4);
}

- (BOOL)isEditing
{
  return sub_10EFC0(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SongCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(SongCell *)&v9 isEditing];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SongCell *)&v8 setEditing:v3];
  if (v7 != [(SongCell *)v6 isEditing])
  {
    [(SongCell *)v6 setClipsToBounds:[(SongCell *)v6 isEditing]];
    [(SongCell *)v6 setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SongCell();
  id v4 = a3;
  id v5 = v7.receiver;
  [(HorizontalLockupCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  if ([v6 horizontalSizeClass]) {
    [v5 setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_10F294();
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_116B04();
}

- (NSString)accessibilityTrackNumberString
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1299B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)accessibilityIsVideoTrack
{
  unsigned int v2 = *(unsigned __int16 *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_layoutStyle];
  return (v2 >> 13 == 2 || !(v2 >> 13)) && (v2 & 1) != 0;
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_7FFD0();
}

- (NSString)accessibilityArtistName
{
  return (NSString *)sub_7FFD0();
}

- (NSString)accessibilityAlbumTitle
{
  return (NSString *)sub_7FFD0();
}

- (double)accessibilityDuration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_duration];
}

- (BOOL)accessibilityIsExplicit
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isExplicit];
}

- (BOOL)accessibilityIsPopular
{
  if (self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity]) {
    return 0;
  }
  double v4 = *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity];
  id v5 = self;
  id v6 = self;
  id v7 = [v5 standardUserDefaults];
  float v8 = sub_D0B30();

  return v4 >= v8;
}

- (BOOL)accessibilityIsAddButtonSelected
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isAddButtonSelected];
}

- (BOOL)accessibilityWantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
}

- (int64_t)accessibilityPlaybackState
{
  return *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_FB70(*(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_addButtonHandler]);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  BOOL v3 = *(void **)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_musicVideoGlyphImageView];
}

@end