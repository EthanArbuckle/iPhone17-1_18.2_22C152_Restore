@interface COSDiagnosticLogsController
- (BOOL)containsAbsolutePath;
- (BOOL)pathsLoaded;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (COSDiagnosticLogsController)init;
- (NSArray)downloadedDiagnosticLogs;
- (NSArray)filePaths;
- (NSArray)screencapturePaths;
- (NSArray)screenshotPaths;
- (NSArray)sysdiagnosePaths;
- (NSSManager)nssManager;
- (NSString)transferredFilesPath;
- (OS_dispatch_queue)queue;
- (id)diagFileSpecifier:(id)a3 isScreenshot:(BOOL)a4;
- (id)specifiers;
- (void)cancelDownload:(id)a3;
- (void)cancelLogTransfer:(id)a3;
- (void)cancelTransferProgress:(id)a3;
- (void)checkIfFileInTransit:(id)a3;
- (void)dealloc;
- (void)deleteLog:(id)a3 withCompletion:(id)a4;
- (void)dismissLogPreviewForDeletedSpecifier:(id)a3;
- (void)displayProgressDetails:(id)a3;
- (void)downloadFileAction:(id)a3;
- (void)downloadFileFromNotification:(id)a3;
- (void)presentCancelLogDownloadAlert:(id)a3;
- (void)recheckFileDownload:(id)a3;
- (void)recheckFileDownloadForCompletetransfer:(id)a3;
- (void)setContainsAbsolutePath:(BOOL)a3;
- (void)setDownloadedDiagnosticLogs:(id)a3;
- (void)setFilePaths:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setPathsLoaded:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setScreencapturePaths:(id)a3;
- (void)setScreenshotPaths:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setSysdiagnosePaths:(id)a3;
- (void)showDeleteOrShareAlert:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateSpecifier:(id)a3 withDownloadPath:(id)a4;
- (void)updateTransferedLogFilesCache;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSDiagnosticLogsController

- (COSDiagnosticLogsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSDiagnosticLogsController;
  v2 = [(COSDiagnosticLogsController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DiagnosticLogRetrieval", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_pathsLoaded = 0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"DiagnosticLogTransferComplete" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"DiagnosticLogTransferTapped" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"DiagnosticLogSpinnerTapped" object:0];

  v6.receiver = self;
  v6.super_class = (Class)COSDiagnosticLogsController;
  [(COSDiagnosticLogsController *)&v6 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)COSDiagnosticLogsController;
  [(COSDiagnosticLogsController *)&v11 viewWillAppear:1];
  if (self->_pathsLoaded) {
    [(COSDiagnosticLogsController *)self setSpecifier:*(void *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
  }
  if (!self->_nssManager)
  {
    id v4 = objc_alloc((Class)NSSManager);
    v5 = [(COSDiagnosticLogsController *)self queue];
    objc_super v6 = (NSSManager *)[v4 initWithQueue:v5];
    nssManager = self->_nssManager;
    self->_nssManager = v6;
  }
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"recheckFileDownloadForCompletetransfer:" name:@"DiagnosticLogTransferComplete" object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"downloadFileFromNotification:" name:@"DiagnosticLogTransferTapped" object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"cancelDownload:" name:@"DiagnosticLogSpinnerTapped" object:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)COSDiagnosticLogsController;
  [(COSDiagnosticLogsController *)&v4 viewDidLoad];
  dispatch_queue_t v3 = [(COSDiagnosticLogsController *)self table];
  [v3 _setDisplaysCellContentStringsOnTapAndHold:1];
}

- (void)downloadFileFromNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"Specifier"];

  [(COSDiagnosticLogsController *)self downloadFileAction:v5];
}

- (void)cancelDownload:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"Specifier"];

  [(COSDiagnosticLogsController *)self presentCancelLogDownloadAlert:v5];
}

