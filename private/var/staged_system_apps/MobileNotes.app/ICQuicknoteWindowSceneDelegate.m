@interface ICQuicknoteWindowSceneDelegate
- (ICSecureWindow)icWindow;
- (ICViewControllerManager)viewControllerManager;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setIcWindow:(id)a3;
- (void)setupQuickNoteWithWindowScene:(id)a3;
@end

@implementation ICQuicknoteWindowSceneDelegate

- (ICViewControllerManager)viewControllerManager
{
  v2 = [(ICQuicknoteWindowSceneDelegate *)self icWindow];
  v3 = [v2 viewControllerManager];

  return (ICViewControllerManager *)v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[ICQuicknoteWindowSceneDelegate scene:willConnectToSession:options:]";
    __int16 v14 = 1024;
    int v15 = 45;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v12, 0x12u);
  }

  objc_opt_class();
  v8 = ICDynamicCast();

  v9 = [v8 screen];
  v10 = [v9 displayIdentity];
  unsigned int v11 = [v10 expectsSecureRendering];

  if (v11) {
    [(ICQuicknoteWindowSceneDelegate *)self setupQuickNoteWithWindowScene:v8];
  }
  else {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICQuicknoteWindowSceneDelegate scene:willConnectToSession:options:]", 1, 0, @"Trying to show non secure screen with secure window scene delegate");
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ICQuicknoteWindowSceneDelegate sceneWillEnterForeground:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 61;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v17 = 0;
  id v6 = +[ICNoteContext sharedContext];
  v7 = [v6 managedObjectContext];

  +[UIView setAnimationsEnabled:0];
  v8 = +[ICAccount accountsWithAccountType:1 context:v7];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100127E64;
  v15[3] = &unk_100628DA8;
  v15[4] = buf;
  [v8 enumerateObjectsUsingBlock:v15];

  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    goto LABEL_7;
  }
  v9 = +[ICAccount accountsWithAccountType:3 context:v7];
  id v10 = [v9 count];
  if (v10) {
    LOBYTE(v10) = +[ICMigrationController didChooseToMigrateLocalAccount];
  }
  *(unsigned char *)(*(void *)&buf[8] + 24) = (_BYTE)v10;

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
LABEL_7:
    unsigned int v11 = [(ICQuicknoteWindowSceneDelegate *)self viewControllerManager];
    [v11 dismissAnyPresentedViewControllerAnimated:0 completion:0];

    int v12 = +[ICQuickNoteSessionManager sharedManager];
    [v12 setSecureScreenShowing:1];
  }
  v13 = [(ICQuicknoteWindowSceneDelegate *)self icWindow];
  [v13 setHidden:0];

  __int16 v14 = [(ICQuicknoteWindowSceneDelegate *)self icWindow];
  [v14 makeKeyWindow];

  _Block_object_dispose(buf, 8);
}

- (void)sceneDidDisconnect:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100127F20;
  v3[3] = &unk_100625AF0;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
}

- (void)setupQuickNoteWithWindowScene:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ICQuicknoteWindowSceneDelegate setupQuickNoteWithWindowScene:]";
    __int16 v28 = 1024;
    int v29 = 133;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  id v6 = +[ICNoteContext sharedContext];
  v7 = [v6 managedObjectContext];

  v8 = +[ICQuickNoteSessionManager sharedManager];
  id v9 = [objc_alloc((Class)ICSecureWindow) initWithWindowScene:v4 behavior:0];

  id v10 = objc_alloc_init(ICViewControllerManager);
  [v9 setViewControllerManager:v10];
  id v11 = +[ICQuickNoteSessionSettings showOnLockScreen];
  int v12 = +[ICAppDelegate sharedInstance];
  v13 = v12;
  if (v11 == (id)3) {
    [v12 quicknoteArchiveState];
  }
  else {
  __int16 v14 = [v12 lastBackgroundedArchiveState];
  }

  +[ICQuickNoteSessionManager requirePasscodeInContext:v7 stateArchive:v14];
  [(ICViewControllerManager *)v10 setupWithWindow:v9 stateRestoreArchive:0 completion:0];
  [(ICQuicknoteWindowSceneDelegate *)self setIcWindow:v9];
  int v15 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  [v15 setEnableMultiscreenHack:1];

  v16 = [(ICViewControllerManager *)v10 noteEditorViewController];
  [v8 saveSession];
  v22 = v8;
  v23 = v7;
  v24 = v14;
  v25 = v10;
  char v17 = v10;
  id v18 = v14;
  id v19 = v7;
  id v20 = v8;
  id v21 = v16;
  dispatchMainAfterDelay();
}

- (ICSecureWindow)icWindow
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