@interface SFAppleIDIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)certificateExpired;
- (BOOL)intermediateCertificateExpired;
- (BOOL)isDateInThePast:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)isInvalid;
- (BOOL)linkedToCurrentUser;
- (BOOL)needsRenewal;
- (NSData)certificatePersistentReference;
- (NSData)intermediateCertificatePersistentReference;
- (NSData)privateKeyPersistentReference;
- (NSDate)certificateExpirationDate;
- (NSDate)intermediateCertificateExpirationDate;
- (NSDate)lastValidationAttemptDate;
- (NSDate)lastValidationDate;
- (NSDate)modificationDate;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)intermediateCertificateSerialNumber;
- (NSString)serialNumber;
- (SFAppleIDIdentity)initWithAppleID:(id)a3 altDSID:(id)a4;
- (SFAppleIDIdentity)initWithCoder:(id)a3;
- (SFAppleIDIdentity)initWithDictionary:(id)a3;
- (__SecCertificate)copyCertificate;
- (__SecCertificate)copyCertificateWithType:(int64_t)a3;
- (__SecCertificate)copyIntermediateCertificate;
- (__SecIdentity)copyIdentity;
- (__SecKey)copyPrivateKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)verifyKeys;
- (void)encodeWithCoder:(id)a3;
- (void)removeFromKeychain;
- (void)setAccountIdentifier:(id)a3;
- (void)setCertificateExpirationDate:(id)a3;
- (void)setCertificatePersistentReference:(id)a3;
- (void)setIntermediateCertificateExpirationDate:(id)a3;
- (void)setIntermediateCertificatePersistentReference:(id)a3;
- (void)setLastValidationAttemptDate:(id)a3;
- (void)setLastValidationDate:(id)a3;
- (void)setLinkedToCurrentUser:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setPrivateKeyPersistentReference:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation SFAppleIDIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFAppleIDIdentity;
  v5 = [(SFAppleIDIdentity *)&v32 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"AccountIdentifier"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountIdentifier"];
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v6;
    }
    if ([v4 containsValueForKey:@"AltDSID"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AltDSID"];
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v8;
    }
    if ([v4 containsValueForKey:@"AppleID"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleID"];
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"CertificateExpirationDate"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CertificateExpirationDate"];
      certificateExpirationDate = v5->_certificateExpirationDate;
      v5->_certificateExpirationDate = (NSDate *)v12;
    }
    if ([v4 containsValueForKey:@"CertificatePersistentReference"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CertificatePersistentReference"];
      certificatePersistentReference = v5->_certificatePersistentReference;
      v5->_certificatePersistentReference = (NSData *)v14;
    }
    if ([v4 containsValueForKey:@"IntermediateCertificateExpirationDate"])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IntermediateCertificateExpirationDate"];
      intermediateCertificateExpirationDate = v5->_intermediateCertificateExpirationDate;
      v5->_intermediateCertificateExpirationDate = (NSDate *)v16;
    }
    if ([v4 containsValueForKey:@"IntermediateCertificatePersistentReference"])
    {
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IntermediateCertificatePersistentReference"];
      intermediateCertificatePersistentReference = v5->_intermediateCertificatePersistentReference;
      v5->_intermediateCertificatePersistentReference = (NSData *)v18;
    }
    if ([v4 containsValueForKey:@"LastValidationAttemptDate"])
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastValidationAttemptDate"];
      lastValidationAttemptDate = v5->_lastValidationAttemptDate;
      v5->_lastValidationAttemptDate = (NSDate *)v20;
    }
    if ([v4 containsValueForKey:@"LastValidationDate"])
    {
      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastValidationDate"];
      lastValidationDate = v5->_lastValidationDate;
      v5->_lastValidationDate = (NSDate *)v22;
    }
    if ([v4 containsValueForKey:@"LinkedToCurrentUser"]) {
      v5->_linkedToCurrentUser = [v4 decodeBoolForKey:@"LinkedToCurrentUser"];
    }
    if ([v4 containsValueForKey:@"ModificationDate"])
    {
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];
      modificationDate = v5->_modificationDate;
      v5->_modificationDate = (NSDate *)v24;
    }
    if ([v4 containsValueForKey:@"SerialNumber"])
    {
      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SerialNumber"];
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSString *)v26;
    }
    if ([v4 containsValueForKey:@"PrivateKeyPersistentReference"])
    {
      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivateKeyPersistentReference"];
      privateKeyPersistentReference = v5->_privateKeyPersistentReference;
      v5->_privateKeyPersistentReference = (NSData *)v28;
    }
    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  id v17 = v4;
  if (accountIdentifier)
  {
    [v4 encodeObject:accountIdentifier forKey:@"AccountIdentifier"];
    id v4 = v17;
  }
  altDSID = self->_altDSID;
  if (altDSID)
  {
    [v17 encodeObject:altDSID forKey:@"AltDSID"];
    id v4 = v17;
  }
  appleID = self->_appleID;
  if (appleID)
  {
    [v17 encodeObject:appleID forKey:@"AppleID"];
    id v4 = v17;
  }
  certificateExpirationDate = self->_certificateExpirationDate;
  if (certificateExpirationDate)
  {
    [v17 encodeObject:certificateExpirationDate forKey:@"CertificateExpirationDate"];
    id v4 = v17;
  }
  certificatePersistentReference = self->_certificatePersistentReference;
  if (certificatePersistentReference)
  {
    [v17 encodeObject:certificatePersistentReference forKey:@"CertificatePersistentReference"];
    id v4 = v17;
  }
  intermediateCertificateExpirationDate = self->_intermediateCertificateExpirationDate;
  if (intermediateCertificateExpirationDate)
  {
    [v17 encodeObject:intermediateCertificateExpirationDate forKey:@"IntermediateCertificateExpirationDate"];
    id v4 = v17;
  }
  intermediateCertificatePersistentReference = self->_intermediateCertificatePersistentReference;
  if (intermediateCertificatePersistentReference)
  {
    [v17 encodeObject:intermediateCertificatePersistentReference forKey:@"IntermediateCertificatePersistentReference"];
    id v4 = v17;
  }
  lastValidationAttemptDate = self->_lastValidationAttemptDate;
  if (lastValidationAttemptDate)
  {
    [v17 encodeObject:lastValidationAttemptDate forKey:@"LastValidationAttemptDate"];
    id v4 = v17;
  }
  lastValidationDate = self->_lastValidationDate;
  if (lastValidationDate)
  {
    [v17 encodeObject:lastValidationDate forKey:@"LastValidationDate"];
    id v4 = v17;
  }
  if (self->_linkedToCurrentUser)
  {
    [v17 encodeBool:1 forKey:@"LinkedToCurrentUser"];
    id v4 = v17;
  }
  modificationDate = self->_modificationDate;
  if (modificationDate)
  {
    [v17 encodeObject:modificationDate forKey:@"ModificationDate"];
    id v4 = v17;
  }
  privateKeyPersistentReference = self->_privateKeyPersistentReference;
  if (privateKeyPersistentReference)
  {
    [v17 encodeObject:privateKeyPersistentReference forKey:@"PrivateKeyPersistentReference"];
    id v4 = v17;
  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    [v17 encodeObject:serialNumber forKey:@"SerialNumber"];
    id v4 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_accountIdentifier);
    objc_storeStrong((id *)(v5 + 40), self->_altDSID);
    objc_storeStrong((id *)(v5 + 48), self->_appleID);
    objc_storeStrong((id *)(v5 + 56), self->_certificateExpirationDate);
    objc_storeStrong((id *)(v5 + 64), self->_certificatePersistentReference);
    objc_storeStrong((id *)(v5 + 72), self->_intermediateCertificateExpirationDate);
    objc_storeStrong((id *)(v5 + 80), self->_intermediateCertificatePersistentReference);
    objc_storeStrong((id *)(v5 + 88), self->_lastValidationAttemptDate);
    objc_storeStrong((id *)(v5 + 96), self->_lastValidationDate);
    *(unsigned char *)(v5 + 24) = self->_linkedToCurrentUser;
    objc_storeStrong((id *)(v5 + 104), self->_modificationDate);
    objc_storeStrong((id *)(v5 + 120), self->_serialNumber);
    objc_storeStrong((id *)(v5 + 112), self->_privateKeyPersistentReference);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAppleIDIdentity *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFAppleIDIdentity *)self isEqualToIdentity:v5];

  return v6;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  uint64_t v4 = (SFAppleIDIdentity *)a3;
  if (self == v4)
  {
    char v72 = 1;
    goto LABEL_46;
  }
  uint64_t v5 = [(SFAppleIDIdentity *)self accountIdentifier];
  uint64_t v6 = [(SFAppleIDIdentity *)v4 accountIdentifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = [(SFAppleIDIdentity *)self accountIdentifier];
    v9 = [(SFAppleIDIdentity *)v4 accountIdentifier];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_45;
    }
  }
  v11 = [(SFAppleIDIdentity *)self altDSID];
  uint64_t v12 = [(SFAppleIDIdentity *)v4 altDSID];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    uint64_t v14 = [(SFAppleIDIdentity *)self altDSID];
    v15 = [(SFAppleIDIdentity *)v4 altDSID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_45;
    }
  }
  id v17 = [(SFAppleIDIdentity *)self appleID];
  uint64_t v18 = [(SFAppleIDIdentity *)v4 appleID];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    uint64_t v20 = [(SFAppleIDIdentity *)self appleID];
    v21 = [(SFAppleIDIdentity *)v4 appleID];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_45;
    }
  }
  v23 = [(SFAppleIDIdentity *)self certificateExpirationDate];
  uint64_t v24 = [(SFAppleIDIdentity *)v4 certificateExpirationDate];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    v25 = (void *)v24;
    uint64_t v26 = [(SFAppleIDIdentity *)self certificateExpirationDate];
    v27 = [(SFAppleIDIdentity *)v4 certificateExpirationDate];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_45;
    }
  }
  v29 = [(SFAppleIDIdentity *)self certificatePersistentReference];
  uint64_t v30 = [(SFAppleIDIdentity *)v4 certificatePersistentReference];
  if (v29 == (void *)v30)
  {
  }
  else
  {
    v31 = (void *)v30;
    objc_super v32 = [(SFAppleIDIdentity *)self certificatePersistentReference];
    v33 = [(SFAppleIDIdentity *)v4 certificatePersistentReference];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_45;
    }
  }
  v35 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
  uint64_t v36 = [(SFAppleIDIdentity *)v4 intermediateCertificateExpirationDate];
  if (v35 == (void *)v36)
  {
  }
  else
  {
    v37 = (void *)v36;
    v38 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
    v39 = [(SFAppleIDIdentity *)v4 intermediateCertificateExpirationDate];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_45;
    }
  }
  v41 = [(SFAppleIDIdentity *)self intermediateCertificatePersistentReference];
  uint64_t v42 = [(SFAppleIDIdentity *)v4 intermediateCertificatePersistentReference];
  if (v41 == (void *)v42)
  {
  }
  else
  {
    v43 = (void *)v42;
    v44 = [(SFAppleIDIdentity *)self intermediateCertificatePersistentReference];
    v45 = [(SFAppleIDIdentity *)v4 intermediateCertificatePersistentReference];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_45;
    }
  }
  v47 = [(SFAppleIDIdentity *)self lastValidationAttemptDate];
  uint64_t v48 = [(SFAppleIDIdentity *)v4 lastValidationAttemptDate];
  if (v47 == (void *)v48)
  {
  }
  else
  {
    v49 = (void *)v48;
    v50 = [(SFAppleIDIdentity *)self lastValidationAttemptDate];
    v51 = [(SFAppleIDIdentity *)v4 lastValidationAttemptDate];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_45;
    }
  }
  v53 = [(SFAppleIDIdentity *)self lastValidationDate];
  uint64_t v54 = [(SFAppleIDIdentity *)v4 lastValidationDate];
  if (v53 == (void *)v54)
  {
  }
  else
  {
    v55 = (void *)v54;
    v56 = [(SFAppleIDIdentity *)self lastValidationDate];
    v57 = [(SFAppleIDIdentity *)v4 lastValidationDate];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_45;
    }
  }
  BOOL v59 = [(SFAppleIDIdentity *)self linkedToCurrentUser];
  if (v59 != [(SFAppleIDIdentity *)v4 linkedToCurrentUser])
  {
LABEL_45:
    char v72 = 0;
    goto LABEL_46;
  }
  v60 = [(SFAppleIDIdentity *)self modificationDate];
  uint64_t v61 = [(SFAppleIDIdentity *)v4 modificationDate];
  if (v60 == (void *)v61)
  {
  }
  else
  {
    v62 = (void *)v61;
    v63 = [(SFAppleIDIdentity *)self modificationDate];
    v64 = [(SFAppleIDIdentity *)v4 modificationDate];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_45;
    }
  }
  v66 = [(SFAppleIDIdentity *)self serialNumber];
  uint64_t v67 = [(SFAppleIDIdentity *)v4 serialNumber];
  if (v66 == (void *)v67)
  {
  }
  else
  {
    v68 = (void *)v67;
    v69 = [(SFAppleIDIdentity *)self serialNumber];
    v70 = [(SFAppleIDIdentity *)v4 serialNumber];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_45;
    }
  }
  v74 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];
  uint64_t v75 = [(SFAppleIDIdentity *)v4 privateKeyPersistentReference];
  if (v74 == (void *)v75)
  {
    char v72 = 1;
    v76 = v74;
  }
  else
  {
    v76 = (void *)v75;
    v77 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];
    v78 = [(SFAppleIDIdentity *)v4 privateKeyPersistentReference];
    char v72 = [v77 isEqual:v78];
  }
