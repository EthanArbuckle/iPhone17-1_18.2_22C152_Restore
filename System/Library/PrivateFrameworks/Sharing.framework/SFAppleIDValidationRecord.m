@interface SFAppleIDValidationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToValidationRecord:(id)a3;
- (BOOL)isInvalid;
- (BOOL)needsUpdate;
- (NSArray)validatedEmailHashes;
- (NSArray)validatedPhoneHashes;
- (NSData)data;
- (NSDate)nextCheckDate;
- (NSDate)validStartDate;
- (NSNumber)version;
- (NSString)altDSID;
- (NSString)identifier;
- (SFAppleIDValidationRecord)initWithCoder:(id)a3;
- (SFAppleIDValidationRecord)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expirationDate;
- (unint64_t)suggestedValidDuration;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNextCheckDate:(id)a3;
- (void)setSuggestedValidDuration:(unint64_t)a3;
- (void)setValidStartDate:(id)a3;
- (void)setValidatedEmailHashes:(id)a3;
- (void)setValidatedPhoneHashes:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SFAppleIDValidationRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDValidationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFAppleIDValidationRecord;
  v5 = [(SFAppleIDValidationRecord *)&v30 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"AltDSID"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AltDSID"];
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;
    }
    if ([v4 containsValueForKey:@"Data"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
      data = v5->_data;
      v5->_data = (NSData *)v8;
    }
    if ([v4 containsValueForKey:@"Identifier"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;
    }
    if ([v4 containsValueForKey:@"NextCheckDate"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NextCheckDate"];
      nextCheckDate = v5->_nextCheckDate;
      v5->_nextCheckDate = (NSDate *)v12;
    }
    if ([v4 containsValueForKey:@"SuggestedValidDuration"]) {
      v5->_suggestedValidDuration = [v4 decodeIntegerForKey:@"SuggestedValidDuration"];
    }
    if ([v4 containsValueForKey:@"ValidatedEmailHashes"])
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ValidatedEmailHashes"];
      validatedEmailHashes = v5->_validatedEmailHashes;
      v5->_validatedEmailHashes = (NSArray *)v17;
    }
    if ([v4 containsValueForKey:@"ValidatedPhoneHashes"])
    {
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"ValidatedPhoneHashes"];
      validatedPhoneHashes = v5->_validatedPhoneHashes;
      v5->_validatedPhoneHashes = (NSArray *)v22;
    }
    if ([v4 containsValueForKey:@"ValidStartDate"])
    {
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ValidStartDate"];
      validStartDate = v5->_validStartDate;
      v5->_validStartDate = (NSDate *)v24;
    }
    if ([v4 containsValueForKey:@"Version"])
    {
      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
      version = v5->_version;
      v5->_version = (NSNumber *)v26;
    }
    v28 = v5;
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
  data = self->_data;
  if (data)
  {
    [v14 encodeObject:data forKey:@"Data"];
    id v4 = v14;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v14 encodeObject:identifier forKey:@"Identifier"];
    id v4 = v14;
  }
  nextCheckDate = self->_nextCheckDate;
  if (nextCheckDate)
  {
    [v14 encodeObject:nextCheckDate forKey:@"NextCheckDate"];
    id v4 = v14;
  }
  [v4 encodeInteger:self->_suggestedValidDuration forKey:@"SuggestedValidDuration"];
  validatedEmailHashes = self->_validatedEmailHashes;
  if (validatedEmailHashes) {
    [v14 encodeObject:validatedEmailHashes forKey:@"ValidatedEmailHashes"];
  }
  validatedPhoneHashes = self->_validatedPhoneHashes;
  if (validatedPhoneHashes) {
    [v14 encodeObject:validatedPhoneHashes forKey:@"ValidatedPhoneHashes"];
  }
  validStartDate = self->_validStartDate;
  uint64_t v12 = v14;
  if (validStartDate)
  {
    [v14 encodeObject:validStartDate forKey:@"ValidStartDate"];
    uint64_t v12 = v14;
  }
  version = self->_version;
  if (version)
  {
    [v14 encodeObject:version forKey:@"Version"];
    uint64_t v12 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_altDSID);
    objc_storeStrong((id *)(v5 + 16), self->_data);
    objc_storeStrong((id *)(v5 + 24), self->_identifier);
    objc_storeStrong((id *)(v5 + 32), self->_nextCheckDate);
    *(void *)(v5 + 40) = self->_suggestedValidDuration;
    objc_storeStrong((id *)(v5 + 48), self->_validatedEmailHashes);
    objc_storeStrong((id *)(v5 + 56), self->_validatedPhoneHashes);
    objc_storeStrong((id *)(v5 + 64), self->_validStartDate);
    objc_storeStrong((id *)(v5 + 72), self->_version);
  }
  return (id)v5;
}

