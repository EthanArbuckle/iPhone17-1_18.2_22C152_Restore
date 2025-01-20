@interface PKTransitBalanceModel
- (BOOL)hasBalanceContent;
- (BOOL)hasCommutePlanContent;
- (BOOL)hasCurrencyBalance;
- (BOOL)hasDeviceBoundCommutePlans;
- (BOOL)hasPointsBalance;
- (BOOL)hasPositiveBalance;
- (BOOL)isEqual:(id)a3;
- (NSArray)displayableBalances;
- (NSArray)displayableCommutePlanActions;
- (NSArray)displayableCommutePlanBalances;
- (NSArray)displayableCommutePlans;
- (NSArray)displayableCurrencyBalances;
- (NSArray)displayablePointsBalances;
- (NSArray)transitCommutePlans;
- (NSDictionary)balancesAndCountPlansByID;
- (NSMutableArray)balanceFields;
- (NSString)displayableCommutePlanCount;
- (NSString)displayableListOfBalances;
- (NSString)primaryDisplayableBalance;
- (PKPaymentPass)pass;
- (PKTransitBalanceModel)initWithPass:(id)a3;
- (id)balanceForIdentifiers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredActionsForDisplayableEntities;
- (void)_updateBalancesAndPlans;
- (void)applyStoredValueBalancesFromProperties:(id)a3;
- (void)getDisplayableCommutePlanDetailsForTitle:(id *)a3 value:(id *)a4 subtitle:(id *)a5 isExpired:(BOOL *)a6;
- (void)setDynamicBalances:(id)a3;
- (void)setDynamicBalancesByID:(id)a3;
- (void)setTransitProperties:(id)a3;
- (void)setTransitProperties:(id)a3 andApplyStoredValueBalances:(BOOL)a4;
- (void)updateWithDynamicBalances:(id)a3;
- (void)updateWithDynamicCommutePlans:(id)a3;
@end

@implementation PKTransitBalanceModel

- (PKTransitBalanceModel)initWithPass:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitBalanceModel;
  v6 = [(PKTransitBalanceModel *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    v8 = (void *)MEMORY[0x1E4F1CA48];
    v9 = [v5 balanceFields];
    uint64_t v10 = [v8 arrayWithArray:v9];
    balanceFields = v7->_balanceFields;
    v7->_balanceFields = (NSMutableArray *)v10;

    uint64_t v12 = [v5 transitCommutePlans];
    transitCommutePlans = v7->_transitCommutePlans;
    v7->_transitCommutePlans = (NSArray *)v12;

    [(PKTransitBalanceModel *)v7 _updateBalancesAndPlans];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    transitProperties = self->_transitProperties;
    v7 = (PKTransitPassProperties *)*((void *)v5 + 2);
    if (transitProperties && v7)
    {
      if (!-[PKStoredValuePassProperties isEqual:](transitProperties, "isEqual:")) {
        goto LABEL_21;
      }
    }
    else if (transitProperties != v7)
    {
LABEL_21:
      char v8 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (![(NSDictionary *)self->_balancesByID isEqualToDictionary:*((void *)v5 + 1)]
      || ![(NSArray *)self->_displayableBalances isEqualToArray:*((void *)v5 + 6)]
      || ![(NSArray *)self->_displayableCommutePlans isEqualToArray:*((void *)v5 + 11)]
      || ![(NSArray *)self->_displayableCommutePlanBalances isEqualToArray:*((void *)v5 + 9)]
      || ![(NSArray *)self->_displayableCurrencyBalances isEqualToArray:*((void *)v5 + 7)]
      || ![(NSArray *)self->_displayablePointsBalances isEqualToArray:*((void *)v5 + 8)]
      || ![(NSArray *)self->_transitCommutePlans isEqualToArray:*((void *)v5 + 10)]
      || ![(NSArray *)self->_displayableCommutePlanActions isEqualToArray:*((void *)v5 + 12)])
    {
      goto LABEL_21;
    }
    v9 = [(PKObject *)self->_pass uniqueID];
    uint64_t v10 = [*((id *)v5 + 5) uniqueID];
    id v11 = v9;
    id v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v11 || !v12)
      {

        goto LABEL_31;
      }
      int v14 = [v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_31;
      }
    }
    dynamicPlans = self->_dynamicPlans;
    v17 = (NSArray *)*((void *)v5 + 3);
    if (dynamicPlans && v17)
    {
      if (-[NSArray isEqual:](dynamicPlans, "isEqual:")) {
        goto LABEL_33;
      }
    }
    else if (dynamicPlans == v17)
    {
LABEL_33:
      dynamicPlansByUniqueId = self->_dynamicPlansByUniqueId;
      v19 = (NSMutableDictionary *)*((void *)v5 + 4);
      if (dynamicPlansByUniqueId && v19) {
        char v8 = -[NSMutableDictionary isEqual:](dynamicPlansByUniqueId, "isEqual:");
      }
      else {
        char v8 = dynamicPlansByUniqueId == v19;
      }
      goto LABEL_32;
    }
LABEL_31:
    char v8 = 0;
LABEL_32:

    goto LABEL_22;
  }
  char v8 = 0;
