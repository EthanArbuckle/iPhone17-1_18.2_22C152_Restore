@interface SFSSLClientTrustPolicy
+ (BOOL)supportsSecureCoding;
- (NSString)clientName;
- (SFSSLClientTrustPolicy)initWithClientName:(id)a3;
- (SFSSLClientTrustPolicy)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setClientName:(id)a3;
@end

@implementation SFSSLClientTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLClientTrustPolicy)initWithClientName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSSLClientTrustPolicy;
  v5 = [(SFSSLClientTrustPolicy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sslClientTrustPolicyInternal = v5->_sslClientTrustPolicyInternal;
    v8 = (void *)sslClientTrustPolicyInternal[1];
    sslClientTrustPolicyInternal[1] = v6;
  }
  return v5;
}

- (SFSSLClientTrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSSLClientTrustPolicy;
  return [(SFSSLClientTrustPolicy *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFSSLClientTrustPolicy;
  id v4 = [(SFTrustPolicy *)&v6 copyWithZone:a3];
  [v4 setClientName:*((void *)self->_sslClientTrustPolicyInternal + 1)];
  return v4;
}

- (NSString)clientName
{
  v2 = (void *)[*((id *)self->_sslClientTrustPolicyInternal + 1) copy];
  return (NSString *)v2;
}

- (void)setClientName:(id)a3
{
  *((void *)self->_sslClientTrustPolicyInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end