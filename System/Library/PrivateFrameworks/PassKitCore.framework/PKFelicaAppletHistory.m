@interface PKFelicaAppletHistory
+ (BOOL)supportsSecureCoding;
+ (int64_t)appletTypeForDictionary:(id)a3;
- (BOOL)isBalanceAllowedForCommute;
- (BOOL)isGreenCarTicketUsed;
- (BOOL)isInShinkansenStation;
- (BOOL)isInStation;
- (BOOL)isLowBalanceNotificationEnabled;
- (BOOL)isShinkansenTicketActive;
- (NSNumber)SPID;
- (NSString)transactionID;
- (PKFelicaAppletHistory)initWithCoder:(id)a3;
- (PKFelicaAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4;
- (PKFelicaGreenCarTicket)greenCarTicket;
- (PKFelicaShinkansenTicket)shinkansenTicket;
- (int64_t)transactionType;
- (int64_t)type;
- (void)_addEnrouteTransitType:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)sanitizeValuesWithState:(id)a3;
@end

@implementation PKFelicaAppletHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)appletTypeForDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"NFServiceProviderID"];
  int64_t v4 = PKFelicaAppletTypeFromSPID(v3);

  return v4;
}

- (PKFelicaAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKFelicaAppletHistory;
  v7 = [(PKTransitAppletHistory *)&v46 init];
  v8 = v7;
  if (v7)
  {
    [(PKTransitAppletHistory *)v7 setSource:a4];
    if (v6)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      a4 = [v6 allKeys];
      v10 = (void *)[v9 initWithArray:a4];
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)&v8->_existingKeys, v10);
    if (v6)
    {
    }
    v11 = [v6 objectForKeyedSubscript:@"NFServiceProviderID"];
    uint64_t v12 = [v11 copy];
    SPID = v8->_SPID;
    v8->_SPID = (NSNumber *)v12;

    v8->_type = PKFelicaAppletTypeFromSPID(v8->_SPID);
    v14 = [v6 objectForKeyedSubscript:@"NFBlacklisted"];
    -[PKTransitAppletHistory setBlacklisted:](v8, "setBlacklisted:", [v14 BOOLValue]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v16 = [v6 objectForKeyedSubscript:@"NFInStation"];

    if ([v16 BOOLValue]) {
      [v15 addObject:@"Transit"];
    }
    v17 = [v6 objectForKeyedSubscript:@"NFInStationShinkansen"];

    if ([v17 BOOLValue]) {
      [v15 addObject:@"TransitTrainShinkansen"];
    }
    [(PKTransitAppletHistory *)v8 setEnrouteTransitTypes:v15];
    v18 = [v6 objectForKeyedSubscript:@"NFTicketUsed"];

    v8->_greenCarTicketUsed = [v18 BOOLValue];
    v19 = [v6 objectForKeyedSubscript:@"NFTicketSelected"];

    v8->_shinkansenTicketActive = [v19 unsignedIntegerValue] != 0;
    v20 = [v6 objectForKeyedSubscript:@"NFAllowBalanceUsageForCommute"];

    v8->_balanceAllowedForCommute = [v20 BOOLValue];
    v21 = [v6 objectForKeyedSubscript:@"NFNotifyOnLowBalance"];

    v8->_lowBalanceNotificationEnabled = [v21 BOOLValue];
    v22 = [v6 objectForKeyedSubscript:@"NFBalance"];
    v23 = PKDecimalAmountFromAmount(v22, @"JPY");
    [(PKTransitAppletHistory *)v8 setBalance:v23];

    [(PKTransitAppletHistory *)v8 setCurrency:@"JPY"];
    v24 = [v6 objectForKeyedSubscript:@"NFHistoryRecords"];
    uint64_t v25 = [v24 count];
    if (v25)
    {
      v40 = v21;
      id v41 = v15;
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = v24;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [[PKFelicaAppletHistoryRecord alloc] initWithDictionary:*(void *)(*((void *)&v42 + 1) + 8 * v31)];
            if (v32) {
              [v26 addObject:v32];
            }

            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v29);
      }

      [(PKTransitAppletHistory *)v8 setHistoryRecords:v26];
      v21 = v40;
      id v15 = v41;
    }
    v33 = objc_msgSend(v6, "objectForKeyedSubscript:", @"NFShinkansenTicket", v40, v41, (void)v42);

    if (v33)
    {
      v34 = [[PKFelicaShinkansenTicket alloc] initWithDictionary:v33];
      shinkansenTicket = v8->_shinkansenTicket;
      v8->_shinkansenTicket = v34;
    }
    v36 = [v6 objectForKeyedSubscript:@"NFGreenCarTicket"];

    if (v36)
    {
      v37 = [[PKFelicaGreenCarTicket alloc] initWithDictionary:v36];
      greenCarTicket = v8->_greenCarTicket;
      v8->_greenCarTicket = v37;
    }
  }

  return v8;
}

