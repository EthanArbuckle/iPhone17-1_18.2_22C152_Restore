@interface MFConnection
+ (BOOL)logAllSocketActivity;
+ (BOOL)shouldTryFallbacksAfterError:(id)a3;
+ (id)certUIPromptScheduler;
+ (id)logActivityOnHosts;
+ (id)logActivityOnPorts;
+ (id)logClasses;
+ (void)initialize;
+ (void)logConnection:(id)a3 type:(int64_t)a4 data:(id)a5;
+ (void)readLoggingDefaults;
+ (void)setLogActivityOnHosts:(id)a3;
+ (void)setLogActivityOnPorts:(id)a3;
+ (void)setLogAllSocketActivity:(BOOL)a3;
+ (void)setLogClasses:(id)a3;
- (BOOL)_certificateIsTrustedForAccount:(id)a3;
- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4;
- (BOOL)authenticateUsingAccount:(id)a3;
- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4;
- (BOOL)connectUsingAccount:(id)a3;
- (BOOL)connectUsingFallbacksForAccount:(id)a3;
- (BOOL)connectUsingSettings:(id)a3;
- (BOOL)enableSSL;
- (BOOL)hasBytesAvailable;
- (BOOL)isCellularConnection;
- (BOOL)isConstrained;
- (BOOL)isFetching;
- (BOOL)isValid;
- (BOOL)loginDisabled;
- (BOOL)readBytesIntoData:(id)a3 desiredLength:(unint64_t)a4;
- (BOOL)readLineIntoData:(id)a3;
- (BOOL)startCompression;
- (BOOL)startTLSForAccount:(id)a3;
- (BOOL)usesOpportunisticSockets;
- (BOOL)writeBytes:(const char *)a3 length:(unint64_t)a4 dontLogBytesInRange:(_NSRange)a5;
- (BOOL)writeData:(id)a3;
- (BOOL)writeData:(id)a3 dontLogBytesInRange:(_NSRange)a4;
- (MFConnection)init;
- (NSArray)authenticationMechanisms;
- (NSArray)capabilities;
- (NSString)accountLogString;
- (NSString)description;
- (NSString)securityProtocol;
- (double)lastUsedTime;
- (id)connectionSettings;
- (id)copyDiagnosticInformation;
- (void)_clearBuffer;
- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4;
- (void)_setupSocketWithSettings:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)enableThroughputMonitoring:(BOOL)a3;
- (void)endCompression;
- (void)logReadChars:(const char *)a3 length:(unint64_t)a4;
- (void)setConnectionSettings:(id)a3;
- (void)setDesiredReadBufferLength:(unint64_t)a3;
- (void)setIsFetching:(BOOL)a3;
- (void)startActivity;
- (void)startCompression;
- (void)stopActivity;
- (void)test_setSocket:(id)a3;
@end

@implementation MFConnection

+ (void)readLoggingDefaults
{
  [(id)sLogLock lock];
  v3 = (void *)sLogClasses;
  sLogClasses = 0;

  v4 = (void *)sLoggedPorts;
  sLoggedPorts = 0;

  v5 = (void *)sLoggedHosts;
  sLoggedHosts = 0;

  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LogActivityOnAllPorts", v6, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat
    || (CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F77E20],
        CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F77E20], v7, v8),
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LogActivityOnAllPorts", v10, &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat))
  {
    sLogAllConnectionActivity = AppIntegerValue != 0;
    if (!AppIntegerValue) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a1, 0);
    v17 = (void *)sLogClasses;
    sLogClasses = v16;

    goto LABEL_18;
  }
  if (sLogAllConnectionActivity) {
    goto LABEL_17;
  }
LABEL_4:
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v12 = [v11 stringArrayForKey:@"LogActivityOnPort"];
  v13 = [v11 stringArrayForKey:@"LogActivityOnHost"];
  if (v12
    || ([v11 stringForKey:@"LogActivityOnPort"],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 componentsSeparatedByString:@","],
        v12 = objc_claimAutoreleasedReturnValue(),
        v14,
        v12))
  {
    if ([v12 count]) {
      objc_storeStrong((id *)&sLoggedPorts, v12);
    }
  }
  if (v13
    || ([v11 stringForKey:@"LogActivityOnHost"],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v15 componentsSeparatedByString:@","],
        v13 = objc_claimAutoreleasedReturnValue(),
        v15,
        v13))
  {
    if ([v13 count]) {
      objc_storeStrong((id *)&sLoggedHosts, v13);
    }
  }

  if (sLogAllConnectionActivity || [(id)sLoggedPorts count] || objc_msgSend((id)sLoggedHosts, "count")) {
    goto LABEL_17;
  }
LABEL_18:
  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 postNotificationName:@"MFReloadNetworkLoggingNotification" object:a1];

  [(id)sLogLock unlock];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!sLogLock)
    {
      _MFLockGlobalLock();
      if (!sLogLock)
      {
        uint64_t v3 = [objc_alloc(MEMORY[0x1E4F73580]) initWithName:@"logLock" andDelegate:0];
        v4 = (void *)sLogLock;
        sLogLock = v3;
      }
      _MFUnlockGlobalLock();
    }
    [a1 readLoggingDefaults];
    if (initialize_once != -1)
    {
      dispatch_once(&initialize_once, &__block_literal_global_1);
    }
  }
}

void __26__MFConnection_initialize__block_invoke()
{
  v0 = MEMORY[0x1E4F14428];
  notify_register_dispatch((const char *)*MEMORY[0x1E4F77E50], (int *)&initialize_token, MEMORY[0x1E4F14428], &__block_literal_global_23);
  notify_register_dispatch((const char *)*MEMORY[0x1E4F77E38], (int *)&initialize_token, v0, &__block_literal_global_25);
  v1 = (void *)MEMORY[0x1E4F14428];
}

uint64_t __26__MFConnection_initialize__block_invoke_2()
{
  return +[MFConnection readLoggingDefaults];
}

