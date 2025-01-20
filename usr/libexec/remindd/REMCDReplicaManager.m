@interface REMCDReplicaManager
+ (NSString)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDReplicaManager

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDReplicaManager"];
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDReplicaManager";
}

@end