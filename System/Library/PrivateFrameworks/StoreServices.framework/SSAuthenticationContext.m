@interface SSAuthenticationContext
+ (id)contextForSignIn;
- (BOOL)_allowCreateAccount;
- (BOOL)allowsBioAuthentication;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)allowsRetry;
- (BOOL)allowsSilentAuthentication;
- (BOOL)canCreateNewAccount;
- (BOOL)canSetActiveAccount;
- (BOOL)displaysOnLockScreen;
- (BOOL)forceDaemonAuthentication;
- (BOOL)isAccountNameEditable;
- (BOOL)isDemoAccount;
- (BOOL)persistsAcrossDeviceLock;
- (BOOL)persistsPasswordFallback;
- (BOOL)shouldCreateNewSession;
- (BOOL)shouldFollowAccountButtons;
- (BOOL)shouldIgnoreAccountConversion;
- (BOOL)shouldIgnoreProtocol;
- (BOOL)shouldPersonalizeResponseActions;
- (BOOL)shouldSuppressDialogs;
- (NSArray)userAgentComponents;
- (NSDictionary)HTTPHeaders;
- (NSDictionary)requestParameters;
- (NSDictionary)signupRequestParameters;
- (NSNumber)requiredUniqueIdentifier;
- (NSString)accountName;
- (NSString)altDSID;
- (NSString)cancelButtonLabel;
- (NSString)clientIdentifierHeader;
- (NSString)description;
- (NSString)logUUID;
- (NSString)okButtonLabel;
- (NSString)password;
- (NSString)passwordEquivalentToken;
- (NSString)preferredITunesStoreClient;
- (NSString)promptTitle;
- (NSString)reasonDescription;
- (NSString)touchIDContinueToken;
- (SSAuthenticationContext)initWithAccount:(id)a3;
- (SSAuthenticationContext)initWithAccountIdentifier:(id)a3;
- (SSAuthenticationContext)initWithXPCEncoding:(id)a3;
- (SSURLBagContext)URLBagContext;
- (id)_initSSAuthenticationContext;
- (id)accountStoreOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)accountScope;
- (int64_t)promptStyle;
- (int64_t)tokenType;
- (void)_copyIvarsToCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation SSAuthenticationContext

- (id)_initSSAuthenticationContext
{
  v7.receiver = self;
  v7.super_class = (Class)SSAuthenticationContext;
  v2 = [(SSAuthenticationContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accountNameEditable = 1;
    v2->_allowsRetry = 1;
    v2->_allowsSilentAuthentication = +[SSDevice deviceIsAppleWatch];
    v3->_canCreateNewAccount = [(SSAuthenticationContext *)v3 _allowCreateAccount];
    v3->_canSetActiveAccount = 1;
    uint64_t v4 = AMSSetLogKeyIfNeeded();
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v4;

    v3->_shouldPersonalizeResponseActions = 1;
  }
  return v3;
}

- (SSAuthenticationContext)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [(SSAuthenticationContext *)self _initSSAuthenticationContext];
  if (v5)
  {
    uint64_t v6 = [v4 accountName];
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    v5->_accountNameEditable = [(NSString *)v5->_accountName length] == 0;
    v5->_accountScope = [v4 accountScope];
    uint64_t v8 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    BOOL canCreateNewAccount = v5->_canCreateNewAccount;
    if (canCreateNewAccount) {
      BOOL canCreateNewAccount = v5->_accountNameEditable;
    }
    v5->_BOOL canCreateNewAccount = canCreateNewAccount;
    uint64_t v11 = [v4 uniqueIdentifier];
    requiredUniqueIdentifier = v5->_requiredUniqueIdentifier;
    v5->_requiredUniqueIdentifier = (NSNumber *)v11;
  }
  return v5;
}

- (SSAuthenticationContext)initWithAccountIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = +[SSAccountStore defaultStore];
  if (v5 && [v5 integerValue])
  {
    uint64_t v7 = [v6 accountWithUniqueIdentifier:v5];
  }
  else
  {
    uint64_t v7 = [v6 activeAccount];
  }
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    v9 = [(SSAuthenticationContext *)self initWithAccount:v7];
  }
  else
  {
    v10 = [(SSAuthenticationContext *)self _initSSAuthenticationContext];
    v9 = v10;
    if (v10)
    {
      v10->_accountNameEditable = 1;
      if (v5) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = !v10->_canCreateNewAccount;
      }
      char v12 = !v11;
      v10->_BOOL canCreateNewAccount = v12;
      objc_storeStrong((id *)&v10->_requiredUniqueIdentifier, a3);
    }
  }

  return v9;
}

