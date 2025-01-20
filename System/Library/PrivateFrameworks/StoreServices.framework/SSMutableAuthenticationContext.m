@interface SSMutableAuthenticationContext
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAccountName:(id)a3;
- (void)setAccountNameEditable:(BOOL)a3;
- (void)setAccountScope:(int64_t)a3;
- (void)setAllowsBioAuthentication:(BOOL)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setAllowsRetry:(BOOL)a3;
- (void)setAllowsSilentAuthentication:(BOOL)a3;
- (void)setAltDSID:(id)a3;
- (void)setCanCreateNewAccount:(BOOL)a3;
- (void)setCanSetActiveAccount:(BOOL)a3;
- (void)setCancelButtonLabel:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setDisplaysOnLockScreen:(BOOL)a3;
- (void)setForceDaemonAuthentication:(BOOL)a3;
- (void)setHTTPHeaders:(id)a3;
- (void)setInitialPassword:(id)a3;
- (void)setLogUUID:(id)a3;
- (void)setOkButtonLabel:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setPersistsAcrossDeviceLock:(BOOL)a3;
- (void)setPersistsPasswordFallback:(BOOL)a3;
- (void)setPreferredITunesStoreClient:(id)a3;
- (void)setPromptStyle:(int64_t)a3;
- (void)setPromptTitle:(id)a3;
- (void)setReasonDescription:(id)a3;
- (void)setRequestParameters:(id)a3;
- (void)setRequiredUniqueIdentifier:(id)a3;
- (void)setShouldCreateNewSession:(BOOL)a3;
- (void)setShouldFollowAccountButtons:(BOOL)a3;
- (void)setShouldIgnoreAccountConversion:(BOOL)a3;
- (void)setShouldIgnoreProtocol:(BOOL)a3;
- (void)setShouldPersonalizeResponseActions:(BOOL)a3;
- (void)setShouldSuppressDialogs:(BOOL)a3;
- (void)setSignupRequestParameters:(id)a3;
- (void)setTokenType:(int64_t)a3;
- (void)setTouchIDContinueToken:(id)a3;
- (void)setUserAgentComponents:(id)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
- (void)setValuesWithAccount:(id)a3;
@end

@implementation SSMutableAuthenticationContext

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SSAuthenticationContext allocWithZone:](SSAuthenticationContext, "allocWithZone:") _initSSAuthenticationContext];
  [(SSAuthenticationContext *)self _copyIvarsToCopy:v5 withZone:a3];
  uint64_t v6 = [(NSString *)self->super._logUUID copyWithZone:a3];
  v7 = (void *)v5[11];
  v5[11] = v6;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [(SSAuthenticationContext *)+[SSMutableAuthenticationContext allocWithZone:](SSMutableAuthenticationContext, "allocWithZone:") _initSSAuthenticationContext];
  [(SSAuthenticationContext *)self _copyIvarsToCopy:v5 withZone:a3];
  uint64_t v6 = [(SSAuthenticationContext *)self logUUID];
  v7 = (void *)v5[11];
  v5[11] = v6;

  return v5;
}

- (void)setAccountName:(id)a3
{
  if (self->super._accountName != a3)
  {
    v4 = (NSString *)[a3 copy];
    accountName = self->super._accountName;
    self->super._accountName = v4;
  }
}

- (void)setAccountNameEditable:(BOOL)a3
{
  self->super._accountNameEditable = a3;
}

- (void)setAccountScope:(int64_t)a3
{
  self->super._accountScope = a3;
}

- (void)setAllowsRetry:(BOOL)a3
{
  self->super._allowsRetry = a3;
}

- (void)setAllowsSilentAuthentication:(BOOL)a3
{
  self->super._allowsSilentAuthentication = a3;
}

- (void)setAltDSID:(id)a3
{
  if (self->super._altDSID != a3)
  {
    v4 = (NSString *)[a3 copy];
    altDSID = self->super._altDSID;
    self->super._altDSID = v4;
  }
}

