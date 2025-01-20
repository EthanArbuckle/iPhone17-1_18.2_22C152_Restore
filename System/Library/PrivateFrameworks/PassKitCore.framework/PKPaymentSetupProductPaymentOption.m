@interface PKPaymentSetupProductPaymentOption
+ (BOOL)supportsSecureCoding;
- (PKPaymentSetupProductPaymentOption)initWithCoder:(id)a3;
- (PKPaymentSetupProductPaymentOption)initWithPaymentOptionDictionary:(id)a3;
- (int64_t)cardType;
- (int64_t)supportedProtocols;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentSetupProductPaymentOption

- (PKPaymentSetupProductPaymentOption)initWithPaymentOptionDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentSetupProductPaymentOption;
  v5 = [(PKPaymentSetupProductPaymentOption *)&v19 init];
  if (v5)
  {
    v5->_priority = [v4 PKIntegerForKey:@"priority"];
    v5->_cardType = [v4 PKIntegerForKey:@"cardTypeCode"];
    v14 = [v4 PKStringForKey:@"protocols"];
    v6 = [v14 componentsSeparatedByString:@","];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 caseInsensitiveCompare:@"a"])
        {
          if ([v11 caseInsensitiveCompare:@"b"])
          {
            if ([v11 caseInsensitiveCompare:@"f"]) {
              continue;
            }
            uint64_t v12 = 4;
          }
          else
          {
            uint64_t v12 = 2;
          }
        }
        else
        {
          uint64_t v12 = 1;
        }
        v5->_supportedProtocols |= v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (!v8)
      {
LABEL_16:

        break;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductPaymentOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProductPaymentOption;
  v5 = [(PKPaymentSetupProductPaymentOption *)&v7 init];
  if (v5)
  {
    v5->_priority = [v4 decodeIntegerForKey:@"priority"];
    v5->_cardType = [v4 decodeIntegerForKey:@"cardTypeCode"];
    v5->_supportedProtocols = [v4 decodeIntegerForKey:@"protocols"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t priority = self->_priority;
  id v5 = a3;
  [v5 encodeInteger:priority forKey:@"priority"];
  [v5 encodeInteger:self->_cardType forKey:@"cardTypeCode"];
  [v5 encodeInteger:self->_supportedProtocols forKey:@"protocols"];
}

- (unint64_t)priority
{
  return self->_priority;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)supportedProtocols
{
  return self->_supportedProtocols;
}

@end