@interface ICPluginUtilities
+ (void)setupNoteContext;
+ (void)setupNoteContextWithOptions:(unint64_t)a3;
@end

@implementation ICPluginUtilities

+ (void)setupNoteContext
{
}

+ (void)setupNoteContextWithOptions:(unint64_t)a3
{
  +[ICNoteContext startSharedContextWithOptions:a3];
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 managedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E800;
  v6[3] = &unk_100020AE8;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

@end