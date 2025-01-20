@interface PKTransitAppletHistory
+ (BOOL)supportsSecureCoding;
- (BOOL)isBlacklisted;
- (BOOL)isInStation;
- (NSArray)balances;
- (NSArray)commutePlans;
- (NSArray)historyRecords;
- (NSArray)inStationDetails;
- (NSDate)expirationDate;
- (NSDecimalNumber)balance;
- (NSNumber)loyaltyBalance;
- (NSNumber)serverRefreshIdentifier;
- (NSSet)enrouteTransitTypes;
- (NSString)currency;
- (NSString)serviceProvider;
- (PKTransitAppletHistory)init;
- (PKTransitAppletHistory)initWithCoder:(id)a3;
- (PKTransitAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4;
- (id)felicaHistory;
- (int64_t)source;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBalance:(id)a3;
- (void)setBalances:(id)a3;
- (void)setBlacklisted:(BOOL)a3;
- (void)setCurrency:(id)a3;
- (void)setEnrouteTransitTypes:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHistoryRecords:(id)a3;
- (void)setInStationDetails:(id)a3;
- (void)setLoyaltyBalance:(id)a3;
- (void)setServerRefreshIdentifier:(id)a3;
- (void)setServiceProvider:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation PKTransitAppletHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletHistory)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKTransitAppletHistory;
  result = [(PKTransitAppletHistory *)&v3 init];
  if (result) {
    result->_source = 0;
  }
  return result;
}