uint64_t __26__MFConnection_initialize__block_invoke_3()
{
  return +[MFConnection readLoggingDefaults];
}

+ (void)logConnection:(id)a3 type:(int64_t)a4 data:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v25 = (id *)a3;
  id v23 = a5;
  uint64_t v7 = [v23 bytes];
  unint64_t v8 = [v23 length];
  unint64_t v9 = v8;
  if (v8 >= 0x400) {
    uint64_t v10 = 1024;
  }
  else {
    uint64_t v10 = v8;
  }
  if ((unint64_t)(a4 - 1) > 3) {
    v11 = "CONNECTED";
  }
  else {
    v11 = off_1E5D3B3C8[a4 - 1];
  }
  v24 = v11;
  id v12 = v25[2];
  v13 = [v25[3] securityProtocol];
  if (v13)
  {
    i = [NSString stringWithFormat:@":%@", v13];
  }
  else
  {
    i = &stru_1EFF11268;
  }
  v15 = i;
  if (a4)
  {
    if (!v10) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  uint64_t v16 = MFLogNetwork();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = objc_opt_class();
    v18 = [v12 hostname];
    *(_DWORD *)buf = 136447490;
    v27 = v24;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    __int16 v30 = 2048;
    v31 = v25;
    __int16 v32 = 2112;
    id v33 = v18;
    __int16 v34 = 1024;
    int v35 = [v12 portNumber];
    __int16 v36 = 2114;
    v37 = v15;
    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@]", buf, 0x3Au);
  }
  for (i = v15; v10; i = v15)
  {
LABEL_16:
    v19 = MFLogNetwork();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = objc_opt_class();
      id v21 = [v12 hostname];
      int v22 = [v12 portNumber];
      *(_DWORD *)buf = 136448002;
      v27 = v24;
      __int16 v28 = 2114;
      uint64_t v29 = v20;
      __int16 v30 = 2048;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v21;
      __int16 v34 = 1024;
      int v35 = v22;
      __int16 v36 = 2114;
      v37 = v15;
      __int16 v38 = 1040;
      int v39 = v10;
      __int16 v40 = 2096;
      uint64_t v41 = v7;
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@] %{mobilemail:networkData}.*P", buf, 0x4Au);
    }
    v7 += v10;
    v9 -= v10;
    if (v9 >= 0x400) {
      uint64_t v10 = 1024;
    }
    else {
      uint64_t v10 = v9;
    }
  }
LABEL_22:
}

+ (id)logClasses
{
  [(id)sLogLock lock];
  id v2 = (id)sLogClasses;
  [(id)sLogLock unlock];
  return v2;
}

+ (void)setLogClasses:(id)a3
{
  id v4 = a3;
  [(id)sLogLock lock];
  objc_storeStrong((id *)&sLogClasses, a3);
  [(id)sLogLock unlock];
}

+ (BOOL)logAllSocketActivity
{
  return sLogAllConnectionActivity;
}

+ (void)setLogAllSocketActivity:(BOOL)a3
{
  sLogAllConnectionActivity = a3;
}

+ (id)logActivityOnPorts
{
  return (id)sLoggedPorts;
}

+ (void)setLogActivityOnPorts:(id)a3
{
}

+ (id)logActivityOnHosts
{
  return (id)sLoggedHosts;
}

+ (void)setLogActivityOnHosts:(id)a3
{
}

- (MFConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFConnection;
  id v2 = [(MFConnection *)&v5 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F734D0] sharedController];
    [v3 addDiagnosticsGenerator:v2];

    atomic_store(0, (unsigned __int8 *)&v2->_isFetching);
  }
  return v2;
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  [(MFNWConnectionWrapper *)self->_socket close];
  deflater = self->_deflater;
  if (deflater)
  {
    deflateEnd(deflater);
    free(self->_deflater);
    self->_deflater = 0;
  }
  inflater = self->_inflater;
  if (inflater)
  {
    inflateEnd(inflater);
    free(self->_inflater);
    self->_inflater = 0;
  }
  zbuffer = self->_zbuffer;
  if (zbuffer) {
    free(zbuffer);
  }
  v7.receiver = self;
  v7.super_class = (Class)MFConnection;
  [(MFConnection *)&v7 dealloc];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFConnection;
  id v4 = [(MFConnection *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ _socket: %p\n", v4, self->_socket];

  return (NSString *)v5;
}

+ (id)certUIPromptScheduler
{
  if (certUIPromptScheduler_onceToken != -1) {
    dispatch_once(&certUIPromptScheduler_onceToken, &__block_literal_global_42);
  }
  id v2 = (void *)certUIPromptScheduler_scheduler;
  return v2;
}

void __37__MFConnection_certUIPromptScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.Message.CertUIPromptScheduler" qualityOfService:17];
  v1 = (void *)certUIPromptScheduler_scheduler;
  certUIPromptScheduler_scheduler = v0;
}

- (BOOL)isCellularConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MFConnection *)self mf_lock];
  BOOL v3 = [(MFNWConnectionWrapper *)self->_socket isCellularConnection];
  [(MFConnection *)self mf_unlock];
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    unint64_t v8 = self;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "#Network %d for %@", (uint8_t *)v6, 0x12u);
  }

  return v3;
}

- (BOOL)isConstrained
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(MFConnection *)self mf_lock];
  BOOL v3 = [(MFNWConnectionWrapper *)self->_socket isConstrained];
  [(MFConnection *)self mf_unlock];
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "#Network low data mode (constrained): %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (BOOL)isFetching
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isFetching);
  return v2 & 1;
}

- (void)setIsFetching:(BOOL)a3
{
  if (((((atomic_exchange((atomic_uchar *volatile)&self->_isFetching, a3) & 1) == 0) ^ a3) & 1) == 0) {
    -[MFConnection enableThroughputMonitoring:](self, "enableThroughputMonitoring:");
  }
}

