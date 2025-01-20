@interface PODeviceRegistrationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isActionButtonEnabled;
- (BOOL)isPlatformSSOEnabled;
- (NSString)accountName;
- (NSString)registeredBundleIdentifier;
- (NSString)registeredExtensionName;
- (PODeviceRegistrationStatus)initWithCoder:(id)a3;
- (id)description;
- (int64_t)actionButtonAction;
- (int64_t)deviceRegistrationStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setActionButtonAction:(int64_t)a3;
- (void)setActionButtonEnabled:(BOOL)a3;
- (void)setDeviceRegistrationStatus:(int64_t)a3;
- (void)setPlatformSSOEnabled:(BOOL)a3;
- (void)setRegisteredBundleIdentifier:(id)a3;
- (void)setRegisteredExtensionName:(id)a3;
@end

@implementation PODeviceRegistrationStatus

- (id)description
{
  v17[7] = *MEMORY[0x263EF8340];
  if (self->_platformSSOEnabled) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v16[0] = @"platformSSOEnabled";
  v16[1] = @"accountName";
  registeredBundleIdentifier = @"nil";
  accountName = (__CFString *)self->_accountName;
  registeredExtensionName = self->_registeredExtensionName;
  if (!accountName) {
    accountName = @"nil";
  }
  v17[0] = v3;
  v17[1] = accountName;
  if (registeredExtensionName) {
    v7 = (__CFString *)registeredExtensionName;
  }
  else {
    v7 = @"nil";
  }
  v16[2] = @"registeredExtensionName";
  v16[3] = @"registeredBundleIdentifier";
  int64_t deviceRegistrationStatus = self->_deviceRegistrationStatus;
  if (self->_registeredBundleIdentifier) {
    registeredBundleIdentifier = (__CFString *)self->_registeredBundleIdentifier;
  }
  v17[2] = v7;
  v17[3] = registeredBundleIdentifier;
  v16[4] = @"deviceRegistrationStatus";
  uint64_t v9 = +[POConstantUtil stringForRegistrationStatus:deviceRegistrationStatus];
  v10 = (void *)v9;
  if (self->_actionButtonEnabled) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v17[4] = v9;
  v17[5] = v11;
  v16[5] = @"actionButtonEnabled";
  v16[6] = @"actionButtonAction";
  v12 = +[POConstantUtil stringForDeviceAction:self->_actionButtonAction];
  v17[6] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7];
  v14 = [v13 description];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PODeviceRegistrationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PODeviceRegistrationStatus;
  v5 = [(PODeviceRegistrationStatus *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_isPlatformSSOEnabled);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    v5->_platformSSOEnabled = [v8 BOOLValue];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_accountName);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_registeredExtensionName);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    registeredExtensionName = v5->_registeredExtensionName;
    v5->_registeredExtensionName = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_registeredBundleIdentifier);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    registeredBundleIdentifier = v5->_registeredBundleIdentifier;
    v5->_registeredBundleIdentifier = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_deviceRegistrationStatus);
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    v5->_int64_t deviceRegistrationStatus = (int)[v23 intValue];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector(sel_isActionButtonEnabled);
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    v5->_actionButtonEnabled = [v26 BOOLValue];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_actionButtonAction);
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    v5->_actionButtonAction = (int)[v29 intValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL platformSSOEnabled = self->_platformSSOEnabled;
  id v6 = a3;
  v7 = [v4 numberWithBool:platformSSOEnabled];
  v8 = NSStringFromSelector(sel_isPlatformSSOEnabled);
  [v6 encodeObject:v7 forKey:v8];

  registeredExtensionName = self->_registeredExtensionName;
  v10 = NSStringFromSelector(sel_registeredExtensionName);
  [v6 encodeObject:registeredExtensionName forKey:v10];

  accountName = self->_accountName;
  v12 = NSStringFromSelector(sel_accountName);
  [v6 encodeObject:accountName forKey:v12];

  registeredBundleIdentifier = self->_registeredBundleIdentifier;
  v14 = NSStringFromSelector(sel_registeredBundleIdentifier);
  [v6 encodeObject:registeredBundleIdentifier forKey:v14];

  uint64_t v15 = [NSNumber numberWithInteger:self->_deviceRegistrationStatus];
  v16 = NSStringFromSelector(sel_deviceRegistrationStatus);
  [v6 encodeObject:v15 forKey:v16];

  uint64_t v17 = [NSNumber numberWithBool:self->_actionButtonEnabled];
  v18 = NSStringFromSelector(sel_isActionButtonEnabled);
  [v6 encodeObject:v17 forKey:v18];

  id v20 = [NSNumber numberWithInteger:self->_actionButtonAction];
  uint64_t v19 = NSStringFromSelector(sel_actionButtonAction);
  [v6 encodeObject:v20 forKey:v19];
}

- (BOOL)isPlatformSSOEnabled
{
  return self->_platformSSOEnabled;
}

- (void)setPlatformSSOEnabled:(BOOL)a3
{
  self->_BOOL platformSSOEnabled = a3;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSString)registeredExtensionName
{
  return self->_registeredExtensionName;
}

- (void)setRegisteredExtensionName:(id)a3
{
}

- (NSString)registeredBundleIdentifier
{
  return self->_registeredBundleIdentifier;
}

- (void)setRegisteredBundleIdentifier:(id)a3
{
}

- (int64_t)deviceRegistrationStatus
{
  return self->_deviceRegistrationStatus;
}

- (void)setDeviceRegistrationStatus:(int64_t)a3
{
  self->_int64_t deviceRegistrationStatus = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_registeredExtensionName, 0);

  objc_storeStrong((id *)&self->_accountName, 0);
}

@end