LABEL_46:

  return v72;
}

- (SFAppleIDIdentity)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFAppleIDIdentity;
  v9 = [(SFAppleIDIdentity *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_altDSID, a4);
    objc_storeStrong((id *)&v10->_appleID, a3);
  }

  return v10;
}

- (SFAppleIDIdentity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFAppleIDIdentity;
  uint64_t v5 = [(SFAppleIDIdentity *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"Expires"];
    certificateExpirationDate = v5->_certificateExpirationDate;
    v5->_certificateExpirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"CertificateReference"];
    certificatePersistentReference = v5->_certificatePersistentReference;
    v5->_certificatePersistentReference = (NSData *)v8;

    int v10 = [v4 objectForKeyedSubscript:@"encDsId"];
    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"encDsId"];
      encDSID = v5->_encDSID;
      v5->_encDSID = (NSString *)v11;
    }
    else
    {
      encDSID = v5->_encDSID;
      v5->_encDSID = (NSString *)&stru_1EF9BDC68;
    }

    uint64_t v13 = [v4 objectForKeyedSubscript:@"IntermediateCertificateReference"];
    intermediateCertificatePersistentReference = v5->_intermediateCertificatePersistentReference;
    v5->_intermediateCertificatePersistentReference = (NSData *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"LastValidationAttempt"];
    lastValidationAttemptDate = v5->_lastValidationAttemptDate;
    v5->_lastValidationAttemptDate = (NSDate *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"LastSuccessfulValidation"];
    lastValidationDate = v5->_lastValidationDate;
    v5->_lastValidationDate = (NSDate *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"ModificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"SerialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v21;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"CertificatePrivateKeyReference"];
    privateKeyPersistentReference = v5->_privateKeyPersistentReference;
    v5->_privateKeyPersistentReference = (NSData *)v23;
  }
  return v5;
}

