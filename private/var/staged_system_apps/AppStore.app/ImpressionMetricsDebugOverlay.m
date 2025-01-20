@interface ImpressionMetricsDebugOverlay
- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3;
- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3;
@end

@implementation ImpressionMetricsDebugOverlay

- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_metricsLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8AppStore29ImpressionMetricsDebugOverlay *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore29ImpressionMetricsDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_metricsLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_overlayColor);
}

@end