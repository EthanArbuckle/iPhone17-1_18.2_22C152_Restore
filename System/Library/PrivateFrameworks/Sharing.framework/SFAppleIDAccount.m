@interface SFAppleIDAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (NSData)privateKeyPersistentReference;
- (NSDate)certificateTokenCreationDate;
- (NSDate)creationDate;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)certificateToken;
- (SFAppleIDAccount)initWithAppleID:(id)a3;
- (SFAppleIDAccount)initWithCoder:(id)a3;
- (SFAppleIDAccount)initWithDictionary:(id)a3;
- (SFAppleIDContactInfo)contactInfo;
- (SFAppleIDIdentity)identity;
- (SFAppleIDValidationRecord)validationRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCertificateToken:(id)a3;
- (void)setCertificateTokenCreationDate:(id)a3;
- (void)setContactInfo:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setPrivateKeyPersistentReference:(id)a3;
- (void)setValidationRecord:(id)a3;
@end

@implementation SFAppleIDAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFAppleIDAccount;
  v5 = [(SFAppleIDAccount *)&v26 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"AltDSID"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AltDSID"];
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;
    }
    if ([v4 containsValueForKey:@"AppleID"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleID"];
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v8;
    }
    if ([v4 containsValueForKey:@"CertificateToken"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CertificateToken"];
      certificateToken = v5->_certificateToken;
      v5->_certificateToken = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"CertificateTokenCreationDate"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CertificateTokenCreationDate"];
      certificateTokenCreationDate = v5->_certificateTokenCreationDate;
      v5->_certificateTokenCreationDate = (NSDate *)v12;
    }
    if ([v4 containsValueForKey:@"ContactInfo"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactInfo"];
      contactInfo = v5->_contactInfo;
      v5->_contactInfo = (SFAppleIDContactInfo *)v14;
    }
    if ([v4 containsValueForKey:@"CreationDate"])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
      creationDate = v5->_creationDate;
      v5->_creationDate = (NSDate *)v16;
    }
    if ([v4 containsValueForKey:@"Identity"])
    {
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
      identity = v5->_identity;
      v5->_identity = (SFAppleIDIdentity *)v18;
    }
    if ([v4 containsValueForKey:@"PrivateKeyPersistentReference"])
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivateKeyPersistentReference"];
      privateKeyPersistentReference = v5->_privateKeyPersistentReference;
      v5->_privateKeyPersistentReference = (NSData *)v20;
    }
    if ([v4 containsValueForKey:@"ValidationRecord"])
    {
      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ValidationRecord"];
      validationRecord = v5->_validationRecord;
      v5->_validationRecord = (SFAppleIDValidationRecord *)v22;
    }
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  altDSID = self->_altDSID;
  id v14 = v4;
  if (altDSID)
  {
    [v4 encodeObject:altDSID forKey:@"AltDSID"];
    id v4 = v14;
  }
  appleID = self->_appleID;
  if (appleID)
  {
    [v14 encodeObject:appleID forKey:@"AppleID"];
    id v4 = v14;
  }
  certificateToken = self->_certificateToken;
  if (certificateToken)
  {
    [v14 encodeObject:certificateToken forKey:@"CertificateToken"];
    id v4 = v14;
  }
  certificateTokenCreationDate = self->_certificateTokenCreationDate;
  if (certificateTokenCreationDate)
  {
    [v14 encodeObject:certificateTokenCreationDate forKey:@"CertificateTokenCreationDate"];
    id v4 = v14;
  }
  contactInfo = self->_contactInfo;
  if (contactInfo)
  {
    [v14 encodeObject:contactInfo forKey:@"ContactInfo"];
    id v4 = v14;
  }
  creationDate = self->_creationDate;
  if (creationDate)
  {
    [v14 encodeObject:creationDate forKey:@"CreationDate"];
    id v4 = v14;
  }
  identity = self->_identity;
  if (identity)
  {
    [v14 encodeObject:identity forKey:@"Identity"];
    id v4 = v14;
  }
  privateKeyPersistentReference = self->_privateKeyPersistentReference;
  if (privateKeyPersistentReference)
  {
    [v14 encodeObject:privateKeyPersistentReference forKey:@"PrivateKeyPersistentReference"];
    id v4 = v14;
  }
  validationRecord = self->_validationRecord;
  if (validationRecord)
  {
    [v14 encodeObject:validationRecord forKey:@"ValidationRecord"];
    id v4 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_altDSID);
    objc_storeStrong(v5 + 2, self->_appleID);
    objc_storeStrong(v5 + 3, self->_certificateToken);
    objc_storeStrong(v5 + 4, self->_certificateTokenCreationDate);
    objc_storeStrong(v5 + 5, self->_contactInfo);
    objc_storeStrong(v5 + 6, self->_creationDate);
    objc_storeStrong(v5 + 7, self->_identity);
    objc_storeStrong(v5 + 8, self->_privateKeyPersistentReference);
    objc_storeStrong(v5 + 9, self->_validationRecord);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAppleIDAccount *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFAppleIDAccount *)self isEqualToAccount:v5];

  return v6;
}

