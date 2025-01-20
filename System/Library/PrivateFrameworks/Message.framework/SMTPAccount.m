@interface SMTPAccount
+ (BOOL)isCommonPortNumber:(unsigned int)a3;
+ (OS_os_log)log;
+ (id)accountTypeString;
+ (id)saslProfileName;
+ (unsigned)defaultPortNumber;
+ (void)legacyKeychainProtocol;
- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3;
- (BOOL)canBeFallbackAccount;
- (BOOL)supportsOutboxCopy;
- (BOOL)supportsPipelining;
- (Class)connectionClass;
- (Class)deliveryClass;
- (__CFString)connectionServiceType;
- (id)_defaultSettingsWithPort:(unsigned int)a3 useSSL:(BOOL)a4 directSSL:(BOOL)a5;
- (id)alternateConnectionSettings;
- (id)authenticatedConnection:(BOOL)a3;
- (id)certUIService;
- (id)connectionSettingsForAuthentication:(BOOL)a3 secure:(id)a4 insecure:(id)a5;
- (id)customAuthenticationErrorStringForError:(id)a3 authScheme:(id)a4;
- (id)errorForResponse:(id)a3;
- (id)insecureConnectionSettings;
- (id)preferredAuthScheme;
- (id)secureConnectionSettings;
- (id)serviceName;
- (void)checkInConnection:(id)a3;
- (void)connectionExpired:(id)a3;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)releaseAllConnections;
- (void)releaseAllForcedConnections;
- (void)setDeliveryClass:(Class)a3;
- (void)setPreferredAuthScheme:(id)a3;
- (void)setSupportsOutboxCopy:(BOOL)a3;
- (void)setSupportsPipelining:(BOOL)a3;
- (void)setTimer;
@end

@implementation SMTPAccount

- (void)releaseAllConnections
{
  [(SMTPAccount *)self mf_lock];
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v4 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  [(SMTPAccount *)self mf_unlock];
  [(MFSMTPConnection *)v4 quit];
  v6.receiver = self;
  v6.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v6 releaseAllConnections];
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  [(SMTPAccount *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__SMTPAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_37 != -1) {
    dispatch_once(&log_onceToken_37, block);
  }
  v2 = (void *)log_log_37;
  return (OS_os_log *)v2;
}

void __18__SMTPAccount_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_37;
  log_log_37 = (uint64_t)v1;
}

+ (id)accountTypeString
{
  return @"SMTP";
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E4F3B810];
}

- (id)certUIService
{
  return (id)*MEMORY[0x1E4F58120];
}

- (Class)deliveryClass
{
  Class deliveryClass = self->_deliveryClass;
  if (deliveryClass)
  {
    id v3 = deliveryClass;
  }
  else
  {
    objc_opt_class();
    id v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setDeliveryClass:(Class)a3
{
  self->_Class deliveryClass = a3;
}

+ (unsigned)defaultPortNumber
{
  return 587;
}

- (id)serviceName
{
  return @"smtp";
}

+ (id)saslProfileName
{
  return @"smtp";
}

+ (BOOL)isCommonPortNumber:(unsigned int)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SMTPAccount;
  unsigned __int8 v4 = objc_msgSendSuper2(&v7, sel_isCommonPortNumber_);
  if (a3 == 587) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }
  return a3 == 465 || v5;
}

- (Class)connectionClass
{
  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  v2 = [(MFAccount *)&v4 connectionClass];
  if (!v2) {
    v2 = (objc_class *)objc_opt_class();
  }
  return v2;
}

- (id)_defaultSettingsWithPort:(unsigned int)a3 useSSL:(BOOL)a4 directSSL:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v8 = [(MFAccount *)self defaultConnectionSettings];
  [v8 setPortNumber:v7];
  [v8 setUsesSSL:v6];
  [v8 setTryDirectSSL:v5];
  return v8;
}