LABEL_23:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKStoredValuePassProperties *)self->_transitProperties copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSDictionary *)self->_balancesByID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSMutableArray *)self->_balanceFields mutableCopyWithZone:a3];
  id v11 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v10;

  uint64_t v12 = [(NSArray *)self->_displayableBalances copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSArray *)self->_displayableCurrencyBalances copyWithZone:a3];
  objc_super v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(NSArray *)self->_displayablePointsBalances copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSArray *)self->_transitCommutePlans copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSArray *)self->_displayableCommutePlanBalances copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  uint64_t v22 = [(NSArray *)self->_displayableCommutePlans copyWithZone:a3];
  v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  uint64_t v24 = [(NSArray *)self->_displayableCommutePlanActions copyWithZone:a3];
  v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  objc_storeStrong((id *)(v5 + 40), self->_pass);
  uint64_t v26 = [(NSArray *)self->_dynamicPlans copyWithZone:a3];
  v27 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v26;

  uint64_t v28 = [(NSMutableDictionary *)self->_dynamicPlansByUniqueId mutableCopyWithZone:a3];
  v29 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v28;

  return (id)v5;
}

- (void)setDynamicBalances:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "identifiers", (void)v13);
        if (v12 && ([v11 isExpired] & 1) == 0) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(PKTransitBalanceModel *)self setDynamicBalancesByID:v5];
  [(PKTransitBalanceModel *)self _updateBalancesAndPlans];
}

- (void)updateWithDynamicBalances:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_balancesByID];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "identifiers", (void)v15);
        if (v12) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (![(NSDictionary *)self->_balancesByID isEqualToDictionary:v5])
  {
    long long v13 = (NSDictionary *)[v5 copy];
    balancesByID = self->_balancesByID;
    self->_balancesByID = v13;

    [(PKTransitBalanceModel *)self _updateBalancesAndPlans];
  }
}

- (void)setDynamicBalancesByID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v8 = v4;
    BOOL v5 = [(NSDictionary *)self->_balancesByID isEqualToDictionary:v4];
    id v4 = v8;
    if (!v5)
    {
      id v6 = (NSDictionary *)[v8 copy];
      balancesByID = self->_balancesByID;
      self->_balancesByID = v6;

      [(PKTransitBalanceModel *)self _updateBalancesAndPlans];
      id v4 = v8;
    }
  }
}

