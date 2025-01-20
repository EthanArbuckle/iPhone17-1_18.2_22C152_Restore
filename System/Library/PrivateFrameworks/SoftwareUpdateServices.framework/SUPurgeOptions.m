@interface SUPurgeOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)notifyUser;
- (BOOL)userRequested;
- (SUPurgeOptions)init;
- (SUPurgeOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setNotifyUser:(BOOL)a3;
- (void)setUserRequested:(BOOL)a3;
@end

@implementation SUPurgeOptions

- (SUPurgeOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUPurgeOptions;
  result = [(SUOptionsBase *)&v3 init];
  if (result)
  {
    result->_notifyUser = 0;
    result->_userRequested = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUPurgeOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUPurgeOptions;
  v5 = [(SUOptionsBase *)&v7 init];
  if (v5)
  {
    -[SUPurgeOptions setNotifyUser:](v5, "setNotifyUser:", [v4 decodeBoolForKey:@"notify"]);
    -[SUPurgeOptions setUserRequested:](v5, "setUserRequested:", [v4 decodeBoolForKey:@"userRequested"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUPurgeOptions notifyUser](self, "notifyUser"), @"notify");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUPurgeOptions userRequested](self, "userRequested"), @"userRequested");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setNotifyUser:", -[SUPurgeOptions notifyUser](self, "notifyUser"));
  objc_msgSend(v4, "setUserRequested:", -[SUPurgeOptions userRequested](self, "userRequested"));
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  if ([(SUPurgeOptions *)self notifyUser]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if ([(SUPurgeOptions *)self userRequested]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"        SUPurgeOptions:\n        notifyUser:%@\n        userRequested:%@", v4, v5];
}

- (BOOL)notifyUser
{
  return self->_notifyUser;
}

- (void)setNotifyUser:(BOOL)a3
{
  self->_notifyUser = a3;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

@end