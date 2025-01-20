@interface SFTrustEvaluator
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCertificateFetching;
- (BOOL)trustSystemAnchorCertificates;
- (NSArray)applicationAnchorCertificates;
- (SFRevocationPolicy)revocationPolicy;
- (SFTrustEvaluator)init;
- (SFTrustEvaluator)initWithCoder:(id)a3;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4 applicationAnchorCertificates:(id)a5 allowCertificateFetching:(BOOL)a6 trustSystemAnchorCertificates:(BOOL)a7;
- (SFTrustPolicy)trustPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowCertificateFetching:(BOOL)a3;
- (void)setApplicationAnchorCertificates:(id)a3;
- (void)setRevocationPolicy:(id)a3;
- (void)setTrustPolicy:(id)a3;
- (void)setTrustSystemAnchorCertificates:(BOOL)a3;
@end

@implementation SFTrustEvaluator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTrustEvaluator)init
{
  v3 = objc_alloc_init(SFX509TrustPolicy);
  v4 = [(SFTrustEvaluator *)self initWithTrustPolicy:v3];

  return v4;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SFRevocationPolicy);
  v6 = [(SFTrustEvaluator *)self initWithTrustPolicy:v4 revocationPolicy:v5];

  return v6;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4
{
  return [(SFTrustEvaluator *)self initWithTrustPolicy:a3 revocationPolicy:a4 applicationAnchorCertificates:MEMORY[0x1E4F1CBF0] allowCertificateFetching:1 trustSystemAnchorCertificates:1];
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4 applicationAnchorCertificates:(id)a5 allowCertificateFetching:(BOOL)a6 trustSystemAnchorCertificates:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFTrustEvaluator;
  v16 = [(SFTrustEvaluator *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)v16->_trustEvaluatorInternal + 1, a3);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 2, a4);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 3, a5);
    *((unsigned char *)v17->_trustEvaluatorInternal + 32) = *((unsigned char *)v17->_trustEvaluatorInternal + 32) & 0xFE | a6;
    if (v7) {
      char v18 = 2;
    }
    else {
      char v18 = 0;
    }
    *((unsigned char *)v17->_trustEvaluatorInternal + 32) = *((unsigned char *)v17->_trustEvaluatorInternal + 32) & 0xFD | v18;
  }

  return v17;
}

- (SFTrustEvaluator)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFTrustEvaluator;
  return [(SFTrustEvaluator *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  trustEvaluatorInternal = self->_trustEvaluatorInternal;
  uint64_t v6 = trustEvaluatorInternal[1];
  uint64_t v7 = trustEvaluatorInternal[2];
  uint64_t v8 = trustEvaluatorInternal[3];
  unsigned int v9 = *((unsigned __int8 *)trustEvaluatorInternal + 32);
  return (id)[v4 initWithTrustPolicy:v6 revocationPolicy:v7 applicationAnchorCertificates:v8 allowCertificateFetching:v9 & 1 trustSystemAnchorCertificates:(v9 >> 1) & 1];
}

- (SFTrustPolicy)trustPolicy
{
  return self->_trustPolicy;
}

- (void)setTrustPolicy:(id)a3
{
}

- (SFRevocationPolicy)revocationPolicy
{
  return self->_revocationPolicy;
}

- (void)setRevocationPolicy:(id)a3
{
}

- (NSArray)applicationAnchorCertificates
{
  return self->_applicationAnchorCertificates;
}

- (void)setApplicationAnchorCertificates:(id)a3
{
}

- (BOOL)allowCertificateFetching
{
  return self->_allowCertificateFetching;
}

- (void)setAllowCertificateFetching:(BOOL)a3
{
  self->_allowCertificateFetching = a3;
}

- (BOOL)trustSystemAnchorCertificates
{
  return self->_trustSystemAnchorCertificates;
}

- (void)setTrustSystemAnchorCertificates:(BOOL)a3
{
  self->_trustSystemAnchorCertificates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationAnchorCertificates, 0);
  objc_storeStrong((id *)&self->_revocationPolicy, 0);
  objc_storeStrong((id *)&self->_trustPolicy, 0);
  objc_storeStrong(&self->_trustEvaluatorInternal, 0);
}

@end