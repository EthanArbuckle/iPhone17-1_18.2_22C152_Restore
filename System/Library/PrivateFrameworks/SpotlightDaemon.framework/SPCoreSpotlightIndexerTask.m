@interface SPCoreSpotlightIndexerTask
- (BOOL)shouldResumeOnFailure;
- (CSIndexJob)job;
- (NSArray)bundleIDs;
- (NSArray)completedBundleIDs;
- (NSArray)indexers;
- (SPCoreSpotlightIndexerTask)initWithIndexJob:(id)a3 indexers:(id)a4;
- (unint64_t)dataMigrationStage;
- (void)setBundleIDs:(id)a3;
- (void)setCompletedBundleIDs:(id)a3;
- (void)setDataMigrationStage:(unint64_t)a3;
- (void)setShouldResumeOnFailure:(BOOL)a3;
@end

@implementation SPCoreSpotlightIndexerTask

- (void)setShouldResumeOnFailure:(BOOL)a3
{
  self->_shouldResumeOnFailure = a3;
}

- (void)setDataMigrationStage:(unint64_t)a3
{
  self->_dataMigrationStage = a3;
}

- (void)setBundleIDs:(id)a3
{
}

- (SPCoreSpotlightIndexerTask)initWithIndexJob:(id)a3 indexers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPCoreSpotlightIndexerTask;
  v9 = [(SPCoreSpotlightIndexerTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_job, a3);
    objc_storeStrong((id *)&v10->_indexers, a4);
  }

  return v10;
}

- (CSIndexJob)job
{
  return self->_job;
}

- (NSArray)completedBundleIDs
{
  return self->_completedBundleIDs;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_indexers, 0);
  objc_storeStrong((id *)&self->_job, 0);
}

- (NSArray)indexers
{
  return self->_indexers;
}

- (void)setCompletedBundleIDs:(id)a3
{
}

- (unint64_t)dataMigrationStage
{
  return self->_dataMigrationStage;
}

- (BOOL)shouldResumeOnFailure
{
  return self->_shouldResumeOnFailure;
}

@end