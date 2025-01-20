@interface SurfaceLabelStrip
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (_TtC7Measure17SurfaceLabelStrip)initWithCoder:(id)a3;
- (_TtC7Measure17SurfaceLabelStrip)initWithFrame:(CGRect)a3;
- (_TtC7Measure27SurfaceSideMeasurementStack)lengthLabels;
- (_TtC7Measure27SurfaceSideMeasurementStack)widthLabels;
- (void)setContentView:(id)a3;
- (void)setLengthLabels:(id)a3;
- (void)setWidthLabels:(id)a3;
@end

@implementation SurfaceLabelStrip

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

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView));
}

- (void)setContentView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure17SurfaceLabelStrip)initWithFrame:(CGRect)a3
{
  sub_10002DA40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure17SurfaceLabelStrip)initWithCoder:(id)a3
{
  sub_10002DC18(a3);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 375.0;
  double v3 = 143.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView);
}

@end