- (id)description
{
  NSAppendPrintF();
  id v26 = 0;
  NSAppendPrintF();
  id v3 = v26;

  NSAppendPrintF();
  id v4 = v3;

  appleID = self->_appleID;
  NSAppendPrintF();
  id v5 = v4;

  uint64_t v6 = [(SFAppleIDIdentity *)self certificateExpirationDate];
  NSAppendPrintF();
  id v7 = v5;

  certificatePersistentReference = self->_certificatePersistentReference;
  NSAppendPrintF();
  id v8 = v7;

  uint64_t v24 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
  NSAppendPrintF();
  id v9 = v8;

  int v10 = [(SFAppleIDIdentity *)self intermediateCertificateSerialNumber];
  NSAppendPrintF();
  id v11 = v9;

  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  NSAppendPrintF();
  id v14 = v13;

  NSAppendPrintF();
  id v15 = v14;

  if (self->_linkedToCurrentUser) {
    int v16 = "yes";
  }
  else {
    int v16 = "no";
  }
  v25 = v16;
  NSAppendPrintF();
  id v17 = v15;

  [(SFAppleIDIdentity *)self needsRenewal];
  NSAppendPrintF();
  id v18 = v17;

  NSAppendPrintF();
  id v19 = v18;

  NSAppendPrintF();
  id v20 = v19;

  return v20;
}

