@interface PLBackgroundJobSyndicationResourceDownloadWorker
+ (id)syndicationWorkerCriteria;
- (BOOL)isNetworkAccessAllowed;
- (id)resourceIDsForPrefetchWithLibrary:(id)a3;
- (unint64_t)batchSize;
@end

@implementation PLBackgroundJobSyndicationResourceDownloadWorker

+ (id)syndicationWorkerCriteria
{
  return +[PLBackgroundJobCriteria criteriaForHubbleNetworkDownloadWorker];
}

- (id)resourceIDsForPrefetchWithLibrary:(id)a3
{
  prefetchManager = self->super._prefetchManager;
  v4 = [a3 managedObjectContext];
  v5 = [(PLSyndicationResourcePrefetchEngine *)prefetchManager lowPriorityResourcesForPrefetchWithManagedObjectContext:v4];

  return v5;
}

- (unint64_t)batchSize
{
  return 20;
}

- (BOOL)isNetworkAccessAllowed
{
  return 1;
}

@end