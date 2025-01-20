@interface PKFieldProperties
+ (BOOL)supportsSecureCoding;
+ (id)fieldPropertiesForFieldNotification:(id)a3;
+ (id)fieldPropertiesForSTSFieldNotification:(id)a3;
- (BOOL)authenticationRequired;
- (BOOL)backgroundTransaction;
- (BOOL)secondaryPropertiesAcquired;
- (BOOL)secondaryPropertiesRequired;
- (BOOL)shouldIgnore;
- (NSArray)TCIs;
- (NSArray)merchantIdentifiers;
- (NSData)readerIdentifier;
- (NSString)applicationIdentifier;
- (NSString)credentialIdentifier;
- (PKFieldProperties)initWithCoder:(id)a3;
- (PKFieldProperties)initWithTechnology:(unint64_t)a3 terminalType:(int64_t)a4 accessTerminalSubtype:(int64_t)a5 valueAddedServiceMode:(int64_t)a6;
- (id)description;
- (int64_t)accessTerminalSubtype;
- (int64_t)carKeyBrandCode;
- (int64_t)terminalType;
- (int64_t)valueAddedServiceMode;
- (unint64_t)fieldType;
- (unint64_t)pairingRequested;
- (unint64_t)technology;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAuthenticationRequired:(BOOL)a3;
- (void)setBackgroundTransaction:(BOOL)a3;
- (void)setCarKeyBrandCode:(int64_t)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setFieldType:(unint64_t)a3;
- (void)setMerchantIdentifiers:(id)a3;
- (void)setPairingRequested:(unint64_t)a3;
- (void)setReaderIdentifier:(id)a3;
- (void)setSecondaryPropertiesAcquired:(BOOL)a3;
- (void)setSecondaryPropertiesRequired:(BOOL)a3;
- (void)setTCIs:(id)a3;
@end

@implementation PKFieldProperties

- (PKFieldProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFieldProperties;
  v5 = [(PKFieldProperties *)&v23 init];
  if (v5)
  {
    v5->_technology = [v4 decodeIntegerForKey:@"technology"];
    v5->_terminalType = [v4 decodeIntegerForKey:@"terminalType"];
    v5->_accessTerminalSubtype = [v4 decodeIntegerForKey:@"terminalSubtype"];
    v5->_valueAddedServiceMode = [v4 decodeIntegerForKey:@"valueAddedServiceMode"];
    v5->_authenticationRequired = [v4 decodeBoolForKey:@"authenticationRequired"];
    v5->_backgroundTransaction = [v4 decodeBoolForKey:@"backgroundTransaction"];
    v5->_pairingRequested = [v4 decodeIntegerForKey:@"pairingRequested"];
    v5->_carKeyBrandCode = [v4 decodeIntegerForKey:@"carKeyBrandCode"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TCIs"];
    TCIs = v5->_TCIs;
    v5->_TCIs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"merchantIdentifiers"];
    merchantIdentifiers = v5->_merchantIdentifiers;
    v5->_merchantIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v18;

    v5->_secondaryPropertiesRequired = [v4 decodeBoolForKey:@"secondaryPropertiesRequired"];
    v5->_secondaryPropertiesAcquired = [v4 decodeBoolForKey:@"secondaryPropertiesAquired"];
    v5->_fieldType = [v4 decodeIntegerForKey:@"ecpTypeKey"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v20;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifiers, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
}

- (int64_t)valueAddedServiceMode
{
  return self->_valueAddedServiceMode;
}

- (NSArray)merchantIdentifiers
{
  return self->_merchantIdentifiers;
}

- (BOOL)backgroundTransaction
{
  return self->_backgroundTransaction;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t technology = self->_technology;
  id v5 = a3;
  [v5 encodeInteger:technology forKey:@"technology"];
  [v5 encodeInteger:self->_terminalType forKey:@"terminalType"];
  [v5 encodeInteger:self->_accessTerminalSubtype forKey:@"terminalSubtype"];
  [v5 encodeInteger:self->_valueAddedServiceMode forKey:@"valueAddedServiceMode"];
  [v5 encodeBool:self->_authenticationRequired forKey:@"authenticationRequired"];
  [v5 encodeBool:self->_backgroundTransaction forKey:@"backgroundTransaction"];
  [v5 encodeInteger:self->_pairingRequested forKey:@"pairingRequested"];
  [v5 encodeInteger:self->_carKeyBrandCode forKey:@"carKeyBrandCode"];
  [v5 encodeObject:self->_TCIs forKey:@"TCIs"];
  [v5 encodeObject:self->_merchantIdentifiers forKey:@"merchantIdentifiers"];
  [v5 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
  [v5 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeBool:self->_secondaryPropertiesRequired forKey:@"secondaryPropertiesRequired"];
  [v5 encodeBool:self->_secondaryPropertiesAcquired forKey:@"secondaryPropertiesAquired"];
  [v5 encodeInteger:self->_fieldType forKey:@"ecpTypeKey"];
  [v5 encodeObject:self->_readerIdentifier forKey:@"readerIdentifier"];
}

- (int64_t)terminalType
{
  return self->_terminalType;
}

- (unint64_t)technology
{
  return self->_technology;
}

- (int64_t)accessTerminalSubtype
{
  return self->_accessTerminalSubtype;
}

+ (id)fieldPropertiesForFieldNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 rfTechnology] & 0xF;
    uint64_t v6 = [v4 notificationType];
    unsigned int v28 = v5;
    if (v6 == 3)
    {
      id v15 = v4;
      unint64_t v16 = [v15 terminalType] - 1;
      if (v16 > 4) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = qword_191675018[v16];
      }
      unsigned int v29 = [v15 odaRequired];
      unsigned int v13 = [v15 terminalSubType];
      v11 = [v15 tciArray];
      uint64_t v12 = [v15 readerIdentifier];

      uint64_t v9 = 0;
      int v10 = 1;
      uint64_t v14 = 2;
      goto LABEL_14;
    }
    if (v6 == 2)
    {
      uint64_t v7 = PKFieldTerminalTypeForNFTerminalType([v4 terminalType]);
      unsigned int v8 = [v4 terminalMode];
      if (v8 >= 4) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 4 - v8;
      }
      unsigned int v29 = [v4 odaRequired];
      int v10 = 0;
      v11 = 0;
      uint64_t v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v28 = 0;
  }
  int v10 = 0;
  uint64_t v14 = 0;
  unsigned int v29 = 0;
  v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  unsigned int v13 = 0;
  uint64_t v7 = 0;
