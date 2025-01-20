@interface ICPagesHandoffManager
+ (BOOL)canLaunchPages;
+ (BOOL)canLaunchPagesForNote:(id)a3;
+ (id)bundleIdentifierForPages;
+ (void)updatePagesInstallationStatus;
- (ICLongRunningTaskController)taskController;
- (void)launchPagesWithArchiveFromNote:(id)a3 viewController:(id)a4;
- (void)setTaskController:(id)a3;
@end

@implementation ICPagesHandoffManager

+ (void)updatePagesInstallationStatus
{
  if (+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "+[ICPagesHandoffManager updatePagesInstallationStatus]", 1, 0, @"Unexpected call from main thread");
  }
  id v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = [a1 bundleIdentifierForPages];
  id v8 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  v5 = [v8 userActivityTypes];
  id v6 = [v5 containsObject:@"appleiwork:com.apple.Pages.NoteImport"];
  v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setBool:v6 forKey:@"canLaunchPages"];
}

+ (id)bundleIdentifierForPages
{
  return @"com.apple.Pages";
}

+ (BOOL)canLaunchPages
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"canLaunchPages"];

  return v3;
}

+ (BOOL)canLaunchPagesForNote:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "+[ICPagesHandoffManager canLaunchPagesForNote:]", 1, 0, @"Expected non-nil value for '%s'", "note");
  }
  if ([a1 canLaunchPages])
  {
    if ([v4 isPasswordProtected]) {
      unsigned __int8 v5 = [v4 isAuthenticated];
    }
    else {
      unsigned __int8 v5 = 1;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)launchPagesWithArchiveFromNote:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
  taskController = self->_taskController;
  self->_taskController = v8;

  [(ICLongRunningTaskController *)self->_taskController setShouldShowCancelButton:1];
  [(ICLongRunningTaskController *)self->_taskController setAllowSingleUnitProgress:1];
  [(ICLongRunningTaskController *)self->_taskController setIndeterminate:1];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Preparing…" value:&stru_10063F3D8 table:0];
  [(ICLongRunningTaskController *)self->_taskController setProgressString:v11];

  [(ICLongRunningTaskController *)self->_taskController setShouldShowCircularProgress:1];
  [(ICLongRunningTaskController *)self->_taskController setViewControllerToPresentFrom:v7];
  v12 = +[ICArchiveExporter exporterForHandoffToPages];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1000EA9CC;
  v24[4] = sub_1000EA9DC;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000EA9CC;
  v22[4] = sub_1000EA9DC;
  id v23 = 0;
  v13 = [(ICPagesHandoffManager *)self taskController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EA9E4;
  v17[3] = &unk_100629818;
  v20 = v24;
  id v14 = v12;
  id v18 = v14;
  id v15 = v6;
  id v19 = v15;
  v21 = v22;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EAACC;
  v16[3] = &unk_100629988;
  v16[4] = v24;
  v16[5] = v22;
  [v13 startTask:v17 completionBlock:v16];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

- (ICLongRunningTaskController)taskController
{
  return self->_taskController;
}

- (void)setTaskController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end