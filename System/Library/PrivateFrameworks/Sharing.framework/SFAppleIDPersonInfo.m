@interface SFAppleIDPersonInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)didMatchEmail;
- (BOOL)didMatchPhone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersonInfo:(id)a3;
- (BOOL)isStale;
- (NSDate)validUntilDate;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)matchedValue;
- (SFAppleIDPersonInfo)initWithCoder:(id)a3;
- (SFAppleIDPersonInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)certificateStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAppleIDPersonInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDPersonInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFAppleIDPersonInfo;
  v5 = [(SFAppleIDPersonInfo *)&v16 init];
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
    if ([v4 containsValueForKey:@"CertificateStatus"]) {
      v5->_certificateStatus = [v4 decodeIntegerForKey:@"CertificateStatus"];
    }
    if ([v4 containsValueForKey:@"DidMatchEmail"]) {
      v5->_didMatchEmail = [v4 decodeBoolForKey:@"DidMatchEmail"];
    }
    if ([v4 containsValueForKey:@"DidMatchPhone"]) {
      v5->_didMatchPhone = [v4 decodeBoolForKey:@"DidMatchPhone"];
    }
    if ([v4 containsValueForKey:@"MatchedValue"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MatchedValue"];
      matchedValue = v5->_matchedValue;
      v5->_matchedValue = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"MatchedValue"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ValidUntilDate"];
      validUntilDate = v5->_validUntilDate;
      v5->_validUntilDate = (NSDate *)v12;
    }
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  id v9 = v4;
  if (accountIdentifier)
  {
    [v4 encodeObject:accountIdentifier forKey:@"AccountIdentifier"];
    id v4 = v9;
  }
  altDSID = self->_altDSID;
  if (altDSID)
  {
    [v9 encodeObject:altDSID forKey:@"AltDSID"];
    id v4 = v9;
  }
  [v4 encodeInteger:self->_certificateStatus forKey:@"CertificateStatus"];
  [v9 encodeBool:self->_didMatchEmail forKey:@"DidMatchEmail"];
  [v9 encodeBool:self->_didMatchPhone forKey:@"DidMatchPhone"];
  matchedValue = self->_matchedValue;
  if (matchedValue) {
    [v9 encodeObject:matchedValue forKey:@"MatchedValue"];
  }
  validUntilDate = self->_validUntilDate;
  if (validUntilDate) {
    [v9 encodeObject:validUntilDate forKey:@"ValidUntilDate"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_accountIdentifier);
    objc_storeStrong((id *)(v5 + 24), self->_altDSID);
    *(void *)(v5 + 32) = self->_certificateStatus;
    *(unsigned char *)(v5 + 8) = self->_didMatchEmail;
    *(unsigned char *)(v5 + 9) = self->_didMatchPhone;
    objc_storeStrong((id *)(v5 + 40), self->_matchedValue);
    objc_storeStrong((id *)(v5 + 48), self->_validUntilDate);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAppleIDPersonInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFAppleIDPersonInfo *)self isEqualToPersonInfo:v5];

  return v6;
}

- (BOOL)isEqualToPersonInfo:(id)a3
{
  uint64_t v4 = (SFAppleIDPersonInfo *)a3;
  if (self == v4)
  {
    char v17 = 1;
    goto LABEL_17;
  }
  uint64_t v5 = [(SFAppleIDPersonInfo *)self accountIdentifier];
  uint64_t v6 = [(SFAppleIDPersonInfo *)v4 accountIdentifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = [(SFAppleIDPersonInfo *)self accountIdentifier];
    id v9 = [(SFAppleIDPersonInfo *)v4 accountIdentifier];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  v11 = [(SFAppleIDPersonInfo *)self altDSID];
  uint64_t v12 = [(SFAppleIDPersonInfo *)v4 altDSID];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(SFAppleIDPersonInfo *)self altDSID];
    v15 = [(SFAppleIDPersonInfo *)v4 altDSID];
    int v16 = [v14 isEqual:v15];

    if (!v16)
    {
LABEL_8:
      char v17 = 0;
      goto LABEL_17;
    }
  }
  int64_t v18 = [(SFAppleIDPersonInfo *)self certificateStatus];
  if (v18 != [(SFAppleIDPersonInfo *)v4 certificateStatus]) {
    goto LABEL_8;
  }
  BOOL v19 = [(SFAppleIDPersonInfo *)self didMatchEmail];
  if (v19 != [(SFAppleIDPersonInfo *)v4 didMatchEmail]) {
    goto LABEL_8;
  }
  BOOL v20 = [(SFAppleIDPersonInfo *)self didMatchPhone];
  if (v20 != [(SFAppleIDPersonInfo *)v4 didMatchPhone]) {
    goto LABEL_8;
  }
  v21 = [(SFAppleIDPersonInfo *)self validUntilDate];
  uint64_t v22 = [(SFAppleIDPersonInfo *)v4 validUntilDate];
  if (v21 == (void *)v22)
  {
    char v17 = 1;
    v23 = v21;
  }
  else
  {
    v23 = (void *)v22;
    v24 = [(SFAppleIDPersonInfo *)self validUntilDate];
    v25 = [(SFAppleIDPersonInfo *)v4 validUntilDate];
    char v17 = [v24 isEqual:v25];
  }
LABEL_17:

  return v17;
}

- (SFAppleIDPersonInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFAppleIDPersonInfo;
  uint64_t v5 = [(SFAppleIDPersonInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AccountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"AltDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v5->_certificateStatus = CFDictionaryGetInt64();
    int v10 = [v4 objectForKeyedSubscript:@"Matched"];
    if ([v10 isEqualToString:@"email"])
    {
      uint64_t v11 = 8;
    }
    else
    {
      if (![v10 isEqualToString:@"phone"])
      {
LABEL_7:
        uint64_t v12 = [v4 objectForKeyedSubscript:@"MatchedValue"];
        matchedValue = v5->_matchedValue;
        v5->_matchedValue = (NSString *)v12;

        uint64_t v14 = [v4 objectForKeyedSubscript:@"ValidUntil"];
        validUntilDate = v5->_validUntilDate;
        v5->_validUntilDate = (NSDate *)v14;

        goto LABEL_8;
      }
      uint64_t v11 = 9;
    }
    *((unsigned char *)&v5->super.isa + v11) = 1;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)description
{
  NSAppendPrintF();
  id v10 = 0;
  NSAppendPrintF();
  id v2 = v10;

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

  return v8;
}

- (BOOL)isStale
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [v3 compare:self->_validUntilDate] == 1;

  return (char)self;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (int64_t)certificateStatus
{
  return self->_certificateStatus;
}

- (BOOL)didMatchEmail
{
  return self->_didMatchEmail;
}

- (BOOL)didMatchPhone
{
  return self->_didMatchPhone;
}

- (NSString)matchedValue
{
  return self->_matchedValue;
}

- (NSDate)validUntilDate
{
  return self->_validUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntilDate, 0);
  objc_storeStrong((id *)&self->_matchedValue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end