@interface BannerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7MusicUI10BannerView)initWithCoder:(id)a3;
- (_TtC7MusicUI10BannerView)initWithFrame:(CGRect)a3;
@end

@implementation BannerView

- (_TtC7MusicUI10BannerView)initWithCoder:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_2299333E8();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_229933498();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC7MusicUI10BannerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end