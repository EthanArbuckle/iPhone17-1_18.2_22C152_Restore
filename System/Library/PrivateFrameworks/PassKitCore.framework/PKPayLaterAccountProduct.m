@interface PKPayLaterAccountProduct
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPayLaterAccountProduct)initWithCoder:(id)a3;
- (PKPayLaterAccountProduct)initWithDictionary:(id)a3;
- (PKPayLaterAccountProductDetails)productDetails;
- (PKPayLaterAccountProductEligibleSpend)eligibleSpend;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)productType;
- (void)encodeWithCoder:(id)a3;
- (void)setEligibleSpend:(id)a3;
- (void)setProductDetails:(id)a3;
- (void)setProductType:(unint64_t)a3;
@end

@implementation PKPayLaterAccountProduct

- (PKPayLaterAccountProduct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterAccountProduct;
  v5 = [(PKPayLaterAccountProduct *)&v14 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"productType"];
    v5->_productType = [v6 isEqualToString:@"bnpl"];

    v7 = [v4 PKDictionaryForKey:@"productDetails"];
    if (v7)
    {
      v8 = [[PKPayLaterAccountProductDetails alloc] initWithDictionary:v7];
      productDetails = v5->_productDetails;
      v5->_productDetails = v8;
    }
    v10 = [v4 PKDictionaryForKey:@"eligibleSpend"];
    if (v10)
    {
      v11 = [[PKPayLaterAccountProductEligibleSpend alloc] initWithDictionary:v10];
      eligibleSpend = v5->_eligibleSpend;
      v5->_eligibleSpend = v11;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProduct)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAccountProduct;
  v5 = [(PKPayLaterAccountProduct *)&v11 init];
  if (v5)
  {
    v5->_productType = [v4 decodeIntegerForKey:@"productType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productDetails"];
    productDetails = v5->_productDetails;
    v5->_productDetails = (PKPayLaterAccountProductDetails *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibleSpend"];
    eligibleSpend = v5->_eligibleSpend;
    v5->_eligibleSpend = (PKPayLaterAccountProductEligibleSpend *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t productType = self->_productType;
  id v5 = a3;
  [v5 encodeInteger:productType forKey:@"productType"];
  [v5 encodeObject:self->_productDetails forKey:@"productDetails"];
  [v5 encodeObject:self->_eligibleSpend forKey:@"eligibleSpend"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  productDetails = self->_productDetails;
  uint64_t v6 = (PKPayLaterAccountProductDetails *)v4[2];
  if (productDetails && v6)
  {
    if (!-[PKPayLaterAccountProductDetails isEqual:](productDetails, "isEqual:")) {
      goto LABEL_12;
    }
  }
  else if (productDetails != v6)
  {
    goto LABEL_12;
  }
  eligibleSpend = self->_eligibleSpend;
  uint64_t v8 = (PKPayLaterAccountProductEligibleSpend *)v4[3];
  if (!eligibleSpend || !v8)
  {
    if (eligibleSpend == v8) {
      goto LABEL_10;
    }
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if (!-[PKPayLaterAccountProductEligibleSpend isEqual:](eligibleSpend, "isEqual:")) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v9 = self->_productType == v4[1];
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_productDetails];
  [v3 safelyAddObject:self->_eligibleSpend];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_productType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_productType == 1) {
    unint64_t v5 = @"bnpl";
  }
  else {
    unint64_t v5 = @"unknown";
  }
  [v3 appendFormat:@"productType: '%@'; ", v5];
  [v4 appendFormat:@"productDetails: '%@'; ", self->_productDetails];
  [v4 appendFormat:@"productDetails: '%@'; ", self->_eligibleSpend];
  [v4 appendFormat:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPayLaterAccountProduct allocWithZone:](PKPayLaterAccountProduct, "allocWithZone:") init];
  uint64_t v6 = [(PKPayLaterAccountProductDetails *)self->_productDetails copyWithZone:a3];
  productDetails = v5->_productDetails;
  v5->_productDetails = v6;

  uint64_t v8 = [(PKPayLaterAccountProductEligibleSpend *)self->_eligibleSpend copyWithZone:a3];
  BOOL v9 = v5->_productDetails;
  v5->_productDetails = v8;

  v5->_unint64_t productType = self->_productType;
  return v5;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_unint64_t productType = a3;
}

- (PKPayLaterAccountProductDetails)productDetails
{
  return self->_productDetails;
}

- (void)setProductDetails:(id)a3
{
}

- (PKPayLaterAccountProductEligibleSpend)eligibleSpend
{
  return self->_eligibleSpend;
}

- (void)setEligibleSpend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleSpend, 0);
  objc_storeStrong((id *)&self->_productDetails, 0);
}

@end