- (BOOL)isEqualToAccount:(id)a3
{
  uint64_t v4 = (SFAppleIDAccount *)a3;
  if (self == v4)
  {
    char v53 = 1;
    goto LABEL_33;
  }
  v5 = [(SFAppleIDAccount *)self altDSID];
  uint64_t v6 = [(SFAppleIDAccount *)v4 altDSID];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = [(SFAppleIDAccount *)self altDSID];
    v9 = [(SFAppleIDAccount *)v4 altDSID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_32;
    }
  }
  v11 = [(SFAppleIDAccount *)self appleID];
  uint64_t v12 = [(SFAppleIDAccount *)v4 appleID];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    id v14 = [(SFAppleIDAccount *)self appleID];
    v15 = [(SFAppleIDAccount *)v4 appleID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  v17 = [(SFAppleIDAccount *)self certificateToken];
  uint64_t v18 = [(SFAppleIDAccount *)v4 certificateToken];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    uint64_t v20 = [(SFAppleIDAccount *)self certificateToken];
    v21 = [(SFAppleIDAccount *)v4 certificateToken];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_32;
    }
  }
  v23 = [(SFAppleIDAccount *)self certificateTokenCreationDate];
  uint64_t v24 = [(SFAppleIDAccount *)v4 certificateTokenCreationDate];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    v25 = (void *)v24;
    objc_super v26 = [(SFAppleIDAccount *)self certificateTokenCreationDate];
    v27 = [(SFAppleIDAccount *)v4 certificateTokenCreationDate];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_32;
    }
  }
  v29 = [(SFAppleIDAccount *)self contactInfo];
  uint64_t v30 = [(SFAppleIDAccount *)v4 contactInfo];
  if (v29 == (void *)v30)
  {
  }
  else
  {
    v31 = (void *)v30;
    v32 = [(SFAppleIDAccount *)self contactInfo];
    v33 = [(SFAppleIDAccount *)v4 contactInfo];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_32;
    }
  }
  v35 = [(SFAppleIDAccount *)self creationDate];
  uint64_t v36 = [(SFAppleIDAccount *)v4 creationDate];
  if (v35 == (void *)v36)
  {
  }
  else
  {
    v37 = (void *)v36;
    v38 = [(SFAppleIDAccount *)self creationDate];
    v39 = [(SFAppleIDAccount *)v4 creationDate];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_32;
    }
  }
  v41 = [(SFAppleIDAccount *)self identity];
  uint64_t v42 = [(SFAppleIDAccount *)v4 identity];
  if (v41 == (void *)v42)
  {
  }
  else
  {
    v43 = (void *)v42;
    v44 = [(SFAppleIDAccount *)self identity];
    v45 = [(SFAppleIDAccount *)v4 identity];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_32;
    }
  }
  v47 = [(SFAppleIDAccount *)self privateKeyPersistentReference];
  uint64_t v48 = [(SFAppleIDAccount *)v4 privateKeyPersistentReference];
  if (v47 == (void *)v48)
  {
  }
  else
  {
    v49 = (void *)v48;
    v50 = [(SFAppleIDAccount *)self privateKeyPersistentReference];
    v51 = [(SFAppleIDAccount *)v4 privateKeyPersistentReference];
    int v52 = [v50 isEqual:v51];

    if (!v52)
    {
LABEL_32:
      char v53 = 0;
      goto LABEL_33;
    }
  }
  v55 = [(SFAppleIDAccount *)self validationRecord];
  uint64_t v56 = [(SFAppleIDAccount *)v4 validationRecord];
  if (v55 == (void *)v56)
  {
    char v53 = 1;
    v57 = v55;
  }
  else
  {
    v57 = (void *)v56;
    v58 = [(SFAppleIDAccount *)self validationRecord];
    v59 = [(SFAppleIDAccount *)v4 validationRecord];
    char v53 = [v58 isEqual:v59];
  }
