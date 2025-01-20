@interface DADiagnosticsSessionAvailability
- (BOOL)isInternalInstall;
- (id)getSessionID;
- (id)serialNumbers;
- (void)checkAvailabilityWithReply:(id)a3;
- (void)checkAvailabilityWithTicketNumber:(id)a3 response:(id)a4;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 completion:(id)a6;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 response:(id)a6;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 response:(id)a5;
- (void)checkEnhancedLoggingStateWithReply:(id)a3;
- (void)clearASTServerURL;
- (void)rebootIntoCheckerBoard;
- (void)setASTServerURL:(id)a3;
@end

@implementation DADiagnosticsSessionAvailability

- (void)checkAvailabilityWithReply:(id)a3
{
  id v4 = a3;
  xpc_transaction_interrupt_clean_exit();
  objc_initWeak(&location, self);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100006634;
  v8[4] = sub_100006660;
  id v9 = [v4 copy];
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006668;
  block[3] = &unk_100014740;
  objc_copyWeak(&v7, &location);
  block[4] = v8;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);

  objc_destroyWeak(&location);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 response:(id)a4
{
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 response:(id)a5
{
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 response:(id)a6
{
  BOOL v6 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006A40;
  v11[3] = &unk_100014768;
  id v12 = a6;
  id v10 = v12;
  [(DADiagnosticsSessionAvailability *)self checkAvailabilityWithTicketNumber:a3 timeout:v6 exitWhenDone:v11 completion:a4];
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B4C;
  block[3] = &unk_1000147B8;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  id v17 = v11;
  BOOL v19 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)rebootIntoCheckerBoard
{
  if ([(DADiagnosticsSessionAvailability *)self isInternalInstall])
  {
    +[CBSUtilities rebootToCheckerBoard];
  }
}

- (void)setASTServerURL:(id)a3
{
  id v6 = a3;
  if ([(DADiagnosticsSessionAvailability *)self isInternalInstall])
  {
    id v4 = +[DANvramUtil sharedInstance];
    id v5 = [kASTServerURLCommand copy];
    [v4 _writeNVRamVariable:v5 value:v6];
  }
}

- (void)clearASTServerURL
{
  if ([(DADiagnosticsSessionAvailability *)self isInternalInstall])
  {
    id v3 = +[DANvramUtil sharedInstance];
    id v2 = [kASTServerURLCommand copy];
    [v3 _clearNVRamVariable:v2];
  }
}

- (id)getSessionID
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000072E0;
  id v16 = &unk_1000147E0;
  double v18 = &v19;
  id v3 = dispatch_semaphore_create(0);
  id v17 = v3;
  [(DADiagnosticsSessionAvailability *)self checkAvailabilityWithTicketNumber:0 timeout:0 exitWhenDone:&v13 response:30.0];
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Waiting for response to availability check", buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  intptr_t v6 = dispatch_semaphore_wait(v3, v5);
  id v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *((unsigned __int8 *)v20 + 24);
    *(_DWORD *)buf = 134218240;
    intptr_t v24 = v6;
    __int16 v25 = 1024;
    int v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finished waiting for response to availability check. timedOut: %ld validSession: %d", buf, 0x12u);
  }

  if (*((unsigned char *)v20 + 24))
  {
    CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
    id v9 = (void *)CFPreferencesCopyAppValue(@"InCurrentSession", @"com.apple.Diagnostics");
    if (objc_msgSend(v9, "BOOLValue", v13, v14, v15, v16))
    {
      id v10 = @"IN_CURRENT_SESSION";
    }
    else
    {
      id v10 = +[NSString string];
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    intptr_t v24 = (intptr_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Session status: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (BOOL)isInternalInstall
{
  if (qword_10001C698 != -1) {
    dispatch_once(&qword_10001C698, &stru_100014800);
  }
  return byte_10001C690;
}

- (void)checkEnhancedLoggingStateWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[ELSManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000074C0;
  v6[3] = &unk_100014828;
  id v7 = v3;
  id v5 = v3;
  [v4 refreshWithCompletion:v6];
}

- (id)serialNumbers
{
  id v2 = +[NSMutableSet set];
  id v3 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", objc_opt_class(), 0);
  [v3 addObject:objc_opt_class()];
  unsigned int v4 = +[CBSUtilities isCheckerBoardActive];
  if ((BYSetupAssistantNeedsToRun() & 1) != 0
    || ((BYSetupAssistantHasCompletedInitialRun() ^ 1 | v4) & 1) != 0)
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Only reporting serial number for local device and physically connected accessories because Buddy is not finished", buf, 2u);
    }
  }
  else
  {
    [v3 addObject:objc_opt_class()];
    [v3 addObject:objc_opt_class()];
  }
  id v7 = +[DADeviceObserverAggregator aggregatorWithObserverClasses:v3];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discovering devices…", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000077DC;
  v14[3] = &unk_100014878;
  id v10 = v2;
  id v15 = v10;
  dispatch_semaphore_t v16 = v8;
  id v11 = v8;
  [v7 discoverAllDevicesWithCompletionHandler:v14];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  id v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Discovery complete, found: %@", buf, 0xCu);
  }

  return v10;
}

@end