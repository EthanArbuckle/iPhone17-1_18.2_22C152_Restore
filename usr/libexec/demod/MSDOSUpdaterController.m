@interface MSDOSUpdaterController
+ (id)sharedInstance;
- (BOOL)cleanup;
- (BOOL)doesAvailableUpdateVersion:(id)a3 andUpdateBuild:(id)a4 matchExpectedUpdateVersion:(id)a5 andUpdateBuild:(id)a6;
- (BOOL)isOSUpdateInProgress;
- (BOOL)purged;
- (BOOL)started;
- (MSDOSUpdaterController)init;
- (NSString)expectedOSBuild;
- (NSString)expectedOSVersion;
- (SUManagerClient)manager;
- (id)prettyPrintSUDescriptor:(id)a3;
- (void)bail:(const char *)a3 error:(id)a4;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidFinish:(id)a4;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)downloadFailed:(id)a3;
- (void)downloadProgressChanged:(id)a3 withPercent:(float)a4;
- (void)saveAvailableOSVersion:(id)a3 andOSBuild:(id)a4;
- (void)scanResult:(id)a3 error:(id)a4;
- (void)setExpectedOSBuild:(id)a3;
- (void)setExpectedOSVersion:(id)a3;
- (void)setManager:(id)a3;
- (void)setPurged:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)startOSUpdate;
@end

@implementation MSDOSUpdaterController

+ (id)sharedInstance
{
  if (qword_100189C88 != -1) {
    dispatch_once(&qword_100189C88, &stru_100153C60);
  }
  v2 = (void *)qword_100189C80;

  return v2;
}

- (MSDOSUpdaterController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDOSUpdaterController;
  v2 = [(MSDOSUpdaterController *)&v6 init];
  if (v2)
  {
    v3 = (SUManagerClient *)objc_alloc_init((Class)SUManagerClient);
    manager = v2->_manager;
    v2->_manager = v3;

    [(SUManagerClient *)v2->_manager setDelegate:v2];
  }
  return v2;
}

- (BOOL)isOSUpdateInProgress
{
  v2 = +[MSDTargetDevice sharedInstance];
  v3 = [v2 previousiOSBuild];

  if (v3)
  {
    v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "An OS update is already in progress!", v6, 2u);
    }
  }
  return v3 != 0;
}

- (void)startOSUpdate
{
  v3 = +[MSDTargetDevice sharedInstance];
  v4 = [v3 previousiOSBuild];
  v5 = [v3 getOSUpdateRequest];
  objc_super v6 = [v5 objectForKey:@"OSVersion"];
  v7 = [v6 componentsSeparatedByString:@"_"];

  if ([v7 count])
  {
    v8 = [v7 objectAtIndex:0];
  }
  else
  {
    v8 = 0;
  }
  if ((unint64_t)[v7 count] < 2)
  {
    v9 = 0;
  }
  else
  {
    v9 = [v7 objectAtIndex:1];
  }
  [(MSDOSUpdaterController *)self setExpectedOSVersion:v8];
  [(MSDOSUpdaterController *)self setExpectedOSBuild:v9];
  if (v4)
  {
    v10 = [v3 OSBuild];
    unsigned __int8 v11 = [v4 isEqualToString:v10];

    v12 = sub_100068600();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v35 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "OS build number didn't change, still %{public}@, indicating a non-successful OS update.", buf, 0xCu);
      }

      [v3 clearCurrentiOSBuild];
      [v3 clearOSUpdateRequest];
      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", 0);
    }
    else
    {
      if (v13)
      {
        v22 = [v3 OSBuild];
        *(_DWORD *)buf = 138543618;
        v35 = v4;
        __int16 v36 = 2114;
        v37 = v22;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "OS build has been changed from %{public}@ to %{public}@, indicating a successful OS update.", buf, 0x16u);
      }
      v23 = +[MSDProgressUpdater sharedInstance];
      [v23 updateStage:14];

      v24 = sub_100068600();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for data migration to finish", buf, 2u);
      }

      DMPerformMigration();
      v25 = sub_100068600();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Data migration finished.", buf, 2u);
      }

      v26 = +[MSDUIHelper sharedInstance];
      [v26 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

      v27 = +[MSDConfigurationProfileManager sharedInstance];
      [v27 installDefaultConfigurationProfile];

      sleep(0xB4u);
      [v3 clearCurrentiOSBuild];
      [v3 clearOSUpdateRequest];
      v28 = +[MSDAnalytics sharedInstance];
      [v28 disableCoreAnalticsTransformSampling];

      if (!+[MSDGreyMatterHelper waitForGMAvailability])
      {
        v29 = sub_100068600();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1000DB7D8(v29);
        }
      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000A6A38;
      v32[3] = &unk_1001525A8;
      id v33 = v3;
      [v33 waitForBuddy:v32];
    }
  }
  else
  {
    v14 = +[MSDUIHelper sharedInstance];
    [v14 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wait for some extra time to make sure everything get ready for OS update.", buf, 2u);
    }

    sleep(0x1Eu);
    [(MSDOSUpdaterController *)self cleanup];
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wait for some extra time to make sure that the cancelDownload and purgeDownload complete before starting a scan.", buf, 2u);
    }

    sleep(0x1Eu);
    if (v8)
    {
      [(MSDOSUpdaterController *)self setStarted:1];
      v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting to scan for updates...", buf, 2u);
      }

      v18 = +[MSDProgressUpdater sharedInstance];
      [v18 updateStage:23];

      [v3 clearMinOSVersionAvailable];
      id v19 = objc_alloc_init((Class)SUScanOptions);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000A6A44;
      v31[3] = &unk_100153C88;
      v31[4] = self;
      v20 = objc_retainBlock(v31);
      [v19 setForced:1];
      v21 = [(MSDOSUpdaterController *)self manager];
      [v21 scanForUpdates:v19 withScanResults:v20];
    }
    else
    {
      id v19 = +[NSError errorDomainMSDWithCode:3727741032 message:@"OS update failed."];
      v30 = sub_100068600();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "UpdateOS command was sent in an invalid format.", buf, 2u);
      }

      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", v19);
    }
  }
}

