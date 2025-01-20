@interface PKPushProvisioningTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProvisioningTarget:(id)a3;
- (BOOL)requiresSimultaneousRequestRouting;
- (NSDate)creationDate;
- (NSString)accountHash;
- (NSString)appleIdentifier;
- (NSString)cardConfigurationIdentifier;
- (NSString)environmentIdentifier;
- (NSString)nonce;
- (NSString)provisioningCredentialIdentifier;
- (NSString)relyingPartyIdentifier;
- (NSString)secondarySource;
- (NSString)sharingInstanceIdentifier;
- (NSString)templateIdentifier;
- (NSString)verificationCode;
- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8;
- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresSimultaneousRequestRouting:(BOOL)a12 targetDevice:(unint64_t)a13 environmentIdentifier:(id)a14;
- (PKPushProvisioningTarget)initWithCoder:(id)a3;
- (PKPushProvisioningTarget)initWithProvisioningDict:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonRepresentation;
- (int64_t)appleIdentifierType;
- (unint64_t)hash;
- (unint64_t)targetDevice;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountHash:(id)a3;
- (void)setAppleIdentifier:(id)a3;
- (void)setAppleIdentifierType:(int64_t)a3;
- (void)setEnvironmentIdentifier:(id)a3;
- (void)setNonce:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setRequiresSimultaneousRequestRouting:(BOOL)a3;
- (void)setSecondarySource:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setTargetDevice:(unint64_t)a3;
- (void)setVerificationCode:(id)a3;
@end

@implementation PKPushProvisioningTarget

- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8
{
  LOBYTE(v9) = 0;
  return [(PKPushProvisioningTarget *)self initWithAppleIdentifier:a3 appleIdentifierType:a4 provisioningCredentialIdentifier:a5 cardConfigurationIdentifier:a6 sharingInstanceIdentifier:a7 nonce:a8 accountHash:0 templateIdentifier:0 relyingPartyIdentifier:0 requiresSimultaneousRequestRouting:v9 targetDevice:1 environmentIdentifier:0];
}

- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresSimultaneousRequestRouting:(BOOL)a12 targetDevice:(unint64_t)a13 environmentIdentifier:(id)a14
{
  id v34 = a3;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  id v27 = a11;
  id v20 = a14;
  v35.receiver = self;
  v35.super_class = (Class)PKPushProvisioningTarget;
  v21 = [(PKPushProvisioningTarget *)&v35 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_appleIdentifier, a3);
    v22->_appleIdentifierType = a4;
    objc_storeStrong((id *)&v22->_provisioningCredentialIdentifier, a5);
    objc_storeStrong((id *)&v22->_cardConfigurationIdentifier, a6);
    objc_storeStrong((id *)&v22->_sharingInstanceIdentifier, a7);
    v23 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    creationDate = v22->_creationDate;
    v22->_creationDate = v23;

    objc_storeStrong((id *)&v22->_nonce, a8);
    objc_storeStrong((id *)&v22->_accountHash, a9);
    objc_storeStrong((id *)&v22->_templateIdentifier, a10);
    objc_storeStrong((id *)&v22->_relyingPartyIdentifier, a11);
    v22->_requiresSimultaneousRequestRouting = a12;
    v22->_targetDevice = a13;
    objc_storeStrong((id *)&v22->_environmentIdentifier, a14);
  }

  return v22;
}

- (PKPushProvisioningTarget)initWithProvisioningDict:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPushProvisioningTarget;
    v6 = [(PKPushProvisioningTarget *)&v18 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_additionalProvisioningDictionary, a3);
      v8 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      creationDate = v7->_creationDate;
      v7->_creationDate = v8;

      uint64_t v10 = [v5 PKStringForKey:@"accountHash"];
      accountHash = v7->_accountHash;
      v7->_accountHash = (NSString *)v10;

      uint64_t v12 = [v5 PKStringForKey:@"relyingPartyIdentifier"];
      relyingPartyIdentifier = v7->_relyingPartyIdentifier;
      v7->_relyingPartyIdentifier = (NSString *)v12;

      v7->_requiresSimultaneousRequestRouting = [v5 PKBoolForKey:@"requiresUnifiedAccessCapableDevice"];
      uint64_t v14 = [v5 PKStringForKey:@"provisioningCredentialIdentifier"];
      provisioningCredentialIdentifier = v7->_provisioningCredentialIdentifier;
      v7->_provisioningCredentialIdentifier = (NSString *)v14;
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPushProvisioningTarget *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPushProvisioningTarget *)self isEqualToProvisioningTarget:v5];

  return v6;
}

