@interface GradientBackgroundDecorationView
+ (Class)layerClass;
- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithCoder:(id)a3;
- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation GradientBackgroundDecorationView

+ (Class)layerClass
{
  sub_1E3131A3C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI32GradientBackgroundDecorationView *)sub_1E3131A68();
}

- (_TtC8VideosUI32GradientBackgroundDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3131EA4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI32GradientBackgroundDecorationView_gradientLayer));
}

@end