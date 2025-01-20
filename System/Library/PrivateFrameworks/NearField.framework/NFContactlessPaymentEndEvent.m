@interface NFContactlessPaymentEndEvent
+ (BOOL)logsTransactionDetails;
+ (BOOL)supportsSecureCoding;
- (BOOL)background;
- (BOOL)didError;
- (NFApplet)applet;
- (NFContactlessPaymentEndEvent)initWithCoder:(id)a3;
- (NFContactlessPaymentEndEvent)initWithDictionary:(id)a3;
- (NSData)tlv;
- (NSDecimalNumber)amount;
- (NSDictionary)felicaInfo;
- (NSDictionary)parsedInfo;
- (NSString)currency;
- (NSString)keyIdentifier;
- (NSString)readerIdentifier;
- (NSString)transactionIdentifier;
- (id)appletIdentifier;
- (id)asDictionary;
- (id)description;
- (unsigned)command;
- (unsigned)informative;
- (unsigned)result;
- (unsigned)status;
- (unsigned)type;
- (void)_setApplet:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFContactlessPaymentEndEvent

+ (BOOL)logsTransactionDetails
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.stockholm"];
  char v3 = [v2 BOOLForKey:@"LogTransactionDetails"];

  return v3;
}

- (NFContactlessPaymentEndEvent)initWithDictionary:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NFContactlessPaymentEndEvent;
  v5 = [(NFContactlessPaymentEndEvent *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"endPointIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"didError"];
    v5->_didError = [v14 BOOLValue];

    v15 = [v4 objectForKeyedSubscript:@"command"];
    v5->_command = [v15 unsignedIntValue];

    v16 = [v4 objectForKeyedSubscript:@"status"];
    v5->_status = [v16 unsignedIntValue];

    v17 = [v4 objectForKeyedSubscript:@"result"];
    v5->_result = [v17 unsignedIntValue];

    v18 = [v4 objectForKeyedSubscript:@"informative"];
    v5->_informative = [v18 unsignedIntValue];

    uint64_t v19 = [v4 objectForKeyedSubscript:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v21;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"tlv"];
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v23;

    v25 = [v4 objectForKeyedSubscript:@"type"];
    v5->_type = [v25 unsignedIntValue];

    uint64_t v26 = [v4 objectForKeyedSubscript:@"felicaInfo"];
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"parsedInfo"];
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v28;

    v30 = [v4 objectForKeyedSubscript:@"BackgroundTransaction"];
    v5->_background = [v30 BOOLValue];

    v31 = [v4 objectForKeyedSubscript:@"PairingModeBrandCode"];
    if (v31)
    {
      v32 = v5->_parsedInfo;
      if (v32)
      {
        v33 = (NSDictionary *)[(NSDictionary *)v32 mutableCopy];
        [(NSDictionary *)v33 setObject:v31 forKeyedSubscript:@"PairingModeBrandCode"];
        uint64_t v34 = [(NSDictionary *)v33 copy];
        v35 = v5->_parsedInfo;
        v5->_parsedInfo = (NSDictionary *)v34;
      }
      else
      {
        v39 = @"PairingModeBrandCode";
        v40[0] = v31;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        v33 = v5->_parsedInfo;
        v5->_parsedInfo = (NSDictionary *)v36;
      }
    }
  }

  return v5;
}