- (id)connectionSettingsForAuthentication:(BOOL)a3 secure:(id)a4 insecure:(id)a5
{
  BOOL v6 = a3;
  id v28 = a4;
  id v27 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v26 = v6;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [(MFAccount *)self defaultConnectionSettings];
  uint64_t v12 = [v11 portNumber];
  if ([v11 usesSSL])
  {
    v13 = [(SMTPAccount *)self _defaultSettingsWithPort:v12 useSSL:0 directSSL:0];
    [v8 addObject:v13];

    -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v12, 1, [v11 tryDirectSSL] ^ 1);
  }
  else
  {
    v15 = [(SMTPAccount *)self _defaultSettingsWithPort:v12 useSSL:1 directSSL:1];
    [v9 addObject:v15];

    [(SMTPAccount *)self _defaultSettingsWithPort:v12 useSSL:1 directSSL:0];
  v14 = };
  [v9 addObject:v14];

  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v17 = dword_1A8AC6740[i];
    if (v12 != v17)
    {
      v18 = [(SMTPAccount *)self _defaultSettingsWithPort:dword_1A8AC6740[i] useSSL:1 directSSL:1];
      [v9 addObject:v18];

      v19 = [(SMTPAccount *)self _defaultSettingsWithPort:v17 useSSL:1 directSSL:0];
      [v9 addObject:v19];

      v20 = [(SMTPAccount *)self _defaultSettingsWithPort:v17 useSSL:0 directSSL:0];
      [v8 addObject:v20];
    }
  }
  if (v26)
  {
    v22 = v27;
    v21 = v28;
    [v10 addObjectsFromArray:v9];
    id v23 = v8;
  }
  else
  {
    v22 = v27;
    v21 = v28;
    char v24 = [v11 usesSSL];
    id v23 = v9;
    if ((v24 & 1) == 0)
    {
      [v10 addObjectsFromArray:v8];
      id v23 = v9;
    }
  }
  [v10 addObjectsFromArray:v23];
  if (v21) {
    [v21 addObjectsFromArray:v9];
  }
  if (v22) {
    [v22 addObjectsFromArray:v8];
  }

  return v10;
}

- (id)secureConnectionSettings
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(MFAccount *)self defaultConnectionSettings];
  if ([v4 usesSSL]) {
    [v3 addObject:v4];
  }
  id v5 = [(SMTPAccount *)self connectionSettingsForAuthentication:1 secure:v3 insecure:0];

  return v3;
}

- (id)insecureConnectionSettings
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(MFAccount *)self defaultConnectionSettings];
  if (([v4 usesSSL] & 1) == 0) {
    [v3 addObject:v4];
  }
  id v5 = [(SMTPAccount *)self connectionSettingsForAuthentication:1 secure:0 insecure:v3];

  return v3;
}

- (id)alternateConnectionSettings
{
  return [(SMTPAccount *)self connectionSettingsForAuthentication:0 secure:0 insecure:0];
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  char v3 = a3 == 465;
  objc_super v4 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLIsDirect"];
  id v5 = v4;
  if (v4) {
    char v3 = [v4 BOOLValue];
  }

  return v3;
}

- (id)preferredAuthScheme
{
  if ([(DeliveryAccount *)self shouldUseAuthentication])
  {
    v5.receiver = self;
    v5.super_class = (Class)SMTPAccount;
    char v3 = [(MFAccount *)&v5 preferredAuthScheme];
    if (!v3)
    {
      char v3 = [MEMORY[0x1E4F607C8] schemeWithName:*MEMORY[0x1E4F607A8]];
    }
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (void)setPreferredAuthScheme:(id)a3
{
  id v4 = a3;
  [(DeliveryAccount *)self setShouldUseAuthentication:v4 != 0];
  v5.receiver = self;
  v5.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v5 setPreferredAuthScheme:v4];
}

- (id)customAuthenticationErrorStringForError:(id)a3 authScheme:(id)a4
{
  id v4 = objc_msgSend(a3, "mf_shortDescription");
  if (![v4 length])
  {
    uint64_t v5 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");

    id v4 = (void *)v5;
  }
  return v4;
}

- (id)errorForResponse:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 status];
  unint64_t v5 = v4 - 530;
  if ((unint64_t)(v4 - 530) > 8 || ((1 << (v4 - 18)) & 0x111) == 0) {
    MFLookupLocalizedString(@"FAILED_SEND", @"Check the account settings for the outgoing server “%@”.", @"Delayed");
  }
  else {
  uint64_t v7 = MFLookupLocalizedString(@"FAILED_SEND_SSL_NEEDED", @"Check the SSL setting for the outgoing server “%@”.", @"Delayed");
  }
  id v8 = v7;
  id v9 = v7;
  if (v5 > 8) {
    id v9 = v7;
  }

  id v10 = NSString;
  v11 = [(DeliveryAccount *)self displayHostname];
  uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v8, v11);

  uint64_t v17 = @"UserFriendlyErrorDescription";
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v14 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
  v15 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v12 title:v14 userInfo:v13];

  return v15;
}

