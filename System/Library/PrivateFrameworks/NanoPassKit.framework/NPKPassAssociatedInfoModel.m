@interface NPKPassAssociatedInfoModel
+ (id)accountBalanceForAccount:(id)a3;
- (BOOL)_shouldAddCommutePlan:(id)a3 action:(id)a4 withBalancesByID:(id)a5;
- (BOOL)hasDeviceBoundCommutePlans;
- (BOOL)isCommutePlanValueRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomeAccessRestricted;
- (NPKPassAssociatedInfoModel)initWithPass:(id)a3;
- (NPKPassAssociatedInfoModel)initWithPass:(id)a3 transitProperties:(id)a4 balances:(id)a5 commutePlanValueRequired:(BOOL)a6;
- (NSArray)allPassItemsFields;
- (NSArray)balanceFields;
- (NSArray)commutePlanFields;
- (NSArray)dynamicPlans;
- (NSArray)tiles;
- (NSDictionary)accessories;
- (NSSet)balances;
- (PKPaymentPass)pass;
- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription;
- (PKTransitAppletState)transitAppletState;
- (PKTransitPassProperties)transitPassProperties;
- (id)_actionWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)_actionWithIdentifiers:(id)a3 type:(unint64_t)a4;
- (id)_allPassBalanceFieldsWithBalancesByID:(id)a3;
- (id)_balanceByIDWithBalances:(id)a3;
- (id)_balanceFieldBalance:(id)a3 fieldIdentifier:(id)a4;
- (id)_balanceFieldWithPassField:(id)a3 balance:(id)a4 isPrimaryBalance:(BOOL)a5;
- (id)_balanceFieldsWithBalancesByID:(id)a3 passFields:(id)a4 maximumCount:(unint64_t)a5;
- (id)_balancePassFieldsFromPass:(id)a3;
- (id)_commutePlanFieldsWithBalancesByID:(id)a3 dynamicPlansByID:(id)a4;
- (id)_commutePlanWithFelicaPassProperties:(id)a3;
- (id)_commutePlansByIDWithPlans:(id)a3;
- (id)_fieldForCommutePlan:(id)a3 action:(id)a4 isLegacyPass:(BOOL)a5 balancedByID:(id)a6;
- (id)_formattedValueWithCommutePlan:(id)a3 balancesByID:(id)a4;
- (id)_identifierFromAction:(id)a3 type:(unint64_t)a4;
- (id)_primaryDisplayableBalanceFieldWithBalancesByID:(id)a3;
- (id)_rawCountValueWithCommutePlan:(id)a3 balancesByID:(id)a4;
- (id)description;
- (unint64_t)rangingSuspensionReason;
- (void)setAccessories:(id)a3;
- (void)setBalances:(id)a3;
- (void)setCommutePlanValueRequired:(BOOL)a3;
- (void)setDynamicPlans:(id)a3;
- (void)setIsHomeAccessRestricted:(BOOL)a3;
- (void)setPrecursorPassDescription:(id)a3;
- (void)setRangingSuspensionReason:(unint64_t)a3;
- (void)setTiles:(id)a3;
- (void)setTransitAppletState:(id)a3;
- (void)setTransitPassProperties:(id)a3;
- (void)updateItemFields;
@end

@implementation NPKPassAssociatedInfoModel

+ (id)accountBalanceForAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 feature] == 4)
  {
    v4 = [v3 appleBalanceDetails];
    v5 = [v4 currentBalance];

    if (v5)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F5BFB8]) initWithIdentifier:@"account-balance-identifier" forCurrencyAmount:v5];
    }
    else
    {
      v7 = pk_General_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        v9 = pk_General_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v3 accountIdentifier];
          v11 = [v3 appleBalanceDetails];
          int v13 = 138412546;
          v14 = v10;
          __int16 v15 = 2112;
          v16 = v11;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Account apple balance not available for account with identifier %@, account details: %@", (uint8_t *)&v13, 0x16u);
        }
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NPKPassAssociatedInfoModel)initWithPass:(id)a3
{
  return [(NPKPassAssociatedInfoModel *)self initWithPass:a3 transitProperties:0 balances:0 commutePlanValueRequired:0];
}

- (NPKPassAssociatedInfoModel)initWithPass:(id)a3 transitProperties:(id)a4 balances:(id)a5 commutePlanValueRequired:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPassAssociatedInfoModel;
  v14 = [(NPKPassAssociatedInfoModel *)&v20 init];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    v16 = v12;
    if (!v12)
    {
      v16 = [MEMORY[0x263F5C2C8] passPropertiesForPass:v11];
    }
    uint64_t v17 = [v16 copy];
    transitPassProperties = v15->_transitPassProperties;
    v15->_transitPassProperties = (PKTransitPassProperties *)v17;

    if (!v12) {
    objc_storeStrong((id *)&v15->_balances, a5);
    }
    v15->_commutePlanValueRequired = a6;
    [(NPKPassAssociatedInfoModel *)v15 updateItemFields];
  }

  return v15;
}

- (NSArray)allPassItemsFields
{
  return [(NSArray *)self->_balanceFields arrayByAddingObjectsFromArray:self->_commutePlanFields];
}

- (void)setTransitPassProperties:(id)a3
{
  if (self->_transitPassProperties != a3)
  {
    v4 = (PKTransitPassProperties *)[a3 copy];
    transitPassProperties = self->_transitPassProperties;
    self->_transitPassProperties = v4;

    [(NPKPassAssociatedInfoModel *)self updateItemFields];
  }
}

