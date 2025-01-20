@interface UIView.Spacer
+ (Class)layerClass;
- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithCoder:(id)a3;
- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithFrame:(CGRect)a3;
@end

@implementation UIView.Spacer

+ (Class)layerClass
{
  sub_173E4(0, &qword_DD54C0);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();

  return (Class)[ObjCClassFromMetadata layerClass];
}

- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCE16MusicApplicationCSo6UIView6Spacer_debugName);
  v9 = (objc_class *)_s6SpacerCMa();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[UIView.Spacer initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCE16MusicApplicationCSo6UIView6Spacer_debugName);
  void *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s6SpacerCMa();
  id v5 = a3;
  v6 = [(UIView.Spacer *)&v8 initWithCoder:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end