- (NSDictionary)balancesAndCountPlansByID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  if (self->_balancesByID) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = self->_displayableCommutePlanBalances;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifiers", (void)v15);
        uint64_t v12 = v11;
        if (v11 && [v11 count]) {
          [v4 setObject:v10 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  long long v13 = (void *)[v4 copy];
  return (NSDictionary *)v13;
}

- (id)balanceForIdentifiers:(id)a3
{
  id v3 = [(NSDictionary *)self->_balancesByID objectForKeyedSubscript:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)setTransitProperties:(id)a3
{
}

- (void)setTransitProperties:(id)a3 andApplyStoredValueBalances:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (PKTransitPassProperties *)a3;
  transitProperties = self->_transitProperties;
  uint64_t v10 = v7;
  if (!v7 || !transitProperties)
  {
    if (transitProperties == v7) {
      goto LABEL_10;
    }
LABEL_6:
    objc_storeStrong((id *)&self->_transitProperties, a3);
    if (v4) {
      [(PKTransitBalanceModel *)self applyStoredValueBalancesFromProperties:v10];
    }
    else {
      [(PKTransitBalanceModel *)self _updateBalancesAndPlans];
    }
    uint64_t v7 = v10;
    goto LABEL_10;
  }
  BOOL v9 = [(PKStoredValuePassProperties *)transitProperties isEqual:v7];
  uint64_t v7 = v10;
  if (!v9) {
    goto LABEL_6;
  }
LABEL_10:
}

- (void)applyStoredValueBalancesFromProperties:(id)a3
{
  uint64_t v20 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = v3;
  BOOL v5 = [v3 balances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", v20);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          int v13 = [v10 isCurrencyBalance];

          if (v13)
          {
            long long v14 = [v10 amount];
            long long v15 = [v10 currencyCode];
            long long v16 = PKCurrencyAmountCreate(v14, v15, 0);

            long long v17 = [PKPaymentBalance alloc];
            long long v18 = [v10 identifier];
            v19 = [(PKPaymentBalance *)v17 initWithIdentifier:v18 forCurrencyAmount:v16];

            if (v19) {
              [v4 addObject:v19];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  [(PKTransitBalanceModel *)v20 setDynamicBalances:v4];
}

- (void)updateWithDynamicCommutePlans:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)[a3 copy];
  dynamicPlans = self->_dynamicPlans;
  self->_dynamicPlans = v4;

  uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dynamicPlansByUniqueId = self->_dynamicPlansByUniqueId;
  self->_dynamicPlansByUniqueId = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_dynamicPlans;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "uniqueIdentifier", (void)v15);
        [(NSMutableDictionary *)self->_dynamicPlansByUniqueId setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(PKTransitBalanceModel *)self _updateBalancesAndPlans];
}

- (BOOL)hasBalanceContent
{
  return [(NSArray *)self->_displayableBalances count] != 0;
}

- (BOOL)hasCurrencyBalance
{
  return [(NSArray *)self->_displayableCurrencyBalances count] != 0;
}

- (BOOL)hasPointsBalance
{
  return [(NSArray *)self->_displayablePointsBalances count] != 0;
}

- (BOOL)hasPositiveBalance
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_displayableBalances;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "value", (void)v11);
        if (v6)
        {
          uint64_t v7 = (void *)v6;
          uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
          uint64_t v9 = [v8 compare:v7];

          if (v9 == -1)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasCommutePlanContent
{
  return [(NSArray *)self->_displayableCommutePlans count] != 0;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_displayableCommutePlans;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isDeviceBound", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)filteredActionsForDisplayableEntities
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKTransitBalanceModel *)self displayableCommutePlans];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [(PKSecureElementPass *)self->_pass availableActions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if ([v17 type] == 1)
        {
          [v3 addObject:v17];
        }
        else
        {
          long long v18 = [v17 associatedPlanIdentifier];
          if ([v5 containsObject:v18]) {
            [v3 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  v19 = (void *)[v3 copy];
  return v19;
}

- (void)_updateBalancesAndPlans
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  v119 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v113 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v111 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v114 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v128 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)([(PKSecureElementPass *)self->_pass passActivationState] - 5) > 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_132;
  }
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v138 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v4 = [(PKSecureElementPass *)self->_pass availableActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v171 objects:v182 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v172;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v172 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v171 + 1) + 8 * i);
        long long v10 = [v9 associatedPlan];
        long long v11 = v10;
        if (v10)
        {
          uint64_t v12 = [v10 identifier];
          [v126 setObject:v9 forKeyedSubscript:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v171 objects:v182 count:16];
    }
    while (v6);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  obuint64_t j = self->_transitCommutePlans;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v167 objects:v181 count:16];
  v127 = self;
  v118 = v3;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v168;
    uint64_t v116 = *(void *)v168;
    do
    {
      uint64_t v16 = 0;
      uint64_t v120 = v14;
      do
      {
        if (*(void *)v168 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v167 + 1) + 8 * v16);
        long long v18 = [v17 identifier];
        char v19 = [v17 requiresAppletSourceOfTruth];
        uint64_t v20 = [v126 objectForKeyedSubscript:v18];
        v134 = v17;
        [v20 setAssociatedPlan:v17];
        if (v19)
        {
          uint64_t v124 = v16;
          id v131 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v129 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v163 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          long long v166 = 0u;
          long long v21 = [(NSMutableDictionary *)self->_dynamicPlansByUniqueId allValues];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v163 objects:v180 count:16];
          if (!v22) {
            goto LABEL_39;
          }
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v164;
          while (1)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v164 != v24) {
                objc_enumerationMutation(v21);
              }
              long long v26 = *(void **)(*((void *)&v163 + 1) + 8 * j);
              long long v27 = [v26 identifier];
              id v28 = v18;
              id v29 = v27;
              if (v28 == v29)
              {

LABEL_28:
                v30 = [v134 updateWithCommutePlanDetail:v26];
                [v20 setAssociatedPlan:v30];
                if (v20 && ([v20 isActionAvailable] & 1) != 0
                  || [v30 isPlanDisplayable])
                {
                  if ([v30 hasExpiredPlanDate]) {
                    v32 = v131;
                  }
                  else {
                    v32 = v129;
                  }
                  [v32 addObject:v30];
                  [v128 safelyAddObject:v20];
                }
LABEL_36:

                continue;
              }
              v30 = v29;
              if (!v18 || !v29)
              {

                goto LABEL_36;
              }
              int v31 = [v28 isEqualToString:v29];

              if (v31) {
                goto LABEL_28;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v163 objects:v180 count:16];
            if (!v23)
            {
LABEL_39:

              if ([v129 count]) {
                id v33 = v129;
              }
              else {
                id v33 = v131;
              }
              id v3 = v118;
              [v118 addObjectsFromArray:v33];
              v34 = [v134 passFieldForKey:@"amountRemaining"];
              v35 = [v34 foreignReferenceIdentifiers];
              self = v127;
              v36 = [(NSDictionary *)v127->_balancesByID objectForKeyedSubscript:v35];

              if (v36
                && (v20 && ([v20 isActionAvailable] & 1) != 0
                 || [v134 isPlanDisplayable]))
              {
                [v118 addObject:v134];
                [v128 safelyAddObject:v20];
              }

              uint64_t v15 = v116;
              uint64_t v14 = v120;
              uint64_t v16 = v124;
              goto LABEL_52;
            }
          }
        }
        if (v20 && ([v20 isActionAvailable] & 1) != 0
          || [v17 isPlanDisplayable])
        {
          [v3 addObject:v17];
          [v128 safelyAddObject:v20];
        }
