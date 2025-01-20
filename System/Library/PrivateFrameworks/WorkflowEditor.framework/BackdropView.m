@interface BackdropView
+ (Class)layerClass;
- (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView)initWithCoder:(id)a3;
- (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView)initWithFrame:(CGRect)a3;
@end

@implementation BackdropView

+ (Class)layerClass
{
  swift_getObjCClassMetadata();
  sub_234A740D0();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView *)sub_234A740FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_A13E265F8FCD2603F66894AD5DC065DB12BackdropView *)sub_234A74188(a3);
}

@end