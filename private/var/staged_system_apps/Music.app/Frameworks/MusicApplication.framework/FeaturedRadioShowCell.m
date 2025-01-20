@interface FeaturedRadioShowCell
- (BOOL)accessibilityIsExplicit;
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithFrame:(CGRect)a3;
- (void)setHeadline:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FeaturedRadioShowCell

- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21FeaturedRadioShowCell *)sub_25DFC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25F068();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
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

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_badgeView];
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
}

@end