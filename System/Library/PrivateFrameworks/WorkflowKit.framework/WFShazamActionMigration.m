@interface WFShazamActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (WFShazamActionMigration)init;
- (void)migrateWorkflow;
@end

@implementation WFShazamActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  sub_1C8532538();
  sub_1C8532658();
  char v4 = static ShazamActionMigration.workflowNeedsMigration(_:fromClientVersion:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)migrateWorkflow
{
  v2 = self;
  ShazamActionMigration.migrateWorkflow()();
}

- (WFShazamActionMigration)init
{
  return (WFShazamActionMigration *)ShazamActionMigration.init()();
}

@end