- (void)setBalances:(id)a3
{
  if (self->_balances != a3)
  {
    v4 = (NSSet *)[a3 copy];
    balances = self->_balances;
    self->_balances = v4;

    [(NPKPassAssociatedInfoModel *)self updateItemFields];
  }
}

- (void)setDynamicPlans:(id)a3
{
  if (self->_dynamicPlans != a3)
  {
    v4 = (NSArray *)[a3 copy];
    dynamicPlans = self->_dynamicPlans;
    self->_dynamicPlans = v4;

    [(NPKPassAssociatedInfoModel *)self updateItemFields];
  }
}

- (void)setCommutePlanValueRequired:(BOOL)a3
{
  if (self->_commutePlanValueRequired != a3)
  {
    self->_commutePlanValueRequired = a3;
    [(NPKPassAssociatedInfoModel *)self updateItemFields];
  }
}

- (void)setTiles:(id)a3
{
  if (self->_tiles != a3)
  {
    v4 = (NSArray *)[a3 copy];
    tiles = self->_tiles;
    self->_tiles = v4;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NPKPassAssociatedInfoModel *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PKPaymentPass *)self->_pass uniqueID];
      v7 = [(PKPaymentPass *)v5->_pass uniqueID];
      if (NPKIsEqual(v6, v7)
        && NPKIsEqual(self->_balanceFields, v5->_balanceFields)
        && NPKIsEqual(self->_balances, v5->_balances)
        && NPKIsEqual(self->_transitPassProperties, v5->_transitPassProperties)
        && NPKIsEqual(self->_transitAppletState, v5->_transitAppletState)
        && NPKIsEqual(self->_tiles, v5->_tiles)
        && NPKIsEqual(self->_dynamicPlans, v5->_dynamicPlans)
        && self->_rangingSuspensionReason == v5->_rangingSuspensionReason)
      {
        char v8 = NPKIsEqual(self->_precursorPassDescription, v5->_precursorPassDescription);
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NPKPassAssociatedInfoModel *)self commutePlanFields];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDeviceBound])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateItemFields
{
  uint64_t v3 = [(NPKPassAssociatedInfoModel *)self _balanceByIDWithBalances:self->_balances];
  uint64_t v4 = [(NPKPassAssociatedInfoModel *)self _commutePlansByIDWithPlans:self->_dynamicPlans];
  v5 = [(NPKPassAssociatedInfoModel *)self _primaryDisplayableBalanceFieldWithBalancesByID:v3];
  v6 = [(NPKPassAssociatedInfoModel *)self _allPassBalanceFieldsWithBalancesByID:v3];
  long long v7 = v6;
  if (v5)
  {
    long long v8 = [MEMORY[0x263EFF980] array];
    [v8 addObject:v5];
    long long v9 = [v5 identifier];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __46__NPKPassAssociatedInfoModel_updateItemFields__block_invoke;
    v23 = &unk_2644D68A0;
    id v24 = v9;
    id v25 = v8;
    id v10 = v8;
    id v11 = v9;
    [v7 enumerateObjectsUsingBlock:&v20];
    uint64_t v12 = (NSArray *)objc_msgSend(v10, "copy", v20, v21, v22, v23);
    balanceFields = self->_balanceFields;
    self->_balanceFields = v12;
  }
  else
  {
    v14 = (NSArray *)[v6 copy];
    __int16 v15 = self->_balanceFields;
    self->_balanceFields = v14;
  }
  v16 = [(NPKPassAssociatedInfoModel *)self _commutePlanFieldsWithBalancesByID:v3 dynamicPlansByID:v4];
  commutePlanFields = self->_commutePlanFields;
  self->_commutePlanFields = v16;

  v18 = (void *)MEMORY[0x263F5BF50];
  v19 = [(PKPaymentPass *)self->_pass uniqueID];
  [v18 npkClearTransitValuePendingStateIfNecessaryForPassWithID:v19 withBalanceFields:self->_balanceFields commutePlanFields:self->_commutePlanFields];
}

void __46__NPKPassAssociatedInfoModel_updateItemFields__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  v5 = [v3 identifier];
  LOBYTE(v4) = [v4 isEqualToString:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)_primaryDisplayableBalanceFieldWithBalancesByID:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPass *)self->_pass isContentLoaded]
    && [(PKPaymentPass *)self->_pass isStoredValuePass])
  {
    v5 = [(NPKPassAssociatedInfoModel *)self _balancePassFieldsFromPass:self->_pass];
    id v6 = [(NPKPassAssociatedInfoModel *)self _balanceFieldsWithBalancesByID:v4 passFields:v5 maximumCount:1];

    if ([v6 count])
    {
      uint64_t v7 = [v6 firstObject];
LABEL_7:
      long long v8 = (void *)v7;
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = [v4 objectForKey:@"account-balance-identifier"];
    if (v6)
    {
      uint64_t v7 = [(NPKPassAssociatedInfoModel *)self _balanceFieldBalance:v6 fieldIdentifier:@"account-balance-item"];
      goto LABEL_7;
    }
  }
  long long v8 = 0;
LABEL_9:

  return v8;
}

- (id)_allPassBalanceFieldsWithBalancesByID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if ([(PKPaymentPass *)self->_pass isContentLoaded])
  {
    id v6 = [(NPKPassAssociatedInfoModel *)self _balancePassFieldsFromPass:self->_pass];
    uint64_t v7 = [(NPKPassAssociatedInfoModel *)self _balanceFieldsWithBalancesByID:v4 passFields:v6 maximumCount:0];
    [v5 addObjectsFromArray:v7];
  }
  return v5;
}