- (BOOL)isEqualToProvisioningTarget:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_55;
  }
  BOOL v6 = (void *)*((void *)v4 + 4);
  v7 = self->_appleIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_54;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_55;
    }
  }
  v11 = (void *)*((void *)v5 + 5);
  v7 = self->_provisioningCredentialIdentifier;
  uint64_t v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    uint64_t v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_54;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_55;
    }
  }
  uint64_t v14 = (void *)*((void *)v5 + 6);
  v7 = self->_cardConfigurationIdentifier;
  v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    uint64_t v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_54;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_55;
    }
  }
  v17 = (void *)*((void *)v5 + 7);
  v7 = self->_sharingInstanceIdentifier;
  objc_super v18 = v17;
  if (v7 == v18)
  {
  }
  else
  {
    uint64_t v9 = v18;
    if (!v7 || !v18) {
      goto LABEL_54;
    }
    BOOL v19 = [(NSString *)v7 isEqualToString:v18];

    if (!v19) {
      goto LABEL_55;
    }
  }
  creationDate = self->_creationDate;
  v21 = (NSDate *)*((void *)v5 + 8);
  if (creationDate && v21)
  {
    if ((-[NSDate isEqual:](creationDate, "isEqual:") & 1) == 0) {
      goto LABEL_55;
    }
  }
  else if (creationDate != v21)
  {
    goto LABEL_55;
  }
  nonce = self->_nonce;
  v23 = (NSString *)*((void *)v5 + 13);
  if (nonce && v23)
  {
    if ((-[NSString isEqual:](nonce, "isEqual:") & 1) == 0) {
      goto LABEL_55;
    }
  }
  else if (nonce != v23)
  {
    goto LABEL_55;
  }
  if (self->_appleIdentifierType != *((void *)v5 + 3)) {
    goto LABEL_55;
  }
  v24 = (void *)*((void *)v5 + 9);
  v7 = self->_accountHash;
  v25 = v24;
  if (v7 == v25)
  {
  }
  else
  {
    uint64_t v9 = v25;
    if (!v7 || !v25) {
      goto LABEL_54;
    }
    BOOL v26 = [(NSString *)v7 isEqualToString:v25];

    if (!v26) {
      goto LABEL_55;
    }
  }
  id v27 = (void *)*((void *)v5 + 10);
  v7 = self->_templateIdentifier;
  id v28 = v27;
  if (v7 == v28)
  {
  }
  else
  {
    uint64_t v9 = v28;
    if (!v7 || !v28) {
      goto LABEL_54;
    }
    BOOL v29 = [(NSString *)v7 isEqualToString:v28];

    if (!v29) {
      goto LABEL_55;
    }
  }
  id v30 = (void *)*((void *)v5 + 11);
  v7 = self->_relyingPartyIdentifier;
  id v31 = v30;
  if (v7 == v31)
  {

    goto LABEL_58;
  }
  uint64_t v9 = v31;
  if (!v7 || !v31)
  {
LABEL_54:

    goto LABEL_55;
  }
  BOOL v32 = [(NSString *)v7 isEqualToString:v31];

  if (!v32) {
    goto LABEL_55;
  }