- (__SecCertificate)copyCertificate
{
  return [(SFAppleIDIdentity *)self copyCertificateWithType:0];
}

- (__SecCertificate)copyCertificateWithType:(int64_t)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  if (a3 == 1)
  {
    uint64_t v5 = [(SFAppleIDIdentity *)self intermediateCertificatePersistentReference];
  }
  else
  {
    if (a3)
    {
      if (gLogCategory_SFAppleIDIdentity > 60)
      {
        CFDictionaryRef v8 = 0;
        int v10 = 0;
        uint64_t v6 = 0;
        goto LABEL_27;
      }
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      goto LABEL_15;
    }
    uint64_t v5 = [(SFAppleIDIdentity *)self certificatePersistentReference];
  }
  uint64_t v6 = (void *)v5;
  if (!v5)
  {
LABEL_15:
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      id v11 = @"?";
      if (a3 == 1) {
        id v11 = @"Intermediate";
      }
      if (!a3) {
        id v11 = @"Leaf";
      }
      id v12 = v11;
      id v14 = [(SFAppleIDIdentity *)self appleID];
      LogPrintF();
    }
    uint64_t v6 = 0;
    CFDictionaryRef v8 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = *MEMORY[0x1E4F3BD40];
  v16[0] = *MEMORY[0x1E4F3B978];
  v16[1] = v7;
  v17[0] = *MEMORY[0x1E4F3B980];
  v17[1] = v5;
  v16[2] = *MEMORY[0x1E4F3BC80];
  v17[2] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (SecItemCopyMatching(v8, &result))
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_36;
    }
    goto LABEL_24;
  }
  if (!result)
  {
    if (gLogCategory_SFAppleIDIdentity > 60)
    {
LABEL_26:
      int v10 = 0;
      goto LABEL_27;
    }
    if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
      goto LABEL_36;
    }
    goto LABEL_24;
  }
  CFTypeID v9 = CFGetTypeID(result);
  if (v9 != SecCertificateGetTypeID())
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
LABEL_36:
      LogPrintF();
    }
