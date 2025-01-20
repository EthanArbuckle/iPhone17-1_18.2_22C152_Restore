@interface TRAuthenticationOperation
- (BOOL)_canDoMagicAuthForAccount:(id)a3;
- (BOOL)canDoTermsAndConditions;
- (BOOL)forceFail;
- (BOOL)isCLIMode;
- (BOOL)shouldForceInteractiveAuth;
- (BOOL)shouldIgnoreAuthFailures;
- (BOOL)shouldSetupHomePod;
- (BOOL)shouldUseAIDA;
- (NSSet)targetedServices;
- (NSString)rawPassword;
- (NSString)sessionID;
- (UIViewController)presentingChildViewController;
- (UIViewController)presentingViewController;
- (int)authType;
- (void)_reportAuthMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 deviceType:(int)a6 sessionID:(id)a7 authServiceType:(int)a8;
- (void)execute;
- (void)setAuthType:(int)a3;
- (void)setCanDoTermsAndConditions:(BOOL)a3;
- (void)setForceFail:(BOOL)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setPresentingChildViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setShouldForceInteractiveAuth:(BOOL)a3;
- (void)setShouldIgnoreAuthFailures:(BOOL)a3;
- (void)setShouldSetupHomePod:(BOOL)a3;
- (void)setShouldUseAIDA:(BOOL)a3;
- (void)setTargetedServices:(id)a3;
@end

@implementation TRAuthenticationOperation

