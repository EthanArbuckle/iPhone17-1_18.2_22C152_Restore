@interface SystemDiagnosticiOS
- (BOOL)makeOutputDirectory;
- (BOOL)readCoSysdiagnoseSetting;
- (BOOL)tailspinOnly;
- (BOOL)triggerWatchCoSysdiagnose;
- (BOOL)validateTTRString:(id)a3;
- (BOOL)vibrateStart;
- (BOOL)wasLockedAtLaunch;
- (SystemDiagnosticiOS)init;
- (id)defaultBaseDirectory;
- (id)fetchUserActivity;
- (id)parseSizeToString:(unint64_t)a3;
- (id)searchForTransfer:(id)a3;
- (int)idsCase;
- (int64_t)maxHistory;
- (int64_t)openIssueFiler;
- (int64_t)statusBar;
- (void)clearHistory;
- (void)configureDefaultSettings;
- (void)createFileAndTransfer:(id)a3 atLocation:(id)a4;
- (void)dealloc;
- (void)dropCoSysdiagnoseError:(id)a3;
- (void)gatherDiagnostic;
- (void)getSettings;
- (void)getUserSettings;
- (void)launchSettings_async;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)overrideSettings;
- (void)prompt;
- (void)run;
- (void)sendDefaultsInstructions;
- (void)sendFailedInstructions;
- (void)sendPathToArchive;
- (void)sendUnableToCreateMsg;
- (void)setIdsCase:(int)a3;
- (void)setMaxHistory:(int64_t)a3;
- (void)setOpenIssueFiler:(int64_t)a3;
- (void)setStatusBar:(int64_t)a3;
- (void)setTailspinOnly:(BOOL)a3;
- (void)setVibrateStart:(BOOL)a3;
- (void)setWasLockedAtLaunch:(BOOL)a3;
- (void)startIDSConnection;
- (void)triggerAirPodLogs:(BOOL)a3;
- (void)triggerRemoteSysdiagnoses;
@end

@implementation SystemDiagnosticiOS

- (SystemDiagnosticiOS)init
{
  v9.receiver = self;
  v9.super_class = (Class)SystemDiagnosticiOS;
  v2 = [(SystemDiagnostic *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(SystemDiagnosticiOS *)v2 setIdsCase:0];
    [(SystemDiagnostic *)v3 setDpClass:0];
    [(SystemDiagnostic *)v3 setShouldPostProcess:0];
    v4 = (FBSDisplayLayoutMonitor *)[objc_alloc((Class)FBSDisplayLayoutMonitor) initWithDisplayType:0];
    layoutMonitor = v3->_layoutMonitor;
    v3->_layoutMonitor = v4;

    v6 = v3->_layoutMonitor;
    if (v6) {
      [(FBSDisplayLayoutMonitor *)v6 addObserver:v3];
    }
    id deviceAssertion = v3->_deviceAssertion;
    v3->_id deviceAssertion = 0;

    [(SystemDiagnosticiOS *)v3 setMaxHistory:-1];
  }
  return v3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 elements];

    if (v11)
    {
      id v21 = v8;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v12 = [v9 elements];
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v18 = [v17 bundleIdentifier];
            [(SystemDiagnostic *)self setFrontmostBundleID:v18];

            if (v17)
            {
              v19 = [v17 bundleIdentifier];
              if (v19
                && ([v17 conformsToProtocol:&OBJC_PROTOCOL___SBSDisplayLayoutElement] & 1) != 0)
              {
                id v20 = [v17 layoutRole];

                if (v20 == (id)1) {
                  goto LABEL_16;
                }
              }
              else
              {
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }
LABEL_16:

      id v8 = v21;
    }
  }
}

- (id)defaultBaseDirectory
{
  return +[SDCacheEnumerator sysdiagnoseDirectory];
}

- (void)clearHistory
{
  if ([(SystemDiagnosticiOS *)self maxHistory] != -1)
  {
    id v3 = [[SDCacheEnumerator alloc] initCacheEnumerator];
    v4 = +[NSMutableArray array];
    v5 = +[NSFileManager defaultManager];
    uint64_t v6 = [v3 nextValidURL];
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        [v4 addObject:v7];
        uint64_t v9 = [v3 nextValidURL];

        v7 = (void *)v9;
      }
      while (v9);
    }
    [v4 sortUsingComparator:&stru_10009E0A0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v25 = [v4 count];
      __int16 v26 = 2048;
      int64_t v27 = [(SystemDiagnosticiOS *)self maxHistory];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found %ld files in history with max of %ld", buf, 0x16u);
    }
    id v10 = +[SDResourceManager sharedResourceManager];
    [v10 log:@"Found %ld files in history with max of %ld", [v4 count], -[SystemDiagnosticiOS maxHistory](self, "maxHistory")];

    id v11 = [v4 count];
    if (v11 > (id)[(SystemDiagnosticiOS *)self maxHistory])
    {
      unint64_t v12 = [(SystemDiagnosticiOS *)self maxHistory];
      if (v12 < (unint64_t)[v4 count])
      {
        id v13 = 0;
        do
        {

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v4 objectAtIndexedSubscript:v12];
            *(_DWORD *)buf = 138412546;
            id v25 = v14;
            __int16 v26 = 2048;
            int64_t v27 = v12;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing '%@' at index '%lu'", buf, 0x16u);
          }
          uint64_t v15 = +[SDResourceManager sharedResourceManager];
          v16 = [v4 objectAtIndexedSubscript:v12];
          [v15 log:@"Removing '%@' at index '%lu'", v16, v12];

          v17 = [v4 objectAtIndexedSubscript:v12];
          id v23 = 0;
          [v5 removeItemAtURL:v17 error:&v23];
          id v13 = v23;

          if (v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v4 objectAtIndexedSubscript:v12];
              v19 = [v13 localizedDescription];
              *(_DWORD *)buf = 138412546;
              id v25 = v18;
              __int16 v26 = 2112;
              int64_t v27 = (int64_t)v19;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error removing '%@': %@", buf, 0x16u);
            }
            id v20 = +[SDResourceManager sharedResourceManager];
            id v21 = [v4 objectAtIndexedSubscript:v12];
            long long v22 = [v13 localizedDescription];
            [v20 log:@"Error removing '%@': %@", v21, v22];
          }
          ++v12;
        }
        while (v12 < (unint64_t)[v4 count]);
      }
    }
  }
}

