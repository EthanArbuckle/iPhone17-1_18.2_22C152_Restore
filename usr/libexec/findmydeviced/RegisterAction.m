@interface RegisterAction
+ (id)_deviceRestartRegisterIntervalConfigPrefKeyForAccount:(id)a3;
+ (id)_lastDeviceRestartRegisterTimePrefKeyForAccount:(id)a3;
+ (id)_lastForcedRegisterTimePrefKeyForAccount:(id)a3;
+ (id)_registerDigestPrefKeyForAccount:(id)a3;
+ (id)sharedregisterDigestSerialQueue;
+ (void)deleteRegisterDigestForAccount:(id)a3;
- (BOOL)_registerDeviceWithCause:(id)a3 completion:(id)a4;
- (BOOL)_shouldThrottleDeviceRestartRegister;
- (BOOL)cancelled;
- (BOOL)force;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDRequestRegister)request;
- (FMDServiceProvider)provider;
- (NSString)description;
- (NSString)reason;
- (RegisterAction)initWithReason:(id)a3 force:(BOOL)a4 provider:(id)a5;
- (id)_extraRegistrationInformation;
- (id)_reasonForStartupRegister;
- (id)_registrationInformationDigest:(BOOL)a3;
- (id)actionType;
- (void)runWithCompletion:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setForce:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setReason:(id)a3;
- (void)setRequest:(id)a3;
- (void)willCancelAction;
@end

@implementation RegisterAction

- (RegisterAction)initWithReason:(id)a3 force:(BOOL)a4 provider:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RegisterAction;
  v10 = [(RegisterAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(RegisterAction *)v10 setProvider:v9];
    [(RegisterAction *)v11 setReason:v8];
    [(RegisterAction *)v11 setForce:v6];
    [(RegisterAction *)v11 setCancelled:0];
  }

  return v11;
}

+ (id)sharedregisterDigestSerialQueue
{
  if (qword_10031EC38 != -1) {
    dispatch_once(&qword_10031EC38, &stru_1002DCF80);
  }
  v2 = (void *)qword_10031EC40;

  return v2;
}

- (id)actionType
{
  return @"RegisterAction";
}

- (void)runWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(RegisterAction *)self reason];
  if (!v5)
  {
    v5 = [(RegisterAction *)self _reasonForStartupRegister];
  }
  if ([(RegisterAction *)self force])
  {
    BOOL v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Register %@ is being forced", buf, 0xCu);
    }

    if (v5)
    {
      uint64_t v7 = +[NSString stringWithFormat:@"Forced-%@", v5];

      v5 = (__CFString *)v7;
    }
    else
    {
      v5 = @"Forced";
    }
    id v8 = [(RegisterAction *)self provider];
    id v9 = [v8 account];
    v10 = +[RegisterAction _lastForcedRegisterTimePrefKeyForAccount:v9];

    v11 = +[NSDate date];
    +[FMPreferencesUtil setDate:v11 forKey:v10 inDomain:kFMDNotBackedUpPrefDomain];
  }
  unsigned __int8 v12 = [(RegisterAction *)self _registerDeviceWithCause:v5 completion:v4];
  if (v4 && (v12 & 1) == 0) {
    v4[2](v4);
  }
}

- (void)willCancelAction
{
  objc_initWeak(&location, self);
  v2 = +[RegisterAction sharedregisterDigestSerialQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000C0084;
  v3[3] = &unk_1002D93C8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 actionType];
  unsigned int v6 = [v5 isEqual:@"RegisterAction"];
  if (qword_10031EC28) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  if (v7)
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138413058;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2048;
      objc_super v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@(0x%lX) shouldCancelAction: %@(0x%lX)", (uint8_t *)&v10, 0x2Au);
    }
  }
  return v7;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 actionType];
  unsigned int v6 = [v5 isEqual:@"RegisterAction"];

  if (v6)
  {
    BOOL v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(RegisterAction *)self reason];
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      objc_super v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@(0x%lX) RegisterAction shouldWaitForAction: %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v6;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Register(0x%p)", self];
}

- (id)_reasonForStartupRegister
{
  v2 = [(RegisterAction *)self provider];
  v3 = [v2 account];

  id v4 = v3;
  uint64_t v5 = [v4 lastUnregisterFailedTime];
  if (!v5) {
    goto LABEL_4;
  }
  unsigned int v6 = (void *)v5;
  BOOL v7 = [v4 lastUnregisterFailedTime];
  id v8 = +[FMDDaemon sharedInstance];
  id v9 = [v8 startTime];
  id v10 = [v7 compare:v9];

  if (v10 == (id)1)
  {
    uint64_t v11 = @"UnregisterFailure";
  }
  else
  {
LABEL_4:
    uint64_t v12 = [v4 accountAddTime];
    if (!v12) {
      goto LABEL_7;
    }
    objc_super v13 = (void *)v12;
    __int16 v14 = [v4 accountAddTime];
    id v15 = +[FMDDaemon sharedInstance];
    __int16 v16 = [v15 startTime];
    id v17 = [v14 compare:v16];

    if (v17 == (id)-1)
    {
LABEL_7:
      v18 = +[FMDDaemon sharedInstance];
      unsigned int v19 = [v18 isFirstRunAfterBoot];
      v20 = @"FMDRestart";
      if (v19) {
        v20 = @"DeviceRestart";
      }
      uint64_t v11 = v20;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithFormat:@"AccountAdded"];
    }
  }

  return v11;
}

