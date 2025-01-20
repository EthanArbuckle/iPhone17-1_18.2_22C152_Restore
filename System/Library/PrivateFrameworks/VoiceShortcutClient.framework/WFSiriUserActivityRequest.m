@interface WFSiriUserActivityRequest
+ (BOOL)supportsSecureCoding;
- (NSData)userActivityData;
- (NSString)bundleIdentifier;
- (NSUserActivity)userActivity;
- (WFSiriUserActivityRequest)initWithCoder:(id)a3;
- (WFSiriUserActivityRequest)initWithUserActivityData:(id)a3 andBundleIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setUserActivityData:(id)a3;
@end

@implementation WFSiriUserActivityRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setUserActivityData:(id)a3
{
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (NSUserActivity)userActivity
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:self->_userActivityData];
  return (NSUserActivity *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFSiriUserActivityRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v7 encodeWithCoder:v4];
  v5 = [(WFSiriUserActivityRequest *)self userActivityData];
  [v4 encodeObject:v5 forKey:@"userActivityData"];

  v6 = [(WFSiriUserActivityRequest *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];
}

- (WFSiriUserActivityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriUserActivityRequest;
  v5 = [(WFSiriActionRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (WFSiriUserActivityRequest)initWithUserActivityData:(id)a3 andBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFSiriUserActivityRequest;
  v9 = [(WFSiriActionRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivityData, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end