- (id)expirationDate
{
  v3 = [(SFAppleIDValidationRecord *)self validStartDate];

  if (v3 && [(SFAppleIDValidationRecord *)self suggestedValidDuration])
  {
    uint64_t v4 = [(SFAppleIDValidationRecord *)self validStartDate];
    uint64_t v5 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)-[SFAppleIDValidationRecord suggestedValidDuration](self, "suggestedValidDuration"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAppleIDValidationRecord *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SFAppleIDValidationRecord *)self isEqualToValidationRecord:v5];

  return v6;
}

- (BOOL)isEqualToValidationRecord:(id)a3
{
  uint64_t v4 = (SFAppleIDValidationRecord *)a3;
  if (self == v4)
  {
    char v48 = 1;
    goto LABEL_30;
  }
  uint64_t v5 = [(SFAppleIDValidationRecord *)self altDSID];
  uint64_t v6 = [(SFAppleIDValidationRecord *)v4 altDSID];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    uint64_t v8 = [(SFAppleIDValidationRecord *)self altDSID];
    v9 = [(SFAppleIDValidationRecord *)v4 altDSID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_29;
    }
  }
  v11 = [(SFAppleIDValidationRecord *)self data];
  uint64_t v12 = [(SFAppleIDValidationRecord *)v4 data];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    id v14 = [(SFAppleIDValidationRecord *)self data];
    uint64_t v15 = [(SFAppleIDValidationRecord *)v4 data];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  uint64_t v17 = [(SFAppleIDValidationRecord *)self identifier];
  uint64_t v18 = [(SFAppleIDValidationRecord *)v4 identifier];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    uint64_t v20 = [(SFAppleIDValidationRecord *)self identifier];
    v21 = [(SFAppleIDValidationRecord *)v4 identifier];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_29;
    }
  }
  v23 = [(SFAppleIDValidationRecord *)self nextCheckDate];
  uint64_t v24 = [(SFAppleIDValidationRecord *)v4 nextCheckDate];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    v25 = (void *)v24;
    uint64_t v26 = [(SFAppleIDValidationRecord *)self nextCheckDate];
    v27 = [(SFAppleIDValidationRecord *)v4 nextCheckDate];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_29;
    }
  }
  unint64_t v29 = [(SFAppleIDValidationRecord *)self suggestedValidDuration];
  if (v29 != [(SFAppleIDValidationRecord *)v4 suggestedValidDuration])
  {
LABEL_29:
    char v48 = 0;
    goto LABEL_30;
  }
  objc_super v30 = [(SFAppleIDValidationRecord *)self validatedEmailHashes];
  uint64_t v31 = [(SFAppleIDValidationRecord *)v4 validatedEmailHashes];
  if (v30 == (void *)v31)
  {
  }
  else
  {
    v32 = (void *)v31;
    v33 = [(SFAppleIDValidationRecord *)self validatedEmailHashes];
    v34 = [(SFAppleIDValidationRecord *)v4 validatedEmailHashes];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_29;
    }
  }
  v36 = [(SFAppleIDValidationRecord *)self validatedPhoneHashes];
  uint64_t v37 = [(SFAppleIDValidationRecord *)v4 validatedPhoneHashes];
  if (v36 == (void *)v37)
  {
  }
  else
  {
    v38 = (void *)v37;
    v39 = [(SFAppleIDValidationRecord *)self validatedPhoneHashes];
    v40 = [(SFAppleIDValidationRecord *)v4 validatedPhoneHashes];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_29;
    }
  }
  v42 = [(SFAppleIDValidationRecord *)self validStartDate];
  uint64_t v43 = [(SFAppleIDValidationRecord *)v4 validStartDate];
  if (v42 == (void *)v43)
  {
  }
  else
  {
    v44 = (void *)v43;
    v45 = [(SFAppleIDValidationRecord *)self validStartDate];
    v46 = [(SFAppleIDValidationRecord *)v4 validStartDate];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_29;
    }
  }
  v50 = [(SFAppleIDValidationRecord *)self version];
  uint64_t v51 = [(SFAppleIDValidationRecord *)v4 version];
  if (v50 == (void *)v51)
  {
    char v48 = 1;
    v52 = v50;
  }
  else
  {
    v52 = (void *)v51;
    v53 = [(SFAppleIDValidationRecord *)self version];
    v54 = [(SFAppleIDValidationRecord *)v4 version];
    char v48 = [v53 isEqual:v54];
  }
