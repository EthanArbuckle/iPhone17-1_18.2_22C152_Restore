@interface SSUIShowScreenshotServiceRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)entitlement;
- (SSUIServiceOptions)options;
- (SSUIShowScreenshotServiceRequest)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SSUIShowScreenshotServiceRequest

+ (id)entitlement
{
  return SSUIShowScreenshotUIEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSUIShowScreenshotServiceRequest;
  id v4 = a3;
  [(SSUIServiceRequest *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(SSUIShowScreenshotServiceRequest *)self options];
  [v4 encodeObject:v5 forKey:@"SSUIServiceRequestOptions"];
}

- (SSUIShowScreenshotServiceRequest)initWithBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSUIShowScreenshotServiceRequest;
  id v3 = a3;
  id v4 = [(SSUIServiceRequest *)&v8 initWithBSXPCCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"SSUIServiceRequestOptions", v8.receiver, v8.super_class);

  options = v4->_options;
  v4->_options = (SSUIServiceOptions *)v5;

  return v4;
}

- (SSUIServiceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end