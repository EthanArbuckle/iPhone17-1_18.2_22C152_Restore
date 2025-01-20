@interface ML3MigrationPerformPostMigration
@end

@implementation ML3MigrationPerformPostMigration

void ___ML3MigrationPerformPostMigration_block_invoke(uint64_t a1)
{
}

uint64_t ___ML3MigrationPerformPostMigration_block_invoke_26(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) notifyContentsDidChange];
  }
  return result;
}

@end