@interface PLBackgroundJobHighPrioritySearchIndexingWorker
+ (id)_criteriaToUse;
- (signed)_jobType;
@end

@implementation PLBackgroundJobHighPrioritySearchIndexingWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForHighPrioritySearchIndexingWorker];
}

- (signed)_jobType
{
  return 1;
}

@end