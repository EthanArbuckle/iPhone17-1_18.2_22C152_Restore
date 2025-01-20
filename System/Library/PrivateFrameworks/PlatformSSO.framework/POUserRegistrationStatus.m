@interface POUserRegistrationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isActionButtonEnabled;
- (BOOL)isAuthenticateButtonEnabled;
- (BOOL)isPlatformSSOEnabled;
- (NSString)loginUserName;
- (POUserRegistrationStatus)initWithCoder:(id)a3;
- (id)description;
- (int64_t)actionButtonAction;
- (int64_t)authenticationMethod;
- (int64_t)userRegistrationStatus;
- (int64_t)userTokenStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setActionButtonAction:(int64_t)a3;
- (void)setActionButtonEnabled:(BOOL)a3;
- (void)setAuthenticateButtonEnabled:(BOOL)a3;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setLoginUserName:(id)a3;
- (void)setPlatformSSOEnabled:(BOOL)a3;
- (void)setUserRegistrationStatus:(int64_t)a3;
- (void)setUserTokenStatus:(int64_t)a3;
@end

@implementation POUserRegistrationStatus

- (id)description
{
  v19[8] = *MEMORY[0x263EF8340];
  if (self->_platformSSOEnabled) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v19[0] = v3;
  v18[0] = @"platformSSOEnabled";
  v18[1] = @"loginUserName";
  uint64_t v4 = [MEMORY[0x263F5E600] maskName:self->_loginUserName];
  v5 = (void *)v4;
  v6 = @"nil";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v19[1] = v6;
  v18[2] = @"authenticationMethod";
  v7 = [MEMORY[0x263F5E5F0] stringForLoginType:self->_authenticationMethod];
  v19[2] = v7;
  v18[3] = @"userRegistrationStatus";
  uint64_t v8 = +[POConstantUtil stringForRegistrationStatus:self->_userRegistrationStatus];
  v9 = (void *)v8;
  if (self->_actionButtonEnabled) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v19[3] = v8;
  v19[4] = v10;
  v18[4] = @"actionButtonEnabled";
  v18[5] = @"actionButtonAction";
  v11 = +[POConstantUtil stringForUserAction:self->_actionButtonAction];
  v19[5] = v11;
  v18[6] = @"userTokenStatus";
  uint64_t v12 = +[POConstantUtil stringForTokenStatus:self->_userTokenStatus];
  v13 = (void *)v12;
  v18[7] = @"authenticateButtonEnabled";
  if (self->_authenticateButtonEnabled) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  v19[6] = v12;
  v19[7] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:8];
  v16 = [v15 description];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserRegistrationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)POUserRegistrationStatus;
  v5 = [(POUserRegistrationStatus *)&v32 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_isPlatformSSOEnabled);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    v5->_platformSSOEnabled = [v8 BOOLValue];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_loginUserName);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    loginUserName = v5->_loginUserName;
    v5->_loginUserName = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_authenticationMethod);
    v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    v5->_authenticationMethod = (int)[v15 intValue];

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_userRegistrationStatus);
    v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    v5->_userRegistrationStatus = (int)[v18 intValue];

    uint64_t v19 = objc_opt_class();
    v20 = NSStringFromSelector(sel_isActionButtonEnabled);
    v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    v5->_actionButtonEnabled = [v21 BOOLValue];

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_actionButtonAction);
    v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    v5->_actionButtonAction = (int)[v24 intValue];

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_userTokenStatus);
    v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    v5->_userTokenStatus = (int)[v27 intValue];

    uint64_t v28 = objc_opt_class();
    v29 = NSStringFromSelector(sel_isAuthenticateButtonEnabled);
    v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
    v5->_authenticateButtonEnabled = [v30 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL platformSSOEnabled = self->_platformSSOEnabled;
  id v6 = a3;
  v7 = [v4 numberWithBool:platformSSOEnabled];
  uint64_t v8 = NSStringFromSelector(sel_isPlatformSSOEnabled);
  [v6 encodeObject:v7 forKey:v8];

  loginUserName = self->_loginUserName;
  v10 = NSStringFromSelector(sel_loginUserName);
  [v6 encodeObject:loginUserName forKey:v10];

  uint64_t v11 = [NSNumber numberWithInteger:self->_authenticationMethod];
  uint64_t v12 = NSStringFromSelector(sel_authenticationMethod);
  [v6 encodeObject:v11 forKey:v12];

  uint64_t v13 = [NSNumber numberWithInteger:self->_userRegistrationStatus];
  v14 = NSStringFromSelector(sel_userRegistrationStatus);
  [v6 encodeObject:v13 forKey:v14];

  v15 = [NSNumber numberWithBool:self->_actionButtonEnabled];
  uint64_t v16 = NSStringFromSelector(sel_isActionButtonEnabled);
  [v6 encodeObject:v15 forKey:v16];

  v17 = [NSNumber numberWithInteger:self->_actionButtonAction];
  v18 = NSStringFromSelector(sel_actionButtonAction);
  [v6 encodeObject:v17 forKey:v18];

  uint64_t v19 = [NSNumber numberWithInteger:self->_userTokenStatus];
  v20 = NSStringFromSelector(sel_userTokenStatus);
  [v6 encodeObject:v19 forKey:v20];

  id v22 = [NSNumber numberWithBool:self->_authenticateButtonEnabled];
  v21 = NSStringFromSelector(sel_isAuthenticateButtonEnabled);
  [v6 encodeObject:v22 forKey:v21];
}

- (BOOL)isPlatformSSOEnabled
{
  return self->_platformSSOEnabled;
}

- (void)setPlatformSSOEnabled:(BOOL)a3
{
  self->_BOOL platformSSOEnabled = a3;
}

- (NSString)loginUserName
{
  return self->_loginUserName;
}

- (void)setLoginUserName:(id)a3
{
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (int64_t)userRegistrationStatus
{
  return self->_userRegistrationStatus;
}

- (void)setUserRegistrationStatus:(int64_t)a3
{
  self->_userRegistrationStatus = a3;
}

- (BOOL)isActionButtonEnabled
{
  return self->_actionButtonEnabled;
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  self->_actionButtonEnabled = a3;
}

- (int64_t)actionButtonAction
{
  return self->_actionButtonAction;
}

- (void)setActionButtonAction:(int64_t)a3
{
  self->_actionButtonAction = a3;
}

- (int64_t)userTokenStatus
{
  return self->_userTokenStatus;
}

- (void)setUserTokenStatus:(int64_t)a3
{
  self->_userTokenStatus = a3;
}

- (BOOL)isAuthenticateButtonEnabled
{
  return self->_authenticateButtonEnabled;
}

- (void)setAuthenticateButtonEnabled:(BOOL)a3
{
  self->_authenticateButtonEnabled = a3;
}

- (void).cxx_destruct
{
}

@end