@interface SUScriptAppleAccount
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (ACAccount)nativeAccount;
- (ACAccountStore)nativeAccountStore;
- (NSString)accountDescription;
- (NSString)dsID;
- (NSString)identifier;
- (NSString)username;
- (SUScriptAppleAccount)initWithACAccount:(id)a3 accountStore:(id)a4;
- (SUScriptAppleAccountCredential)credential;
- (SUScriptAppleAccountType)accountType;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)reload;
- (void)setAgeVerificationExpirationDate:(id)a3 completionHandler:(id)a4;
@end

@implementation SUScriptAppleAccount

- (SUScriptAppleAccount)initWithACAccount:(id)a3 accountStore:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUScriptAppleAccount;
  v6 = [(SUScriptObject *)&v8 init];
  if (v6)
  {
    v6->_account = (ACAccount *)a3;
    v6->_accountStore = (ACAccountStore *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccount;
  [(SUScriptObject *)&v3 dealloc];
}

- (ACAccount)nativeAccount
{
  v2 = self->_account;

  return v2;
}

- (ACAccountStore)nativeAccountStore
{
  v2 = self->_accountStore;

  return v2;
}

- (void)reload
{
}

- (void)setAgeVerificationExpirationDate:(id)a3 completionHandler:(id)a4
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
      v7 = (void *)[a3 copyDate];
      [v7 timeIntervalSince1970];
      account = self->_account;
      uint64_t v10 = [NSNumber numberWithLongLong:(uint64_t)v8];
      [(ACAccount *)account ams_setAccountFlagValue:v10 forAccountFlag:*MEMORY[0x263F277C0]];
      v11 = (void *)[(ACAccountStore *)self->_accountStore ams_saveAccount:self->_account verifyCredentials:0];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __75__SUScriptAppleAccount_setAgeVerificationExpirationDate_completionHandler___block_invoke;
      v13[3] = &unk_264813D98;
      v13[4] = self;
      v13[5] = a4;
      [v11 addFinishBlock:v13];

      return;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4 = [[SUScriptFunction alloc] initWithScriptObject:a4];
      goto LABEL_8;
    }
  }
  v12 = (void *)MEMORY[0x263F1FA90];

  [v12 throwException:@"Invalid argument"];
}

void __75__SUScriptAppleAccount_setAgeVerificationExpirationDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, SUScriptError *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
      int v14 = 138412546;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2112;
      v17 = a3;
      LODWORD(v13) = 22;
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
  }
  if (a3) {
    a3 = [[SUScriptError alloc] initWithError:a3];
  }
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", objc_msgSend(NSNumber, "numberWithBool:", a2, v12), a3, 0));
  [*(id *)(a1 + 40) setThisObject:0];
}

- (NSString)accountDescription
{
  return [(ACAccount *)self->_account accountDescription];
}

- (SUScriptAppleAccountType)accountType
{
  objc_super v3 = [(ACAccount *)self->_account accountType];
  if (v3)
  {
    objc_super v3 = [[SUScriptAppleAccountType alloc] initWithACAccountType:v3];
    [(SUScriptObject *)self checkInScriptObject:v3];
  }

  return (SUScriptAppleAccountType *)v3;
}

- (id)_className
{
  return @"iTunesAppleAccount";
}

- (SUScriptAppleAccountCredential)credential
{
  objc_super v3 = [(ACAccount *)self->_account credential];
  if (v3)
  {
    objc_super v3 = [[SUScriptAppleAccountCredential alloc] initWithACAccountCredential:v3];
    [(SUScriptObject *)self checkInScriptObject:v3];
  }

  return (SUScriptAppleAccountCredential *)v3;
}

- (NSString)dsID
{
  return (NSString *)[(ACAccount *)self->_account aa_personID];
}

- (NSString)identifier
{
  return [(ACAccount *)self->_account identifier];
}

- (NSString)username
{
  return [(ACAccount *)self->_account username];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_68, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_51, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccount;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_68 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_51 = (uint64_t)sel_reload;
    *(void *)algn_2681B56F8 = @"reload";
    qword_2681B5700 = (uint64_t)sel_setAgeVerificationExpirationDate_completionHandler_;
    unk_2681B5708 = @"setAgeVerificationExpirationDate";
    __KeyMapping_68 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"accountDescription", @"accountType", @"accountType", @"credential", @"credential", @"dsID", @"dsID", @"identifier", @"identifier", @"username", @"username", 0);
  }
}

@end