- (id)_balanceFieldBalance:(id)a3 fieldIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [NPKBalanceField alloc];
  long long v8 = PKLocalizedLynxString(&cfstr_PassBalanceTit.isa);
  long long v9 = [v6 formattedValue];
  id v10 = [(NPKBalanceField *)v7 initWithBalance:v6 label:v8 formattedValue:v9 identifier:v5 primaryBalance:1 action:0 pendingUpdateExpireDate:0];

  return v10;
}

- (id)_balanceFieldsWithBalancesByID:(id)a3 passFields:(id)a4 maximumCount:(unint64_t)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = *MEMORY[0x263F5C6B8];
  uint64_t v12 = [v8 objectForKey:*MEMORY[0x263F5C6B8]];
  id v13 = v12;
  BOOL v48 = v12 == 0;
  v45 = self;
  unint64_t v46 = a5;
  id v42 = v9;
  if (v12)
  {
    pass = self->_pass;
    __int16 v15 = [v12 value];
    v16 = [(PKPaymentPass *)pass npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:v11 currentBalance:v15];

    uint64_t v17 = [(NPKPassAssociatedInfoModel *)self _actionWithIdentifier:0 type:1];
    v18 = [NPKBalanceField alloc];
    v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    uint64_t v20 = [v19 localizedStringForKey:@"PASS_DETAILS_HEADER_TRANSIT_BALANCE" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    uint64_t v21 = [v13 formattedValue];
    v22 = [(NPKBalanceField *)v18 initWithBalance:v13 label:v20 formattedValue:v21 identifier:v11 primaryBalance:1 action:v17 pendingUpdateExpireDate:v16];

    self = v45;
    [v10 addObject:v22];

    a5 = v46;
    id v9 = v42;
  }
  if ([v8 count])
  {
    v41 = v13;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = v9;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v55;
      id v43 = v23;
      v44 = v10;
      uint64_t v47 = *(void *)v55;
      while (2)
      {
        uint64_t v27 = 0;
        uint64_t v49 = v25;
        do
        {
          if (*(void *)v55 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v54 + 1) + 8 * v27);
          if ([v28 foreignReferenceType])
          {
            v29 = [v28 foreignReferenceIdentifiers];
            if (v29)
            {
              v30 = v29;
              if ([v29 count] == 1)
              {
                v31 = [v30 anyObject];
                v32 = [v8 objectForKeyedSubscript:v31];
              }
              else
              {
                v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v30, "count"));
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v33 = v30;
                uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v58 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v51;
                  do
                  {
                    for (uint64_t i = 0; i != v35; ++i)
                    {
                      if (*(void *)v51 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      v38 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * i)];
                      [v31 npkSafelyAddObject:v38];
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v58 count:16];
                  }
                  while (v35);
                }

                v32 = (void *)[objc_alloc(MEMORY[0x263F5BFB8]) initWithComponentBalances:v31 identifiers:v33];
                id v10 = v44;
                self = v45;
                a5 = v46;
                id v23 = v43;
              }

              if (v32)
              {
                v39 = [(NPKPassAssociatedInfoModel *)self _balanceFieldWithPassField:v28 balance:v32 isPrimaryBalance:v48];
                if (v39)
                {
                  [v10 addObject:v39];
                  BOOL v48 = 0;
                }
                if (a5 && [v10 count] >= a5)
                {

                  goto LABEL_32;
                }
              }
              uint64_t v26 = v47;
              uint64_t v25 = v49;
            }
          }
          ++v27;
        }
        while (v27 != v25);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_32:

    id v13 = v41;
    id v9 = v42;
  }

  return v10;
}