LABEL_14:
  v17 = PKFieldValueAddedServiceModeOverride();
  uint64_t v18 = [v17 integerValue];

  if (v18)
  {
    v19 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v18;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Field Properties Overriding Mode: %tu", buf, 0xCu);
    }

    uint64_t v20 = 8;
  }
  else
  {
    uint64_t v20 = v28;
    uint64_t v18 = v9;
  }
  if (v7 == 3) {
    int v21 = v10;
  }
  else {
    int v21 = 0;
  }
  if (v21 != 1 || v13 > 0xB) {
    goto LABEL_33;
  }
  uint64_t v22 = 1;
  if (((1 << v13) & 0xF22) != 0)
  {
    int v23 = [v4 pairingMode];
    if (v23) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 0;
    }
    if (v23 == 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v24;
    }
    uint64_t v22 = 2;
    goto LABEL_35;
  }
  if (v13) {
LABEL_33:
  }
    uint64_t v22 = 0;
  uint64_t v25 = 2;
LABEL_35:
  v26 = [[PKFieldProperties alloc] initWithTechnology:v20 terminalType:v7 accessTerminalSubtype:v22 valueAddedServiceMode:v18];
  [(PKFieldProperties *)v26 setTCIs:v11];
  [(PKFieldProperties *)v26 setAuthenticationRequired:v29];
  [(PKFieldProperties *)v26 setFieldType:v14];
  [(PKFieldProperties *)v26 setReaderIdentifier:v12];
  [(PKFieldProperties *)v26 setPairingRequested:v25];

  return v26;
}

- (void)setTCIs:(id)a3
{
}

- (void)setReaderIdentifier:(id)a3
{
}

- (void)setPairingRequested:(unint64_t)a3
{
  self->_pairingRequested = a3;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (PKFieldProperties)initWithTechnology:(unint64_t)a3 terminalType:(int64_t)a4 accessTerminalSubtype:(int64_t)a5 valueAddedServiceMode:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PKFieldProperties;
  result = [(PKFieldProperties *)&v11 init];
  if (result)
  {
    result->_unint64_t technology = a3;
    result->_terminalType = a4;
    result->_valueAddedServiceMode = a6;
    result->_accessTerminalSubtype = a5;
    result->_pairingRequested = 2 * (a5 != 2);
  }
  return result;
}

