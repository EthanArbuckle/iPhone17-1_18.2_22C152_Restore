@interface CloudAuthenticateOperation
- (BOOL)allowNoisyAuthPrompt;
- (CloudAuthenticateOperation)initWithConfiguration:(id)a3 mergeToCloudLibraryPreference:(id)a4 allowNoisyAuthPrompt:(BOOL)a5 enableLibraryReason:(int64_t)a6 clientIdentity:(id)a7;
- (NSNumber)authenticateFailureCode;
- (NSNumber)mergeToCloudLibraryPreference;
- (int64_t)enableReason;
- (void)main;
- (void)setAllowNoisyAuthPrompt:(BOOL)a3;
- (void)setAuthenticateFailureCode:(id)a3;
- (void)setEnableReason:(int64_t)a3;
- (void)setMergeToCloudLibraryPreference:(id)a3;
@end

@implementation CloudAuthenticateOperation

- (void).cxx_destruct
{
}

- (void)setEnableReason:(int64_t)a3
{
  self->_enableReason = a3;
}

- (int64_t)enableReason
{
  return self->_enableReason;
}

- (void)setAllowNoisyAuthPrompt:(BOOL)a3
{
  self->_allowNoisyAuthPrompt = a3;
}

- (BOOL)allowNoisyAuthPrompt
{
  return self->_allowNoisyAuthPrompt;
}

- (void)setAuthenticateFailureCode:(id)a3
{
}

- (NSNumber)authenticateFailureCode
{
  return self->_authenticateFailureCode;
}

- (void)setMergeToCloudLibraryPreference:(id)a3
{
  self->_mergeToCloudLibraryPreference = (NSNumber *)a3;
}

- (NSNumber)mergeToCloudLibraryPreference
{
  return self->_mergeToCloudLibraryPreference;
}

- (void)main
{
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"CloudAuthenticateOperation"];
  [v3 beginTransaction];
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  v6 = +[ICDServer server];
  v7 = [(CloudLibraryOperation *)self configuration];
  v8 = [v6 daemonOptionsForConfiguration:v7];
  unsigned int v9 = [v8 prohibitLibraryUpload] ^ 1;

  v10 = [(CloudLibraryOperation *)self musicLibrary];
  v11 = [v10 sagaCloudLibraryCUID];

  v12 = [(CloudLibraryOperation *)self musicLibrary];
  v13 = [v12 sagaCloudLibraryTroveID];

  v69 = v13;
  if ([v11 length]) {
    BOOL v14 = [v13 length] != 0;
  }
  else {
    BOOL v14 = 0;
  }
  int v15 = v9 & !v14;
  v16 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v79 = self;
    __int16 v80 = 1024;
    *(_DWORD *)v81 = v14;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v9;
    LOWORD(v82) = 1024;
    *(_DWORD *)((char *)&v82 + 2) = v9 & !v14;
    HIWORD(v82) = 1024;
    unsigned int v83 = [(CloudAuthenticateOperation *)self enableReason];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting authentication - Device registered with CUID and TroveID=%{BOOL}u, canPerformLibraryUpload=%{BOOL}u, requiresDeviceRegistration=%{BOOL}u, enableReason=%d", buf, 0x24u);
  }

  v17 = [(CloudLibraryOperation *)self userIdentity];
  [(CloudLibraryOperation *)self userIdentityStore];
  v70 = id v77 = 0;
  v18 = [v70 getPropertiesForUserIdentity:v17 error:&v77];
  id v19 = v77;
  if (v19)
  {
    v20 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v19, "msv_description");
      *(_DWORD *)buf = 138543874;
      v79 = self;
      __int16 v80 = 2114;
      *(void *)v81 = v17;
      *(_WORD *)&v81[8] = 2114;
      v82 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to load identity properties for %{public}@ error=%{public}@", buf, 0x20u);
    }
  }
  v68 = v19;
  v22 = [v18 DSID];
  if (!v22)
  {
    v30 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = self;
      v31 = "%{public}@ - Not authenticating ... unable to get properties for specified account";
      v32 = v30;
      uint32_t v33 = 12;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    }
