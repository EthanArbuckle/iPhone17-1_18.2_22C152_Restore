@interface ShowcaseCell
- (BOOL)accessibilityIsExplicit;
- (NSString)accessibilityHeadline;
- (NSString)accessibilitySubtitle;
- (NSString)accessibilityTitle;
- (_TtC16MusicApplication12ShowcaseCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication12ShowcaseCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShowcaseCell

- (_TtC16MusicApplication12ShowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ShowcaseCell *)sub_C745C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ShowcaseCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_CB224();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_C8720();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_C9808(a3);
}

- (NSString)accessibilityHeadline
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilityTitle
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilitySubtitle
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_badgeView];
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell____lazy_storage___measurementTextStackView];
}

@end