- (BOOL)makeOutputDirectory
{
  [(SystemDiagnosticiOS *)self clearHistory];
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [(SystemDiagnostic *)self baseDirectory];
  v5 = [(id)v4 stringByAppendingPathComponent:@"Latest"];
  [v3 removeItemAtPath:v5 error:0];

  uint64_t v6 = [(SystemDiagnostic *)self outputDirectory];
  LOBYTE(v4) = [(SystemDiagnostic *)self makeTargetDirectory:v6];

  if (v4)
  {
    v7 = [(SystemDiagnostic *)self tmpOutputDirectory];
    unsigned __int8 v8 = [(SystemDiagnostic *)self makeTargetDirectory:v7];

    if (v8) {
      return 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(SystemDiagnostic *)self tmpOutputDirectory];
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create directory: %@", buf, 0xCu);
    }
    v16 = +[SDResourceManager sharedResourceManager];
    v17 = [(SystemDiagnostic *)self tmpOutputDirectory];
    [v16 stdoutWrite:@"Failed to create directory: %@", v17];

    id v13 = +[SDResourceManager sharedResourceManager];
    uint64_t v14 = [(SystemDiagnostic *)self tmpOutputDirectory];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(SystemDiagnostic *)self outputDirectory];
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create directory: %@", buf, 0xCu);
    }
    id v11 = +[SDResourceManager sharedResourceManager];
    unint64_t v12 = [(SystemDiagnostic *)self outputDirectory];
    [v11 stdoutWrite:@"Failed to create directory: %@", v12];

    id v13 = +[SDResourceManager sharedResourceManager];
    uint64_t v14 = [(SystemDiagnostic *)self outputDirectory];
  }
  v18 = (void *)v14;
  [v13 log:@"Failed to create directory: %@", v14];

  return 0;
}

- (BOOL)readCoSysdiagnoseSetting
{
  BOOL v3 = [(SystemDiagnosticiOS *)self idsCase] == 5 || [(SystemDiagnosticiOS *)self idsCase] == 2;
  uint64_t v4 = sub_10002AD00();
  v5 = [v4 objectForKeyedSubscript:@"cosysdiagnose"];
  uint64_t v6 = v5;
  if (v5) {
    BOOL v3 = [v5 integerValue] == (id)1;
  }

  return v3;
}

- (void)createFileAndTransfer:(id)a3 atLocation:(id)a4
{
  id v9 = a4;
  sub_100025030(a3, v9);
  uint64_t v6 = +[SystemDiagnosticIDS sharedInstance];
  v7 = [(SystemDiagnostic *)self diagnosticID];
  LODWORD(self) = [v6 sendFileAtPath:v9 forDiagnosticID:v7 withCase:-[SystemDiagnosticiOS idsCase](self, "idsCase")];

  if (self)
  {
    unsigned __int8 v8 = +[NSFileManager defaultManager];
    [v8 removeItemAtPath:v9 error:0];
  }
}

- (void)sendUnableToCreateMsg
{
  BOOL v3 = [(SystemDiagnostic *)self outputDirectory];
  id v4 = [v3 stringByAppendingPathComponent:@"co-sysdiagnose-failed.log"];

  [(SystemDiagnosticiOS *)self createFileAndTransfer:@"Co-sysdiagnose archive could not be transferred to the phone.\nThe sysdiagnose archive creation on the device failed.\nSee the logfile generated inside the watch's sysdiagnose directory for more details.\n" atLocation:v4];
}

- (void)sendFailedInstructions
{
  BOOL v3 = [(SystemDiagnostic *)self outputDirectory];
  id v4 = [v3 stringByAppendingPathComponent:@"co-sysdiagnose-failed.log"];

  [(SystemDiagnosticiOS *)self createFileAndTransfer:@"Co-sysdiagnose archive could not be transferred to the phone.\nSince the current sysdiagnose was run before first unlock, it cannot be accessed due to Data Protection class\n\n" atLocation:v4];
}

- (void)sendDefaultsInstructions
{
  BOOL v3 = [(SystemDiagnostic *)self outputDirectory];
  id v4 = [v3 stringByAppendingPathComponent:@"co-sysdiagnose-disabled.log"];

  [(SystemDiagnosticiOS *)self createFileAndTransfer:@"Co-sysdiagnoses are disabled on the watch.\nTo re-enable them, ssh in to your watch as mobile and run:\ndefaults write com.apple.sysdiagnose cosysdiagnose -BOOL true \n\n" atLocation:v4];
}

- (void)sendPathToArchive
{
  BOOL v3 = [(SystemDiagnosticiOS *)self defaultBaseDirectory];
  id v6 = [v3 stringByAppendingPathComponent:@"co-sysdiagnose-location.log"];

  id v4 = [(SystemDiagnostic *)self completedTarballPath];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Co-sysdiagnoses was triggered from command line.\nThe local archive can be found at the following path on the watch:\n%s\n\n", [v4 UTF8String]);

  [(SystemDiagnosticiOS *)self createFileAndTransfer:v5 atLocation:v6];
}

- (void)dropCoSysdiagnoseError:(id)a3
{
}

- (void)prompt
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [(SystemDiagnostic *)self earlyPrompt];
    id v4 = [(SystemDiagnostic *)self diagnosticID];
    *(_DWORD *)buf = 67109378;
    unsigned int v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt early enabled: %d for id: %@", buf, 0x12u);
  }
  v5 = +[SDResourceManager sharedResourceManager];
  unsigned int v6 = [(SystemDiagnostic *)self earlyPrompt];
  v7 = [(SystemDiagnostic *)self diagnosticID];
  [v5 log:@"Prompt early enabled: %d for id: %@", v6, v7];

  unsigned __int8 v8 = objc_alloc_init(SDPromptDelegate);
  [(SDPromptDelegate *)v8 setIsEarlyPrompt:[(SystemDiagnostic *)self earlyPrompt]];
  [(SDPromptDelegate *)v8 setOpenIssueFiler:[(SystemDiagnosticiOS *)self openIssueFiler]];
  id v9 = [(SystemDiagnostic *)self diagnosticID];
  [(SDPromptDelegate *)v8 setDiagnosticID:v9];

  id v10 = [(SystemDiagnostic *)self frontmostBundleID];
  [(SDPromptDelegate *)v8 setBundleID:v10];

  [(SDPromptDelegate *)v8 setDidPartnerTimeout:0];
  [(SDPromptDelegate *)v8 setIsCoSysdiagnoseResponse:[(SystemDiagnosticiOS *)self idsCase] == 4];
  id v11 = [(SystemDiagnosticiOS *)self fetchUserActivity];
  [(SDPromptDelegate *)v8 setTtrOverrideURLStr:v11];

  sub_10002AA18(v8);
  [(SystemDiagnosticiOS *)self setOpenIssueFiler:0];
}

