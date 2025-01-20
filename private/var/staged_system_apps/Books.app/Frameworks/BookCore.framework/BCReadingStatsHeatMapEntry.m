@interface BCReadingStatsHeatMapEntry
+ (id)fetchRequest;
@end

@implementation BCReadingStatsHeatMapEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"BCReadingStatsHeatMapEntry"];
}

@end