- (id)_extraRegistrationInformation
{
  v2 = [(RegisterAction *)self provider];
  v3 = [v2 account];

  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = +[RegisterAction _lastForcedRegisterTimePrefKeyForAccount:v3];
  unsigned int v6 = +[FMPreferencesUtil dateForKey:v5 inDomain:kFMDNotBackedUpPrefDomain];
  if (v6)
  {
    BOOL v7 = +[NSString stringWithFormat:@"%@", v6];
  }
  else
  {
    BOOL v7 = @"null";
  }
  [v4 setObject:v7 forKeyedSubscript:@"lastForcedTime"];
  uint64_t v8 = [v3 authToken];
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"null";
  }
  [v4 setObject:v10 forKeyedSubscript:@"authToken"];

  return v4;
}

- (id)_registrationInformationDigest:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v6 = [(RegisterAction *)self provider];
  BOOL v7 = [v6 account];

  uint64_t v8 = +[ServerDeviceInfo sharedInstance];
  id v9 = [v8 registrationDigestDeviceInfoForAccount:v7 completedFirstRegister:v3];

  id v10 = [v9 mutableCopy];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"otherDevices"];
  +[NSMutableArray array];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C0AE0;
  v34[3] = &unk_1002DCFA8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v12;
  v32 = v11;
  [v11 enumerateObjectsUsingBlock:v34];
  [v10 setObject:v12 forKeyedSubscript:@"otherDevices"];
  objc_super v13 = objc_msgSend(v10, "fm_flattenedArrayWithParentIndices:", &off_1002F31B8);
  v31 = [(RegisterAction *)self _extraRegistrationInformation];
  __int16 v14 = [v31 fm_flattenedArrayWithParentIndices:&off_1002F31D0];
  id v15 = [v13 arrayByAddingObjectsFromArray:v14];

  if ([v15 count])
  {
    v30 = v9;
    __int16 v16 = [v15 componentsJoinedByString:@", "];
    if (qword_10031EC50 != -1) {
      dispatch_once(&qword_10031EC50, &stru_1002DCFC8);
    }
    id v17 = [objc_msgSend((id)qword_10031EC48, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), @"authToken_redacted,");
    v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating digest out of %@", buf, 0xCu);
    }

    id v33 = 0;
    unsigned int v19 = +[NSJSONSerialization dataWithJSONObject:v15 options:0 error:&v33];
    id v20 = v33;
    if (v20)
    {
      v28 = v7;
      v21 = v5;
      v22 = sub_100004238();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100243CA0(self, (uint64_t)v20, v22);
      }

      v23 = sub_100059748();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100243C28((uint64_t)v17, v23);
      }

      uint64_t v5 = v21;
      BOOL v7 = v28;
    }

    id v9 = v30;
  }
  else
  {
    unsigned int v19 = 0;
  }
  id v24 = v19;
  CC_SHA1([v24 bytes], (CC_LONG)[v24 length], buf);
  v25 = +[NSData dataWithBytes:buf length:20];
  v26 = sub_100004238();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10023C2FC((uint64_t)v25, v26);
  }

  return v25;
}

