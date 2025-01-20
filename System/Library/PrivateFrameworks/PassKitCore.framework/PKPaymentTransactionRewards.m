@interface PKPaymentTransactionRewards
+ (BOOL)supportsSecureCoding;
+ (id)_cloudRecordKeyForRewardsProperty:(unint64_t)a3;
+ (id)_rewardsItemsSetFromJsonString:(id)a3;
+ (id)recordNamePrefix;
- (BOOL)containsItemOfType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRewards:(id)a3;
- (NSArray)rewardsItems;
- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3;
- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3 property:(unint64_t)a4;
- (PKPaymentTransactionRewards)initWithCoder:(id)a3;
- (PKPaymentTransactionRewards)initWithJsonString:(id)a3;
- (PKPaymentTransactionRewards)initWithRewardsItems:(id)a3;
- (id)_rewardItemsFromRecord:(id)a3 property:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)enhancedMerchantRewardsItems;
- (id)jsonArrayRepresentation;
- (id)jsonString;
- (id)primaryIdentifier;
- (id)promotionalRewardsItems;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)totalAmountForUnit:(unint64_t)a3;
- (id)totalEligibleValueForUnit:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 property:(unint64_t)a4;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3 property:(unint64_t)a4;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4 property:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setRewardsItems:(id)a3;
@end

@implementation PKPaymentTransactionRewards

- (PKPaymentTransactionRewards)initWithRewardsItems:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentTransactionRewards;
    v7 = [(PKPaymentTransactionRewards *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_rewardsItems, a3);
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

- (PKPaymentTransactionRewards)initWithJsonString:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _rewardsItemsSetFromJsonString:v4];

  if (v5 && [v5 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentTransactionRewards;
    v6 = [(PKPaymentTransactionRewards *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_rewardsItems, v5);
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
  id v4 = self->_rewardsItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_super v10 = (void *)[v3 copy];
  return v10;
}

- (id)jsonString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentTransactionRewards *)self jsonArrayRepresentation];
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
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error forming rewards array for CloudKit with error: %@", buf, 0xCu);
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

- (BOOL)containsItemOfType:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_rewardsItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "type", (void)v11) == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)promotionalRewardsItems
{
  v3 = [(NSArray *)self->_rewardsItems pk_objectsPassingTest:&__block_literal_global_27];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = (void *)[v4 initWithArray:v5];
  uint64_t v7 = [(PKPaymentTransactionRewards *)self enhancedMerchantRewardsItems];
  [v6 minusSet:v7];
  id v8 = (void *)[v6 copy];

  return v8;
}

uint64_t __54__PKPaymentTransactionRewards_promotionalRewardsItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 type];
  unint64_t v4 = [v2 state];

  if ((unint64_t)(v3 - 5) < 2) {
    return (v4 < 5) & (6u >> v4);
  }
  else {
    return 0;
  }
}

- (id)enhancedMerchantRewardsItems
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSArray *)self->_rewardsItems pk_objectsPassingTest:&__block_literal_global_209];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = (void *)[v4 initWithArray:v5];
  uint64_t v7 = [MEMORY[0x1E4F28C28] one];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithMantissa:2 exponent:0 isNegative:0];
  rewardsItems = self->_rewardsItems;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_3;
  v21[3] = &unk_1E56DD9E0;
  id v23 = &__block_literal_global_207;
  id v10 = v8;
  id v22 = v10;
  long long v11 = [(NSArray *)rewardsItems pk_firstObjectPassingTest:v21];
  if (v11)
  {
    long long v12 = self->_rewardsItems;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_4;
    v18[3] = &unk_1E56DD9E0;
    id v20 = &__block_literal_global_207;
    id v19 = v7;
    uint64_t v13 = [(NSArray *)v12 pk_firstObjectPassingTest:v18];
    long long v14 = (void *)v13;
    if (v13)
    {
      v24[0] = v11;
      v24[1] = v13;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      [v6 addObjectsFromArray:v15];
    }
  }
  else
  {
    long long v14 = 0;
  }
  uint64_t v16 = (void *)[v6 copy];

  return v16;
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ((unint64_t)([v6 state] - 1) <= 1
    && [v6 type] == a3
    && [v6 eligibleValueUnit] == 1)
  {
    id v8 = [v6 eligibleValue];
    uint64_t v9 = [v8 isEqualToNumber:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, 2, *(void *)(a1 + 32));
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 promotionIdentifier];
  uint64_t v5 = [v4 length];

  id v6 = [v3 programIdentifier];
  uint64_t v7 = [v6 length];

  int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() ^ 1;
  if (v5) {
    int v8 = 1;
  }
  uint64_t v9 = v8 ^ 1u;
  if ((v8 & 1) == 0 && v7) {
    uint64_t v9 = [v3 hasEnhancedMerchantProgramIdentifier];
  }

  return v9;
}

- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Not supported. Use initWithCloudStoreCoder:property:"];
  return [(PKPaymentTransactionRewards *)self init];
}

- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3 property:(unint64_t)a4
{
  id v6 = [a3 recordsWithRecordType:@"Transaction"];
  uint64_t v7 = [v6 firstObject];

  int v8 = [(PKPaymentTransactionRewards *)self _rewardItemsFromRecord:v7 property:a4];
  uint64_t v9 = [(PKPaymentTransactionRewards *)self initWithRewardsItems:v8];

  return v9;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3 property:(unint64_t)a4
{
  id v6 = [a3 recordsWithRecordType:@"Transaction"];
  id v10 = [v6 firstObject];

  uint64_t v7 = v10;
  if (v10)
  {
    int v8 = [(PKPaymentTransactionRewards *)self _rewardItemsFromRecord:v10 property:a4];
    rewardsItems = self->_rewardsItems;
    self->_rewardsItems = v8;

    uint64_t v7 = v10;
  }
}

- (id)_rewardItemsFromRecord:(id)a3 property:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _cloudRecordKeyForRewardsProperty:a4];
  uint64_t v7 = objc_msgSend(v5, "pk_encryptedStringForKey:", v6);

  int v8 = [(id)objc_opt_class() _rewardsItemsSetFromJsonString:v7];

  return v8;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4 property:(unint64_t)a5
{
  if (a4 - 1 <= 1) {
    [(PKPaymentTransactionRewards *)self _encodeServerDataWithCloudStoreCoder:a3 property:a5];
  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 property:(unint64_t)a4
{
  id v6 = [a3 recordsWithRecordType:@"Transaction"];
  id v10 = [v6 firstObject];

  uint64_t v7 = [v10 encryptedValues];
  int v8 = [(PKPaymentTransactionRewards *)self jsonString];
  uint64_t v9 = [(id)objc_opt_class() _cloudRecordKeyForRewardsProperty:a4];
  [v7 setObject:v8 forKey:v9];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (id)_cloudRecordKeyForRewardsProperty:(unint64_t)a3
{
  if (a3 == 1) {
    return @"rewardsInProgress";
  }
  else {
    return @"rewards";
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRewards)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionRewards;
  id v5 = [(PKPaymentTransactionRewards *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rewards"];
    rewardsItems = v5->_rewardsItems;
    v5->_rewardsItems = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_rewardsItems;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 copy];
  long long v14 = (void *)v5[1];
  v5[1] = v13;

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_rewardsItems];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentTransactionRewards *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionRewards *)self isEqualToRewards:v5];

  return v6;
}

- (BOOL)isEqualToRewards:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  rewardsItems = self->_rewardsItems;
  id v5 = a3;
  BOOL v6 = [v3 setWithArray:rewardsItems];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = v5[1];

  uint64_t v9 = [v7 setWithArray:v8];
  uint64_t v10 = (void *)v9;
  if (v6) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    char v12 = v6 == (void *)v9;
  }
  else {
    char v12 = [v6 isEqual:v9];
  }

  return v12;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendString:@"\n"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v4 = self->_rewardsItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@">"];
  return v3;
}

- (id)totalEligibleValueForUnit:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28C28] zero];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_rewardsItems;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v11, "state", (void)v15) - 5) <= 0xFFFFFFFFFFFFFFFDLL
          && [v11 eligibleValueUnit] == a3)
        {
          long long v12 = [v11 eligibleValue];
          uint64_t v13 = [v5 decimalNumberByAdding:v12];

          uint64_t v5 = (void *)v13;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)totalAmountForUnit:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSArray *)self->_rewardsItems firstObject];
  uint64_t v6 = [v5 currencyAmount];
  uint64_t v7 = [v6 currency];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v9 = PKCurrencyAmountCreate(v8, v7, 0);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_rewardsItems;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((unint64_t)(objc_msgSend(v15, "state", (void)v20) - 5) <= 0xFFFFFFFFFFFFFFFDLL
            && [v15 eligibleValueUnit] == a3)
          {
            long long v16 = [v15 currencyAmount];
            if (v16)
            {
              long long v17 = [v15 currencyAmount];
              uint64_t v18 = [v9 currencyAmountByAddingCurrencyAmount:v17];

              uint64_t v9 = (void *)v18;
            }
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_rewardsItemsSetFromJsonString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 dataUsingEncoding:4];
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
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Cannot decode PKPaymentTransactionRewards json string with error: %@", buf, 0xCu);
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
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Decoded PKPaymentTransactionRewards json string is not of type array", buf, 2u);
    }
    id v6 = 0;
    goto LABEL_21;
  }
  id v9 = v4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
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
        long long v15 = [PKPaymentTransactionRewardsItem alloc];
        long long v16 = -[PKPaymentTransactionRewardsItem initWithDictionary:](v15, "initWithDictionary:", v14, (void)v18);
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

- (NSArray)rewardsItems
{
  return self->_rewardsItems;
}

- (void)setRewardsItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end