- (NSString)transferredFilesPath
{
  v2 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  dispatch_queue_t v3 = [v2 valueForProperty:NRDevicePropertyPairingID];
  objc_super v4 = [v3 UUIDString];

  id v5 = [@"/var/mobile/tmp/BridgeDiagnosticLogs/" stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)COSDiagnosticLogsController;
  [(COSDiagnosticLogsController *)&v17 setSpecifier:v4];
  [(COSDiagnosticLogsController *)self setPathsLoaded:0];
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Gathering diagnostic log list from Gizmo", (uint8_t *)buf, 2u);
  }

  if (!self->_nssManager)
  {
    id v6 = objc_alloc((Class)NSSManager);
    v7 = [(COSDiagnosticLogsController *)self queue];
    v8 = (NSSManager *)[v6 initWithQueue:v7];
    nssManager = self->_nssManager;
    self->_nssManager = v8;
  }
  objc_initWeak(buf, self);
  v10 = self->_nssManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000276DC;
  v11[3] = &unk_100243C60;
  objc_copyWeak(&v15, buf);
  v12 = @"screenshot-";
  v13 = @"screencapture_";
  v14 = @"sysdiagnose_";
  [(NSSManager *)v10 getDiagnosticLogsInfoByCateogry:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (id)specifiers
{
  if (!self->_pathsLoaded)
  {
    v23 = +[NSBundle mainBundle];
    v24 = [v23 localizedStringForKey:@"LOADING" value:&stru_100249230 table:@"DiagnosticLogs"];
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v26 = +[NSArray arrayWithObject:v25];
    uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
    v28 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v26;

    id v29 = *(id *)&self->BPSListController_opaque[v27];
    goto LABEL_22;
  }
  [(COSDiagnosticLogsController *)self updateTransferedLogFilesCache];
  dispatch_queue_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  v44 = objc_opt_new();
  v45 = objc_opt_new();
  v42 = objc_opt_new();
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"DIAGNOSTIC_LOGS" value:&stru_100249230 table:@"DiagnosticLogs"];
  v47 = +[PSSpecifier groupSpecifierWithID:@"FilePaths" name:v6];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"SYSDIAGNOSES" value:&stru_100249230 table:@"DiagnosticLogs"];
  uint64_t v43 = +[PSSpecifier groupSpecifierWithID:@"SysdiagnosePaths" name:v8];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"SCREENSHOTS" value:&stru_100249230 table:@"DiagnosticLogs"];
  v46 = +[PSSpecifier groupSpecifierWithID:@"WatchScreenshots" name:v10];

  objc_super v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"SCREENCAPTURES" value:&stru_100249230 table:@"DiagnosticLogs"];
  v13 = +[PSSpecifier groupSpecifierWithID:@"WatchScreencaptures" name:v12];

  filePaths = self->_filePaths;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10002815C;
  v55[3] = &unk_100243C88;
  v55[4] = self;
  id v15 = v4;
  id v56 = v15;
  [(NSArray *)filePaths enumerateObjectsUsingBlock:v55];
  sysdiagnosePaths = self->_sysdiagnosePaths;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000281C8;
  v53[3] = &unk_100243C88;
  v53[4] = self;
  id v17 = v42;
  id v54 = v17;
  [(NSArray *)sysdiagnosePaths enumerateObjectsUsingBlock:v53];
  screenshotPaths = self->_screenshotPaths;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100028234;
  v51[3] = &unk_100243C88;
  v51[4] = self;
  id v19 = v44;
  id v52 = v19;
  [(NSArray *)screenshotPaths enumerateObjectsUsingBlock:v51];
  screencapturePaths = self->_screencapturePaths;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000282A0;
  v49[3] = &unk_100243C88;
  v49[4] = self;
  id v21 = v45;
  id v50 = v21;
  [(NSArray *)screencapturePaths enumerateObjectsUsingBlock:v49];
  if ([v17 count])
  {
    v22 = (void *)v43;
    [v3 addObject:v43];
    [v3 addObjectsFromArray:v17];
  }
  else
  {

    id v17 = 0;
    v22 = (void *)v43;
  }
  if ([v19 count])
  {
    [v3 addObject:v46];
    [v3 addObjectsFromArray:v19];
  }
  else
  {

    id v19 = 0;
  }
  if ([v21 count])
  {
    [v3 addObject:v13];
    [v3 addObjectsFromArray:v21];
  }
  else
  {

    id v21 = 0;
  }
  if (![v15 count])
  {

    id v15 = 0;
    goto LABEL_16;
  }
  [v3 addObject:v47];
  [v3 addObjectsFromArray:v15];
  if (!v15)
  {
LABEL_16:
    if (!v19 && !v17)
    {
      v30 = +[PSSpecifier emptyGroupSpecifier];
      v31 = +[NSBundle mainBundle];
      [v31 localizedStringForKey:@"FILES_NOT_FOUND" value:&stru_100249230 table:@"DiagnosticLogs"];
      v32 = v3;
      id v33 = v15;
      v34 = v13;
      v36 = v35 = v22;
      [v30 setProperty:v36 forKey:PSFooterTextGroupKey];

      v22 = v35;
      v13 = v34;
      id v15 = v33;
      dispatch_queue_t v3 = v32;
      id v17 = 0;

      [v3 addObject:v30];
    }
  }
  v37 = pbb_bridge_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "done assigning logs to specifiers", buf, 2u);
  }

  uint64_t v38 = OBJC_IVAR___PSListController__specifiers;
  v39 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v40 = v3;

  id v29 = *(id *)&self->BPSListController_opaque[v38];
