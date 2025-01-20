@interface SMTPAccount
+ (BOOL)isCommonPortNumber:(unsigned int)a3;
+ (id)accountTypeString;
+ (id)newDefaultInstance;
+ (id)saslProfileName;
+ (unsigned)defaultPortNumber;
+ (void)legacyKeychainProtocol;
+ (void)registerAppleServiceDeliveryHostname:(id)a3;
- (BOOL)_isAppleServiceDeliveryHostname:(id)a3;
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
  _MFLockGlobalLock();
  [(NSTimer *)self->_timer invalidate];
  self->_timer = 0;
  connection = self->_connection;
  self->_connection = 0;
  _MFUnlockGlobalLock();
  [(MFSMTPConnection *)connection quit];

  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v4 releaseAllConnections];
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

+ (id)newDefaultInstance
{
  return 0;
}

+ (void)registerAppleServiceDeliveryHostname:(id)a3
{
  pthread_mutex_lock(&__asdHostnamesLock);
  id v4 = (id)__asdHostnames;
  if (!__asdHostnames)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    __asdHostnames = (uint64_t)v4;
  }
  [v4 addObject:a3];
  pthread_mutex_unlock(&__asdHostnamesLock);
}

- (Class)deliveryClass
{
  Class result = self->_deliveryClass;
  if (!result) {
    return (Class)objc_opt_class();
  }
  return result;
}

- (void)setDeliveryClass:(Class)a3
{
  self->_deliveryClass = a3;
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
  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  Class result = [(MFAccount *)&v3 connectionClass];
  if (!result) {
    return (Class)objc_opt_class();
  }
  return result;
}

- (id)_defaultSettingsWithPort:(unsigned int)a3 useSSL:(BOOL)a4 directSSL:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  id v8 = [(MFAccount *)self defaultConnectionSettings];
  [v8 setPortNumber:v7];
  [v8 setUsesSSL:v6];
  [v8 setTryDirectSSL:v5];
  return v8;
}

- (id)connectionSettingsForAuthentication:(BOOL)a3 secure:(id)a4 insecure:(id)a5
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [(MFAccount *)self defaultConnectionSettings];
  uint64_t v11 = [v10 portNumber];
  if ([v10 usesSSL])
  {
    objc_msgSend(v7, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 0, 0));
    uint64_t v12 = [v10 tryDirectSSL] ^ 1;
  }
  else
  {
    objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 1, 1));
    uint64_t v12 = 0;
  }
  objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 1, v12));
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v14 = dword_1CFD6F798[i];
    if (v11 != v14)
    {
      objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", dword_1CFD6F798[i], 1, 1));
      objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v14, 1, 0));
      objc_msgSend(v7, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v14, 0, 0));
    }
  }
  id v15 = v8;
  id v16 = v7;
  if (a3 || (v17 = objc_msgSend(v10, "usesSSL", v8), id v15 = v7, v16 = v8, (v17 & 1) == 0)) {
    [v9 addObjectsFromArray:v15];
  }
  [v9 addObjectsFromArray:v16];
  if (a4) {
    [a4 addObjectsFromArray:v8];
  }
  if (a5) {
    [a5 addObjectsFromArray:v7];
  }

  return v9;
}

- (id)secureConnectionSettings
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(MFAccount *)self defaultConnectionSettings];
  if ([v4 usesSSL]) {
    [v3 addObject:v4];
  }
  [(SMTPAccount *)self connectionSettingsForAuthentication:1 secure:v3 insecure:0];
  return v3;
}

- (id)insecureConnectionSettings
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(MFAccount *)self defaultConnectionSettings];
  if (([v4 usesSSL] & 1) == 0) {
    [v3 addObject:v4];
  }
  [(SMTPAccount *)self connectionSettingsForAuthentication:1 secure:0 insecure:v3];
  return v3;
}

- (id)alternateConnectionSettings
{
  return [(SMTPAccount *)self connectionSettingsForAuthentication:0 secure:0 insecure:0];
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  id v4 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLIsDirect"];
  if (v4)
  {
    LOBYTE(v5) = [v4 BOOLValue];
  }
  else
  {
    return a3 == 465;
  }
  return v5;
}

- (id)preferredAuthScheme
{
  if (![(DeliveryAccount *)self shouldUseAuthentication]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  id result = [(MFAccount *)&v4 preferredAuthScheme];
  if (!result) {
    return +[MFAuthScheme schemeWithName:&stru_1F265CF90];
  }
  return result;
}

- (void)setPreferredAuthScheme:(id)a3
{
  [(DeliveryAccount *)self setShouldUseAuthentication:a3 != 0];
  v5.receiver = self;
  v5.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v5 setPreferredAuthScheme:a3];
}

- (id)customAuthenticationErrorStringForError:(id)a3 authScheme:(id)a4
{
  objc_super v4 = objc_msgSend(a3, "mf_shortDescription");
  if ([v4 length]) {
    return v4;
  }
  return (id)MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
}

