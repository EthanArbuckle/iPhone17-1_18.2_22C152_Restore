@interface ICCommonWindowSceneDelegate
- (BOOL)_appropriateToSetupSBSceneWithManagedObjectContext:(id)a3;
- (ICViewControllerManager)viewControllerManager;
- (ICWindow)icWindow;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setIcWindow:(id)a3;
- (void)sharedDisconnect;
- (void)sharedDisconnectWithSessionManager:(id)a3;
@end

@implementation ICCommonWindowSceneDelegate

- (ICViewControllerManager)viewControllerManager
{
  v2 = [(ICCommonWindowSceneDelegate *)self icWindow];
  v3 = [v2 viewControllerManager];

  return (ICViewControllerManager *)v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[ICCommonWindowSceneDelegate scene:willConnectToSession:options:]";
    __int16 v13 = 1024;
    int v14 = 36;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v11, 0x12u);
  }

  objc_opt_class();
  v10 = ICDynamicCast();

  [(ICCommonWindowSceneDelegate *)self ic_setupWithScene:v10 options:v7];
}

- (void)sceneDidBecomeActive:(id)a3
{
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[ICCommonWindowSceneDelegate sceneDidBecomeActive:]";
    __int16 v6 = 1024;
    int v7 = 48;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[ICCommonWindowSceneDelegate sceneWillResignActive:]";
    __int16 v6 = 1024;
    int v7 = 53;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (BOOL)_appropriateToSetupSBSceneWithManagedObjectContext:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (!v3)
  {
    int v4 = +[ICNoteContext sharedContext];
    id v3 = [v4 managedObjectContext];
  }
  v5 = +[ICAccount accountsWithAccountType:1 context:v3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C76DC;
  v10[3] = &unk_100628DA8;
  v10[4] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v12 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = +[ICAccount accountsWithAccountType:3 context:v3];
    id v8 = [v7 count];
    if (v8) {
      LOBYTE(v8) = +[ICMigrationController didChooseToMigrateLocalAccount];
    }
    *((unsigned char *)v12 + 24) = (_BYTE)v8;

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)sceneWillEnterForeground:(id)a3
{
  int v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ICCommonWindowSceneDelegate sceneWillEnterForeground:]";
    __int16 v13 = 1024;
    int v14 = 83;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v5 = +[ICNoteContext sharedContext];
  BOOL v6 = [v5 managedObjectContext];

  if ([(ICCommonWindowSceneDelegate *)self _appropriateToSetupSBSceneWithManagedObjectContext:v6])
  {
    int v7 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];

    if (!v7) {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.viewControllerManager) != nil)", "-[ICCommonWindowSceneDelegate sceneWillEnterForeground:]", 1, 0, @"Expected non-nil value for '%s'", "self.viewControllerManager");
    }
    id v8 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
    [v8 dismissAnyPresentedViewControllerAnimated:0 completion:0];
  }
  v9 = [(ICCommonWindowSceneDelegate *)self icWindow];
  [v9 setHidden:0];

  v10 = [(ICCommonWindowSceneDelegate *)self icWindow];
  [v10 makeKeyWindow];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[ICCommonWindowSceneDelegate sceneDidEnterBackground:]";
    __int16 v6 = 1024;
    int v7 = 99;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (void)sharedDisconnect
{
}

- (void)sharedDisconnectWithSessionManager:(id)a3
{
  id v14 = a3;
  int v4 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
  v5 = [v4 noteEditorViewController];

  if (!v5) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteEditorVC) != nil)", "-[ICCommonWindowSceneDelegate sharedDisconnectWithSessionManager:]", 1, 0, @"Expected non-nil value for '%s'", "noteEditorVC");
  }
  __int16 v6 = [v5 note];
  if (v14 && [v14 isSessionActive])
  {
    int v7 = [v5 presentedViewController];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [v5 presentedViewController];
      [v9 prepareForDismissal];
    }
    [v14 endSession];
  }
  if ([v6 isEmpty])
  {
    +[ICNote deleteEmptyNote:v6];
    v10 = [v6 managedObjectContext];
    [v10 ic_save];
  }
  else
  {
    [v5 saveNote];
    uint64_t v11 = +[ICNoteContext sharedContext];
    [v11 saveImmediately];

    [v5 updateInlineDrawings];
    [v5 resetTextViewUndoManager];
    v10 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
    v12 = [v10 currentAttachmentPresenter];
    [v12 dismissAnimated:0 completion:0];
  }
  __int16 v13 = [(ICCommonWindowSceneDelegate *)self viewControllerManager];
  [v13 dismissAnyPresentedViewControllerAnimated:0 completion:0];

  [(ICCommonWindowSceneDelegate *)self setIcWindow:0];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ICCommonWindowSceneDelegate sceneDidDisconnect:]";
    __int16 v11 = 1024;
    int v12 = 145;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C7CC8;
  v7[3] = &unk_100625860;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIView performWithoutAnimation:v7];
}

- (ICWindow)icWindow
{
  return self->_icWindow;
}

- (void)setIcWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end