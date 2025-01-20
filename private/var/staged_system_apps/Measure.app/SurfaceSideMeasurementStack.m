@interface SurfaceSideMeasurementStack
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (_TtC7Measure16InteractiveLabel)mainUnit;
- (_TtC7Measure16InteractiveLabel)sideTitle;
- (_TtC7Measure19SecondaryLabelStack)secondaryLabelStack;
- (_TtC7Measure27SurfaceSideMeasurementStack)initWithCoder:(id)a3;
- (_TtC7Measure27SurfaceSideMeasurementStack)initWithFrame:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setMainUnit:(id)a3;
- (void)setSecondaryLabelStack:(id)a3;
- (void)setSideTitle:(id)a3;
@end

@implementation SurfaceSideMeasurementStack

- (_TtC7Measure16InteractiveLabel)sideTitle
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure16InteractiveLabel *)Strong;
}

- (void)setSideTitle:(id)a3
{
}

- (_TtC7Measure16InteractiveLabel)mainUnit
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure16InteractiveLabel *)Strong;
}

- (void)setMainUnit:(id)a3
{
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView));
}

- (void)setContentView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure19SecondaryLabelStack)secondaryLabelStack
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure19SecondaryLabelStack *)Strong;
}

- (void)setSecondaryLabelStack:(id)a3
{
}

- (_TtC7Measure27SurfaceSideMeasurementStack)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[SurfaceSideMeasurementStack initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_1000F55D8();

  return v9;
}

- (_TtC7Measure27SurfaceSideMeasurementStack)initWithCoder:(id)a3
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)sub_1000F5978(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 103.6;
  double v3 = 143.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView));

  swift_unknownObjectWeakDestroy();
}

@end