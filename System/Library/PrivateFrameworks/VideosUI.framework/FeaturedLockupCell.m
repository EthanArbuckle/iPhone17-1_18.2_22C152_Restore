@interface FeaturedLockupCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI18FeaturedLockupCell)initWithCoder:(id)a3;
- (_TtC8VideosUI18FeaturedLockupCell)initWithFrame:(CGRect)a3;
@end

@implementation FeaturedLockupCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E370B6B4(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC8VideosUI18FeaturedLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI18FeaturedLockupCell *)sub_1E370C8D0();
}

- (_TtC8VideosUI18FeaturedLockupCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI18FeaturedLockupCell *)sub_1E370C954(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end