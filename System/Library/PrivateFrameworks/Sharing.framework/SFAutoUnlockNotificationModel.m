@interface SFAutoUnlockNotificationModel
+ (BOOL)supportsSecureCoding;
- (NSData)applicationIconData;
- (NSString)applicationName;
- (NSString)deviceName;
- (NSString)modelIdentifier;
- (NSString)navBarTitle;
- (NSString)subtitle;
- (SFAutoUnlockNotificationModel)initWithCoder:(id)a3;
- (SFAutoUnlockNotificationModel)initWithDeviceName:(id)a3 modelIdentifier:(id)a4 type:(int64_t)a5;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIconData:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation SFAutoUnlockNotificationModel

- (SFAutoUnlockNotificationModel)initWithDeviceName:(id)a3 modelIdentifier:(id)a4 type:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SFAutoUnlockNotificationModel;
  id v7 = a4;
  id v8 = a3;
  v9 = [(SFAutoUnlockNotificationModel *)&v15 init];
  uint64_t v10 = objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  deviceName = v9->_deviceName;
  v9->_deviceName = (NSString *)v10;

  uint64_t v12 = [v7 copy];
  modelIdentifier = v9->_modelIdentifier;
  v9->_modelIdentifier = (NSString *)v12;

  v9->_type = a5;
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFAutoUnlockNotificationModel *)self deviceName];
  v6 = NSStringFromSelector(sel_deviceName);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(SFAutoUnlockNotificationModel *)self modelIdentifier];
  id v8 = NSStringFromSelector(sel_modelIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(SFAutoUnlockNotificationModel *)self type];
  uint64_t v10 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v9 forKey:v10];

  v11 = [(SFAutoUnlockNotificationModel *)self subtitle];
  uint64_t v12 = NSStringFromSelector(sel_subtitle);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(SFAutoUnlockNotificationModel *)self applicationName];
  v14 = NSStringFromSelector(sel_applicationName);
  [v4 encodeObject:v13 forKey:v14];

  objc_super v15 = [(SFAutoUnlockNotificationModel *)self applicationIconData];
  v16 = NSStringFromSelector(sel_applicationIconData);
  [v4 encodeObject:v15 forKey:v16];

  id v18 = [(SFAutoUnlockNotificationModel *)self navBarTitle];
  v17 = NSStringFromSelector(sel_navBarTitle);
  [v4 encodeObject:v18 forKey:v17];
}

- (SFAutoUnlockNotificationModel)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_deviceName);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  int64_t v9 = NSStringFromSelector(sel_modelIdentifier);
  uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = NSStringFromSelector(sel_type);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_subtitle);
  objc_super v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_applicationName);
  id v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = objc_opt_class();
  v20 = NSStringFromSelector(sel_applicationIconData);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

  uint64_t v22 = objc_opt_class();
  v23 = NSStringFromSelector(sel_navBarTitle);
  v24 = [v4 decodeObjectOfClass:v22 forKey:v23];

  v25 = 0;
  if (v7 && v10)
  {
    self = [(SFAutoUnlockNotificationModel *)self initWithDeviceName:v7 modelIdentifier:v10 type:v12];
    [(SFAutoUnlockNotificationModel *)self setSubtitle:v15];
    [(SFAutoUnlockNotificationModel *)self setApplicationName:v18];
    [(SFAutoUnlockNotificationModel *)self setApplicationIconData:v21];
    [(SFAutoUnlockNotificationModel *)self setNavBarTitle:v24];
    v25 = self;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
}

- (NSData)applicationIconData
{
  return self->_applicationIconData;
}

- (void)setApplicationIconData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIconData, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end