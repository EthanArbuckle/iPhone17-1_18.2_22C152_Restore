@interface PKPaymentOfferRewardsCriteria
+ (BOOL)supportsSecureCoding;
- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportedDeferredPayments;
- (BOOL)supportedRecurringPayments;
- (NSArray)maximumAmounts;
- (NSArray)minimumAmounts;
- (NSSet)supportedCurrencyCodes;
- (NSURL)redemptionTermsURL;
- (PKPaymentOfferRewardsCriteria)initWithCoder:(id)a3;
- (PKPaymentOfferRewardsCriteria)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumAmounts:(id)a3;
- (void)setMinimumAmounts:(id)a3;
- (void)setRedemptionTermsURL:(id)a3;
- (void)setSupportedCurrencyCodes:(id)a3;
- (void)setSupportedDeferredPayments:(BOOL)a3;
- (void)setSupportedRecurringPayments:(BOOL)a3;
@end

@implementation PKPaymentOfferRewardsCriteria

- (PKPaymentOfferRewardsCriteria)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v5 = [(PKPaymentOfferCriteria *)&v17 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKURLForKey:@"redemptionTermsURL"];
    redemptionTermsURL = v5->_redemptionTermsURL;
    v5->_redemptionTermsURL = (NSURL *)v6;

    uint64_t v8 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedCurrencyCodes"];
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v8;

    v5->_supportedDeferredPayments = [v4 PKBoolForKey:@"supportedDeferredPayments"];
    v5->_supportedRecurringPayments = [v4 PKBoolForKey:@"supportedRecurringPayments"];
    v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"minimumAmounts"];
    uint64_t v11 = objc_msgSend(v10, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_127);
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v11;

    v13 = [v4 PKArrayContaining:objc_opt_class() forKey:@"maximumAmounts"];
    uint64_t v14 = objc_msgSend(v13, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_32);
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v14;
  }
  return v5;
}

PKCurrencyAmount *__52__PKPaymentOfferRewardsCriteria_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCurrencyAmount alloc] initWithDictionary:v2];

  return v3;
}

PKCurrencyAmount *__52__PKPaymentOfferRewardsCriteria_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCurrencyAmount alloc] initWithDictionary:v2];

  return v3;
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentOfferRewardsCriteria;
  if (![(PKPaymentOfferCriteria *)&v31 eligibleWithConfiguration:v6 ineligibleReason:a4])
  {
    char v13 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v14 = 0;
    char v13 = 1;
    if (!a4) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  id v7 = v6;
  uint64_t v8 = [v7 amount];
  v9 = [v7 currencyCode];
  char v10 = [v7 options];
  if (!v8)
  {
    char v13 = 0;
    unint64_t v14 = 3;
    goto LABEL_36;
  }
  if (!v9)
  {
    char v13 = 0;
    unint64_t v14 = 4;
    goto LABEL_36;
  }
  char v11 = v10;
  if ([(NSSet *)self->_supportedCurrencyCodes count]
    && ![(NSSet *)self->_supportedCurrencyCodes containsObject:v9])
  {
    char v13 = 0;
    unint64_t v14 = 7;
    goto LABEL_36;
  }
  int v12 = [(NSDecimalNumber *)v8 pk_isPositiveNumber];
  char v13 = 0;
  if (v12) {
    unint64_t v14 = 15;
  }
  else {
    unint64_t v14 = 13;
  }
  if (v12 && (v11 & 1) == 0)
  {
    if ((v11 & 4) != 0 && !self->_supportedRecurringPayments)
    {
      char v13 = 0;
      unint64_t v14 = 17;
      goto LABEL_36;
    }
    if ((v11 & 8) != 0)
    {
      if (!self->_supportedDeferredPayments)
      {
        char v13 = 0;
        unint64_t v14 = 18;
        goto LABEL_36;
      }
    }
    else if ((v11 & 0xE) == 2)
    {
      char v13 = 0;
      unint64_t v14 = 16;
      goto LABEL_36;
    }
    v15 = PKCurrencyAmountCreate(v8, v9, 0);
    maximumAmounts = self->_maximumAmounts;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke;
    v29[3] = &unk_1E56EB7F0;
    objc_super v17 = v9;
    v30 = v17;
    uint64_t v18 = [(NSArray *)maximumAmounts pk_firstObjectPassingTest:v29];
    minimumAmounts = self->_minimumAmounts;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2;
    v27 = &unk_1E56EB7F0;
    v28 = v17;
    v20 = [(NSArray *)minimumAmounts pk_firstObjectPassingTest:&v24];
    if (v20 && (objc_msgSend(v15, "currencyAmountLessThanCurrencyAmount:", v20, v24, v25, v26, v27) & 1) != 0)
    {
      v21 = (void *)v18;
      char v13 = 0;
      unint64_t v14 = 13;
    }
    else if (v18)
    {
      int v22 = [v15 currencyAmountGreaterThanCurrencyAmount:v18];
      if (v22) {
        unint64_t v14 = 14;
      }
      else {
        unint64_t v14 = 0;
      }
      v21 = (void *)v18;
      char v13 = v22 ^ 1;
    }
    else
    {
      unint64_t v14 = 0;
      v21 = 0;
      char v13 = 1;
    }
  }
LABEL_36:

  if (a4) {
LABEL_37:
  }
    *a4 = v14;
LABEL_38:

  return v13;
}