LABEL_30:

  return v48;
}

- (SFAppleIDValidationRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFAppleIDValidationRecord;
  uint64_t v5 = [(SFAppleIDValidationRecord *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ValidationRecordData"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ValidationRecordDataID"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"ValidationRecordNextCheckDate"];
    nextCheckDate = v5->_nextCheckDate;
    v5->_nextCheckDate = (NSDate *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"Version"];
    version = v5->_version;
    v5->_version = (NSNumber *)v12;
  }
  return v5;
}

- (id)description
{
  NSAppendPrintF();
  id v16 = 0;
  NSAppendPrintF();
  id v3 = v16;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  NSAppendPrintF();
  id v6 = v5;

  unint64_t suggestedValidDuration = self->_suggestedValidDuration;
  NSAppendPrintF();
  id v7 = v6;

  objc_super v15 = [(NSArray *)self->_validatedEmailHashes componentsJoinedByString:@", ", suggestedValidDuration];
  NSAppendPrintF();
  id v8 = v7;

  v9 = [(NSArray *)self->_validatedPhoneHashes componentsJoinedByString:@", ", v15];
  NSAppendPrintF();
  id v10 = v8;

  NSAppendPrintF();
  id v11 = v10;

  NSAppendPrintF();
  id v12 = v11;

  return v12;
}

- (BOOL)isInvalid
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(SFAppleIDValidationRecord *)self altDSID];

  if (!v4)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize()) {
          goto LABEL_28;
        }
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  id v5 = [(SFAppleIDValidationRecord *)self data];

  if (!v5)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize()) {
          goto LABEL_28;
        }
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  id v6 = [(SFAppleIDValidationRecord *)self data];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize()) {
          goto LABEL_28;
        }
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  id v8 = [(SFAppleIDValidationRecord *)self expirationDate];
  if (!v8)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize()) {
          goto LABEL_28;
        }
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
LABEL_24:
    v9 = 0;
LABEL_28:
    BOOL v10 = 1;
    goto LABEL_7;
  }
  v9 = v8;
  if ([v8 compare:v3] != 1)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }
LABEL_27:
    LogPrintF();
    goto LABEL_28;
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)needsUpdate
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(SFAppleIDValidationRecord *)self nextCheckDate];

  if (!v4)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
LABEL_15:
    LogPrintF();
LABEL_24:
    id v8 = 0;
LABEL_25:
    BOOL v11 = 1;
    goto LABEL_6;
  }
  id v5 = [(SFAppleIDValidationRecord *)self nextCheckDate];
  uint64_t v6 = [v5 compare:v3];

  if (v6 != 1)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60
      && (gLogCategory_SFAppleIDValidationRecord != -1 || _LogCategory_Initialize()))
    {
      v13 = [(SFAppleIDValidationRecord *)self nextCheckDate];
      LogPrintF();
    }
    goto LABEL_24;
  }
  uint64_t v7 = [(SFAppleIDValidationRecord *)self expirationDate];
  if (!v7)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  id v8 = v7;
  v9 = [v7 dateByAddingTimeInterval:-86400.0];
  uint64_t v10 = [v3 compare:v9];

  if (v10 != -1)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60
      && (gLogCategory_SFAppleIDValidationRecord != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_25;
  }
  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)nextCheckDate
{
  return self->_nextCheckDate;
}

- (void)setNextCheckDate:(id)a3
{
}

- (unint64_t)suggestedValidDuration
{
  return self->_suggestedValidDuration;
}

- (void)setSuggestedValidDuration:(unint64_t)a3
{
  self->_unint64_t suggestedValidDuration = a3;
}

- (NSArray)validatedEmailHashes
{
  return self->_validatedEmailHashes;
}

- (void)setValidatedEmailHashes:(id)a3
{
}

- (NSArray)validatedPhoneHashes
{
  return self->_validatedPhoneHashes;
}

- (void)setValidatedPhoneHashes:(id)a3
{
}

- (NSDate)validStartDate
{
  return self->_validStartDate;
}

- (void)setValidStartDate:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_validStartDate, 0);
  objc_storeStrong((id *)&self->_validatedPhoneHashes, 0);
  objc_storeStrong((id *)&self->_validatedEmailHashes, 0);
  objc_storeStrong((id *)&self->_nextCheckDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end