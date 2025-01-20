@interface SFSSLServerTrustPolicy
+ (BOOL)supportsSecureCoding;
- (NSString)serverName;
- (SFSSLServerTrustPolicy)initWithCoder:(id)a3;
- (SFSSLServerTrustPolicy)initWithServerName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setServerName:(id)a3;
@end

@implementation SFSSLServerTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLServerTrustPolicy)initWithServerName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSSLServerTrustPolicy;
  v5 = [(SFSSLServerTrustPolicy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sslServerTrustPolicyInternal = v5->_sslServerTrustPolicyInternal;
    v8 = (void *)sslServerTrustPolicyInternal[1];
    sslServerTrustPolicyInternal[1] = v6;
  }
  return v5;
}

- (SFSSLServerTrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSSLServerTrustPolicy;
  return [(SFSSLServerTrustPolicy *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFSSLServerTrustPolicy;
  id v4 = [(SFTrustPolicy *)&v6 copyWithZone:a3];
  [v4 setServerName:*((void *)self->_sslServerTrustPolicyInternal + 1)];
  return v4;
}

- (NSString)serverName
{
  v2 = (void *)[*((id *)self->_sslServerTrustPolicyInternal + 1) copy];
  return (NSString *)v2;
}

- (void)setServerName:(id)a3
{
  *((void *)self->_sslServerTrustPolicyInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end