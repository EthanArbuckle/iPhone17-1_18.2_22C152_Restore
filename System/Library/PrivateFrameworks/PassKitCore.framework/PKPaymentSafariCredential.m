@interface PKPaymentSafariCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)canCheckEligibility;
- (NSDate)expirationDate;
- (NSString)cardNumber;
- (NSString)cardholderName;
- (NSString)securityCode;
- (PKPaymentSafariCredential)initWithCoder:(id)a3;
- (PKPaymentSafariCredential)initWithSafariDictionary:(id)a3;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)longDescription;
- (id)sanitizedPrimaryAccountNumber;
- (int64_t)credentialType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation PKPaymentSafariCredential

- (PKPaymentSafariCredential)initWithSafariDictionary:(id)a3
{
  id v4 = a3;
  v5 = _MergedGlobals_30[0]();
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = objc_msgSend(v6, "pk_stringIfNotEmpty");
  v8 = objc_msgSend(v7, "pk_zString");

  if (v8)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKPaymentSafariCredential;
    v9 = [(PKPaymentCredential *)&v31 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_cardNumber, v8);
      v11 = off_1EC240010[0]();
      v12 = [v4 objectForKeyedSubscript:v11];
      v13 = objc_msgSend(v12, "pk_stringIfNotEmpty");
      uint64_t v14 = objc_msgSend(v13, "pk_zString");
      securityCode = v10->_securityCode;
      v10->_securityCode = (NSString *)v14;

      v16 = off_1EC240018[0]();
      v17 = [v4 objectForKeyedSubscript:v16];
      v18 = objc_msgSend(v17, "pk_stringIfNotEmpty");
      uint64_t v19 = objc_msgSend(v18, "pk_zString");
      cardholderName = v10->_cardholderName;
      v10->_cardholderName = (NSString *)v19;

      v21 = off_1EC240020[0]();
      v22 = [v4 objectForKeyedSubscript:v21];
      v23 = objc_msgSend(v22, "pk_stringIfNotEmpty");
      v24 = objc_msgSend(v23, "pk_zString");
      [(PKPaymentCredential *)v10 setLongDescription:v24];

      [(PKPaymentCredential *)v10 setCardType:1];
      v25 = off_1EC240028[0]();
      v26 = [v4 objectForKeyedSubscript:v25];

      if (v26)
      {
        if (qword_1E92D9A00 != -1) {
          dispatch_once(&qword_1E92D9A00, &__block_literal_global_793);
        }
        objc_storeStrong((id *)&v10->_expirationDate, v26);
        v27 = [(id)_MergedGlobals_31 stringFromDate:v26];
        v28 = objc_msgSend(v27, "pk_zString");
        [(PKPaymentCredential *)v10 setExpiration:v28];
      }
    }
    self = v10;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t __54__PKPaymentSafariCredential_initWithSafariDictionary___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_31;
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  id v4 = (void *)_MergedGlobals_31;
  v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  v6 = (void *)_MergedGlobals_31;
  return [v6 setDateFormat:@"MM/yy"];
}

- (id)sanitizedPrimaryAccountNumber
{
  v3 = [(PKPaymentCredential *)self state];
  id v4 = [v3 eligibilityResponse];
  v5 = [v4 sanitizedPrimaryAccountNumber];

  if (!v5)
  {
    v5 = PKFPANSuffixFromFPAN(self->_cardNumber);
  }
  return v5;
}

- (int64_t)credentialType
{
  v3 = [(PKPaymentCredential *)self state];
  id v4 = [v3 eligibilityResponse];
  id v5 = (id)[v4 cardType];
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentSafariCredential;
    id v5 = [(PKPaymentCredential *)&v7 credentialType];
  }

  return (int64_t)v5;
}

- (id)longDescription
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSafariCredential;
  v3 = [(PKPaymentCredential *)&v8 longDescription];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    PKDisplayablePaymentNetworkNameForPaymentCredentialType([(PKPaymentSafariCredential *)self credentialType]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  v3 = [(PKPaymentSafariCredential *)self sanitizedPrimaryAccountNumber];
  id v4 = PKMaskedPaymentPAN((uint64_t)v3);
  id v5 = PKLocalizedVirtualCardString(&cfstr_ProvisioningDe_0.isa, &stru_1EE0F6808.isa, v4);

  return v5;
}

- (BOOL)canCheckEligibility
{
  if (![(NSString *)self->_cardNumber length]) {
    return 0;
  }
  v3 = [(PKPaymentCredential *)self expiration];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  id v5 = [(PKPaymentSafariCredential *)self expirationDate];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v7 = [v6 compare:v5] == -1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PKPaymentSafariCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSafariCredential;
  id v5 = [(PKPaymentCredential *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardNumber"];
    cardNumber = v5->_cardNumber;
    v5->_cardNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityCode"];
    securityCode = v5->_securityCode;
    v5->_securityCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderName"];
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSafariCredential;
  id v4 = a3;
  [(PKPaymentCredential *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardNumber, @"cardNumber", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_securityCode forKey:@"securityCode"];
  [v4 encodeObject:self->_cardholderName forKey:@"cardholderName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cardNumber = self->_cardNumber;
    uint64_t v6 = [v4 cardNumber];
    BOOL v7 = cardNumber;
    uint64_t v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v11 = 1;
    }
    else
    {
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        char v11 = 0;
      }
      else {
        char v11 = [(NSString *)v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_cardNumber hash];
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (NSString)securityCode
{
  return self->_securityCode;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_securityCode, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
}

@end