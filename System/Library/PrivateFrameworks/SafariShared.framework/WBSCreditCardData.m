@interface WBSCreditCardData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameCreditCardInformationAs:(id)a3;
- (BOOL)isCardBalanceZeroOrNegative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImportedCard:(id)a3;
- (BOOL)isVirtualCard;
- (BOOL)promptToSaveSecurityCode;
- (BOOL)shouldHide;
- (NSDate)expirationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)cardName;
- (NSString)cardNumber;
- (NSString)cardSecurityCode;
- (NSString)cardholderName;
- (PKCurrencyAmount)balance;
- (PKVirtualCard)virtualCard;
- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6;
- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6 securityCode:(id)a7;
- (WBSCreditCardData)initWithCoder:(id)a3;
- (WBSCreditCardData)initWithKeychainRepresentation:(id)a3;
- (WBSCreditCardData)initWithVirtualCard:(id)a3;
- (WBSCreditCardData)initWithVirtualCardCredentials:(id)a3 virtualCard:(id)a4;
- (id)_expirationDateFormatter;
- (id)_expirationDateFromPKVirtualCard:(id)a3;
- (id)_expirationDateFromPKVirtualCardCredentials:(id)a3;
- (id)creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:(id)a3 mergeSecurityCode:(BOOL)a4;
- (id)creditCardDataByUpdatingLastUsedDate:(id)a3;
- (id)description;
- (id)keychainRepresentationByMigratingExistingKeychainData:(id)a3;
- (id)keychainRepresentationForNewCard;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCardName:(id)a3;
- (void)setCardNumber:(id)a3;
- (void)setCardholderName:(id)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setPromptToSaveSecurityCode:(BOOL)a3;
- (void)test_setBalance:(id)a3;
- (void)test_setLastUsedDate:(id)a3;
@end

@implementation WBSCreditCardData

- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6 securityCode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSCreditCardData;
  v17 = [(WBSCreditCardData *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    expirationDate = v17->_expirationDate;
    v17->_expirationDate = (NSDate *)v18;

    if (v12)
    {
      uint64_t v20 = [v12 copy];
      cardName = v17->_cardName;
      v17->_cardName = (NSString *)v20;
    }
    else
    {
      cardName = v17->_cardName;
      v17->_cardName = (NSString *)&stru_1EFBE3CF8;
    }

    if (v13)
    {
      uint64_t v22 = [v13 copy];
      cardNumber = v17->_cardNumber;
      v17->_cardNumber = (NSString *)v22;
    }
    else
    {
      cardNumber = v17->_cardNumber;
      v17->_cardNumber = (NSString *)&stru_1EFBE3CF8;
    }

    if (v14)
    {
      uint64_t v24 = [v14 copy];
      cardholderName = v17->_cardholderName;
      v17->_cardholderName = (NSString *)v24;
    }
    else
    {
      cardholderName = v17->_cardholderName;
      v17->_cardholderName = (NSString *)&stru_1EFBE3CF8;
    }

    if (v16)
    {
      uint64_t v26 = [v16 copy];
      cardSecurityCode = v17->_cardSecurityCode;
      v17->_cardSecurityCode = (NSString *)v26;
    }
    else
    {
      cardSecurityCode = v17->_cardSecurityCode;
      v17->_cardSecurityCode = (NSString *)&stru_1EFBE3CF8;
    }

    v17->_promptToSaveSecurityCode = 1;
    v28 = v17;
  }

  return v17;
}

- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6
{
  return [(WBSCreditCardData *)self initWithCardName:a3 number:a4 cardholderName:a5 expirationDate:a6 securityCode:0];
}

- (WBSCreditCardData)initWithVirtualCard:(id)a3
{
  id v5 = a3;
  v6 = [(WBSCreditCardData *)self _expirationDateFromPKVirtualCard:v5];
  v7 = [v5 displayablePANSuffix];
  v8 = [v5 displayName];
  v9 = [v5 cardholderName];
  v10 = [(WBSCreditCardData *)self initWithCardName:v8 number:v7 cardholderName:v9 expirationDate:v6];

  if (v10)
  {
    v11 = [v5 lastAutoFilledBySafari];

    if (!v11) {
      [v5 setLastAutoFilledBySafariWithCompletion:&__block_literal_global_33];
    }
    id v12 = [v5 lastAutoFilledBySafari];
    if (v12) {
      [v5 lastAutoFilledBySafari];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    }
    lastUsedDate = v10->_lastUsedDate;
    v10->_lastUsedDate = (NSDate *)v13;

    objc_storeStrong((id *)&v10->_virtualCard, a3);
    uint64_t v15 = [v5 balance];
    balance = v10->_balance;
    v10->_balance = (PKCurrencyAmount *)v15;

    v17 = v10;
  }

  return v10;
}