LABEL_52:

        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v167 objects:v181 count:16];
    }
    while (v14);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v130 = v3;
  uint64_t v135 = [v130 countByEnumeratingWithState:&v159 objects:v179 count:16];
  if (v135)
  {
    uint64_t v132 = *(void *)v160;
    do
    {
      for (uint64_t k = 0; k != v135; ++k)
      {
        if (*(void *)v160 != v132) {
          objc_enumerationMutation(v130);
        }
        v38 = *(void **)(*((void *)&v159 + 1) + 8 * k);
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        v39 = [v38 details];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v155 objects:v178 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v156;
          do
          {
            for (uint64_t m = 0; m != v41; ++m)
            {
              if (*(void *)v156 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v155 + 1) + 8 * m);
              v45 = [v44 key];
              int v46 = [v45 isEqualToString:@"amountRemaining"];

              if (v46)
              {
                [v137 addObject:v44];
                v47 = [v44 foreignReferenceIdentifiers];
                [v138 setObject:v38 forKeyedSubscript:v47];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v155 objects:v178 count:16];
          }
          while (v41);
        }
      }
      uint64_t v135 = [v130 countByEnumeratingWithState:&v159 objects:v179 count:16];
    }
    while (v135);
  }

  v48 = v127;
  uint64_t v49 = [(PKStoredValuePassProperties *)v127->_transitProperties balanceAmount];
  unint64_t v50 = 0x1E4F1C000uLL;
  v110 = (void *)v49;
  if (v49)
  {
    v51 = [[PKPaymentBalance alloc] initWithIdentifier:@"ApplicationStoredValueBalanceDefault" forCurrencyAmount:v49];
    [(NSArray *)v119 safelyAddObject:v51];
    [(NSArray *)v113 safelyAddObject:v51];
  }
  else
  {
    if (![(PKSecureElementPass *)v127->_pass hasLegacyBalanceModel]
      || [(NSMutableArray *)v127->_balanceFields count])
    {
      goto LABEL_75;
    }
    v51 = objc_alloc_init(PKPassField);
    v108 = PKLocalizedPaymentString(&cfstr_LegacyPassBala.isa, 0);
    [(PKPaymentBalance *)v51 setLabel:v108];

    [(PKPaymentBalance *)v51 setKey:@"balance_identifier_field_storedvalue"];
    [(PKPaymentBalance *)v51 setForeignReferenceType:2];
    v109 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ApplicationStoredValueBalanceDefault", 0);
    [(PKPaymentBalance *)v51 setForeignReferenceIdentifiers:v109];

    [(PKPaymentBalance *)v51 setCellStyle:1];
    [(NSMutableArray *)v127->_balanceFields addObject:v51];
  }

