@interface WFAppProtectionDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (WFAppProtectionDialogRequest)initWithAppBundleIdentifier:(id)a3;
- (WFAppProtectionDialogRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppProtectionDialogRequest

- (void).cxx_destruct
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (WFAppProtectionDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAppProtectionDialogRequest;
  v5 = [(WFDialogRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAppProtectionDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFAppProtectionDialogRequest *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];
}

- (WFAppProtectionDialogRequest)initWithAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  objc_super v6 = [[WFDialogAttribution alloc] initWithTitle:0 icon:0];
  v10.receiver = self;
  v10.super_class = (Class)WFAppProtectionDialogRequest;
  v7 = [(WFDialogRequest *)&v10 initWithAttribution:v6 prompt:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end