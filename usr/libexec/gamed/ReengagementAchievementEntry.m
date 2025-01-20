@interface ReengagementAchievementEntry
+ (id)fetchRequest;
@end

@implementation ReengagementAchievementEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ReengagementAchievementEntry"];
}

@end