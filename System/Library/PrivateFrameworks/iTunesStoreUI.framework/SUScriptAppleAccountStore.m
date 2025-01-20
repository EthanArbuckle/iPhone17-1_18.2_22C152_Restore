@interface SUScriptAppleAccountStore
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)accessPurposeRead;
- (NSString)accessPurposeReadWrite;
- (NSString)accessPurposeWrite;
- (NSString)accountTypeIdentifierTwitter;
- (NSString)effectiveBundleID;
- (SUScriptAppleAccount)activeStoreAccount;
- (SUScriptAppleAccount)primaryAppleAccount;
- (SUScriptAppleAccountStore)init;
- (id)_accountStore;
- (id)_className;
- (id)accountTypeWithIdentifier:(id)a3;
- (id)accountsWithAccountType:(id)a3;
- (id)makeClientAccessInfoWithAccountType:(id)a3;
- (id)scriptAttributeKeys;
- (int64_t)renewResultFailed;
- (int64_t)renewResultRejected;
- (int64_t)renewResultRenewed;
- (void)_accountStoreChangeNotification:(id)a3;
- (void)dealloc;
- (void)renewCredentialsForAccount:(id)a3 completionHandler:(id)a4;
- (void)requestAccessWithInfo:(id)a3 completionHandler:(id)a4;
- (void)setEffectiveBundleID:(id)a3;
@end

@implementation SUScriptAppleAccountStore

- (SUScriptAppleAccountStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountStore;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__accountStoreChangeNotification_, ISWeakLinkedStringConstantForString(), -[SUScriptAppleAccountStore _accountStore](v2, "_accountStore"));
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, ISWeakLinkedStringConstantForString(), 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountStore;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)accountsWithAccountType:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(SUScriptAppleAccountStore *)self _accountStore];
    v7 = objc_msgSend(v6, "accountsWithAccountType:", objc_msgSend(a3, "nativeAccountType"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [[SUScriptAppleAccount alloc] initWithACAccount:*(void *)(*((void *)&v14 + 1) + 8 * v11) accountStore:v6];
          [v5 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    [(SUScriptObject *)self checkInScriptObjects:v5];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  return v5;
}

- (id)accountTypeWithIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (SUScriptAppleAccountType *)objc_msgSend(-[SUScriptAppleAccountStore _accountStore](self, "_accountStore"), "accountTypeWithAccountTypeIdentifier:", a3);
    if (v5)
    {
      v5 = [[SUScriptAppleAccountType alloc] initWithACAccountType:v5];
      [(SUScriptObject *)self checkInScriptObject:v5];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    v5 = 0;
  }

  return v5;
}

- (id)makeClientAccessInfoWithAccountType:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_alloc_init(SUScriptACClientAccessInfo);
    [(SUScriptACClientAccessInfo *)v5 setAccountType:a3];
    [(SUScriptObject *)self checkInScriptObject:v5];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    v5 = 0;
  }

  return v5;
}

- (void)renewCredentialsForAccount:(id)a3 completionHandler:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a4)
    {
LABEL_8:
      [a4 setThisObject:self];
      id v7 = [(SUScriptAppleAccountStore *)self _accountStore];
      uint64_t v8 = [a3 nativeAccount];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __74__SUScriptAppleAccountStore_renewCredentialsForAccount_completionHandler___block_invoke;
      v10[3] = &unk_264814E38;
      v10[4] = self;
      v10[5] = a4;
      [v7 renewCredentialsForAccount:v8 completion:v10];

      return;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4 = [[SUScriptFunction alloc] initWithScriptObject:a4];
      goto LABEL_8;
    }
    uint64_t v9 = (void *)MEMORY[0x263F1FA90];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F1FA90];
  }

  [v9 throwException:@"Invalid argument"];
}

void __74__SUScriptAppleAccountStore_renewCredentialsForAccount_completionHandler___block_invoke(uint64_t a1, uint64_t a2, SUScriptError *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v14 = 138412802;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2112;
    uint64_t v19 = a3;
    LODWORD(v13) = 32;
    v12 = &v14;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
      free(v10);
      v12 = (int *)v11;
      SSFileLog();
    }
  }
  if (a3) {
    a3 = [[SUScriptError alloc] initWithError:a3];
  }
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(NSNumber, "numberWithInteger:", a2, v12), a3, 0));
  [*(id *)(a1 + 40) setThisObject:0];
}

- (void)requestAccessWithInfo:(id)a3 completionHandler:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a4)
    {
LABEL_8:
      [a4 setThisObject:self];
      int v7 = (void *)[a3 accountType];
      id v8 = [(SUScriptAppleAccountStore *)self _accountStore];
      uint64_t v9 = [v7 nativeAccountType];
      uint64_t v10 = [a3 accessInfoDictionary];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __69__SUScriptAppleAccountStore_requestAccessWithInfo_completionHandler___block_invoke;
      v12[3] = &unk_264813D98;
      v12[4] = self;
      v12[5] = a4;
      [v8 requestAccessToAccountsWithType:v9 options:v10 completion:v12];

      return;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4 = [[SUScriptFunction alloc] initWithScriptObject:a4];
      goto LABEL_8;
    }
    uint64_t v11 = (void *)MEMORY[0x263F1FA90];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F1FA90];
  }

  [v11 throwException:@"Invalid argument"];
}

