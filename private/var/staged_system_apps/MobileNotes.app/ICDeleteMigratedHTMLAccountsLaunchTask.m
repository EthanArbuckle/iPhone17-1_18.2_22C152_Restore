@interface ICDeleteMigratedHTMLAccountsLaunchTask
- (void)runLaunchTask;
@end

@implementation ICDeleteMigratedHTMLAccountsLaunchTask

- (void)runLaunchTask
{
  id v2 = [(ICWorkerContextLaunchTask *)self workerContext];
  +[ICMigrationUtilities deleteMigratedHTMLAccountsInContext:v2];
}

@end