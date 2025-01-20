@interface PKAddPaymentPassRequestConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isPaymentAccount;
- (BOOL)requiresFelicaSecureElement;
- (NSArray)cardDetails;
- (NSSet)productIdentifiers;
- (NSString)cardholderName;
- (NSString)localizedDescription;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryAccountSuffix;
- (PKAddPaymentPassRequestConfiguration)init;
- (PKAddPaymentPassRequestConfiguration)initWithCoder:(id)a3;
- (PKAddPaymentPassRequestConfiguration)initWithEncryptionScheme:(PKEncryptionScheme)encryptionScheme;
- (PKAddPaymentPassStyle)style;
- (PKEncryptionScheme)encryptionScheme;
- (PKPaymentNetwork)paymentNetwork;
- (id)_effectiveDetails;
- (id)_filterWebServices:(id)a3 primaryAccountIdentifierRequired:(BOOL)a4;
- (id)description;
- (unint64_t)allowManagedAppleID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCardDetails:(NSArray *)cardDetails;
- (void)setCardholderName:(NSString *)cardholderName;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setPaymentNetwork:(PKPaymentNetwork)paymentNetwork;
- (void)setPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier;
- (void)setPrimaryAccountSuffix:(NSString *)primaryAccountSuffix;
- (void)setProductIdentifiers:(NSSet *)productIdentifiers;
- (void)setRequiresFelicaSecureElement:(BOOL)requiresFelicaSecureElement;
- (void)setStyle:(PKAddPaymentPassStyle)style;
- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3;
@end

@implementation PKAddPaymentPassRequestConfiguration

- (id)_filterWebServices:(id)a3 primaryAccountIdentifierRequired:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[v6 count];
  if (!v7) {
    goto LABEL_50;
  }
  v8 = [(PKAddPaymentPassRequestConfiguration *)self primaryAccountIdentifier];
  v9 = [(PKAddPaymentPassRequestConfiguration *)self paymentNetwork];
  BOOL v10 = [(PKAddPaymentPassRequestConfiguration *)self requiresFelicaSecureElement];
  int v11 = [v9 isEqualToString:@"HID"];
  if (([v9 isEqualToString:@"BMAC"] & 1) == 0)
  {
    int v12 = [v9 isEqualToString:@"SPTCC"];
    if (v8) {
      goto LABEL_4;
    }
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_7;
  }
  int v12 = 1;
  if (!v8) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v13 = [v8 length] != 0;
LABEL_7:
  if ((((v13 || v10) | v12 | v11) & 1) == 0)
  {
    id v6 = v6;
    goto LABEL_49;
  }
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  v15 = (void *)v14;
  int v41 = v12;
  v39 = v9;
  BOOL v37 = v4;
  if ((v10 | v11 | v12) != 1) {
    goto LABEL_34;
  }
  BOOL v35 = v13;
  v38 = (void *)v14;
  v36 = v8;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v6;
  uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v16) {
    goto LABEL_29;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v47 != v18) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v21 = (void *)MEMORY[0x192FDC630]();
      v22 = [v20 targetDevice];
      if (v10)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_27;
        }
        int v23 = [v22 felicaSecureElementIsAvailable];
      }
      else
      {
        int v23 = 1;
      }
      if ((v23 & v11) == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_27;
        }
        int v23 = [v22 supportsExpressForAutomaticSelectionTechnologyType:2];
      }
      if ((v23 & v41) != 1)
      {
        if (!v23) {
          goto LABEL_27;
        }
LABEL_26:
        [v38 addObject:v20];
        goto LABEL_27;
      }
      uint64_t v24 = PKPaymentCredentialTypeForPaymentNetworkName(v39);
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v22 supportsCredentialType:v24]) {
        goto LABEL_26;
      }
LABEL_27:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  }
  while (v17);
LABEL_29:

  v15 = v38;
  if ([v38 count]) {
    id v6 = (id)[v38 copy];
  }
  else {
    id v6 = 0;
  }
  BOOL v13 = v35;

  [v38 removeAllObjects];
  v8 = v36;
  v9 = v39;
