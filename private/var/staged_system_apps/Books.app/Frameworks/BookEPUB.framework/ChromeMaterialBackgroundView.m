@interface ChromeMaterialBackgroundView
+ (Class)layerClass;
- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithCoder:(id)a3;
- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation ChromeMaterialBackgroundView

+ (Class)layerClass
{
  sub_39F90(0, &qword_4087A0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookEPUB28ChromeMaterialBackgroundView *)sub_1E40B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookEPUB28ChromeMaterialBackgroundView)initWithCoder:(id)a3
{
  result = (_TtC8BookEPUB28ChromeMaterialBackgroundView *)sub_2FD010();
  __break(1u);
  return result;
}

@end