uint64_t __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 currency];
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5) {
    uint64_t v6 = objc_msgSend(v3, "isEqual:");
  }
  else {
    uint64_t v6 = v3 == v5;
  }

  return v6;
}

uint64_t __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 currency];
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5) {
    uint64_t v6 = objc_msgSend(v3, "isEqual:");
  }
  else {
    uint64_t v6 = v3 == v5;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v3 = [(PKPaymentOfferCriteria *)&v13 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(NSURL *)self->_redemptionTermsURL absoluteString];
  [v4 setObject:v5 forKeyedSubscript:@"redemptionTermsURL"];

  uint64_t v6 = [(NSSet *)self->_supportedCurrencyCodes allObjects];
  [v4 setObject:v6 forKeyedSubscript:@"supportedCurrencyCodes"];

  id v7 = [(NSArray *)self->_minimumAmounts pk_createArrayBySafelyApplyingBlock:&__block_literal_global_41_0];
  [v4 setObject:v7 forKeyedSubscript:@"minimumAmounts"];

  id v8 = [(NSArray *)self->_maximumAmounts pk_createArrayBySafelyApplyingBlock:&__block_literal_global_43_2];
  [v4 setObject:v8 forKeyedSubscript:@"maximumAmounts"];

  v9 = [NSNumber numberWithBool:self->_supportedDeferredPayments];
  [v4 setObject:v9 forKeyedSubscript:@"supportedDeferredPayments"];

  char v10 = [NSNumber numberWithBool:self->_supportedRecurringPayments];
  [v4 setObject:v10 forKeyedSubscript:@"supportedRecurringPayments"];

  char v11 = (void *)[v4 copy];
  return v11;
}

uint64_t __57__PKPaymentOfferRewardsCriteria_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __57__PKPaymentOfferRewardsCriteria_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferRewardsCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        v17.receiver = self;
        v17.super_class = (Class)PKPaymentOfferRewardsCriteria;
        if (![(PKPaymentOfferCriteria *)&v17 isEqual:v6]
          || self->_supportedDeferredPayments != v6->_supportedDeferredPayments
          || self->_supportedRecurringPayments != v6->_supportedRecurringPayments)
        {
          goto LABEL_26;
        }
        supportedCurrencyCodes = self->_supportedCurrencyCodes;
        id v8 = v6->_supportedCurrencyCodes;
        if (supportedCurrencyCodes && v8)
        {
          if ((-[NSSet isEqual:](supportedCurrencyCodes, "isEqual:") & 1) == 0) {
            goto LABEL_26;
          }
        }
        else if (supportedCurrencyCodes != v8)
        {
          goto LABEL_26;
        }
        minimumAmounts = self->_minimumAmounts;
        char v11 = v6->_minimumAmounts;
        if (minimumAmounts && v11)
        {
          if ((-[NSArray isEqual:](minimumAmounts, "isEqual:") & 1) == 0) {
            goto LABEL_26;
          }
        }
        else if (minimumAmounts != v11)
        {
          goto LABEL_26;
        }
        maximumAmounts = self->_maximumAmounts;
        objc_super v13 = v6->_maximumAmounts;
        if (maximumAmounts && v13)
        {
          if (-[NSArray isEqual:](maximumAmounts, "isEqual:"))
          {
LABEL_22:
            redemptionTermsURL = self->_redemptionTermsURL;
            v15 = v6->_redemptionTermsURL;
            if (redemptionTermsURL && v15) {
              char v9 = -[NSURL isEqual:](redemptionTermsURL, "isEqual:");
            }
            else {
              char v9 = redemptionTermsURL == v15;
            }
            goto LABEL_27;
          }
        }
        else if (maximumAmounts == v13)
        {
          goto LABEL_22;
        }