- (id)description
{
  if (self->_keyIdentifier)
  {
    uint64_t v3 = [[NSString alloc] initWithFormat:@"applet=%@ endpoint=%@ ", self->_appletIdentifier, self->_keyIdentifier];
  }
  else
  {
    readerIdentifier = self->_readerIdentifier;
    id v5 = [NSString alloc];
    if (readerIdentifier) {
      uint64_t v3 = [v5 initWithFormat:@"applet=%@ reader=%@ ", self->_appletIdentifier, self->_readerIdentifier];
    }
    else {
      uint64_t v3 = [v5 initWithFormat:@"applet=%@ ", self->_appletIdentifier, v34];
    }
  }
  unsigned int type = self->_type;
  v7 = @"UNKNOWN";
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        v7 = @"Felica";
      }
      else if (type == 61441)
      {
        v7 = @"Parsed by ATL";
      }
    }
    else if (type == 32)
    {
      v7 = @"RefundPurchase";
    }
    else if (type == 34)
    {
      v7 = @"VoidPurchase";
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        v7 = @"Purchase";
        break;
      case 1u:
        v7 = @"Cashback";
        break;
      case 2u:
        v7 = @"VoidRefund";
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        v7 = @"PurchaseWithCashback";
        break;
      default:
        if (type == 23) {
          v7 = @"CashDisbursement";
        }
        break;
    }
  }
  unsigned int v8 = self->_result;
  v9 = @"UNKNOWN";
  objc_super v38 = v7;
  v39 = (void *)v3;
  if (v8 <= 0xFF)
  {
    if (self->_result)
    {
      if (v8 == 64)
      {
        v9 = @"offline/approved";
      }
      else if (v8 == 128)
      {
        v9 = @"online/pending";
      }
    }
    else
    {
      v9 = @"offline/declined";
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        v9 = @"failed/field tear";
        break;
      case 0xF001u:
        v9 = @"offline type f";
        break;
      case 0xF002u:
        v9 = @"online type f";
        break;
      case 0xF003u:
        v9 = @"express transit";
        break;
      case 0xF004u:
        v9 = @"incompatible applet";
        break;
      case 0xF005u:
        v9 = @"key not found";
        break;
      case 0xF006u:
        v9 = @"reader in pairing mode";
        break;
      case 0xF007u:
        v9 = @"no matching key";
        break;
      default:
        if (v8 == 256) {
          v9 = @"failed";
        }
        break;
    }
  }
  uint64_t v10 = objc_opt_new();
  v11 = v10;
  unsigned __int16 informative = self->_informative;
  if (informative)
  {
    [v10 addObject:@"PINRequired"];
    unsigned __int16 informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_43:
      if ((informative & 4) == 0) {
        goto LABEL_44;
      }
      goto LABEL_54;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_43;
  }
  [v11 addObject:@"WarningPresent"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_44:
    if ((informative & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v11 addObject:@"ContactIssuer"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_45:
    if ((informative & 0x100) == 0) {
      goto LABEL_46;
    }
LABEL_56:
    [v11 addObject:@"EMVTransaction"];
    if ((self->_informative & 0x8000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_57;
  }
LABEL_55:
  [v11 addObject:@"PINAttemptsExceeded"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 0x100) != 0) {
    goto LABEL_56;
  }
LABEL_46:
  if ((informative & 0x8000) == 0) {
    goto LABEL_47;
  }
LABEL_57:
  [v11 addObject:@"ActionNeeded"];
LABEL_47:
  v37 = v9;
  if (!+[NFContactlessPaymentEndEvent logsTransactionDetails])
  {
LABEL_51:
    v35 = &stru_1EEF24A78;
    goto LABEL_64;
  }
  int v13 = self->_type;
  if (v13 == 61441)
  {
    parsedInfo = self->_parsedInfo;
    if (!parsedInfo) {
      goto LABEL_51;
    }
LABEL_59:
    v35 = [(NSDictionary *)parsedInfo description];
    goto LABEL_64;
  }
  if (v13 == 256)
  {
    parsedInfo = self->_felicaInfo;
    if (!parsedInfo) {
      goto LABEL_51;
    }
    goto LABEL_59;
  }
  v15 = v11;
  id v16 = [NSString alloc];
  v17 = v16;
  transactionIdentifier = self->_transactionIdentifier;
  if (self->_amount)
  {
    uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"%@", self->_amount];
    v35 = (__CFString *)[v17 initWithFormat:@"transID=%@ amount=%@ tlv=%@ ", transactionIdentifier, v19, self->_tlv];
  }
  else
  {
    v35 = (__CFString *)[v16 initWithFormat:@"transID=%@ amount=%@ tlv=%@ ", transactionIdentifier, @"NOT_PRESENT", self->_tlv];
  }
  v11 = v15;
LABEL_64:
  id v36 = [NSString alloc];
  v40.receiver = self;
  v40.super_class = (Class)NFContactlessPaymentEndEvent;
  v20 = [(NFContactlessPaymentEndEvent *)&v40 description];
  BOOL didError = self->_didError;
  uint64_t status = self->_status;
  uint64_t v23 = self->_type;
  uint64_t v24 = self->_result;
  uint64_t v25 = self->_informative;
  uint64_t command = self->_command;
  uint64_t v27 = [v11 componentsJoinedByString:@","];
  uint64_t v28 = v11;
  v29 = (void *)v27;
  currency = (__CFString *)self->_currency;
  if (!currency) {
    currency = @"NOT_PRESENT";
  }
  v31 = @"YES";
  if (!didError) {
    v31 = @"NO";
  }
  v32 = (void *)[v36 initWithFormat:@"%@ { %@ didError=%@ command=0x%04x status=0x%04x type=0x%04x(%@) result=0x%04x(%@) informative=0x%04x(%@) currency=%@ %@}", v20, v39, v31, command, status, v23, v38, v24, v37, v25, v27, currency, v35];

  return v32;
}

- (id)asDictionary
{
  unsigned int type = self->_type;
  id v4 = @"UNKNOWN";
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        id v4 = @"Felica";
      }
      else if (type == 61441)
      {
        id v4 = @"ATL";
      }
    }
    else if (type == 32)
    {
      id v4 = @"RefundPurchase";
    }
    else if (type == 34)
    {
      id v4 = @"VoidPurchase";
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        id v4 = @"Purchase";
        break;
      case 1u:
        id v4 = @"Cashback";
        break;
      case 2u:
        id v4 = @"VoidRefund";
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        id v4 = @"PurchaseWithCashback";
        break;
      default:
        if (type == 23) {
          id v4 = @"CashDisbursement";
        }
        break;
    }
  }
  unsigned int v5 = self->_result;
  uint64_t v6 = @"UNKNOWN";
  objc_super v38 = v4;
  if (v5 <= 0xFF)
  {
    if (self->_result)
    {
      if (v5 == 64)
      {
        uint64_t v6 = @"offline/approved";
      }
      else if (v5 == 128)
      {
        uint64_t v6 = @"online/pending";
      }
    }
    else
    {
      uint64_t v6 = @"offline/declined";
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        uint64_t v6 = @"failed/field tear";
        break;
      case 0xF001u:
        uint64_t v6 = @"offline type f";
        break;
      case 0xF002u:
        uint64_t v6 = @"online type f";
        break;
      case 0xF003u:
        uint64_t v6 = @"express transit";
        break;
      case 0xF004u:
        uint64_t v6 = @"incompatible applet";
        break;
      case 0xF005u:
        uint64_t v6 = @"key not found";
        break;
      case 0xF006u:
        uint64_t v6 = @"reader in pairing mode";
        break;
      case 0xF007u:
        uint64_t v6 = @"no matching key";
        break;
      default:
        if (v5 == 256) {
          uint64_t v6 = @"failed";
        }
        break;
    }
  }
  v37 = v6;
  v7 = objc_opt_new();
  unsigned int v8 = v7;
  unsigned __int16 informative = self->_informative;
  if (informative)
  {
    [v7 addObject:@"PINRequired"];
    unsigned __int16 informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_38:
      if ((informative & 4) == 0) {
        goto LABEL_39;
      }
      goto LABEL_47;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_38;
  }
  [v8 addObject:@"WarningPresent"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_39:
    if ((informative & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v8 addObject:@"ContactIssuer"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_40:
    if ((informative & 0x100) == 0) {
      goto LABEL_41;
    }
LABEL_49:
    [v8 addObject:@"EMVTransaction"];
    if ((self->_informative & 0x8000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_50;
  }
LABEL_48:
  [v8 addObject:@"PINAttemptsExceeded"];
  unsigned __int16 informative = self->_informative;
  if ((informative & 0x100) != 0) {
    goto LABEL_49;
  }
LABEL_41:
  if ((informative & 0x8000) == 0) {
    goto LABEL_42;
  }
LABEL_50:
  [v8 addObject:@"ActionNeeded"];
LABEL_42:
  if (+[NFContactlessPaymentEndEvent logsTransactionDetails])
  {
    id v10 = [NSString alloc];
    v11 = v10;
    transactionIdentifier = self->_transactionIdentifier;
    if (self->_amount)
    {
      int v13 = (void *)[[NSString alloc] initWithFormat:@"%@", self->_amount];
      v30 = (__CFString *)[v11 initWithFormat:@", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, ", transactionIdentifier, v13, self->_tlv];
    }
    else
    {
      v30 = (__CFString *)[v10 initWithFormat:@", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, ", transactionIdentifier, @"NOT_PRESENT", self->_tlv];
    }
  }
  else
  {
    v30 = &stru_1EEF24A78;
  }
  if (!self->_felicaInfo)
  {
    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    felicaInfo = self->_felicaInfo;
    self->_felicaInfo = v14;
  }
  if (!self->_parsedInfo)
  {
    id v16 = (NSDictionary *)objc_opt_new();
    parsedInfo = self->_parsedInfo;
    self->_parsedInfo = v16;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  appletIdentifier = self->_appletIdentifier;
  id v36 = v18;
  readerIdentifier = self->_readerIdentifier;
  keyIdentifier = self->_keyIdentifier;
  v31 = [NSNumber numberWithUnsignedInt:self->_command];
  uint64_t v19 = [NSNumber numberWithUnsignedShort:self->_status];
  v20 = [NSNumber numberWithUnsignedShort:self->_type];
  uint64_t v21 = [NSNumber numberWithUnsignedShort:self->_result];
  v22 = [NSNumber numberWithUnsignedShort:self->_informative];
  uint64_t v23 = [v8 componentsJoinedByString:@","];
  currency = self->_currency;
  v32 = v8;
  uint64_t v25 = self->_felicaInfo;
  uint64_t v26 = self->_parsedInfo;
  uint64_t v27 = [NSNumber numberWithBool:self->_background];
  uint64_t v28 = objc_msgSend(v36, "initWithObjectsAndKeys:", appletIdentifier, @"applet", keyIdentifier, @"endpoint", readerIdentifier, @"reader", v31, @"command", v19, @"status", v20, @"type", v38, @"typeStr", v21, @"result", v37,
                  @"resultStr",
                  v22,
                  @"informative",
                  v23,
                  @"informativeStr",
                  currency,
                  @"currency",
                  v30,
                  @"details",
                  v25,
                  @"felicaInfo",
                  v26,
                  @"parsedInfo",
                  v27,
                  @"background",
                  0);

  return v28;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
}

- (NFContactlessPaymentEndEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NFContactlessPaymentEndEvent;
  unsigned int v5 = [(NFContactlessPaymentEndEvent *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPointIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v12;

    v5->_BOOL didError = [v4 decodeBoolForKey:@"didError"];
    v5->_uint64_t command = [v4 decodeInt32ForKey:@"command"];
    v5->_uint64_t status = [v4 decodeInt32ForKey:@"status"];
    v5->_unsigned int type = [v4 decodeInt32ForKey:@"type"];
    v5->_result = [v4 decodeInt32ForKey:@"result"];
    v5->_unsigned __int16 informative = [v4 decodeInt32ForKey:@"informative"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlv"];
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v18;

    v5->_background = [v4 decodeBoolForKey:@"BackgroundTransaction"];
    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"felicaInfo"];
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v28;

    uint64_t v30 = [v4 decodeObjectOfClasses:v27 forKey:@"parsedInfo"];
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v30;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appletIdentifier = self->_appletIdentifier;
  id v5 = a3;
  [v5 encodeObject:appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"endPointIdentifier"];
  [v5 encodeObject:self->_readerIdentifier forKey:@"readerIdentifier"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeBool:self->_didError forKey:@"didError"];
  [v5 encodeInt32:self->_command forKey:@"command"];
  [v5 encodeInt32:self->_status forKey:@"status"];
  [v5 encodeInt32:self->_type forKey:@"type"];
  [v5 encodeInt32:self->_result forKey:@"result"];
  [v5 encodeInt32:self->_informative forKey:@"informative"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeObject:self->_tlv forKey:@"tlv"];
  [v5 encodeObject:self->_felicaInfo forKey:@"felicaInfo"];
  [v5 encodeObject:self->_parsedInfo forKey:@"parsedInfo"];
  [v5 encodeBool:self->_background forKey:@"BackgroundTransaction"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)command
{
  return self->_command;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)informative
{
  return self->_informative;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSData)tlv
{
  return self->_tlv;
}

- (NSDictionary)felicaInfo
{
  return self->_felicaInfo;
}

- (NSDictionary)parsedInfo
{
  return self->_parsedInfo;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedInfo, 0);
  objc_storeStrong((id *)&self->_felicaInfo, 0);
  objc_storeStrong((id *)&self->_tlv, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end