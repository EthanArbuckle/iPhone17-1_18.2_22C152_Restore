@interface APExpiredObservabilityBatchesReporter
- (APExpiredObservabilityBatchesReporter)init;
- (APExpiredObservabilityBatchesReporter)initWithBatchPath:(id)a3;
- (void)run;
@end

@implementation APExpiredObservabilityBatchesReporter

- (APExpiredObservabilityBatchesReporter)initWithBatchPath:(id)a3
{
  uint64_t v4 = sub_10019B0B0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APExpiredObservabilityBatchesReporter_batchPath);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ExpiredObservabilityBatchesReporter();
  return [(APExpiredObservabilityBatchesReporter *)&v8 init];
}

- (void)run
{
  v2 = self;
  sub_1001667E4();
}

- (APExpiredObservabilityBatchesReporter)init
{
  result = (APExpiredObservabilityBatchesReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end