- (void)setCanCreateNewAccount:(BOOL)a3
{
  self->super._canCreateNewAccount = a3;
}

- (void)setCanSetActiveAccount:(BOOL)a3
{
  self->super._canSetActiveAccount = a3;
}

- (void)setInitialPassword:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  LODWORD(v18) = 138412290;
  *(void *)((char *)&v18 + 4) = objc_opt_class();
  id v9 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v17, v18);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
  }
  [(SSMutableAuthenticationContext *)self setPasswordEquivalentToken:v4];
}

- (void)setLogUUID:(id)a3
{
}

- (void)setPassword:(id)a3
{
  v5 = (NSString *)a3;
  password = self->super._password;
  p_password = &self->super._password;
  if (password != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_password, a3);
    v5 = v8;
  }
}

- (void)setPasswordEquivalentToken:(id)a3
{
  v5 = (NSString *)a3;
  passwordEquivalentToken = self->super._passwordEquivalentToken;
  p_passwordEquivalentToken = &self->super._passwordEquivalentToken;
  if (passwordEquivalentToken != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_passwordEquivalentToken, a3);
    v5 = v8;
  }
}

- (void)setPreferredITunesStoreClient:(id)a3
{
  if (self->super._preferredITunesStoreClient != a3)
  {
    id v4 = (NSString *)[a3 copy];
    preferredITunesStoreClient = self->super._preferredITunesStoreClient;
    self->super._preferredITunesStoreClient = v4;
  }
}

- (void)setPromptStyle:(int64_t)a3
{
  self->super._promptStyle = a3;
}

- (void)setPersistsPasswordFallback:(BOOL)a3
{
  self->super._persistsPasswordFallback = a3;
}

- (void)setRequestParameters:(id)a3
{
  if (self->super._requestParameters != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    requestParameters = self->super._requestParameters;
    self->super._requestParameters = v4;
  }
}

- (void)setRequiredUniqueIdentifier:(id)a3
{
  v5 = (NSNumber *)a3;
  requiredUniqueIdentifier = self->super._requiredUniqueIdentifier;
  p_requiredUniqueIdentifier = &self->super._requiredUniqueIdentifier;
  if (requiredUniqueIdentifier != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_requiredUniqueIdentifier, a3);
    v5 = v8;
  }
}

- (void)setShouldCreateNewSession:(BOOL)a3
{
  self->super._shouldCreateNewSession = a3;
}

- (void)setShouldFollowAccountButtons:(BOOL)a3
{
  self->super._shouldFollowAccountButtons = a3;
}

- (void)setShouldIgnoreAccountConversion:(BOOL)a3
{
  self->super._shouldIgnoreAccountConversion = a3;
}

- (void)setShouldIgnoreProtocol:(BOOL)a3
{
  self->super._shouldIgnoreProtocol = a3;
}

- (void)setShouldPersonalizeResponseActions:(BOOL)a3
{
  self->super._shouldPersonalizeResponseActions = a3;
}

- (void)setShouldSuppressDialogs:(BOOL)a3
{
  self->super._shouldSuppressDialogs = a3;
}

- (void)setSignupRequestParameters:(id)a3
{
  if (self->super._signupRequestParameters != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    signupRequestParameters = self->super._signupRequestParameters;
    self->super._signupRequestParameters = v4;
  }
}

- (void)setTouchIDContinueToken:(id)a3
{
  if (self->super._touchIDContinueToken != a3)
  {
    id v4 = (NSString *)[a3 copy];
    touchIDContinueToken = self->super._touchIDContinueToken;
    self->super._touchIDContinueToken = v4;
  }
}