- (PKFelicaAppletHistory)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKFelicaAppletHistory;
  v5 = [(PKTransitAppletHistory *)&v19 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"existingKeys"];
    existingKeys = v5->_existingKeys;
    v5->_existingKeys = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SPID"];
    SPID = v5->_SPID;
    v5->_SPID = (NSNumber *)v11;

    v5->_type = PKFelicaAppletTypeFromSPID(v5->_SPID);
    v5->_shinkansenTicketActive = [v4 decodeBoolForKey:@"shinkansenTicketActive"];
    v5->_greenCarTicketUsed = [v4 decodeBoolForKey:@"ticketUsed"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenTicket"];
    shinkansenTicket = v5->_shinkansenTicket;
    v5->_shinkansenTicket = (PKFelicaShinkansenTicket *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarTicket"];
    greenCarTicket = v5->_greenCarTicket;
    v5->_greenCarTicket = (PKFelicaGreenCarTicket *)v15;

    v5->_balanceAllowedForCommute = [v4 decodeBoolForKey:@"balanceAllowedForCommute"];
    v5->_lowBalanceNotificationEnabled = [v4 decodeBoolForKey:@"lowBalanceNotificationEnabled"];
    v17 = [(PKTransitAppletHistory *)v5 enrouteTransitTypes];
    LODWORD(v7) = [v17 containsObject:@"TransitMetro"];

    if (v7) {
      [(PKTransitAppletHistory *)v5 setEnrouteTransitTypes:0];
    }
    if ([v4 decodeBoolForKey:@"inStation"]
      && ![(PKFelicaAppletHistory *)v5 isInStation])
    {
      [(PKFelicaAppletHistory *)v5 _addEnrouteTransitType:@"Transit"];
    }
    if ([v4 decodeBoolForKey:@"inShinkansenStation"]
      && ![(PKFelicaAppletHistory *)v5 isInShinkansenStation])
    {
      [(PKFelicaAppletHistory *)v5 _addEnrouteTransitType:@"TransitTrainShinkansen"];
    }
  }

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKFelicaAppletHistory;
  [(PKTransitAppletHistory *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKFelicaAppletHistory;
  id v4 = a3;
  [(PKTransitAppletHistory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_existingKeys, @"existingKeys", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_SPID forKey:@"SPID"];
  objc_msgSend(v4, "encodeBool:forKey:", -[PKFelicaAppletHistory isInShinkansenStation](self, "isInShinkansenStation"), @"inShinkansenStation");
  [v4 encodeBool:self->_shinkansenTicketActive forKey:@"shinkansenTicketActive"];
  [v4 encodeBool:self->_greenCarTicketUsed forKey:@"ticketUsed"];
  [v4 encodeObject:self->_shinkansenTicket forKey:@"shinkansenTicket"];
  [v4 encodeObject:self->_greenCarTicket forKey:@"greenCarTicket"];
  [v4 encodeBool:self->_balanceAllowedForCommute forKey:@"balanceAllowedForCommute"];
  [v4 encodeBool:self->_lowBalanceNotificationEnabled forKey:@"lowBalanceNotificationEnabled"];
}

- (void)sanitizeValuesWithState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 felicaState];
  if (v5)
  {
    if ([(PKTransitAppletHistory *)self source] != 1)
    {
      if (![(NSSet *)self->_existingKeys containsObject:@"NFBlacklisted"]) {
        -[PKTransitAppletHistory setBlacklisted:](self, "setBlacklisted:", [v4 isBlacklisted]);
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFInStation"]
        && [v5 isInStation]
        && ![(PKFelicaAppletHistory *)self isInStation])
      {
        [(PKFelicaAppletHistory *)self _addEnrouteTransitType:@"Transit"];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFInStationShinkansen"]
        && [v5 isInShinkansenStation]
        && ![(PKFelicaAppletHistory *)self isInShinkansenStation])
      {
        [(PKFelicaAppletHistory *)self _addEnrouteTransitType:@"TransitTrainShinkansen"];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFTicketSelected"]) {
        self->_shinkansenTicketActive = [v5 isShinkansenTicketActive];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFTicketUsed"]) {
        self->_greenCarTicketUsed = [v5 isGreenCarTicketUsed];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFBalance"])
      {
        id v6 = [v5 balance];
        [(PKTransitAppletHistory *)self setBalance:v6];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFAllowBalanceUsageForCommute"]) {
        self->_balanceAllowedForCommute = [v5 isBalanceAllowedForCommute];
      }
      if (![(NSSet *)self->_existingKeys containsObject:@"NFNotifyOnLowBalance"]) {
        self->_lowBalanceNotificationEnabled = [v5 isLowBalanceNotificationEnabled];
      }
    }
    if (!self->_greenCarTicketUsed && [(PKFelicaGreenCarTicket *)self->_greenCarTicket isRefunded])
    {
      greenCarTicket = self->_greenCarTicket;
      self->_greenCarTicket = 0;
    }
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected: cannot sanitize a non-felica state object against felica history", v9, 2u);
    }
  }
}

- (BOOL)isInShinkansenStation
{
  objc_super v2 = [(PKTransitAppletHistory *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"TransitTrainShinkansen"];

  return v3;
}

- (BOOL)isInStation
{
  objc_super v2 = [(PKTransitAppletHistory *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"Transit"];

  return v3;
}

- (void)_addEnrouteTransitType:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PKTransitAppletHistory *)self enrouteTransitTypes];
  id v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(PKTransitAppletHistory *)self setEnrouteTransitTypes:v9];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (NSNumber)SPID
{
  return self->_SPID;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (BOOL)isShinkansenTicketActive
{
  return self->_shinkansenTicketActive;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (BOOL)isLowBalanceNotificationEnabled
{
  return self->_lowBalanceNotificationEnabled;
}

- (PKFelicaShinkansenTicket)shinkansenTicket
{
  return self->_shinkansenTicket;
}

- (PKFelicaGreenCarTicket)greenCarTicket
{
  return self->_greenCarTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenCarTicket, 0);
  objc_storeStrong((id *)&self->_shinkansenTicket, 0);
  objc_storeStrong((id *)&self->_SPID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_existingKeys, 0);
}

@end