void __41__WBSCreditCardData_initWithVirtualCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      __41__WBSCreditCardData_initWithVirtualCard___block_invoke_cold_1(v4, v5, v3);
    }
  }
}

- (WBSCreditCardData)initWithVirtualCardCredentials:(id)a3 virtualCard:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == 2)
  {
    v8 = [v7 billingAddress];

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4F1B910];
      v10 = [v7 billingAddress];
      v11 = [v9 stringFromContact:v10 style:0];
    }
    else if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      uint64_t v15 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
      v29[0] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v17 = objc_msgSend(v14, "_ios_meContactWithKeysToFetch:error:", v16, 0);

      if (v17)
      {
        v11 = [MEMORY[0x1E4F1B910] stringFromContact:v17 style:0];
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    uint64_t v13 = [(WBSCreditCardData *)self _expirationDateFromPKVirtualCardCredentials:v6];
  }
  else
  {
    uint64_t v12 = [v7 cardholderName];
    uint64_t v13 = [(WBSCreditCardData *)self _expirationDateFromPKVirtualCard:v7];
    v11 = (void *)v12;
  }
  uint64_t v18 = [v6 primaryAccountNumber];
  v19 = [v18 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EFBE3CF8];

  uint64_t v20 = [v7 displayName];
  v21 = [v6 cardSecurityCode];
  uint64_t v22 = [(WBSCreditCardData *)self initWithCardName:v20 number:v19 cardholderName:v11 expirationDate:v13 securityCode:v21];

  if (v22)
  {
    uint64_t v23 = [v7 lastAutoFilledBySafari];
    lastUsedDate = v22->_lastUsedDate;
    v22->_lastUsedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v22->_virtualCard, a4);
    uint64_t v25 = [v7 balance];
    balance = v22->_balance;
    v22->_balance = (PKCurrencyAmount *)v25;

    v27 = v22;
  }

  return v22;
}

- (BOOL)isCardBalanceZeroOrNegative
{
  balance = self->_balance;
  if (!balance) {
    return 0;
  }
  v3 = [(PKCurrencyAmount *)balance amount];
  v4 = [MEMORY[0x1E4F28C28] zero];
  BOOL v5 = [v3 compare:v4] != 1;

  return v5;
}

- (BOOL)isVirtualCard
{
  return self->_virtualCard != 0;
}

- (id)_expirationDateFromPKVirtualCardCredentials:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSCreditCardData *)self _expirationDateFormatter];
  id v6 = [v4 expiration];
  id v7 = [v5 dateFromString:v6];

  return v7;
}

- (id)_expirationDateFromPKVirtualCard:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSCreditCardData *)self _expirationDateFormatter];
  id v6 = [v4 expiration];
  id v7 = [v5 dateFromString:v6];

  return v7;
}

