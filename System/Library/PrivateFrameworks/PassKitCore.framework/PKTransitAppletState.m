@interface PKTransitAppletState
+ (BOOL)supportsSecureCoding;
- (BOOL)appletStateDirty;
- (BOOL)isBlacklisted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInStation;
- (BOOL)needsStationProcessing;
- (NSArray)balances;
- (NSArray)commutePlans;
- (NSArray)enrouteTransitTypes;
- (NSDate)expirationDate;
- (NSDecimalNumber)balance;
- (NSNumber)historySequenceNumber;
- (NSNumber)loyaltyBalance;
- (NSNumber)serverRefreshIdentifier;
- (NSString)currency;
- (PKFelicaTransitAppletState)felicaState;
- (PKTransitAppletState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8 planLabelDictionary:(id)a9;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4;
- (id)updatedEnrouteTransitTypesFromExistingTypes:(id)a3 newTypes:(id)a4;
- (unint64_t)hash;
- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7 balanceLabels:(id)a8 unitDictionary:(id)a9 planLabels:(id)a10;
- (void)addEnrouteTransitType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletStateDirty:(BOOL)a3;
- (void)setBalance:(id)a3;
- (void)setBalances:(id)a3;
- (void)setBlacklisted:(BOOL)a3;
- (void)setCommutePlans:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setEnrouteTransitTypes:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHistorySequenceNumber:(id)a3;
- (void)setLoyaltyBalance:(id)a3;
- (void)setNeedsStationProcessing:(BOOL)a3;
- (void)setServerRefreshIdentifier:(id)a3;
@end

@implementation PKTransitAppletState

- (PKFelicaTransitAppletState)felicaState
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (PKFelicaTransitAppletState *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletState)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKTransitAppletState;
  v5 = [(PKTransitAppletState *)&v32 init];
  if (v5)
  {
    v5->_blacklisted = [v4 decodeBoolForKey:@"blacklisted"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historySequenceNumber"];
    historySequenceNumber = v5->_historySequenceNumber;
    v5->_historySequenceNumber = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverRefreshIdentifier"];
    serverRefreshIdentifier = v5->_serverRefreshIdentifier;
    v5->_serverRefreshIdentifier = (NSNumber *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = v10;
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C28]);
        [v10 decimalValue];
        v11 = (NSDecimalNumber *)[v12 initWithDecimal:v31];
      }
      balance = v5->_balance;
      v5->_balance = v11;
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loyaltyBalance"];
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v18;

    v5->_needsStationProcessing = [v4 decodeBoolForKey:@"needsStationProcessing"];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"enrouteTransitTypes"];
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"balances"];
    balances = v5->_balances;
    v5->_balances = (NSArray *)v28;

    v5->_appletStateDirty = [v4 decodeBoolForKey:@"appletStateDirty"];
    if (!v5->_enrouteTransitTypes && [v4 decodeBoolForKey:@"inStation"]) {
      [(PKTransitAppletState *)v5 addEnrouteTransitType:@"TransitMetro"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL blacklisted = self->_blacklisted;
  id v5 = a3;
  [v5 encodeBool:blacklisted forKey:@"blacklisted"];
  [v5 encodeObject:self->_historySequenceNumber forKey:@"historySequenceNumber"];
  [v5 encodeObject:self->_serverRefreshIdentifier forKey:@"serverRefreshIdentifier"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_loyaltyBalance forKey:@"loyaltyBalance"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeBool:self->_needsStationProcessing forKey:@"needsStationProcessing"];
  [v5 encodeObject:self->_enrouteTransitTypes forKey:@"enrouteTransitTypes"];
  [v5 encodeObject:self->_balances forKey:@"balances"];
  [v5 encodeBool:self->_appletStateDirty forKey:@"appletStateDirty"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PKTransitAppletState isInStation](self, "isInStation"), @"inStation");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_blacklisted;
  uint64_t v6 = [(NSNumber *)self->_historySequenceNumber copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSNumber *)self->_serverRefreshIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_balance copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSNumber *)self->_loyaltyBalance copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(NSString *)self->_currency copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  *(unsigned char *)(v5 + 9) = self->_needsStationProcessing;
  uint64_t v18 = [(NSArray *)self->_enrouteTransitTypes copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSArray *)self->_balances copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  *(unsigned char *)(v5 + 10) = self->_appletStateDirty;
  return (id)v5;
}

