@interface RatingBadgeView
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI15RatingBadgeView)initWithCoder:(id)a3;
- (_TtC8VideosUI15RatingBadgeView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation RatingBadgeView

- (_TtC8VideosUI15RatingBadgeView)initWithCoder:(id)a3
{
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1E35E2C94();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_1E35E3320();
}

- (_TtC8VideosUI15RatingBadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end