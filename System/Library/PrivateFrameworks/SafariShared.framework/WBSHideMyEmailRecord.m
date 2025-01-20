@interface WBSHideMyEmailRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (NSString)privateEmailAddress;
- (WBSHideMyEmailRecord)initWithCoder:(id)a3;
- (WBSHideMyEmailRecord)initWithDomain:(id)a3 state:(unint64_t)a4 privateEmailAddress:(id)a5;
- (id)description;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHideMyEmailRecord

- (WBSHideMyEmailRecord)initWithDomain:(id)a3 state:(unint64_t)a4 privateEmailAddress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSHideMyEmailRecord;
  v10 = [(WBSHideMyEmailRecord *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    v10->_state = a4;
    uint64_t v13 = [v9 copy];
    privateEmailAddress = v10->_privateEmailAddress;
    v10->_privateEmailAddress = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSHideMyEmailRecord *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_state == v5->_state && WBSIsEqual()) {
        char v6 = WBSIsEqual();
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_state - 1;
  if (v5 > 2) {
    char v6 = @"PrivateEmailExists";
  }
  else {
    char v6 = off_1E5C8CED0[v5];
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, domain: %@, state: %@, privateEmailAddress: %@>", v4, self, self->_domain, v6, self->_privateEmailAddress];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 encodeObject:domain forKey:@"domain"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeObject:self->_privateEmailAddress forKey:@"privateEmailAddress"];
}

- (WBSHideMyEmailRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"state"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmailAddress"];

  id v8 = [(WBSHideMyEmailRecord *)self initWithDomain:v5 state:v6 privateEmailAddress:v7];
  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)privateEmailAddress
{
  return self->_privateEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailAddress, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end