- (BOOL)cleanup
{
  if (![(MSDOSUpdaterController *)self purged])
  {
    v3 = +[MSDTargetDevice sharedInstance];
    [v3 clearCurrentiOSBuild];

    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v5 = [(MSDOSUpdaterController *)self manager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A6BEC;
    v12[3] = &unk_100153790;
    objc_super v6 = v4;
    BOOL v13 = v6;
    [v5 purgeDownload:v12];

    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Didn't wait long enough for purge to complete.", v11, 2u);
      }
    }
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clean up is done.", v11, 2u);
    }

    [(MSDOSUpdaterController *)self setPurged:1];
  }
  return 0;
}

- (void)bail:(const char *)a3 error:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)3727741185
      || (uint64_t)[v7 code] > 3727741029 && (uint64_t)objc_msgSend(v7, "code") < 3727741034)
    {
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000DB894((uint64_t)a3, v7);
      }

      id v9 = v7;
    }
    else
    {
      v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000DB894((uint64_t)a3, v7);
      }

      v15 = [v7 localizedDescription];
      id v9 = +[NSError errorDomainMSDWithCode:3727741032 message:@"OS update failed." reason:v15];
    }
    unsigned __int8 v11 = +[MSDAnalyticsEventHandler sharedInstance];
    v12 = v11;
    id v13 = v7;
  }
  else
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DB81C((uint64_t)a3, v10);
    }

    id v9 = +[NSError errorDomainMSDWithCode:3727741032 message:@"OS update failed."];
    unsigned __int8 v11 = +[MSDAnalyticsEventHandler sharedInstance];
    v12 = v11;
    id v13 = v9;
  }
  [v11 sendOSUpdateFailureEvent:v13];

  [(MSDOSUpdaterController *)self cleanup];
  if ([v7 code] != (id)3727741185)
  {
    v16 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v16 demoUpdateFailed:v9];

    v17 = +[MSDTestPreferences sharedInstance];
    uint64_t v18 = (uint64_t)[v17 timeShowingFatalError];

    if (v18)
    {
      id v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22[0] = 67109120;
        v22[1] = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", (uint8_t *)v22, 8u);
      }
    }
    else
    {
      uint64_t v18 = 900;
    }
    v20 = +[MSDDemoUpdateTimeKeeper sharedInstance];
    id v21 = [v20 setCompletionTimeForFatalError:v18];
  }
}