LABEL_22:

  return v29;
}

- (void)downloadFileAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"DiagnosticLogDownloadingKey"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    [(COSDiagnosticLogsController *)self presentCancelLogDownloadAlert:v4];
  }
  else
  {
    v7 = [v4 propertyForKey:@"DiagnosticLogOriginalPathKey"];
    [(COSDiagnosticLogsController *)self displayProgressDetails:v4];
    v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "downloading file %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    nssManager = self->_nssManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000284E0;
    v10[3] = &unk_100243CB0;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v4;
    [(NSSManager *)nssManager getDiagnosticLogFileFromGizmo:v7 withResults:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentCancelLogDownloadAlert:(id)a3
{
  id v19 = a3;
  id v21 = (char *)objc_alloc_init((Class)PSConfirmationSpecifier);
  dispatch_queue_t v3 = [v19 propertyForKey:@"DiagnosticLogOriginalPathKey"];
  v18 = [v3 lastPathComponent];

  id v17 = +[NSBundle mainBundle];
  v16 = [v17 localizedStringForKey:@"CANCEL_LOG_TRANSFER_TITLE" value:&stru_100249230 table:@"DiagnosticLogs"];
  uint64_t v15 = PSConfirmationOKKey;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"DiagnosticLogs"];
  uint64_t v6 = PSConfirmationCancelKey;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"CANCEL_LOG_TRANSFER_DESCRIPTION_%@" value:&stru_100249230 table:@"DiagnosticLogs"];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v18);
  uint64_t v10 = PSConfirmationPromptKey;
  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"CANCEL_LOG_TRANSFER_TITLE" value:&stru_100249230 table:@"DiagnosticLogs"];
  v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v16, v15, v5, v6, v9, v10, v12, PSConfirmationTitleKey, 0);
  [v21 setupWithDictionary:v13];

  v14 = +[NSNumber numberWithBool:1];
  [v21 setProperty:v14 forKey:PSConfirmationDestructiveKey];

  objc_storeWeak((id *)&v21[OBJC_IVAR___PSSpecifier_target], self);
  [v21 setConfirmationAction:"cancelLogTransfer:"];
  [v21 setProperty:v19 forKey:@"ParentSpecifier"];

  [(COSDiagnosticLogsController *)self showConfirmationViewForSpecifier:v21];
}

- (void)cancelLogTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"ParentSpecifier"];
  uint64_t v6 = [v5 propertyForKey:@"DiagnosticLogOriginalPathKey"];
  v7 = [v6 lastPathComponent];

  objc_initWeak(&location, self);
  nssManager = self->_nssManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028A24;
  v11[3] = &unk_100243CD8;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v5;
  id v13 = v10;
  [(NSSManager *)nssManager cancelDiagnosticLogTranfer:v9 withCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)diagFileSpecifier:(id)a3 isScreenshot:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 lastPathComponent];
  v8 = +[NSString stringWithFormat:@"%@", v7];

  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v9 setButtonAction:"downloadFileAction:"];
  [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  if (!self->_containsAbsolutePath)
  {
    CFStringRef v10 = @"/var/mobile/Library/Logs/CrashReporter";
    if (v4) {
      CFStringRef v10 = @"/tmp/com.apple.Carousel";
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@/%@", v10, v6];

    id v6 = (id)v11;
  }
  [v9 setProperty:v6 forKey:@"DiagnosticLogOriginalPathKey"];

  [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v9 setProperty:v8 forKey:PSIDKey];
  [v9 setProperty:&__kCFBooleanFalse forKey:@"FileDownloadedKey"];
  if (v4) {
    id v12 = &__kCFBooleanFalse;
  }
  else {
    id v12 = &__kCFBooleanTrue;
  }
  [v9 setProperty:v12 forKey:@"IsFileKey"];

  return v9;
}

- (void)recheckFileDownloadForCompletetransfer:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:@"DiagnosticLogTransferComplete"];

  id v5 = [(COSDiagnosticLogsController *)self specifierForID:v8];
  [(COSDiagnosticLogsController *)self updateTransferedLogFilesCache];
  id v6 = [v5 propertyForKey:@"FileDownloadedKey"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0) {
    [(COSDiagnosticLogsController *)self recheckFileDownload:v5];
  }
}

- (void)recheckFileDownload:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  id v5 = [(COSDiagnosticLogsController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028E8C;
  block[3] = &unk_100243D00;
  id v8 = v4;
  id v9 = self;
  CFStringRef v10 = v11;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v11, 8);
}

