@interface MFConnection
+ (BOOL)logAllSocketActivity;
+ (BOOL)shouldTryFallbacksAfterError:(id)a3;
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
- (BOOL)authenticateUsingAccount:(id)a3;
- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4;
- (BOOL)connectUsingAccount:(id)a3;
- (BOOL)connectUsingFallbacksForAccount:(id)a3;
- (BOOL)connectUsingSettings:(id)a3;
- (BOOL)hasBytesAvailable;
- (BOOL)isCellularConnection;
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
- (NSString)description;
- (NSString)securityProtocol;
- (double)lastUsedTime;
- (id)connectionSettings;
- (id)copyDiagnosticInformation;
- (void)_setupSocketWithSettings:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)enableThroughputMonitoring:(BOOL)a3;
- (void)endCompression;
- (void)logReadChars:(const char *)a3 length:(unint64_t)a4;
- (void)setAllowsFallbacks:(BOOL)a3;
- (void)setConnectionSettings:(id)a3;
- (void)setDesiredReadBufferLength:(unint64_t)a3;
- (void)setIsFetching:(BOOL)a3;
- (void)startCompression;
@end

@implementation MFConnection

+ (void)readLoggingDefaults
{
  [(id)_LogLock lock];

  _LogClasses = 0;
  _LoggedPorts = 0;

  _LoggedHosts = 0;
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LogActivityOnAllPorts", v3, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat
    || (CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F77E20],
        CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F77E20], v4, v5),
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LogActivityOnAllPorts", v7, &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat))
  {
    _LogAllConnectionActivity = AppIntegerValue != 0;
    if (AppIntegerValue) {
      goto LABEL_13;
    }
  }
  else if (_LogAllConnectionActivity)
  {
    goto LABEL_13;
  }
  v8 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  v9 = (void *)[v8 stringArrayForKey:@"LogActivityOnPort"];
  v10 = (void *)[v8 stringArrayForKey:@"LogActivityOnHost"];
  if (v9
    || (v9 = objc_msgSend((id)objc_msgSend(v8, "stringForKey:", @"LogActivityOnPort"), "componentsSeparatedByString:", @",")) != 0)
  {
    if ([v9 count]) {
      _LoggedPorts = v9;
    }
  }
  if (v10
    || (v10 = objc_msgSend((id)objc_msgSend(v8, "stringForKey:", @"LogActivityOnHost"), "componentsSeparatedByString:", @",")) != 0)
  {
    if ([v10 count]) {
      _LoggedHosts = v10;
    }
  }
LABEL_13:
  if (_LogAllConnectionActivity || [(id)_LoggedPorts count] || objc_msgSend((id)_LoggedHosts, "count")) {
    _LogClasses = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a1, 0);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"MFReloadNetworkLoggingNotification", a1);
  [(id)_LogLock unlock];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!_LogLock)
    {
      _MFLockGlobalLock();
      if (!_LogLock) {
        _LogLock = [objc_alloc(MEMORY[0x1E4F73580]) initWithName:@"logLock" andDelegate:0];
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

uint64_t __26__MFConnection_initialize__block_invoke()
{
  v0 = MEMORY[0x1E4F14428];
  notify_register_dispatch((const char *)*MEMORY[0x1E4F77E50], (int *)&initialize_token, MEMORY[0x1E4F14428], &__block_literal_global_23);
  v1 = (const char *)*MEMORY[0x1E4F77E38];
  return notify_register_dispatch(v1, (int *)&initialize_token, v0, &__block_literal_global_25);
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a5 bytes];
  unint64_t v9 = [a5 length];
  unint64_t v10 = v9;
  if (v9 >= 0x400) {
    uint64_t v11 = 1024;
  }
  else {
    uint64_t v11 = v9;
  }
  if ((unint64_t)(a4 - 1) > 3) {
    v12 = "CONNECTED";
  }
  else {
    v12 = off_1E68665D8[a4 - 1];
  }
  v21 = v12;
  v13 = (void *)*((void *)a3 + 2);
  uint64_t v14 = [*((id *)a3 + 3) securityProtocol];
  if (v14)
  {
    v20 = (__CFString *)[NSString stringWithFormat:@":%@", v14];
    if (a4) {
      goto LABEL_13;
    }
  }
  else
  {
    v20 = &stru_1F265CF90;
    if (a4) {
      goto LABEL_13;
    }
  }
  v15 = MFLogNetwork();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136447490;
    v23 = v21;
    __int16 v24 = 2114;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2048;
    id v27 = a3;
    __int16 v28 = 2112;
    uint64_t v29 = [v13 hostname];
    __int16 v30 = 1024;
    int v31 = [v13 portNumber];
    __int16 v32 = 2114;
    v33 = v20;
    _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@]", buf, 0x3Au);
  }