+ (id)contextForSignIn
{
  v2 = objc_alloc_init((Class)a1);
  v2[18] = 1;
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"signIn", @"why", 0);
  id v4 = (void *)v2[20];
  v2[20] = v3;

  return v2;
}

- (id)accountStoreOptions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAuthenticationContext allowsSilentAuthentication](self, "allowsSilentAuthentication"));
  [v4 setObject:v5 forKeyedSubscript:@"SSAccountStoreAuthKitAllowSilentAuth"];

  uint64_t v6 = NSNumber;
  uint64_t v7 = [(SSAuthenticationContext *)self password];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    v2 = [(SSAuthenticationContext *)self passwordEquivalentToken];
    BOOL v8 = v2 != 0;
  }
  v9 = [v6 numberWithInt:v8];
  [v4 setObject:v9 forKeyedSubscript:@"SSAccountStoreAuthKitAllowPasswordReuse"];

  if (!v7) {
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAuthenticationContext canCreateNewAccount](self, "canCreateNewAccount"));
  }
  [v4 setObject:v10 forKeyedSubscript:@"SSAccountStoreAuthKitCanCreateNewAccountKey"];

  BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAuthenticationContext canSetActiveAccount](self, "canSetActiveAccount"));
  [v4 setObject:v11 forKeyedSubscript:@"SSAccountStoreAuthKitCanSetActiveAccountKey"];

  char v12 = objc_msgSend(NSNumber, "numberWithInt:", -[SSAuthenticationContext promptStyle](self, "promptStyle") == 1000);
  [v4 setObject:v12 forKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAuthenticationContext shouldSuppressDialogs](self, "shouldSuppressDialogs"));
  [v4 setObject:v13 forKeyedSubscript:@"SSAccountStoreAuthKitSuppressServerDialogs"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAuthenticationContext shouldIgnoreAccountConversion](self, "shouldIgnoreAccountConversion"));
  [v4 setObject:v14 forKeyedSubscript:@"SSAccountStoreIgnoreAccountConversionKey"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAuthenticationContext accountScope](self, "accountScope"));
  [v4 setObject:v15 forKeyedSubscript:SSVerifyCredentialsAccountScope];

  v16 = [(SSAuthenticationContext *)self reasonDescription];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [(SSAuthenticationContext *)self reasonDescription];
    [v4 setObject:v18 forKeyedSubscript:@"SSAccountStoreAuthKitReasonKey"];
  }
  v19 = [(SSAuthenticationContext *)self promptTitle];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    v21 = [(SSAuthenticationContext *)self promptTitle];
    [v4 setObject:v21 forKeyedSubscript:@"SSAccountStoreAuthKitPromptTitle"];
  }
  v22 = [(SSAuthenticationContext *)self okButtonLabel];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    v24 = [(SSAuthenticationContext *)self okButtonLabel];
    [v4 setObject:v24 forKeyedSubscript:@"SSAccountStoreAuthKitOKButtonLabel"];
  }
  v25 = [(SSAuthenticationContext *)self requiredUniqueIdentifier];

  if (v25)
  {
    v26 = [(SSAuthenticationContext *)self requiredUniqueIdentifier];
    [v4 setObject:v26 forKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountDSIDKey"];
  }
  v27 = [(SSAuthenticationContext *)self signupRequestParameters];

  if (v27)
  {
    v28 = [(SSAuthenticationContext *)self signupRequestParameters];
    [v4 setObject:v28 forKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"];
  }
  v29 = [(SSAuthenticationContext *)self preferredITunesStoreClient];

  if (v29)
  {
    v30 = [(SSAuthenticationContext *)self preferredITunesStoreClient];
    [v4 setObject:v30 forKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountTargetIdentifierKey"];
  }
  v31 = [(SSAuthenticationContext *)self HTTPHeaders];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    v33 = [(SSAuthenticationContext *)self HTTPHeaders];
    v34 = (void *)[v33 mutableCopy];

    [v34 removeObjectForKey:@"User-Agent"];
    v35 = (void *)[v34 copy];
    [v4 setObject:v35 forKeyedSubscript:@"SSAccountStoreAuthKitHTTPHeadersKey"];
  }
  v36 = [(SSAuthenticationContext *)self HTTPHeaders];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    v38 = [(SSAuthenticationContext *)self HTTPHeaders];
    v39 = (void *)[v38 mutableCopy];

    [v39 removeObjectForKey:@"User-Agent"];
    v40 = (void *)[v39 copy];
    [v4 setObject:v40 forKeyedSubscript:@"SSAccountStoreAuthKitHTTPHeadersKey"];
  }
  v41 = [(SSAuthenticationContext *)self HTTPHeaders];
  v42 = [v41 objectForKeyedSubscript:@"User-Agent"];

  if ([v42 length])
  {
    v43 = v42;
  }
  else
  {
    v44 = +[SSDevice currentDevice];
    v43 = [v44 userAgent];

    v42 = v43;
    if (![v43 length]) {
      goto LABEL_26;
    }
  }
  [v4 setObject:v42 forKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"];
LABEL_26:
  v45 = [(SSAuthenticationContext *)self userAgentComponents];
  uint64_t v46 = [v45 count];

  if (v46)
  {
    v47 = [(SSAuthenticationContext *)self userAgentComponents];
    [v4 setObject:v47 forKeyedSubscript:@"SSAccountStoreAuthKitUserAgentSuffixesKey"];
  }
  v48 = (void *)[v4 copy];

  return v48;
}

- (SSURLBagContext)URLBagContext
{
  uint64_t v3 = +[SSURLBagContext contextWithBagType:SSURLBagTypeForAccountScope([(SSAuthenticationContext *)self accountScope])];
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", -[SSAuthenticationContext allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  id v4 = [(SSAuthenticationContext *)self HTTPHeaders];
  id v5 = [v4 objectForKey:@"User-Agent"];

  if (v5) {
    [v3 setValue:v5 forHTTPHeaderField:@"User-Agent"];
  }

  return (SSURLBagContext *)v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountName);
  xpc_dictionary_set_BOOL(v3, "1", self->_accountNameEditable);
  xpc_dictionary_set_int64(v3, "2", self->_accountScope);
  xpc_dictionary_set_BOOL(v3, "21", self->_allowsBioAuthentication);
  xpc_dictionary_set_BOOL(v3, "23", self->_allowsBootstrapCellularData);
  xpc_dictionary_set_BOOL(v3, "19", self->_allowsRetry);
  xpc_dictionary_set_BOOL(v3, "30", self->_allowsSilentAuthentication);
  SSXPCDictionarySetObject(v3, "26", self->_altDSID);
  SSXPCDictionarySetObject(v3, "27", self->_cancelButtonLabel);
  xpc_dictionary_set_BOOL(v3, "3", self->_canCreateNewAccount);
  xpc_dictionary_set_BOOL(v3, "4", self->_canSetActiveAccount);
  SSXPCDictionarySetObject(v3, "5", self->_clientIdentifierHeader);
  xpc_dictionary_set_BOOL(v3, "25", self->_displaysOnLockScreen);
  xpc_dictionary_set_BOOL(v3, "33", self->_forceDaemonAuthentication);
  SSXPCDictionarySetObject(v3, "7", self->_httpHeaders);
  SSXPCDictionarySetObject(v3, "34", self->_logUUID);
  SSXPCDictionarySetObject(v3, "28", self->_okButtonLabel);
  SSXPCDictionarySetObject(v3, "18", self->_password);
  SSXPCDictionarySetObject(v3, "31", self->_passwordEquivalentToken);
  xpc_dictionary_set_BOOL(v3, "20", self->_persistsAcrossDeviceLock);
  SSXPCDictionarySetObject(v3, "8", self->_preferredITunesStoreClient);
  xpc_dictionary_set_int64(v3, "9", self->_promptStyle);
  SSXPCDictionarySetObject(v3, "29", self->_promptTitle);
  xpc_dictionary_set_BOOL(v3, "22", self->_persistsPasswordFallback);
  SSXPCDictionarySetObject(v3, "24", self->_reasonDescription);
  SSXPCDictionarySetObject(v3, "10", self->_requestParameters);
  SSXPCDictionarySetObject(v3, "11", self->_requiredUniqueIdentifier);
  xpc_dictionary_set_BOOL(v3, "19", self->_shouldCreateNewSession);
  xpc_dictionary_set_BOOL(v3, "12", self->_shouldFollowAccountButtons);
  xpc_dictionary_set_BOOL(v3, "16", self->_shouldIgnoreProtocol);
  xpc_dictionary_set_BOOL(v3, "35", self->_shouldPersonalizeResponseActions);
  xpc_dictionary_set_BOOL(v3, "17", self->_shouldSuppressDialogs);
  SSXPCDictionarySetObject(v3, "13", self->_signupRequestParameters);
  xpc_dictionary_set_int64(v3, "14", self->_tokenType);
  SSXPCDictionarySetObject(v3, "32", self->_touchIDContinueToken);
  SSXPCDictionarySetObject(v3, "15", self->_userAgentComponents);
  xpc_dictionary_set_BOOL(v3, "36", self->_shouldIgnoreAccountConversion);
  return v3;
}

