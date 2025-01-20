@interface PKStoredValuePassProperties
+ (BOOL)supportsSecureCoding;
+ (Class)equalityClass;
+ (PKStoredValuePassProperties)passPropertiesForPass:(PKPass *)pass;
- (BOOL)isBlacklisted;
- (BOOL)isBlocked;
- (BOOL)isEnRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInStation;
- (NSArray)balances;
- (NSArray)enrouteTransitTypes;
- (NSDate)expirationDate;
- (NSDecimalNumber)balance;
- (NSDecimalNumber)decimalTransitBalance;
- (NSString)appletFormat;
- (NSString)currencyCode;
- (NSString)displayableBalance;
- (PKCurrencyAmount)balanceAmount;
- (PKStoredValuePassProperties)initWithCoder:(id)a3;
- (PKStoredValuePassProperties)initWithTransitAppletState:(id)a3 paymentApplication:(id)a4 fieldCollection:(id)a5;
- (id)balanceWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decimalBalance;
- (id)primaryCashBalance;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletFormat:(id)a3;
- (void)setBalanceAmount:(id)a3;
- (void)setBalances:(id)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setEnrouteTransitTypes:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setInStation:(BOOL)a3;
@end

@implementation PKStoredValuePassProperties

- (PKStoredValuePassProperties)initWithTransitAppletState:(id)a3 paymentApplication:(id)a4 fieldCollection:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v71.receiver = self;
  v71.super_class = (Class)PKStoredValuePassProperties;
  v11 = [(PKStoredValuePassProperties *)&v71 init];
  if (v11)
  {
    v12 = [v9 appletDataFormat];
    uint64_t v13 = [v12 copy];
    appletFormat = v11->_appletFormat;
    v11->_appletFormat = (NSString *)v13;

    v15 = [v8 balance];
    v16 = [v8 balances];
    v17 = [v8 currency];
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      v19 = [v9 appletCurrencyCode];
    }
    v20 = v19;

    if (v15 && v20)
    {
      uint64_t v21 = PKCurrencyAmountCreate(v15, v20, 0);
      balanceAmount = v11->_balanceAmount;
      v11->_balanceAmount = (PKCurrencyAmount *)v21;
    }
    if ([v16 count])
    {
      v51 = v20;
      v52 = v15;
      v54 = v11;
      id v55 = v9;
      id v56 = v8;
      id v53 = v10;
      v23 = [v10 balanceFields];
      v62 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      obj = v23;
      uint64_t v60 = [(PKStoredValuePassBalance *)obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v60)
      {
        uint64_t v58 = *(void *)v68;
        v59 = v16;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v68 != v58) {
              objc_enumerationMutation(obj);
            }
            uint64_t v61 = v24;
            v25 = *(void **)(*((void *)&v67 + 1) + 8 * v24);
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v26 = v16;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v64;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v64 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                  v32 = [v25 foreignReferenceIdentifiers];
                  v33 = [v31 identifier];
                  int v34 = [v32 containsObject:v33];

                  if (v34)
                  {
                    v35 = [[PKStoredValuePassBalance alloc] initWithTransitAppletBalance:v31 balanceField:v25];
                    v36 = [(PKStoredValuePassBalance *)v35 balanceType];
                    char v37 = [v36 isEqualToString:@"com.apple.wallet.storedvaluepassbalancetype.unknown"];

                    if ((v37 & 1) == 0) {
                      [(NSArray *)v62 safelyAddObject:v35];
                    }
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v73 count:16];
              }
              while (v28);
            }

            uint64_t v24 = v61 + 1;
            v16 = v59;
          }
          while (v61 + 1 != v60);
          uint64_t v60 = [(PKStoredValuePassBalance *)obj countByEnumeratingWithState:&v67 objects:v74 count:16];
        }
        while (v60);
      }
      v38 = obj;

      v39 = v62;
      uint64_t v40 = [(NSArray *)v62 copy];
      v11 = v54;
      balances = v54->_balances;
      v54->_balances = (NSArray *)v40;

      id v9 = v55;
      id v8 = v56;
      v15 = v52;
      id v10 = v53;
      v20 = v51;
    }
    else
    {
      v42 = [[PKStoredValuePassBalance alloc] initWithCurrencyAmount:v11->_balanceAmount];
      v38 = v42;
      if (v42)
      {
        v72 = v42;
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        v39 = v11->_balances;
        v11->_balances = (NSArray *)v43;
      }
      else
      {
        v39 = v11->_balances;
        v11->_balances = (NSArray *)MEMORY[0x1E4F1CBF0];
      }
    }

    v11->_blocked = [v8 isBlacklisted];
    v44 = [v8 expirationDate];
    uint64_t v45 = [v44 copy];
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v45;

    v47 = [v8 enrouteTransitTypes];
    uint64_t v48 = [v47 copy];
    enrouteTransitTypes = v11->_enrouteTransitTypes;
    v11->_enrouteTransitTypes = (NSArray *)v48;
  }
  return v11;
}