LABEL_13:
  while (v11)
  {
    v16 = MFLogNetwork();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = [v13 hostname];
      int v19 = [v13 portNumber];
      *(_DWORD *)buf = 136448002;
      v23 = v21;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      __int16 v26 = 2048;
      id v27 = a3;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 1024;
      int v31 = v19;
      __int16 v32 = 2114;
      v33 = v20;
      __int16 v34 = 1040;
      int v35 = v11;
      __int16 v36 = 2096;
      uint64_t v37 = v8;
      _os_log_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@] %{mobilemail:networkData}.*P", buf, 0x4Au);
    }
    v8 += v11;
    v10 -= v11;
    if (v10 >= 0x400) {
      uint64_t v11 = 1024;
    }
    else {
      uint64_t v11 = v10;
    }
  }
}

+ (id)logClasses
{
  [(id)_LogLock lock];
  id v2 = (id)_LogClasses;
  [(id)_LogLock unlock];
  return v2;
}

+ (void)setLogClasses:(id)a3
{
  [(id)_LogLock lock];

  _LogClasses = (uint64_t)a3;
  CFStringRef v4 = (void *)_LogLock;
  [v4 unlock];
}

+ (BOOL)logAllSocketActivity
{
  return _LogAllConnectionActivity;
}

+ (void)setLogAllSocketActivity:(BOOL)a3
{
  _LogAllConnectionActivity = a3;
}

+ (id)logActivityOnPorts
{
  return (id)_LoggedPorts;
}

+ (void)setLogActivityOnPorts:(id)a3
{
  id v4 = a3;

  _LoggedPorts = (uint64_t)a3;
}

+ (id)logActivityOnHosts
{
  return (id)_LoggedHosts;
}

+ (void)setLogActivityOnHosts:(id)a3
{
  id v4 = a3;

  _LoggedHosts = (uint64_t)a3;
}

- (MFConnection)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFConnection;
  id v2 = [(MFConnection *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F734D0], "sharedController"), "addDiagnosticsGenerator:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F734D0], "sharedController"), "removeDiagnosticsGenerator:", self);
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  socket = self->_socket;
  if (socket)
  {
    [(_MFSocket *)socket abort];
  }
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

  v8.receiver = self;
  v8.super_class = (Class)MFConnection;
  [(MFConnection *)&v8 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)MFConnection;
  return (NSString *)[NSString stringWithFormat:@"%@ _socket: %p\n", -[MFConnection description](&v3, sel_description), self->_socket];
}

- (BOOL)isCellularConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MFSocket *)self->_socket isCellularConnection];
  objc_super v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    objc_super v8 = self;
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "#Network %d for %@", (uint8_t *)v6, 0x12u);
  }
  return v3;
}

- (BOOL)isFetching
{
  return *((unsigned char *)self + 108) & 1;
}

- (void)setIsFetching:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 108);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 108) = v3 & 0xFE | a3;
    -[MFConnection enableThroughputMonitoring:](self, "enableThroughputMonitoring:");
  }
}