- (BOOL)triggerWatchCoSysdiagnose
{
  if ([(SystemDiagnosticiOS *)self idsCase] == 1 || [(SystemDiagnosticiOS *)self idsCase] == 3)
  {
    unsigned int v3 = +[SystemDiagnosticIDS sharedInstance];
    unsigned __int8 v4 = [v3 isPaired];

    if ((v4 & 1) == 0)
    {
      [(SystemDiagnosticiOS *)self setIdsCase:0];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)self idsCase]];
        *(_DWORD *)buf = 138412290;
        id v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is unpaired, switching to %@", buf, 0xCu);
      }
      unsigned int v6 = +[SDResourceManager sharedResourceManager];
      v7 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)self idsCase]];
      [v6 log:@"Device is unpaired, switching to %@", v7];
    }
  }
  BOOL v8 = [(SystemDiagnosticiOS *)self readCoSysdiagnoseSetting];
  [(SystemDiagnosticiOS *)self startIDSConnection];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)self idsCase]];
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The case is %@", buf, 0xCu);
  }
  id v10 = +[SDResourceManager sharedResourceManager];
  id v11 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)self idsCase]];
  [v10 stdoutWrite:@"The case is %@", v11];

  unint64_t v12 = +[SDResourceManager sharedResourceManager];
  unsigned int v13 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)self idsCase]];
  [v12 log:@"The case is %@", v13];

  if ([(SystemDiagnosticiOS *)self idsCase] == 3
    && [(SystemDiagnostic *)self requestSource] == 2)
  {
    [(SystemDiagnosticiOS *)self sendPathToArchive];
  }
  __int16 v14 = +[SystemDiagnosticIDS sharedInstance];
  uint64_t v15 = [(SystemDiagnostic *)self diagnosticID];
  v16 = [v14 getDispatchGroupForDiagnostic:v15];

  if (v16) {
    dispatch_group_enter(v16);
  }
  char v17 = [(SystemDiagnosticiOS *)self idsCase] != 5 || v8;
  if ((v17 & 1) == 0) {
    [(SystemDiagnosticiOS *)self sendDefaultsInstructions];
  }

  return v8;
}

- (void)triggerAirPodLogs:(BOOL)a3
{
  id v5 = +[SystemDiagnosticBT sharedInstance];
  unsigned __int8 v4 = [(SystemDiagnostic *)self diagnosticID];
  [v5 startBTSessionAndTriggerAirPodLogs:v4];
}

- (void)triggerRemoteSysdiagnoses
{
  BOOL v3 = [(SystemDiagnosticiOS *)self triggerWatchCoSysdiagnose];
  if (NSClassFromString(@"NRPairedDeviceRegistry")) {
    BOOL v4 = !v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4
    && ([(SystemDiagnosticiOS *)self idsCase] == 4 || [(SystemDiagnosticiOS *)self idsCase] == 1))
  {
    id v5 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v6 = [v5 getActivePairedDevice];

    v7 = +[NRPairedDeviceRegistry sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000586E8;
    v11[3] = &unk_10009E0C8;
    v11[4] = self;
    [v7 setActivePairedDevice:v6 withActiveDeviceAssertionHandler:v11];
  }
  BOOL v8 = +[CSCoordinator sharedInstance];
  id v9 = [(SystemDiagnostic *)self prepareCoSysdiagnoseParams];
  id v10 = [(SystemDiagnostic *)self diagnosticID];
  [v8 triggerCoSysdiagnosesWithParams:v9 forDiagnosticID:v10];

  [(SystemDiagnosticiOS *)self triggerAirPodLogs:v3];
}

- (void)gatherDiagnostic
{
  BOOL v3 = +[SDTaskDepot sharedTaskDepot];
  [v3 setMayStartExecuting:1];
  BOOL v4 = +[CSCoordinator sharedInstance];
  id v5 = [(SystemDiagnostic *)self outputDirectory];
  unsigned int v6 = [(SystemDiagnostic *)self diagnosticID];
  [v4 readyToReceiveCoSysdiagnosesAtDir:v5 forDiagnosticID:v6];

  [(SystemDiagnosticiOS *)self triggerRemoteSysdiagnoses];
  if ([(SystemDiagnostic *)self coSysdiagnoseOnly])
  {
    v7 = +[CSCoordinator sharedInstance];
    BOOL v8 = [(SystemDiagnostic *)self diagnosticID];
    [v7 waitForCoSysdiagnosesForDiagnosticID:v8];

    [(SystemDiagnostic *)self endDiagnostics];
  }
  else
  {
    id v9 = [(SystemDiagnostic *)self outputDirectory];
    [v3 setOutputDirectory:v9];

    [v3 setPushBufferDelegate:self];
    id v10 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
    [(SystemDiagnostic *)self setOldestDateCreatedCutoff:v10];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting start notification", buf, 2u);
    }
    id v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Posting start notification"];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sysdiagnose.sysdiagnoseStarted", 0, 0, 1u);
    [(SystemDiagnostic *)self executeDiagnosticContainers];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting stop notification", v15, 2u);
    }
    unsigned int v13 = +[SDResourceManager sharedResourceManager];
    [v13 log:@"Posting stop notification"];

    __int16 v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v14, @"com.apple.sysdiagnose.sysdiagnoseStopped", 0, 0, 1u);
  }
}

- (void)launchSettings_async
{
  v2 = dispatch_get_global_queue(33, 0);
  dispatch_async(v2, &stru_10009E0E8);
}

- (void)configureDefaultSettings
{
  if (sub_100048604())
  {
    [(SystemDiagnosticiOS *)self setTailspinOnly:0];
    [(SystemDiagnosticiOS *)self setOpenIssueFiler:1];
    [(SystemDiagnosticiOS *)self setStatusBar:2];
    [(SystemDiagnosticiOS *)self setVibrateStart:1];
  }
  else
  {
    id v3 = sub_100024694();
    [(SystemDiagnosticiOS *)self setTailspinOnly:0];
    [(SystemDiagnosticiOS *)self setOpenIssueFiler:v3];
    [(SystemDiagnosticiOS *)self setStatusBar:0];
    [(SystemDiagnosticiOS *)self setVibrateStart:1];
    [(SystemDiagnostic *)self setEarlyPrompt:v3];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v6 = [(SystemDiagnosticiOS *)self openIssueFiler];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Seed check : %ld", buf, 0xCu);
    }
    BOOL v4 = +[SDResourceManager sharedResourceManager];
    [v4 log:@"Seed check : %ld" -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler")];
  }
}

