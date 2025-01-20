@interface REMCDMigrationState
+ (id)fetchRequest;
@end

@implementation REMCDMigrationState

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDMigrationState"];
}

@end