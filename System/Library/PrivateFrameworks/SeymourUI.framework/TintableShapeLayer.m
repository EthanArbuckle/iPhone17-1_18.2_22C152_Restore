@interface TintableShapeLayer
- (CGColor)borderColor;
- (CGColor)strokeColor;
- (_TtC9SeymourUI18TintableShapeLayer)init;
- (_TtC9SeymourUI18TintableShapeLayer)initWithCoder:(id)a3;
- (_TtC9SeymourUI18TintableShapeLayer)initWithLayer:(id)a3;
- (void)setBorderColor:(CGColor *)a3;
- (void)setStrokeColor:(CGColor *)a3;
@end

@implementation TintableShapeLayer

- (CGColor)borderColor
{
  return (CGColor *)sub_239C7CDB4(self, (uint64_t)a2, (SEL *)&selRef_borderColor);
}

- (void)setBorderColor:(CGColor *)a3
{
}

- (CGColor)strokeColor
{
  return (CGColor *)sub_239C7CDB4(self, (uint64_t)a2, (SEL *)&selRef_strokeColor);
}

- (void)setStrokeColor:(CGColor *)a3
{
}

- (_TtC9SeymourUI18TintableShapeLayer)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TintableShapeLayer();
  return [(TintableShapeLayer *)&v3 init];
}

- (_TtC9SeymourUI18TintableShapeLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_23A8009F8();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_23A800F98();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TintableShapeLayer();
  v5 = [(TintableShapeLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC9SeymourUI18TintableShapeLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_tintAdjustmentMode) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintableShapeLayer();
  return [(TintableShapeLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedBorderColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18TintableShapeLayer_undimmedStrokeColor);
}

@end