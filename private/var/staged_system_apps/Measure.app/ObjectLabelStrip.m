@interface ObjectLabelStrip
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (_TtC7Measure16ObjectLabelStrip)initWithCoder:(id)a3;
- (_TtC7Measure16ObjectLabelStrip)initWithFrame:(CGRect)a3;
- (_TtC7Measure27SurfaceSideMeasurementStack)heightLabels;
- (_TtC7Measure27SurfaceSideMeasurementStack)lengthLabels;
- (_TtC7Measure27SurfaceSideMeasurementStack)widthLabels;
- (void)setContentView:(id)a3;
- (void)setHeightLabels:(id)a3;
- (void)setLengthLabels:(id)a3;
- (void)setWidthLabels:(id)a3;
@end

@implementation ObjectLabelStrip

- (_TtC7Measure27SurfaceSideMeasurementStack)lengthLabels
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure27SurfaceSideMeasurementStack *)Strong;
}

- (void)setLengthLabels:(id)a3
{
}

- (_TtC7Measure27SurfaceSideMeasurementStack)widthLabels
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure27SurfaceSideMeasurementStack *)Strong;
}

- (void)setWidthLabels:(id)a3
{
}

- (_TtC7Measure27SurfaceSideMeasurementStack)heightLabels
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure27SurfaceSideMeasurementStack *)Strong;
}

- (void)setHeightLabels:(id)a3
{
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView));
}

- (void)setContentView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure16ObjectLabelStrip)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[ObjectLabelStrip initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_1000B25B8();

  return v9;
}

- (_TtC7Measure16ObjectLabelStrip)initWithCoder:(id)a3
{
  return (_TtC7Measure16ObjectLabelStrip *)sub_1000B2794(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 375.0;
  double v3 = 143.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView);
}

@end