- (void)execute
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  if ([(TRAuthenticationOperation *)self isCancelled])
  {
    id v90 = [(id)objc_opt_class() userCancelledError];
    -[TROperation finishWithError:](self, "finishWithError:");

    return;
  }
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [(TRAuthenticationOperation *)self targetedServices];
  v5 = [v3 setWithSet:v4];

  v87 = [MEMORY[0x263EFF9C0] set];
  v6 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:");
  if (_TRLogEnabled == 1)
  {
    v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(TRAuthenticationOperation *)self shouldForceInteractiveAuth];
      v9 = [(TRAuthenticationOperation *)self presentingViewController];
      *(_DWORD *)buf = 136315906;
      v97 = "-[TRAuthenticationOperation execute]";
      __int16 v98 = 2112;
      v99 = v5;
      __int16 v100 = 1024;
      *(_DWORD *)v101 = v8;
      *(_WORD *)&v101[4] = 2112;
      *(void *)&v101[6] = v9;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: services: %@, shouldForceInteractiveAuth? %d, presentingViewController? %@", buf, 0x26u);
    }
  }
  if (![v5 count])
  {
    v48 = v6;
LABEL_127:
    if (_TRLogEnabled == 1)
    {
      v79 = TRLogHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v97 = "-[TRAuthenticationOperation execute]";
        __int16 v98 = 2112;
        v99 = v87;
        _os_log_impl(&dword_2149BE000, v79, OS_LOG_TYPE_DEFAULT, "%s finishing with result: %@", buf, 0x16u);
      }
    }
    v16 = objc_opt_new();
    [v16 setObject:v87 forKeyedSubscript:@"TRAuthenticationOperationUnauthenticatedServicesKey"];
    if (v48) {
      [v16 setObject:v48 forKeyedSubscript:@"TRAuthenticationOperationErrorKey"];
    }
    id v80 = [v16 copy];
    [(TROperation *)self finishWithResult:v80];

    v6 = v48;
    goto LABEL_150;
  }
  unint64_t v10 = 0x264220000uLL;
  v88 = v5;
  while (1)
  {
    v11 = [v5 anyObject];
    uint64_t v12 = [v11 unsignedIntegerValue];

    uint64_t v13 = [*(id *)(v10 + 1040) idmsAccountForAccountService:v12];
    if (!v13) {
      break;
    }
    v14 = (void *)v13;
    v15 = [MEMORY[0x263F290F0] sharedInstance];
    v16 = [v15 transportableAuthKitAccount:v14];

    uint64_t v17 = [*(id *)(v10 + 1040) associatedAccountServicesForIDMSAccount:v16];
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v17];
    [v18 intersectSet:v5];
    [v5 minusSet:v18];
    id v19 = v18;
    BOOL v20 = [(TRAuthenticationOperation *)self shouldForceInteractiveAuth];
    v21 = [(TRAuthenticationOperation *)self presentingViewController];
    if (v21) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = self->_isCLIMode && self->_rawPassword != 0;
    }

    v89 = (void *)v17;
    if ([(TRAuthenticationOperation *)self _canDoMagicAuthForAccount:v16])
    {
      int v25 = !v20;
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        v26 = TRLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v97 = "-[TRAuthenticationOperation execute]";
          _os_log_impl(&dword_2149BE000, v26, OS_LOG_TYPE_DEFAULT, "%s: this device cannot do magic auth", buf, 0xCu);
        }
      }
      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-12001 userInfo:0];

      if (self->_isCLIMode && !self->_rawPassword)
      {
        [(TROperation *)self finishWithError:v27];
        v29 = v19;
        v6 = (void *)v27;
        goto LABEL_149;
      }
      int v25 = 0;
      v6 = (void *)v27;
    }
    id v91 = v19;
    if (+[TRDefaults forceProxyAuth])
    {
      if (_TRLogEnabled == 1)
      {
        BOOL v86 = v22;
        v28 = TRLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v97 = "-[TRAuthenticationOperation execute]";
          _os_log_impl(&dword_2149BE000, v28, OS_LOG_TYPE_DEFAULT, "%s: Force Proxy Auth Default enabled", buf, 0xCu);
        }
        v29 = v19;
LABEL_64:

        if (!v86)
        {
LABEL_92:
          if (![v29 count]) {
            goto LABEL_106;
          }
          v67 = [MEMORY[0x263F089D8] string];
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v68 = v5;
          uint64_t v69 = [v68 countByEnumeratingWithState:&v92 objects:v102 count:16];
          if (v69)
          {
            uint64_t v70 = v69;
            uint64_t v71 = *(void *)v93;
            do
            {
              for (uint64_t i = 0; i != v70; ++i)
              {
                if (*(void *)v93 != v71) {
                  objc_enumerationMutation(v68);
                }
                v73 = StringFromTRAccountService([*(id *)(*((void *)&v92 + 1) + 8 * i) unsignedIntegerValue]);
                [v67 appendString:v73];
              }
              uint64_t v70 = [v68 countByEnumeratingWithState:&v92 objects:v102 count:16];
            }
            while (v70);
          }

          v5 = v88;
          if (_TRLogEnabled == 1)
          {
            v74 = TRLogHandle();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v97 = "-[TRAuthenticationOperation execute]";
              __int16 v98 = 2112;
              v99 = v67;
              __int16 v100 = 2112;
              *(void *)v101 = v29;
              *(_WORD *)&v101[8] = 2112;
              *(void *)&v101[10] = v6;
              _os_log_impl(&dword_2149BE000, v74, OS_LOG_TYPE_DEFAULT, "%s Failed to authenticate with services: %@ (%@), last know error %@", buf, 0x2Au);
            }
          }
          if ([(TRAuthenticationOperation *)self shouldIgnoreAuthFailures])
          {
            [v87 unionSet:v29];

            id v19 = v91;
LABEL_106:

            unint64_t v10 = 0x264220000;
LABEL_107:

            v48 = v6;
            goto LABEL_108;
          }
          [v68 unionSet:v29];
          v82 = objc_opt_new();
          [v82 setObject:v68 forKeyedSubscript:@"TRAuthenticationOperationUnauthenticatedServicesKey"];
          if (v6) {
            [v82 setObject:v6 forKeyedSubscript:@"TRAuthenticationOperationErrorKey"];
          }
          v83 = (void *)[v82 copy];
          [(TROperation *)self finishWithResult:v83];

LABEL_147:
          id v19 = v91;
LABEL_149:

          goto LABEL_150;
        }
      }
      else
      {
LABEL_66:
        v29 = v19;
        if (!v22) {
          goto LABEL_92;
        }
      }
      if (self->_authType == 1) {
        int v49 = 3;
      }
      else {
        int v49 = 2;
      }
      self->_authType = v49;
      v50 = [v29 anyObject];
      uint64_t v51 = [v50 intValue];

      if (_TRLogEnabled == 1)
      {
        v52 = TRLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v97 = "-[TRAuthenticationOperation execute]";
          _os_log_impl(&dword_2149BE000, v52, OS_LOG_TYPE_DEFAULT, "%s attempting proxy auth", buf, 0xCu);
        }
      }
      v53 = [TRProxyAuthOperation alloc];
      v54 = [(TROperation *)self session];
      v55 = [(TROperation *)v53 initWithSession:v54];

      [(TRProxyAuthOperation *)v55 setAccount:v16];
      [(TRProxyAuthOperation *)v55 setTargetedServices:v29];
      v56 = [(TRAuthenticationOperation *)self presentingViewController];
      [(TRProxyAuthOperation *)v55 setPresentingViewController:v56];

      [(TRProxyAuthOperation *)v55 setShouldUseAIDA:[(TRAuthenticationOperation *)self shouldUseAIDA]];
      [(TRProxyAuthOperation *)v55 setIsForHomePod:self->_shouldSetupHomePod];
      [(TRProxyAuthOperation *)v55 setIsCLIMode:self->_isCLIMode];
      [(TRProxyAuthOperation *)v55 setCanDoTermsAndConditions:self->_canDoTermsAndConditions];
      [(TRProxyAuthOperation *)v55 setForceFail:self->_forceFail];
      [(TRProxyAuthOperation *)v55 setPresentingChildViewController:self->_presentingChildViewController];
      if (self->_isCLIMode)
      {
        rawPassword = self->_rawPassword;
        if (rawPassword)
        {
          if (_TRLogEnabled == 1)
          {
            v58 = TRLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2149BE000, v58, OS_LOG_TYPE_DEFAULT, "TRAuthenticationOperation->TRProxyAuthOperation isClIMode enabled, setting passed in password", buf, 2u);
            }

            rawPassword = self->_rawPassword;
          }
          [(TRProxyAuthOperation *)v55 setRawPassword:rawPassword];
        }
      }
      self->_proxyAuthStartTicks = mach_absolute_time();
      [(TRProxyAuthOperation *)v55 start];
      mach_absolute_time();
      UpTicksToSecondsF();
      double v60 = v59;
      v61 = [(TROperation *)v55 result];
      v62 = [(TROperation *)v55 error];
      if (!v62)
      {
        v62 = [v61 objectForKey:@"TRProxyAuthOperationErrorKey"];
      }
      if (self->_shouldSetupHomePod) {
        uint64_t v63 = 1;
      }
      else {
        uint64_t v63 = 2;
      }
      [(TRAuthenticationOperation *)self _reportAuthMetrics:v62 durationSeconds:2 authType:v63 deviceType:self->_sessionID sessionID:v51 authServiceType:v60];
      if (_TRLogEnabled == 1)
      {
        v64 = TRLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v97 = "-[TRAuthenticationOperation execute]";
          __int16 v98 = 2112;
          v99 = v61;
          _os_log_impl(&dword_2149BE000, v64, OS_LOG_TYPE_DEFAULT, "%s Proxy auth finished with results %@", buf, 0x16u);
        }
      }
      if (v61)
      {
        uint64_t v65 = [v61 objectForKey:@"TRProxyAuthOperationUnauthenticatedServicesKey"];

        uint64_t v66 = [v61 objectForKey:@"TRProxyAuthOperationErrorKey"];

        v29 = (void *)v65;
        v6 = (void *)v66;
        v5 = v88;
        id v19 = v91;
        goto LABEL_92;
      }
      v84 = [(TROperation *)v55 error];
      if (_TRLogEnabled == 1)
      {
        v85 = TRLogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v97 = "-[TRAuthenticationOperation execute]";
          __int16 v98 = 2112;
          v99 = v84;
          _os_log_impl(&dword_2149BE000, v85, OS_LOG_TYPE_DEFAULT, "%s Proxy auth failed with error: %@", buf, 0x16u);
        }
      }
      [(TROperation *)self finishWithError:v84];

      v5 = v88;
      goto LABEL_147;
    }
    if (!v25) {
      goto LABEL_66;
    }
    self->_authType = 1;
    v30 = [v19 anyObject];
    uint64_t v31 = [v30 intValue];

    if (_TRLogEnabled == 1)
    {
      v32 = TRLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v97 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_2149BE000, v32, OS_LOG_TYPE_DEFAULT, "%s attempting companion auth", buf, 0xCu);
      }
    }
    BOOL v86 = v22;
    v33 = [TRCompanionAuthOperation alloc];
    v34 = [(TROperation *)self session];
    v28 = [(TROperation *)v33 initWithSession:v34];

    [v28 setAccount:v16];
    [v28 setTargetedServices:v19];
    [v28 setShouldUseAIDA:[(TRAuthenticationOperation *)self shouldUseAIDA]];
    v35 = [(TRAuthenticationOperation *)self presentingViewController];
    [v28 setPresentingViewController:v35];

    [v28 setIsForHomePod:self->_shouldSetupHomePod];
    [v28 setIsCLIMode:self->_isCLIMode];
    [v28 setCanDoTermsAndConditions:self->_canDoTermsAndConditions];
    [v28 setForceFail:self->_forceFail];
    [v28 setPresentingChildViewController:self->_presentingChildViewController];
    if (self->_isCLIMode)
    {
      v36 = self->_rawPassword;
      if (v36)
      {
        if (_TRLogEnabled == 1)
        {
          v37 = TRLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2149BE000, v37, OS_LOG_TYPE_DEFAULT, "TRAuthenticationOperation->TRCompanionAuthOperation isClIMode enabled, setting passed in password", buf, 2u);
          }

          v36 = self->_rawPassword;
        }
        [v28 setRawPassword:v36];
      }
    }
    self->_companionAuthStartTicks = mach_absolute_time();
    [v28 start];
    mach_absolute_time();
    UpTicksToSecondsF();
    double v39 = v38;
    v40 = [v28 result];
    v41 = [v28 error];
    if (!v41)
    {
      v41 = [v40 objectForKey:@"TRCompanionAuthOperationErrorKey"];
    }
    if (self->_shouldSetupHomePod) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = 2;
    }
    [(TRAuthenticationOperation *)self _reportAuthMetrics:v41 durationSeconds:1 authType:v42 deviceType:self->_sessionID sessionID:v31 authServiceType:v39];
    if (_TRLogEnabled == 1)
    {
      v43 = TRLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v97 = "-[TRAuthenticationOperation execute]";
        __int16 v98 = 2112;
        v99 = v40;
        _os_log_impl(&dword_2149BE000, v43, OS_LOG_TYPE_DEFAULT, "%s companion auth finished with results %@", buf, 0x16u);
      }
    }
    if (!v40)
    {
      v75 = [v28 error];
      if (_TRLogEnabled == 1)
      {
        v76 = TRLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
LABEL_119:
          *(_DWORD *)buf = 136315394;
          v97 = "-[TRAuthenticationOperation execute]";
          __int16 v98 = 2112;
          v99 = v75;
          _os_log_impl(&dword_2149BE000, v76, OS_LOG_TYPE_DEFAULT, "%s Companion auth failed with error: %@", buf, 0x16u);
        }
LABEL_120:
      }