- (BOOL)supportsPipelining
{
  return *((unsigned char *)self + 120) & 1;
}

- (void)setSupportsPipelining:(BOOL)a3
{
  *((unsigned char *)self + 120) = *((unsigned char *)self + 120) & 0xFE | a3;
}

- (BOOL)supportsOutboxCopy
{
  return (*((unsigned __int8 *)self + 120) >> 1) & 1;
}

- (void)setSupportsOutboxCopy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 120) = *((unsigned char *)self + 120) & 0xFD | v3;
}

- (__CFString)connectionServiceType
{
  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  result = [(MFAccount *)&v4 connectionServiceType];
  if ((*((unsigned char *)self + 120) & 4) != 0) {
    return (__CFString *)*MEMORY[0x1E4F23D58];
  }
  return result;
}

- (id)authenticatedConnection:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SMTPAccount *)self mf_lock];
  if (a3)
  {
    unint64_t v5 = 0;
    char v6 = 4;
  }
  else
  {
    unint64_t v5 = self->_connection;
    char v6 = 0;
  }
  connection = self->_connection;
  self->_connection = 0;

  *((unsigned char *)self + 120) = *((unsigned char *)self + 120) & 0xFB | v6;
  [(SMTPAccount *)self mf_unlock];
  if (v5)
  {
    time_t v8 = time(0);
    if (v8 <= [(MFSMTPConnection *)v5 timeLastCommandWasSent] + 30
      || [(MFSMTPConnection *)v5 noop] == 2)
    {
      id v9 = v5;
      goto LABEL_15;
    }
  }
  id v9 = [(MFAccount *)self _newConnection];
  if (v9)
  {
    if ([(MFAccount *)self _connectAndAuthenticate:v9])
    {
      uint64_t v10 = [(MFSMTPConnection *)v9 maximumMessageBytes];
      if (v10) {
        [(DeliveryAccount *)self setMaximumMessageBytes:v10];
      }
      [(SMTPAccount *)self setSupportsPipelining:[(MFSMTPConnection *)v9 supportsPipelining]];
      [(SMTPAccount *)self setSupportsOutboxCopy:[(MFSMTPConnection *)v9 supportsOutboxCopy]];
    }
    else
    {

      id v9 = 0;
    }
  }
LABEL_15:
  v11 = +[SMTPAccount log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(MFSMTPConnection *)self->_connection domainName];
    int v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "_connection domain name: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  return v9;
}

- (void)disconnect:(id)a3
{
}

- (void)connectionExpired:(id)a3
{
  timer = self->_timer;
  self->_timer = 0;

  [(SMTPAccount *)self mf_lock];
  id v9 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  uint64_t v6 = [(SMTPAccount *)self mf_unlock];
  if (v9)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_disconnect_, self);
    time_t v8 = +[MFInvocationQueue sharedInvocationQueue];
    [v8 addInvocation:v7];
  }
  MEMORY[0x1F4181878](v6);
}

- (void)setTimer
{
  [(SMTPAccount *)self mf_lock];
  [(NSTimer *)self->_timer invalidate];
  char v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_connectionExpired_ selector:0 userInfo:0 repeats:60.0];
  timer = self->_timer;
  self->_timer = v3;

  [(SMTPAccount *)self mf_unlock];
}

- (void)checkInConnection:(id)a3
{
  id v10 = a3;
  unint64_t v5 = MFUserAgent();
  int v6 = [v5 isMobileMail];

  if (v6)
  {
    [(SMTPAccount *)self mf_lock];
    connection = self->_connection;
    if (!connection) {
      objc_storeStrong((id *)&self->_connection, a3);
    }
    [(SMTPAccount *)self mf_unlock];
    time_t v8 = time(0);
    if (!connection)
    {
      int64_t v9 = v8;
      if (v8 > self->_lastTimerSetTime + 10)
      {
        [(SMTPAccount *)self performSelectorOnMainThread:sel_setTimer withObject:0 waitUntilDone:0];
        self->_lastTimerSetTime = v9;
      }
    }
  }
  else
  {
    [v10 quit];
  }
}

- (void)releaseAllForcedConnections
{
  v2.receiver = self;
  v2.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v2 releaseAllForcedConnections];
}

- (BOOL)canBeFallbackAccount
{
  return 1;
}

@end