@interface PLBackgroundJobLowPriorityBatterySearchIndexingWorker
+ (id)_criteriaToUse;
- (BOOL)_supportsIndexRebuild;
- (signed)_jobType;
@end

@implementation PLBackgroundJobLowPriorityBatterySearchIndexingWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForLowPriorityBatterySearchWorker];
}

- (signed)_jobType
{
  return 2;
}

- (BOOL)_supportsIndexRebuild
{
  return 1;
}

@end