- (void)_setupSocketWithSettings:(id)a3
{
  socket = self->_socket;
  if (!socket) {
    -[MFConnection _setupSocketWithSettings:]();
  }
  -[_MFSocket setConnectionServiceType:](socket, "setConnectionServiceType:", [a3 connectionServiceType]);
  -[_MFSocket setAllowsTrustPrompt:](self->_socket, "setAllowsTrustPrompt:", [a3 allowsTrustPrompt]);
  -[_MFSocket setUsesOpportunisticSockets:](self->_socket, "setUsesOpportunisticSockets:", [a3 usesOpportunisticSockets]);
  -[_MFSocket setSourceApplicationBundleIdentifier:](self->_socket, "setSourceApplicationBundleIdentifier:", [a3 sourceApplicationBundleIdentifier]);
  -[_MFSocket setAccountIdentifier:](self->_socket, "setAccountIdentifier:", [a3 accountIdentifier]);
  -[_MFSocket setNetworkAccountIdentifier:](self->_socket, "setNetworkAccountIdentifier:", [a3 networkAccountIdentifier]);
  if ([a3 clientCertificates]) {
    -[_MFSocket setClientCertificates:](self->_socket, "setClientCertificates:", [a3 clientCertificates]);
  }
  if ([a3 tryDirectSSL])
  {
    v6 = self->_socket;
    uint64_t v7 = *MEMORY[0x1E4F1D4B8];
    [(_MFSocket *)v6 setSecurityProtocol:v7];
  }
}