- (void)getUserSettings
{
  sub_10002AD00();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v12 objectForKeyedSubscript:@"tailspinOnly"];
  BOOL v4 = v3;
  if (v3) {
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", [v3 BOOLValue]);
  }
  id v5 = [v12 objectForKeyedSubscript:@"postCompletion"];

  if (v5) {
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", [v5 integerValue]);
  }
  int64_t v6 = [v12 objectForKeyedSubscript:@"vibrateStart"];

  if (v6) {
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", [v6 BOOLValue]);
  }
  v7 = [v12 objectForKeyedSubscript:@"statusBar"];

  if (v7) {
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", [v7 integerValue]);
  }
  if ([(SystemDiagnostic *)self coSysdiagnose])
  {
    BOOL v8 = v7;
    goto LABEL_21;
  }
  BOOL v8 = [v12 objectForKeyedSubscript:@"cosysdiagnose"];

  if (v8)
  {
    if (![(SystemDiagnosticiOS *)self idsCase] || [(SystemDiagnosticiOS *)self idsCase] == 1)
    {
      uint64_t v9 = (uint64_t)[v8 BOOLValue];
LABEL_20:
      [(SystemDiagnosticiOS *)self setIdsCase:v9];
      goto LABEL_21;
    }
    if ([(SystemDiagnosticiOS *)self idsCase] == 2 || [(SystemDiagnosticiOS *)self idsCase] == 3)
    {
      if ([v8 BOOLValue]) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
      goto LABEL_20;
    }
  }
LABEL_21:
  id v10 = [v12 objectForKeyedSubscript:@"earlyPrompt"];

  if (v10) {
    -[SystemDiagnostic setEarlyPrompt:](self, "setEarlyPrompt:", [v10 BOOLValue]);
  }
  if ([(SystemDiagnostic *)self disableUIFeedback])
  {
    [(SystemDiagnosticiOS *)self setOpenIssueFiler:0];
    [(SystemDiagnosticiOS *)self setStatusBar:0];
  }
  id v11 = [v12 objectForKeyedSubscript:@"maxHistory"];

  if (v11) {
    -[SystemDiagnosticiOS setMaxHistory:](self, "setMaxHistory:", [v11 integerValue]);
  }
}

- (void)overrideSettings
{
  if ([(SystemDiagnostic *)self coSysdiagnose])
  {
    int64_t v3 = [(SystemDiagnostic *)self coSysdiagnose];
    unsigned int v4 = [(SystemDiagnosticiOS *)self idsCase];
    if (v3 == 2)
    {
      if (v4 && [(SystemDiagnosticiOS *)self idsCase] != 1)
      {
        if ([(SystemDiagnosticiOS *)self idsCase] != 2
          && [(SystemDiagnosticiOS *)self idsCase] != 3)
        {
          return;
        }
        uint64_t v5 = 3;
      }
      else
      {
        uint64_t v5 = 1;
      }
    }
    else if (v4 && [(SystemDiagnosticiOS *)self idsCase] != 1)
    {
      if ([(SystemDiagnosticiOS *)self idsCase] != 2 && [(SystemDiagnosticiOS *)self idsCase] != 3) {
        return;
      }
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 0;
    }
    [(SystemDiagnosticiOS *)self setIdsCase:v5];
  }
}

- (void)getSettings
{
  [(SystemDiagnosticiOS *)self configureDefaultSettings];
  [(SystemDiagnosticiOS *)self getUserSettings];

  [(SystemDiagnosticiOS *)self overrideSettings];
}

- (id)searchForTransfer:(id)a3
{
  id v22 = a3;
  int64_t v3 = +[NSFileManager defaultManager];
  unsigned int v4 = +[NSURL fileURLWithPath:@"/private/var/mobile/Library/IdentityServices/incomingfiles"];
  uint64_t v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0);
  id v21 = v3;
  int64_t v6 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:4 errorHandler:0];

  v7 = +[NSDate distantPast];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    id v23 = 0;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        __int16 v14 = [v12 absoluteString];
        id v15 = [v14 rangeOfString:@"sysdiagnose"];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v25 = 0;
          [v12 getResourceValue:&v25 forKey:NSURLCreationDateKey error:0];
          id v16 = v25;
          if ([v16 compare:v7] == (id)1)
          {
            id v17 = v16;

            id v18 = v12;
            id v23 = v18;
            v7 = v17;
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    id v23 = 0;
  }

  v19 = [v23 path];

  return v19;
}

- (id)parseSizeToString:(unint64_t)a3
{
  if (a3 > 0x100000) {
    +[NSString stringWithFormat:@"%lu MB", (unint64_t)(int)a3 >> 20];
  }
  else {
  int64_t v3 = +[NSString stringWithFormat:@"%lu KB", a3 >> 10];
  }

  return v3;
}