LABEL_121:
      [(TROperation *)self finishWithError:v75];
      int v77 = 1;
      v29 = v91;
LABEL_122:

      v48 = v6;
      goto LABEL_123;
    }
    if (self->_shouldSetupHomePod)
    {
      uint64_t v44 = [v28 error];
      if (v44)
      {
        v45 = (void *)v44;
        v46 = [v28 error];
        char v47 = objc_msgSend(v46, "ak_isEligibleForProxiedAuthFallback");

        if ((v47 & 1) == 0)
        {
          v75 = [v28 error];
          if (_TRLogEnabled == 1)
          {
            v76 = TRLogHandle();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_119;
            }
            goto LABEL_120;
          }
          goto LABEL_121;
        }
      }
    }
    v29 = [v40 objectForKey:@"TRCompanionAuthOperationUnauthenticatedServicesKey"];

    v48 = [v40 objectForKey:@"TRCompanionAuthOperationErrorKey"];

    if ([v29 count])
    {

      v6 = v48;
      v5 = v88;
      id v19 = v91;
      goto LABEL_64;
    }
    if (_TRLogEnabled == 1)
    {
      v75 = TRLogHandle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v97 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_2149BE000, v75, OS_LOG_TYPE_DEFAULT, "%s Companion auth successful. Authenticating remaining services", buf, 0xCu);
      }
      int v77 = 4;
      v6 = v48;
      goto LABEL_122;
    }
    int v77 = 4;