- (BOOL)connectUsingSettings:(id)a3
{
  CFStringRef v5 = (MFConnectionSettings *)a3;
  self->_connectionSettings = v5;
  uint64_t v6 = [(MFConnectionSettings *)v5 portNumber];
  if (!self->_socket) {
    self->_socket = objc_alloc_init(_MFSocket);
  }
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", 0);
  [(MFConnection *)self _setupSocketWithSettings:self->_connectionSettings];
  if (!v6)
  {
    objc_super v8 = getservbyname([(NSString *)[(MFConnectionSettings *)self->_connectionSettings serviceName] UTF8String], "tcp");
    if (!v8 || !LOWORD(v8->s_port))
    {
      id v9 = +[MFActivityMonitor currentMonitor];
      [v9 setError:+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1031, objc_msgSend(NSString, "stringWithFormat:", MFLookupLocalizedString(@"DONT_KNOW_SERVICE_PORT", @"Can’t determine port to use for the TCP/IP service “%@”.", @"Delayed", -[MFConnectionSettings serviceName](self->_connectionSettings, "serviceName")))];
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = __rev16(LOWORD(v8->s_port));
  }
  if (-[_MFSocket connectToHost:withPort:service:](self->_socket, "connectToHost:withPort:service:", -[MFConnectionSettings hostname](self->_connectionSettings, "hostname"), v6, [a3 certUIService]))
  {
LABEL_5:
    _logEvent((uint64_t)self, 0, 0, 0, 0x7FFFFFFFFFFFFFFFuLL, 0);
    return 1;
  }
LABEL_10:
  unint64_t v10 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = (void *)[v10 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      if ([v11 code] == -9850)
      {
        v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFCFE000, v13, OS_LOG_TYPE_INFO, "Detected server with low-grade DH cipher. Re-trying with DH disabled.", buf, 2u);
        }
        [(_MFSocket *)self->_socket abort];

        self->_socket = objc_alloc_init(_MFSocket);
        [(MFConnection *)self _setupSocketWithSettings:self->_connectionSettings];
        [(_MFSocket *)self->_socket setDisableEphemeralDiffieHellmanCiphers:1];
        objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", 0);
        if ([(_MFSocket *)self->_socket connectToHost:[(MFConnectionSettings *)self->_connectionSettings hostname] withPort:v6 service:[(MFConnectionSettings *)self->_connectionSettings certUIService]])
        {
          goto LABEL_5;
        }
      }
    }
  }
  id v14 = +[MFActivityMonitor currentMonitor];
  v15 = [(MFConnectionSettings *)self->_connectionSettings hostname];
  BOOL v16 = [(MFConnectionSettings *)self->_connectionSettings tryDirectSSL];
  uint64_t v17 = (MFError *)[v14 error];
  if (!v17)
  {
    uint64_t v18 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
    [v14 setError:v18];
    if (!v18) {
      goto LABEL_45;
    }
    goto LABEL_28;
  }
  uint64_t v18 = v17;
  if (objc_msgSend((id)*MEMORY[0x1E4F28798], "isEqualToString:", -[MFError domain](v17, "domain")))
  {
    uint64_t v19 = [(MFError *)v18 code];
    switch(v19)
    {
      case 'A':
        v20 = NSString;
        v21 = @"HOST_UNREACHABLE";
        v22 = @"The server “%@” cannot be contacted on port %d.";
        goto LABEL_31;
      case '=':
        id v27 = NSString;
        if (!v16)
        {
          __int16 v28 = @"CONNECTION_REFUSED";
          uint64_t v29 = @"The server “%@” refused to allow a connection on port %d.";
LABEL_37:
          uint64_t v30 = MFLookupLocalizedString((uint64_t)v28, (uint64_t)v29, @"Delayed");
          uint64_t v31 = v6;
LABEL_39:
          uint64_t v26 = objc_msgSend(v27, "stringWithFormat:", v30, v15, v31);
          goto LABEL_40;
        }
        break;
      case '<':
        v20 = NSString;
        v21 = @"CONNECTION_TIMED_OUT";
        v22 = @"The connection to the server “%@” on port %d timed out.";
LABEL_31:
        uint64_t v25 = MFLookupLocalizedString((uint64_t)v21, (uint64_t)v22, @"Delayed");
        goto LABEL_32;
      default:
        id v27 = NSString;
        if (!v16)
        {
          uint64_t v30 = MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed");
          goto LABEL_39;
        }
        break;
    }
    __int16 v28 = @"MF_SSL_CONNECTION_FAILURE";
    uint64_t v29 = @"Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.";
    goto LABEL_37;
  }
  if (!objc_msgSend((id)*MEMORY[0x1E4F288C8], "isEqualToString:", -[MFError domain](v18, "domain")))
  {
LABEL_28:
    if ([(NSError *)v18 mf_isUserCancelledError]) {
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  _setupSSLDomainError(v18, (uint64_t)v15, [(_MFSocket *)self->_socket serverCertificates]);
  uint64_t v23 = [(MFError *)v18 localizedDescription];
  if (!v23 || (uint64_t v24 = v23, [&stru_1F265CF90 isEqualToString:v23]))
  {
    v20 = NSString;
    uint64_t v25 = MFLookupLocalizedString(@"MF_SSL_CONNECTION_FAILURE", @"Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.", @"Delayed");
LABEL_32:
    uint64_t v26 = objc_msgSend(v20, "stringWithFormat:", v25, v15, v6);
LABEL_40:
    uint64_t v24 = v26;
  }
  if (![(NSError *)v18 mf_isUserCancelledError])
  {
    if (v24)
    {
LABEL_44:
      [(MFError *)v18 setLocalizedDescription:v24];
      goto LABEL_45;
    }
LABEL_43:
    uint64_t v24 = [NSString stringWithFormat:MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed", v15];
    goto LABEL_44;
  }
LABEL_45:
  [(_MFSocket *)self->_socket abort];

  BOOL result = 0;
  self->_socket = 0;
  return result;
}

- (BOOL)connectUsingAccount:(id)a3
{
  uint64_t v4 = [a3 defaultConnectionSettings];
  return [(MFConnection *)self connectUsingSettings:v4];
}

+ (BOOL)shouldTryFallbacksAfterError:(id)a3
{
  uint64_t v4 = (void *)[a3 domain];
  if ([v4 isEqual:*MEMORY[0x1E4F18F50]])
  {
    if ([a3 code] == 2 || objc_msgSend(a3, "code") == 1) {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = (void *)[a3 domain];
    if ([v6 isEqual:*MEMORY[0x1E4F288C8]]) {
      return [a3 code] != -9829;
    }
  }
  return 1;
}

- (BOOL)connectUsingFallbacksForAccount:(id)a3
{
  uint64_t v5 = [a3 defaultConnectionSettings];
  if ([(MFConnection *)self connectUsingAccount:a3])
  {
LABEL_2:
    LOBYTE(v6) = 1;
  }
  else
  {
    id v7 = +[MFActivityMonitor currentMonitor];
    uint64_t v8 = [v7 error];
    if (!v8 || (int v6 = [(id)objc_opt_class() shouldTryFallbacksAfterError:v8]) != 0)
    {
      id v9 = (void *)[a3 alternateConnectionSettings];
      uint64_t v10 = [v9 count];
      if (v10)
      {
        unint64_t v11 = v10;
        uint64_t v12 = 0;
        unint64_t v13 = 1;
        while (!v12 || [(id)objc_opt_class() shouldTryFallbacksAfterError:v12])
        {
          objc_msgSend(a3, "applySettingsAsDefault:", objc_msgSend(v9, "objectAtIndex:", v13 - 1));
          BOOL v14 = [(MFConnection *)self connectUsingAccount:a3];
          uint64_t v15 = [v7 error];
          if (!v14)
          {
            uint64_t v12 = v15;
            if (v13++ < v11) {
              continue;
            }
          }
          if (v14) {
            goto LABEL_2;
          }
          break;
        }
      }
      [a3 applySettingsAsDefault:v5];
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)setAllowsFallbacks:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 108) = *((unsigned char *)self + 108) & 0xFD | v3;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  uint64_t v5 = (void *)[a3 preferredAuthScheme];
  int v6 = (void *)[v5 authenticatorForAccount:a3 connection:self];

  self->_securityLayer = 0;
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [(MFConnection *)self authenticationMechanisms];
  if (!v7 || -[NSArray indexOfObject:](v7, "indexOfObject:", [v6 saslName]) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = MFLookupLocalizedString(@"AUTH_NOT_SUPPORTED_FORMAT", @"The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again.", @"Delayed");
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1034, objc_msgSend(v8, "stringWithFormat:", v9, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname"), objc_msgSend(v5, "humanReadableName"))));
LABEL_5:
    LOBYTE(v10) = 0;
    return v10;
  }
  BOOL v10 = [(MFConnection *)self authenticateUsingAccount:a3 authenticator:v6];
  if (v10)
  {
    if (!self->_securityLayer) {
      self->_securityLayer = (MFSASLSecurityLayer *)(id)[v6 securityLayer];
    }
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSArray)authenticationMechanisms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFConnection *)self capabilities];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      uint64_t v9 = objc_msgSend(v8, "rangeOfString:options:range:", @"AUTH=", 9, 0, objc_msgSend(v8, "length"));
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = v9;
        uint64_t v12 = v10;
        if (!v5) {
          uint64_t v5 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
        }
        -[NSArray addObject:](v5, "addObject:", objc_msgSend((id)objc_msgSend(v8, "substringFromIndex:", v11 + v12), "uppercaseString"));
      }
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)loginDisabled
{
  return 0;
}

- (BOOL)usesOpportunisticSockets
{
  return [(_MFSocket *)self->_socket usesOpportunisticSockets];
}

- (BOOL)writeBytes:(const char *)a3 length:(unint64_t)a4 dontLogBytesInRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = [(MFSASLSecurityLayer *)self->_securityLayer encryptionBufferSize];
  unint64_t v11 = v10;
  unint64_t v42 = a4;
  unint64_t v43 = location;
  if ((*((unsigned char *)self + 108) & 4) != 0)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F73540]);
    deflater = self->_deflater;
    deflater->avail_in = a4;
    deflater->next_in = (Bytef *)a3;
    long long v16 = self->_deflater;
    do
    {
      v16->next_out = (Bytef *)self->_zbuffer;
      uInt v17 = NSPageSize();
      uint64_t v18 = self->_deflater;
      v18->avail_out = v17;
      if (deflate(v18, 2) == -2) {
        -[MFConnection writeBytes:length:dontLogBytesInRange:]();
      }
      [v12 appendBytes:self->_zbuffer length:NSPageSize() - self->_deflater->avail_out];
      long long v16 = self->_deflater;
    }
    while (!v16->avail_out);
    a4 = [v12 length];
    unint64_t v13 = (const char *)[v12 bytes];
    if (v11)
    {
LABEL_3:
      if (v11 >= a4) {
        unint64_t v14 = a4;
      }
      else {
        unint64_t v14 = v11;
      }
      v44 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73540]) initWithCapacity:v14 + 4];
      unint64_t v13 = 0;
      if (!a4) {
        goto LABEL_31;
      }
