@interface BCReadingStatsAppVersion
+ (id)fetchRequest;
@end

@implementation BCReadingStatsAppVersion

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"BCReadingStatsAppVersion"];
}

@end