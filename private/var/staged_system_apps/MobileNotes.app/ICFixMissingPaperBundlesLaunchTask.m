@interface ICFixMissingPaperBundlesLaunchTask
- (BOOL)paperBundleIsEmpty:(id)a3;
- (BOOL)paperBundleIsMissing:(id)a3;
- (void)runLaunchTask;
@end

@implementation ICFixMissingPaperBundlesLaunchTask

- (void)runLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ED9B4;
  v4[3] = &unk_100625860;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (BOOL)paperBundleIsMissing:(id)a3
{
  return [a3 checkResourceIsReachableAndReturnError:0] ^ 1;
}

- (BOOL)paperBundleIsEmpty:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:0];

  LOBYTE(v4) = [v5 count] == 0;
  return (char)v4;
}

@end