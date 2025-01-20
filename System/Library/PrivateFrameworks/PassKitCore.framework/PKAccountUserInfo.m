@interface PKAccountUserInfo
+ (BOOL)supportsSecureCoding;
- (CNContact)creditPrimaryUser;
- (PKAccountUserInfo)initWithCoder:(id)a3;
- (PKSavingsAccountUserInfo)savingsUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCreditPrimaryUser:(id)a3;
- (void)setSavingsUserInfo:(id)a3;
@end

@implementation PKAccountUserInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  creditPrimaryUser = self->_creditPrimaryUser;
  id v5 = a3;
  [v5 encodeObject:creditPrimaryUser forKey:@"creditPrimaryUser"];
  [v5 encodeObject:self->_savingsUserInfo forKey:@"savingsUserInfo"];
}

- (PKAccountUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserInfo;
  id v5 = [(PKAccountUserInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditPrimaryUser"];
    creditPrimaryUser = v5->_creditPrimaryUser;
    v5->_creditPrimaryUser = (CNContact *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savingsUserInfo"];
    savingsUserInfo = v5->_savingsUserInfo;
    v5->_savingsUserInfo = (PKSavingsAccountUserInfo *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(CNContact *)self->_creditPrimaryUser copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKSavingsAccountUserInfo *)self->_savingsUserInfo copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"creditPrimaryUser", self->_creditPrimaryUser];
  [v3 appendFormat:@"%@: '%@'; ", @"savingsUserInfo", self->_savingsUserInfo];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (CNContact)creditPrimaryUser
{
  return self->_creditPrimaryUser;
}

- (void)setCreditPrimaryUser:(id)a3
{
}

- (PKSavingsAccountUserInfo)savingsUserInfo
{
  return self->_savingsUserInfo;
}

- (void)setSavingsUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsUserInfo, 0);
  objc_storeStrong((id *)&self->_creditPrimaryUser, 0);
}

@end