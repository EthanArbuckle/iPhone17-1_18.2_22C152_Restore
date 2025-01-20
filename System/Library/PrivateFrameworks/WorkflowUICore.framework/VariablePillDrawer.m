@interface VariablePillDrawer
+ (id)drawVariableNamed:(id)a3 icon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9;
+ (void)drawVariableForAppIconNamed:(id)a3 appIcon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9 completionBlock:(id)aBlock;
- (_TtC14WorkflowUICore18VariablePillDrawer)init;
@end

@implementation VariablePillDrawer

- (_TtC14WorkflowUICore18VariablePillDrawer)init
{
  return (_TtC14WorkflowUICore18VariablePillDrawer *)sub_2353E9F40();
}

+ (id)drawVariableNamed:(id)a3 icon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v16 = sub_2353FD4F8();
  uint64_t v18 = v17;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = static VariablePillDrawer.draw(name:icon:font:tint:size:state:isAvailable:)(width, height, v16, v18, a4, v20, v21, a8, a9);

  swift_bridgeObjectRelease();
  return v22;
}

+ (void)drawVariableForAppIconNamed:(id)a3 appIcon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9 completionBlock:(id)aBlock
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = sub_2353FD4F8();
  uint64_t v20 = v19;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v17);
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  sub_2353EA2A4(v18, v20, v22, v23, v24, a8, a9, ObjCClassMetadata, width, height, (void (**)(void, void))v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
}

@end