- (void)run
{
  sub_1000291EC();
  [(SystemDiagnosticiOS *)self getSettings];
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = [(SystemDiagnosticiOS *)self openIssueFiler];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done reading settings: issueFiler %ld", buf, 0xCu);
  }

  unsigned int v4 = &selRef_verbose;
  uint64_t v5 = +[SDResourceManager sharedResourceManager];
  [v5 log:@"Done reading settings: issueFiler %ld", -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler")];

  if ((sub_100048604() & 1) == 0) {
    [(SystemDiagnosticiOS *)self setStatusBar:0];
  }
  if ([(SystemDiagnostic *)self requestSource] == 1
    || [(SystemDiagnostic *)self requestSource] == 4
    || [(SystemDiagnostic *)self deShowFeedback])
  {
    sub_100029C10([(SystemDiagnosticiOS *)self vibrateStart], [(SystemDiagnosticiOS *)self statusBar]);
  }
  if (![(SystemDiagnostic *)self requestSource]) {
    sub_100065E8C(&v160, buf);
  }
  unsigned int v6 = [(SystemDiagnostic *)self requestSource];
  if (v6 > 5)
  {
LABEL_17:
    id v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected request", buf, 2u);
    }

    id v12 = +[SDResourceManager sharedResourceManager];
    [v12 stdoutWrite:@"unexpected request"];

    unsigned int v13 = +[SDResourceManager sharedResourceManager];
    [v13 log:@"unexpected request"];

    goto LABEL_20;
  }
  if (((1 << v6) & 0x2C) == 0)
  {
    if (((1 << v6) & 0x12) != 0)
    {
      if ([(SystemDiagnosticiOS *)self tailspinOnly])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring full sysdiagnose request due to tailspin only user preference.", buf, 2u);
        }
        v7 = +[SDResourceManager sharedResourceManager];
        [v7 stdoutWrite:@"ignoring full sysdiagnose request due to tailspin only user preference."];

        id v8 = +[SDResourceManager sharedResourceManager];
        [v8 log:@"ignoring full sysdiagnose request due to tailspin only user preference."];

        id v9 = [(SystemDiagnostic *)self diagnosticID];
        sub_1000260E8(v9);

        uint64_t v10 = +[SDResourceManager sharedResourceManager];
        [v10 closeSysdiagnoseSession];

        sub_10002AFA4(0);
        return;
      }
      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_20:
  layoutMonitor = self->_layoutMonitor;
  if (layoutMonitor)
  {
    [(FBSDisplayLayoutMonitor *)layoutMonitor invalidate];
    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(SystemDiagnostic *)self frontmostBundleID];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Front-most bundleID is %@", buf, 0xCu);
    }
    id v17 = +[SDResourceManager sharedResourceManager];
    id v18 = [(SystemDiagnostic *)self frontmostBundleID];
    [v17 log:@"Front-most bundleID is %@", v18];

    v19 = self->_layoutMonitor;
    self->_layoutMonitor = 0;
  }
  v151.receiver = self;
  v151.super_class = (Class)SystemDiagnosticiOS;
  [(SystemDiagnostic *)&v151 run];
  id v20 = objc_alloc_init(SDPromptDelegate);
  id v21 = [(SystemDiagnostic *)self diagnosticID];
  [(SDPromptDelegate *)v20 setDiagnosticID:v21];

  [(SDPromptDelegate *)v20 setOpenIssueFiler:[(SystemDiagnosticiOS *)self openIssueFiler]];
  [(SDPromptDelegate *)v20 setDidPartnerTimeout:0];
  id v22 = [(SystemDiagnostic *)self frontmostBundleID];
  [(SDPromptDelegate *)v20 setBundleID:v22];

  id v23 = +[SystemDiagnosticIDS sharedInstance];
  long long v24 = [(SystemDiagnostic *)self diagnosticID];
  id v25 = [v23 getDispatchGroupForDiagnostic:v24];

  if (v25)
  {
    dispatch_group_leave(v25);
  }
  else
  {
    id v26 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = [(SystemDiagnostic *)self diagnosticID];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Expecting a co-sysdiagnose for %@, but no dispatch group was found.", buf, 0xCu);
    }
    long long v28 = +[SDResourceManager sharedResourceManager];
    long long v29 = [(SystemDiagnostic *)self diagnosticID];
    [v28 log:@"Expecting a co-sysdiagnose for %@, but no dispatch group was found.", v29];
  }
  switch([(SystemDiagnosticiOS *)self idsCase])
  {
    case 1:
    case 4:
      uint64_t v30 = [(SystemDiagnostic *)self diagnosticID];
      v31 = +[SDCacheEnumerator sysdiagnoseDirectory];
      v32 = [@"co-" stringByAppendingString:v30];
      v33 = [v31 stringByAppendingPathComponent:v32];

      v133 = [v33 stringByAppendingPathExtension:@"tar"];
      v34 = +[NSFileManager defaultManager];
      v141 = +[NSMutableArray arrayWithCapacity:3];
      id v35 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(SystemDiagnostic *)self diagnosticID];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"Waiting for Watch diagnostics...";
        __int16 v156 = 2112;
        uint64_t v157 = (uint64_t)v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ -- %@", buf, 0x16u);
      }
      v37 = +[SDResourceManager sharedResourceManager];
      v38 = [(SystemDiagnostic *)self diagnosticID];
      [v37 stdoutWrite:@"%@ -- %@", @"Waiting for Watch diagnostics...", v38];

      v39 = +[SDResourceManager sharedResourceManager];
      v40 = [(SystemDiagnostic *)self diagnosticID];
      v142 = @"Waiting for Watch diagnostics...";
      [v39 log:@"%@ -- %@", @"Waiting for Watch diagnostics...", v40];

      v41 = +[SDResourceManager sharedResourceManager];
      [v41 sendProgress:4 phase:0 toPeers:0.0];

      char v150 = 0;
      v138 = v34;
      v136 = v33;
      unsigned __int8 v42 = [v34 fileExistsAtPath:v33 isDirectory:&v150];
      if ((v42 & (v150 != 0)) != 0) {
        uint64_t v43 = 0;
      }
      else {
        uint64_t v43 = 1801;
      }
      group = v25;
      v135 = (void *)v30;
      if (!v25)
      {
        v137 = 0;
        v139 = 0;
        goto LABEL_96;
      }
      if ((v42 & (v150 != 0)) != 0)
      {
        v137 = 0;
        v139 = 0;
        goto LABEL_96;
      }
      v139 = 0;
      v137 = 0;
      int v44 = 1;
      unint64_t v45 = -1;
      v142 = @"Waiting for Watch diagnostics...";
      while (2)
      {
        if (![(SystemDiagnostic *)self didComplete]) {
          goto LABEL_96;
        }
        v46 = +[SystemDiagnosticIDS sharedInstance];
        id v47 = [v46 transfer_size];

        if (!v47) {
          goto LABEL_43;
        }
        if (v139)
        {
          if (![v138 fileExistsAtPath:v139])
          {
LABEL_43:
            v49 = (char *)v45;
            goto LABEL_46;
          }
          v48 = [v138 attributesOfItemAtPath:v139 error:0];
          v49 = (char *)[v48 fileSize];

          v50 = [(SystemDiagnosticiOS *)self parseSizeToString:v49];
          uint64_t v51 = +[NSString stringWithFormat:@"Transferred: %@ / %@", v50, v137];

          v52 = +[SystemDiagnosticIDS sharedInstance];
          double v53 = (double)(unint64_t)v49 / (double)(unint64_t)[v52 transfer_size] * 100.0;

          v54 = +[SDResourceManager sharedResourceManager];
          [v54 sendProgress:5 phase:0 toPeers:v53];
          v142 = (__CFString *)v51;
          unsigned int v4 = &selRef_verbose;
        }
        else
        {
          v139 = [(SystemDiagnosticiOS *)self searchForTransfer:v136];
          v50 = +[SystemDiagnosticIDS sharedInstance];
          -[SystemDiagnosticiOS parseSizeToString:](self, "parseSizeToString:", [v50 transfer_size]);
          v54 = v137;
          v137 = v49 = (char *)v45;
        }

LABEL_46:
        sub_100029A80(v142);
        if (v45 != -1)
        {
          if ((unint64_t)v49 >= v45)
          {
            v57 = +[NSNumber numberWithUnsignedLongLong:&v49[-v45]];
            [v141 insertObject:v57 atIndex:0];

            if ((unint64_t)[v141 count] >= 4) {
              [v141 removeLastObject];
            }
          }
          else
          {
            id v55 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Old size of file is larger than the current size.", buf, 2u);
            }

            v56 = [v4 + 373 sharedResourceManager];
            [v56 log:@"Old size of file is larger than the current size."];

            [v141 insertObject:&off_1000B1370 atIndex:0];
          }
        }
        dispatch_time_t v58 = dispatch_time(0, 2000000000);
        if (!dispatch_group_wait(group, v58)) {
          goto LABEL_96;
        }
        if (v43 > 1)
        {
          v43 -= 2;
          goto LABEL_75;
        }
        if ((sub_100048604() & v44) == 1)
        {
          *(void *)buf = 0;
          CFUserNotificationDisplayAlert(10.0, 0, 0, 0, 0, @"Co-sysdiagnose Timeout Reached", @"Continue waiting for co-sysdiagnose or transfer watch archive independently?", @"Watch-only", @"Co-sysdiagnose", 0, (CFOptionFlags *)buf);
          long long v146 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          id v59 = v141;
          id v60 = [v59 countByEnumeratingWithState:&v146 objects:v154 count:16];
          if (v60)
          {
            id v61 = v60;
            unsigned __int8 v62 = 0;
            uint64_t v63 = *(void *)v147;
            do
            {
              for (i = 0; i != v61; i = (char *)i + 1)
              {
                if (*(void *)v147 != v63) {
                  objc_enumerationMutation(v59);
                }
                v62 |= (uint64_t)[*(id *)(*((void *)&v146 + 1) + 8 * i) longLongValue] > 0;
              }
              id v61 = [v59 countByEnumeratingWithState:&v146 objects:v154 count:16];
            }
            while (v61);
          }
          else
          {
            unsigned __int8 v62 = 0;
          }

          if (*(void *)buf == 1) {
            int v65 = 1;
          }
          else {
            int v65 = v62 & (*(void *)buf == 3);
          }
          if (v65 == 1)
          {
            id v66 = &_os_log_default;
            unsigned int v4 = &selRef_verbose;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v160 = 0x70904000100;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timeout extended by %d seconds", (uint8_t *)&v160, 8u);
            }

            v67 = +[SDResourceManager sharedResourceManager];
            [v67 log:@"Timeout extended by %d seconds", 1801];

            uint64_t v43 = 1801;
          }
          else
          {
            uint64_t v43 = -1;
            unsigned int v4 = &selRef_verbose;
          }
          int v44 = v65 ^ 1;