LABEL_75:
  if (v127->_balancesByID)
  {
    balanceFields = v127->_balanceFields;
    if (balanceFields)
    {
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      v53 = balanceFields;
      uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v151 objects:v177 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v152;
        v115 = v53;
        uint64_t v112 = *(void *)v152;
        do
        {
          uint64_t v57 = 0;
          uint64_t v117 = v55;
          do
          {
            if (*(void *)v152 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v151 + 1) + 8 * v57);
            v136 = [v58 label];
            v59 = [v58 foreignReferenceIdentifiers];
            uint64_t v60 = [v58 foreignReferenceType];
            if (v59) {
              BOOL v61 = (unint64_t)(v60 - 1) > 1;
            }
            else {
              BOOL v61 = 1;
            }
            if (!v61)
            {
              if ([v59 count] == 1)
              {
                v62 = [(NSDictionary *)v48->_balancesByID objectForKeyedSubscript:v59];
                PKSetBalanceLocalizedStringIfNeeded(v62, v136);
                v149[0] = MEMORY[0x1E4F143A8];
                v149[1] = 3221225472;
                v149[2] = __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke;
                v149[3] = &unk_1E56E8B80;
                id v63 = v62;
                id v150 = v63;
                BOOL v64 = [(NSArray *)v119 pk_containsObjectPassingTest:v149];
                v133 = v63;
                if (v63)
                {
                  if (!v64)
                  {
                    [(NSArray *)v119 addObject:v63];
                    char v65 = [v63 isCurrency];
                    v66 = v113;
                    if ((v65 & 1) != 0 || (uint64_t v67 = [v58 unitType], v66 = v111, v67 == 3)) {
                      [(NSArray *)v66 addObject:v63];
                    }
                  }
                }
                id v68 = v150;
              }
              else
              {
                v121 = v58;
                uint64_t v125 = v57;
                v133 = objc_msgSend(objc_alloc(*(Class *)(v50 + 2632)), "initWithCapacity:", objc_msgSend(v59, "count"));
                id v68 = objc_alloc_init(*(Class *)(v50 + 2632));
                long long v145 = 0u;
                long long v146 = 0u;
                long long v147 = 0u;
                long long v148 = 0u;
                id obja = v59;
                id v69 = v59;
                uint64_t v70 = [v69 countByEnumeratingWithState:&v145 objects:v176 count:16];
                if (v70)
                {
                  uint64_t v71 = v70;
                  uint64_t v72 = *(void *)v146;
                  do
                  {
                    for (uint64_t n = 0; n != v71; ++n)
                    {
                      if (*(void *)v146 != v72) {
                        objc_enumerationMutation(v69);
                      }
                      uint64_t v74 = *(void *)(*((void *)&v145 + 1) + 8 * n);
                      v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v74, 0);
                      v76 = [(NSDictionary *)v127->_balancesByID objectForKeyedSubscript:v75];
                      v77 = (void *)[v76 copy];

                      if (v77)
                      {
                        PKSetBalanceLocalizedStringIfNeeded(v77, v136);
                        v78 = [(PKStoredValuePassProperties *)v127->_transitProperties balanceWithIdentifier:v74];
                        if ([v78 isExpired]) {
                          v79 = v68;
                        }
                        else {
                          v79 = v133;
                        }
                        [v79 addObject:v77];
                      }
                    }
                    uint64_t v71 = [v69 countByEnumeratingWithState:&v145 objects:v176 count:16];
                  }
                  while (v71);
                }

                v80 = [[PKPaymentBalance alloc] initWithComponentBalances:v133 identifiers:v69 expiredBalances:v68];
                if (v80)
                {
                  [(NSArray *)v119 addObject:v80];
                  BOOL v81 = [(PKPaymentBalance *)v80 isCurrency];
                  v82 = v113;
                  if (v81 || (uint64_t v83 = [v121 unitType], v82 = v111, v83 == 3)) {
                    [(NSArray *)v82 addObject:v80];
                  }
                }

                v48 = v127;
                unint64_t v50 = 0x1E4F1C000;
                v53 = v115;
                uint64_t v55 = v117;
                uint64_t v56 = v112;
                v59 = obja;
                uint64_t v57 = v125;
              }
            }
            ++v57;
          }
          while (v57 != v55);
          uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v151 objects:v177 count:16];
        }
        while (v55);
      }
    }
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v84 = v137;
  uint64_t v85 = [v84 countByEnumeratingWithState:&v141 objects:v175 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v142;
    do
    {
      for (iuint64_t i = 0; ii != v86; ++ii)
      {
        if (*(void *)v142 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v141 + 1) + 8 * ii);
        v90 = [v89 foreignReferenceIdentifiers];
        if ((unint64_t)([v89 foreignReferenceType] - 3) >= 0xFFFFFFFFFFFFFFFELL && v90 != 0)
        {
          v92 = [(NSDictionary *)v127->_balancesByID objectForKeyedSubscript:v90];
          v93 = [v89 label];
          [v92 setLocalizedTitle:v93];

          if (v92)
          {
            v139[0] = MEMORY[0x1E4F143A8];
            v139[1] = 3221225472;
            v139[2] = __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke_2;
            v139[3] = &unk_1E56E8B80;
            id v94 = v92;
            id v140 = v94;
            if (![(NSArray *)v119 pk_containsObjectPassingTest:v139]) {
              [(NSArray *)v114 addObject:v94];
            }
            v95 = v140;
          }
          else
          {
            v95 = [v138 objectForKeyedSubscript:v90];
            [v130 removeObject:v95];
          }
        }
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v141 objects:v175 count:16];
    }
    while (v86);
  }

  self = v127;
  id v3 = v118;