LABEL_13:
      uint64_t v19 = &a3[a4];
      v40 = (void *)*MEMORY[0x1E4F28798];
      v39 = (void *)*MEMORY[0x1E4F288C8];
      v41 = a3;
      while (1)
      {
        unint64_t v20 = a4;
        if (!v44) {
          break;
        }
        if (v14 >= a4) {
          unint64_t v21 = a4;
        }
        else {
          unint64_t v21 = v14;
        }
        v22 = (void *)[(MFSASLSecurityLayer *)self->_securityLayer createEncryptedDataForBytes:&v19[-a4] length:v21];
        [v44 setLength:0];
        if (v22)
        {
          unsigned int v45 = 0;
          unsigned int v45 = bswap32([v22 length]) >> 16;
          [v44 appendBytes:&v45 length:4];
          [v44 appendData:v22];
        }
        unint64_t v13 = (const char *)[v44 bytes];
        uint64_t v23 = [v44 length];
        if (!v22)
        {
          char v30 = 0;
          uint64_t v29 = v44;
          goto LABEL_51;
        }
        unint64_t v20 = v23;
        if (v23) {
          break;
        }
LABEL_27:
        BOOL v28 = a4 > v14;
        if (a4 >= v14) {
          a4 -= v14;
        }
        else {
          a4 = 0;
        }
        a3 = v41;
        if (!v28) {
          goto LABEL_31;
        }
      }
      uint64_t v24 = v19;
      NSUInteger v25 = length;
      uint64_t v26 = v13;
      while (1)
      {
        int64_t v27 = [(_MFSocket *)self->_socket writeBytes:v26 length:v20];
        if (v27 < 0) {
          break;
        }
        self->_lastUsedTime = CFAbsoluteTimeGetCurrent();
        if (!v27) {
          break;
        }
        objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "recordBytesWritten:", v27);
        v26 += v27;
        v20 -= v27;
        if (!v20)
        {
          NSUInteger length = v25;
          uint64_t v19 = v24;
          goto LABEL_27;
        }
      }
      id v31 = +[MFActivityMonitor currentMonitor];
      socket = self->_socket;
      v33 = (MFError *)[v31 error];
      uint64_t v34 = [(_MFSocket *)socket remoteHostname];
      if (!v33)
      {
        v33 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
        [v31 setError:v33];
        if (!v33 || [(NSError *)v33 mf_isUserCancelledError])
        {
LABEL_50:
          [(_MFSocket *)self->_socket abort];
          char v30 = 0;
          BOOL v37 = 0;
          uint64_t v29 = v44;
          if (!v44) {
            goto LABEL_52;
          }
          goto LABEL_51;
        }
LABEL_48:
        uint64_t v36 = [NSString stringWithFormat:MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed", v34];
LABEL_49:
        [(MFError *)v33 setLocalizedDescription:v36];
        goto LABEL_50;
      }
      if (objc_msgSend(v40, "isEqualToString:", -[MFError domain](v33, "domain")))
      {
        if ([(MFError *)v33 code] == 60)
        {
          uint64_t v35 = [NSString stringWithFormat:MFLookupLocalizedString(@"CONNECTION_TIMED_OUT", @"The connection to the server “%@” on port %d timed out.", @"Delayed", v34, -[_MFSocket remotePortNumber](socket, "remotePortNumber")];
LABEL_44:
          uint64_t v36 = v35;
          goto LABEL_46;
        }
      }
      else if (objc_msgSend(v39, "isEqualToString:", -[MFError domain](v33, "domain")))
      {
        _setupSSLDomainError(v33, v34, [(_MFSocket *)self->_socket serverCertificates]);
        uint64_t v36 = [(MFError *)v33 localizedDescription];
        if (!v36 || [&stru_1F265CF90 isEqualToString:v36])
        {
          uint64_t v35 = [NSString stringWithFormat:MFLookupLocalizedString(@"SSL_GENERIC_WRITE_ERROR", @"An SSL error occurred while trying to provide data to the server “%@”. Verify that this server supports SSL and that your account settings are correct.", @"Delayed", v34];
          goto LABEL_44;
        }
LABEL_46:
        if ([(NSError *)v33 mf_isUserCancelledError]) {
          goto LABEL_50;
        }
        if (v36) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      uint64_t v36 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    id v12 = 0;
    unint64_t v13 = a3;
    if (v10) {
      goto LABEL_3;
    }
  }
  v44 = 0;
  unint64_t v14 = a4;
  if (a4) {
    goto LABEL_13;
  }
LABEL_31:
  uint64_t v29 = v44;
  if (!v44)
  {
    _logEvent((uint64_t)self, 3, (uint64_t)a3, v42, v43, length);
    BOOL v37 = 1;
    if (!v12) {
      return v37;
    }
    goto LABEL_53;
  }
  _logEvent((uint64_t)self, 4, (uint64_t)a3, v42, v43, length);
  char v30 = 1;
LABEL_51:

  BOOL v37 = v30;
LABEL_52:
  if (v12) {
LABEL_53:
  }

  return v37;
}

- (BOOL)writeData:(id)a3 dontLogBytesInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = [a3 bytes];
  uint64_t v9 = [a3 length];
  return -[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", v8, v9, location, length);
}

- (BOOL)writeData:(id)a3
{
  return -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setDesiredReadBufferLength:(unint64_t)a3
{
  self->_desiredBufferLength = a3;
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
}

- (void)logReadChars:(const char *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    int v4 = a4;

    self->_readBytesNotLogged -= v4;
  }
}

- (BOOL)readLineIntoData:(id)a3
{
  BOOL v5 = 0;
  while (1)
  {
    if (!self->_bufferRemainingBytes)
    {
      int v6 = _fillBuffer((uint64_t)self);
      if (!v6) {
        return v6;
      }
    }
    buffer = self->_buffer;
    unint64_t bufferStart = self->_bufferStart;
    if (v5 && buffer[bufferStart] == 10)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 1;
    }
    else
    {
      unint64_t bufferRemainingBytes = self->_bufferRemainingBytes;
      if (bufferRemainingBytes < 2)
      {
LABEL_11:
        uint64_t v10 = 0;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v9 = 0;
        unint64_t v12 = bufferRemainingBytes - 1;
        while (*(_WORD *)&buffer[bufferStart + v9] != 2573)
        {
          if (v12 == ++v9) {
            goto LABEL_11;
          }
        }
        uint64_t v10 = 2;
      }
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v13 = self->_bufferRemainingBytes;
      BOOL v5 = buffer[bufferStart - 1 + v13] == 13;
    }
    else
    {
      BOOL v5 = 0;
      int64_t v13 = v9 + v10;
    }
    [a3 appendBytes:&buffer[bufferStart] length:v13];
    unint64_t v14 = self->_bufferStart + v13;
    self->_bufferRemainingBytes -= v13;
    self->_unint64_t bufferStart = v14;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
}

- (BOOL)readBytesIntoData:(id)a3 desiredLength:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      int64_t bufferRemainingBytes = self->_bufferRemainingBytes;
      if (!bufferRemainingBytes)
      {
        int v8 = _fillBuffer((uint64_t)self);
        if (!v8) {
          return v8;
        }
        int64_t bufferRemainingBytes = self->_bufferRemainingBytes;
      }
      if (bufferRemainingBytes >= 1)
      {
        if (bufferRemainingBytes >= v4) {
          unint64_t v9 = v4;
        }
        else {
          unint64_t v9 = bufferRemainingBytes;
        }
        [a3 appendBytes:&self->_buffer[self->_bufferStart] length:v9];
        unint64_t v10 = self->_bufferStart + v9;
        self->_bufferRemainingBytes -= v9;
        self->_unint64_t bufferStart = v10;
        v4 -= v9;
      }
    }
    while (v4);
    LOBYTE(v8) = 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  BOOL v5 = NSString;
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1029, objc_msgSend(v5, "stringWithFormat:", @"Internal error: -[%@ %@] needs to be implemented in a concrete subclass.", v7, NSStringFromSelector(a2))));
  return 0;
}