- (BOOL)_registerDeviceWithCause:(id)a3 completion:(id)a4
{
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v35 = a4;
  BOOL v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v64 = v6;
    id v8 = *(id *)&buf[4];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request to send register %@", buf, 0x20u);
  }
  id v9 = [(RegisterAction *)self provider];
  id v10 = [v9 essentialServerInfoMissingError];
  if (v10 == 1196379972)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v64 = sub_1000C1314;
    v65 = sub_1000C1324;
    id v66 = 0;
    uint64_t v11 = +[RegisterAction sharedregisterDigestSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C132C;
    block[3] = &unk_1002DCFF0;
    block[4] = self;
    v51 = buf;
    id v12 = v6;
    v50 = v12;
    v52 = &v53;
    dispatch_sync(v11, block);

    BOOL v13 = *((unsigned char *)v54 + 24) != 0;
    if (*((unsigned char *)v54 + 24))
    {
      __int16 v14 = sub_100004238();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)v57 = 138412802;
        v58 = v15;
        __int16 v59 = 2048;
        v60 = self;
        __int16 v61 = 2112;
        v62 = v12;
        id v16 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending register %@", v57, 0x20u);
      }
      id v17 = [FMDActingRequestDecorator alloc];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000C1734;
      v46[3] = &unk_1002D9DF8;
      id v47 = v9;
      v18 = v12;
      v48 = v18;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000C17C0;
      v44[3] = &unk_1002D9458;
      id v19 = v47;
      id v45 = v19;
      v34 = [(FMDActingRequestDecorator *)v17 initWithDeviceContextGenerator:v46 deviceInfoGenerator:v44 serverContextGenerator:0 requestHeaderGenerator:0];
      id v20 = [FMDRequestRegister alloc];
      v21 = [v19 account];
      v22 = [(FMDRequest *)v20 initWithAccount:v21];

      [(FMDRequest *)v22 setDecorator:v34];
      v23 = [v19 account];
      id v24 = +[RegisterAction _registerDigestPrefKeyForAccount:v23];
      [(FMDRequestRegister *)v22 setDigestKey:v24];

      [(FMDRequestRegister *)v22 setDigestData:*(void *)(*(void *)&buf[8] + 40)];
      objc_initWeak((id *)v57, v19);
      objc_initWeak(&location, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000C183C;
      v41[3] = &unk_1002DD018;
      objc_copyWeak(&v42, &location);
      [(FMDRequest *)v22 setWillSendHandler:v41];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000C1A34;
      v36[3] = &unk_1002DD060;
      objc_copyWeak(&v39, &location);
      objc_copyWeak(&v40, (id *)v57);
      v36[4] = self;
      v37 = v18;
      id v38 = v35;
      [(FMDRequest *)v22 setCompletionHandler:v36];
      [(RegisterAction *)self setRequest:v22];
      v25 = [v19 serverInteractionController];
      [v25 enqueueRequest:v22];

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)v57);
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    v26 = sub_100004238();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = +[NSString stringWithFourCC:v10];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Ignoring register %@. Server info '%@' missing", buf, 0x16u);
    }
    BOOL v28 = v10 == 1480675411;
    v29 = +[FMSystemInfo sharedInstance];
    unsigned int v30 = [v29 isInternalBuild];

    if (v28)
    {
      if (v30)
      {
        v31 = sub_100004238();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Service not functional. APS token unavailable.", buf, 2u);
        }
      }
    }
    else
    {
      if (v30)
      {
        v32 = sub_100004238();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Service not functional. Auth credentials unavailable.", buf, 2u);
        }
      }
      [v9 tryToFetchAuthToken];
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldThrottleDeviceRestartRegister
{
  BOOL v3 = +[FMPreferencesUtil stringForKey:@"DeviceRestartRegisterInterval" inDomain:kFMDNotBackedUpPrefDomain];
  if (v3) {
    goto LABEL_3;
  }
  id v4 = [(RegisterAction *)self provider];
  uint64_t v5 = [v4 account];
  unsigned int v6 = +[RegisterAction _deviceRestartRegisterIntervalConfigPrefKeyForAccount:v5];

  BOOL v3 = +[FMPreferencesUtil stringForKey:v6 inDomain:kFMDNotBackedUpPrefDomain];

  if (v3)
  {
LABEL_3:
    double v7 = (double)(uint64_t)[v3 longLongValue];
  }
  else
  {
    double v7 = 86400.0;
  }
  id v8 = [(RegisterAction *)self provider];
  id v9 = [v8 account];
  id v10 = +[RegisterAction _lastDeviceRestartRegisterTimePrefKeyForAccount:v9];

  uint64_t v11 = +[FMPreferencesUtil dateForKey:v10 inDomain:kFMDNotBackedUpPrefDomain];
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 fm_epoch];
    __int16 v14 = +[NSDate date];
    id v15 = [v14 fm_epoch];

    BOOL v16 = (double)(v15 - v13) / 1000.0 < v7;
  }
  else
  {
    BOOL v16 = 0;
  }
  id v17 = sub_100004238();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Should throttle register on device restart : %i", (uint8_t *)v19, 8u);
  }

  return v16;
}

+ (id)_registerDigestPrefKeyForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 authId];

  unsigned int v6 = +[NSString stringWithFormat:@"RegisterDigest-%@-%@", v4, v5];

  return v6;
}

+ (id)_lastForcedRegisterTimePrefKeyForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 authId];

  unsigned int v6 = +[NSString stringWithFormat:@"LastForcedRegisterTime-%@-%@", v4, v5];

  return v6;
}

+ (id)_lastDeviceRestartRegisterTimePrefKeyForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 authId];

  unsigned int v6 = +[NSString stringWithFormat:@"LastDeviceRestartRegisterTime-%@-%@", v4, v5];

  return v6;
}

+ (id)_deviceRestartRegisterIntervalConfigPrefKeyForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 authId];

  unsigned int v6 = +[NSString stringWithFormat:@"DeviceRestartRegisterIntervalConfig-%@-%@", v4, v5];

  return v6;
}

+ (void)deleteRegisterDigestForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[RegisterAction sharedregisterDigestSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C29BC;
  block[3] = &unk_1002D9378;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (FMDRequestRegister)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end