LABEL_132:
  displayableBalances = self->_displayableBalances;
  self->_displayableBalances = v119;
  v97 = v119;

  displayableCurrencyBalances = self->_displayableCurrencyBalances;
  self->_displayableCurrencyBalances = v113;
  v99 = v113;

  displayablePointsBalances = self->_displayablePointsBalances;
  self->_displayablePointsBalances = v111;
  v101 = v111;

  v102 = (NSArray *)[v3 copy];
  displayableCommutePlans = self->_displayableCommutePlans;
  self->_displayableCommutePlans = v102;

  displayableCommutePlanBalances = self->_displayableCommutePlanBalances;
  self->_displayableCommutePlanBalances = v114;
  v105 = v114;

  v106 = (NSArray *)[v128 copy];
  displayableCommutePlanActions = self->_displayableCommutePlanActions;
  self->_displayableCommutePlanActions = v106;
}

uint64_t __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifiers];
  uint64_t v5 = [v3 identifiers];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    uint64_t v7 = v4 == v5;
  }
  else {
    uint64_t v7 = [v4 isEqual:v5];
  }

  return v7;
}

uint64_t __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifiers];
  uint64_t v5 = [v3 identifiers];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    uint64_t v7 = v4 == v5;
  }
  else {
    uint64_t v7 = [v4 isEqual:v5];
  }

  return v7;
}

