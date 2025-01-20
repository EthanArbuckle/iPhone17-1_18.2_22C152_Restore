@interface REMCDAuxiliaryReminderChangeDeleteInfo
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDAuxiliaryReminderChangeDeleteInfo

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return @"REMCDAuxiliaryReminderChangeDeleteInfo";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAuxiliaryReminderChangeDeleteInfo"];
}

@end