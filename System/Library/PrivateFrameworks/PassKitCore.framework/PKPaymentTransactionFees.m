@interface PKPaymentTransactionFees
+ (BOOL)supportsSecureCoding;
+ (id)_feesSetFromJsonString:(id)a3;
+ (id)recordNamePrefix;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFees:(id)a3;
- (NSSet)fees;
- (PKPaymentTransactionFees)initWithCloudStoreCoder:(id)a3;
- (PKPaymentTransactionFees)initWithCoder:(id)a3;
- (PKPaymentTransactionFees)initWithFeeItems:(id)a3;
- (PKPaymentTransactionFees)initWithJsonString:(id)a3;
- (id)_feeItemsFromRecord:(id)a3;
- (id)description;
- (id)jsonArrayRepresentation;
- (id)jsonString;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)_encodeServerDataWithCloudStoreCoder:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFees:(id)a3;
@end

@implementation PKPaymentTransactionFees

- (PKPaymentTransactionFees)initWithFeeItems:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentTransactionFees;
    v7 = [(PKPaymentTransactionFees *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_fees, a3);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKPaymentTransactionFees)initWithJsonString:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _feesSetFromJsonString:v4];

  if (v5 && [v5 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentTransactionFees;
    v6 = [(PKPaymentTransactionFees *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_fees, v5);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonArrayRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_fees;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "jsonDictionaryRepresentation", (void)v12);
        [v3 safelyAddObject:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_super v10 = (void *)[v3 copy];
  return v10;
}

- (id)jsonString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentTransactionFees *)self jsonArrayRepresentation];
  if ([v2 count])
  {
    id v8 = 0;
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:2 error:&v8];
    id v4 = v8;
    if (v4)
    {
      uint64_t v5 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error forming fees array for CloudKit with error: %@", buf, 0xCu);
      }

      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (PKPaymentTransactionFees)initWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  uint64_t v5 = [v4 firstObject];

  uint64_t v6 = [(PKPaymentTransactionFees *)self _feeItemsFromRecord:v5];
  uint64_t v7 = [(PKPaymentTransactionFees *)self initWithFeeItems:v6];

  return v7;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  id v8 = [v4 firstObject];

  uint64_t v5 = v8;
  if (v8)
  {
    uint64_t v6 = [(PKPaymentTransactionFees *)self _feeItemsFromRecord:v8];
    fees = self->_fees;
    self->_fees = v6;

    uint64_t v5 = v8;
  }
}

- (id)_feeItemsFromRecord:(id)a3
{
  v3 = objc_msgSend(a3, "pk_encryptedStringForKey:", @"fees");
  id v4 = [(id)objc_opt_class() _feesSetFromJsonString:v3];

  return v4;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1) {
    [(PKPaymentTransactionFees *)self _encodeServerDataWithCloudStoreCoder:a3];
  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  id v7 = [v4 firstObject];

  uint64_t v5 = [v7 encryptedValues];
  uint64_t v6 = [(PKPaymentTransactionFees *)self jsonString];
  [v5 setObject:v6 forKey:@"fees"];
}

- (unint64_t)itemType
{
  return 1;
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionFees)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionFees;
  uint64_t v5 = [(PKPaymentTransactionFees *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fees"];
    fees = v5->_fees;
    v5->_fees = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_fees];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentTransactionFees *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionFees *)self isEqualToFees:v5];

  return v6;
}

- (BOOL)isEqualToFees:(id)a3
{
  fees = self->_fees;
  unint64_t v4 = (NSSet *)*((void *)a3 + 1);
  if (fees) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return fees == v4;
  }
  else {
    return -[NSSet isEqual:](fees, "isEqual:");
  }
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendString:@"\n"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v4 = self->_fees;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendString:v9];

        [v3 appendString:@"\n"];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@">"];
  return v3;
}

+ (id)_feesSetFromJsonString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [a3 dataUsingEncoding:4];
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_23;
  }
  id v22 = 0;
  unint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v22];
  id v5 = v22;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Cannot decode PKPaymentTransactionFees json string with error: %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Decoded PKPaymentTransactionFees json string is not of type array", buf, 2u);
    }
    id v6 = 0;
    goto LABEL_21;
  }
  id v9 = v4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v9;
  uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [PKPaymentTransactionFeeItem alloc];
        uint64_t v16 = -[PKPaymentTransactionFeeItem initWithFeeDictionary:](v15, "initWithFeeDictionary:", v14, (void)v18);
        if (v16) {
          [v7 addObject:v16];
        }
      }
      uint64_t v11 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }

  if (![v7 count])
  {
LABEL_21:
    id v8 = 0;
    goto LABEL_22;
  }
  id v8 = [v7 copy];
LABEL_22:

LABEL_23:
  return v8;
}

- (NSSet)fees
{
  return self->_fees;
}

- (void)setFees:(id)a3
{
}

- (void).cxx_destruct
{
}

@end