- (SSAuthenticationContext)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v59.receiver = self;
    v59.super_class = (Class)SSAuthenticationContext;
    uint64_t v6 = [(SSAuthenticationContext *)&v59 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountName = v6->_accountName;
      v6->_accountName = (NSString *)v9;

      v6->_accountNameEditable = xpc_dictionary_get_BOOL(v5, "1");
      v6->_accountScope = xpc_dictionary_get_BOOL(v5, "2");
      v6->_allowsBioAuthentication = xpc_dictionary_get_BOOL(v5, "21");
      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "23");
      v6->_allowsRetry = xpc_dictionary_get_BOOL(v5, "19");
      v6->_allowsSilentAuthentication = xpc_dictionary_get_BOOL(v5, "30");
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "26", v11);
      altDSID = v6->_altDSID;
      v6->_altDSID = (NSString *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "27", v14);
      cancelButtonLabel = v6->_cancelButtonLabel;
      v6->_cancelButtonLabel = (NSString *)v15;

      v6->_BOOL canCreateNewAccount = xpc_dictionary_get_BOOL(v5, "3");
      v6->_canSetActiveAccount = xpc_dictionary_get_BOOL(v5, "4");
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v17);
      clientIdentifierHeader = v6->_clientIdentifierHeader;
      v6->_clientIdentifierHeader = (NSString *)v18;

      v6->_displaysOnLockScreen = xpc_dictionary_get_BOOL(v5, "25");
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v20);
      httpHeaders = v6->_httpHeaders;
      v6->_httpHeaders = (NSDictionary *)v21;

      uint64_t v23 = objc_opt_class();
      uint64_t v24 = SSXPCDictionaryCopyObjectWithClass(v5, "34", v23);
      logUUID = v6->_logUUID;
      v6->_logUUID = (NSString *)v24;

      uint64_t v26 = objc_opt_class();
      uint64_t v27 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v26);
      okButtonLabel = v6->_okButtonLabel;
      v6->_okButtonLabel = (NSString *)v27;

      uint64_t v29 = objc_opt_class();
      uint64_t v30 = SSXPCDictionaryCopyObjectWithClass(v5, "18", v29);
      password = v6->_password;
      v6->_password = (NSString *)v30;

      uint64_t v32 = objc_opt_class();
      uint64_t v33 = SSXPCDictionaryCopyObjectWithClass(v5, "31", v32);
      passwordEquivalentToken = v6->_passwordEquivalentToken;
      v6->_passwordEquivalentToken = (NSString *)v33;

      v6->_persistsAcrossDeviceLock = xpc_dictionary_get_BOOL(v5, "20");
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v35);
      preferredITunesStoreClient = v6->_preferredITunesStoreClient;
      v6->_preferredITunesStoreClient = (NSString *)v36;

      v6->_promptStyle = xpc_dictionary_get_int64(v5, "9");
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v38);
      promptTitle = v6->_promptTitle;
      v6->_promptTitle = (NSString *)v39;

      v6->_persistsPasswordFallback = xpc_dictionary_get_BOOL(v5, "22");
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v41);
      reasonDescription = v6->_reasonDescription;
      v6->_reasonDescription = (NSString *)v42;

      uint64_t v44 = objc_opt_class();
      uint64_t v45 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v44);
      requestParameters = v6->_requestParameters;
      v6->_requestParameters = (NSDictionary *)v45;

      uint64_t v47 = objc_opt_class();
      uint64_t v48 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v47);
      requiredUniqueIdentifier = v6->_requiredUniqueIdentifier;
      v6->_requiredUniqueIdentifier = (NSNumber *)v48;

      v6->_shouldCreateNewSession = xpc_dictionary_get_BOOL(v5, "19");
      v6->_shouldFollowAccountButtons = xpc_dictionary_get_BOOL(v5, "12");
      v6->_shouldIgnoreAccountConversion = xpc_dictionary_get_BOOL(v5, "36");
      v6->_shouldIgnoreProtocol = xpc_dictionary_get_BOOL(v5, "16");
      v6->_shouldPersonalizeResponseActions = xpc_dictionary_get_BOOL(v5, "35");
      v6->_shouldSuppressDialogs = xpc_dictionary_get_BOOL(v5, "17");
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v50);
      signupRequestParameters = v6->_signupRequestParameters;
      v6->_signupRequestParameters = (NSDictionary *)v51;

      v6->_tokenType = xpc_dictionary_get_BOOL(v5, "14");
      uint64_t v53 = objc_opt_class();
      uint64_t v54 = SSXPCDictionaryCopyObjectWithClass(v5, "32", v53);
      touchIDContinueToken = v6->_touchIDContinueToken;
      v6->_touchIDContinueToken = (NSString *)v54;

      uint64_t v56 = objc_opt_class();
      uint64_t v57 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v56);
      userAgentComponents = v6->_userAgentComponents;
      v6->_userAgentComponents = (NSArray *)v57;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[SSAuthenticationContext allocWithZone:](SSAuthenticationContext, "allocWithZone:") _initSSAuthenticationContext];
  [(SSAuthenticationContext *)self _copyIvarsToCopy:v5 withZone:a3];
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(SSAuthenticationContext *)+[SSMutableAuthenticationContext allocWithZone:](SSMutableAuthenticationContext, "allocWithZone:") _initSSAuthenticationContext];
  [(SSAuthenticationContext *)self _copyIvarsToCopy:v5 withZone:a3];
  return v5;
}

