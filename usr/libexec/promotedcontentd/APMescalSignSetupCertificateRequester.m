@interface APMescalSignSetupCertificateRequester
- (Class)responseClass;
- (id)protoBuffer;
@end

@implementation APMescalSignSetupCertificateRequester

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)protoBuffer
{
  v2 = objc_alloc_init(APPBMescalSignSAPSetupCertificateRequest);

  return v2;
}

@end