- (void)checkIfFileInTransit:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:PSIDKey];
  objc_initWeak(&location, self);
  nssManager = self->_nssManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029150;
  v8[3] = &unk_100243D50;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [(NSSManager *)nssManager retrieveDiagnosticLogTransferProgress:v5 withProgress:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)updateSpecifier:(id)a3 withDownloadPath:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029338;
  block[3] = &unk_100243B98;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateTransferedLogFilesCache
{
  dispatch_queue_t v3 = [(COSDiagnosticLogsController *)self transferredFilesPath];
  id v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  id v5 = [v4 subpathsOfDirectoryAtPath:v3 error:&v10];
  id v6 = v10;
  [(COSDiagnosticLogsController *)self setDownloadedDiagnosticLogs:v5];

  if (v6)
  {
    id v7 = [v6 userInfo];
    id v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v8 code] != (id)2)
    {
      id v9 = pbb_bridge_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error while caching transferred diagnostic logs error: %@", buf, 0xCu);
      }
    }
  }
}

- (void)cancelTransferProgress:(id)a3
{
  id v4 = a3;
  [v4 setProperty:&__kCFBooleanFalse forKey:@"DiagnosticLogDownloadingKey"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000295B8;
  v6[3] = &unk_100243908;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)showDeleteOrShareAlert:(id)a3
{
  id v4 = a3;
  id v9 = [v4 propertyForKey:@"DiagnosticLogSharePathKey"];
  id v5 = [COSDiagnosticLogPreviewViewController alloc];
  id v6 = [(COSDiagnosticLogsController *)self queue];
  id v7 = [(COSDiagnosticLogPreviewViewController *)v5 initWithFilePath:v9 andQueue:v6];

  id v8 = [v4 propertyForKey:@"DiagnosticLogOriginalPathKey"];
  [(COSDiagnosticLogPreviewViewController *)v7 setPathOnWatch:v8];

  [(COSDiagnosticLogPreviewViewController *)v7 setParentSpecifier:v4];
  [(COSDiagnosticLogPreviewViewController *)v7 setLogPreviewDelegate:self];
  [(COSDiagnosticLogsController *)self presentViewController:v7 withTransition:3 completion:&stru_100243D70];
}

- (void)displayProgressDetails:(id)a3
{
  id v4 = a3;
  [v4 setProperty:&__kCFBooleanTrue forKey:@"DiagnosticLogDownloadingKey"];
  [(COSDiagnosticLogsController *)self reloadSpecifier:v4];
}

- (void)dismissLogPreviewForDeletedSpecifier:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000297C0;
  v4[3] = &unk_100243908;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)deleteLog:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "request to delete %@", buf, 0xCu);
  }

  nssManager = self->_nssManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000299A0;
  void v11[3] = &unk_100243D98;
  id v12 = v7;
  id v10 = v7;
  [(NSSManager *)nssManager deleteDiagnosticLogFile:v6 withResult:v11];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    id v10 = [(COSDiagnosticLogsController *)self specifierAtIndexPath:v9];
    uint64_t v11 = [v10 propertyForKey:@"DiagnosticLogOriginalPathKey"];
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100029B0C;
    v14[3] = &unk_100243CD8;
    id v12 = v11;
    id v15 = v12;
    objc_copyWeak(&v17, &location);
    id v13 = v10;
    id v16 = v13;
    [(COSDiagnosticLogsController *)self deleteLog:v12 withCompletion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NSArray)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
}

- (NSArray)sysdiagnosePaths
{
  return self->_sysdiagnosePaths;
}

- (void)setSysdiagnosePaths:(id)a3
{
}

- (NSArray)screenshotPaths
{
  return self->_screenshotPaths;
}

- (void)setScreenshotPaths:(id)a3
{
}

- (NSArray)screencapturePaths
{
  return self->_screencapturePaths;
}

- (void)setScreencapturePaths:(id)a3
{
}

- (NSArray)downloadedDiagnosticLogs
{
  return self->_downloadedDiagnosticLogs;
}

- (void)setDownloadedDiagnosticLogs:(id)a3
{
}

- (BOOL)pathsLoaded
{
  return self->_pathsLoaded;
}

- (void)setPathsLoaded:(BOOL)a3
{
  self->_pathsLoaded = a3;
}

- (BOOL)containsAbsolutePath
{
  return self->_containsAbsolutePath;
}

- (void)setContainsAbsolutePath:(BOOL)a3
{
  self->_containsAbsolutePath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedDiagnosticLogs, 0);
  objc_storeStrong((id *)&self->_screencapturePaths, 0);
  objc_storeStrong((id *)&self->_screenshotPaths, 0);
  objc_storeStrong((id *)&self->_sysdiagnosePaths, 0);
  objc_storeStrong((id *)&self->_filePaths, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end