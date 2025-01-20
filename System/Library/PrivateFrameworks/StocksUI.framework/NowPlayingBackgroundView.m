@interface NowPlayingBackgroundView
- (_TtC8StocksUI24NowPlayingBackgroundView)initWithCoder:(id)a3;
- (_TtC8StocksUI24NowPlayingBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingBackgroundView

- (_TtC8StocksUI24NowPlayingBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v7 = -[NowPlayingBackgroundView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_secondarySystemBackgroundColor);
  [(NowPlayingBackgroundView *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC8StocksUI24NowPlayingBackgroundView)initWithCoder:(id)a3
{
  result = (_TtC8StocksUI24NowPlayingBackgroundView *)sub_20A8CF520();
  __break(1u);
  return result;
}

@end