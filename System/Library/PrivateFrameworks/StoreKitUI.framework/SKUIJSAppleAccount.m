@interface SKUIJSAppleAccount
- (ACAccount)nativeAccount;
- (NSString)DSID;
- (NSString)accountDescription;
- (NSString)identifier;
- (NSString)username;
- (SKUIJSAppleAccount)initWithACAccount:(id)a3;
@end

@implementation SKUIJSAppleAccount

- (SKUIJSAppleAccount)initWithACAccount:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSAppleAccount initWithACAccount:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSAppleAccount;
  v6 = [(SKUIJSAppleAccount *)&v9 init];
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

- (void)initWithACAccount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSAppleAccount initWithACAccount:]";
}

@end