void __69__SUScriptAppleAccountStore_requestAccessWithInfo_completionHandler___block_invoke(uint64_t a1, int a2, SUScriptError *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    id v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v13 = 138412546;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2112;
      __int16 v16 = a3;
      LODWORD(v12) = 22;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v13, v12);
        free(v10);
        SSFileLog();
      }
    }
  }
  if (a3) {
    a3 = [[SUScriptError alloc] initWithError:a3];
  }
  uint64_t v11 = (void *)MEMORY[0x263EFFB38];
  if (a2) {
    uint64_t v11 = (void *)MEMORY[0x263EFFB40];
  }
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *v11, a3, 0));
  [*(id *)(a1 + 40) setThisObject:0];
}

- (id)_className
{
  return @"iTunesAppleAccountStore";
}

- (SUScriptAppleAccount)activeStoreAccount
{
  id v3 = [(SUScriptAppleAccountStore *)self _accountStore];
  result = (SUScriptAppleAccount *)objc_msgSend(v3, "ams_activeiTunesAccount");
  if (result)
  {
    v5 = [[SUScriptAppleAccount alloc] initWithACAccount:result accountStore:v3];
    [(SUScriptObject *)self checkInScriptObject:v5];
    return v5;
  }
  return result;
}

- (SUScriptAppleAccount)primaryAppleAccount
{
  id v2 = [(SUScriptAppleAccountStore *)self _accountStore];
  result = (SUScriptAppleAccount *)objc_msgSend(v2, "aa_primaryAppleAccount");
  if (result)
  {
    objc_super v4 = [[SUScriptAppleAccount alloc] initWithACAccount:result accountStore:v2];
    return v4;
  }
  return result;
}

- (NSString)effectiveBundleID
{
  [(SUScriptObject *)self lock];
  id v3 = self->_effectiveBundleID;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setEffectiveBundleID:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    effectiveBundleID = self->_effectiveBundleID;
    if (effectiveBundleID != v5 && ![(NSString *)effectiveBundleID isEqualToString:v5])
    {

      self->_effectiveBundleID = (NSString *)[(NSString *)v5 copy];
      self->_accountStore = 0;
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  v5 = (NSString *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  int v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (NSString)accessPurposeRead
{
  return (NSString *)@"read";
}

- (NSString)accessPurposeReadWrite
{
  return (NSString *)@"read_write";
}

- (NSString)accessPurposeWrite
{
  return (NSString *)@"write";
}

- (NSString)accountTypeIdentifierTwitter
{
  return 0;
}

- (int64_t)renewResultFailed
{
  return 2;
}

- (int64_t)renewResultRejected
{
  return 1;
}

- (int64_t)renewResultRenewed
{
  return 0;
}

- (void)_accountStoreChangeNotification:(id)a3
{
}

- (id)_accountStore
{
  [(SUScriptObject *)self lock];
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    effectiveBundleID = self->_effectiveBundleID;
    v5 = (objc_class *)ISWeakLinkedClassForString();
    if (effectiveBundleID) {
      accountStore = (ACAccountStore *)[[v5 alloc] initWithEffectiveBundleID:self->_effectiveBundleID];
    }
    else {
      accountStore = (ACAccountStore *)objc_alloc_init(v5);
    }
    self->_accountStore = accountStore;
  }
  id v6 = accountStore;
  [(SUScriptObject *)self unlock];
  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_66, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_50, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountStore;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_66 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_50 = (uint64_t)sel_accountsWithAccountType_;
    *(void *)algn_2681B5698 = @"getAccountsWithAccountType";
    qword_2681B56A0 = (uint64_t)sel_accountTypeWithIdentifier_;
    unk_2681B56A8 = @"getAccountTypeWithIdentifier";
    qword_2681B56B0 = (uint64_t)sel_makeClientAccessInfoWithAccountType_;
    unk_2681B56B8 = @"createAccessInfo";
    qword_2681B56C0 = (uint64_t)sel_renewCredentialsForAccount_completionHandler_;
    unk_2681B56C8 = @"renewCredentials";
    qword_2681B56D0 = (uint64_t)sel_requestAccessWithInfo_completionHandler_;
    unk_2681B56D8 = @"requestAccess";
    __KeyMapping_66 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"activeStoreAccount", @"effectiveBundleID", @"effectiveBundleID", @"primaryAppleAccount", @"primaryAppleAccount", @"ACCESS_PURPOSE_READ", @"accessPurposeRead", @"ACCESS_PURPOSE_READ_WRITE", @"accessPurposeReadWrite", @"ACCESS_PURPOSE_WRITE", @"accessPurposeWrite", @"ACCOUNT_TYPE_IDENTIFIER_FACEBOOK", @"accountTypeIdentifierFacebook", @"ACCOUNT_TYPE_IDENTIFIER_SINA_WEIBO", @"accountTypeIdentifierSinaWeibo", @"ACCOUNT_TYPE_IDENTIFIER_TWITTER", @"accountTypeIdentifierTwitter",
                        @"RENEW_RESULT_FAILED",
                        @"renewResultFailed",
                        @"RENEW_RESULT_REJECTED",
                        @"renewResultRejected",
                        @"RENEW_RESULT_RENEWED",
                        @"renewResultRenewed",
                        0);
  }
}

@end