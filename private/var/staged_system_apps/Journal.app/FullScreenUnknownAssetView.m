@interface FullScreenUnknownAssetView
- (_TtC7Journal26FullScreenUnknownAssetView)initWithCoder:(id)a3;
- (_TtC7Journal26FullScreenUnknownAssetView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenUnknownAssetView

- (_TtC7Journal26FullScreenUnknownAssetView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FullScreenUnknownAssetView();
  v7 = -[FullScreenUnknownAssetView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(FullScreenUnknownAssetView *)v7 setContentMode:2];
  [(FullScreenUnknownAssetView *)v7 setClipsToBounds:1];
  sub_100184A9C();

  return v7;
}

- (_TtC7Journal26FullScreenUnknownAssetView)initWithCoder:(id)a3
{
  result = (_TtC7Journal26FullScreenUnknownAssetView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end