LABEL_26:
        char v9 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    char v9 = 0;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_supportedCurrencyCodes];
  [v3 safelyAddObject:self->_minimumAmounts];
  [v3 safelyAddObject:self->_maximumAmounts];
  [v3 safelyAddObject:self->_redemptionTermsURL];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentOfferRewardsCriteria;
  id v4 = [(PKPaymentOfferCriteria *)&v9 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  uint64_t v6 = self->_supportedDeferredPayments - v5 + 32 * v5;
  unint64_t v7 = self->_supportedRecurringPayments - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKPaymentOfferCriteria *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  uint64_t v5 = PKPaymentOfferCriteriaTypeToString([(PKPaymentOfferCriteria *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  uint64_t v6 = PKPaymentOfferCriteriaEligibilityToString([(PKPaymentOfferCriteria *)self eligibility]);
  [v3 appendFormat:@"eligibility: '%@'; ", v6];

  unint64_t v7 = [(PKPaymentOfferCriteria *)self passSerialNumber];
  [v3 appendFormat:@"passSerialNumber: '%@'; ", v7];

  id v8 = [(PKPaymentOfferCriteria *)self passTypeIdentifier];
  [v3 appendFormat:@"passTypeIdentifier: '%@'; ", v8];

  objc_super v9 = [(PKPaymentOfferCriteria *)self fpanIdentifier];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", v9];

  char v10 = [(NSURL *)self->_redemptionTermsURL absoluteString];
  [v3 appendFormat:@"redemptionTermsURL: '%@'; ", v10];

  [v3 appendFormat:@"supportedCurrencyCodes: '%@'; ", self->_supportedCurrencyCodes];
  [v3 appendFormat:@"minimumAmounts: '%@'; ", self->_minimumAmounts];
  [v3 appendFormat:@"maximumAmounts: '%@'; ", self->_maximumAmounts];
  char v11 = [NSNumber numberWithBool:self->_supportedDeferredPayments];
  [v3 appendFormat:@"supportedDeferredPayments: '%@'; ", v11];

  int v12 = [NSNumber numberWithBool:self->_supportedRecurringPayments];
  [v3 appendFormat:@"supportedRecurringPayments: '%@'; ", v12];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferRewardsCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentOfferRewardsCriteria;
  uint64_t v5 = [(PKPaymentOfferCriteria *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redemptionTermsURL"];
    redemptionTermsURL = v5->_redemptionTermsURL;
    v5->_redemptionTermsURL = (NSURL *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    char v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedCurrencyCodes"];
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v11;

    objc_super v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"minimumAmounts"];
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"maximumAmounts"];
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v21;

    v5->_supportedDeferredPayments = [v4 decodeBoolForKey:@"supportedDeferredPayments"];
    v5->_supportedRecurringPayments = [v4 decodeBoolForKey:@"supportedRecurringPayments"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentOfferRewardsCriteria;
  id v4 = a3;
  [(PKPaymentOfferCriteria *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_redemptionTermsURL, @"redemptionTermsURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_supportedCurrencyCodes forKey:@"supportedCurrencyCodes"];
  [v4 encodeObject:self->_minimumAmounts forKey:@"minimumAmounts"];
  [v4 encodeObject:self->_maximumAmounts forKey:@"maximumAmounts"];
  [v4 encodeBool:self->_supportedDeferredPayments forKey:@"supportedDeferredPayments"];
  [v4 encodeBool:self->_supportedRecurringPayments forKey:@"supportedRecurringPayments"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferRewardsCriteria;
  objc_super v5 = -[PKPaymentOfferCriteria copyWithZone:](&v15, sel_copyWithZone_);
  uint64_t v6 = [(NSURL *)self->_redemptionTermsURL copyWithZone:a3];
  unint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  uint64_t v8 = [(NSSet *)self->_supportedCurrencyCodes copyWithZone:a3];
  uint64_t v9 = (void *)v5[9];
  v5[9] = v8;

  uint64_t v10 = [(NSArray *)self->_minimumAmounts copyWithZone:a3];
  uint64_t v11 = (void *)v5[10];
  v5[10] = v10;

  uint64_t v12 = [(NSArray *)self->_maximumAmounts copyWithZone:a3];
  objc_super v13 = (void *)v5[11];
  v5[11] = v12;

  *((unsigned char *)v5 + 56) = self->_supportedDeferredPayments;
  *((unsigned char *)v5 + 57) = self->_supportedRecurringPayments;
  return v5;
}

- (NSURL)redemptionTermsURL
{
  return self->_redemptionTermsURL;
}

- (void)setRedemptionTermsURL:(id)a3
{
}

- (BOOL)supportedDeferredPayments
{
  return self->_supportedDeferredPayments;
}

- (void)setSupportedDeferredPayments:(BOOL)a3
{
  self->_supportedDeferredPayments = a3;
}

- (BOOL)supportedRecurringPayments
{
  return self->_supportedRecurringPayments;
}

- (void)setSupportedRecurringPayments:(BOOL)a3
{
  self->_supportedRecurringPayments = a3;
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (void)setSupportedCurrencyCodes:(id)a3
{
}

- (NSArray)minimumAmounts
{
  return self->_minimumAmounts;
}

- (void)setMinimumAmounts:(id)a3
{
}

- (NSArray)maximumAmounts
{
  return self->_maximumAmounts;
}

- (void)setMaximumAmounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAmounts, 0);
  objc_storeStrong((id *)&self->_minimumAmounts, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
  objc_storeStrong((id *)&self->_redemptionTermsURL, 0);
}

@end