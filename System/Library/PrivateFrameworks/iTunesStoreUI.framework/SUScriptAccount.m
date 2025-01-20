@interface SUScriptAccount
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)isManagedAppleID;
- (BOOL)isPrimaryAccount;
- (BOOL)isSecureTokenValid;
- (NSNumber)dsID;
- (NSString)ITunesPassSerialNumber;
- (NSString)credits;
- (NSString)identifier;
- (NSString)kind;
- (SSAccount)account;
- (SUScriptAccount)init;
- (id)_className;
- (id)isPrimaryLockerAccount;
- (id)lockerEnabled;
- (id)purchaseHistoryEnabled;
- (id)scriptAttributeKeys;
- (id)socialEnabled;
- (void)_commitChanges;
- (void)_setServiceType:(int64_t)a3 enabled:(id)a4;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setCredits:(id)a3;
- (void)setDsID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKind:(id)a3;
- (void)setLockerEnabled:(id)a3;
- (void)setPurchaseHistoryEnabled:(id)a3;
- (void)setSecureToken:(id)a3;
- (void)setSocialEnabled:(id)a3;
@end

@implementation SUScriptAccount

- (SUScriptAccount)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccount;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    v2->_account = (SSAccount *)objc_alloc_init(MEMORY[0x263F7B0E0]);
  }
  return v2;
}

- (void)dealloc
{
  self->_account = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAccount;
  [(SUScriptObject *)&v3 dealloc];
}

- (SSAccount)account
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_account;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setAccount:(id)a3
{
  [(SUScriptObject *)self lock];
  account = self->_account;
  if (account != a3)
  {

    self->_account = (SSAccount *)a3;
  }

  [(SUScriptObject *)self unlock];
}

- (BOOL)isManagedAppleID
{
  return [(SSAccount *)self->_account isManagedAppleID];
}

- (BOOL)isPrimaryAccount
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  objc_super v4 = [(SUScriptAccount *)self dsID];

  return [v3 isEqual:v4];
}

- (BOOL)isSecureTokenValid
{
  return objc_msgSend((id)-[SSAccount secureToken](-[SUScriptAccount account](self, "account"), "secureToken"), "length") != 0;
}

- (void)setSecureToken:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (id v5 = a3, [a3 length]))
  {
LABEL_7:
    [(SSAccount *)[(SUScriptAccount *)self account] setSecureToken:v5];
    [MEMORY[0x263F7B0E8] resetExpiration];
    [(SUScriptAccount *)self _commitChanges];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (id)_className
{
  return @"iTunesAccount";
}

- (NSString)credits
{
  v2 = [(SUScriptAccount *)self account];

  return (NSString *)[(SSAccount *)v2 creditsString];
}

- (NSNumber)dsID
{
  v2 = [(SUScriptAccount *)self account];

  return (NSNumber *)[(SSAccount *)v2 uniqueIdentifier];
}

- (NSString)identifier
{
  v2 = [(SUScriptAccount *)self account];

  return (NSString *)[(SSAccount *)v2 accountName];
}

- (id)isPrimaryLockerAccount
{
  int v2 = [(SSAccount *)[(SUScriptAccount *)self account] isActiveLockerAccount];
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (NSString)kind
{
  int v2 = [(SUScriptAccount *)self account];
  if ([(SSAccount *)v2 uniqueIdentifier])
  {
    if ([(SSAccount *)v2 accountKind] == 1) {
      return (NSString *)@"aol";
    }
    else {
      return (NSString *)@"apple";
    }
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x263EFF9D0];
    return (NSString *)[v4 null];
  }
}

- (NSString)ITunesPassSerialNumber
{
  int v2 = [(SUScriptAccount *)self account];

  return (NSString *)[(SSAccount *)v2 ITunesPassSerialNumber];
}

- (id)lockerEnabled
{
  char v2 = [(SSAccount *)[(SUScriptAccount *)self account] enabledServiceTypes];
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if ((v2 & 4) == 0) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)purchaseHistoryEnabled
{
  char v2 = [(SSAccount *)[(SUScriptAccount *)self account] enabledServiceTypes];
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if ((v2 & 2) == 0) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (void)setCredits:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SSAccount *)[(SUScriptAccount *)self account] setCreditsString:v5];
    [(SUScriptAccount *)self _commitChanges];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setDsID:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  uint64_t v5 = SSGetUnsignedLongLongFromValue();
  uint64_t v6 = v5;
  if (a3 && !v5)
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    v8 = @"Invalid argument";
LABEL_11:
    [v7 throwException:v8];
    return;
  }
  v9 = [(SUScriptAccount *)self account];
  v10 = v9;
  if (a3)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v6];
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "accountWithUniqueIdentifier:", v11);
    if (v12 && (SSAccount *)v12 != v10)
    {
      v7 = (void *)MEMORY[0x263F1FA90];
      v8 = @"A different account already exists for the DSID";
      goto LABEL_11;
    }
    v9 = v10;
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(SSAccount *)v9 setUniqueIdentifier:v13];

  [(SUScriptAccount *)self _commitChanges];
}