LABEL_75:
          unint64_t v45 = (unint64_t)v49;
          if (v43 < 1) {
            goto LABEL_96;
          }
          continue;
        }
        break;
      }
      uint64_t v43 = -1;
LABEL_96:
      if ([(SystemDiagnostic *)self didComplete])
      {
        id deviceAssertion = self->_deviceAssertion;
        v78 = v133;
        if (deviceAssertion) {
          [deviceAssertion invalidate];
        }
        if (v43 < 0)
        {
          [(SDPromptDelegate *)v20 setDidPartnerTimeout:1];
          id v86 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watch archive did not arrive before timeout", buf, 2u);
          }

          v87 = [v4 + 373 sharedResourceManager];
          [v87 stdoutWrite:@"Watch archive did not arrive before timeout"];

          v88 = [v4 + 373 sharedResourceManager];
          [v88 log:@"Watch archive did not arrive before timeout"];

          v89 = +[SystemDiagnosticIDS sharedInstance];
          [v89 setPreferredWifi:0];

          v90 = +[SystemDiagnosticIDS sharedInstance];
          [v90 sendMessage:3 WithString:@"Companion Timedout"];

          v91 = [v4 + 373 sharedResourceManager];
          [v91 sendProgress:6 phase:0 toPeers:0.0];

          v92 = [v133 stringByDeletingLastPathComponent];
          v93 = [@"incomplete-" stringByAppendingString:v135];
          v79 = [v92 stringByAppendingPathComponent:v93];

          v78 = [v79 stringByAppendingPathExtension:@"tar"];
        }
        else
        {
          v79 = [v4 + 373 sharedResourceManager];
          [v79 sendProgress:7 phase:0 toPeers:100.0];
        }

        if ([(SystemDiagnostic *)self requestSource] == 2)
        {
          v94 = [v4 + 373 sharedResourceManager];
          [v94 closeSysdiagnoseSession];
        }
        v95 = +[SystemDiagnosticIDS sharedInstance];
        [v95 setTransfer_size:0];

        NSFileAttributeKey v152 = NSFilePosixPermissions;
        v153 = &off_1000B1388;
        v96 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        id v145 = 0;
        unsigned __int8 v97 = [v138 createDirectoryAtPath:v136 withIntermediateDirectories:0 attributes:v96 error:&v145];
        id v98 = v145;

        if ((v97 & 1) == 0)
        {
          id v99 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v100 = [v98 localizedDescription];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v136;
            __int16 v156 = 2112;
            uint64_t v157 = (uint64_t)v100;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create the co-sysdiagnose directory %@ due to error: %@", buf, 0x16u);
          }
          v101 = [v4 + 373 sharedResourceManager];
          v102 = [v98 localizedDescription];
          [v101 log:@"Could not create the co-sysdiagnose directory %@ due to error: %@", v136, v102];
        }
        if ([(SystemDiagnostic *)self shouldCreateTarBall]) {
          [(SystemDiagnostic *)self tarballPath];
        }
        else {
        id v103 = [(SystemDiagnostic *)self outputDirectory];
        }

        uint64_t v104 = [v103 lastPathComponent];
        uint64_t v105 = [v136 stringByAppendingPathComponent:v104];

        id v144 = 0;
        v106 = (void *)v105;
        LOBYTE(v104) = [v138 moveItemAtPath:v103 toPath:v105 error:&v144];
        id v134 = v144;
        if ((v104 & 1) == 0)
        {
          id v107 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v108 = [v134 localizedDescription];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v103;
            __int16 v156 = 2112;
            uint64_t v157 = v105;
            __int16 v158 = 2112;
            v159 = v108;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move phone directory %@ to location %@ with error %@", buf, 0x20u);
          }
          v109 = [v4 + 373 sharedResourceManager];
          v110 = [v134 localizedDescription];
          [v109 log:@"Could not move phone directory %@ to location %@ with error %@", v103, v106, v110];
        }
        v132 = v103;
        if (v43 < 0 && v139)
        {
          v111 = [v139 lastPathComponent];
          v112 = [v111 stringByDeletingPathExtension];
          v113 = [v112 stringByDeletingPathExtension];
          [v113 stringByAppendingPathExtension:@"log"];
          v115 = v114 = v78;
          v116 = [v136 stringByAppendingPathComponent:v115];
          [(SystemDiagnosticiOS *)self dropCoSysdiagnoseError:v116];

          v78 = v114;
          unsigned int v4 = &selRef_verbose;
        }
        v85 = v136;
        if ([(SystemDiagnostic *)self shouldCreateTarBall])
        {
          if ([(SystemDiagnostic *)self useParallelCompression]) {
            unsigned int v117 = 20;
          }
          else {
            unsigned int v117 = 16;
          }
          sub_1000270A8(v136, v78, v117, 0);
        }
        unsigned int v118 = [(SystemDiagnostic *)self shouldCreateTarBall];
        v119 = [(SystemDiagnostic *)self baseDirectory];
        if (v118)
        {
          v120 = [v78 lastPathComponent];
          v121 = [v119 stringByAppendingPathComponent:v120];
          [(SystemDiagnostic *)self setTarballPath:v121];

          [(SystemDiagnostic *)self setOutputDirectory:v136];
        }
        else
        {
          v122 = [v136 lastPathComponent];
          v123 = [v119 stringByAppendingPathComponent:v122];
          [(SystemDiagnostic *)self setOutputDirectory:v123];

          [(SystemDiagnostic *)self setTarballPath:v78];
        }

        v81 = v78;
        if ([(SystemDiagnostic *)self shouldCreateTarBall]) {
          v124 = v78;
        }
        else {
          v124 = v136;
        }
        id v125 = v124;
        if ([(SystemDiagnostic *)self shouldCreateTarBall]) {
          [(SystemDiagnostic *)self tarballPath];
        }
        else {
        id v126 = [(SystemDiagnostic *)self outputDirectory];
        }

        id v143 = 0;
        unsigned __int8 v127 = [v138 moveItemAtPath:v125 toPath:v126 error:&v143];
        id v84 = v143;
        if ((v127 & 1) == 0)
        {
          id v128 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v129 = [v84 localizedDescription];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v125;
            __int16 v156 = 2112;
            uint64_t v157 = (uint64_t)v126;
            __int16 v158 = 2112;
            v159 = v129;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move co-sysdiagnose from %@ to %@ with error %@", buf, 0x20u);
          }
          v130 = [v4 + 373 sharedResourceManager];
          v131 = [v84 localizedDescription];
          [v130 log:@"Could not move co-sysdiagnose from %@ to %@ with error %@", v125, v126, v131];
        }
        if ([(SystemDiagnostic *)self requestSource] == 3) {
          [(SDPromptDelegate *)v20 setOpenIssueFiler:0];
        }
        sub_10002AFA4(v20);

        id v25 = group;
        v80 = v135;
      }
      else
      {
        v81 = v133;
        v80 = v135;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelled co-sysdiagnose.", buf, 2u);
        }
        v82 = [v4 + 373 sharedResourceManager];
        [v82 stdoutWrite:@"Cancelled co-sysdiagnose."];

        v83 = [v4 + 373 sharedResourceManager];
        [v83 log:@"Cancelled co-sysdiagnose."];

        [(SDPromptDelegate *)v20 setBundleID:0];
        [(SDPromptDelegate *)v20 setOpenIssueFiler:0];
        sub_10002AFA4(v20);
        id v84 = 0;
        id v25 = group;
        v85 = v136;
      }

