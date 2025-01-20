@interface LineSeriesAccessibilityElement
- (AXChartDescriptor)accessibilityChartDescriptor;
- (CGRect)accessibilityFrame;
- (_TtC9TeaCharts30LineSeriesAccessibilityElement)init;
- (_TtC9TeaCharts30LineSeriesAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (id)tc_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4;
- (void)setAccessibilityChartDescriptor:(id)a3;
@end

@implementation LineSeriesAccessibilityElement

- (CGRect)accessibilityFrame
{
  double v2 = sub_1BD5FED9C(self, (uint64_t)a2, sub_1BD5FEE00);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  double v2 = self;
  sub_1BD5FF0AC();
  double v4 = v3;

  return (AXChartDescriptor *)v4;
}

- (void)setAccessibilityChartDescriptor:(id)a3
{
  id v5 = a3;
  v6 = self;
}

- (id)tc_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4
{
  v6 = self;
  sub_1BD5FF5D0(a4, a3);
  uint64_t v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_1BD60A510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_TtC9TeaCharts30LineSeriesAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
}

- (_TtC9TeaCharts30LineSeriesAccessibilityElement)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BD600BBC((uint64_t)self + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter);
}

@end