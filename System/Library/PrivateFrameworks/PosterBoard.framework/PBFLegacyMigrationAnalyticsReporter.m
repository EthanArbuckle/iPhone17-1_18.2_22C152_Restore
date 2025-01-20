@interface PBFLegacyMigrationAnalyticsReporter
+ (void)recordWithEvent:(int64_t)a3 migrationInfo:(id)a4 duration:(double)a5 errorCode:(int64_t)a6;
- (PBFLegacyMigrationAnalyticsReporter)init;
@end

@implementation PBFLegacyMigrationAnalyticsReporter

+ (void)recordWithEvent:(int64_t)a3 migrationInfo:(id)a4 duration:(double)a5 errorCode:(int64_t)a6
{
  id v9 = a4;
  LegacyMigrationEvent.analyticsIdentifier.getter(a3);
  v10 = (void *)sub_1D3372258();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(double *)(v11 + 24) = a5;
  *(void *)(v11 + 32) = a3;
  *(void *)(v11 + 40) = a6;
  v14[4] = sub_1D330EB40;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1D330E77C;
  v14[3] = &block_descriptor_8;
  v12 = _Block_copy(v14);
  id v13 = v9;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);
}

- (PBFLegacyMigrationAnalyticsReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LegacyMigrationAnalyticsReporter();
  return [(PBFLegacyMigrationAnalyticsReporter *)&v3 init];
}

@end