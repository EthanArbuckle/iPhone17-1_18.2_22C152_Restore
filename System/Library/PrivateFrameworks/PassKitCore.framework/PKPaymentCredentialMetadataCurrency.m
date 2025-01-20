@interface PKPaymentCredentialMetadataCurrency
- (BOOL)_isEqualToMetadata:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)currencyCode;
- (PKPaymentCredentialMetadataCurrency)initWithConfiguration:(id)a3;
- (id)displayString;
- (unint64_t)hash;
@end

@implementation PKPaymentCredentialMetadataCurrency

- (PKPaymentCredentialMetadataCurrency)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentCredentialMetadataCurrency;
  v5 = [(PKPaymentCredentialMetadata *)&v11 initWithConfiguration:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    if (!v5->_currencyCode)
    {

      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No currency code in configuration could not create metadata", v10, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (id)displayString
{
  v3 = NSNumber;
  id v4 = [(PKPaymentCredentialMetadata *)self value];
  [v4 doubleValue];
  v5 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v6 = [(PKPaymentCredentialMetadataCurrency *)self currencyCode];
  v7 = PKFormattedCurrencyStringFromNumber(v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentCredentialMetadataCurrency *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentCredentialMetadataCurrency *)self _isEqualToMetadata:v4];
  }

  return v5;
}

- (BOOL)_isEqualToMetadata:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentCredentialMetadataCurrency;
  if ([(PKPaymentCredentialMetadata *)&v12 _isEqualToMetadata:v4])
  {
    BOOL v5 = (void *)v4[3];
    uint64_t v6 = self->_currencyCode;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = 0;
      }
      else {
        char v10 = [(NSString *)v6 isEqualToString:v7];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_currencyCode];
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCredentialMetadataCurrency;
  id v4 = [(PKPaymentCredentialMetadata *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
}

@end