- (id)_balanceByIDWithBalances:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__NPKPassAssociatedInfoModel__balanceByIDWithBalances___block_invoke;
  v8[3] = &unk_2644D68C8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __55__NPKPassAssociatedInfoModel__balanceByIDWithBalances___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 identifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (([v3 isExpired] & 1) == 0) {
          [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_commutePlansByIDWithPlans:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "uniqueIdentifier", (void)v13);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_balanceFieldWithPassField:(id)a3 balance:(id)a4 isPrimaryBalance:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v10 = [v9 localizedTitle];
  long long v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    long long v13 = [v8 label];
    long long v14 = v13;
    if (v13)
    {
      id v12 = v13;
    }
    else
    {
      long long v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
      id v12 = [v15 localizedStringForKey:@"PASS_DETAILS_HEADER_TRANSIT_BALANCE" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    }
  }

  uint64_t v16 = [v9 formattedValue];
  uint64_t v17 = (void *)v16;
  if (v12 && v16)
  {
    uint64_t v18 = [v9 identifiers];
    pass = self->_pass;
    uint64_t v20 = [v18 anyObject];
    uint64_t v21 = [v9 value];
    v22 = [(PKPaymentPass *)pass npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:v20 currentBalance:v21];

    id v23 = [(NPKPassAssociatedInfoModel *)self _actionWithIdentifiers:v18 type:1];
    uint64_t v24 = [NPKBalanceField alloc];
    uint64_t v25 = [v18 anyObject];
    uint64_t v26 = [(NPKBalanceField *)v24 initWithBalance:v9 label:v12 formattedValue:v17 identifier:v25 primaryBalance:v5 action:v23 pendingUpdateExpireDate:v22];
  }
  else
  {
    uint64_t v27 = pk_General_log();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      v29 = pk_General_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = v9;
        __int16 v33 = 2112;
        id v34 = v12;
        __int16 v35 = 2112;
        uint64_t v36 = v17;
        _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: Missing data from balance:%@ localizedTitle:%@ formattedValue:%@", buf, 0x20u);
      }
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_commutePlanFieldsWithBalancesByID:(id)a3 dynamicPlansByID:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(PKPaymentPass *)self->_pass isTransitPass])
  {
    id v49 = (id)MEMORY[0x263EFFA68];
    goto LABEL_28;
  }
  id v49 = [MEMORY[0x263EFF980] array];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = [(NPKPassAssociatedInfoModel *)self pass];
  uint64_t v46 = [v10 transitCommutePlanType];

  long long v11 = [(NPKPassAssociatedInfoModel *)self pass];
  id v12 = [v11 transitCommutePlans];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __82__NPKPassAssociatedInfoModel__commutePlanFieldsWithBalancesByID_dynamicPlansByID___block_invoke;
  v58[3] = &unk_2644D68F0;
  v58[4] = self;
  id v13 = v6;
  id v59 = v13;
  id v14 = v9;
  id v60 = v14;
  id v48 = v7;
  id v61 = v7;
  id v15 = v8;
  id v62 = v15;
  [v12 enumerateObjectsUsingBlock:v58];

  uint64_t v47 = v15;
  if ([v14 count])
  {
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (!v17) {
      goto LABEL_24;
    }
    uint64_t v18 = v17;
    id v44 = v14;
    id v45 = v6;
    uint64_t v19 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "identifier", v44, v45);
        id v23 = [(NPKPassAssociatedInfoModel *)self _actionWithIdentifier:v22 type:2];

        uint64_t v24 = [(NPKPassAssociatedInfoModel *)self pass];
        uint64_t v25 = [v24 transitCommutePlanType];

        if ([(NPKPassAssociatedInfoModel *)self _shouldAddCommutePlan:v21 action:v23 withBalancesByID:v13])
        {
          uint64_t v26 = [(NPKPassAssociatedInfoModel *)self _fieldForCommutePlan:v21 action:v23 isLegacyPass:v25 == 1 balancedByID:v13];
          [v49 addObject:v26];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v18);
  }
  else
  {
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    id v16 = v15;
    uint64_t v27 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (!v27) {
      goto LABEL_24;
    }
    uint64_t v28 = v27;
    id v44 = v14;
    id v45 = v6;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v16);
        }
        v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        id v32 = objc_msgSend(v31, "identifier", v44, v45);
        __int16 v33 = [(NPKPassAssociatedInfoModel *)self _actionWithIdentifier:v32 type:2];

        id v34 = [(NPKPassAssociatedInfoModel *)self pass];
        uint64_t v35 = [v34 transitCommutePlanType];

        if ([(NPKPassAssociatedInfoModel *)self _shouldAddCommutePlan:v31 action:v33 withBalancesByID:v13])
        {
          uint64_t v36 = [(NPKPassAssociatedInfoModel *)self _fieldForCommutePlan:v31 action:v33 isLegacyPass:v35 == 1 balancedByID:v13];
          [v49 addObject:v36];
        }
      }
      uint64_t v28 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v28);
  }
  id v14 = v44;
  id v6 = v45;
LABEL_24:

  id v7 = v48;
  if (v46 == 1
    || ([(NPKPassAssociatedInfoModel *)self pass],
        uint64_t v37 = objc_claimAutoreleasedReturnValue(),
        [v37 transitCommutePlans],
        v38 = objc_claimAutoreleasedReturnValue(),
        uint64_t v39 = [v38 count],
        v38,
        v37,
        !v39))
  {
    v40 = [(NPKPassAssociatedInfoModel *)self transitPassProperties];
    v41 = [v40 felicaProperties];
    id v42 = [(NPKPassAssociatedInfoModel *)self _commutePlanWithFelicaPassProperties:v41];
    [v49 addObjectsFromArray:v42];
  }
LABEL_28:

  return v49;
}

