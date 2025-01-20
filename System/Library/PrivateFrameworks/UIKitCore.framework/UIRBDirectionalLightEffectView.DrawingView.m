@interface UIRBDirectionalLightEffectView.DrawingView
+ (Class)layerClass;
- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithCoder:(id)a3;
- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithFrame:(CGRect)a3;
- (void)RBLayer:(id)a3 draw:(id)a4;
@end

@implementation UIRBDirectionalLightEffectView.DrawingView

+ (Class)layerClass
{
  sub_185B1BC18();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_185B1AFE8(v6, v7);
}

- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_timeOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_effects) = (Class)MEMORY[0x1E4FBC860];
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_timeOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5UIKit30UIRBDirectionalLightEffectViewP33_5F98E6BE5B93275EE5D20586FF75585B11DrawingView_effects) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(UIView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end