- (void)_setupSocketWithSettings:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (!self->_socket) {
    __assert_rtn("-[MFConnection _setupSocketWithSettings:]", "Connection.m", 475, "_socket");
  }
  -[MFNWConnectionWrapper setConnectionServiceType:](self->_socket, "setConnectionServiceType:", [v4 connectionServiceType]);
  -[MFNWConnectionWrapper setAllowsTrustPrompt:](self->_socket, "setAllowsTrustPrompt:", [v11 allowsTrustPrompt]);
  -[MFNWConnectionWrapper setUsesOpportunisticSockets:](self->_socket, "setUsesOpportunisticSockets:", [v11 usesOpportunisticSockets]);
  objc_super v5 = [v11 sourceApplicationBundleIdentifier];
  [(MFNWConnectionWrapper *)self->_socket setSourceApplicationBundleIdentifier:v5];

  CFStringRef v6 = [v11 accountIdentifier];
  [(MFNWConnectionWrapper *)self->_socket setAccountIdentifier:v6];

  uint64_t v7 = [v11 networkAccountIdentifier];
  [(MFNWConnectionWrapper *)self->_socket setNetworkAccountIdentifier:v7];

  -[MFNWConnectionWrapper setIsNonAppInitiated:](self->_socket, "setIsNonAppInitiated:", [v11 isNonAppInitiated]);
  unint64_t v8 = [v11 clientCertificates];

  if (v8)
  {
    socket = self->_socket;
    uint64_t v10 = [v11 clientCertificates];
    [(MFNWConnectionWrapper *)socket setClientCertificates:v10];
  }
  if ([v11 tryDirectSSL]) {
    [(MFNWConnectionWrapper *)self->_socket setSecurityProtocol:*MEMORY[0x1E4F1D4B8]];
  }
}

- (BOOL)connectUsingSettings:(id)a3
{
  id v5 = a3;
  p_connectionSettings = &self->_connectionSettings;
  objc_storeStrong((id *)&self->_connectionSettings, a3);
  uint64_t v7 = [(MFConnectionSettings *)self->_connectionSettings portNumber];
  if (!self->_socket)
  {
    unint64_t v8 = objc_alloc_init(MFNWConnectionWrapper);
    socket = self->_socket;
    self->_socket = v8;

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __37__MFConnection_connectUsingSettings___block_invoke;
    v60[3] = &unk_1E5D3B330;
    objc_copyWeak(&v61, location);
    [(MFNWConnectionWrapper *)self->_socket setNetworkActivityChangeBlock:v60];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __37__MFConnection_connectUsingSettings___block_invoke_2;
    v58[3] = &unk_1E5D3B358;
    objc_copyWeak(&v59, location);
    [(MFNWConnectionWrapper *)self->_socket setServerTrustHandler:v58];
    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    objc_destroyWeak(location);
  }
  uint64_t v10 = +[MFActivityMonitor currentMonitor];
  [v10 setError:0];
  [(MFConnection *)self _setupSocketWithSettings:self->_connectionSettings];
  [v10 addCancelable:self->_socket];
  if (!v7)
  {
    id v17 = [(MFConnectionSettings *)*p_connectionSettings serviceName];
    v18 = getservbyname((const char *)[v17 UTF8String], "tcp");

    if (!v18 || !LOWORD(v18->s_port))
    {
      v15 = +[MFActivityMonitor currentMonitor];
      id v56 = v5;
      v19 = NSString;
      uint64_t v16 = MFLookupLocalizedString(@"DONT_KNOW_SERVICE_PORT", @"Can’t determine port to use for the TCP/IP service “%@”.", @"Delayed");
      uint64_t v20 = [(MFConnectionSettings *)*p_connectionSettings serviceName];
      id v21 = objc_msgSend(v19, "stringWithFormat:", v16, v20);
      int v22 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1031 localizedDescription:v21];
      [v15 setError:v22];

      uint64_t v7 = 0;
      BOOL v13 = 0;
      id v5 = v56;
      goto LABEL_11;
    }
    uint64_t v7 = __rev16(LOWORD(v18->s_port));
  }
  id v11 = +[MFNetworkController sharedInstance];
  char v12 = [v11 inAirplaneMode];

  if (v12)
  {
    BOOL v13 = 0;
    goto LABEL_12;
  }
  v14 = self->_socket;
  v15 = [(MFConnectionSettings *)self->_connectionSettings hostname];
  uint64_t v16 = [v5 certUIService];
  BOOL v13 = [(MFNWConnectionWrapper *)v14 connectToHost:v15 withPort:v7 service:v16];
LABEL_11:

LABEL_12:
  [v10 removeCancelable:self->_socket];
  if (!v13)
  {
    v55 = v10;
    id v57 = v5;
    v54 = [(MFNWConnectionWrapper *)self->_socket error];
    id v23 = +[MFActivityMonitor currentMonitor];
    v24 = [v54 domain];
    v25 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", v24, [v54 code], 0);
    [v23 setError:v25];

    uint64_t v10 = v55;
    v51 = +[MFActivityMonitor currentMonitor];
    v53 = [(MFConnectionSettings *)*p_connectionSettings hostname];
    BOOL v26 = [(MFConnectionSettings *)*p_connectionSettings tryDirectSSL];
    id v27 = v51;
    id v52 = v53;
    __int16 v28 = [v27 error];
    uint64_t v29 = v28;
    if (v28)
    {
      __int16 v30 = v52;
      v31 = [v28 domain];
      int v32 = [(id)*MEMORY[0x1E4F28798] isEqualToString:v31];

      if (v32)
      {
        uint64_t v33 = [v29 code];
        switch(v33)
        {
          case '<':
            v44 = NSString;
            int v35 = MFLookupLocalizedString(@"CONNECTION_TIMED_OUT", @"The connection to the server “%@” on port %d timed out.", @"Delayed");
            uint64_t v36 = objc_msgSend(v44, "stringWithFormat:", v35, v52, v7);
            break;
          case '=':
            v49 = NSString;
            if (v26) {
              MFLookupLocalizedString(@"MF_SSL_CONNECTION_FAILURE", @"Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.", @"Delayed");
            }
            else {
            int v35 = MFLookupLocalizedString(@"CONNECTION_REFUSED", @"The server “%@” refused to allow a connection on port %d.", @"Delayed");
            }
            uint64_t v36 = objc_msgSend(v49, "stringWithFormat:", v35, v52, v7);
            break;
          case 'A':
            __int16 v34 = NSString;
            int v35 = MFLookupLocalizedString(@"HOST_UNREACHABLE", @"The server “%@” cannot be contacted on port %d.", @"Delayed");
            uint64_t v36 = objc_msgSend(v34, "stringWithFormat:", v35, v52, v7);
            break;
          default:
            v50 = NSString;
            if (v26)
            {
              int v35 = MFLookupLocalizedString(@"MF_SSL_CONNECTION_FAILURE", @"Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.", @"Delayed");
              objc_msgSend(v50, "stringWithFormat:", v35, v52, v7);
            }
            else
            {
              int v35 = MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed");
              objc_msgSend(v50, "stringWithFormat:", v35, v52);
            uint64_t v36 = };
            break;
        }
        __int16 v38 = (void *)v36;
        goto LABEL_37;
      }
      __int16 v40 = [v29 domain];
      int v41 = [(id)*MEMORY[0x1E4F288C8] isEqualToString:v40];

      if (!v41)
      {
        __int16 v38 = 0;
        goto LABEL_38;
      }
      _setupSSLDomainError(v29, v52);
      __int16 v38 = [v29 localizedDescription];
      if (!v38 || [&stru_1EFF11268 isEqualToString:v38])
      {
        uint64_t v42 = NSString;
        int v35 = MFLookupLocalizedString(@"MF_SSL_CONNECTION_FAILURE", @"Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.", @"Delayed");
        uint64_t v43 = objc_msgSend(v42, "stringWithFormat:", v35, v52, v7);

        __int16 v38 = (void *)v43;
LABEL_37:
      }
    }
    else
    {
      __int16 v30 = v52;
      uint64_t v37 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
      [v27 setError:v37];
      __int16 v38 = 0;
      int v39 = 0;
      uint64_t v29 = (void *)v37;
      if (!v37)
      {
LABEL_43:

        [(MFNWConnectionWrapper *)self->_socket close];
        v47 = self->_socket;
        self->_socket = 0;

        id v5 = v57;
        goto LABEL_44;
      }
    }
LABEL_38:
    if (objc_msgSend(v29, "mf_isUserCancelledError"))
    {
      int v39 = v29;
    }
    else
    {
      if (!v38)
      {
        v45 = NSString;
        v46 = MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed");
        __int16 v38 = objc_msgSend(v45, "stringWithFormat:", v46, v30);
      }
      [v29 setLocalizedDescription:v38];
      int v39 = v29;
    }
    goto LABEL_43;
  }
  _logEvent(self, 0, 0, 0, 0x7FFFFFFFFFFFFFFFuLL, 0);
LABEL_44:

  return v13;
}

void __37__MFConnection_connectUsingSettings___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MFUserAgent();
  if (a2) {
    BOOL v3 = {;
  }
    [v3 networkActivityStarted:WeakRetained];
  }
  else {
    BOOL v3 = {;
  }
    [v3 networkActivityEnded:WeakRetained];
  }
}

uint64_t __37__MFConnection_connectUsingSettings___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained _evaluateTrust:a2 errorPtr:a3];

  return v6;
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60D58] currentDevice];
  int v6 = [v5 isInternal];

  if (v6)
  {
    uint64_t v7 = [v4 defaultConnectionSettings];
    unint64_t v8 = [v7 hostname];
    accountLogString = self->_accountLogString;
    self->_accountLogString = v8;
  }
  else
  {
    uint64_t v10 = [v4 identifier];
    uint64_t v7 = self->_accountLogString;
    self->_accountLogString = v10;
  }

  id v11 = [v4 defaultConnectionSettings];
  BOOL v12 = [(MFConnection *)self connectUsingSettings:v11];

  return v12;
}

