@interface SUIBSiriResponse
+ (BOOL)supportsSecureCoding;
- (SUIBSiriInAppResponse)inAppResponse;
- (SUIBSiriResponse)init;
- (SUIBSiriResponse)initWithBuilder:(id)a3;
- (SUIBSiriResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBSiriResponse

- (SUIBSiriResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBSiriResponseMutation *))a3;
  v11.receiver = self;
  v11.super_class = (Class)SUIBSiriResponse;
  v5 = [(SUIBSiriResponse *)&v11 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBSiriResponseMutation);
    v4[2](v4, v7);
    uint64_t v8 = [(SUIBSiriResponseMutation *)v7 inAppResponse];
    inAppResponse = v6->_inAppResponse;
    v6->_inAppResponse = (SUIBSiriInAppResponse *)v8;
  }
  return v6;
}

- (SUIBSiriResponse)init
{
  return [(SUIBSiriResponse *)self initWithBuilder:&__block_literal_global_6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBSiriResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBSiriResponse::inAppResponse"];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__SUIBSiriResponse_initWithCoder___block_invoke;
  v9[3] = &unk_265517FB0;
  id v10 = v5;
  id v6 = v5;
  v7 = [(SUIBSiriResponse *)self initWithBuilder:v9];

  return v7;
}

uint64_t __34__SUIBSiriResponse_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInAppResponse:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
}

- (SUIBSiriInAppResponse)inAppResponse
{
  return self->_inAppResponse;
}

- (void).cxx_destruct
{
}

@end