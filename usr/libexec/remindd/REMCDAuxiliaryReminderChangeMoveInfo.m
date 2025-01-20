@interface REMCDAuxiliaryReminderChangeMoveInfo
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDAuxiliaryReminderChangeMoveInfo

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return @"REMCDAuxiliaryReminderChangeMoveInfo";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAuxiliaryReminderChangeMoveInfo"];
}

@end