LABEL_123:

    BOOL v78 = v77 == 4;
    v5 = v88;
    unint64_t v10 = 0x264220000;
    if (!v78) {
      goto LABEL_151;
    }
LABEL_108:
    v6 = v48;
    if (![v5 count]) {
      goto LABEL_127;
    }
  }
  if (_TRLogEnabled == 1)
  {
    v23 = TRLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = StringFromTRAccountService(v12);
      *(_DWORD *)buf = 136315394;
      v97 = "-[TRAuthenticationOperation execute]";
      __int16 v98 = 2112;
      v99 = v24;
      _os_log_impl(&dword_2149BE000, v23, OS_LOG_TYPE_DEFAULT, "%s Failed to find IDMS account for service: %@", buf, 0x16u);
    }
  }
  if (!self->_shouldSetupHomePod)
  {
    v16 = [NSNumber numberWithUnsignedInteger:v12];
    [v5 removeObject:v16];
    goto LABEL_107;
  }
  v16 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-12004 userInfo:0];
  if (_TRLogEnabled == 1)
  {
    v81 = TRLogHandle();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[TRAuthenticationOperation execute]";
      __int16 v98 = 2112;
      v99 = v16;
      _os_log_impl(&dword_2149BE000, v81, OS_LOG_TYPE_DEFAULT, "%s Ending Auth, Error: %@", buf, 0x16u);
    }
  }
  [(TROperation *)self finishWithError:v16];
