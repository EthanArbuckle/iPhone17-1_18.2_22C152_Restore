@interface ICImportAndDeleteCallRecordingsLaunchTask
- (NSURL)directory;
- (void)runLaunchTask;
- (void)setDirectory:(id)a3;
@end

@implementation ICImportAndDeleteCallRecordingsLaunchTask

- (void)runLaunchTask
{
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 managedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001349B8;
  v6[3] = &unk_100625860;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlock:v6];
}

- (NSURL)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end