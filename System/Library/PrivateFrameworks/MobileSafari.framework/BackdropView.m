@interface BackdropView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC12MobileSafari12BackdropView)initWithCoder:(id)a3;
- (_TtC12MobileSafari12BackdropView)initWithFrame:(CGRect)a3;
@end

@implementation BackdropView

+ (Class)layerClass
{
  sub_18C35AC28();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12MobileSafari12BackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BackdropView();
  return -[BackdropView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    v3 = self;
    sub_18C6F9848();
    v4 = v3;
    if (sub_18C6F98D8())
    {

      swift_bridgeObjectRelease();
      unsigned __int8 v5 = 1;
    }
    else
    {
      v6 = (void *)sub_18C6F9808();
      v8.receiver = v4;
      v8.super_class = (Class)type metadata accessor for BackdropView();
      unsigned __int8 v5 = [(BackdropView *)&v8 _shouldAnimatePropertyWithKey:v6];

      swift_bridgeObjectRelease();
    }
    LOBYTE(self) = v5;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (_TtC12MobileSafari12BackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropView();
  return [(BackdropView *)&v5 initWithCoder:a3];
}

@end