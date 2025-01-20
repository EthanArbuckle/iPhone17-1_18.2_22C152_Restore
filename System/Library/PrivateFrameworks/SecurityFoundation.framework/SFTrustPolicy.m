@interface SFTrustPolicy
- (BOOL)evaluateCertificateChain:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SFTrustPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (BOOL)evaluateCertificateChain:(id)a3 error:(id *)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end