- (BOOL)doesAvailableUpdateVersion:(id)a3 andUpdateBuild:(id)a4 matchExpectedUpdateVersion:(id)a5 andUpdateBuild:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = 0;
  if (v9 && v11)
  {
    if ([v11 length])
    {
      unsigned int v14 = [v9 isEqualToString:v11];
      unsigned int v13 = v14;
      if (!v12 || !v14) {
        goto LABEL_11;
      }
    }
    else if (!v12)
    {
LABEL_10:
      unsigned int v13 = 1;
      goto LABEL_11;
    }
    if ([v12 length])
    {
      unsigned int v13 = [v10 isEqualToString:v12];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:
  v15 = sub_100068600();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138544386;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 1024;
    unsigned int v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Does available update version (%{public}@, %{public}@) match expected update version (%{public}@, %{public}@): %{BOOL}d", (uint8_t *)&v17, 0x30u);
  }

  return v13;
}

- (void)saveAvailableOSVersion:(id)a3 andOSBuild:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v10)
  {
    if (v5)
    {
      id v7 = +[NSString stringWithFormat:@"%@_%@", v10, v5];
    }
    else
    {
      id v7 = v10;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  id v9 = +[MSDTargetDevice sharedInstance];
  [v9 saveMinOSVersionAvailable:v8];
}

- (void)scanResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 preferredDescriptor];
    id v9 = [v6 alternateDescriptor];
    uint64_t v10 = [v6 latestUpdate];
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received OS update scan results:", buf, 2u);
    }

    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(MSDOSUpdaterController *)self prettyPrintSUDescriptor:v8];
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, ">> Preferred update: %{public}@", buf, 0xCu);
    }
    unsigned int v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(MSDOSUpdaterController *)self prettyPrintSUDescriptor:v9];
      *(_DWORD *)buf = 138543362;
      v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, ">> Alternate update: %{public}@", buf, 0xCu);
    }
    id v42 = v7;

    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [(MSDOSUpdaterController *)self prettyPrintSUDescriptor:v10];
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, ">> Latest update: %{public}@", buf, 0xCu);
    }
    id v18 = (void *)v10;

    __int16 v19 = [v8 productVersion];
    id v20 = [v8 productBuildVersion];
    __int16 v21 = [(MSDOSUpdaterController *)self expectedOSVersion];
    id v22 = [(MSDOSUpdaterController *)self expectedOSBuild];
    unsigned __int8 v23 = [(MSDOSUpdaterController *)self doesAvailableUpdateVersion:v19 andUpdateBuild:v20 matchExpectedUpdateVersion:v21 andUpdateBuild:v22];

    id v24 = v8;
    if (v23) {
      goto LABEL_12;
    }
    __int16 v25 = [v9 productVersion];
    unsigned int v26 = [v9 productBuildVersion];
    v27 = [(MSDOSUpdaterController *)self expectedOSVersion];
    v28 = [(MSDOSUpdaterController *)self expectedOSBuild];
    unsigned __int8 v29 = [(MSDOSUpdaterController *)self doesAvailableUpdateVersion:v25 andUpdateBuild:v26 matchExpectedUpdateVersion:v27 andUpdateBuild:v28];

    id v24 = v9;
    if (v29)
    {
LABEL_12:
      id v30 = v24;
      id v31 = objc_alloc_init((Class)SUMutableDownloadMetadata);
      v32 = sub_100068600();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [(MSDOSUpdaterController *)self prettyPrintSUDescriptor:v30];
        *(_DWORD *)buf = 138543362;
        v45 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Will start to download update: %{public}@", buf, 0xCu);
      }
      v34 = +[MSDProgressUpdater sharedInstance];
      [v34 updateStage:18];

      [v31 setDownloadOnly:1];
      v35 = +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:v30 existingPolicy:0 allowCellularOverride:1];
      [v31 setDownloadFeeAgreementStatus:1];
      [v31 applyDownloadPolicy:v35];
      id v36 = [objc_alloc((Class)SUDownloadOptions) initWithMetadata:v31 andDescriptor:v30];
      v37 = [(MSDOSUpdaterController *)self manager];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000A77BC;
      v43[3] = &unk_100153790;
      v43[4] = self;
      [v37 startDownloadWithOptions:v36 withResult:v43];
    }
    else
    {
      v39 = +[NSError errorDomainMSDWithCode:3727741030 message:@"Unexpected OS update version found."];
      v40 = [v18 productVersion];
      v41 = [v18 productBuildVersion];
      [(MSDOSUpdaterController *)self saveAvailableOSVersion:v40 andOSBuild:v41];

      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController scanResult:error:]", v39);
    }

    id v7 = v42;
  }
  else
  {
    v38 = sub_100068600();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No update found.", buf, 2u);
    }

    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController scanResult:error:]", v7);
  }
}