LABEL_24:
    if (result) {
      CFRelease(result);
    }
    goto LABEL_26;
  }
  int v10 = (__SecCertificate *)result;
LABEL_27:

  return v10;
}

- (__SecCertificate)copyIntermediateCertificate
{
  return [(SFAppleIDIdentity *)self copyCertificateWithType:1];
}

- (__SecKey)copyPrivateKey
{
  v14[3] = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  id v3 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];

  if (!v3)
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      id v11 = [(SFAppleIDIdentity *)self appleID];
      LogPrintF();
    }
    CFDictionaryRef v7 = 0;
    goto LABEL_21;
  }
  uint64_t v4 = *MEMORY[0x1E4F3B978];
  v14[0] = *MEMORY[0x1E4F3B9A0];
  uint64_t v5 = *MEMORY[0x1E4F3BD40];
  v13[0] = v4;
  v13[1] = v5;
  uint64_t v6 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];
  v13[2] = *MEMORY[0x1E4F3BC80];
  v14[1] = v6;
  v14[2] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  if (SecItemCopyMatching(v7, &result))
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
LABEL_18:
    LogPrintF();
LABEL_21:
    CFTypeID v9 = 0;
    goto LABEL_6;
  }
  if (!result)
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  CFTypeID v8 = CFGetTypeID(result);
  if (v8 != SecKeyGetTypeID())
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  CFTypeID v9 = (__SecKey *)result;
LABEL_6:

  return v9;
}