LABEL_33:

  return v53;
}

- (SFAppleIDAccount)initWithAppleID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFAppleIDAccount;
  uint64_t v6 = [(SFAppleIDAccount *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleID, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;
  }
  return v7;
}

- (SFAppleIDAccount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFAppleIDAccount;
  id v5 = [(SFAppleIDAccount *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"encDsId"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"AppleID"];
    if (v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"AppleID"];
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v9;
    }
    else
    {
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)&stru_1EF9BDC68;
    }

    uint64_t v11 = [v4 objectForKeyedSubscript:@"AppleID"];
    certificateToken = v5->_certificateToken;
    v5->_certificateToken = (NSString *)v11;

    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    id v14 = [v4 objectForKeyedSubscript:@"FirstName"];

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:@"FirstName"];
      [v13 setObject:v15 forKeyedSubscript:@"FirstName"];
    }
    int v16 = [v4 objectForKeyedSubscript:@"LastName"];

    if (v16)
    {
      v17 = [v4 objectForKeyedSubscript:@"LastName"];
      [v13 setObject:v17 forKeyedSubscript:@"LastName"];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"ValidatedEmail"];

    if (v18)
    {
      v19 = [v4 objectForKeyedSubscript:@"ValidatedEmail"];
      [v13 setObject:v19 forKeyedSubscript:@"ValidatedEmails"];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"ValidatedPhones"];

    if (v20)
    {
      v21 = [v4 objectForKeyedSubscript:@"ValidatedPhones"];
      [v13 setObject:v21 forKeyedSubscript:@"ValidatedPhones"];
    }
    int v22 = [[SFAppleIDContactInfo alloc] initWithDictionary:v13];
    contactInfo = v5->_contactInfo;
    v5->_contactInfo = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    v25 = [v4 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];

    if (v25)
    {
      objc_super v26 = [v4 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];
      [v24 setObject:v26 forKeyedSubscript:@"ValidationRecordData"];
    }
    v27 = [[SFAppleIDValidationRecord alloc] initWithDictionary:v24];
    validationRecord = v5->_validationRecord;
    v5->_validationRecord = v27;
  }
  return v5;
}

- (id)description
{
  NSAppendPrintF();
  id v12 = 0;
  NSAppendPrintF();
  id v2 = v12;

  NSAppendPrintF();
  id v3 = v2;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  NSAppendPrintF();
  id v6 = v5;

  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  NSAppendPrintF();
  id v9 = v8;

  NSAppendPrintF();
  id v10 = v9;

  return v10;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)certificateToken
{
  return self->_certificateToken;
}

- (void)setCertificateToken:(id)a3
{
}

- (NSDate)certificateTokenCreationDate
{
  return self->_certificateTokenCreationDate;
}

- (void)setCertificateTokenCreationDate:(id)a3
{
}

- (SFAppleIDContactInfo)contactInfo
{
  return self->_contactInfo;
}

- (void)setContactInfo:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (SFAppleIDIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSData)privateKeyPersistentReference
{
  return self->_privateKeyPersistentReference;
}

- (void)setPrivateKeyPersistentReference:(id)a3
{
}

- (SFAppleIDValidationRecord)validationRecord
{
  return self->_validationRecord;
}

- (void)setValidationRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationRecord, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contactInfo, 0);
  objc_storeStrong((id *)&self->_certificateTokenCreationDate, 0);
  objc_storeStrong((id *)&self->_certificateToken, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end