- (PKTransitAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"State"];
  if (v7)
  {
    v80.receiver = self;
    v80.super_class = (Class)PKTransitAppletHistory;
    v8 = [(PKTransitAppletHistory *)&v80 init];
    v9 = v8;
    if (v8)
    {
      v8->_source = a4;
      uint64_t v10 = [v7 PKStringForKey:@"SP"];
      serviceProvider = v9->_serviceProvider;
      v9->_serviceProvider = (NSString *)v10;

      v12 = [v7 PKNumberForKey:@"CardDenyListed"];
      v9->_blacklisted = [v12 BOOLValue];

      v13 = [v7 objectForKeyedSubscript:@"TransactionInProgress"];
      objc_storeStrong((id *)&v9->_inStationDetails, v13);
      v63 = v13;
      uint64_t v14 = PKEnrouteTransitTypesForTransactionsInProgress(v13);
      enrouteTransitTypes = v9->_enrouteTransitTypes;
      v9->_enrouteTransitTypes = (NSSet *)v14;

      v16 = [v7 PKDecimalNumberForKey:@"Balance"];
      uint64_t v17 = [v16 copy];
      balance = v9->_balance;
      v9->_balance = (NSDecimalNumber *)v17;

      uint64_t v19 = [v7 PKStringForKey:@"CardCurrency"];
      currency = v9->_currency;
      v9->_currency = (NSString *)v19;

      v21 = [v7 PKNumberForKey:@"PointBalance"];
      uint64_t v22 = [v21 copy];
      loyaltyBalance = v9->_loyaltyBalance;
      v9->_loyaltyBalance = (NSNumber *)v22;

      v24 = [v7 PKDateComponentsForKey:@"CardExpirationDate"];
      uint64_t v25 = PKDateFromDateComponents(v24);
      expirationDate = v9->_expirationDate;
      v9->_expirationDate = (NSDate *)v25;

      v27 = [v7 PKNumberForKey:@"ServerRefreshRequired"];
      uint64_t v28 = [v27 copy];
      serverRefreshIdentifier = v9->_serverRefreshIdentifier;
      v9->_serverRefreshIdentifier = (NSNumber *)v28;

      v30 = [v7 PKArrayContaining:objc_opt_class() forKey:@"Balances"];
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v65 = v30;
      v66 = v7;
      if (v30)
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v32 = v30;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v84 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v77 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = [[PKTransitAppletBalance alloc] initWithDictionary:*(void *)(*((void *)&v76 + 1) + 8 * i)];
              if (v37) {
                [v31 addObject:v37];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v84 count:16];
          }
          while (v34);
        }

        uint64_t v38 = [v31 copy];
        balances = v9->_balances;
        v9->_balances = (NSArray *)v38;
      }
      v40 = [v7 PKArrayContaining:objc_opt_class() forKey:@"CommutePlans"];
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v67 = v6;
      v64 = v40;
      if (v40)
      {
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v42 = v40;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v83 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v73 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = [[PKTransitAppletCommutePlan alloc] initWithDictionary:*(void *)(*((void *)&v72 + 1) + 8 * j)];
              if (v47) {
                [v41 addObject:v47];
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v83 count:16];
          }
          while (v44);
        }

        uint64_t v48 = [v41 copy];
        commutePlans = v9->_commutePlans;
        v9->_commutePlans = (NSArray *)v48;

        id v6 = v67;
      }
      uint64_t v50 = [v6 PKDictionaryForKey:@"Transaction"];
      if (v50)
      {
        uint64_t v82 = v50;
        objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v82, 1, v50);
      }
      else
      {
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), @"TransactionHistory", 0);
      v51 = };
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v53 = v51;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v68 objects:v81 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v69;
        do
        {
          for (uint64_t k = 0; k != v55; ++k)
          {
            if (*(void *)v69 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = [[PKTransitAppletHistoryRecord alloc] initWithDictionary:*(void *)(*((void *)&v68 + 1) + 8 * k)];
            if (v58) {
              [v52 addObject:v58];
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v68 objects:v81 count:16];
        }
        while (v55);
      }

      uint64_t v59 = [v52 copy];
      historyRecords = v9->_historyRecords;
      v9->_historyRecords = (NSArray *)v59;

      v7 = v66;
      id v6 = v67;
      self = v63;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKTransitAppletHistory)initWithCoder:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKTransitAppletHistory;
  v5 = [(PKTransitAppletHistory *)&v50 init];
  if (v5)
  {
    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProvider"];
    serviceProvider = v5->_serviceProvider;
    v5->_serviceProvider = (NSString *)v6;

    v5->_blacklisted = [v4 decodeBoolForKey:@"blacklisted"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"inStationDetails"];
    inStationDetails = v5->_inStationDetails;
    v5->_inStationDetails = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"enrouteFlagsKey"];
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSSet *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverRefreshIdentifier"];
    serverRefreshIdentifier = v5->_serverRefreshIdentifier;
    v5->_serverRefreshIdentifier = (NSNumber *)v20;

    if (!v5->_enrouteTransitTypes)
    {
      uint64_t v22 = v5->_inStationDetails;
      if (v22)
      {
        uint64_t v23 = PKEnrouteTransitTypesForTransactionsInProgress(v22);
        v24 = v5->_enrouteTransitTypes;
        v5->_enrouteTransitTypes = (NSSet *)v23;
      }
    }
    if ([v4 decodeBoolForKey:@"inStation"]
      && ![(NSSet *)v5->_enrouteTransitTypes count])
    {
      v51[0] = @"TransitMetro";
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      uint64_t v26 = PKEnrouteTransitTypesForTransactionsInProgress(v25);
      v27 = v5->_enrouteTransitTypes;
      v5->_enrouteTransitTypes = (NSSet *)v26;
    }
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loyaltyBalance"];
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v32;

    uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"historyRecords"];
    historyRecords = v5->_historyRecords;
    v5->_historyRecords = (NSArray *)v37;

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    id v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"balances"];
    balances = v5->_balances;
    v5->_balances = (NSArray *)v42;

    uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"commutePlans"];
    commutePlans = v5->_commutePlans;
    v5->_commutePlans = (NSArray *)v47;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKTransitAppletHistory;
  [(PKTransitAppletHistory *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source = self->_source;
  id v5 = a3;
  [v5 encodeInteger:source forKey:@"source"];
  [v5 encodeObject:self->_serviceProvider forKey:@"serviceProvider"];
  [v5 encodeObject:self->_serverRefreshIdentifier forKey:@"serverRefreshIdentifier"];
  [v5 encodeBool:self->_blacklisted forKey:@"blacklisted"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_loyaltyBalance forKey:@"loyaltyBalance"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_historyRecords forKey:@"historyRecords"];
  [v5 encodeObject:self->_inStationDetails forKey:@"inStationDetails"];
  [v5 encodeObject:self->_enrouteTransitTypes forKey:@"enrouteFlagsKey"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PKTransitAppletHistory isInStation](self, "isInStation"), @"inStation");
  [v5 encodeObject:self->_balances forKey:@"balances"];
  [v5 encodeObject:self->_commutePlans forKey:@"commutePlans"];
}

- (BOOL)isInStation
{
  return [(NSSet *)self->_enrouteTransitTypes count] != 0;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_int64_t source = a3;
}

- (NSString)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (NSNumber)serverRefreshIdentifier
{
  return self->_serverRefreshIdentifier;
}

- (void)setServerRefreshIdentifier:(id)a3
{
}

- (BOOL)isBlacklisted
{
  return self->_blacklisted;
}

- (void)setBlacklisted:(BOOL)a3
{
  self->_blacklisted = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
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

- (NSArray)historyRecords
{
  return self->_historyRecords;
}

- (void)setHistoryRecords:(id)a3
{
}

- (NSArray)inStationDetails
{
  return self->_inStationDetails;
}

- (void)setInStationDetails:(id)a3
{
}

- (NSSet)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_inStationDetails, 0);
  objc_storeStrong((id *)&self->_historyRecords, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_serverRefreshIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

- (id)felicaHistory
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v3 = self;
  }
  else {
    objc_super v3 = 0;
  }
  return v3;
}

@end