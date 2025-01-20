@interface TPPolicyVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)policyHash;
- (TPPolicyVersion)initWithCoder:(id)a3;
- (TPPolicyVersion)initWithVersion:(unint64_t)a3 hash:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)versionNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPPolicyVersion

- (void).cxx_destruct
{
}

- (NSString)policyHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)versionNumber
{
  return self->_versionNumber;
}

- (TPPolicyVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPPolicyVersion;
  v5 = [(TPPolicyVersion *)&v9 init];
  if (v5)
  {
    v5->_versionNumber = [v4 decodeInt64ForKey:@"policyVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policyHash"];
    policyHash = v5->_policyHash;
    v5->_policyHash = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(TPPolicyVersion *)self policyHash];
  [v5 encodeObject:v4 forKey:@"policyHash"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[TPPolicyVersion versionNumber](self, "versionNumber"), @"policyVersion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TPPolicyVersion alloc];
  unint64_t v5 = [(TPPolicyVersion *)self versionNumber];
  uint64_t v6 = [(TPPolicyVersion *)self policyHash];
  v7 = (void *)[v6 copy];
  v8 = [(TPPolicyVersion *)v4 initWithVersion:v5 hash:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 versionNumber];
    if (v6 == [(TPPolicyVersion *)self versionNumber])
    {
      v7 = [v5 policyHash];
      v8 = [(TPPolicyVersion *)self policyHash];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(TPPolicyVersion *)self versionNumber];
  id v5 = [(TPPolicyVersion *)self policyHash];
  uint64_t v6 = [v3 stringWithFormat:@"<TPPolicyVersion: %llu, %@>", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(TPPolicyVersion *)self policyHash];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (TPPolicyVersion)initWithVersion:(unint64_t)a3 hash:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TPPolicyVersion;
  v7 = [(TPPolicyVersion *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_versionNumber = a3;
    char v9 = +[TPStringTable defaultTable];
    uint64_t v10 = [v9 stringWithString:v6];
    policyHash = v8->_policyHash;
    v8->_policyHash = (NSString *)v10;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end