LABEL_34:
  if (v13)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = v6;
    uint64_t v25 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v6);
          }
          v29 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v30 = (void *)MEMORY[0x192FDC630]();
          v31 = [v29 targetDevice];
          int v32 = [v31 paymentWebService:v29 canProvisionPaymentPassWithPrimaryAccountIdentifier:v8];

          if (v32) {
            [v15 addObject:v29];
          }
        }
        uint64_t v26 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v26);
    }

    if ([v15 count])
    {
      uint64_t v33 = [v15 copy];

      [v15 removeAllObjects];
      id v6 = (id)v33;
      v9 = v39;
    }
    else
    {
      v9 = v39;
      if (v37)
      {

        id v6 = 0;
      }
    }
  }
  id v6 = v6;

LABEL_49:
  v7 = v6;
LABEL_50:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAddPaymentPassRequestConfiguration)init
{
  return [(PKAddPaymentPassRequestConfiguration *)self initWithEncryptionScheme:@"EV_ECC_v2"];
}

- (PKAddPaymentPassRequestConfiguration)initWithEncryptionScheme:(PKEncryptionScheme)encryptionScheme
{
  BOOL v4 = encryptionScheme;
  if ([(NSString *)v4 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAddPaymentPassRequestConfiguration;
    v5 = [(PKAddPaymentPassRequestConfiguration *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [(NSString *)v4 copy];
      v7 = v5->_encryptionScheme;
      v5->_encryptionScheme = (NSString *)v6;

      v5->_style = 0;
      cardDetails = v5->_cardDetails;
      v5->_cardDetails = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3
{
  id v7 = a3;
  if ([v7 secureElementPassProvisioningForMAIDs])
  {
    unint64_t v4 = 1;
    v5 = v7;
  }
  else
  {
    char v6 = [v7 passesAllAccess];
    v5 = v7;
    if (v6) {
      goto LABEL_6;
    }
    unint64_t v4 = 2;
  }
  self->_allowManagedAppleID = v4;
LABEL_6:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassRequestConfiguration;
  [(PKAddPaymentPassRequestConfiguration *)&v2 dealloc];
}

- (PKAddPaymentPassRequestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKAddPaymentPassRequestConfiguration;
  v5 = [(PKAddPaymentPassRequestConfiguration *)&v34 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionScheme"];
    uint64_t v7 = [v6 copy];
    encryptionScheme = v5->_encryptionScheme;
    v5->_encryptionScheme = (NSString *)v7;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderName"];
    uint64_t v10 = [v9 copy];
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;

    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountSuffix"];
    uint64_t v13 = [v12 copy];
    primaryAccountSuffix = v5->_primaryAccountSuffix;
    v5->_primaryAccountSuffix = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"cardDetails"];
    uint64_t v19 = [v18 copy];
    cardDetails = v5->_cardDetails;
    v5->_cardDetails = (NSArray *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    uint64_t v22 = [v21 copy];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountIdentifier"];
    uint64_t v25 = [v24 copy];
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentNetwork"];
    uint64_t v28 = [v27 copy];
    paymentNetwork = v5->_paymentNetwork;
    v5->_paymentNetwork = (NSString *)v28;

    v5->_requiresFelicaSecureElement = [v4 decodeBoolForKey:@"requiresFelicaSecureElement"];
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowManagedAppleID"];
    if ([v30 isEqualToString:@"true"])
    {
      uint64_t v31 = 1;
    }
    else
    {
      int v32 = [v30 isEqualToString:@"false"];
      uint64_t v31 = 2;
      if (!v32) {
        uint64_t v31 = 0;
      }
    }
    v5->_allowManagedAppleID = v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptionScheme = self->_encryptionScheme;
  id v8 = a3;
  [v8 encodeObject:encryptionScheme forKey:@"encryptionScheme"];
  [v8 encodeInteger:self->_style forKey:@"style"];
  [v8 encodeObject:self->_cardholderName forKey:@"cardholderName"];
  [v8 encodeObject:self->_primaryAccountSuffix forKey:@"primaryAccountSuffix"];
  [v8 encodeObject:self->_cardDetails forKey:@"cardDetails"];
  [v8 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v8 encodeObject:self->_primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  [v8 encodeObject:self->_paymentNetwork forKey:@"paymentNetwork"];
  [v8 encodeBool:self->_requiresFelicaSecureElement forKey:@"requiresFelicaSecureElement"];
  unint64_t allowManagedAppleID = self->_allowManagedAppleID;
  char v6 = @"true";
  if (allowManagedAppleID != 1) {
    char v6 = 0;
  }
  if (allowManagedAppleID == 2) {
    uint64_t v7 = @"false";
  }
  else {
    uint64_t v7 = v6;
  }
  [v8 encodeObject:v7 forKey:@"allowManagedAppleID"];
}

- (id)_effectiveDetails
{
  v3 = self->_cardDetails;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  char v6 = [(NSString *)self->_cardholderName stringByTrimmingCharactersInSet:v5];
  if ([v6 length])
  {
    uint64_t v7 = [PKLabeledValue alloc];
    id v8 = PKLocalizedPaymentString(&cfstr_Name_0.isa, 0);
    v9 = [(PKLabeledValue *)v7 initWithLabel:v8 value:v6];

    [v4 addObject:v9];
  }
  uint64_t v10 = [(NSString *)self->_primaryAccountSuffix stringByTrimmingCharactersInSet:v5];

  if ([v10 length])
  {
    int v11 = [PKLabeledValue alloc];
    int v12 = PKLocalizedPaymentString(&cfstr_CardNumber.isa, 0);
    uint64_t v13 = PKMaskedPaymentPAN((uint64_t)v10);
    uint64_t v14 = [(PKLabeledValue *)v11 initWithLabel:v12 value:v13];

    [v4 addObject:v14];
  }

  uint64_t v15 = [(NSArray *)v3 count];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v18 = [(NSArray *)v3 objectAtIndexedSubscript:i];
      uint64_t v19 = [v18 label];
      v20 = [v19 stringByTrimmingCharactersInSet:v5];

      v21 = [v18 value];
      uint64_t v22 = [v21 stringByTrimmingCharactersInSet:v5];

      if ([v20 length] && objc_msgSend(v22, "length"))
      {
        int v23 = [[PKLabeledValue alloc] initWithLabel:v20 value:v22];
        [v4 addObject:v23];
      }
    }
  }
  if ((unint64_t)[v4 count] >= 4) {
    uint64_t v24 = 4;
  }
  else {
    uint64_t v24 = [v4 count];
  }
  uint64_t v25 = objc_msgSend(v4, "subarrayWithRange:", 0, v24);

  return v25;
}

- (BOOL)isPaymentAccount
{
  return [(NSString *)self->_paymentNetwork isEqualToString:@"Barcode"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"encryptionScheme: '%@'; ", self->_encryptionScheme];
  if (self->_cardholderName) {
    [v3 appendFormat:@"cardholderName: '%@'; ", self->_cardholderName];
  }
  if (self->_primaryAccountSuffix) {
    [v3 appendFormat:@"primaryAccountSuffix: '%@'; ", self->_primaryAccountSuffix];
  }
  if (self->_localizedDescription) {
    [v3 appendFormat:@"localizedDescription: '%@'; ", self->_localizedDescription];
  }
  if (self->_paymentNetwork) {
    [v3 appendFormat:@"paymentNetwork: '%@'; ", self->_paymentNetwork];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (PKEncryptionScheme)encryptionScheme
{
  return self->_encryptionScheme;
}

- (PKAddPaymentPassStyle)style
{
  return self->_style;
}

- (void)setStyle:(PKAddPaymentPassStyle)style
{
  self->_style = style;
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(NSString *)cardholderName
{
}

- (NSString)primaryAccountSuffix
{
  return self->_primaryAccountSuffix;
}

- (void)setPrimaryAccountSuffix:(NSString *)primaryAccountSuffix
{
}

- (NSArray)cardDetails
{
  return self->_cardDetails;
}

- (void)setCardDetails:(NSArray *)cardDetails
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier
{
}

- (PKPaymentNetwork)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(PKPaymentNetwork)paymentNetwork
{
}

- (NSSet)productIdentifiers
{
  return self->_productIdentifiers;
}

- (void)setProductIdentifiers:(NSSet *)productIdentifiers
{
}

- (BOOL)requiresFelicaSecureElement
{
  return self->_requiresFelicaSecureElement;
}

- (void)setRequiresFelicaSecureElement:(BOOL)requiresFelicaSecureElement
{
  self->_requiresFelicaSecureElement = requiresFelicaSecureElement;
}

- (unint64_t)allowManagedAppleID
{
  return self->_allowManagedAppleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_cardDetails, 0);
  objc_storeStrong((id *)&self->_primaryAccountSuffix, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end