- (id)description
{
  id v3 = [(NSArray *)self->_merchantIdentifiers pk_arrayByApplyingBlock:&__block_literal_global_164];
  unint64_t pairingRequested = self->_pairingRequested;
  unsigned int v5 = NSString;
  v32.receiver = self;
  v32.super_class = (Class)PKFieldProperties;
  uint64_t v6 = [(PKFieldProperties *)&v32 description];
  uint64_t v7 = PKFieldTechnologyDescriptions(self->_technology);
  uint64_t v8 = [v7 componentsJoinedByString:@","];
  uint64_t v9 = @"None";
  int v10 = @"Unknown";
  switch(self->_terminalType)
  {
    case 0:
      break;
    case 1:
      int v10 = @"Payment";
      break;
    case 2:
      int v10 = @"Transit";
      break;
    case 3:
      unint64_t v11 = self->_accessTerminalSubtype - 1;
      if (v11 >= 3) {
        uint64_t v9 = @"Unknown";
      }
      else {
        uint64_t v9 = off_1E56EF000[v11];
      }
      int v10 = @"Access";
      break;
    case 4:
      int v10 = @"Identity";
      break;
    case 5:
      int v10 = @"Connection Handover";
      break;
    default:
      uint64_t v9 = @"Unknown";
      int v10 = @"unknown";
      break;
  }
  unint64_t valueAddedServiceMode = self->_valueAddedServiceMode;
  v30 = v5;
  uint64_t v31 = (void *)v6;
  unsigned int v28 = (void *)v8;
  unsigned int v29 = v7;
  v26 = v10;
  v27 = v9;
  if (valueAddedServiceMode > 4) {
    unsigned int v13 = @"unknown";
  }
  else {
    unsigned int v13 = off_1E56EF018[valueAddedServiceMode];
  }
  uint64_t v14 = "unknown";
  if (pairingRequested == 1) {
    uint64_t v14 = "yes";
  }
  if (pairingRequested == 2) {
    id v15 = "no";
  }
  else {
    id v15 = v14;
  }
  if (self->_authenticationRequired) {
    unint64_t v16 = @"yes";
  }
  else {
    unint64_t v16 = @"no";
  }
  if (self->_backgroundTransaction) {
    v17 = @"yes";
  }
  else {
    v17 = @"no";
  }
  uint64_t v18 = [v3 componentsJoinedByString:@","];
  uint64_t v25 = v3;
  TCIs = self->_TCIs;
  applicationIdentifier = self->_applicationIdentifier;
  credentialIdentifier = self->_credentialIdentifier;
  uint64_t v22 = [(NSData *)self->_readerIdentifier hexEncoding];
  int v23 = [v30 stringWithFormat:@"[%@ Technology: %@, Terminal Type: %@ (%@), VAS Mode: %@, Authentication Required: %@, Pairing Requested: %s, Background Transaction: %@, Merchant Identifiers: %@, TCIs: %@, Credential Identifier: %@, AID: %@, Reader Identifier: %@, Secondary Properties Required: %d, Secondary Properties Acquired: %d]", v31, v28, v26, v27, v13, v16, v15, v17, v18, TCIs, credentialIdentifier, applicationIdentifier, v22, self->_secondaryPropertiesRequired, self->_secondaryPropertiesAcquired];

  return v23;
}

uint64_t __32__PKFieldProperties_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)shouldIgnore
{
  if ((self->_technology & 8) == 0) {
    return 0;
  }
  unint64_t terminalType = self->_terminalType;
  if (terminalType > 5 || ((1 << terminalType) & 0x16) != 0) {
    return 0;
  }
  if (((1 << terminalType) & 0x21) != 0) {
    return 1;
  }
  return self->_accessTerminalSubtype == 2;
}

- (BOOL)authenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setBackgroundTransaction:(BOOL)a3
{
  self->_backgroundTransaction = a3;
}

- (BOOL)secondaryPropertiesRequired
{
  return self->_secondaryPropertiesRequired;
}

- (void)setSecondaryPropertiesRequired:(BOOL)a3
{
  self->_secondaryPropertiesRequired = a3;
}

- (BOOL)secondaryPropertiesAcquired
{
  return self->_secondaryPropertiesAcquired;
}

- (void)setSecondaryPropertiesAcquired:(BOOL)a3
{
  self->_secondaryPropertiesAcquired = a3;
}

- (int64_t)carKeyBrandCode
{
  return self->_carKeyBrandCode;
}

- (void)setCarKeyBrandCode:(int64_t)a3
{
  self->_carKeyBrandCode = a3;
}

- (unint64_t)pairingRequested
{
  return self->_pairingRequested;
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (NSArray)TCIs
{
  return self->_TCIs;
}

- (void)setMerchantIdentifiers:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

+ (id)fieldPropertiesForSTSFieldNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 fieldType] == 1) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 nfcTechnology];
    unint64_t v8 = [v3 terminalType] - 1;
    if (v8 > 8) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_191675040[v8];
    }
    unint64_t v11 = [v3 terminalType] - 3;
    if (v11 > 6) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_191675088[v11];
    }
    unsigned int v13 = [v6 terminalMode];
    if (v13 >= 4) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 4 - v13;
    }
    [v6 ecpVersion];
    uint64_t v15 = [v3 odaRequired];
    unint64_t v16 = [v6 tcis];
    v17 = PKFieldValueAddedServiceModeOverride();
    uint64_t v18 = [v17 integerValue];

    if (v18)
    {
      v19 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134217984;
        uint64_t v23 = v18;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Field Properties Overriding Mode: %tu", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v20 = 8;
    }
    else
    {
      uint64_t v20 = v7 & 0xF;
      uint64_t v18 = v14;
    }
    int v10 = [[PKFieldProperties alloc] initWithTechnology:v20 terminalType:v9 accessTerminalSubtype:v12 valueAddedServiceMode:v18];
    [(PKFieldProperties *)v10 setTCIs:v16];
    [(PKFieldProperties *)v10 setAuthenticationRequired:v15];
    [(PKFieldProperties *)v10 setFieldType:0];
    if ([v6 terminalType] == 9) {
      [(PKFieldProperties *)v10 setPairingRequested:0];
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

@end