LABEL_145:
      return;
    case 3:
      if ([(SystemDiagnostic *)self requestSource] == 2) {
        goto LABEL_94;
      }
      goto LABEL_81;
    case 5:
LABEL_81:
      if ([(SystemDiagnostic *)self dpClass] == 3)
      {
        v69 = +[SystemDiagnosticIDS sharedInstance];
        v70 = [(SystemDiagnostic *)self tarballPath];
        v71 = [(SystemDiagnostic *)self diagnosticID];
        unsigned int v72 = [v69 sendFileAtPath:v70 forDiagnosticID:v71 withCase:-[SystemDiagnosticiOS idsCase](self, "idsCase")];

        if (v72)
        {
          v73 = [(SDPromptDelegate *)v20 diagnosticID];
          sub_10002AEB4(v73);

          sub_100029A80(@"Transferring");
          dispatch_time_t v74 = dispatch_time(0, 1801000000000);
          v75 = dispatch_get_global_queue(0, 0);
          dispatch_after(v74, v75, &stru_10009E108);

          goto LABEL_145;
        }
      }
      else if ([(SystemDiagnostic *)self dpClass] < 1)
      {
        if ([(SystemDiagnostic *)self dpClass] < 0) {
          [(SystemDiagnosticiOS *)self sendUnableToCreateMsg];
        }
      }
      else
      {
        [(SystemDiagnosticiOS *)self sendFailedInstructions];
      }
LABEL_94:
      [(SDPromptDelegate *)v20 setOpenIssueFiler:0];
      sub_10002AFA4(v20);
      goto LABEL_145;
    default:
      if ([(SystemDiagnostic *)self requestSource] == 1)
      {
        if ([(SystemDiagnostic *)self didComplete]) {
          goto LABEL_90;
        }
        v68 = self;
      }
      else
      {
        v68 = (SystemDiagnosticiOS *)v20;
      }
      [(SystemDiagnosticiOS *)v68 setOpenIssueFiler:0];
LABEL_90:
      sub_10002AFA4(v20);
      if ([(SystemDiagnostic *)self requestSource] == 2)
      {
        v76 = +[SDResourceManager sharedResourceManager];
        [v76 closeSysdiagnoseSession];
      }
      goto LABEL_145;
  }
}

