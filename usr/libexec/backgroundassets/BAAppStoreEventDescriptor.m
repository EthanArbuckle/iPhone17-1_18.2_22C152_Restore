@interface BAAppStoreEventDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithAppBundleIdentifier:(id)a3 appBundleURL:(id)a4 event:(unint64_t)a5 client:(unint64_t)a6;
+ (id)new;
- (BAAppStoreEventDescriptor)init;
- (BAAppStoreEventDescriptor)initWithCoder:(id)a3;
- (BOOL)automaticInstall;
- (BOOL)userInitiated;
- (NSString)appBundleIdentifier;
- (NSURL)appBundleURL;
- (unint64_t)clientType;
- (unint64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticInstall:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation BAAppStoreEventDescriptor

- (BAAppStoreEventDescriptor)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appBundleURL:(id)a4 event:(unint64_t)a5 client:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = sub_1000130C8((id *)[BAAppStoreEventDescriptor alloc], v10, v9, (void *)a5, (void *)a6);

  return v11;
}

- (BAAppStoreEventDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BAAppStoreEventDescriptor;
  v5 = [(BAAppStoreEventDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleURL"];
    appBundleURL = v5->_appBundleURL;
    v5->_appBundleURL = (NSURL *)v8;

    v5->_eventType = (unint64_t)[v4 decodeIntegerForKey:@"eventType"];
    v5->_clientType = (unint64_t)[v4 decodeIntegerForKey:@"clientType"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_automaticInstall = [v4 decodeBoolForKey:@"automaticInstall"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BAAppStoreEventDescriptor *)self appBundleIdentifier];
  [v6 encodeObject:v4 forKey:@"appBundleIdentifier"];

  v5 = [(BAAppStoreEventDescriptor *)self appBundleURL];
  [v6 encodeObject:v5 forKey:@"appBundleURL"];

  [v6 encodeInteger:-[BAAppStoreEventDescriptor eventType](self, "eventType") forKey:@"eventType"];
  [v6 encodeInteger:-[BAAppStoreEventDescriptor clientType](self, "clientType") forKey:@"clientType"];
  [v6 encodeBool:-[BAAppStoreEventDescriptor userInitiated](self, "userInitiated") forKey:@"userInitiated"];
  [v6 encodeBool:-[BAAppStoreEventDescriptor automaticInstall](self, "automaticInstall") forKey:@"automaticInstall"];
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)automaticInstall
{
  return self->_automaticInstall;
}

- (void)setAutomaticInstall:(BOOL)a3
{
  self->_automaticInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleURL, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end