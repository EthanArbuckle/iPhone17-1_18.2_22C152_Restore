@interface ICReindexEverythingIfNecessaryTask
- (void)runLaunchTask;
@end

@implementation ICReindexEverythingIfNecessaryTask

- (void)runLaunchTask
{
  id v2 = +[ICSearchIndexer sharedIndexer];
  [v2 reindexIfNecessary];
}

@end