@interface GKMetricsIntBucketer
- (GKMetricsIntBucketer)init;
- (GKMetricsIntBucketer)initWithBuckets:(id)a3;
- (int64_t)clamp:(int64_t)a3;
@end

@implementation GKMetricsIntBucketer

- (GKMetricsIntBucketer)initWithBuckets:(id)a3
{
  v3 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (GKMetricsIntBucketer *)MetricsIntBucketer.init(buckets:)(v3);
}

- (int64_t)clamp:(int64_t)a3
{
  return MetricsIntBucketer.clamp(_:)(a3);
}

- (GKMetricsIntBucketer)init
{
}

- (void).cxx_destruct
{
}

@end