void __82__NPKPassAssociatedInfoModel__commutePlanFieldsWithBalancesByID_dynamicPlansByID___block_invoke(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1[4];
  BOOL v5 = [v3 identifier];
  id v6 = [v4 _actionWithIdentifier:v5 type:2];

  if ([v3 requiresAppletSourceOfTruth])
  {
    v30 = v6;
    uint64_t v29 = [v3 passFieldForKey:*MEMORY[0x263F5C878]];
    [v29 foreignReferenceIdentifiers];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v28 = v38 = 0u;
    id v7 = [v28 allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [a1[5] objectForKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * i)];

        if (v12)
        {
          [a1[6] addObject:v3];
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
LABEL_14:

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = a1;
    id v14 = [a1[7] allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (!v15) {
      goto LABEL_32;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
LABEL_16:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * v18);
      uint64_t v20 = [v3 identifier];
      uint64_t v21 = [v19 identifier];
      id v22 = v20;
      id v23 = v21;
      if (v22 == v23) {
        break;
      }
      uint64_t v24 = v23;
      if (v22 && v23)
      {
        char v25 = [v22 isEqualToString:v23];

        if ((v25 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }

LABEL_29:
LABEL_30:
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (!v16)
        {
LABEL_32:

          id v6 = v30;
          goto LABEL_33;
        }
        goto LABEL_16;
      }
    }

LABEL_25:
    id v22 = [v3 updateWithCommutePlanDetail:v19];
    [v30 setAssociatedPlan:v22];
    int v26 = [v22 hasExpiredPlanDate];
    uint64_t v27 = 6;
    if (v26) {
      uint64_t v27 = 8;
    }
    [v13[v27] addObject:v22];
    goto LABEL_29;
  }
  if ([a1[4] _shouldAddCommutePlan:v3 action:v6 withBalancesByID:a1[5]]) {
    [a1[6] addObject:v3];
  }
LABEL_33:
}

- (id)_fieldForCommutePlan:(id)a3 action:(id)a4 isLegacyPass:(BOOL)a5 balancedByID:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v36 = a4;
  id v11 = a6;
  id v12 = [v10 title];
  id v13 = v12;
  if (a5)
  {
    uint64_t v14 = [v12 value];

    uint64_t v15 = [v10 title];
    [v15 label];
  }
  else
  {
    uint64_t v14 = [v12 label];

    uint64_t v15 = [v10 title];
    [v15 value];
  long long v35 = };

  uint64_t v16 = [NPKDateRange alloc];
  uint64_t v17 = [v10 startDate];
  uint64_t v18 = [v10 expiryDate];
  long long v34 = [(NPKDateRange *)v16 initWithStartDate:v17 expirationDate:v18 formatterStyle:3];

  uint64_t v19 = [(NPKPassAssociatedInfoModel *)self _rawCountValueWithCommutePlan:v10 balancesByID:v11];
  pass = self->_pass;
  uint64_t v21 = [v10 uniqueIdentifier];
  id v22 = [v10 expiryDate];
  id v23 = [(PKPaymentPass *)pass npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:v21 expiryDate:v22 rawCountValue:v19];

  uint64_t v24 = pk_General_log();
  LODWORD(v21) = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    char v25 = pk_General_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v38 = v14;
      __int16 v39 = 2112;
      v40 = v19;
      __int16 v41 = 2112;
      id v42 = v23;
      _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Creating commute plan field with label: %@, tripCount: %@, pendingUpdateExpireDate: %@", buf, 0x20u);
    }
  }
  int v26 = [NPKCommutePlanField alloc];
  uint64_t v27 = [(NPKPassAssociatedInfoModel *)self _formattedValueWithCommutePlan:v10 balancesByID:v11];
  [v10 uniqueIdentifier];
  v29 = uint64_t v28 = (void *)v14;
  v30 = [v10 details];
  LOBYTE(v32) = [v10 isDeviceBound];
  long long v33 = [(NPKCommutePlanField *)v26 initWithLabel:v28 detailLabel:v35 formattedValue:v27 rawCountValue:v19 usageDateRange:v34 identifier:v29 details:v30 action:v36 isDeviceBound:v32 pendingUpdateExpireDate:v23];

  return v33;
}

- (BOOL)_shouldAddCommutePlan:(id)a3 action:(id)a4 withBalancesByID:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 properties];
  id v12 = [v8 expiryDate];
  if (!v12) {
    goto LABEL_9;
  }
  BOOL v13 = (v11 & 1) == 0;
  uint64_t v14 = [v8 expiryDate];
  uint64_t v15 = [MEMORY[0x263EFF910] now];
  uint64_t v16 = [v14 compare:v15];

  char v17 = v16 == 1 || v13;
  if ((v17 & 1) != 0
    || ([v9 isActionAvailable] & 1) != 0
    || ([v8 isPlanDisplayable] & 1) != 0)
  {
LABEL_9:
    if ([(NPKPassAssociatedInfoModel *)self isCommutePlanValueRequired]
      && ([v8 properties] & 4) != 0)
    {
      uint64_t v38 = 0;
      __int16 v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 0;
      *(void *)uint64_t v46 = 0;
      *(void *)&v46[8] = v46;
      *(void *)&v46[16] = 0x3032000000;
      uint64_t v47 = __Block_byref_object_copy__17;
      id v48 = __Block_byref_object_dispose__17;
      id v49 = objc_alloc_init(MEMORY[0x263F089D8]);
      uint64_t v19 = [v8 details];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __76__NPKPassAssociatedInfoModel__shouldAddCommutePlan_action_withBalancesByID___block_invoke;
      v33[3] = &unk_2644D6918;
      id v36 = v46;
      long long v37 = &v38;
      id v34 = v10;
      id v35 = v9;
      [v19 enumerateObjectsUsingBlock:v33];

      if (!*((unsigned char *)v39 + 24))
      {
        uint64_t v20 = pk_General_log();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (v21)
        {
          id v22 = pk_General_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v8 identifier];
            uint64_t v24 = *(void *)(*(void *)&v46[8] + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v23;
            __int16 v44 = 2112;
            uint64_t v45 = v24;
            _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: should not add commute plan with identifier:%@. decision detail: %@", buf, 0x16u);
          }
        }
      }
      BOOL v18 = *((unsigned char *)v39 + 24) != 0;

      _Block_object_dispose(v46, 8);
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    char v25 = NSString;
    int v26 = [v8 expiryDate];
    uint64_t v27 = [v25 stringWithFormat:@" is timed commute plan:%d, is expired:%d, expiry date:%@, is action available:%d", 1, 1, v26, objc_msgSend(v9, "isActionAvailable")];

    uint64_t v28 = pk_General_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      v30 = pk_General_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = [v8 identifier];
        *(_DWORD *)uint64_t v46 = 138412546;
        *(void *)&v46[4] = v31;
        *(_WORD *)&v46[12] = 2112;
        *(void *)&v46[14] = v27;
        _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: should not add commute plan with identifier:%@. decision detail:%@", v46, 0x16u);
      }
    }

    BOOL v18 = 0;
  }

  return v18;
}