- (BOOL)isDateInThePast:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  uint64_t v5 = [v3 date];
  uint64_t v6 = [v4 compare:v5];

  BOOL v7 = v6 == -1;
  return v7;
}

- (BOOL)certificateExpired
{
  id v3 = [(SFAppleIDIdentity *)self certificateExpirationDate];
  BOOL v4 = [(SFAppleIDIdentity *)self isDateInThePast:v3];

  if (v4
    && gLogCategory_SFAppleIDIdentity <= 30
    && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [(SFAppleIDIdentity *)self appleID];
    BOOL v7 = [(SFAppleIDIdentity *)self certificateExpirationDate];
    LogPrintF();
  }
  return v4;
}

- (NSDate)certificateExpirationDate
{
  p_certificateExpirationDate = &self->_certificateExpirationDate;
  if (self->_certificateExpirationDate || (BOOL v4 = [(SFAppleIDIdentity *)self copyCertificate]) == 0)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    id v10 = 0;
    int v6 = SFAppleIDExpirationDateForCertificate((uint64_t)v4, &v10);
    id v7 = v10;
    id v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_certificateExpirationDate, v7);
    }
    CFRelease(v5);
  }
  CFTypeID v8 = *p_certificateExpirationDate;

  return v8;
}

- (NSDate)intermediateCertificateExpirationDate
{
  p_intermediateCertificateExpirationDate = &self->_intermediateCertificateExpirationDate;
  if (self->_intermediateCertificateExpirationDate
    || (BOOL v4 = [(SFAppleIDIdentity *)self copyIntermediateCertificate]) == 0)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    id v10 = 0;
    int v6 = SFAppleIDExpirationDateForCertificate((uint64_t)v4, &v10);
    id v7 = v10;
    id v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_intermediateCertificateExpirationDate, v7);
    }
    CFRelease(v5);
  }
  CFTypeID v8 = *p_intermediateCertificateExpirationDate;

  return v8;
}

- (NSString)intermediateCertificateSerialNumber
{
  p_intermediateCertificateSerialNumber = &self->_intermediateCertificateSerialNumber;
  if (self->_intermediateCertificateSerialNumber
    || (BOOL v4 = [(SFAppleIDIdentity *)self copyIntermediateCertificate]) == 0)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    id v10 = 0;
    int v6 = SFAppleIDSerialNumberForCertificate(v4, &v10);
    id v7 = v10;
    id v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_intermediateCertificateSerialNumber, v7);
    }
    CFRelease(v5);
  }
  CFTypeID v8 = *p_intermediateCertificateSerialNumber;

  return v8;
}

- (BOOL)intermediateCertificateExpired
{
  id v3 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
  BOOL v4 = [(SFAppleIDIdentity *)self isDateInThePast:v3];

  if (v4
    && gLogCategory_SFAppleIDIdentity <= 30
    && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [(SFAppleIDIdentity *)self appleID];
    id v7 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
    LogPrintF();
  }
  return v4;
}

