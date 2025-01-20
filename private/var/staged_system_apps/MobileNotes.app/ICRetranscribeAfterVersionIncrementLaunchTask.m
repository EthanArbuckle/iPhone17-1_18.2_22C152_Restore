@interface ICRetranscribeAfterVersionIncrementLaunchTask
- (id)taskIdentifier;
- (void)runOneTimeLaunchTask;
@end

@implementation ICRetranscribeAfterVersionIncrementLaunchTask

- (void)runOneTimeLaunchTask
{
  v3 = [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011D8FC;
  v4[3] = &unk_100625AF0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

- (id)taskIdentifier
{
  return @"ICRetranscribeAfterVersionIncrementLaunchTaskV1";
}

@end