LABEL_150:

  v48 = v6;
LABEL_151:
}

- (BOOL)_canDoMagicAuthForAccount:(id)a3
{
  v3 = (void *)MEMORY[0x263F290F0];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  v6 = [v5 passwordResetTokenForAccount:v4];

  return v6 != 0;
}

- (void)_reportAuthMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 deviceType:(int)a6 sessionID:(id)a7 authServiceType:(int)a8
{
  v69[18] = *MEMORY[0x263EF8340];
  v54 = (__CFString *)a7;
  id v48 = a3;
  uint64_t v63 = [v48 code];
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v63);
  uint64_t v11 = [v48 domain];
  uint64_t v12 = [v48 underlyingErrors];

  uint64_t v13 = [v12 firstObject];

  uint64_t v59 = [v13 code];
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", v59);
  uint64_t v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 domain];
  v61 = v13;
  v15 = [v13 underlyingErrors];
  v16 = [v15 firstObject];

  uint64_t v56 = [v16 code];
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
  v18 = [v16 domain];
  v58 = v16;
  id v19 = [v16 underlyingErrors];
  BOOL v20 = [v19 firstObject];

  uint64_t v51 = [v20 code];
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v20);
  v55 = v20;
  BOOL v22 = [v20 domain];
  v68[0] = @"duration";
  char v47 = [NSNumber numberWithUnsignedInt:(a4 * 1000.0)];
  v69[0] = v47;
  v68[1] = @"errorCode";
  uint64_t v23 = [NSNumber numberWithInteger:v63];
  v46 = (void *)v23;
  v62 = (void *)v11;
  v64 = (void *)v10;
  if (v10) {
    v24 = (__CFString *)v10;
  }
  else {
    v24 = @"0";
  }
  v69[1] = v23;
  v69[2] = v24;
  v68[2] = @"errorCodeString";
  v68[3] = @"errorDomain";
  if (v11) {
    int v25 = (__CFString *)v11;
  }
  else {
    int v25 = @"NoDomain";
  }
  v69[3] = v25;
  v68[4] = @"underlyingErrorCode0";
  uint64_t v26 = [NSNumber numberWithInteger:v59];
  v45 = (void *)v26;
  if (v65) {
    uint64_t v27 = v65;
  }
  else {
    uint64_t v27 = @"0";
  }
  v69[4] = v26;
  v69[5] = v27;
  v68[5] = @"underlyingErrorCodeString0";
  v68[6] = @"underlyingErrorDomain0";
  double v60 = (void *)v14;
  if (v14) {
    v28 = (__CFString *)v14;
  }
  else {
    v28 = @"NoDomain";
  }
  v69[6] = v28;
  v68[7] = @"underlyingErrorCode1";
  uint64_t v29 = [NSNumber numberWithInteger:v56];
  v30 = (void *)v29;
  v57 = (void *)v17;
  if (v17) {
    uint64_t v31 = (__CFString *)v17;
  }
  else {
    uint64_t v31 = @"0";
  }
  v69[7] = v29;
  v69[8] = v31;
  v68[8] = @"underlyingErrorCodeString1";
  v68[9] = @"underlyingErrorDomain1";
  if (v18) {
    v32 = v18;
  }
  else {
    v32 = @"NoDomain";
  }
  v69[9] = v32;
  v68[10] = @"underlyingErrorCode2";
  uint64_t v33 = [NSNumber numberWithInteger:v51];
  v34 = (void *)v33;
  v52 = (void *)v21;
  if (v21) {
    v35 = (__CFString *)v21;
  }
  else {
    v35 = @"0";
  }
  v69[10] = v33;
  v69[11] = v35;
  v68[11] = @"underlyingErrorCodeString2";
  v68[12] = @"underlyingErrorDomain2";
  if (v22) {
    v36 = v22;
  }
  else {
    v36 = @"NoDomain";
  }
  v69[12] = v36;
  v68[13] = @"authType";
  v37 = [NSNumber numberWithInt:a5];
  v69[13] = v37;
  v68[14] = @"deviceAuthType";
  double v38 = [NSNumber numberWithInt:a6];
  v69[14] = v38;
  v68[15] = @"authServiceType";
  double v39 = [NSNumber numberWithInt:a8];
  v69[15] = v39;
  v68[16] = @"success";
  uint64_t v40 = [NSNumber numberWithInt:v48 == 0];
  v41 = (void *)v40;
  v68[17] = @"sessionID";
  uint64_t v42 = @"nil";
  if (v54) {
    uint64_t v42 = v54;
  }
  v69[16] = v40;
  v69[17] = v42;
  v43 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:18];

  TRMetricsLog(@"com.apple.touchremote.authentication", v43);
  if (_TRLogEnabled == 1)
  {
    uint64_t v44 = TRLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v43;
      _os_log_impl(&dword_2149BE000, v44, OS_LOG_TYPE_DEFAULT, "TouchRemote Auth Metric sent: %@\n", buf, 0xCu);
    }
  }
}

