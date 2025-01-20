@interface MailRestorationStateClearer
+ (void)clearAllRestorationStates:(id)a3 errorHandler:(id)a4;
@end

@implementation MailRestorationStateClearer

+ (void)clearAllRestorationStates:(id)a3 errorHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = +[UIApplication sharedApplication];
  id v8 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
  [v8 setWindowDismissalAnimation:3];
  if ([v7 supportsMultipleScenes])
  {
    v9 = [v7 openSessions];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011E220;
    v16[3] = &unk_100608BA8;
    id v17 = v5;
    id v18 = v7;
    id v19 = v8;
    [v9 enumerateObjectsUsingBlock:v16];
  }
  v10 = +[NSFileManager defaultManager];
  v11 = [v10 URLsForDirectory:5 inDomains:1];
  v12 = [v11 firstObject];

  v13 = +[NSURL fileURLWithPath:@"Saved Application State/com.apple.mobilemail.savedState" isDirectory:1 relativeToURL:v12];
  id v15 = 0;
  [v10 removeItemAtURL:v13 error:&v15];
  id v14 = v15;
  if (v14)
  {
    if (v6) {
      v6[2](v6, v14);
    }
  }
  else
  {
    [v7 terminateWithSuccess];
  }
}

@end