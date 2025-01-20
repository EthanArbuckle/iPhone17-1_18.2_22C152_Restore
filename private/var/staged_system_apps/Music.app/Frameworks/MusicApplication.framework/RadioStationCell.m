@interface RadioStationCell
- (BOOL)accessibilityIsExplicit;
- (NSString)stationDescription;
- (NSString)supertitle;
- (NSString)title;
- (_TtC16MusicApplication16RadioStationCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication16RadioStationCell)initWithFrame:(CGRect)a3;
- (void)setStationDescription:(id)a3;
- (void)setSupertitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RadioStationCell

- (_TtC16MusicApplication16RadioStationCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16RadioStationCell *)sub_C03D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16RadioStationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_C2448();
}

- (NSString)supertitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSupertitle:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)stationDescription
{
  return (NSString *)sub_42EA8();
}

- (void)setStationDescription:(id)a3
{
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_badgeView];
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
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end