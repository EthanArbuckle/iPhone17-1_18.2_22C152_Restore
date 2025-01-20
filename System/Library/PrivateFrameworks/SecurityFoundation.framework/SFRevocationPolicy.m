@interface SFRevocationPolicy
+ (BOOL)supportsSecureCoding;
- (SFRevocationPolicy)init;
- (SFRevocationPolicy)initWithCoder:(id)a3;
- (SFRevocationPolicy)initWithRevocationMethods:(unint64_t)a3 networkLookup:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)networkLookup;
- (unint64_t)revocationMethods;
- (void)setNetworkLookup:(int64_t)a3;
- (void)setRevocationMethods:(unint64_t)a3;
@end

@implementation SFRevocationPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRevocationPolicy)init
{
  return [(SFRevocationPolicy *)self initWithRevocationMethods:0xFFFFFFFFLL networkLookup:1];
}

- (SFRevocationPolicy)initWithRevocationMethods:(unint64_t)a3 networkLookup:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SFRevocationPolicy;
  result = [(SFRevocationPolicy *)&v7 init];
  if (result)
  {
    *((void *)result->_revocationPolicyInternal + 1) = a3;
    *((void *)result->_revocationPolicyInternal + 2) = a4;
  }
  return result;
}

- (SFRevocationPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFRevocationPolicy;
  return [(SFRevocationPolicy *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  revocationPolicyInternal = self->_revocationPolicyInternal;
  uint64_t v6 = revocationPolicyInternal[1];
  uint64_t v7 = revocationPolicyInternal[2];
  return (id)[v4 initWithRevocationMethods:v6 networkLookup:v7];
}

- (unint64_t)revocationMethods
{
  return *((void *)self->_revocationPolicyInternal + 1);
}

- (void)setRevocationMethods:(unint64_t)a3
{
  *((void *)self->_revocationPolicyInternal + 1) = a3;
}

- (int64_t)networkLookup
{
  return *((void *)self->_revocationPolicyInternal + 2);
}

- (void)setNetworkLookup:(int64_t)a3
{
  *((void *)self->_revocationPolicyInternal + 2) = a3;
}

- (void).cxx_destruct
{
}

@end