void __76__NPKPassAssociatedInfoModel__shouldAddCommutePlan_action_withBalancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = NSString;
  id v9 = [v6 key];
  id v10 = [v6 label];
  char v11 = [v6 value];
  id v12 = [v6 foreignReferenceIdentifiers];
  BOOL v13 = [v8 stringWithFormat:@"\nverifying pass field with key - label - value - fRefID:%@ - %@ - %@ - %@.", v9, v10, v11, v12];
  [v7 appendString:v13];

  [v6 foreignReferenceIdentifiers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ((unint64_t)([v6 foreignReferenceType] - 1) <= 1)
        {
          uint64_t v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v19];
          BOOL v21 = [v20 value];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21 != 0;

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
            || ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:@" balance by ID no value."], (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isActionAvailable")) != 0))
          {
            char v22 = 1;
          }
          else
          {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:@" action is not available."];
            char v22 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          }
          *a4 = v22;
          goto LABEL_15;
        }
        if (a4) {
          goto LABEL_15;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)_formattedValueWithCommutePlan:(id)a3 balancesByID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 properties] & 4) != 0)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__17;
    uint64_t v17 = __Block_byref_object_dispose__17;
    id v18 = 0;
    id v8 = [v5 details];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__NPKPassAssociatedInfoModel__formattedValueWithCommutePlan_balancesByID___block_invoke;
    v10[3] = &unk_2644D6940;
    id v11 = v6;
    id v12 = &v13;
    [v8 enumerateObjectsUsingBlock:v10];

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __74__NPKPassAssociatedInfoModel__formattedValueWithCommutePlan_balancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 foreignReferenceIdentifiers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ((unint64_t)([v5 foreignReferenceType] - 1) <= 1)
        {
          id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 value];

          if (!v13)
          {
            id v14 = pk_General_log();
            BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

            uint64_t v13 = &unk_26D043928;
            if (v15)
            {
              uint64_t v16 = pk_General_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
                *(_DWORD *)buf = 138412546;
                id v28 = v5;
                __int16 v29 = 2112;
                v30 = v17;
                _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: Using default balance value 0 for field:%@ balance:%@", buf, 0x16u);
              }
              uint64_t v13 = &unk_26D043928;
            }
          }
          [v5 unitType];
          PKLocalizedPaymentUnitKeyForType();
          id v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (v18) {
            PKLocalizedPaymentString(v18, &cfstr_Lu_0.isa, [v13 unsignedLongValue]);
          }
          else {
          uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v13, "integerValue"));
          }
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          BOOL v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          *a4 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
}

- (id)_rawCountValueWithCommutePlan:(id)a3 balancesByID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__17;
  uint64_t v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  if (([v5 properties] & 4) != 0)
  {
    uint64_t v8 = [v5 details];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__NPKPassAssociatedInfoModel__rawCountValueWithCommutePlan_balancesByID___block_invoke;
    v10[3] = &unk_2644D6968;
    id v12 = &v13;
    id v11 = v6;
    [v8 enumerateObjectsUsingBlock:v10];

    id v7 = (id)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __73__NPKPassAssociatedInfoModel__rawCountValueWithCommutePlan_balancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  [v6 foreignReferenceIdentifiers];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
      if ((unint64_t)(objc_msgSend(v6, "foreignReferenceType", (void)v17) - 1) <= 1)
      {
        uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 value];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        *a4 = 1;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_commutePlanWithFelicaPassProperties:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = v4;
  if (!v3) {
    goto LABEL_21;
  }
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke;
  v70[3] = &unk_2644D6990;
  id v66 = v4;
  id v71 = v66;
  id v6 = (void (**)(void, void *, void *, void *, void *))MEMORY[0x223C37380](v70);
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v3 hasShinkansenTicket];
      *(_DWORD *)buf = 67109120;
      int v73 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKTransitBalanceModel: has Shinkansen ticket:%d", buf, 8u);
    }
  }
  v67 = v5;
  uint64_t v65 = v6;
  if ([v3 hasShinkansenTicket])
  {
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke_103;
    v68[3] = &unk_2644D69B8;
    v69 = v6;
    uint64_t v62 = MEMORY[0x223C37380](v68);
    uint64_t v11 = [v3 shinkansenValidityTerm];
    uint64_t v12 = [v3 shinkansenValidityStartDate];
    uint64_t v13 = [v12 calendar];
    v58 = v11;
    uint64_t v14 = [v11 integerValue];
    long long v57 = v12;
    uint64_t v15 = [v12 date];
    long long v56 = v13;
    uint64_t v16 = [v13 dateByAddingUnit:16 value:v14 toDate:v15 options:0];

    long long v55 = [v3 shinkansenValidityStartDate];
    long long v17 = [v55 date];
    long long v18 = [v3 shinkansenOriginStation];
    long long v19 = [v3 shinkansenDestinationStation];
    long long v20 = [v3 shinkansenDepartureTime];
    BOOL v21 = [v3 shinkansenArrivalTime];
    uint64_t v22 = [v3 shinkansenTrainName];
    long long v23 = [v3 shinkansenCarNumber];
    long long v24 = [v3 displayableShinkansenSeat];
    id v60 = (void *)v16;
    (*(void (**)(uint64_t, void *, void *, void *, void *, void *, void *, void *, void *, uint64_t, _BYTE))(v62 + 16))(v62, v17, v18, v19, v20, v21, v22, v23, v24, v16, [v3 isShinkansenTicketActive]);

    long long v25 = [v3 shinkansenSecondaryOriginStation];
    if (v25
      || ([v3 shinkansenSecondaryDestinationStation],
          (long long v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      long long v26 = (void (**)(void, void, void, void, void, void, void, void, void, void, _DWORD))v62;
    }
    else
    {
      long long v53 = [v3 shinkansenSecondaryTrainName];

      long long v26 = (void (**)(void, void, void, void, void, void, void, void, void, void, _DWORD))v62;
      if (!v53) {
        goto LABEL_11;
      }
    }
    v63 = [v3 shinkansenValidityStartDate];
    uint64_t v27 = [v63 date];
    id v28 = [v3 shinkansenSecondaryOriginStation];
    __int16 v29 = [v3 shinkansenSecondaryDestinationStation];
    v30 = [v3 shinkansenSecondaryDepartureTime];
    long long v31 = [v3 shinkansenSecondaryArrivalTime];
    uint64_t v32 = [v3 shinkansenSecondaryTrainName];
    long long v33 = [v3 shinkansenSecondaryCarNumber];
    id v34 = [v3 displayableShinkansenSecondarySeat];
    LOBYTE(v54) = [v3 isShinkansenTicketActive];
    ((void (**)(void, void *, void *, void *, void *, void *, void *, void *, void *, void *, int))v26)[2](v26, v27, v28, v29, v30, v31, v32, v33, v34, v60, v54);

LABEL_11:
    id v6 = v65;
  }
  id v35 = pk_General_log();
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

  if (v36)
  {
    long long v37 = pk_General_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = [v3 hasGreenCarTicket];
      *(_DWORD *)buf = 67109120;
      int v73 = v38;
      _os_log_impl(&dword_21E92F000, v37, OS_LOG_TYPE_DEFAULT, "Notice: NPKTransitBalanceModel: has Green Car ticket ticket:%d", buf, 8u);
    }
  }
  if ([v3 hasGreenCarTicket])
  {
    __int16 v39 = [MEMORY[0x263EFF980] array];
    uint64_t v40 = [v3 greenCarValidityStartDate];
    char v41 = [v40 calendar];
    id v59 = v40;
    id v42 = [v40 date];
    v64 = v41;
    id v61 = [v41 dateByAddingUnit:16 value:1 toDate:v42 options:0];

    uint64_t v43 = [v3 greenCarOriginStation];
    __int16 v44 = [v3 greenCarDestinationStation];
    uint64_t v45 = __NPKRouteDescriptionForStations(v43, v44);
    if (v45) {
      [v39 addObject:v45];
    }
    uint64_t v46 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    uint64_t v47 = [v46 localizedStringForKey:@"PASS_DETAILS_HEADER_GREEN_CAR_UPGRADE" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];

    id v48 = [v39 componentsJoinedByString:@"\n"];
    id v49 = [v3 greenCarValidityStartDate];
    uint64_t v50 = [v49 date];

    id v6 = v65;
    v65[2](v65, v47, v48, v50, v61);
  }
  id v51 = v66;

  id v5 = v67;
LABEL_21:

  return v5;
}

