@interface CCDProvisionalEnrollmentRequestPayload
- (NSString)nonce;
- (id)action;
- (id)dictionary;
- (void)setNonce:(id)a3;
@end

@implementation CCDProvisionalEnrollmentRequestPayload

- (id)dictionary
{
  v7.receiver = self;
  v7.super_class = (Class)CCDProvisionalEnrollmentRequestPayload;
  v3 = [(CCDRequestPayload *)&v7 dictionary];
  v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  v5 = [(CCDProvisionalEnrollmentRequestPayload *)self nonce];
  [v4 setObject:v5 forKeyedSubscript:@"nonce"];

  return v4;
}

- (id)action
{
  return @"RequestProvisionalEnrollment";
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end