LABEL_58:
  if (self->_requiresSimultaneousRequestRouting != v5[16] || self->_targetDevice != *((void *)v5 + 14)) {
    goto LABEL_55;
  }
  environmentIdentifier = self->_environmentIdentifier;
  v36 = (NSString *)*((void *)v5 + 15);
  if (environmentIdentifier && v36)
  {
    if ((-[NSString isEqual:](environmentIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_55;
    }
  }
  else if (environmentIdentifier != v36)
  {
    goto LABEL_55;
  }
  additionalProvisioningDictionary = self->_additionalProvisioningDictionary;
  v38 = (NSDictionary *)*((void *)v5 + 1);
  if (additionalProvisioningDictionary && v38)
  {
    if ((-[NSDictionary isEqual:](additionalProvisioningDictionary, "isEqual:") & 1) == 0) {
      goto LABEL_55;
    }
  }
  else if (additionalProvisioningDictionary != v38)
  {
    goto LABEL_55;
  }
  verificationCode = self->_verificationCode;
  v40 = (NSString *)*((void *)v5 + 12);
  if (verificationCode && v40)
  {
    if (-[NSString isEqual:](verificationCode, "isEqual:")) {
      goto LABEL_75;
    }
LABEL_55:
    char v33 = 0;
    goto LABEL_56;
  }
  if (verificationCode != v40) {
    goto LABEL_55;
  }
LABEL_75:
  secondarySource = self->_secondarySource;
  v42 = (NSString *)*((void *)v5 + 16);
  if (secondarySource && v42) {
    char v33 = -[NSString isEqual:](secondarySource, "isEqual:");
  }
  else {
    char v33 = secondarySource == v42;
  }
LABEL_56:

  return v33;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_appleIdentifier];
  [v3 safelyAddObject:self->_provisioningCredentialIdentifier];
  [v3 safelyAddObject:self->_cardConfigurationIdentifier];
  [v3 safelyAddObject:self->_sharingInstanceIdentifier];
  [v3 safelyAddObject:self->_creationDate];
  [v3 safelyAddObject:self->_nonce];
  [v3 safelyAddObject:self->_accountHash];
  [v3 safelyAddObject:self->_templateIdentifier];
  [v3 safelyAddObject:self->_relyingPartyIdentifier];
  [v3 safelyAddObject:self->_environmentIdentifier];
  [v3 safelyAddObject:self->_additionalProvisioningDictionary];
  [v3 safelyAddObject:self->_verificationCode];
  [v3 safelyAddObject:self->_secondarySource];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_requiresSimultaneousRequestRouting - v4 + 32 * v4;
  unint64_t v6 = self->_targetDevice - v5 + 32 * v5;
  unint64_t v7 = self->_appleIdentifierType - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPushProvisioningTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKPushProvisioningTarget;
  uint64_t v5 = [(PKPushProvisioningTarget *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    appleIdentifier = v5->_appleIdentifier;
    v5->_appleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCredentialIdentifier"];
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardConfigurationIdentifier"];
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v16;

    v5->_appleIdentifierType = [v4 decodeIntegerForKey:@"identifierType"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountHash"];
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateIdentifier"];
    templateIdentifier = v5->_templateIdentifier;
    v5->_templateIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v22;

    v5->_requiresSimultaneousRequestRouting = [v4 decodeBoolForKey:@"requiresSimultaneousRequestRouting"];
    v5->_targetDevice = [v4 decodeIntegerForKey:@"targetDevice"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environmentIdentifier"];
    environmentIdentifier = v5->_environmentIdentifier;
    v5->_environmentIdentifier = (NSString *)v24;

    BOOL v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    BOOL v29 = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"additionalProvisioningDictionary"];
    additionalProvisioningDictionary = v5->_additionalProvisioningDictionary;
    v5->_additionalProvisioningDictionary = (NSDictionary *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verificationCode"];
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondarySource"];
    secondarySource = v5->_secondarySource;
    v5->_secondarySource = (NSString *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appleIdentifier = self->_appleIdentifier;
  id v5 = a3;
  [v5 encodeObject:appleIdentifier forKey:@"identifier"];
  [v5 encodeObject:self->_provisioningCredentialIdentifier forKey:@"provisioningCredentialIdentifier"];
  [v5 encodeObject:self->_cardConfigurationIdentifier forKey:@"cardConfigurationIdentifier"];
  [v5 encodeObject:self->_sharingInstanceIdentifier forKey:@"sharingInstanceIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_nonce forKey:@"nonce"];
  [v5 encodeInteger:self->_appleIdentifierType forKey:@"identifierType"];
  [v5 encodeObject:self->_accountHash forKey:@"accountHash"];
  [v5 encodeObject:self->_templateIdentifier forKey:@"templateIdentifier"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeBool:self->_requiresSimultaneousRequestRouting forKey:@"requiresSimultaneousRequestRouting"];
  [v5 encodeInteger:self->_targetDevice forKey:@"targetDevice"];
  [v5 encodeObject:self->_environmentIdentifier forKey:@"environmentIdentifier"];
  [v5 encodeObject:self->_additionalProvisioningDictionary forKey:@"additionalProvisioningDictionary"];
  [v5 encodeObject:self->_verificationCode forKey:@"verificationCode"];
  [v5 encodeObject:self->_secondarySource forKey:@"secondarySource"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appleIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_provisioningCredentialIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_cardConfigurationIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_sharingInstanceIdentifier copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSDate *)self->_creationDate copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_nonce copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  *(void *)(v5 + 24) = self->_appleIdentifierType;
  uint64_t v18 = [(NSString *)self->_accountHash copyWithZone:a3];
  BOOL v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_templateIdentifier copyWithZone:a3];
  v21 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v20;

  uint64_t v22 = [(NSString *)self->_relyingPartyIdentifier copyWithZone:a3];
  v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  *(unsigned char *)(v5 + 16) = self->_requiresSimultaneousRequestRouting;
  *(void *)(v5 + 112) = self->_targetDevice;
  uint64_t v24 = [(NSString *)self->_environmentIdentifier copy];
  v25 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v24;

  uint64_t v26 = [(NSDictionary *)self->_additionalProvisioningDictionary copy];
  uint64_t v27 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v26;

  uint64_t v28 = [(NSString *)self->_verificationCode copy];
  BOOL v29 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v28;

  uint64_t v30 = [(NSString *)self->_secondarySource copy];
  id v31 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v30;

  return (id)v5;
}

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_appleIdentifier forKeyedSubscript:@"identifier"];
  unint64_t appleIdentifierType = self->_appleIdentifierType;
  if (appleIdentifierType > 3) {
    uint64_t v5 = @"signInWithApple";
  }
  else {
    uint64_t v5 = off_1E56F2EF0[appleIdentifierType];
  }
  [v3 setObject:v5 forKeyedSubscript:@"identifierType"];
  [v3 setObject:self->_cardConfigurationIdentifier forKeyedSubscript:@"cardConfigurationIdentifier"];
  uint64_t v6 = PKW3CDateStringFromDate(self->_creationDate);
  [v3 setObject:v6 forKeyedSubscript:@"creationDate"];

  [v3 setObject:self->_nonce forKeyedSubscript:@"nonce"];
  [v3 setObject:self->_provisioningCredentialIdentifier forKeyedSubscript:@"provisioningCredentialIdentifier"];
  [v3 setObject:self->_sharingInstanceIdentifier forKeyedSubscript:@"sharingInstanceIdentifier"];
  [v3 setObject:self->_accountHash forKeyedSubscript:@"accountHash"];
  [v3 setObject:self->_templateIdentifier forKeyedSubscript:@"templateIdentifier"];
  [v3 setObject:self->_relyingPartyIdentifier forKeyedSubscript:@"relyingPartyIdentifier"];
  [v3 setObject:self->_environmentIdentifier forKeyedSubscript:@"environmentIdentifier"];
  if (self->_additionalProvisioningDictionary) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  unint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (int64_t)appleIdentifierType
{
  return self->_appleIdentifierType;
}

- (void)setAppleIdentifierType:(int64_t)a3
{
  self->_unint64_t appleIdentifierType = a3;
}

- (NSString)appleIdentifier
{
  return self->_appleIdentifier;
}

- (void)setAppleIdentifier:(id)a3
{
}

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (void)setAccountHash:(id)a3
{
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (BOOL)requiresSimultaneousRequestRouting
{
  return self->_requiresSimultaneousRequestRouting;
}

- (void)setRequiresSimultaneousRequestRouting:(BOOL)a3
{
  self->_requiresSimultaneousRequestRouting = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (unint64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(unint64_t)a3
{
  self->_targetDevice = a3;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void)setEnvironmentIdentifier:(id)a3
{
}

- (NSString)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySource, 0);
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_appleIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalProvisioningDictionary, 0);
}

@end