void __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11
    || ([MEMORY[0x263EFF910] now],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 compare:v11],
        v12,
        v13 != 1))
  {
    uint64_t v14 = [[NPKDateRange alloc] initWithStartDate:v10 expirationDate:v11 formatterStyle:3];
    uint64_t v15 = [NPKCommutePlanField alloc];
    uint64_t v16 = [MEMORY[0x263F08C38] UUID];
    long long v17 = [v16 UUIDString];
    LOBYTE(v19) = 0;
    long long v18 = [(NPKCommutePlanField *)v15 initWithLabel:v20 detailLabel:v9 formattedValue:0 rawCountValue:0 usageDateRange:v14 identifier:v17 details:0 action:0 isDeviceBound:v19 pendingUpdateExpireDate:0];

    [*(id *)(a1 + 32) addObject:v18];
  }
}

void __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke_103(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, char a11)
{
  id v65 = a3;
  id v17 = a4;
  id v64 = a5;
  id v63 = a6;
  id v62 = a7;
  id v66 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = (void *)MEMORY[0x263EFF910];
  id v58 = a2;
  BOOL v21 = [v20 date];
  id v59 = v19;
  uint64_t v22 = [v21 compare:v19];

  long long v23 = [MEMORY[0x263EFF980] array];
  if (v22 == -1 && (a11 & 1) == 0)
  {
    long long v24 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    long long v25 = [v24 localizedStringForKey:@"PASS_DETAILS_STATUS_VALUE_INACTIVE" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    [v23 addObject:v25];
  }
  id v26 = v18;
  uint64_t v27 = __NPKRouteDescriptionForStations(v65, v17);
  if (v27) {
    [v23 addObject:v27];
  }
  [v64 date];
  v61 = id v28 = v66;
  if (v61)
  {
    id v29 = v17;
    v30 = [MEMORY[0x263F08790] localizedStringFromDate:v61 dateStyle:0 timeStyle:1];
    long long v31 = NSString;
    uint64_t v32 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    long long v33 = [v32 localizedStringForKey:@"PASS_DETAILS_VALUE_DEPARTURE_TIME" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    id v34 = objc_msgSend(v31, "stringWithFormat:", v33, v30);

    if (v34) {
      [v23 addObject:v34];
    }

    id v17 = v29;
  }
  id v35 = [v63 date];
  if (v35)
  {
    id v36 = v17;
    long long v37 = [MEMORY[0x263F08790] localizedStringFromDate:v35 dateStyle:0 timeStyle:1];
    int v38 = NSString;
    __int16 v39 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    uint64_t v40 = [v39 localizedStringForKey:@"PASS_DETAILS_VALUE_ARRIVAL_TIME" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    char v41 = objc_msgSend(v38, "stringWithFormat:", v40, v37);

    if (v41) {
      [v23 addObject:v41];
    }

    id v17 = v36;
    id v28 = v66;
  }
  id v42 = v62;
  if (v62) {
    [v23 addObject:v62];
  }
  uint64_t v43 = v26;
  if (v28)
  {
    __int16 v44 = NSString;
    uint64_t v45 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    uint64_t v46 = [v45 localizedStringForKey:@"PASS_DETAILS_VALUE_CAR_ASSIGNMENT" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    uint64_t v47 = [v28 stringValue];
    id v48 = objc_msgSend(v44, "stringWithFormat:", v46, v47);

    if (v48) {
      [v23 addObject:v48];
    }

    id v42 = v62;
    uint64_t v43 = v26;
  }
  if (v43)
  {
    id v49 = NSString;
    uint64_t v50 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
    uint64_t v51 = [v50 localizedStringForKey:@"PASS_DETAILS_VALUE_SEAT_ASSIGNMENT" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
    long long v52 = v43;
    long long v53 = (void *)v51;
    int v54 = objc_msgSend(v49, "stringWithFormat:", v51, v52);

    if (v54) {
      [v23 addObject:v54];
    }

    uint64_t v43 = v26;
  }
  long long v55 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
  long long v56 = [v55 localizedStringForKey:@"PASS_DETAILS_HEADER_SHINKANSEN" value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];

  long long v57 = [v23 componentsJoinedByString:@"\n"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_actionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  if (a3)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(NPKPassAssociatedInfoModel *)self _actionWithIdentifiers:v6 type:a4];

  return v7;
}

- (id)_actionWithIdentifiers:(id)a3 type:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(PKPaymentPass *)self->_pass availableActions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [(NPKPassAssociatedInfoModel *)self _identifierFromAction:v12 type:a4];
        if ([v12 type] == a4 && (!v6 || (objc_msgSend(v6, "containsObject:", v13) & 1) != 0))
        {
          id v14 = v12;

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)_identifierFromAction:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 2)
  {
    uint64_t v7 = [v5 associatedPlanIdentifier];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v7 = [v5 associatedEnteredValueIdentifier];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)_balancePassFieldsFromPass:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isStoredValuePass])
  {
    id v31 = [v3 balanceFields];
  }
  else
  {
    id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v3 isAccessPass])
    {
      id v4 = [v3 balanceFields];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        id v6 = [v3 balanceFields];
        [v31 addObjectsFromArray:v6];
      }
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = [v3 frontFieldBuckets];
    [v7 addObjectsFromArray:v8];

    id v26 = v3;
    uint64_t v9 = [v3 backFieldBuckets];
    [v7 addObjectsFromArray:v9];

    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v7;
    uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v43;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v11;
          uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v33 = v12;
          uint64_t v13 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v39;
            do
            {
              uint64_t v16 = 0;
              uint64_t v32 = v14;
              do
              {
                if (*(void *)v39 != v15) {
                  objc_enumerationMutation(v33);
                }
                long long v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
                if ([v17 foreignReferenceType] == 1)
                {
                  long long v18 = [v17 foreignReferenceIdentifiers];
                  long long v34 = 0u;
                  long long v35 = 0u;
                  long long v36 = 0u;
                  long long v37 = 0u;
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    char v21 = 0;
                    uint64_t v22 = *(void *)v35;
                    do
                    {
                      for (uint64_t i = 0; i != v20; ++i)
                      {
                        if (*(void *)v35 != v22) {
                          objc_enumerationMutation(v18);
                        }
                        uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                        if (([v10 containsObject:v24] & 1) == 0)
                        {
                          [v10 addObject:v24];
                          char v21 = 1;
                        }
                      }
                      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
                    }
                    while (v20);
                    uint64_t v14 = v32;
                    if (v21) {
                      [v31 addObject:v17];
                    }
                  }
                }
                ++v16;
              }
              while (v16 != v14);
              uint64_t v14 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v14);
          }

          uint64_t v11 = v30 + 1;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v29);
    }

    id v3 = v26;
  }

  return v31;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NPKPassAssociatedInfoModel *)self pass];
  id v6 = [v5 uniqueID];
  id v7 = [(NPKPassAssociatedInfoModel *)self balanceFields];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p> {passUniqueID:%@, balanceFields:%@", v4, self, v6, v7];

  uint64_t v9 = [(NPKPassAssociatedInfoModel *)self transitPassProperties];

  if (v9)
  {
    id v10 = [(NPKPassAssociatedInfoModel *)self transitPassProperties];
    [v8 appendFormat:@" transitPassProperties:%@", v10];
  }
  uint64_t v11 = [(NPKPassAssociatedInfoModel *)self balances];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [(NPKPassAssociatedInfoModel *)self balances];
    [v8 appendFormat:@" balances:%@", v13];
  }
  [v8 appendString:@"}"];
  return v8;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)commutePlanFields
{
  return self->_commutePlanFields;
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (void)setTransitAppletState:(id)a3
{
}

- (PKTransitPassProperties)transitPassProperties
{
  return self->_transitPassProperties;
}

- (NSSet)balances
{
  return self->_balances;
}

- (NSArray)dynamicPlans
{
  return self->_dynamicPlans;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (unint64_t)rangingSuspensionReason
{
  return self->_rangingSuspensionReason;
}

- (void)setRangingSuspensionReason:(unint64_t)a3
{
  self->_rangingSuspensionReason = a3;
}

- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription
{
  return self->_precursorPassDescription;
}

- (void)setPrecursorPassDescription:(id)a3
{
}

- (BOOL)isCommutePlanValueRequired
{
  return self->_commutePlanValueRequired;
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (BOOL)isHomeAccessRestricted
{
  return self->_isHomeAccessRestricted;
}

- (void)setIsHomeAccessRestricted:(BOOL)a3
{
  self->_isHomeAccessRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_precursorPassDescription, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_dynamicPlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_transitPassProperties, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end