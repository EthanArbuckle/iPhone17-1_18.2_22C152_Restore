@interface ICRetranscribeAudioAttachmentsIfNeededLaunchTask
- (void)runLaunchTask;
@end

@implementation ICRetranscribeAudioAttachmentsIfNeededLaunchTask

- (void)runLaunchTask
{
  v3 = [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D6AC;
  v4[3] = &unk_100625AF0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

@end