+ (PKStoredValuePassProperties)passPropertiesForPass:(PKPass *)pass
{
  v3 = [(PKPass *)pass paymentPass];
  v4 = [v3 transitProperties];

  return (PKStoredValuePassProperties *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKStoredValuePassProperties *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      [(id)objc_opt_class() equalityClass];
      if (objc_opt_isKindOfClass())
      {
        [(id)objc_opt_class() equalityClass];
        if (objc_opt_isKindOfClass())
        {
          v6 = v5;
          if (self->_blocked == v6->_blocked)
          {
            expirationDate = self->_expirationDate;
            id v8 = v6->_expirationDate;
            if (expirationDate && v8)
            {
              if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
                goto LABEL_30;
              }
            }
            else if (expirationDate != v8)
            {
              goto LABEL_30;
            }
            appletFormat = self->_appletFormat;
            v11 = v6->_appletFormat;
            if (appletFormat && v11)
            {
              if ((-[NSString isEqual:](appletFormat, "isEqual:") & 1) == 0) {
                goto LABEL_30;
              }
            }
            else if (appletFormat != v11)
            {
              goto LABEL_30;
            }
            balanceAmount = self->_balanceAmount;
            uint64_t v13 = v6->_balanceAmount;
            if (balanceAmount && v13)
            {
              if (!-[PKCurrencyAmount isEqual:](balanceAmount, "isEqual:")) {
                goto LABEL_30;
              }
            }
            else if (balanceAmount != v13)
            {
              goto LABEL_30;
            }
            enrouteTransitTypes = self->_enrouteTransitTypes;
            v15 = v6->_enrouteTransitTypes;
            if (enrouteTransitTypes && v15)
            {
              if (-[NSArray isEqual:](enrouteTransitTypes, "isEqual:"))
              {
LABEL_26:
                balances = self->_balances;
                v17 = v6->_balances;
                if (balances && v17) {
                  char v9 = -[NSArray isEqual:](balances, "isEqual:");
                }
                else {
                  char v9 = balances == v17;
                }
                goto LABEL_31;
              }
            }
            else if (enrouteTransitTypes == v15)
            {
              goto LABEL_26;
            }
          }
LABEL_30:
          char v9 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    char v9 = 0;
  }
LABEL_32:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_appletFormat];
  [v3 safelyAddObject:self->_balanceAmount];
  [v3 safelyAddObject:self->_enrouteTransitTypes];
  [v3 safelyAddObject:self->_balances];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_blocked - v4 + 32 * v4;

  return v5;
}

+ (Class)equalityClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appletFormat copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(PKCurrencyAmount *)self->_balanceAmount copyWithZone:a3];
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  *(unsigned char *)(v5 + 8) = self->_blocked;
  uint64_t v12 = [(NSArray *)self->_enrouteTransitTypes copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSArray *)self->_balances copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKStoredValuePassProperties)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKStoredValuePassProperties;
  uint64_t v5 = [(PKStoredValuePassProperties *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletFormat"];
    appletFormat = v5->_appletFormat;
    v5->_appletFormat = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balanceAmount = v5->_balanceAmount;
    v5->_balanceAmount = (PKCurrencyAmount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_blocked = [v4 decodeBoolForKey:@"blocked"];
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"enrouteTransitTypes"];
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"storedBalances"];
    balances = v5->_balances;
    v5->_balances = (NSArray *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appletFormat = self->_appletFormat;
  id v5 = a3;
  [v5 encodeObject:appletFormat forKey:@"appletFormat"];
  [v5 encodeObject:self->_balanceAmount forKey:@"balance"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_blocked forKey:@"blocked"];
  [v5 encodeObject:self->_enrouteTransitTypes forKey:@"enrouteTransitTypes"];
  [v5 encodeObject:self->_balances forKey:@"storedBalances"];
}

- (NSDecimalNumber)balance
{
  v2 = [(PKStoredValuePassProperties *)self balanceAmount];
  v3 = [v2 amount];

  return (NSDecimalNumber *)v3;
}

- (NSString)currencyCode
{
  v2 = [(PKStoredValuePassProperties *)self balanceAmount];
  v3 = [v2 currency];

  return (NSString *)v3;
}

- (NSString)displayableBalance
{
  v3 = [(PKStoredValuePassProperties *)self balanceAmount];

  if (v3)
  {
    id v4 = [(PKStoredValuePassProperties *)self balanceAmount];
    id v5 = [v4 formattedStringValue];
  }
  else
  {
    uint64_t v6 = [(PKStoredValuePassProperties *)self primaryCashBalance];
    id v4 = v6;
    if (v6)
    {
      v7 = [v6 amount];
      uint64_t v8 = [v4 currencyCode];
      char v9 = PKCurrencyAmountCreate(v7, v8, 0);

      id v5 = [v9 formattedStringValue];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (id)decimalBalance
{
  v2 = [(PKStoredValuePassProperties *)self balanceAmount];
  v3 = [v2 amount];

  return v3;
}

- (BOOL)isInStation
{
  return [(NSArray *)self->_enrouteTransitTypes count] != 0;
}

- (BOOL)isEnRoute
{
  return [(NSArray *)self->_enrouteTransitTypes count] != 0;
}

- (BOOL)isBlacklisted
{
  return self->_blocked;
}

- (id)balanceWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_balances;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "identifier", (void)v13);
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)primaryCashBalance
{
  v2 = [(PKStoredValuePassProperties *)self balances];
  v3 = objc_msgSend(v2, "pk_firstObjectPassingTest:", &__block_literal_global_175);

  return v3;
}

uint64_t __49__PKStoredValuePassProperties_primaryCashBalance__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrencyBalance];
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_blocked = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSArray)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
}

- (NSString)appletFormat
{
  return self->_appletFormat;
}

- (void)setAppletFormat:(id)a3
{
}

- (PKCurrencyAmount)balanceAmount
{
  return self->_balanceAmount;
}

- (void)setBalanceAmount:(id)a3
{
}

- (void)setInStation:(BOOL)a3
{
  self->_inStation = a3;
}

- (NSDecimalNumber)decimalTransitBalance
{
  return self->_decimalTransitBalance;
}

- (NSArray)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_decimalTransitBalance, 0);
  objc_storeStrong((id *)&self->_balanceAmount, 0);
  objc_storeStrong((id *)&self->_appletFormat, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end