+ (BOOL)shouldTryFallbacksAfterError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F18F50]];

  if (!v5)
  {
    uint64_t v7 = [v3 domain];
    int v8 = [v7 isEqual:*MEMORY[0x1E4F288C8]];

    if (v8)
    {
      BOOL v6 = [v3 code] != -9829;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v6 = 1;
    goto LABEL_8;
  }
  if ([v3 code] != 2 && objc_msgSend(v3, "code") != 1) {
    goto LABEL_7;
  }
  BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)connectUsingFallbacksForAccount:(id)a3
{
  id v4 = a3;
  int v5 = [v4 defaultConnectionSettings];
  if ([(MFConnection *)self connectUsingAccount:v4])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = +[MFActivityMonitor currentMonitor];
    int v8 = [v7 error];
    if (v8 && ![(id)objc_opt_class() shouldTryFallbacksAfterError:v8])
    {
      BOOL v6 = 0;
    }
    else
    {

      uint64_t v9 = [v4 alternateConnectionSettings];
      unint64_t v10 = [v9 count];
      if (v10)
      {
        id v11 = 0;
        unint64_t v12 = 1;
        do
        {
          if (v11 && ![(id)objc_opt_class() shouldTryFallbacksAfterError:v11])
          {
            int v8 = v11;
            goto LABEL_18;
          }
          BOOL v13 = [v9 objectAtIndex:v12 - 1];
          [v4 applySettingsAsDefault:v13];

          BOOL v14 = [(MFConnection *)self connectUsingAccount:v4];
          int v8 = [v7 error];

          char v15 = v12++ >= v10 || v14;
          id v11 = v8;
        }
        while ((v15 & 1) == 0);
        if (!v14) {
          goto LABEL_18;
        }
        BOOL v6 = 1;
      }
      else
      {
        int v8 = 0;
LABEL_18:
        [v4 applySettingsAsDefault:v5];
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (void)test_setSocket:(id)a3
{
  int v5 = (MFNWConnectionWrapper *)a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"Connection.m", 636, @"%s can only be called from unit tests", "-[MFConnection test_setSocket:]");
  }
  socket = self->_socket;
  self->_socket = v5;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  id v4 = a3;
  int v5 = [v4 preferredAuthScheme];
  BOOL v6 = [v5 authenticatorForAccount:v4 connection:self];

  if (!v6)
  {
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(MFConnection *)self authenticationMechanisms];
  int v8 = [v6 saslName];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    int v9 = [(MFConnection *)self authenticateUsingAccount:v4 authenticator:v6];
    if (v9)
    {
      unint64_t v10 = [v6 securityLayer];
      securityLayer = self->_securityLayer;
      self->_securityLayer = v10;
LABEL_8:

      goto LABEL_9;
    }
    unint64_t v12 = +[MFActivityMonitor currentMonitor];
    BOOL v13 = [v12 error];

    if (!v13)
    {
      BOOL v14 = NSString;
      char v15 = MFLookupLocalizedString(@"AUTH_NOT_SUPPORTED_FORMAT", @"The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again.", @"Delayed");
      uint64_t v16 = [(id)objc_opt_class() accountTypeString];
      id v17 = [v4 hostname];
      v18 = [v4 preferredAuthScheme];
      v19 = [v18 humanReadableName];
      securityLayer = objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, v19);

      uint64_t v20 = +[MFActivityMonitor currentMonitor];
      id v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:securityLayer];
      [v20 setError:v21];

      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_9:

  return v9;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSArray)authenticationMechanisms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MFConnection *)self capabilities];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v7, "rangeOfString:options:range:", @"AUTH=", 9, 0, objc_msgSend(v7, "length", (void)v14));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v8;
          if (!v3)
          {
            id v3 = [MEMORY[0x1E4F1CA48] array];
          }
          id v11 = [v7 substringFromIndex:v9 + v10];
          unint64_t v12 = [v11 uppercaseString];
          [v3 addObject:v12];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return (NSArray *)v3;
}

- (BOOL)loginDisabled
{
  return 0;
}

- (BOOL)usesOpportunisticSockets
{
  return [(MFNWConnectionWrapper *)self->_socket usesOpportunisticSockets];
}

- (BOOL)writeBytes:(const char *)a3 length:(unint64_t)a4 dontLogBytesInRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  unint64_t v10 = [(ECSASLSecurityLayer *)self->_securityLayer encryptionBufferSize];
  if (self->_compressionEnabled)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F73540]);
    deflater = self->_deflater;
    deflater->avail_in = a4;
    deflater->next_in = (Bytef *)a3;
    BOOL v13 = self->_deflater;
    do
    {
      v13->next_out = (Bytef *)self->_zbuffer;
      uInt v14 = NSPageSize();
      long long v15 = self->_deflater;
      v15->avail_out = v14;
      if (deflate(v15, 2) == -2) {
        __assert_rtn("-[MFConnection writeBytes:length:dontLogBytesInRange:]", "Connection.m", 707, "Z_STREAM_ERROR != err");
      }
      [v11 appendBytes:self->_zbuffer length:NSPageSize() - self->_deflater->avail_out];
      BOOL v13 = self->_deflater;
    }
    while (!v13->avail_out);
    unint64_t v16 = [v11 length];
    id v17 = v11;
    v18 = (const char *)[v17 bytes];
  }
  else
  {
    id v17 = 0;
    v18 = a3;
    unint64_t v16 = a4;
  }
  unint64_t v59 = a4;
  if (v10)
  {
    id v19 = objc_allocWithZone(MEMORY[0x1E4F73540]);
    v18 = 0;
    if (v10 >= v16) {
      unint64_t v20 = v16;
    }
    else {
      unint64_t v20 = v10;
    }
    id v60 = (id)[v19 initWithCapacity:v20 + 4];
    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
    id v60 = 0;
    unint64_t v20 = v16;
    if (!v16)
    {
LABEL_32:
      if (v60) {
        _logEvent(self, 4, (uint64_t)a3, v59, location, length);
      }
      else {
        _logEvent(self, 3, (uint64_t)a3, v59, location, length);
      }
      BOOL v52 = 1;
      goto LABEL_58;
    }
  }
  v58 = &a3[v16];
  id v56 = (void *)*MEMORY[0x1E4F28798];
  v54 = (void *)*MEMORY[0x1E4F288C8];
  NSUInteger v55 = location;
  id v57 = a3;
  while (1)
  {
    uint64_t v21 = v16;
    if (!v60) {
      break;
    }
    if (v20 >= v16) {
      unint64_t v22 = v16;
    }
    else {
      unint64_t v22 = v20;
    }
    id v23 = [(ECSASLSecurityLayer *)self->_securityLayer createEncryptedDataForBytes:&v58[-v16] length:v22];
    [v60 setLength:0];
    if (v23)
    {
      unsigned int v61 = -1431655766;
      unsigned int v61 = bswap32([v23 length]) >> 16;
      [v60 appendBytes:&v61 length:4];
      [v60 appendData:v23];
    }
    id v24 = v60;
    v18 = (const char *)[v24 bytes];
    uint64_t v21 = [v24 length];

    if (!v23) {
      goto LABEL_55;
    }
    if (v21) {
      break;
    }
LABEL_28:
    BOOL v29 = v16 > v20;
    if (v16 >= v20) {
      v16 -= v20;
    }
    else {
      unint64_t v16 = 0;
    }
    a3 = v57;
    if (!v29) {
      goto LABEL_32;
    }
  }
  NSUInteger v25 = length;
  BOOL v26 = v18;
  while (1)
  {
    int64_t v27 = [(MFNWConnectionWrapper *)self->_socket writeBytes:v26 length:v21];
    if (v27 < 0) {
      break;
    }
    self->_lastUsedTime = CFAbsoluteTimeGetCurrent();
    if (!v27) {
      break;
    }
    __int16 v28 = +[MFActivityMonitor currentMonitor];
    [v28 recordBytesWritten:v27];
    v26 += v27;
    v21 -= v27;

    if (!v21)
    {
      NSUInteger length = v25;
      NSUInteger location = v55;
      goto LABEL_28;
    }
  }
  __int16 v30 = +[MFActivityMonitor currentMonitor];
  socket = self->_socket;
  id v32 = v30;
  uint64_t v33 = socket;
  __int16 v34 = [(MFNWConnectionWrapper *)v33 error];
  if (v34)
  {
    int v35 = [(MFNWConnectionWrapper *)v33 error];
    uint64_t v36 = [v35 domain];
    uint64_t v37 = [(MFNWConnectionWrapper *)v33 error];
    __int16 v38 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", v36, [v37 code], 0);
  }
  else
  {
    __int16 v38 = 0;
  }

  int v39 = [(MFNWConnectionWrapper *)v33 remoteHostname];
  if (!v38)
  {
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
    v44 = 0;
    __int16 v38 = v45 = 0;
    if (!v38) {
      goto LABEL_54;
    }
    goto LABEL_49;
  }
  __int16 v40 = [v38 domain];
  int v41 = [v56 isEqualToString:v40];

  if (v41)
  {
    if ([v38 code] == 60)
    {
      uint64_t v42 = NSString;
      uint64_t v43 = MFLookupLocalizedString(@"CONNECTION_TIMED_OUT", @"The connection to the server “%@” on port %d timed out.", @"Delayed");
      v44 = objc_msgSend(v42, "stringWithFormat:", v43, v39, -[MFNWConnectionWrapper remotePortNumber](v33, "remotePortNumber"));
LABEL_47:

      goto LABEL_49;
    }
    goto LABEL_48;
  }
  v46 = [v38 domain];
  int v47 = [v54 isEqualToString:v46];

  if (!v47)
  {
LABEL_48:
    v44 = 0;
    goto LABEL_49;
  }
  _setupSSLDomainError(v38, v39);
  v44 = [v38 localizedDescription];
  if (!v44 || [&stru_1EFF11268 isEqualToString:v44])
  {
    v48 = NSString;
    uint64_t v43 = MFLookupLocalizedString(@"SSL_GENERIC_WRITE_ERROR", @"An SSL error occurred while trying to provide data to the server “%@”. Verify that this server supports SSL and that your account settings are correct.", @"Delayed");
    uint64_t v49 = objc_msgSend(v48, "stringWithFormat:", v43, v39);

    v44 = (void *)v49;
    goto LABEL_47;
  }
