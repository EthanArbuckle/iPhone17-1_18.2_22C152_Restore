@interface SURollbackOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelActiveUpdate;
- (BOOL)promptForConsent;
- (BOOL)promptForPasscode;
- (SURollbackOptions)init;
- (SURollbackOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelActiveUpdate:(BOOL)a3;
- (void)setPromptForConsent:(BOOL)a3;
- (void)setPromptForPasscode:(BOOL)a3;
@end

@implementation SURollbackOptions

- (SURollbackOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)SURollbackOptions;
  result = [(SUOptionsBase *)&v3 init];
  if (result)
  {
    result->_cancelActiveUpdate = 1;
    result->_promptForConsent = 1;
    result->_promptForPasscode = 1;
  }
  return result;
}

- (void)setCancelActiveUpdate:(BOOL)a3
{
  self->_cancelActiveUpdate = a3;
}

- (BOOL)cancelActiveUpdate
{
  return self->_cancelActiveUpdate;
}

- (void)setPromptForConsent:(BOOL)a3
{
  if (self->_promptForConsent != a3) {
    self->_promptForConsent = a3;
  }
}

- (BOOL)promptForConsent
{
  return self->_promptForConsent;
}

- (void)setPromptForPasscode:(BOOL)a3
{
  if (self->_promptForPasscode != a3) {
    self->_promptForPasscode = a3;
  }
}

- (BOOL)promptForPasscode
{
  return self->_promptForPasscode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SURollbackOptions;
  v5 = [(SUOptionsBase *)&v7 init];
  if (v5)
  {
    -[SURollbackOptions setCancelActiveUpdate:](v5, "setCancelActiveUpdate:", [v4 decodeBoolForKey:@"cancelActiveUpdate"]);
    -[SURollbackOptions setPromptForConsent:](v5, "setPromptForConsent:", [v4 decodeBoolForKey:@"promptForConsent"]);
    -[SURollbackOptions setPromptForPasscode:](v5, "setPromptForPasscode:", [v4 decodeBoolForKey:@"promptForPasscode"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions cancelActiveUpdate](self, "cancelActiveUpdate"), @"cancelActiveUpdate");
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions promptForConsent](self, "promptForConsent"), @"promptForConsent");
  objc_msgSend(v4, "encodeBool:forKey:", -[SURollbackOptions promptForPasscode](self, "promptForPasscode"), @"promptForPasscode");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCancelActiveUpdate:", -[SURollbackOptions cancelActiveUpdate](self, "cancelActiveUpdate"));
  objc_msgSend(v4, "setPromptForConsent:", -[SURollbackOptions promptForConsent](self, "promptForConsent"));
  objc_msgSend(v4, "setPromptForPasscode:", -[SURollbackOptions promptForPasscode](self, "promptForPasscode"));
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  if ([(SURollbackOptions *)self cancelActiveUpdate]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if ([(SURollbackOptions *)self promptForConsent]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(SURollbackOptions *)self promptForPasscode]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"        RollbackOptions:\n            CancelCurrentUpdate:%@\n                promptForConsent:%@\n                promptForPasscode:%@", v4, v5, v6];
}

@end