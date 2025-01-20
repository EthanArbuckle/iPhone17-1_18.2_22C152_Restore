@interface WFOpenWorkflowActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (WFOpenWorkflowActionMigration)init;
- (void)migrateWorkflow;
@end

@implementation WFOpenWorkflowActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  sub_1C8532538();
  sub_1C8532658();
  char v4 = static OpenWorkflowActionMigration.workflowNeedsMigration(_:fromClientVersion:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)migrateWorkflow
{
  v2 = self;
  OpenWorkflowActionMigration.migrateWorkflow()();
}

- (WFOpenWorkflowActionMigration)init
{
  return (WFOpenWorkflowActionMigration *)OpenWorkflowActionMigration.init()();
}

@end