- (id)_expirationDateFormatter
{
  if (-[WBSCreditCardData _expirationDateFormatter]::onceToken != -1) {
    dispatch_once(&-[WBSCreditCardData _expirationDateFormatter]::onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter;
  return v2;
}

uint64_t __45__WBSCreditCardData__expirationDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter;
  -[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter = (uint64_t)v0;

  id v2 = (void *)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter;
  return [v2 setDateFormat:@"MM/yyyy"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p (card name \"%@\", cardholder name \"%@\", card number %@ expiration date %@ security code %@, last used date %@)>", objc_opt_class(), self, self->_cardName, self->_cardholderName, self->_cardNumber, self->_expirationDate, self->_cardSecurityCode, self->_lastUsedDate];
}

- (WBSCreditCardData)initWithKeychainRepresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = [v5 objectForKeyedSubscript:@"CardNameUIString"];
      uint64_t v23 = [v5 objectForKeyedSubscript:@"CardholderName"];
      id v7 = [v5 objectForKeyedSubscript:@"CardNumber"];
      v8 = [v5 objectForKeyedSubscript:@"ExpirationDate"];
      v9 = [v5 objectForKeyedSubscript:@"LastUsedDate"];
      v10 = [v5 objectForKeyedSubscript:@"CardSecurityCode"];
      v11 = (void *)0x1E4F29000;
      uint64_t v12 = (objc_class *)objc_opt_class();
      int v13 = isNilOrKindOfClass(v10, v12);
      if (v7
        && (int v14 = v13, v15 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v6, v15))
        && (id v16 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v7, v16))
        && (v17 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v23, v17))
        && (uint64_t v18 = (objc_class *)objc_opt_class(), (isNilOrKindOfClass(v8, v18) & v14 & 1) != 0))
      {
        self = [(WBSCreditCardData *)self initWithCardName:v6 number:v7 cardholderName:v23 expirationDate:v8 securityCode:v10];
        v19 = [v5 objectForKey:@"PromptToSaveSecurityCode"];
        if (v19)
        {
          v11 = [v5 objectForKey:@"PromptToSaveSecurityCode"];
          uint64_t v20 = [v11 BOOLValue];
        }
        else
        {
          uint64_t v20 = 1;
        }
        [(WBSCreditCardData *)self setPromptToSaveSecurityCode:v20];
        if (v19) {

        }
        v21 = [(WBSCreditCardData *)self creditCardDataByUpdatingLastUsedDate:v9];
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)keychainRepresentationForNewCard
{
  id v2 = (void *)MEMORY[0x1E4F28F98];
  v3 = [(WBSCreditCardData *)self dictionaryRepresentation];
  id v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_cardName forKeyedSubscript:@"CardNameUIString"];
  [v3 setObject:self->_cardholderName forKeyedSubscript:@"CardholderName"];
  [v3 setObject:self->_cardNumber forKeyedSubscript:@"CardNumber"];
  expirationDate = self->_expirationDate;
  if (expirationDate) {
    [v3 setObject:expirationDate forKeyedSubscript:@"ExpirationDate"];
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate) {
    [v3 setObject:lastUsedDate forKeyedSubscript:@"LastUsedDate"];
  }
  cardSecurityCode = self->_cardSecurityCode;
  if (cardSecurityCode) {
    [v3 setObject:cardSecurityCode forKeyedSubscript:@"CardSecurityCode"];
  }
  id v7 = [NSNumber numberWithBool:self->_promptToSaveSecurityCode];
  [v3 setObject:v7 forKeyedSubscript:@"PromptToSaveSecurityCode"];

  v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (id)keychainRepresentationByMigratingExistingKeychainData:(id)a3
{
  v40[7] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  uint64_t v3 = *MEMORY[0x1E4F3B878];
  v39[0] = *MEMORY[0x1E4F3B550];
  v39[1] = v3;
  v40[0] = @"com.apple.safari.credit-cards";
  v40[1] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v39[2] = *MEMORY[0x1E4F3B978];
  v39[3] = v5;
  v40[2] = v4;
  v40[3] = @"SafariCreditCardEntries";
  uint64_t v6 = *MEMORY[0x1E4F3BB88];
  uint64_t v7 = *MEMORY[0x1E4F3BC78];
  v39[4] = *MEMORY[0x1E4F3BB80];
  v39[5] = v7;
  v40[4] = v6;
  v40[5] = MEMORY[0x1E4F1CC38];
  v39[6] = *MEMORY[0x1E4F3BC70];
  v40[6] = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:7];
  CFTypeRef result = 0;
  CFDictionaryRef v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  OSStatus v8 = SecItemCopyMatching(v29, &result);
  int v9 = v8;
  if (v8 == -25300)
  {
LABEL_18:
    v21 = 0;
    goto LABEL_27;
  }
  if (v8)
  {
    uint64_t v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[WBSCreditCardData keychainRepresentationByMigratingExistingKeychainData:](v9, v20);
    }
    goto LABEL_18;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)result;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    uint64_t v12 = *MEMORY[0x1E4F3BD38];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKeyedSubscript:v12];
        if (v14)
        {
          id v32 = 0;
          uint64_t v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v32];
          id v16 = v32;
          if (v15)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = objc_msgSend(v15, "safari_stringForKey:", @"CardNumber");
              uint64_t v18 = [v30 cardNumber];
              char v19 = [v17 isEqualToString:v18];

              if (v19)
              {

                goto LABEL_20;
              }
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_20:

  uint64_t v22 = (void *)[v15 mutableCopy];
  [v22 setObject:self->_cardName forKeyedSubscript:@"CardNameUIString"];
  [v22 setObject:self->_cardholderName forKeyedSubscript:@"CardholderName"];
  [v22 setObject:self->_cardNumber forKeyedSubscript:@"CardNumber"];
  expirationDate = self->_expirationDate;
  if (expirationDate) {
    [v22 setObject:expirationDate forKeyedSubscript:@"ExpirationDate"];
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate) {
    [v22 setObject:lastUsedDate forKeyedSubscript:@"LastUsedDate"];
  }
  cardSecurityCode = self->_cardSecurityCode;
  if (cardSecurityCode) {
    [v22 setObject:cardSecurityCode forKeyedSubscript:@"CardSecurityCode"];
  }
  uint64_t v26 = [NSNumber numberWithBool:self->_promptToSaveSecurityCode];
  [v22 setObject:v26 forKeyedSubscript:@"PromptToSaveSecurityCode"];

  v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v22 format:200 options:0 error:0];