- (id)errorForResponse:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v4 = [a3 status];
  if ((v4 - 530) > 8 || ((1 << (v4 - 18)) & 0x111) == 0)
  {
    BOOL v6 = @"FAILED_SEND";
    id v7 = @"Check the account settings for the outgoing server “%@”.";
  }
  else
  {
    BOOL v6 = @"FAILED_SEND_SSL_NEEDED";
    id v7 = @"Check the SSL setting for the outgoing server “%@”.";
  }
  id v9 = @"UserFriendlyErrorDescription";
  v10[0] = objc_msgSend(NSString, "stringWithFormat:", MFLookupLocalizedString((uint64_t)v6, (uint64_t)v7, @"Delayed"), -[DeliveryAccount displayHostname](self, "displayHostname"));
  return +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1032, v10[0], MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed"), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1]);
}

- (BOOL)supportsPipelining
{
  return *((unsigned char *)self + 72) & 1;
}

- (void)setSupportsPipelining:(BOOL)a3
{
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFE | a3;
}

- (BOOL)supportsOutboxCopy
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (void)setSupportsOutboxCopy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFD | v3;
}

- (__CFString)connectionServiceType
{
  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  id result = [(MFAccount *)&v4 connectionServiceType];
  if ((*((unsigned char *)self + 72) & 4) != 0) {
    return (__CFString *)*MEMORY[0x1E4F23D58];
  }
  return result;
}

- (id)authenticatedConnection:(BOOL)a3
{
  _MFLockGlobalLock();
  if (a3)
  {
    connection = 0;
    char v6 = 4;
  }
  else
  {
    char v6 = 0;
    connection = self->_connection;
  }
  self->_connection = 0;
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFB | v6;
  _MFUnlockGlobalLock();
  if (connection)
  {
    time_t v7 = time(0);
    if (v7 <= [(MFSMTPConnection *)connection timeLastCommandWasSent] + 30
      || [(MFSMTPConnection *)connection noop] == 2)
    {
      goto LABEL_14;
    }
  }
  connection = [(MFAccount *)self _newConnection];
  if (connection)
  {
    if ([(MFAccount *)self _connectAndAuthenticate:connection])
    {
      uint64_t v8 = [(MFSMTPConnection *)connection maximumMessageBytes];
      if (v8) {
        [(DeliveryAccount *)self setMaximumMessageBytes:v8];
      }
      [(SMTPAccount *)self setSupportsPipelining:[(MFSMTPConnection *)connection supportsPipelining]];
      [(SMTPAccount *)self setSupportsOutboxCopy:[(MFSMTPConnection *)connection supportsOutboxCopy]];
    }
    else
    {

      connection = 0;
    }
  }
LABEL_14:
  return connection;
}

- (void)disconnect:(id)a3
{
  [a3 quit];
}

- (void)connectionExpired:(id)a3
{
  self->_timer = 0;
  _MFLockGlobalLock();
  connection = self->_connection;
  self->_connection = 0;
  _MFUnlockGlobalLock();
  if (connection)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_disconnect_, self, connection);
    id v6 = +[MFInvocationQueue sharedInvocationQueue];
    [v6 addInvocation:v5];
  }
}

- (void)setTimer
{
  _MFLockGlobalLock();
  [(NSTimer *)self->_timer invalidate];
  self->_timer = (NSTimer *)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_connectionExpired_ selector:0 userInfo:0 repeats:60.0];
  _MFUnlockGlobalLock();
}

- (void)checkInConnection:(id)a3
{
  if ([(id)MFUserAgent() isMobileMail])
  {
    _MFLockGlobalLock();
    connection = self->_connection;
    if (!connection) {
      self->_connection = (MFSMTPConnection *)a3;
    }
    _MFUnlockGlobalLock();
    time_t v6 = time(0);
    if (!connection)
    {
      int64_t v7 = v6;
      if (v6 > self->_lastTimerSetTime + 10)
      {
        [(SMTPAccount *)self performSelectorOnMainThread:sel_setTimer withObject:0 waitUntilDone:0];
        self->_lastTimerSetTime = v7;
      }
    }
  }
  else
  {
    [a3 quit];
  }
}

- (void)releaseAllForcedConnections
{
  v2.receiver = self;
  v2.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v2 releaseAllForcedConnections];
}

- (BOOL)_isAppleServiceDeliveryHostname:(id)a3
{
  LOBYTE(a3) = [(id)__asdHostnames containsObject:a3];
  pthread_mutex_unlock(&__asdHostnamesLock);
  return (char)a3;
}

- (BOOL)canBeFallbackAccount
{
  return ![(SMTPAccount *)self _isAppleServiceDeliveryHostname:[(MFAccount *)self hostname]];
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  [(MFAccount *)&v3 dealloc];
}

@end