- (void)setIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SSAccount *)[(SUScriptAccount *)self account] setAccountName:v5];
    [(SUScriptAccount *)self _commitChanges];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setKind:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isEqualToString:@"aol"])
    {
      id v5 = [(SUScriptAccount *)self account];
      uint64_t v6 = 1;
LABEL_7:
      [(SSAccount *)v5 setAccountKind:v6];
      [(SUScriptAccount *)self _commitChanges];
      return;
    }
    if ([a3 isEqualToString:@"apple"])
    {
      id v5 = [(SUScriptAccount *)self account];
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x263F1FA90];
    v8 = @"Unknown kind";
  }
  else
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    v8 = @"Invalid argument";
  }

  [v7 throwException:v8];
}

- (void)setLockerEnabled:(id)a3
{
}

- (void)setPurchaseHistoryEnabled:(id)a3
{
}

- (void)setSocialEnabled:(id)a3
{
}

- (id)socialEnabled
{
  char v2 = [(SSAccount *)[(SUScriptAccount *)self account] enabledServiceTypes];
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if ((v2 & 1) == 0) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (void)_commitChanges
{
  char v2 = [(SUScriptAccount *)self account];
  if ([(SSAccount *)v2 uniqueIdentifier])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7B0E8] defaultStore];
    [v3 addAccount:v2];
  }
}

- (void)_setServiceType:(int64_t)a3 enabled:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    int v7 = [a4 BOOLValue];
    v8 = [(SUScriptAccount *)self account];
    if (v7) {
      [(SSAccount *)v8 addEnabledServiceTypes:a3];
    }
    else {
      [(SSAccount *)v8 removeEnabledServiceTypes:a3];
    }
    [(SUScriptAccount *)self _commitChanges];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F1FA90];
    [v9 throwException:@"Invalid argument"];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_14, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_11, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccount;
  char v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_14 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_11 = (uint64_t)sel_isManagedAppleID;
    unk_2681B49B0 = @"isManagedAppleID";
    qword_2681B49B8 = (uint64_t)sel_isPrimaryAccount;
    unk_2681B49C0 = @"isPrimaryAccount";
    qword_2681B49C8 = (uint64_t)sel_isSecureTokenValid;
    unk_2681B49D0 = @"isSecureTokenValid";
    qword_2681B49D8 = (uint64_t)sel_setSecureToken_;
    unk_2681B49E0 = @"setSecureToken";
    __KeyMapping_14 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"credits", @"dsID", @"dsID", @"identifier", @"identifier", @"isPrimaryLockerAccount", @"isPrimaryLockerAccount", @"ITunesPassSerialNumber", @"ITunesPassSerialNumber", @"kind", @"kind", @"lockerEnabled", @"lockerEnabled", @"purchaseHistoryEnabled", @"purchaseHistoryEnabled", @"socialEnabled", @"socialEnabled",
                        0);
  }
}

@end