- (BOOL)isInStation
{
  return [(NSArray *)self->_enrouteTransitTypes count] != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = (unsigned __int8 *)v4;
  uint64_t v6 = v5;
  if (self->_blacklisted != v5[8] || self->_appletStateDirty != v5[10]) {
    goto LABEL_10;
  }
  historySequenceNumber = self->_historySequenceNumber;
  uint64_t v8 = (NSNumber *)*((void *)v6 + 2);
  if (historySequenceNumber && v8)
  {
    if ((-[NSNumber isEqual:](historySequenceNumber, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (historySequenceNumber != v8)
  {
    goto LABEL_10;
  }
  serverRefreshIdentifier = self->_serverRefreshIdentifier;
  uint64_t v12 = (NSNumber *)*((void *)v6 + 3);
  if (serverRefreshIdentifier && v12)
  {
    if ((-[NSNumber isEqual:](serverRefreshIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (serverRefreshIdentifier != v12)
  {
    goto LABEL_10;
  }
  balance = self->_balance;
  uint64_t v14 = (NSDecimalNumber *)*((void *)v6 + 4);
  if (balance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (balance != v14)
  {
    goto LABEL_10;
  }
  loyaltyBalance = self->_loyaltyBalance;
  uint64_t v16 = (NSNumber *)*((void *)v6 + 5);
  if (loyaltyBalance && v16)
  {
    if ((-[NSNumber isEqual:](loyaltyBalance, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (loyaltyBalance != v16)
  {
    goto LABEL_10;
  }
  expirationDate = self->_expirationDate;
  uint64_t v18 = (NSDate *)*((void *)v6 + 7);
  if (expirationDate && v18)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (expirationDate != v18)
  {
    goto LABEL_10;
  }
  currency = self->_currency;
  uint64_t v20 = (NSString *)*((void *)v6 + 6);
  if (currency && v20)
  {
    if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (currency != v20)
  {
    goto LABEL_10;
  }
  enrouteTransitTypes = self->_enrouteTransitTypes;
  v22 = (NSArray *)*((void *)v6 + 10);
  if (!enrouteTransitTypes || !v22)
  {
    if (enrouteTransitTypes == v22) {
      goto LABEL_43;
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }
  if ((-[NSArray isEqual:](enrouteTransitTypes, "isEqual:") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_43:
  if (self->_needsStationProcessing != v6[9]) {
    goto LABEL_10;
  }
  balances = self->_balances;
  v24 = (NSArray *)*((void *)v6 + 8);
  if (balances && v24) {
    char v9 = -[NSArray isEqual:](balances, "isEqual:");
  }
  else {
    char v9 = balances == v24;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:2* ((((2 * self->_needsStationProcessing) | (4 * self->_blacklisted)) | self->_appletStateDirty) & 0x7F)];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(NSArray *)self->_enrouteTransitTypes hash];
  uint64_t v6 = v5 ^ [(NSNumber *)self->_historySequenceNumber hash];
  uint64_t v7 = v6 ^ [(NSNumber *)self->_serverRefreshIdentifier hash];
  uint64_t v8 = v7 ^ [(NSDecimalNumber *)self->_balance hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_balances hash];
  return v9 ^ [(NSNumber *)self->_loyaltyBalance hash] ^ v4;
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5
{
  return [(PKTransitAppletState *)self processUpdateWithAppletHistory:a3 concreteTransactions:a4 ephemeralTransaction:a5 mutatedBalances:0 balanceLabelDictionary:0 unitDictionary:0 planLabelDictionary:0];
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6
{
  return [(PKTransitAppletState *)self processUpdateWithAppletHistory:a3 concreteTransactions:a4 ephemeralTransaction:a5 mutatedBalances:a6 balanceLabelDictionary:0 unitDictionary:0 planLabelDictionary:0];
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7
{
  return [(PKTransitAppletState *)self processUpdateWithAppletHistory:a3 concreteTransactions:a4 ephemeralTransaction:a5 mutatedBalances:a6 balanceLabelDictionary:a7 unitDictionary:0 planLabelDictionary:0];
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8
{
  return [(PKTransitAppletState *)self processUpdateWithAppletHistory:a3 concreteTransactions:a4 ephemeralTransaction:a5 mutatedBalances:a6 balanceLabelDictionary:a7 unitDictionary:a8 planLabelDictionary:0];
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8 planLabelDictionary:(id)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  uint64_t v16 = (void *)[(PKTransitAppletState *)self copy];
  [v15 sanitizeValuesWithState:self];
  v17 = [v15 commutePlans];
  [v16 setCommutePlans:v17];

  objc_msgSend(v16, "setBlacklisted:", objc_msgSend(v15, "isBlacklisted"));
  uint64_t v18 = [v15 balance];
  [v16 setBalance:v18];

  v19 = [v15 balances];
  [v16 setBalances:v19];

  uint64_t v20 = [v15 loyaltyBalance];
  [v16 setLoyaltyBalance:v20];

  uint64_t v21 = [v15 expirationDate];
  [v16 setExpirationDate:v21];

  v22 = [v15 currency];
  [v16 setCurrency:v22];

  uint64_t v23 = [v15 serverRefreshIdentifier];
  [v16 setServerRefreshIdentifier:v23];

  if (a6)
  {
    v24 = [v15 balances];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      uint64_t v26 = [(PKTransitAppletState *)self balances];
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v28 = [v15 balances];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __171__PKTransitAppletState_processUpdateWithAppletHistory_concreteTransactions_ephemeralTransaction_mutatedBalances_balanceLabelDictionary_unitDictionary_planLabelDictionary___block_invoke;
      v54[3] = &unk_1E56DCFC0;
      id v55 = v26;
      id v56 = v27;
      id v29 = v27;
      id v30 = v26;
      [v28 enumerateObjectsUsingBlock:v54];

      v31 = (void *)[v29 copy];
      id v32 = *a6;
      *a6 = v31;
    }
  }
  v33 = [v16 enrouteTransitTypes];
  v34 = [v15 enrouteTransitTypes];
  v35 = [(PKTransitAppletState *)self updatedEnrouteTransitTypesFromExistingTypes:v33 newTypes:v34];
  [v16 setEnrouteTransitTypes:v35];

  [v15 historyRecords];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = [*(id *)(*((void *)&v50 + 1) + 8 * i) historySequenceNumber];
        if (v41)
        {
          v42 = (void *)v41;
          [v16 setHistorySequenceNumber:v41];

          goto LABEL_14;
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if ((unint64_t)a4 | (unint64_t)a5 && ![(PKTransitAppletState *)self isEqual:v16])
  {
    [(PKTransitAppletState *)self _resolveTransactionsFromState:self toState:v16 withHistoryRecords:v36 concreteTransactions:a4 ephemeralTransaction:a5 balanceLabels:v49 unitDictionary:v48 planLabels:v47];
    v43 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = [v16 isInStation];
      v45 = &stru_1EE0F5368;
      if (v44) {
        v45 = @"inStation ";
      }
      *(_DWORD *)buf = 138412290;
      v58 = v45;
      _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, "Resolved State is: %@", buf, 0xCu);
    }
  }
  return v16;
}

void __171__PKTransitAppletState_processUpdateWithAppletHistory_concreteTransactions_ephemeralTransaction_mutatedBalances_balanceLabelDictionary_unitDictionary_planLabelDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v3, "identifier", (void)v17);
      v11 = [v9 identifier];
      uint64_t v12 = v11;
      if (v10 && v11)
      {
        char v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v10 == v12)
        {
LABEL_14:
          id v14 = v9;

          if (!v3 || !v14) {
            goto LABEL_18;
          }
          char v15 = [v3 isEqual:v14];
          uint64_t v16 = v14;
          if ((v15 & 1) == 0) {
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v14 = 0;
LABEL_18:
  uint64_t v16 = v3;
  if (v14 != v3)
  {
LABEL_19:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (void)v17);
    uint64_t v16 = v14;
  }
LABEL_20:
}

- (id)updatedEnrouteTransitTypesFromExistingTypes:(id)a3 newTypes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)[v6 count];
  if (v7)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    if (v7)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke;
      v14[3] = &unk_1E56DCFE8;
      id v8 = v6;
      id v15 = v8;
      id v9 = v7;
      id v16 = v9;
      [v5 enumerateObjectsUsingBlock:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke_2;
      v12[3] = &unk_1E56DD010;
      id v7 = v9;
      id v13 = v7;
      [v8 enumerateObjectsUsingBlock:v12];
    }
  }
  if ([v7 count]) {
    uint64_t v10 = (void *)[v7 copy];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

void __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7 balanceLabels:(id)a8 unitDictionary:(id)a9 planLabels:(id)a10
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v97 = a5;
  id v106 = a8;
  id v109 = a9;
  id v108 = a10;
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v110 = [v13 historySequenceNumber];
  uint64_t v15 = [v110 unsignedIntegerValue];
  id v16 = [v13 enrouteTransitTypes];
  long long v17 = [v14 enrouteTransitTypes];
  v98 = v16;
  long long v18 = [v16 lastObject];
  v95 = v17;
  long long v19 = [v17 lastObject];
  v94 = v19;
  if (v19 && (long long v20 = v19, ([v19 isEqual:v18] & 1) == 0)) {
    uint64_t v104 = PKPaymentTransactionTransitSubtypeForTransactionDetailString(v20);
  }
  else {
    uint64_t v104 = 0;
  }
  uint64_t v21 = [v13 serverRefreshIdentifier];
  v101 = [v14 serverRefreshIdentifier];
  uint64_t v22 = [v13 appletStateDirty];
  v100 = v21;
  if (!v21 && v101 || v21 && v101 && (objc_msgSend(v21, "isEqualToNumber:") & 1) == 0) {
    uint64_t v22 = 1;
  }
  [v14 setAppletStateDirty:v22];
  id v103 = v14;
  id v93 = v13;
  if (!v110
    || ([v14 historySequenceNumber],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = [v23 unsignedIntegerValue],
        v23,
        v15 != v24))
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v25 = v97;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v117 objects:v122 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v118;
      while (2)
      {
        uint64_t v30 = 0;
        v31 = v28;
        do
        {
          if (*(void *)v118 != v29) {
            objc_enumerationMutation(v25);
          }
          id v32 = *(void **)(*((void *)&v117 + 1) + 8 * v30);
          uint64_t v28 = [v32 historySequenceNumber];
          uint64_t v33 = [v28 unsignedIntegerValue];
          if (v110 && v15 == v33)
          {

            uint64_t v28 = v31;
            goto LABEL_27;
          }
          if (!v31 || v33 != [v31 unsignedIntegerValue]) {
            [v107 addObject:v32];
          }

          ++v30;
          v31 = v28;
        }
        while (v27 != v30);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v117 objects:v122 count:16];
        if (v27) {
          continue;
        }
        break;
      }
LABEL_27:

      id v13 = v93;
      id v14 = v103;
    }
  }
  v34 = [v13 balance];
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = [MEMORY[0x1E4F28C28] zero];
  }
  uint64_t v37 = v36;
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    v105 = v36;
    v92 = v35;
    uint64_t v38 = [v14 currency];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v40 = [v107 reverseObjectEnumerator];
    uint64_t v41 = [v40 nextObject];
    id v42 = v106;
    v102 = v40;
    if (v41)
    {
      v43 = (void *)v41;
      v91 = 0;
      do
      {
        int v44 = [v43 concreteTransactionWithCurrency:v38 balanceLabels:v42 unitDictionary:v109 planLabels:v108];
        v45 = v44;
        if (v44)
        {
          v46 = [v44 amount];
          if (v46)
          {
            id v47 = [MEMORY[0x1E4F28C28] zero];
            uint64_t v48 = [v46 compare:v47];

            if (v48)
            {
              id v49 = [v105 decimalNumberBySubtracting:v46];
              long long v50 = v49;
              if (v49)
              {
                id v51 = v49;

                v105 = v51;
                id v14 = v103;
              }
              if (![v45 transitType])
              {
                if (v48 == -1) {
                  uint64_t v52 = 513;
                }
                else {
                  uint64_t v52 = 515;
                }
                [v45 setTransitType:v52];
              }

              v40 = v102;
            }
            id v42 = v106;
          }
          uint64_t v53 = [v43 recordType];
          if (v53)
          {
            if (v53 == 1)
            {
              if (v104)
              {
                if ([v45 transitType] == v104)
                {
                  v54 = [v45 endStation];

                  if (!v54)
                  {
                    [v45 setEnRoute:1];
                    id v55 = v45;

                    v91 = v55;
                  }
                }
              }
            }
          }
          else
          {
            id v56 = [v43 historySequenceNumber];

            if (v56) {
              [v39 addObject:v45];
            }
          }
        }
        uint64_t v57 = [v40 nextObject];

        v43 = (void *)v57;
      }
      while (v57);
    }
    else
    {
      v91 = 0;
    }
    v59 = [v14 balance];
    uint64_t v60 = v59;
    if (v59)
    {
      id v61 = v59;
    }
    else
    {
      id v61 = [MEMORY[0x1E4F28C28] zero];
    }
    v62 = v61;
    v63 = a6;

    uint64_t v64 = [v105 compare:v62];
    uint64_t v65 = v64;
    v66 = 0;
    if (v92)
    {
      uint64_t v67 = v104;
      if (v64)
      {
        v68 = [v105 decimalNumberBySubtracting:v62];
        v66 = v68;
        if (v68) {
          id v69 = v68;
        }
      }
    }
    else
    {
      uint64_t v67 = v104;
    }
    if (![v39 count] && v98)
    {
      v70 = v95;
      if (v95)
      {
        v70 = v95;
        if ([v95 isEqual:v98])
        {
          v63 = a6;
          goto LABEL_93;
        }
      }
      v89 = v62;
      if ([v70 count])
      {
        v71 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v70];
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __163__PKTransitAppletState__resolveTransactionsFromState_toState_withHistoryRecords_concreteTransactions_ephemeralTransaction_balanceLabels_unitDictionary_planLabels___block_invoke;
        v115[3] = &unk_1E56D82D0;
        id v116 = v71;
        id v72 = v71;
        objc_msgSend(v98, "pk_objectsPassingTest:", v115);
        id v73 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v73 = v98;
      }
      uint64_t v88 = v65;
      v90 = v38;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v74 = v73;
      uint64_t v75 = [v74 countByEnumeratingWithState:&v111 objects:v121 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v112;
        do
        {
          uint64_t v78 = 0;
          do
          {
            if (*(void *)v112 != v77) {
              objc_enumerationMutation(v74);
            }
            v79 = *(void **)(*((void *)&v111 + 1) + 8 * v78);
            v80 = +[PKPaymentTransaction paymentTransactionWithSource:1];
            [v80 setOriginatedByDevice:1];
            [v80 setTransactionType:2];
            [v80 setTransitType:PKPaymentTransactionTransitSubtypeForTransactionDetailString(v79)];
            if (v66)
            {
              if (v18 && v79)
              {
                if (([v79 isEqual:v18] & 1) == 0) {
                  goto LABEL_87;
                }
LABEL_86:
                [v80 setAmount:v66];

                v66 = 0;
                goto LABEL_87;
              }
              if (v79 == v18) {
                goto LABEL_86;
              }
            }
LABEL_87:
            [v39 addObject:v80];

            ++v78;
          }
          while (v76 != v78);
          uint64_t v81 = [v74 countByEnumeratingWithState:&v111 objects:v121 count:16];
          uint64_t v76 = v81;
        }
        while (v81);
      }

      v63 = a6;
      uint64_t v67 = v104;
      v62 = v89;
      uint64_t v38 = v90;
      uint64_t v65 = v88;
    }
LABEL_93:
    if (v66)
    {
      v82 = +[PKPaymentTransaction paymentTransactionWithSource:1];
      [v82 setOriginatedByDevice:1];
      [v82 setTransactionType:2];
      if (v65 == -1) {
        uint64_t v83 = 513;
      }
      else {
        uint64_t v83 = 515;
      }
      [v82 setTransitType:v83];
      [v82 setAmount:v66];
      [v39 addObject:v82];

      uint64_t v67 = v104;
    }
    if (![v39 count])
    {

      id v39 = 0;
    }
    if (v63)
    {
      uint64_t v84 = [v39 copy];
      id v85 = *v63;
      id *v63 = (id)v84;
    }
    if (a7) {
      BOOL v86 = v91 == 0;
    }
    else {
      BOOL v86 = 0;
    }
    int v87 = !v86;
    if (v86 && v67)
    {
      v58 = +[PKPaymentTransaction paymentTransactionWithSource:1];
      [v58 setOriginatedByDevice:1];
      [v58 setTransactionType:2];
      [v58 setTransitType:v67];
      [v58 setEnRoute:1];
      id v14 = v103;
      uint64_t v37 = v105;
      id v13 = v93;
    }
    else
    {
      if (v87) {
        v58 = v91;
      }
      else {
        v58 = 0;
      }
      id v14 = v103;
      uint64_t v37 = v105;
      id v13 = v93;
      if (!a7) {
        goto LABEL_117;
      }
    }
    objc_storeStrong(a7, v58);
LABEL_117:
    v35 = v92;
    goto LABEL_118;
  }
  v58 = 0;
LABEL_118:
}

uint64_t __163__PKTransitAppletState__resolveTransactionsFromState_toState_withHistoryRecords_concreteTransactions_ephemeralTransaction_balanceLabels_unitDictionary_planLabels___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3
{
  return [(PKTransitAppletState *)self transitPassPropertiesWithPaymentApplication:a3 pass:0];
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKSecureElementPassFieldCollection alloc] initWithBalanceFieldsFromPass:v6];

  id v9 = [(PKTransitAppletState *)self transitPassPropertiesWithPaymentApplication:v7 fieldCollection:v8];

  return v9;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKStoredValuePassProperties *)[PKTransitPassProperties alloc] initWithTransitAppletState:self paymentApplication:v7 fieldCollection:v6];

  return v8;
}

- (void)addEnrouteTransitType:(id)a3
{
  id v9 = a3;
  if (!-[NSArray containsObject:](self->_enrouteTransitTypes, "containsObject:"))
  {
    enrouteTransitTypes = self->_enrouteTransitTypes;
    if (enrouteTransitTypes) {
      id v5 = (id)[(NSArray *)enrouteTransitTypes mutableCopy];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v6 = v5;
    [v5 addObject:v9];
    id v7 = (NSArray *)[v6 copy];
    id v8 = self->_enrouteTransitTypes;
    self->_enrouteTransitTypes = v7;
  }
}

- (BOOL)isBlacklisted
{
  return self->_blacklisted;
}

- (void)setBlacklisted:(BOOL)a3
{
  self->_BOOL blacklisted = a3;
}

- (NSNumber)historySequenceNumber
{
  return self->_historySequenceNumber;
}

- (void)setHistorySequenceNumber:(id)a3
{
}

- (NSNumber)serverRefreshIdentifier
{
  return self->_serverRefreshIdentifier;
}

- (void)setServerRefreshIdentifier:(id)a3
{
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSNumber)loyaltyBalance
{
  return self->_loyaltyBalance;
}

- (void)setLoyaltyBalance:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
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

- (NSArray)commutePlans
{
  return self->_commutePlans;
}

- (void)setCommutePlans:(id)a3
{
}

- (NSArray)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
}

- (BOOL)needsStationProcessing
{
  return self->_needsStationProcessing;
}

- (void)setNeedsStationProcessing:(BOOL)a3
{
  self->_needsStationProcessing = a3;
}

- (BOOL)appletStateDirty
{
  return self->_appletStateDirty;
}

- (void)setAppletStateDirty:(BOOL)a3
{
  self->_appletStateDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_serverRefreshIdentifier, 0);
  objc_storeStrong((id *)&self->_historySequenceNumber, 0);
}

@end