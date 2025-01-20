@interface BaseCollectionReusableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI26BaseCollectionReusableView)initWithCoder:(id)a3;
- (_TtC8VideosUI26BaseCollectionReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BaseCollectionReusableView

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_1E366500C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3665074();
}

- (_TtC8VideosUI26BaseCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26BaseCollectionReusableView *)sub_1E3665140();
}

- (_TtC8VideosUI26BaseCollectionReusableView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI26BaseCollectionReusableView *)sub_1E36651B0(a3);
}

@end