- (BOOL)startTLSForAccount:(id)a3
{
  unint64_t v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1029, objc_msgSend(v4, "stringWithFormat:", @"Internal error: -[%@ %@] needs to be implemented in a concrete subclass.", v6, NSStringFromSelector(a2))));
  return 0;
}

- (NSString)securityProtocol
{
  socket = self->_socket;
  if (socket) {
    return (NSString *)[(_MFSocket *)socket securityProtocol];
  }
  else {
    return (NSString *)*MEMORY[0x1E4F1D4C0];
  }
}

- (BOOL)startCompression
{
  uint64_t v3 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v3) {
    -[MFConnection startCompression]();
  }
  unint64_t v4 = v3;
  v3->zalloc = 0;
  v3->zfree = 0;
  v3->opaque = 0;
  int v5 = deflateInit2_(v3, -1, 8, -15, 8, 0, "1.2.12", 112);
  if (v5)
  {
    int v6 = v5;
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(MFConnection *)v6 startCompression];
    }
LABEL_9:
    free(v4);
    [(MFConnection *)self endCompression];
    return 0;
  }
  self->_deflater = v4;
  int v8 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v8) {
    -[MFConnection startCompression]();
  }
  unint64_t v4 = v8;
  v8->avail_in = 0;
  v8->next_in = 0;
  v8->zfree = 0;
  v8->opaque = 0;
  v8->zalloc = 0;
  int v9 = inflateInit2_(v8, -15, "1.2.12", 112);
  if (v9)
  {
    int v10 = v9;
    unint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MFConnection *)v10 startCompression];
    }
    goto LABEL_9;
  }
  self->_inflater = v4;
  size_t v13 = NSPageSize();
  self->_zbuffer = (char *)malloc_type_malloc(v13, 0xB9AC0803uLL);
  *((unsigned char *)self + 108) |= 4u;
  return 1;
}

