@interface WorkoutChartedDistancePathRenderer
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation WorkoutChartedDistancePathRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  v11 = a5;
  v12 = self;
  sub_1002DF990(v11, v9, v8, var0, var1, a4);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp34WorkoutChartedDistancePathRenderer_highlightInterval;
  uint64_t v3 = type metadata accessor for DateInterval();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end