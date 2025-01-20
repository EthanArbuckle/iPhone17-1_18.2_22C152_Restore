@interface REMCDChangeTrackingState
+ (NSString)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDChangeTrackingState

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDChangeTrackingState"];
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDChangeTrackingState";
}

@end