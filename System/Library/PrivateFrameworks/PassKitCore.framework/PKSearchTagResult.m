@interface PKSearchTagResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKPaymentTransactionTag)tag;
- (PKSearchTagResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation PKSearchTagResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTagResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTagResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (PKPaymentTransactionTag *)v6;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTagResult;
  v3 = [(PKSearchTagResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"tag: '%@'; ", self->_tag];
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tag = self->_tag;
    objc_super v6 = (PKPaymentTransactionTag *)v4[1];
    if (tag && v6) {
      BOOL v7 = -[PKPaymentTransactionTag isEqual:](tag, "isEqual:");
    }
    else {
      BOOL v7 = tag == v6;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self->_tag;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  unint64_t v3 = PKCombinedHash(17, v2);

  return v3;
}

- (PKPaymentTransactionTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end