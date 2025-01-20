@interface PPPortraitSystem
+ (void)start;
@end

@implementation PPPortraitSystem

+ (void)start
{
  +[PPMaintenance registerMaintenanceTasksInternal];
  +[PPSWHarvestingSystem start];
  id v2 = +[PPNamedEntityExtractionPlugin sharedInstance];
  id v3 = +[PPECRMessageTermCountsPlugin sharedInstance];
  id v4 = +[PPSettings sharedInstance];
}

@end