LABEL_49:
  if (objc_msgSend(v38, "mf_isUserCancelledError"))
  {
    v45 = v38;
  }
  else
  {
    if (!v44)
    {
      v50 = NSString;
      v51 = MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed");
      v44 = objc_msgSend(v50, "stringWithFormat:", v51, v39);
    }
    [v38 setLocalizedDescription:v44];
    v45 = v38;
  }
LABEL_54:
  [v32 setError:v45];

  [(MFNWConnectionWrapper *)self->_socket close];
LABEL_55:
  BOOL v52 = 0;
LABEL_58:

  return v52;
}

- (BOOL)writeData:(id)a3 dontLogBytesInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  LOBYTE(length) = -[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", [v7 bytes], objc_msgSend(v7, "length"), location, length);

  return length;
}

- (BOOL)writeData:(id)a3
{
  return -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setDesiredReadBufferLength:(unint64_t)a3
{
  self->_desiredBufferLength = a3;
}

- (void)startActivity
{
}

- (void)stopActivity
{
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
}

- (void)logReadChars:(const char *)a3 length:(unint64_t)a4
{
  if (a4) {
    self->_readBytesNotLogged -= a4;
  }
}

- (BOOL)readLineIntoData:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  int v6 = 1;
  do
  {
    if (!self->_bufferRemainingBytes) {
      int v6 = _fillBuffer(self);
    }
    if ((v6 & 1) == 0) {
      break;
    }
    unint64_t bufferRemainingBytes = self->_bufferRemainingBytes;
    if (bufferRemainingBytes)
    {
      buffer = self->_buffer;
      unint64_t bufferStart = self->_bufferStart;
      if (v5 && buffer[bufferStart] == 10)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 1;
      }
      else if (bufferRemainingBytes < 2)
      {
LABEL_13:
        uint64_t v11 = 0;
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v10 = 0;
        while (*(_WORD *)&buffer[bufferStart + v10] != 2573)
        {
          if (bufferRemainingBytes - 1 == ++v10) {
            goto LABEL_13;
          }
        }
        uint64_t v11 = 2;
      }
      BOOL v12 = v10 != 0x7FFFFFFFFFFFFFFFLL;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v13 = buffer[bufferRemainingBytes - 1 + bufferStart] == 13;
      }
      else
      {
        BOOL v13 = 0;
        unint64_t bufferRemainingBytes = v10 + v11;
      }
      [v4 appendBytes:&buffer[bufferStart] length:bufferRemainingBytes];
      unint64_t v14 = self->_bufferStart + bufferRemainingBytes;
      self->_bufferRemainingBytes -= bufferRemainingBytes;
      self->_unint64_t bufferStart = v14;
      BOOL v5 = v13;
      if (v12) {
        break;
      }
    }
  }
  while (((v6 ^ 1) & 1) == 0);

  return v6 & 1;
}