LABEL_27:
  return v21;
}

- (id)creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:(id)a3 mergeSecurityCode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = gregorianYearFromDate(self->_expirationDate);
  OSStatus v8 = [v6 expirationDate];
  unint64_t v9 = gregorianYearFromDate(v8);

  if (v4)
  {
    if ([(NSString *)self->_cardSecurityCode length])
    {
      uint64_t v10 = self->_cardSecurityCode;
    }
    else
    {
      uint64_t v10 = [v6 cardSecurityCode];
    }
    uint64_t v11 = v10;
    if (v9 > v7)
    {
      uint64_t v12 = [v6 cardSecurityCode];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        uint64_t v14 = [v6 cardSecurityCode];

        uint64_t v11 = (void *)v14;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  cardSecurityCode = self->_cardSecurityCode;
  id v16 = [v6 cardSecurityCode];
  BOOL v17 = [(NSString *)cardSecurityCode isEqualToString:v16];

  cardholderName = self->_cardholderName;
  char v19 = [v6 cardholderName];
  if ([(NSString *)cardholderName isEqualToString:v19])
  {
    expirationDate = self->_expirationDate;
    v21 = [v6 expirationDate];
    int v22 = [(NSDate *)expirationDate isEqualToDate:v21] && v17;

    if (v22 == 1)
    {
      uint64_t v23 = self;
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v24 = self->_expirationDate;
  if (v9 > v7)
  {
    uint64_t v25 = [v6 expirationDate];

    uint64_t v24 = (NSDate *)v25;
  }
  uint64_t v26 = [v6 lastUsedDate];
  v27 = v26;
  if (!v26 || self->_lastUsedDate && -[NSDate compare:](v26, "compare:") == NSOrderedAscending)
  {
    v28 = self->_lastUsedDate;

    v27 = v28;
  }
  CFDictionaryRef v29 = [WBSCreditCardData alloc];
  cardNumber = self->_cardNumber;
  cardName = self->_cardName;
  NSUInteger v32 = [(NSString *)self->_cardholderName length];
  if (v32)
  {
    long long v33 = self->_cardholderName;
  }
  else
  {
    long long v33 = [v6 cardholderName];
  }
  uint64_t v23 = [(WBSCreditCardData *)v29 initWithCardName:cardName number:cardNumber cardholderName:v33 expirationDate:v24 securityCode:v11];
  if (!v32) {

  }
  [(WBSCreditCardData *)v23 setLastUsedDate:v27];
  -[WBSCreditCardData setPromptToSaveSecurityCode:](v23, "setPromptToSaveSecurityCode:", [v6 promptToSaveSecurityCode]);

LABEL_25:
  return v23;
}

- (id)creditCardDataByUpdatingLastUsedDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WBSCreditCardData alloc] initWithCardName:self->_cardName number:self->_cardNumber cardholderName:self->_cardholderName expirationDate:self->_expirationDate securityCode:self->_cardSecurityCode];
  [(WBSCreditCardData *)v5 setLastUsedDate:v4];
  [(WBSCreditCardData *)v5 setPromptToSaveSecurityCode:self->_promptToSaveSecurityCode];

  return v5;
}

