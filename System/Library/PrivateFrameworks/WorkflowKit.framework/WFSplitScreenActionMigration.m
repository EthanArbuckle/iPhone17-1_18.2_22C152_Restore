@interface WFSplitScreenActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (WFSplitScreenActionMigration)init;
- (void)migrateWorkflow;
@end

@implementation WFSplitScreenActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  sub_1C8532538();
  sub_1C8532658();
  char v4 = static SplitScreenActionMigration.workflowNeedsMigration(_:fromClientVersion:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)migrateWorkflow
{
  v2 = self;
  SplitScreenActionMigration.migrateWorkflow()();
}

- (WFSplitScreenActionMigration)init
{
  return (WFSplitScreenActionMigration *)SplitScreenActionMigration.init()();
}

@end