- (BOOL)readBytesIntoData:(id)a3 desiredLength:(unint64_t)a4
{
  id v6 = a3;
  while (a4)
  {
    int64_t bufferRemainingBytes = self->_bufferRemainingBytes;
    if (!bufferRemainingBytes)
    {
      if (!_fillBuffer(self))
      {
        BOOL v10 = 0;
        goto LABEL_12;
      }
      int64_t bufferRemainingBytes = self->_bufferRemainingBytes;
    }
    if (bufferRemainingBytes >= 1)
    {
      if (bufferRemainingBytes >= a4) {
        unint64_t v8 = a4;
      }
      else {
        unint64_t v8 = bufferRemainingBytes;
      }
      [v6 appendBytes:&self->_buffer[self->_bufferStart] length:v8];
      unint64_t v9 = self->_bufferStart + v8;
      self->_bufferRemainingBytes -= v8;
      self->_unint64_t bufferStart = v9;
      a4 -= v8;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  BOOL v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  unint64_t v8 = NSStringFromSelector(a2);
  unint64_t v9 = [v5 stringWithFormat:@"Internal error: -[%@ %@] needs to be implemented in a concrete subclass.", v7, v8];

  BOOL v10 = +[MFActivityMonitor currentMonitor];
  uint64_t v11 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:v9];
  [v10 setError:v11];

  return 0;
}

- (BOOL)startTLSForAccount:(id)a3
{
  id v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  unint64_t v8 = [v4 stringWithFormat:@"Internal error: -[%@ %@] needs to be implemented in a concrete subclass.", v6, v7];

  unint64_t v9 = +[MFActivityMonitor currentMonitor];
  BOOL v10 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:v8];
  [v9 setError:v10];

  return 0;
}

- (BOOL)enableSSL
{
  [(MFConnection *)self _clearBuffer];
  socket = self->_socket;
  uint64_t v4 = *MEMORY[0x1E4F1D4B8];
  return [(MFNWConnectionWrapper *)socket setSecurityProtocol:v4];
}

- (void)_clearBuffer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_int64_t bufferRemainingBytes = &self->_bufferRemainingBytes;
  if (self->_bufferRemainingBytes >= 1)
  {
    id v3 = MFLogNetwork();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v4 = *p_bufferRemainingBytes;
      int v5 = 134217984;
      int64_t v6 = v4;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Making sure buffer is empty, currently has %lu bytes", (uint8_t *)&v5, 0xCu);
    }

    *p_int64_t bufferRemainingBytes = 0;
    p_bufferRemainingBytes[1] = 0;
  }
}

- (NSString)securityProtocol
{
  socket = self->_socket;
  if (socket)
  {
    id v3 = [(MFNWConnectionWrapper *)socket securityProtocol];
  }
  else
  {
    id v3 = (id)*MEMORY[0x1E4F1D4C0];
  }
  return (NSString *)v3;
}

- (BOOL)startCompression
{
  id v3 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v3) {
    -[MFConnection startCompression]();
  }
  int64_t v4 = v3;
  v3->zalloc = 0;
  v3->zfree = 0;
  v3->opaque = 0;
  int v5 = deflateInit2_(v3, -1, 8, -15, 8, 0, "1.2.12", 112);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(MFConnection *)v6 startCompression];
    }
LABEL_9:

    free(v4);
    [(MFConnection *)self endCompression];
    return 0;
  }
  self->_deflater = v4;
  unint64_t v8 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v8) {
    -[MFConnection startCompression]();
  }
  int64_t v4 = v8;
  v8->avail_in = 0;
  v8->next_in = 0;
  v8->zfree = 0;
  v8->opaque = 0;
  v8->zalloc = 0;
  int v9 = inflateInit2_(v8, -15, "1.2.12", 112);
  if (v9)
  {
    int v10 = v9;
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(MFConnection *)v10 startCompression];
    }
    goto LABEL_9;
  }
  self->_inflater = v4;
  size_t v12 = NSPageSize();
  self->_zbuffer = (char *)malloc_type_malloc(v12, 0x9F9DBAF3uLL);
  BOOL result = 1;
  self->_compressionEnabled = 1;
  return result;
}

- (void)endCompression
{
  self->_compressionEnabled = 0;
  deflater = self->_deflater;
  if (deflater)
  {
    deflateEnd(deflater);
    free(self->_deflater);
    self->_deflater = 0;
  }
  inflater = self->_inflater;
  if (inflater)
  {
    inflateEnd(inflater);
    free(self->_inflater);
    self->_inflater = 0;
  }
  zbuffer = self->_zbuffer;
  if (zbuffer)
  {
    free(zbuffer);
    self->_zbuffer = 0;
  }
}

- (BOOL)isValid
{
  socket = self->_socket;
  if (socket) {
    LOBYTE(socket) = [(MFNWConnectionWrapper *)socket isValid];
  }
  return (char)socket;
}

- (void)disconnect
{
  [(MFNWConnectionWrapper *)self->_socket close];
  socket = self->_socket;
  self->_socket = 0;

  [(MFConnection *)self endCompression];
}

- (BOOL)hasBytesAvailable
{
  return self->_bufferRemainingBytes > 0 || [(MFNWConnectionWrapper *)self->_socket isReadable];
}

- (double)lastUsedTime
{
  return self->_lastUsedTime;
}

- (id)connectionSettings
{
  return self->_connectionSettings;
}

- (void)setConnectionSettings:(id)a3
{
}

