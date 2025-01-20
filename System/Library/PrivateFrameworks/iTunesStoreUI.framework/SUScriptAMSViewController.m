@interface SUScriptAMSViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)DSID;
- (NSString)URL;
- (SUScriptAMSViewController)initWithPrimaryAccount:(id)a3;
- (SUScriptAccount)primaryAccount;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setDSID:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUScriptAMSViewController

- (SUScriptAMSViewController)initWithPrimaryAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptAMSViewController;
  v6 = [(SUScriptObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_primaryAccount, a3);
  }

  return v7;
}

- (id)newNativeViewController
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  [(SUScriptObject *)self lock];
  v3 = [(objc_class *)getAMSUIWebViewControllerClass() bagSubProfile];
  v4 = [(objc_class *)getAMSUIWebViewControllerClass() bagSubProfileVersion];
  id v5 = (void *)MEMORY[0x263F27B40];
  v6 = [(objc_class *)getAMSUIWebViewControllerClass() bagKeySet];
  [v5 registerBagKeySet:v6 forProfile:v3 profileVersion:v4];

  v7 = [MEMORY[0x263F27B28] bagForProfile:v3 profileVersion:v4];
  DSID = self->_DSID;
  if (!DSID) {
    goto LABEL_31;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSString integerValue](DSID, "integerValue"));
  v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v11 = objc_msgSend(v10, "ams_iTunesAccountWithDSID:", v9);

  if (!v11)
  {
LABEL_31:
    v12 = [(SUScriptAMSViewController *)self primaryAccount];
    v13 = [v12 account];
    v14 = [v13 uniqueIdentifier];

    if (!v14
      || (objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore"),
          v15 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "ams_iTunesAccountWithDSID:", v14),
          v11 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          !v11))
    {
      v16 = [MEMORY[0x263F7B1F8] sharedConfig];
      if (!v16)
      {
        v16 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      v19 = [v16 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        v18 &= 2u;
      }
      if (v18)
      {
        v20 = objc_opt_class();
        v21 = self->_DSID;
        *(_DWORD *)v38 = 138543618;
        *(void *)&v38[4] = v20;
        *(_WORD *)&v38[12] = 2112;
        *(void *)&v38[14] = v21;
        id v22 = v20;
        LODWORD(v37) = 22;
        v36 = v38;
        v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23)
        {
LABEL_16:

          v11 = 0;
          goto LABEL_17;
        }
        v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, v38, v37, *(_OWORD *)v38, *(void *)&v38[16]);
        free(v23);
        v36 = v19;
        SSFileLog();
      }

      goto LABEL_16;
    }
  }
LABEL_17:
  v24 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v36);
  if (!v24)
  {
    v24 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v25 = [v24 shouldLog];
  if ([v24 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  v27 = [v24 OSLogObject];
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
    v26 &= 2u;
  }
  if (!v26) {
    goto LABEL_27;
  }
  v28 = objc_opt_class();
  URL = self->_URL;
  *(_DWORD *)v38 = 138543874;
  *(void *)&v38[4] = v28;
  *(_WORD *)&v38[12] = 2112;
  *(void *)&v38[14] = URL;
  *(_WORD *)&v38[22] = 2112;
  v39 = v11;
  id v30 = v28;
  LODWORD(v37) = 32;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, v38, v37);
    free(v31);
    SSFileLog();
LABEL_27:
  }
  v32 = (void *)[objc_alloc(getAMSUIWebViewControllerClass()) initWithBag:v7 account:v11 clientInfo:0];
  v33 = [NSURL URLWithString:self->_URL];
  id v34 = (id)[v32 loadURL:v33];

  [(SUScriptObject *)self unlock];
  return v32;
}

- (id)_className
{
  return @"iTunesAMSViewController";
}

- (NSString)DSID
{
  [(SUScriptObject *)self lock];
  v3 = self->_DSID;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (void)setDSID:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    v4 = (NSString *)[v6 copy];
    DSID = self->_DSID;
    self->_DSID = v4;

    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (void)setURL:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    v4 = (NSString *)[v6 copy];
    URL = self->_URL;
    self->_URL = v4;

    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (NSString)URL
{
  [(SUScriptObject *)self lock];
  v3 = self->_URL;
  [(SUScriptObject *)self unlock];

  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_81 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptAMSViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_61, 0);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptAMSViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptAMSViewController;
  v2 = [(SUScriptViewController *)&v5 scriptAttributeKeys];
  v3 = [(id)__KeyMapping_81 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __KeyMapping_81 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"DSID", @"URL", @"URL", 0);
    MEMORY[0x270F9A758]();
  }
}

- (SUScriptAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_DSID, 0);
}

@end