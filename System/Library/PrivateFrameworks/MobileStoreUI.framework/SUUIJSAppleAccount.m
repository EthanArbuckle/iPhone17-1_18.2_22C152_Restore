@interface SUUIJSAppleAccount
- (ACAccount)nativeAccount;
- (NSString)DSID;
- (NSString)accountDescription;
- (NSString)identifier;
- (NSString)username;
- (SUUIJSAppleAccount)initWithACAccount:(id)a3;
@end

@implementation SUUIJSAppleAccount

- (SUUIJSAppleAccount)initWithACAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIJSAppleAccount;
  v6 = [(SUUIJSAppleAccount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (NSString)accountDescription
{
  return [(ACAccount *)self->_account accountDescription];
}

- (NSString)DSID
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

- (ACAccount)nativeAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativeAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end