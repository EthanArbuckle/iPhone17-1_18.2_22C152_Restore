@interface MapsElevationChartStyle
+ (_TtC4Maps23MapsElevationChartStyle)navigationDetailStyle;
+ (_TtC4Maps23MapsElevationChartStyle)navigationLineStyle;
+ (_TtC4Maps23MapsElevationChartStyle)routePlanningDetailStyle;
+ (_TtC4Maps23MapsElevationChartStyle)routePlanningMiniLineStyle;
+ (_TtC4Maps23MapsElevationChartStyle)routePlanningOverviewStyle;
+ (double)miniLineChartWidth;
- (BOOL)usesCurrentPosition;
- (NSArray)gradientColors;
- (UIColor)barColor;
- (UIColor)barElapsedColor;
- (UIColor)barHighlightColor;
- (UIColor)dotStrokeColor;
- (UIColor)gridColor;
- (UIColor)gridHighlightColor;
- (UIColor)labelColor;
- (UIFont)xAxisFont;
- (_TtC4Maps23MapsElevationChartStyle)init;
- (double)barWidth;
- (double)bucketWidth;
- (double)gapWidth;
- (double)gridLineWidth;
@end

@implementation MapsElevationChartStyle

- (double)gapWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gapWidth);
}

- (double)barWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barWidth);
}

- (UIColor)barColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barColor));
}

- (UIColor)dotStrokeColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_dotStrokeColor));
}

- (UIColor)barHighlightColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barHighlightColor));
}

- (UIColor)barElapsedColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barElapsedColor));
}

- (NSArray)gradientColors
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gradientColors))
  {
    sub_1001BE0B0();
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (UIColor)labelColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_labelColor));
}

- (UIFont)xAxisFont
{
  return (UIFont *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_xAxisFont));
}

- (UIColor)gridColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridColor));
}

- (UIColor)gridHighlightColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridHighlightColor));
}

- (double)gridLineWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridLineWidth);
}

- (BOOL)usesCurrentPosition
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_usesCurrentPosition);
}

+ (double)miniLineChartWidth
{
  return 37.0;
}

+ (_TtC4Maps23MapsElevationChartStyle)navigationLineStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1002CFC14((uint64_t)a1, (uint64_t)a2, &qword_1015CBF30, (void **)&qword_101611BD8);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningMiniLineStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1002CFC14((uint64_t)a1, (uint64_t)a2, &qword_1015CBF38, (void **)&qword_101611BE0);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningOverviewStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1002CFC14((uint64_t)a1, (uint64_t)a2, &qword_1015CBF40, (void **)&qword_101611BE8);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningDetailStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1002CFC14((uint64_t)a1, (uint64_t)a2, &qword_1015CBF48, (void **)&qword_101611BF0);
}

+ (_TtC4Maps23MapsElevationChartStyle)navigationDetailStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1002CFC14((uint64_t)a1, (uint64_t)a2, &qword_1015CBF50, (void **)&qword_101611BF8);
}

- (double)bucketWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gapWidth)
       + *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barWidth);
}

- (_TtC4Maps23MapsElevationChartStyle)init
{
  result = (_TtC4Maps23MapsElevationChartStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1002D033C((uint64_t)self + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_blendMode);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridHighlightColor);
}

@end