- (NSString)primaryDisplayableBalance
{
  if ([(NSArray *)self->_displayableBalances count])
  {
    id v3 = [(NSArray *)self->_displayableBalances firstObject];
    uint64_t v4 = [v3 formattedValue];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)displayableListOfBalances
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_displayableBalances count])
  {
    if ([(NSArray *)self->_displayableBalances count] == 1)
    {
      id v3 = [(PKTransitBalanceModel *)self primaryDisplayableBalance];
    }
    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_displayableBalances, "count"));
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = self->_displayableBalances;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "formattedValue", (void)v12);
            [v4 safelyAddObject:v10];
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      id v3 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v4];
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)displayableCommutePlanCount
{
  id v3 = [(NSArray *)self->_displayableCommutePlans count];
  if (v3)
  {
    id v3 = PKPassLocalizedStringWithFormat(@"NUMBER_OF_COMMUTE_PLANS", self->_pass, @"%lu", v4, v5, v6, v7, v8, (uint64_t)v3);
  }
  return (NSString *)v3;
}

- (void)getDisplayableCommutePlanDetailsForTitle:(id *)a3 value:(id *)a4 subtitle:(id *)a5 isExpired:(BOOL *)a6
{
  uint64_t v23 = self->_displayableCommutePlans;
  if ([(NSArray *)v23 count] < 2)
  {
    uint64_t v16 = [(NSArray *)v23 firstObject];
    uint64_t v17 = v16;
    if (v16)
    {
      long long v18 = [v16 title];
      *a3 = [v18 label];
      *a4 = [v18 value];
      char v19 = [v17 properties];
      if ((v19 & 3) == 1)
      {
        *a5 = [v17 formattedDateString];
        if ([v17 hasExpiredPlanDate]) {
          *a6 = 1;
        }
      }
      else if ((v19 & 4) != 0)
      {
        uint64_t v20 = [v17 passFieldForKey:@"amountRemaining"];
        if ((unint64_t)([v20 foreignReferenceType] - 1) <= 1)
        {
          long long v21 = [v20 foreignReferenceIdentifiers];
          uint64_t v22 = [(PKTransitBalanceModel *)self balanceForIdentifiers:v21];

          *a4 = [v22 formattedValue];
        }
      }
    }
  }
  else
  {
    PKPassLocalizedStringWithFormat(@"COMMUTE_PLANS", self->_pass, 0, v11, v12, v13, v14, v15, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = [(PKTransitBalanceModel *)self displayableCommutePlanCount];
  }
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSArray)displayableBalances
{
  return self->_displayableBalances;
}

- (NSArray)displayableCurrencyBalances
{
  return self->_displayableCurrencyBalances;
}

- (NSArray)displayablePointsBalances
{
  return self->_displayablePointsBalances;
}

- (NSArray)displayableCommutePlanBalances
{
  return self->_displayableCommutePlanBalances;
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (NSArray)displayableCommutePlans
{
  return self->_displayableCommutePlans;
}

- (NSArray)displayableCommutePlanActions
{
  return self->_displayableCommutePlanActions;
}

- (NSMutableArray)balanceFields
{
  return self->_balanceFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlanActions, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlans, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlanBalances, 0);
  objc_storeStrong((id *)&self->_displayablePointsBalances, 0);
  objc_storeStrong((id *)&self->_displayableCurrencyBalances, 0);
  objc_storeStrong((id *)&self->_displayableBalances, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_dynamicPlansByUniqueId, 0);
  objc_storeStrong((id *)&self->_dynamicPlans, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_balancesByID, 0);
}

@end