- (id)prettyPrintSUDescriptor:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 updateType];
  id v6 = SUStringFromUpdateType();
  id v7 = [v3 humanReadableUpdateName];
  v8 = [v3 productSystemName];
  id v9 = [v3 productVersion];
  uint64_t v10 = [v3 productBuildVersion];
  id v11 = [v3 releaseType];
  id v12 = [v3 downloadSize];

  unsigned int v13 = +[NSString stringWithFormat:@"<%@[%p] Update type: %@, Update name: %@, System name: %@, OS version: %@, Build version: %@, Release type: %@, Download size: %lld>", v5, self, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  if ([(MSDOSUpdaterController *)self started])
  {
    [(MSDOSUpdaterController *)self setPurged:0];
  }
}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
  if ([(MSDOSUpdaterController *)self started])
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Downloading finished, will install it.", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A7A38;
    block[3] = &unk_100151AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 progress];
  id v11 = [v6 phase];

  id v7 = [v5 progress];

  [v7 percentComplete];
  int v9 = v8;

  LODWORD(v10) = v9;
  [(MSDOSUpdaterController *)self downloadProgressChanged:v11 withPercent:v10];
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  if ([(MSDOSUpdaterController *)self started])
  {
    dispatch_semaphore_t v4 = +[MSDTargetDevice sharedInstance];
    [v4 saveCurrentiOSBuild];

    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Installation started.", v6, 2u);
    }
  }
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v6 = a5;
  if ([(MSDOSUpdaterController *)self started]) {
    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController client:installDidFail:withError:]", v6);
  }
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  if ([(MSDOSUpdaterController *)self started])
  {
    dispatch_semaphore_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[MSDOSUpdaterController client:installDidFinish:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)downloadProgressChanged:(id)a3 withPercent:(float)a4
{
  id v6 = a3;
  if ([(MSDOSUpdaterController *)self started])
  {
    id v7 = +[MSDDemoUpdateTimeKeeper sharedInstance];
    id v16 = 0;
    unsigned int v8 = [v7 shouldCleanUp:&v16];
    id v9 = v16;

    if (v8)
    {
      [(MSDOSUpdaterController *)self setStarted:0];
      double v10 = +[MSDDemoUpdateStatusHub sharedInstance];
      [v10 demoUpdateFailed:v9];

      id v11 = [(MSDOSUpdaterController *)self manager];
      [v11 cancelDownload:&stru_100153CC8];
    }
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v6;
      __int16 v19 = 2048;
      double v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Download/Prepare progress: %{public}@: %lf", buf, 0x16u);
    }

    if ([v6 isEqualToString:@"SUDownloadPhaseFetching"])
    {
      unsigned int v13 = +[MSDDemoUpdateStatusHub sharedInstance];
      unsigned int v14 = v13;
      uint64_t v15 = (uint64_t)(float)(a4 * 50.0);
LABEL_11:
      [v13 demoUpdateProgress:v15];

      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"SUDownloadPhasePreparingForInstallation"])
    {
      unsigned int v13 = +[MSDDemoUpdateStatusHub sharedInstance];
      unsigned int v14 = v13;
      uint64_t v15 = (uint64_t)(float)(a4 * 50.0) + 50;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_12:
}

- (void)downloadFailed:(id)a3
{
  id v4 = a3;
  if ([(MSDOSUpdaterController *)self started])
  {
    int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download failed.", v6, 2u);
    }

    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController downloadFailed:]", v4);
  }
}

- (NSString)expectedOSVersion
{
  return self->_expectedOSVersion;
}

- (void)setExpectedOSVersion:(id)a3
{
}

- (NSString)expectedOSBuild
{
  return self->_expectedOSBuild;
}

- (void)setExpectedOSBuild:(id)a3
{
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)purged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_expectedOSBuild, 0);

  objc_storeStrong((id *)&self->_expectedOSVersion, 0);
}

@end