- (void)startIDSConnection
{
  id v3 = +[SystemDiagnosticIDS sharedInstance];
  if (v3)
  {
    unsigned int v4 = dispatch_group_create();
    uint64_t v5 = v4;
    if (v4)
    {
      dispatch_group_enter(v4);
      unsigned int v6 = [v3 executionGroupDictionary];
      v7 = [(SystemDiagnostic *)self diagnosticID];
      [v6 setValue:v5 forKey:v7];
    }
    if ([(SystemDiagnosticiOS *)self idsCase] == 3 || [(SystemDiagnosticiOS *)self idsCase] == 1)
    {
      id v8 = [(SystemDiagnostic *)self diagnosticID];
      [v3 startCoSysdiagnoseForFilename:v8];
    }
    dispatch_group_t v9 = dispatch_group_create();
    if (v9)
    {
      uint64_t v10 = [v3 localGroupDictionary];
      id v11 = [(SystemDiagnostic *)self diagnosticID];
      [v10 setObject:v9 forKey:v11];
    }
    if ([(SystemDiagnosticiOS *)self idsCase] == 1 || [(SystemDiagnosticiOS *)self idsCase] == 4)
    {
      if (!v9)
      {
LABEL_18:
        if ([(SystemDiagnosticiOS *)self idsCase] == 4)
        {
          unsigned int v13 = [(SystemDiagnostic *)self remoteSysdiagnoseID];

          if (v13)
          {
            __int16 v14 = [(SystemDiagnostic *)self diagnosticID];
            v23[0] = v14;
            id v15 = [(SystemDiagnostic *)self remoteSysdiagnoseID];
            v23[1] = v15;
            id v16 = +[NSArray arrayWithObjects:v23 count:2];
            [v3 sendFilenamePair:v16];
          }
        }
        if ([(SystemDiagnosticiOS *)self idsCase] == 5)
        {
          id v17 = [(SystemDiagnostic *)self remoteSysdiagnoseID];

          if (v17)
          {
            id v18 = [v3 localTupleDictionary];
            v19 = [(SystemDiagnostic *)self remoteSysdiagnoseID];
            id v20 = [(SystemDiagnostic *)self diagnosticID];
            [v18 setObject:v19 forKey:v20];
          }
        }
        if ([(SystemDiagnosticiOS *)self idsCase] == 1
          || [(SystemDiagnosticiOS *)self idsCase] == 4)
        {
          id v21 = +[SystemDiagnosticIDS sharedInstance];
          [v21 setPreferredWifi:1];
        }
        goto LABEL_28;
      }
    }
    else
    {
      unsigned int v12 = [(SystemDiagnosticiOS *)self idsCase];
      if (!v9 || v12 != 3) {
        goto LABEL_18;
      }
    }
    dispatch_group_enter(v9);
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got nil SystemDiagnosticIDS instance, not starting IDS connection", v22, 2u);
  }
LABEL_28:
}

- (void)dealloc
{
  layoutMonitor = self->_layoutMonitor;
  if (layoutMonitor)
  {
    [(FBSDisplayLayoutMonitor *)layoutMonitor invalidate];
    unsigned int v4 = self->_layoutMonitor;
    self->_layoutMonitor = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SystemDiagnosticiOS;
  [(SystemDiagnostic *)&v5 dealloc];
}

- (id)fetchUserActivity
{
  if (objc_opt_class())
  {
    *(void *)__int16 v14 = 0;
    id v15 = v14;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_10005B12C;
    id v18 = sub_10005B13C;
    id v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005B144;
    v11[3] = &unk_10009E158;
    unsigned int v13 = v14;
    id v3 = dispatch_semaphore_create(0);
    unsigned int v12 = v3;
    +[UAUserActivity currentUserActivityUUIDWithOptions:0 completionHandler:v11];
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v3, v4);
    if ([(SystemDiagnosticiOS *)self validateTTRString:*((void *)v15 + 5)])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *((void *)v15 + 5);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Valid TTR URL from user activity %@", buf, 0xCu);
      }
      unsigned int v6 = +[SDResourceManager sharedResourceManager];
      [v6 stdoutWrite:@"Valid TTR URL from user activity %@", *((void *)v15 + 5)];

      v7 = +[SDResourceManager sharedResourceManager];
      [v7 log:@"Valid TTR URL from user activity %@", *((void *)v15 + 5)];

      id v8 = *((id *)v15 + 5);
    }
    else
    {
      id v8 = 0;
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UserActivity framework is not available!", v14, 2u);
    }
    dispatch_group_t v9 = +[SDResourceManager sharedResourceManager];
    [v9 stdoutWrite:@"UserActivity framework is not available!"];

    id v3 = +[SDResourceManager sharedResourceManager];
    [v3 log:@"UserActivity framework is not available!"];
    id v8 = 0;
  }

  return v8;
}

- (BOOL)validateTTRString:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Validating TTR string from UserActivity %@", buf, 0xCu);
  }
  dispatch_time_t v4 = +[SDResourceManager sharedResourceManager];
  [v4 stdoutWrite:@"Validating TTR string from UserActivity %@", v3];

  uint64_t v5 = +[SDResourceManager sharedResourceManager];
  [v5 log:@"Validating TTR string from UserActivity %@", v3];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v6 = +[NSURL URLWithString:v3];
    v7 = +[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:0];

    id v8 = [v7 scheme];
    unsigned __int8 v9 = 0;
    if ([v8 isEqualToString:@"tap-to-radar"])
    {
      uint64_t v10 = [v7 host];
      unsigned __int8 v9 = [v10 isEqualToString:@"new"];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)tailspinOnly
{
  return self->_tailspinOnly;
}

- (void)setTailspinOnly:(BOOL)a3
{
  self->_tailspinOnly = a3;
}

- (BOOL)vibrateStart
{
  return self->_vibrateStart;
}

- (void)setVibrateStart:(BOOL)a3
{
  self->_vibrateStart = a3;
}

- (int64_t)maxHistory
{
  return self->_maxHistory;
}

- (void)setMaxHistory:(int64_t)a3
{
  self->_maxHistory = a3;
}

- (int64_t)openIssueFiler
{
  return self->_openIssueFiler;
}

- (void)setOpenIssueFiler:(int64_t)a3
{
  self->_openIssueFiler = a3;
}

- (int64_t)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(int64_t)a3
{
  self->_statusBar = a3;
}

- (int)idsCase
{
  return self->_idsCase;
}

- (void)setIdsCase:(int)a3
{
  self->_idsCase = a3;
}

- (BOOL)wasLockedAtLaunch
{
  return self->_wasLockedAtLaunch;
}

- (void)setWasLockedAtLaunch:(BOOL)a3
{
  self->_wasLockedAtLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceAssertion, 0);

  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end