- (NSSet)targetedServices
{
  return self->_targetedServices;
}

- (void)setTargetedServices:(id)a3
{
}

- (BOOL)shouldIgnoreAuthFailures
{
  return self->_shouldIgnoreAuthFailures;
}

- (void)setShouldIgnoreAuthFailures:(BOOL)a3
{
  self->_shouldIgnoreAuthFailures = a3;
}

- (BOOL)shouldForceInteractiveAuth
{
  return self->_shouldForceInteractiveAuth;
}

- (void)setShouldForceInteractiveAuth:(BOOL)a3
{
  self->_shouldForceInteractiveAuth = a3;
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (BOOL)shouldSetupHomePod
{
  return self->_shouldSetupHomePod;
}

- (void)setShouldSetupHomePod:(BOOL)a3
{
  self->_shouldSetupHomePod = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (BOOL)canDoTermsAndConditions
{
  return self->_canDoTermsAndConditions;
}

- (void)setCanDoTermsAndConditions:(BOOL)a3
{
  self->_canDoTermsAndConditions = a3;
}

- (int)authType
{
  return self->_authType;
}

- (void)setAuthType:(int)a3
{
  self->_authType = a3;
}

- (BOOL)forceFail
{
  return self->_forceFail;
}

- (void)setForceFail:(BOOL)a3
{
  self->_forceFail = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_targetedServices, 0);
}

@end