- (NSString)description
{
  xpc_object_t v3 = [MEMORY[0x1E4F28E78] string];
  v22.receiver = self;
  v22.super_class = (Class)SSAuthenticationContext;
  id v4 = [(SSAuthenticationContext *)&v22 description];
  [v3 appendFormat:@"%@:\n", v4];

  id v5 = [(SSAuthenticationContext *)self accountName];
  [v3 appendFormat:@"  accountName = %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"  accountScope = %ld\n", -[SSAuthenticationContext accountScope](self, "accountScope"));
  objc_msgSend(v3, "appendFormat:", @"  allowsBootstrapCellularData = %d\n", -[SSAuthenticationContext allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  objc_msgSend(v3, "appendFormat:", @"  allowsRetry = %d\n", -[SSAuthenticationContext allowsRetry](self, "allowsRetry"));
  objc_msgSend(v3, "appendFormat:", @"  allowsSilentAuthentication = %d\n", -[SSAuthenticationContext allowsSilentAuthentication](self, "allowsSilentAuthentication"));
  uint64_t v6 = [(SSAuthenticationContext *)self altDSID];
  [v3 appendFormat:@"  altDSID = %@\n", v6];

  uint64_t v7 = [(SSAuthenticationContext *)self cancelButtonLabel];
  [v3 appendFormat:@"  cancelButtonLabel = %@\n", v7];

  objc_msgSend(v3, "appendFormat:", @"  BOOL canCreateNewAccount = %d\n", -[SSAuthenticationContext canCreateNewAccount](self, "canCreateNewAccount"));
  objc_msgSend(v3, "appendFormat:", @"  canSetActiveAccount = %d\n", -[SSAuthenticationContext canSetActiveAccount](self, "canSetActiveAccount"));
  uint64_t v8 = [(SSAuthenticationContext *)self clientIdentifierHeader];
  [v3 appendFormat:@"  clientIdentifierHeader = %@\n", v8];

  objc_msgSend(v3, "appendFormat:", @"  displaysOnLockScreen = %d\n", -[SSAuthenticationContext displaysOnLockScreen](self, "displaysOnLockScreen"));
  uint64_t v9 = [(SSAuthenticationContext *)self HTTPHeaders];
  [v3 appendFormat:@"  HTTPHeaders = %@\n", v9];

  objc_msgSend(v3, "appendFormat:", @"  isAccountNameEditable = %d\n", -[SSAuthenticationContext isAccountNameEditable](self, "isAccountNameEditable"));
  v10 = [(SSAuthenticationContext *)self logUUID];
  [v3 appendFormat:@"  logUUID = %@\n", v10];

  uint64_t v11 = [(SSAuthenticationContext *)self okButtonLabel];
  [v3 appendFormat:@"  okButtonLabel = %@\n", v11];

  objc_msgSend(v3, "appendFormat:", @"  persistsAcrossDeviceLock = %d\n", -[SSAuthenticationContext persistsAcrossDeviceLock](self, "persistsAcrossDeviceLock"));
  objc_msgSend(v3, "appendFormat:", @"  persistsPasswordFallback = %d\n", -[SSAuthenticationContext persistsPasswordFallback](self, "persistsPasswordFallback"));
  uint64_t v12 = [(SSAuthenticationContext *)self preferredITunesStoreClient];
  [v3 appendFormat:@"  preferrediTunesStoreClient = %@\n", v12];

  objc_msgSend(v3, "appendFormat:", @"  promptStyle = %ld\n", -[SSAuthenticationContext promptStyle](self, "promptStyle"));
  v13 = [(SSAuthenticationContext *)self promptTitle];
  [v3 appendFormat:@"  promptTitle = %@\n", v13];

  uint64_t v14 = [(SSAuthenticationContext *)self reasonDescription];
  [v3 appendFormat:@"  reasonDescription = %@\n", v14];

  uint64_t v15 = [(SSAuthenticationContext *)self requestParameters];
  [v3 appendFormat:@"  requestParameters = %@\n", v15];

  v16 = [(SSAuthenticationContext *)self requiredUniqueIdentifier];
  [v3 appendFormat:@"  requiredUniqueIdentifier = %@\n", v16];

  objc_msgSend(v3, "appendFormat:", @"  shouldCreateNewSession = %d\n", -[SSAuthenticationContext shouldCreateNewSession](self, "shouldCreateNewSession"));
  objc_msgSend(v3, "appendFormat:", @"  shouldFollowAccountButtons = %d\n", -[SSAuthenticationContext shouldFollowAccountButtons](self, "shouldFollowAccountButtons"));
  objc_msgSend(v3, "appendFormat:", @"  shouldIgnoreAccountConversion = %d\n", -[SSAuthenticationContext shouldIgnoreAccountConversion](self, "shouldIgnoreAccountConversion"));
  objc_msgSend(v3, "appendFormat:", @"  shouldIgnoreProtocol = %d\n", -[SSAuthenticationContext shouldIgnoreProtocol](self, "shouldIgnoreProtocol"));
  objc_msgSend(v3, "appendFormat:", @"  shouldSuppressDialogs = %d\n", -[SSAuthenticationContext shouldSuppressDialogs](self, "shouldSuppressDialogs"));
  uint64_t v17 = [(SSAuthenticationContext *)self signupRequestParameters];
  [v3 appendFormat:@"  signupRequestParameters = %@\n", v17];

  objc_msgSend(v3, "appendFormat:", @"  tokenType = %ld\n", -[SSAuthenticationContext tokenType](self, "tokenType"));
  uint64_t v18 = [(SSAuthenticationContext *)self touchIDContinueToken];
  [v3 appendFormat:@"  touchIDContinueToken = %@\n", v18];

  v19 = [(SSAuthenticationContext *)self URLBagContext];
  [v3 appendFormat:@"  URLBagContext = %@\n", v19];

  uint64_t v20 = [(SSAuthenticationContext *)self userAgentComponents];
  [v3 appendFormat:@"  userAgentComponents = %@", v20];

  return (NSString *)v3;
}

- (BOOL)isAccountNameEditable
{
  return self->_accountNameEditable || [(NSString *)self->_accountName length] == 0;
}

- (BOOL)_allowCreateAccount
{
  return !SSDeviceIsAppleTV();
}

- (void)_copyIvarsToCopy:(id)a3 withZone:(_NSZone *)a4
{
  accountName = self->_accountName;
  id v7 = a3;
  uint64_t v8 = [(NSString *)accountName copyWithZone:a4];
  uint64_t v9 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v8;

  *((unsigned char *)v7 + 16) = self->_accountNameEditable;
  *((void *)v7 + 3) = self->_accountScope;
  *((unsigned char *)v7 + 32) = self->_allowsBioAuthentication;
  *((unsigned char *)v7 + 33) = self->_allowsBootstrapCellularData;
  *((unsigned char *)v7 + 34) = self->_allowsRetry;
  *((unsigned char *)v7 + 35) = self->_allowsSilentAuthentication;
  uint64_t v10 = [(NSString *)self->_altDSID copyWithZone:a4];
  uint64_t v11 = (void *)*((void *)v7 + 5);
  *((void *)v7 + 5) = v10;

  uint64_t v12 = [(NSString *)self->_cancelButtonLabel copyWithZone:a4];
  v13 = (void *)*((void *)v7 + 6);
  *((void *)v7 + 6) = v12;

  *((unsigned char *)v7 + 56) = self->_canCreateNewAccount;
  *((unsigned char *)v7 + 57) = self->_canSetActiveAccount;
  uint64_t v14 = [(NSString *)self->_clientIdentifierHeader copyWithZone:a4];
  uint64_t v15 = (void *)*((void *)v7 + 8);
  *((void *)v7 + 8) = v14;

  *((unsigned char *)v7 + 72) = self->_displaysOnLockScreen;
  *((unsigned char *)v7 + 73) = self->_forceDaemonAuthentication;
  uint64_t v16 = [(NSDictionary *)self->_httpHeaders copyWithZone:a4];
  uint64_t v17 = (void *)*((void *)v7 + 10);
  *((void *)v7 + 10) = v16;

  uint64_t v18 = [(NSString *)self->_okButtonLabel copyWithZone:a4];
  v19 = (void *)*((void *)v7 + 14);
  *((void *)v7 + 14) = v18;

  uint64_t v20 = [(NSString *)self->_logUUID copyWithZone:a4];
  uint64_t v21 = (void *)*((void *)v7 + 11);
  *((void *)v7 + 11) = v20;

  uint64_t v22 = [(NSString *)self->_password copyWithZone:a4];
  uint64_t v23 = (void *)*((void *)v7 + 12);
  *((void *)v7 + 12) = v22;

  uint64_t v24 = [(NSString *)self->_passwordEquivalentToken copyWithZone:a4];
  v25 = (void *)*((void *)v7 + 13);
  *((void *)v7 + 13) = v24;

  *((unsigned char *)v7 + 120) = self->_persistsAcrossDeviceLock;
  uint64_t v26 = [(NSString *)self->_preferredITunesStoreClient copyWithZone:a4];
  uint64_t v27 = (void *)*((void *)v7 + 16);
  *((void *)v7 + 16) = v26;

  *((void *)v7 + 18) = self->_promptStyle;
  objc_storeStrong((id *)v7 + 17, self->_promptTitle);
  *((unsigned char *)v7 + 121) = self->_persistsPasswordFallback;
  uint64_t v28 = [(NSString *)self->_reasonDescription copyWithZone:a4];
  uint64_t v29 = (void *)*((void *)v7 + 19);
  *((void *)v7 + 19) = v28;

  uint64_t v30 = [(NSDictionary *)self->_requestParameters copyWithZone:a4];
  v31 = (void *)*((void *)v7 + 20);
  *((void *)v7 + 20) = v30;

  uint64_t v32 = [(NSNumber *)self->_requiredUniqueIdentifier copyWithZone:a4];
  uint64_t v33 = (void *)*((void *)v7 + 21);
  *((void *)v7 + 21) = v32;

  *((unsigned char *)v7 + 176) = self->_shouldCreateNewSession;
  *((unsigned char *)v7 + 177) = self->_shouldFollowAccountButtons;
  *((unsigned char *)v7 + 178) = self->_shouldIgnoreAccountConversion;
  *((unsigned char *)v7 + 179) = self->_shouldIgnoreProtocol;
  *((unsigned char *)v7 + 180) = self->_shouldPersonalizeResponseActions;
  *((unsigned char *)v7 + 181) = self->_shouldSuppressDialogs;
  uint64_t v34 = [(NSDictionary *)self->_signupRequestParameters copyWithZone:a4];
  uint64_t v35 = (void *)*((void *)v7 + 23);
  *((void *)v7 + 23) = v34;

  *((void *)v7 + 24) = self->_tokenType;
  uint64_t v36 = [(NSString *)self->_touchIDContinueToken copyWithZone:a4];
  uint64_t v37 = (void *)*((void *)v7 + 25);
  *((void *)v7 + 25) = v36;

  uint64_t v38 = [(NSArray *)self->_userAgentComponents copyWithZone:a4];
  id v39 = (id)*((void *)v7 + 26);
  *((void *)v7 + 26) = v38;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (int64_t)accountScope
{
  return self->_accountScope;
}

- (BOOL)allowsBioAuthentication
{
  return self->_allowsBioAuthentication;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (BOOL)allowsRetry
{
  return self->_allowsRetry;
}

- (BOOL)allowsSilentAuthentication
{
  return self->_allowsSilentAuthentication;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)cancelButtonLabel
{
  return self->_cancelButtonLabel;
}

- (BOOL)canCreateNewAccount
{
  return self->_canCreateNewAccount;
}

- (BOOL)canSetActiveAccount
{
  return self->_canSetActiveAccount;
}

- (NSString)clientIdentifierHeader
{
  return self->_clientIdentifierHeader;
}

- (BOOL)displaysOnLockScreen
{
  return self->_displaysOnLockScreen;
}

- (BOOL)forceDaemonAuthentication
{
  return self->_forceDaemonAuthentication;
}

- (NSDictionary)HTTPHeaders
{
  return self->_httpHeaders;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (NSString)okButtonLabel
{
  return self->_okButtonLabel;
}

- (BOOL)persistsAcrossDeviceLock
{
  return self->_persistsAcrossDeviceLock;
}

- (BOOL)persistsPasswordFallback
{
  return self->_persistsPasswordFallback;
}

- (NSString)preferredITunesStoreClient
{
  return self->_preferredITunesStoreClient;
}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (NSString)reasonDescription
{
  return self->_reasonDescription;
}

- (NSDictionary)requestParameters
{
  return self->_requestParameters;
}

- (NSNumber)requiredUniqueIdentifier
{
  return self->_requiredUniqueIdentifier;
}

- (BOOL)shouldCreateNewSession
{
  return self->_shouldCreateNewSession;
}

- (BOOL)shouldFollowAccountButtons
{
  return self->_shouldFollowAccountButtons;
}

- (BOOL)shouldIgnoreAccountConversion
{
  return self->_shouldIgnoreAccountConversion;
}

- (BOOL)shouldIgnoreProtocol
{
  return self->_shouldIgnoreProtocol;
}

- (BOOL)shouldPersonalizeResponseActions
{
  return self->_shouldPersonalizeResponseActions;
}

- (BOOL)shouldSuppressDialogs
{
  return self->_shouldSuppressDialogs;
}

- (NSDictionary)signupRequestParameters
{
  return self->_signupRequestParameters;
}

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (NSString)touchIDContinueToken
{
  return self->_touchIDContinueToken;
}

- (NSArray)userAgentComponents
{
  return self->_userAgentComponents;
}

- (BOOL)isDemoAccount
{
  return self->_demoAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentComponents, 0);
  objc_storeStrong((id *)&self->_touchIDContinueToken, 0);
  objc_storeStrong((id *)&self->_signupRequestParameters, 0);
  objc_storeStrong((id *)&self->_requiredUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_reasonDescription, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_preferredITunesStoreClient, 0);
  objc_storeStrong((id *)&self->_okButtonLabel, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_cancelButtonLabel, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end