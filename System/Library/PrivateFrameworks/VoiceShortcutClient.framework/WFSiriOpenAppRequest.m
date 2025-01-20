@interface WFSiriOpenAppRequest
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (WFSiriOpenAppRequest)initWithBundleIdentifier:(id)a3;
- (WFSiriOpenAppRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriOpenAppRequest

- (void).cxx_destruct
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriOpenAppRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriOpenAppRequest *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];
}

- (WFSiriOpenAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenAppRequest;
  v5 = [(WFSiriActionRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriOpenAppRequest)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenAppRequest;
  uint64_t v6 = [(WFSiriActionRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end