@interface ICDelegationProviderServiceAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICDelegationProviderServiceAssertion)initWithCoder:(id)a3;
- (ICDelegationProviderServiceAssertion)initWithName:(id)a3;
- (NSDate)expirationDate;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation ICDelegationProviderServiceAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSUUID *)self->_uniqueIdentifier copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSDate *)self->_expirationDate copyWithZone:a3];
    v11 = (void *)v5[1];
    v5[1] = v10;
  }
  return v5;
}

- (ICDelegationProviderServiceAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDelegationProviderServiceAssertion;
    uint64_t v6 = [(ICDelegationProviderServiceAssertion *)&v13 init];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      uint64_t v8 = (void *)v7;
      if (v7) {
        v9 = (__CFString *)v7;
      }
      else {
        v9 = @"(unknown)";
      }
      objc_storeStrong((id *)&v6->_name, v9);

      objc_storeStrong((id *)&v6->_uniqueIdentifier, v5);
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
      expirationDate = v6->_expirationDate;
      v6->_expirationDate = (NSDate *)v10;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICDelegationProviderServiceAssertion *)a3;
  if (v4 == self) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v6 = v4->_uniqueIdentifier;
  if (uniqueIdentifier != v6)
  {
    char v7 = 0;
    if (!uniqueIdentifier || !v6) {
      goto LABEL_13;
    }
    if (!-[NSUUID isEqual:](uniqueIdentifier, "isEqual:"))
    {
LABEL_12:
      char v7 = 0;
      goto LABEL_13;
    }
  }
  expirationDate = self->_expirationDate;
  v9 = v4->_expirationDate;
  if (expirationDate == v9)
  {
LABEL_11:
    char v7 = 1;
    goto LABEL_13;
  }
  char v7 = 0;
  if (expirationDate && v9) {
    char v7 = -[NSDate isEqualToDate:](expirationDate, "isEqualToDate:");
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  return ~[(NSUUID *)self->_uniqueIdentifier hash];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  expirationDate = self->_expirationDate;
  name = self->_name;
  if (expirationDate)
  {
    uint64_t v8 = [NSString stringWithFormat:@" expirationDate:'%@", self->_expirationDate];
  }
  else
  {
    uint64_t v8 = &stru_1EF5F5C40;
  }
  v9 = [v3 stringWithFormat:@"<%@ %p name:'%@'%@ uniqueIdentifier:%@>", v5, self, name, v8, self->_uniqueIdentifier];
  if (expirationDate) {

  }
  return v9;
}

- (ICDelegationProviderServiceAssertion)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDelegationProviderServiceAssertion;
  id v5 = [(ICDelegationProviderServiceAssertion *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end