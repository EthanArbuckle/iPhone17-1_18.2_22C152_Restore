@interface RMProtocolEnrollReferralResponse
+ (id)requestWithReferralBaseURL:(id)a3;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseReferralBaseURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseReferralBaseURL:(id)a3;
@end

@implementation RMProtocolEnrollReferralResponse

+ (id)requestWithReferralBaseURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setResponseReferralBaseURL:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return [(RMModelPayloadBase *)self loadStringFromDictionary:a3 usingKey:@"ReferralBaseURL" forKeyPath:@"responseReferralBaseURL" isRequired:1 defaultValue:0 error:a5];
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMProtocolEnrollReferralResponse *)self responseReferralBaseURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ReferralBaseURL" value:v5 isRequired:1 defaultValue:0];

  v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMProtocolEnrollReferralResponse;
  v4 = [(RMModelPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responseReferralBaseURL copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)responseReferralBaseURL
{
  return self->_responseReferralBaseURL;
}

- (void)setResponseReferralBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end