LABEL_24:

    v34 = +[NSError ic_cloudClientErrorWithCode:2009 userInfo:0];
    [(CloudLibraryOperation *)self setError:v34];

    [(CloudLibraryOperation *)self setStatus:3];
    v35 = [(CloudLibraryOperation *)self musicLibrary];
    v36 = MSVTCCIdentityForCurrentProcess();
    [v35 setClientIdentity:v36];

    [v3 endTransaction];
    goto LABEL_46;
  }
  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0 && ([v18 isActive] & 1) == 0)
  {
    v30 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v79 = self;
      __int16 v80 = 2112;
      *(void *)v81 = v22;
      v31 = "%{public}@ - Not authenticating ... account is not active. DSID=%@";
      v32 = v30;
      uint32_t v33 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (!MSVDeviceSupportsSideLoadedMediaContent()) {
    goto LABEL_16;
  }
  v66 = v11;
  v23 = [v18 cloudLibraryStateReason];
  v24 = [v23 objectForKey:@"CloudLibraryStateReasonKey"];
  if ([v24 integerValue] != (id)-1 || !self->_enableReason)
  {

    v11 = v66;
LABEL_16:
    dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
    if (([v18 isActiveLocker] & 1) == 0)
    {
      v25 = +[ICDServer server];
      [v25 setIgnoreAccountChanges:1];

      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100042E80;
      v76[3] = &unk_1001BA498;
      v76[4] = self;
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_100042FB0;
      v72[3] = &unk_1001BA4C0;
      v72[4] = self;
      id v73 = v17;
      id v74 = v22;
      v26 = v67;
      v75 = v26;
      [v70 insertPropertiesForUserIdentity:v73 usingBlock:v76 completionHandler:v72];
      dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
      if ((id)[(CloudLibraryOperation *)self status] == (id)3)
      {
        v27 = +[ICDServer server];
        [v27 setIgnoreAccountChanges:0];

        v28 = [(CloudLibraryOperation *)self musicLibrary];
        v29 = MSVTCCIdentityForCurrentProcess();
        [v28 setClientIdentity:v29];

        [v3 endTransaction];
LABEL_45:

        goto LABEL_46;
      }
    }
    [(CloudLibraryOperation *)self setStatus:1];
    if (MSVDeviceOSIsInternalInstall()
      && (+[ICDefaults standardDefaults],
          v37 = objc_claimAutoreleasedReturnValue(),
          unsigned int v38 = [v37 shouldTreatSagaAddComputerCallAsFailed],
          v37,
          v38))
    {
      sleep(5u);
      v39 = +[NSError ic_cloudClientErrorWithCode:2022 userInfo:0];
      [(CloudLibraryOperation *)self setError:v39];

      [(CloudLibraryOperation *)self setStatus:3];
      [(CloudAuthenticateOperation *)self setAuthenticateFailureCode:&off_1001CBCA8];
      os_log_t v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
LABEL_44:

        v58 = +[ICDServer server];
        [v58 setIgnoreAccountChanges:0];

        v59 = [(CloudLibraryOperation *)self musicLibrary];
        v60 = MSVTCCIdentityForCurrentProcess();
        [v59 setClientIdentity:v60];

        [v3 endTransaction];
        goto LABEL_45;
      }
      *(_DWORD *)buf = 138543362;
      v79 = self;
      v41 = "%{public}@ - shouldTreatSagaAddComputerCallAsFailed is set. Will force SagaAddComputer call to fail.";
      v42 = v40;
      uint32_t v43 = 12;
    }
    else
    {
      if (v15)
      {
        v44 = v11;
        v45 = [(CloudLibraryOperation *)self configuration];
        char allowNoisyAuthPrompt = self->_allowNoisyAuthPrompt;
        id v71 = 0;
        BOOL v47 = sub_1000D4EBC(v45, allowNoisyAuthPrompt, &v71);
        id v48 = v71;

        if (!v47)
        {
          if (!v48)
          {
            id v48 = +[NSError ic_cloudClientErrorWithCode:2022 userInfo:0];
          }
          [(CloudLibraryOperation *)self setError:v48];
          [(CloudLibraryOperation *)self setStatus:3];
          [(CloudAuthenticateOperation *)self setAuthenticateFailureCode:&off_1001CBCA8];
        }
        v11 = v44;
      }
      if ((id)[(CloudLibraryOperation *)self status] == (id)1)
      {
        v49 = [(CloudLibraryOperation *)self musicLibrary];
        [v49 setSagaAccountID:v22];

        if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
        {
          v50 = +[NSDate distantPast];
          v51 = [(CloudLibraryOperation *)self musicLibrary];
          [v51 setJaliscoLastGeniusUpdateDate:v50];

          v52 = [(CloudLibraryOperation *)self musicLibrary];
          LODWORD(v51) = [v52 jaliscoHasCloudGeniusData];

          if (v51)
          {
            v53 = [(CloudLibraryOperation *)self musicLibrary];
            [v53 clearAllGeniusData];

            v54 = [(CloudLibraryOperation *)self musicLibrary];
            [v54 setJaliscoHasCloudGeniusData:0];
          }
        }
        ICSiriPostDynamiteClientStateChangedNotification();
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, ICCloudClientIsAuthenticatedDidChangeNotification, 0, 0, 1u);
      }
      os_log_t v40 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      unsigned int v56 = [(CloudLibraryOperation *)self status];
      int64_t enableReason = self->_enableReason;
      *(_DWORD *)buf = 138543874;
      v79 = self;
      __int16 v80 = 1024;
      *(_DWORD *)v81 = v56;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = enableReason;
      v41 = "%{public}@ - Completed authentication completed with status=%d for reason=%d";
      v42 = v40;
      uint32_t v43 = 24;
    }
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    goto LABEL_44;
  }
  v61 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    int64_t v62 = self->_enableReason;
    *(_DWORD *)buf = 138543618;
    v79 = self;
    __int16 v80 = 1024;
    *(_DWORD *)v81 = v62;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}@ - ICML was manually disabled by the user. Not retrying CloudAuthenticateOperation for reason=%d", buf, 0x12u);
  }

  v63 = +[NSError ic_cloudClientErrorWithCode:2003 userInfo:0];
  [(CloudLibraryOperation *)self setError:v63];

  [(CloudLibraryOperation *)self setStatus:3];
  v64 = [(CloudLibraryOperation *)self musicLibrary];
  v65 = MSVTCCIdentityForCurrentProcess();
  [v64 setClientIdentity:v65];

  [v3 endTransaction];
  v11 = v66;
LABEL_46:
}

- (CloudAuthenticateOperation)initWithConfiguration:(id)a3 mergeToCloudLibraryPreference:(id)a4 allowNoisyAuthPrompt:(BOOL)a5 enableLibraryReason:(int64_t)a6 clientIdentity:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)CloudAuthenticateOperation;
  result = [(CloudLibraryOperation *)&v11 initWithConfiguration:a3 clientIdentity:a7];
  if (result)
  {
    result->_mergeToCloudLibraryPreference = (NSNumber *)a4;
    result->_char allowNoisyAuthPrompt = a5;
    result->_int64_t enableReason = a6;
  }
  return result;
}

@end