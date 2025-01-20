@interface RankedMusicVideoVerticalCell
+ (UIEdgeInsets)visualContentInsets;
- (BOOL)accessibilityIsExplicit;
- (NSString)accessibilityRankString;
- (NSString)artistName;
- (NSString)title;
- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RankedMusicVideoVerticalCell

- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication28RankedMusicVideoVerticalCell *)sub_473920(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_474CB0();
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

- (void)layoutSubviews
{
  v2 = self;
  sub_474080();
}

+ (UIEdgeInsets)visualContentInsets
{
  sub_474808();
  uint64_t v3 = v2;
  if (qword_DBDD68 != -1) {
    swift_once();
  }
  unsigned long long v4 = xmmword_DDF348;
  swift_beginAccess();
  double v5 = *(double *)(v3 + 104);
  uint64_t v6 = qword_DDF360;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  *(void *)&double v8 = v4 >> 64;
  *(void *)&double v7 = v4;
  double v9 = v5;
  double v10 = *(double *)&v6;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (NSString)accessibilityRankString
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_badgeView);
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end