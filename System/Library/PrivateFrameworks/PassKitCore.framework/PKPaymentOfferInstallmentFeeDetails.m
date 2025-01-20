@interface PKPaymentOfferInstallmentFeeDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)feeItems;
- (PKCurrencyAmount)totalFeeAmount;
- (PKPaymentOfferInstallmentFeeDetails)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentFeeDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferInstallmentFeeDetails

- (PKPaymentOfferInstallmentFeeDetails)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferInstallmentFeeDetails;
  v5 = [(PKPaymentOfferInstallmentFeeDetails *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKCurrencyAmountForKey:@"totalFeeAmount"];
    totalFeeAmount = v5->_totalFeeAmount;
    v5->_totalFeeAmount = (PKCurrencyAmount *)v6;

    v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"fees"];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
          v16 = [PKPaymentOfferInstallmentFeeDetailItem alloc];
          v17 = -[PKPaymentOfferInstallmentFeeDetailItem initWithDictionary:](v16, "initWithDictionary:", v15, (void)v21);
          [v9 safelyAddObject:v17];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      uint64_t v18 = [v9 copy];
      feeItems = v5->_feeItems;
      v5->_feeItems = (NSArray *)v18;
    }
    else
    {
      feeItems = v5->_feeItems;
      v5->_feeItems = 0;
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKCurrencyAmount *)self->_totalFeeAmount dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"totalFeeAmount"];

  id v5 = [(NSArray *)self->_feeItems pk_createArrayBySafelyApplyingBlock:&__block_literal_global_63];
  [v3 setObject:v5 forKeyedSubscript:@"fees"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

uint64_t __63__PKPaymentOfferInstallmentFeeDetails_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentFeeDetails *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        totalFeeAmount = self->_totalFeeAmount;
        v8 = v6->_totalFeeAmount;
        if (totalFeeAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](totalFeeAmount, "isEqual:"))
          {
LABEL_7:
            feeItems = self->_feeItems;
            id v10 = v6->_feeItems;
            if (feeItems && v10) {
              char v11 = -[NSArray isEqual:](feeItems, "isEqual:");
            }
            else {
              char v11 = feeItems == v10;
            }
            goto LABEL_15;
          }
        }
        else if (totalFeeAmount == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_totalFeeAmount];
  [v3 safelyAddObject:self->_feeItems];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"totalFeeAmount: '%@'; ", self->_totalFeeAmount];
  [v3 appendFormat:@"feeItems: '%@'; ", self->_feeItems];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentFeeDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferInstallmentFeeDetails;
  id v5 = [(PKPaymentOfferInstallmentFeeDetails *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFeeAmount"];
    totalFeeAmount = v5->_totalFeeAmount;
    v5->_totalFeeAmount = (PKCurrencyAmount *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"fees"];
    feeItems = v5->_feeItems;
    v5->_feeItems = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  totalFeeAmount = self->_totalFeeAmount;
  id v5 = a3;
  [v5 encodeObject:totalFeeAmount forKey:@"totalFeeAmount"];
  [v5 encodeObject:self->_feeItems forKey:@"fees"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentFeeDetails allocWithZone:](PKPaymentOfferInstallmentFeeDetails, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_totalFeeAmount copyWithZone:a3];
  totalFeeAmount = v5->_totalFeeAmount;
  v5->_totalFeeAmount = v6;

  uint64_t v8 = [(NSArray *)self->_feeItems copyWithZone:a3];
  feeItems = v5->_feeItems;
  v5->_feeItems = (NSArray *)v8;

  return v5;
}

- (PKCurrencyAmount)totalFeeAmount
{
  return self->_totalFeeAmount;
}

- (NSArray)feeItems
{
  return self->_feeItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeItems, 0);
  objc_storeStrong((id *)&self->_totalFeeAmount, 0);
}

@end