- (BOOL)isInvalid
{
  id v3 = [(SFAppleIDIdentity *)self certificateExpirationDate];

  if (v3)
  {
    if ([(SFAppleIDIdentity *)self certificateExpired])
    {
      if (gLogCategory_SFAppleIDIdentity <= 50)
      {
        if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
          goto LABEL_17;
        }
        goto LABEL_28;
      }
    }
    else
    {
      BOOL v4 = [(SFAppleIDIdentity *)self copyCertificate];
      if (v4)
      {
        uint64_t v5 = v4;
        int v6 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];

        if (v6)
        {
          if ([(SFAppleIDIdentity *)self intermediateCertificateExpired])
          {
            if (gLogCategory_SFAppleIDIdentity > 50
              || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          else
          {
            id v7 = [(SFAppleIDIdentity *)self copyIntermediateCertificate];
            if (v7)
            {
              CFTypeID v8 = v7;
              CFTypeID v9 = [(SFAppleIDIdentity *)self copyIdentity];
              if (v9)
              {
                CFRelease(v5);
                CFRelease(v8);
                CFRelease(v9);
                return 0;
              }
              if (gLogCategory_SFAppleIDIdentity <= 50
                && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              CFRelease(v5);
              CFRelease(v8);
              goto LABEL_28;
            }
            if (gLogCategory_SFAppleIDIdentity > 50
              || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
        }
        else if (gLogCategory_SFAppleIDIdentity > 50 {
               || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
        }
        {
          goto LABEL_27;
        }
        LogPrintF();
LABEL_27:
        CFRelease(v5);
        goto LABEL_28;
      }
      if (gLogCategory_SFAppleIDIdentity <= 50)
      {
        if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
LABEL_17:
        }
          LogPrintF();
LABEL_28:
        if (gLogCategory_SFAppleIDIdentity <= 30
          && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
        {
          id v11 = [(SFAppleIDIdentity *)self appleID];
          LogPrintF();
        }
      }
    }
  }
  else if (gLogCategory_SFAppleIDIdentity <= 50)
  {
    if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
  return 1;
}

- (BOOL)needsRenewal
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [(SFAppleIDIdentity *)self certificateExpirationDate];

  if (!v4)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  uint64_t v5 = [v3 dateByAddingTimeInterval:7776000.0];
  int v6 = [(SFAppleIDIdentity *)self certificateExpirationDate];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == 1)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  CFTypeID v8 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];

  if (!v8)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
LABEL_23:
    BOOL v12 = 1;
    goto LABEL_6;
  }
  CFTypeID v9 = [v3 dateByAddingTimeInterval:7776000.0];
  id v10 = [(SFAppleIDIdentity *)self intermediateCertificateExpirationDate];
  uint64_t v11 = [v9 compare:v10];

  if (v11 == 1)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()) {
LABEL_18:
      }
        LogPrintF();
LABEL_19:
      if (gLogCategory_SFAppleIDIdentity <= 30
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        id v14 = [(SFAppleIDIdentity *)self appleID];
        LogPrintF();
      }
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (__SecIdentity)copyIdentity
{
  id v3 = [(SFAppleIDIdentity *)self copyCertificate];
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  uint64_t v5 = [(SFAppleIDIdentity *)self copyPrivateKey];
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = (__SecIdentity *)SecIdentityCreate();
    if (!v7
      && gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      CFTypeID v9 = [(SFAppleIDIdentity *)self appleID];
      LogPrintF();
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v7 = 0;
    int v6 = v4;
  }
  CFRelease(v6);
  return v7;
}

- (void)removeFromKeychain
{
  id v3 = [(SFAppleIDIdentity *)self appleID];
  SecCertificateRef certificate = 0;
  BOOL v4 = [(SFAppleIDIdentity *)self certificatePersistentReference];

  if (v4)
  {
    uint64_t v5 = [(SFAppleIDIdentity *)self certificatePersistentReference];
    SFAppleIDCopyCertificateFromKeychainForReference(v5, (CFTypeRef *)&certificate);

    if (certificate)
    {
      SecKeyRef v6 = SecCertificateCopyKey(certificate);
      BOOL v4 = v6;
      if (v6)
      {
        id v11 = 0;
        SFAppleIDCopyKeychainReferenceForKey((uint64_t)v6, &v11);
        id v7 = v11;
        if (v7) {
          SFAppleIDRemoveKeyFromKeychain(v3, v7);
        }
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
      BOOL v4 = 0;
    }
    CFTypeID v8 = [(SFAppleIDIdentity *)self certificatePersistentReference];
    SFAppleIDRemoveCertificateFromKeychain(v3, v8);
  }
  else
  {
    id v7 = 0;
  }
  CFTypeID v9 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];

  if (v9)
  {
    id v10 = [(SFAppleIDIdentity *)self privateKeyPersistentReference];
    SFAppleIDRemoveKeyFromKeychain(v3, v10);
  }
  if (certificate) {
    CFRelease(certificate);
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (int)verifyKeys
{
  int v3 = 201234;
  CFTypeRef cf = 0;
  BOOL v4 = [(SFAppleIDIdentity *)self copyCertificate];
  if (!v4)
  {
    id v12 = 0;
    CFDataRef v13 = 0;
    int v3 = 201203;
    goto LABEL_33;
  }
  uint64_t v5 = v4;
  SecKeyRef v6 = [(SFAppleIDIdentity *)self copyPrivateKey];
  if (!v6)
  {
    CFRelease(v5);
    id v12 = 0;
    CFDataRef v13 = 0;
    int v3 = 201206;
    goto LABEL_33;
  }
  id v7 = v6;
  CFTypeID v8 = SecCertificateCopyKey(v5);
  if (v8)
  {
    uint64_t AlgorithmId = SecKeyGetAlgorithmId();
    if (gLogCategory_SFAppleIDIdentity <= 50
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v10 = SecKeyGetAlgorithmId();
    if (gLogCategory_SFAppleIDIdentity <= 50
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (AlgorithmId == v10)
    {
      CFTypeRef cf = 0;
      id v11 = (__SecKey *)SecKeyCopyMatchingPrivateKey();
      if (v7 == v11 || v11 && CFEqual(v7, v11))
      {
        if (gLogCategory_SFAppleIDIdentity <= 50
          && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id v12 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:5000];
        [v12 mutableBytes];
        RandomBytes();
        CFDataRef v17 = 0;
        int v14 = SFAppleIDSignedHashForData(v12, v7, &v17);
        CFDataRef v15 = v17;
        CFDataRef v13 = v15;
        if (v14)
        {
          if (gLogCategory_SFAppleIDIdentity <= 60
            && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_29;
        }
        if ([(__CFData *)v15 length])
        {
          if (SFAppleIDVerifySignedHashForData(v12, v13, v8))
          {
            if (gLogCategory_SFAppleIDIdentity <= 60
              && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            int v3 = 201235;
            goto LABEL_29;
          }
          if (gLogCategory_SFAppleIDIdentity <= 50
            && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        else
        {
          FPrintF();
        }
        int v3 = 0;
      }
      else
      {
        id v12 = 0;
        CFDataRef v13 = 0;
        int v3 = 201233;
      }
    }
    else
    {
      id v12 = 0;
      id v11 = 0;
      CFDataRef v13 = 0;
      int v3 = 201231;
    }
  }
  else
  {
    id v12 = 0;
    id v11 = 0;
    CFDataRef v13 = 0;
    int v3 = 201230;
  }
LABEL_29:
  CFRelease(v5);
  CFRelease(v7);
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    CFRelease(v11);
  }
LABEL_33:

  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setCertificateExpirationDate:(id)a3
{
}

- (NSData)certificatePersistentReference
{
  return self->_certificatePersistentReference;
}

- (void)setCertificatePersistentReference:(id)a3
{
}

- (void)setIntermediateCertificateExpirationDate:(id)a3
{
}

- (NSData)intermediateCertificatePersistentReference
{
  return self->_intermediateCertificatePersistentReference;
}

- (void)setIntermediateCertificatePersistentReference:(id)a3
{
}

- (NSDate)lastValidationAttemptDate
{
  return self->_lastValidationAttemptDate;
}

- (void)setLastValidationAttemptDate:(id)a3
{
}

- (NSDate)lastValidationDate
{
  return self->_lastValidationDate;
}

- (void)setLastValidationDate:(id)a3
{
}

- (BOOL)linkedToCurrentUser
{
  return self->_linkedToCurrentUser;
}

- (void)setLinkedToCurrentUser:(BOOL)a3
{
  self->_linkedToCurrentUser = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSData)privateKeyPersistentReference
{
  return self->_privateKeyPersistentReference;
}

- (void)setPrivateKeyPersistentReference:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastValidationDate, 0);
  objc_storeStrong((id *)&self->_lastValidationAttemptDate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificatePersistentReference, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificatePersistentReference, 0);
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateSerialNumber, 0);

  objc_storeStrong((id *)&self->_encDSID, 0);
}

@end