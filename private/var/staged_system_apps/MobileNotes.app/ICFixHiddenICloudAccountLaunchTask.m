@interface ICFixHiddenICloudAccountLaunchTask
- (void)runLaunchTask;
@end

@implementation ICFixHiddenICloudAccountLaunchTask

- (void)runLaunchTask
{
  v3 = +[ICAccountUtilities sharedInstance];
  v4 = [v3 allICloudACAccounts];

  v5 = [(ICWorkerContextLaunchTask *)self workerContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EBE0C;
  v7[3] = &unk_100625860;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

@end