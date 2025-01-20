@interface PKVirtualCardCredentials
+ (BOOL)supportsSecureCoding;
+ (id)demoVPANCredentials;
+ (id)formattedDateStringFromServerDateString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)cardSecurityCode;
- (NSString)expiration;
- (NSString)formattedExpiration;
- (NSString)primaryAccountNumber;
- (PKVirtualCardCredentials)initWithCoder:(id)a3;
- (PKVirtualCardCredentials)initWithDictionary:(id)a3;
- (PKVirtualCardCredentials)initWithEncryptedCardData:(id)a3 ephemeralPublicKey:(id)a4 privateKey:(__SecKey *)a5 error:(id *)a6;
- (PKVirtualCardCredentials)initWithVPANPaymentCredentialResponse:(id)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cardType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCardSecurityCode:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setExpiration:(id)a3;
- (void)setFormattedExpiration:(id)a3;
- (void)setPrimaryAccountNumber:(id)a3;
@end

@implementation PKVirtualCardCredentials

+ (id)demoVPANCredentials
{
  if (os_variant_has_internal_ui())
  {
    v2 = objc_alloc_init(PKVirtualCardCredentials);
    [(PKVirtualCardCredentials *)v2 setPrimaryAccountNumber:@"4761120010000492"];
    [(PKVirtualCardCredentials *)v2 setCardSecurityCode:@"123"];
    [(PKVirtualCardCredentials *)v2 setExpiration:@"11/2022"];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (PKVirtualCardCredentials)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKVirtualCardCredentials;
  v5 = [(PKVirtualCardCredentials *)&v13 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"primaryAccountNumber"];
    uint64_t v7 = objc_msgSend(v6, "pk_zString");
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"cardSecurityCode"];
    uint64_t v10 = objc_msgSend(v9, "pk_zString");
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v10;

    v5->_cardType = [v4 PKIntegerForKey:@"cardType"];
  }

  return v5;
}

- (PKVirtualCardCredentials)initWithEncryptedCardData:(id)a3 ephemeralPublicKey:(id)a4 privateKey:(__SecKey *)a5 error:(id *)a6
{
  v8 = PKECDHDecryptDataWithEphemeralPublicKey(a4, a3, a5, (CFErrorRef *)a6);
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a6];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      self = [(PKVirtualCardCredentials *)self initWithDictionary:v9];
      uint64_t v10 = self;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)formattedDateStringFromServerDateString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentsSeparatedByString:@"/"];
  if ([v4 count] != 2)
  {
    id v8 = v3;
    goto LABEL_10;
  }
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v4 objectAtIndexedSubscript:1];
  if ([v6 length] == 2)
  {
    id v7 = v6;
  }
  else
  {
    if ([v6 length] != 4)
    {
      id v8 = v3;
      goto LABEL_9;
    }
    id v7 = [v6 substringFromIndex:2];
  }
  v9 = v7;
  id v8 = [NSString stringWithFormat:@"%@/%@", v5, v7];

LABEL_9:
LABEL_10:

  return v8;
}

- (PKVirtualCardCredentials)initWithVPANPaymentCredentialResponse:(id)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 credentials];
  uint64_t v10 = [v9 encryptedCardData];
  v11 = [v8 credentials];
  v12 = [v11 ephemeralPublicKey];
  objc_super v13 = [(PKVirtualCardCredentials *)self initWithEncryptedCardData:v10 ephemeralPublicKey:v12 privateKey:a4 error:a5];

  if (v13)
  {
    v14 = [v8 expiration];
    v15 = [(id)objc_opt_class() formattedDateStringFromServerDateString:v14];
    uint64_t v16 = [v14 copy];
    expiration = v13->_expiration;
    v13->_expiration = (NSString *)v16;

    uint64_t v18 = [v15 copy];
    formattedExpiration = v13->_formattedExpiration;
    v13->_formattedExpiration = (NSString *)v18;
  }
  return v13;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_primaryAccountNumber];
  [v3 safelyAddObject:self->_cardSecurityCode];
  [v3 safelyAddObject:self->_expiration];
  [v3 safelyAddObject:self->_formattedExpiration];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_cardType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  unint64_t v5 = (void *)v4[1];
  v6 = self->_primaryAccountNumber;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    id v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_25;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_26;
    }
  }
  uint64_t v10 = (void *)v4[2];
  v6 = self->_cardSecurityCode;
  v11 = v10;
  if (v6 == v11)
  {
  }
  else
  {
    id v8 = v11;
    if (!v6 || !v11) {
      goto LABEL_25;
    }
    BOOL v12 = [(NSString *)v6 isEqualToString:v11];

    if (!v12) {
      goto LABEL_26;
    }
  }
  objc_super v13 = (void *)v4[4];
  v6 = self->_expiration;
  v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_20;
  }
  id v8 = v14;
  if (!v6 || !v14)
  {
LABEL_25:

    goto LABEL_26;
  }
  BOOL v15 = [(NSString *)v6 isEqualToString:v14];

  if (!v15) {
    goto LABEL_26;
  }
LABEL_20:
  uint64_t v16 = (void *)v4[5];
  v6 = self->_formattedExpiration;
  v17 = v16;
  if (v6 == v17)
  {

LABEL_29:
    BOOL v19 = self->_cardType == v4[3];
    goto LABEL_27;
  }
  id v8 = v17;
  if (!v6 || !v17) {
    goto LABEL_25;
  }
  BOOL v18 = [(NSString *)v6 isEqualToString:v17];

  if (v18) {
    goto LABEL_29;
  }
LABEL_26:
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKVirtualCardCredentials allocWithZone:](PKVirtualCardCredentials, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_primaryAccountNumber copyWithZone:a3];
  primaryAccountNumber = v5->_primaryAccountNumber;
  v5->_primaryAccountNumber = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_cardSecurityCode copyWithZone:a3];
  cardSecurityCode = v5->_cardSecurityCode;
  v5->_cardSecurityCode = (NSString *)v8;

  v5->_cardType = self->_cardType;
  uint64_t v10 = [(NSString *)self->_expiration copyWithZone:a3];
  expiration = v5->_expiration;
  v5->_expiration = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_formattedExpiration copyWithZone:a3];
  formattedExpiration = v5->_formattedExpiration;
  v5->_formattedExpiration = (NSString *)v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKVirtualCardCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKVirtualCardCredentials;
  unint64_t v5 = [(PKVirtualCardCredentials *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountNumber"];
    uint64_t v7 = objc_msgSend(v6, "pk_zString");
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v7;

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardSecurityCode"];
    uint64_t v10 = objc_msgSend(v9, "pk_zString");
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v10;

    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedExpiration"];
    formattedExpiration = v5->_formattedExpiration;
    v5->_formattedExpiration = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  primaryAccountNumber = self->_primaryAccountNumber;
  id v5 = a3;
  [v5 encodeObject:primaryAccountNumber forKey:@"primaryAccountNumber"];
  [v5 encodeObject:self->_cardSecurityCode forKey:@"cardSecurityCode"];
  [v5 encodeInteger:self->_cardType forKey:@"cardType"];
  [v5 encodeObject:self->_expiration forKey:@"expiration"];
  [v5 encodeObject:self->_formattedExpiration forKey:@"formattedExpiration"];
}

- (NSString)primaryAccountNumber
{
  return self->_primaryAccountNumber;
}

- (void)setPrimaryAccountNumber:(id)a3
{
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (void)setCardSecurityCode:(id)a3
{
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)formattedExpiration
{
  return self->_formattedExpiration;
}

- (void)setFormattedExpiration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedExpiration, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
}

@end