- (void)endCompression
{
  *((unsigned char *)self + 108) &= ~4u;
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
    LOBYTE(socket) = [(_MFSocket *)socket isValid];
  }
  return (char)socket;
}

- (void)disconnect
{
  [(_MFSocket *)self->_socket abort];

  self->_socket = 0;
  [(MFConnection *)self endCompression];
}

- (BOOL)hasBytesAvailable
{
  return self->_bufferRemainingBytes > 0 || [(_MFSocket *)self->_socket isReadable];
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
  id v5 = a3;

  self->_connectionSettings = (MFConnectionSettings *)a3;
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(MFConnection *)self mf_lock];
  [v3 appendString:@"\n==== Connection State ====\n"];
  [v3 appendFormat:@"    Host: %@\n", -[_MFSocket remoteHostname](self->_socket, "remoteHostname")];
  objc_msgSend(v3, "appendFormat:", @"    Port Number: %u\n", -[_MFSocket remotePortNumber](self->_socket, "remotePortNumber"));
  [v3 appendFormat:@"    SSL Version: %@\n", -[_MFSocket securityProtocol](self->_socket, "securityProtocol")];
  objc_msgSend(v3, "appendFormat:", @"    Socket: %p\n", self->_socket);
  objc_msgSend(v3, "appendFormat:", @"    Thread: %p\n", objc_msgSend(MEMORY[0x1E4F29060], "currentThread"));
  [(MFConnection *)self mf_unlock];
  return v3;
}

- (void)_setupSocketWithSettings:.cold.1()
{
}

- (void)writeBytes:length:dontLogBytesInRange:.cold.1()
{
  __assert_rtn("-[MFConnection writeBytes:length:dontLogBytesInRange:]", "Connection.m", 700, "Z_STREAM_ERROR != err");
}

- (void)startCompression
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "deflateInit2 failed with error %d", (uint8_t *)v2, 8u);
}

@end