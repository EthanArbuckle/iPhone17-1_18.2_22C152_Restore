@interface PKPaymentOfferInstallmentInterestDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)interestItems;
- (PKCurrencyAmount)totalInterestAmount;
- (PKPaymentOfferInstallmentInterestDetails)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentInterestDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferInstallmentInterestDetails

- (PKPaymentOfferInstallmentInterestDetails)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferInstallmentInterestDetails;
  v5 = [(PKPaymentOfferInstallmentInterestDetails *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKCurrencyAmountForKey:@"totalInterestAmount"];
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (PKCurrencyAmount *)v6;

    v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"interest"];
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
          v16 = [PKPaymentOfferInstallmentInterestDetailItem alloc];
          v17 = -[PKPaymentOfferInstallmentInterestDetailItem initWithDictionary:](v16, "initWithDictionary:", v15, (void)v21);
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
      interestItems = v5->_interestItems;
      v5->_interestItems = (NSArray *)v18;
    }
    else
    {
      interestItems = v5->_interestItems;
      v5->_interestItems = 0;
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKCurrencyAmount *)self->_totalInterestAmount dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"totalInterestAmount"];

  id v5 = [(NSArray *)self->_interestItems pk_createArrayBySafelyApplyingBlock:&__block_literal_global_26];
  [v3 setObject:v5 forKeyedSubscript:@"interest"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

uint64_t __68__PKPaymentOfferInstallmentInterestDetails_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentInterestDetails *)a3;
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
        totalInterestAmount = self->_totalInterestAmount;
        v8 = v6->_totalInterestAmount;
        if (totalInterestAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](totalInterestAmount, "isEqual:"))
          {
LABEL_7:
            interestItems = self->_interestItems;
            id v10 = v6->_interestItems;
            if (interestItems && v10) {
              char v11 = -[NSArray isEqual:](interestItems, "isEqual:");
            }
            else {
              char v11 = interestItems == v10;
            }
            goto LABEL_15;
          }
        }
        else if (totalInterestAmount == v8)
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
  [v3 safelyAddObject:self->_totalInterestAmount];
  [v3 safelyAddObject:self->_interestItems];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"totalInterestAmount: '%@'; ", self->_totalInterestAmount];
  [v3 appendFormat:@"interestItems: '%@'; ", self->_interestItems];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentInterestDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferInstallmentInterestDetails;
  id v5 = [(PKPaymentOfferInstallmentInterestDetails *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterestAmount"];
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (PKCurrencyAmount *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"interest"];
    interestItems = v5->_interestItems;
    v5->_interestItems = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  totalInterestAmount = self->_totalInterestAmount;
  id v5 = a3;
  [v5 encodeObject:totalInterestAmount forKey:@"totalInterestAmount"];
  [v5 encodeObject:self->_interestItems forKey:@"interest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentInterestDetails allocWithZone:](PKPaymentOfferInstallmentInterestDetails, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_totalInterestAmount copyWithZone:a3];
  totalInterestAmount = v5->_totalInterestAmount;
  v5->_totalInterestAmount = v6;

  uint64_t v8 = [(NSArray *)self->_interestItems copyWithZone:a3];
  interestItems = v5->_interestItems;
  v5->_interestItems = (NSArray *)v8;

  return v5;
}

- (PKCurrencyAmount)totalInterestAmount
{
  return self->_totalInterestAmount;
}

- (NSArray)interestItems
{
  return self->_interestItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestItems, 0);
  objc_storeStrong((id *)&self->_totalInterestAmount, 0);
}

@end