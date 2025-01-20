@interface WDEDatabaseManager
- (WDEDatabaseManager)init;
- (void)checkpoint;
@end

@implementation WDEDatabaseManager

- (WDEDatabaseManager)init
{
  return (WDEDatabaseManager *)DatabaseManager.init()();
}

- (void)checkpoint
{
  v2 = self;
  DatabaseManager.checkpoint()();
}

@end