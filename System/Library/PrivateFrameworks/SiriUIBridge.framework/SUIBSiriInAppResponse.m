@interface SUIBSiriInAppResponse
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (SUIBSiriInAppResponse)init;
- (SUIBSiriInAppResponse)initWithBuilder:(id)a3;
- (SUIBSiriInAppResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBSiriInAppResponse

- (SUIBSiriInAppResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBSiriInAppResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBSiriInAppResponse;
  v5 = [(SUIBSiriInAppResponse *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBSiriInAppResponseMutation);
    v4[2](v4, v7);
    v8 = [(SUIBSiriInAppResponseMutation *)v7 bundleIdentifier];
    uint64_t v9 = [v8 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v9;
  }
  return v6;
}

- (SUIBSiriInAppResponse)init
{
  return [(SUIBSiriInAppResponse *)self initWithBuilder:&__block_literal_global_5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBSiriInAppResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBSiriInAppResponse::bundleIdentifier"];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SUIBSiriInAppResponse_initWithCoder___block_invoke;
  v9[3] = &unk_265517F68;
  id v10 = v5;
  id v6 = v5;
  v7 = [(SUIBSiriInAppResponse *)self initWithBuilder:v9];

  return v7;
}

uint64_t __39__SUIBSiriInAppResponse_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end