- (BOOL)_certificateIsTrustedForAccount:(id)a3
{
  id v3 = [a3 valueInAccountPropertiesForKey:@"MFServerSSLCertificateIsTrusted"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v6 setValueInAccountProperties:v5 forKey:@"MFServerSSLCertificateIsTrusted"];

  [v6 savePersistentAccount];
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  int v47 = __Block_byref_object_dispose__0;
  id v48 = 0;
  uint64_t v7 = [(MFNWConnectionWrapper *)self->_socket service];
  unint64_t v8 = objc_opt_class();

  int v9 = [(MFNWConnectionWrapper *)self->_socket accountIdentifier];
  int v10 = [v8 existingAccountForUniqueID:v9];

  BOOL v11 = [(MFConnection *)self _certificateIsTrustedForAccount:v10];
  size_t v12 = [MEMORY[0x1E4F58108] defaultTrustManager];
  BOOL v13 = [(MFNWConnectionWrapper *)self->_socket remoteHostname];
  unint64_t v14 = [(MFNWConnectionWrapper *)self->_socket service];
  int v15 = [v12 rawTrustResultForSSLTrust:a3 hostname:v13 service:v14];

  unint64_t v16 = MFLogNetwork();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 1024;
    int v56 = v15;
    __int16 v57 = 2112;
    v58 = v10;
    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Got SecTrustResultType %u for %@", buf, 0x26u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v56) = 0;
  switch(v15)
  {
    case 1:
      LOBYTE(v56) = 1;
      break;
    case 5:
      if ([(MFNWConnectionWrapper *)self->_socket allowsTrustPrompt])
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F58100]);
        unint64_t v20 = [(MFNWConnectionWrapper *)self->_socket remoteHostname];
        [v19 setHost:v20];

        uint64_t v21 = [(MFNWConnectionWrapper *)self->_socket service];
        [v19 setService:v21];

        [v19 setTrust:a3];
        if (v11)
        {
          uint64_t v22 = *MEMORY[0x1E4F58128];
          v49[0] = *MEMORY[0x1E4F58130];
          v49[1] = v22;
          v50[0] = MEMORY[0x1E4F1CC28];
          v50[1] = MEMORY[0x1E4F1CC28];
          id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
        }
        else
        {
          id v23 = 0;
        }
        BOOL v29 = +[MFConnection certUIPromptScheduler];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __40__MFConnection__evaluateTrust_errorPtr___block_invoke;
        v35[3] = &unk_1E5D3B3A8;
        id v36 = v10;
        uint64_t v37 = self;
        __int16 v40 = &v43;
        int v41 = buf;
        id v30 = v19;
        id v38 = v30;
        id v31 = v23;
        id v39 = v31;
        uint64_t v42 = a3;
        [v29 performSyncBlock:v35];

        if (a4)
        {
          id v32 = (void *)v44[5];
          if (v32) {
            *a4 = v32;
          }
        }
      }
      break;
    case 4:
      if (v11)
      {
        v18 = buf;
      }
      else
      {
        [(MFConnection *)self _setCertificateIsTrusted:1 forAccount:v10];
        v18 = *(unsigned char **)&buf[8];
      }
      v18[24] = 1;
      break;
    default:
      uint64_t v24 = +[MFError errorWithDomain:*MEMORY[0x1E4F288C8] code:-9825 localizedDescription:0];
      NSUInteger v25 = (void *)v44[5];
      v44[5] = v24;

      BOOL v26 = MFLogNetwork();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        socket = self->_socket;
        uint64_t v28 = v44[5];
        *(_DWORD *)v51 = 134218242;
        BOOL v52 = socket;
        __int16 v53 = 2112;
        uint64_t v54 = v28;
        _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "trust manager said DENY for connection %p (error: %@)", v51, 0x16u);
      }

      break;
  }
  BOOL v33 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v43, 8);
  return v33;
}

void __40__MFConnection__evaluateTrust_errorPtr___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) allowsTrustPrompt])
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__MFConnection__evaluateTrust_errorPtr___block_invoke_96;
    v13[3] = &unk_1E5D3B380;
    uint64_t v17 = *(void *)(a1 + 72);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 40);
    id v14 = v5;
    uint64_t v15 = v7;
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v18 = v6;
    uint64_t v19 = v8;
    dispatch_semaphore_t v16 = v2;
    int v9 = v2;
    [v3 showPromptWithOptions:v4 responseBlock:v13];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    int v10 = MFLogNetwork();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 24);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Supressing trust prompt as user denied earlier for connection %p (error: %@).", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

intptr_t __40__MFConnection__evaluateTrust_errorPtr___block_invoke_96(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 2:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v9 = a1 + 40;
      [*(id *)(a1 + 40) _setCertificateIsTrusted:1 forAccount:*(void *)(a1 + 32)];
      int v10 = [MEMORY[0x1E4F58108] defaultTrustManager];
      uint64_t v11 = *(void *)(a1 + 72);
      uint64_t v12 = [*(id *)(*(void *)v9 + 24) remoteHostname];
      BOOL v13 = [*(id *)(*(void *)(a1 + 40) + 24) service];
      [v10 allowTrust:v11 forHost:v12 service:v13];

      break;
    case 1:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      break;
    case 0:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      [*(id *)(a1 + 32) setAllowsTrustPrompt:0];
      uint64_t v3 = +[MFError errorWithDomain:*MEMORY[0x1E4F288C8] code:-9825 localizedDescription:0];
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      uint64_t v6 = MFLogNetwork();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 24);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        int v15 = 134218242;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "user said DENY for connection %p (error: %@). Supressing trust prompt till maild restarts", (uint8_t *)&v15, 0x16u);
      }

      break;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(MFConnection *)self mf_lock];
  [v3 appendString:@"\n==== Connection State ====\n"];
  uint64_t v4 = [(MFNWConnectionWrapper *)self->_socket remoteHostname];
  [v3 appendFormat:@"    Host: %@\n", v4];

  objc_msgSend(v3, "appendFormat:", @"    Port Number: %u\n", -[MFNWConnectionWrapper remotePortNumber](self->_socket, "remotePortNumber"));
  id v5 = [(MFNWConnectionWrapper *)self->_socket securityProtocol];
  [v3 appendFormat:@"    SSL Version: %@\n", v5];

  [v3 appendFormat:@"    Socket: %@\n", self->_socket];
  uint64_t v6 = [MEMORY[0x1E4F29060] currentThread];
  objc_msgSend(v3, "appendFormat:", @"    Thread: %p\n", v6);

  [(MFConnection *)self mf_unlock];
  return v3;
}

- (NSString)accountLogString
{
  return self->_accountLogString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountLogString, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_connectionSettings, 0);
  objc_storeStrong((id *)&self->_securityLayer, 0);
}

- (void)startCompression
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "deflateInit2 failed with error %d", (uint8_t *)v2, 8u);
}

@end