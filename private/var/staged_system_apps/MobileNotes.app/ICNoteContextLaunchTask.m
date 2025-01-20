@interface ICNoteContextLaunchTask
- (void)runLaunchTask;
@end

@implementation ICNoteContextLaunchTask

- (void)runLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100074D48;
  v3[3] = &unk_100625AF0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v4;
  [v2 performBlockAndWait:v3];
}

@end