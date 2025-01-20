@interface PKAuthNotification
- (NSString)defaultUsername;
- (NSString)passwordField;
- (NSString)usernameField;
- (NSURLCredential)credential;
- (id)_makeDict;
- (unint64_t)_makeFlags;
- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4;
- (void)setDefaultUsername:(id)a3;
- (void)setPasswordField:(id)a3;
- (void)setUsernameField:(id)a3;
@end

@implementation PKAuthNotification

- (unint64_t)_makeFlags
{
  v7.receiver = self;
  v7.super_class = (Class)PKAuthNotification;
  unint64_t v3 = [(PKNotification *)&v7 _makeFlags];
  v4 = [(PKAuthNotification *)self usernameField];

  uint64_t v5 = 0x20000;
  if (!v4) {
    uint64_t v5 = 0x10000;
  }
  return v5 | v3;
}

- (id)_makeDict
{
  v16[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)PKAuthNotification;
  unint64_t v3 = [(PKNotification *)&v13 _makeDict];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(PKAuthNotification *)self usernameField];
  LODWORD(v3) = v5 == 0;

  if (v3)
  {
    v10 = PKLocalizedString(&cfstr_Password.isa, "Password placeholder text");
    v16[0] = v10;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  }
  else
  {
    uint64_t v6 = PKLocalizedString(&cfstr_UserName.isa, "Username placeholder text");
    v15[0] = v6;
    objc_super v7 = PKLocalizedString(&cfstr_Password.isa, "Password placeholder text");
    v15[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

    v9 = [(PKAuthNotification *)self defaultUsername];
    LOBYTE(v6) = v9 == 0;

    if (v6) {
      goto LABEL_6;
    }
    v10 = [(PKAuthNotification *)self defaultUsername];
    v14 = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F00030]];
  }
LABEL_6:
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F00028]];
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F79690]];
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F79698]];

  return v4;
}

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)usernameField
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUsernameField:(id)a3
{
}

- (NSString)passwordField
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPasswordField:(id)a3
{
}

- (NSString)defaultUsername
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDefaultUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUsername, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end