- (BOOL)hasSameCreditCardInformationAs:(id)a3
{
  id v4 = [a3 cardNumber];
  if (v4) {
    BOOL v5 = [(NSString *)self->_cardNumber isEqualToString:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToImportedCard:(id)a3
{
  id v3 = a3;
  id v4 = [v3 cardName];
  if (WBSIsEqual())
  {
    BOOL v5 = [v3 cardholderName];
    if (WBSIsEqual())
    {
      id v6 = [v3 cardNumber];
      if (WBSIsEqual())
      {
        unint64_t v7 = [v3 expirationDate];
        if (WBSIsEqual())
        {
          OSStatus v8 = [v3 lastUsedDate];
          char v9 = WBSIsEqual();
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)test_setBalance:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x1E4F97EA0] isInternalInstall]) {
    objc_storeStrong((id *)&self->_balance, a3);
  }
}

- (void)test_setLastUsedDate:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x1E4F97EA0] isInternalInstall]) {
    objc_storeStrong((id *)&self->_lastUsedDate, a3);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCreditCardData *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(WBSCreditCardData *)v5 balance];
      char v7 = WBSIsEqual();

      if (v7)
      {
        OSStatus v8 = [(WBSCreditCardData *)v5 cardName];
        if (WBSIsEqual())
        {
          char v9 = [(WBSCreditCardData *)v5 cardholderName];
          if (WBSIsEqual())
          {
            uint64_t v10 = [(WBSCreditCardData *)v5 cardNumber];
            if (WBSIsEqual())
            {
              uint64_t v11 = [(WBSCreditCardData *)v5 expirationDate];
              if (WBSIsEqual())
              {
                uint64_t v12 = [(WBSCreditCardData *)v5 cardSecurityCode];
                char v13 = WBSIsEqual();
              }
              else
              {
                char v13 = 0;
              }
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cardName hash];
  NSUInteger v4 = [(NSString *)self->_cardholderName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_cardNumber hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_expirationDate hash];
  return v6 ^ [(NSString *)self->_cardSecurityCode hash];
}

- (BOOL)shouldHide
{
  NSUInteger v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"DebugSkipCreditCardValidation"];

  if (v4) {
    return 0;
  }
  [(NSDate *)self->_expirationDate timeIntervalSinceNow];
  return v6 < -31536000.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_cardName forKey:@"CardNameUIString"];
  [v4 encodeObject:self->_cardholderName forKey:@"CardholderName"];
  [v4 encodeObject:self->_cardNumber forKey:@"CardNumber"];
  [v4 encodeObject:self->_expirationDate forKey:@"ExpirationDate"];
  [v4 encodeObject:self->_lastUsedDate forKey:@"LastUsedDate"];
  [v4 encodeObject:self->_cardSecurityCode forKey:@"CardSecurityCode"];
  [v4 encodeObject:self->_virtualCard forKey:@"VirtualCard"];
}

- (WBSCreditCardData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2050000000;
  NSUInteger v5 = (void *)getPKVirtualCardClass(void)::softClass;
  uint64_t v19 = getPKVirtualCardClass(void)::softClass;
  if (!getPKVirtualCardClass(void)::softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___ZL21getPKVirtualCardClassv_block_invoke;
    v15[3] = &unk_1E5C9A2F8;
    v15[4] = &v16;
    ___ZL21getPKVirtualCardClassv_block_invoke((uint64_t)v15);
    NSUInteger v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  char v7 = [v4 decodeObjectOfClass:v6 forKey:@"VirtualCard"];
  if (v7)
  {
    OSStatus v8 = [(WBSCreditCardData *)self initWithVirtualCard:v7];
  }
  else
  {
    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CardNameUIString"];
    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CardholderName"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CardNumber"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDate"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastUsedDate"];
    char v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CardSecurityCode"];
    OSStatus v8 = [(WBSCreditCardData *)self initWithCardName:v7 number:v10 cardholderName:v9 expirationDate:v11 securityCode:v13];
    [(WBSCreditCardData *)v8 setLastUsedDate:v12];
  }
  return v8;
}

- (NSString)cardName
{
  return self->_cardName;
}

- (void)setCardName:(id)a3
{
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
}

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (void)setCardNumber:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (BOOL)promptToSaveSecurityCode
{
  return self->_promptToSaveSecurityCode;
}

- (void)setPromptToSaveSecurityCode:(BOOL)a3
{
  self->_promptToSaveSecurityCode = a3;
}

- (PKVirtualCard)virtualCard
{
  return self->_virtualCard;
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_virtualCard, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_cardName, 0);
}

void __41__WBSCreditCardData_initWithVirtualCard___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to update last used date on virtual card %{public}@", buf, 0xCu);
}

- (void)keychainRepresentationByMigratingExistingKeychainData:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed fetching credit cards with error %d", (uint8_t *)v2, 8u);
}

@end