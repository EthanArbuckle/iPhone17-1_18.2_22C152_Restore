@interface PLBackgroundJobLowPriorityChargerSearchIndexingWorker
+ (id)_criteriaToUse;
- (BOOL)_supportsIndexRebuild;
- (signed)_jobType;
@end

@implementation PLBackgroundJobLowPriorityChargerSearchIndexingWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForLowPriorityChargerSearchWorker];
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