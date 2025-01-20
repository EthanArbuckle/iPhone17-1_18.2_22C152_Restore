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
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"LogTransactionDetails"];

  return v3;
}

- (NFContactlessPaymentEndEvent)initWithDictionary:(id)a3
{
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
    v5->_status = (unsigned __int16)[v16 unsignedIntValue];

    v17 = [v4 objectForKeyedSubscript:@"result"];
    v5->_result = (unsigned __int16)[v17 unsignedIntValue];

    v18 = [v4 objectForKeyedSubscript:@"informative"];
    v5->_informative = (unsigned __int16)[v18 unsignedIntValue];

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
    v5->_type = (unsigned __int16)[v25 unsignedIntValue];

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
        v34 = (NSDictionary *)[(NSDictionary *)v33 copy];
        v35 = v5->_parsedInfo;
        v5->_parsedInfo = v34;
      }
      else
      {
        CFStringRef v39 = @"PairingModeBrandCode";
        v40 = v31;
        uint64_t v36 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
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
    id v3 = [objc_alloc((Class)NSString) initWithFormat:@"applet=%@ endpoint=%@ ", self->_appletIdentifier, self->_keyIdentifier];
  }
  else
  {
    readerIdentifier = self->_readerIdentifier;
    id v5 = objc_alloc((Class)NSString);
    if (readerIdentifier) {
      id v3 = [v5 initWithFormat:@"applet=%@ reader=%@ ", self->_appletIdentifier, self->_readerIdentifier];
    }
    else {
      id v3 = [v5 initWithFormat:@"applet=%@ ", self->_appletIdentifier, v34];
    }
  }
  unsigned int type = self->_type;
  CFStringRef v7 = @"UNKNOWN";
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        CFStringRef v7 = @"Felica";
      }
      else if (type == 61441)
      {
        CFStringRef v7 = @"Parsed by ATL";
      }
    }
    else if (type == 32)
    {
      CFStringRef v7 = @"RefundPurchase";
    }
    else if (type == 34)
    {
      CFStringRef v7 = @"VoidPurchase";
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        CFStringRef v7 = @"Purchase";
        break;
      case 1u:
        CFStringRef v7 = @"Cashback";
        break;
      case 2u:
        CFStringRef v7 = @"VoidRefund";
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        CFStringRef v7 = @"PurchaseWithCashback";
        break;
      default:
        if (type == 23) {
          CFStringRef v7 = @"CashDisbursement";
        }
        break;
    }
  }
  unsigned int v8 = self->_result;
  CFStringRef v9 = @"UNKNOWN";
  CFStringRef v38 = v7;
  CFStringRef v39 = v3;
  if (v8 <= 0xFF)
  {
    if (self->_result)
    {
      if (v8 == 64)
      {
        CFStringRef v9 = @"offline/approved";
      }
      else if (v8 == 128)
      {
        CFStringRef v9 = @"online/pending";
      }
    }
    else
    {
      CFStringRef v9 = @"offline/declined";
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        CFStringRef v9 = @"failed/field tear";
        break;
      case 0xF001u:
        CFStringRef v9 = @"offline type f";
        break;
      case 0xF002u:
        CFStringRef v9 = @"online type f";
        break;
      case 0xF003u:
        CFStringRef v9 = @"express transit";
        break;
      case 0xF004u:
        CFStringRef v9 = @"incompatible applet";
        break;
      case 0xF005u:
        CFStringRef v9 = @"key not found";
        break;
      case 0xF006u:
        CFStringRef v9 = @"reader in pairing mode";
        break;
      case 0xF007u:
        CFStringRef v9 = @"no matching key";
        break;
      default:
        if (v8 == 256) {
          CFStringRef v9 = @"failed";
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
  CFStringRef v37 = v9;
  if (!+[NFContactlessPaymentEndEvent logsTransactionDetails])
  {
LABEL_51:
    v35 = &stru_100309C40;
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
  id v16 = objc_alloc((Class)NSString);
  v17 = v16;
  transactionIdentifier = self->_transactionIdentifier;
  if (self->_amount)
  {
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%@", self->_amount];
    v35 = (__CFString *)[v17 initWithFormat:@"transID=%@ amount=%@ tlv=%@ ", transactionIdentifier, v19, self->_tlv];
  }
  else
  {
    v35 = (__CFString *)[v16 initWithFormat:@"transID=%@ amount=%@ tlv=%@ ", transactionIdentifier, @"NOT_PRESENT", self->_tlv];
  }
  v11 = v15;
LABEL_64:
  id v36 = objc_alloc((Class)NSString);
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
  CFStringRef currency = (const __CFString *)self->_currency;
  if (!currency) {
    CFStringRef currency = @"NOT_PRESENT";
  }
  CFStringRef v31 = @"YES";
  if (!didError) {
    CFStringRef v31 = @"NO";
  }
  id v32 = [v36 initWithFormat:@"%@ { %@ didError=%@ command=0x%04x status=0x%04x type=0x%04x(%@) result=0x%04x(%@) informative=0x%04x(%@) currency=%@ %@}", v20, v39, v31, command, status, v23, v38, v24, v37, v25, v27, currency, v35];

  return v32;
}

- (id)asDictionary
{
  unsigned int type = self->_type;
  CFStringRef v4 = @"UNKNOWN";
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        CFStringRef v4 = @"Felica";
      }
      else if (type == 61441)
      {
        CFStringRef v4 = @"ATL";
      }
    }
    else if (type == 32)
    {
      CFStringRef v4 = @"RefundPurchase";
    }
    else if (type == 34)
    {
      CFStringRef v4 = @"VoidPurchase";
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        CFStringRef v4 = @"Purchase";
        break;
      case 1u:
        CFStringRef v4 = @"Cashback";
        break;
      case 2u:
        CFStringRef v4 = @"VoidRefund";
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        CFStringRef v4 = @"PurchaseWithCashback";
        break;
      default:
        if (type == 23) {
          CFStringRef v4 = @"CashDisbursement";
        }
        break;
    }
  }
  unsigned int v5 = self->_result;
  CFStringRef v6 = @"UNKNOWN";
  CFStringRef v38 = v4;
  if (v5 <= 0xFF)
  {
    if (self->_result)
    {
      if (v5 == 64)
      {
        CFStringRef v6 = @"offline/approved";
      }
      else if (v5 == 128)
      {
        CFStringRef v6 = @"online/pending";
      }
    }
    else
    {
      CFStringRef v6 = @"offline/declined";
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        CFStringRef v6 = @"failed/field tear";
        break;
      case 0xF001u:
        CFStringRef v6 = @"offline type f";
        break;
      case 0xF002u:
        CFStringRef v6 = @"online type f";
        break;
      case 0xF003u:
        CFStringRef v6 = @"express transit";
        break;
      case 0xF004u:
        CFStringRef v6 = @"incompatible applet";
        break;
      case 0xF005u:
        CFStringRef v6 = @"key not found";
        break;
      case 0xF006u:
        CFStringRef v6 = @"reader in pairing mode";
        break;
      case 0xF007u:
        CFStringRef v6 = @"no matching key";
        break;
      default:
        if (v5 == 256) {
          CFStringRef v6 = @"failed";
        }
        break;
    }
  }
  CFStringRef v37 = v6;
  CFStringRef v7 = objc_opt_new();
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
    id v10 = objc_alloc((Class)NSString);
    v11 = v10;
    transactionIdentifier = self->_transactionIdentifier;
    if (self->_amount)
    {
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@", self->_amount];
      v30 = (__CFString *)[v11 initWithFormat:@", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, ", transactionIdentifier, v13, self->_tlv];
    }
    else
    {
      v30 = (__CFString *)[v10 initWithFormat:@", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, ", transactionIdentifier, @"NOT_PRESENT", self->_tlv];
    }
  }
  else
  {
    v30 = &stru_100309C40;
  }
  if (!self->_felicaInfo)
  {
    v14 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    felicaInfo = self->_felicaInfo;
    self->_felicaInfo = v14;
  }
  if (!self->_parsedInfo)
  {
    id v16 = (NSDictionary *)objc_opt_new();
    parsedInfo = self->_parsedInfo;
    self->_parsedInfo = v16;
  }
  id v18 = objc_alloc((Class)NSDictionary);
  appletIdentifier = self->_appletIdentifier;
  id v36 = v18;
  readerIdentifier = self->_readerIdentifier;
  keyIdentifier = self->_keyIdentifier;
  CFStringRef v31 = +[NSNumber numberWithUnsignedInt:self->_command];
  id v19 = +[NSNumber numberWithUnsignedShort:self->_status];
  v20 = +[NSNumber numberWithUnsignedShort:self->_type];
  uint64_t v21 = +[NSNumber numberWithUnsignedShort:self->_result];
  v22 = +[NSNumber numberWithUnsignedShort:self->_informative];
  uint64_t v23 = [v8 componentsJoinedByString:@","];
  CFStringRef currency = self->_currency;
  id v32 = v8;
  uint64_t v25 = self->_felicaInfo;
  uint64_t v26 = self->_parsedInfo;
  uint64_t v27 = +[NSNumber numberWithBool:self->_background];
  id v28 = objc_msgSend(v36, "initWithObjectsAndKeys:", appletIdentifier, @"applet", keyIdentifier, @"endpoint", readerIdentifier, @"reader", v31, @"command", v19, @"status", v20, @"type", v38, @"typeStr", v21, @"result", v37,
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
    v5->_uint64_t status = (unsigned __int16)[v4 decodeInt32ForKey:@"status"];
    v5->_unsigned int type = (unsigned __int16)[v4 decodeInt32ForKey:@"type"];
    v5->_result = (unsigned __int16)[v4 decodeInt32ForKey:@"result"];
    v5->_unsigned __int16 informative = (unsigned __int16)[v4 decodeInt32ForKey:@"informative"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    CFStringRef currency = v5->_currency;
    v5->_CFStringRef currency = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlv"];
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v18;

    v5->_background = [v4 decodeBoolForKey:@"BackgroundTransaction"];
    id v20 = objc_alloc((Class)NSSet);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    id v27 = [v20 initWithObjects:v21, v22, v23, v24, v25, v26, objc_opt_class(), 0];
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