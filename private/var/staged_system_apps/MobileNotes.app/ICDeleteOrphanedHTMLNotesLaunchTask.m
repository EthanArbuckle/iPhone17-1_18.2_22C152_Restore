@interface ICDeleteOrphanedHTMLNotesLaunchTask
- (id)taskIdentifier;
- (void)runOneTimeLaunchTask;
@end

@implementation ICDeleteOrphanedHTMLNotesLaunchTask

- (id)taskIdentifier
{
  return @"DidDeleteOrphanedHTMLNotesLaunchTaskV2";
}

- (void)runOneTimeLaunchTask
{
  id v2 = [objc_alloc((Class)NoteContext) initWithPrivateQueue];
  v3 = [v2 managedObjectContext];
  +[NSFileManager defaultManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006C85C;
  v6[3] = &unk_100625860;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = v3;
  [v5 performBlockAndWait:v6];
}

@end