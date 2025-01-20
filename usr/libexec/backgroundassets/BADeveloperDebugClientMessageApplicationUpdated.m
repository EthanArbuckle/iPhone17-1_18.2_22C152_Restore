@interface BADeveloperDebugClientMessageApplicationUpdated
+ (BOOL)supportsSecureCoding;
- (BADeveloperDebugClientMessageApplicationUpdated)initWithAppBundleIdentifier:(id)a3;
- (BADeveloperDebugClientMessageApplicationUpdated)initWithCoder:(id)a3;
- (NSString)appBundleIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BADeveloperDebugClientMessageApplicationUpdated

- (BADeveloperDebugClientMessageApplicationUpdated)initWithAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BADeveloperDebugClientMessageApplicationUpdated;
  v6 = [(BADeveloperDebugClientMessage *)&v9 initWithMessageOperation:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appBundleIdentifier, a3);
  }

  return v7;
}

- (BADeveloperDebugClientMessageApplicationUpdated)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BADeveloperDebugClientMessageApplicationUpdated;
  id v5 = [(BADeveloperDebugClientMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BAApplicationIdentifier"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BADeveloperDebugClientMessageApplicationUpdated;
  id v4 = a3;
  [(BADeveloperDebugClientMessage *)&v6 encodeWithCoder:v4];
  id v5 = [(BADeveloperDebugClientMessageApplicationUpdated *)self appBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"BAApplicationIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end