- (void)setUserAgentComponents:(id)a3
{
  v5 = (NSArray *)a3;
  userAgentComponents = self->super._userAgentComponents;
  p_userAgentComponents = &self->super._userAgentComponents;
  if (userAgentComponents != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_userAgentComponents, a3);
    v5 = v8;
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int v7 = (void *)[(NSDictionary *)self->super._httpHeaders mutableCopy];
  id v8 = v13;
  id v9 = v7;
  if (v13)
  {
    if (!v7)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = v13;
      id v9 = v10;
    }
    [v9 setObject:v8 forKey:v6];
  }
  else
  {
    [v7 removeObjectForKey:v6];
  }
  uint64_t v11 = (NSDictionary *)[v9 copy];
  httpHeaders = self->super._httpHeaders;
  self->super._httpHeaders = v11;
}

- (void)setAllowsBioAuthentication:(BOOL)a3
{
  self->super._allowsBioAuthentication = a3;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->super._allowsBootstrapCellularData = a3;
}

- (void)setCancelButtonLabel:(id)a3
{
  if (self->super._cancelButtonLabel != a3)
  {
    id v4 = (NSString *)[a3 copy];
    cancelButtonLabel = self->super._cancelButtonLabel;
    self->super._cancelButtonLabel = v4;
  }
}

- (void)setClientIdentifierHeader:(id)a3
{
  if (self->super._clientIdentifierHeader != a3)
  {
    id v4 = (NSString *)[a3 copy];
    clientIdentifierHeader = self->super._clientIdentifierHeader;
    self->super._clientIdentifierHeader = v4;
  }
}

- (void)setDisplaysOnLockScreen:(BOOL)a3
{
  self->super._displaysOnLockScreen = a3;
}

- (void)setForceDaemonAuthentication:(BOOL)a3
{
  if (self->super._forceDaemonAuthentication != a3) {
    self->super._forceDaemonAuthentication = a3;
  }
}

- (void)setHTTPHeaders:(id)a3
{
  v5 = (NSDictionary *)a3;
  httpHeaders = self->super._httpHeaders;
  p_httpHeaders = &self->super._httpHeaders;
  if (httpHeaders != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_httpHeaders, a3);
    v5 = v8;
  }
}

- (void)setOkButtonLabel:(id)a3
{
  if (self->super._okButtonLabel != a3)
  {
    id v4 = (NSString *)[a3 copy];
    okButtonLabel = self->super._okButtonLabel;
    self->super._okButtonLabel = v4;
  }
}

- (void)setPersistsAcrossDeviceLock:(BOOL)a3
{
  self->super._persistsAcrossDeviceLock = a3;
}

- (void)setPromptTitle:(id)a3
{
  if (self->super._promptTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    promptTitle = self->super._promptTitle;
    self->super._promptTitle = v4;
  }
}

- (void)setReasonDescription:(id)a3
{
  if (self->super._reasonDescription != a3)
  {
    id v4 = (NSString *)[a3 copy];
    reasonDescription = self->super._reasonDescription;
    self->super._reasonDescription = v4;
  }
}

- (void)setTokenType:(int64_t)a3
{
  self->super._tokenType = a3;
}

- (void)setValuesWithAccount:(id)a3
{
  id v4 = a3;
  id v10 = [v4 accountName];
  [(SSMutableAuthenticationContext *)self setAccountName:v10];
  uint64_t v5 = [v10 length];
  [(SSMutableAuthenticationContext *)self setAccountNameEditable:v5 == 0];
  BOOL v6 = [(SSAuthenticationContext *)self canCreateNewAccount];
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }
  [(SSMutableAuthenticationContext *)self setCanCreateNewAccount:v7];
  -[SSMutableAuthenticationContext setAccountScope:](self, "setAccountScope:", [v4 accountScope]);
  id v8 = [v4 uniqueIdentifier];
  [(SSMutableAuthenticationContext *)self setRequiredUniqueIdentifier:v8];

  id v9 = [v4 altDSID];

  [(SSMutableAuthenticationContext *)self setAltDSID:v9];
}

@end