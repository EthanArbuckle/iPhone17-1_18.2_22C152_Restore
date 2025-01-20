@interface FCPurchaseLookUpEntry
- (BOOL)hasShownRenewalNotice;
- (BOOL)isNewsAppPurchase;
- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4;
- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 lastVerificationTime:(id)a6 lastVerificationFailureTime:(id)a7 purchaseType:(unint64_t)a8 purchaseValidationState:(unint64_t)a9 isNewsAppPurchase:(BOOL)a10 dateOfExpiration:(id)a11 hasShownRenewalNotice:(BOOL)a12;
- (NSDate)dateOfExpiration;
- (NSDate)lastVerificationFailureTime;
- (NSDate)lastVerificationTime;
- (NSString)identifier;
- (NSString)purchaseID;
- (NSString)tagID;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)purchaseType;
- (unint64_t)purchaseValidationState;
- (void)setDateOfExpiration:(id)a3;
- (void)setHasShownRenewalNotice:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsNewsAppPurchase:(BOOL)a3;
- (void)setLastVerificationFailureTime:(id)a3;
- (void)setLastVerificationTime:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setPurchaseType:(unint64_t)a3;
- (void)setPurchaseValidationState:(unint64_t)a3;
- (void)setTagID:(id)a3;
@end

@implementation FCPurchaseLookUpEntry

- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 lastVerificationTime:(id)a6 lastVerificationFailureTime:(id)a7 purchaseType:(unint64_t)a8 purchaseValidationState:(unint64_t)a9 isNewsAppPurchase:(BOOL)a10 dateOfExpiration:(id)a11 hasShownRenewalNotice:(BOOL)a12
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a11;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)[[NSString alloc] initWithFormat:@"purchase lookup entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purc"
          "haseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:]";
    __int16 v42 = 2080;
    v43 = "FCPurchaseLookUpEntry.m";
    __int16 v44 = 1024;
    int v45 = 41;
    __int16 v46 = 2114;
    v47 = v37;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19) {
      goto LABEL_6;
    }
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)[[NSString alloc] initWithFormat:@"purchase lookup entry must have an tag ID"];
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purc"
          "haseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:]";
    __int16 v42 = 2080;
    v43 = "FCPurchaseLookUpEntry.m";
    __int16 v44 = 1024;
    int v45 = 42;
    __int16 v46 = 2114;
    v47 = v38;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)FCPurchaseLookUpEntry;
  v24 = [(FCPurchaseLookUpEntry *)&v39 init];
  v25 = v24;
  if (v24)
  {
    if (v18)
    {
      uint64_t v26 = [v18 copy];
      identifier = v25->_identifier;
      v25->_identifier = (NSString *)v26;

      uint64_t v28 = [v19 copy];
      tagID = v25->_tagID;
      v25->_tagID = (NSString *)v28;

      uint64_t v30 = [v20 copy];
      purchaseID = v25->_purchaseID;
      v25->_purchaseID = (NSString *)v30;

      uint64_t v32 = [v21 copy];
      lastVerificationTime = v25->_lastVerificationTime;
      v25->_lastVerificationTime = (NSDate *)v32;

      uint64_t v34 = [v22 copy];
      lastVerificationFailureTime = v25->_lastVerificationFailureTime;
      v25->_lastVerificationFailureTime = (NSDate *)v34;

      v25->_purchaseType = a8;
      v25->_purchaseValidationState = a9;
      v25->_isNewsAppPurchase = a10;
      objc_storeStrong((id *)&v25->_dateOfExpiration, a11);
      v25->_hasShownRenewalNotice = a12;
    }
    else
    {

      v25 = 0;
    }
  }

  return v25;
}

- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v30 = v5;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v22 = (void *)[[NSString alloc] initWithFormat:@"purchase lookup entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    __int16 v33 = 2080;
    uint64_t v34 = "FCPurchaseLookUpEntry.m";
    __int16 v35 = 1024;
    int v36 = 69;
    __int16 v37 = 2114;
    v38 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntrypurchaseType"];
  v8 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryPurchaseValidationState"];
  v9 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryLastVerificationTime"];
  v10 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryLastVerificationFailureTime"];
  v11 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryTagID"];
  v12 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryPurchaseID"];
  v13 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryIsNewsAppPurchase"];
  char v27 = [v13 BOOLValue];

  uint64_t v28 = v7;
  int v14 = [v7 intValue];
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = (void *)[[NSString alloc] initWithFormat:@"Purchase mode cannot be unknown"];
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    __int16 v33 = 2080;
    uint64_t v34 = "FCPurchaseLookUpEntry.m";
    __int16 v35 = 1024;
    int v36 = 79;
    __int16 v37 = 2114;
    v38 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int v15 = [v8 intValue];
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)[[NSString alloc] initWithFormat:@"Purchase validation state cannot be unknown"];
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    __int16 v33 = 2080;
    uint64_t v34 = "FCPurchaseLookUpEntry.m";
    __int16 v35 = 1024;
    int v36 = 82;
    __int16 v37 = 2114;
    v38 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v16 = v15;
  v17 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryHasShownRenewalNotice"];
  char v18 = [v17 BOOLValue];

  id v19 = [v6 objectForKeyedSubscript:@"PurchaseLookUpEntryDateOfExpiration"];
  LOBYTE(v26) = v18;
  LOBYTE(v25) = v27;
  id v20 = [(FCPurchaseLookUpEntry *)self initWithEntryID:v30 tagID:v11 purchaseID:v12 lastVerificationTime:v9 lastVerificationFailureTime:v10 purchaseType:v14 purchaseValidationState:v16 isNewsAppPurchase:v25 dateOfExpiration:v19 hasShownRenewalNotice:v26];

  return v20;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCPurchaseLookUpEntry purchaseType](self, "purchaseType"));
  [v3 setObject:v4 forKey:@"PurchaseLookUpEntrypurchaseType"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCPurchaseLookUpEntry purchaseValidationState](self, "purchaseValidationState"));
  [v3 setObject:v5 forKey:@"PurchaseLookUpEntryPurchaseValidationState"];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[FCPurchaseLookUpEntry isNewsAppPurchase](self, "isNewsAppPurchase"));
  [v3 setObject:v6 forKey:@"PurchaseLookUpEntryIsNewsAppPurchase"];

  v7 = [(FCPurchaseLookUpEntry *)self tagID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, @"PurchaseLookUpEntryTagID");

  v8 = [(FCPurchaseLookUpEntry *)self purchaseID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, @"PurchaseLookUpEntryPurchaseID");

  v9 = [(FCPurchaseLookUpEntry *)self lastVerificationTime];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, @"PurchaseLookUpEntryLastVerificationTime");

  v10 = [(FCPurchaseLookUpEntry *)self lastVerificationFailureTime];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v10, @"PurchaseLookUpEntryLastVerificationFailureTime");

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FCPurchaseLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v11, @"PurchaseLookUpEntryHasShownRenewalNotice");

  v12 = [(FCPurchaseLookUpEntry *)self dateOfExpiration];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v12, @"PurchaseLookUpEntryDateOfExpiration");

  v13 = (void *)[v3 copy];
  return v13;
}

- (id)description
{
  unint64_t v3 = [(FCPurchaseLookUpEntry *)self purchaseType];
  if (v3 > 2) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = off_1E5B59208[v3];
  }
  unint64_t v4 = [(FCPurchaseLookUpEntry *)self purchaseValidationState];
  if (v4 > 4) {
    int v15 = 0;
  }
  else {
    int v15 = off_1E5B59220[v4];
  }
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(FCPurchaseLookUpEntry *)self identifier];
  v8 = [(FCPurchaseLookUpEntry *)self tagID];
  v9 = [(FCPurchaseLookUpEntry *)self purchaseID];
  v10 = [(FCPurchaseLookUpEntry *)self lastVerificationTime];
  v11 = [(FCPurchaseLookUpEntry *)self lastVerificationFailureTime];
  v12 = [(FCPurchaseLookUpEntry *)self dateOfExpiration];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; id: %@ tagID: %@ purchaseID: %@ purchaseType: %@ validationState: %@ lastVerificationTime: %@ lastVerificationFailureTime: %@ dateOfExpiration: %@ isNewsAppPurchase: %d hasShownRenewalNotice: %d>",
    v6,
    self,
    v7,
    v8,
    v9,
    v16,
    v15,
    v10,
    v11,
    v12,
    [(FCPurchaseLookUpEntry *)self isNewsAppPurchase],
  v13 = [(FCPurchaseLookUpEntry *)self hasShownRenewalNotice]);

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v20 = [FCPurchaseLookUpEntry alloc];
  id v23 = [(FCPurchaseLookUpEntry *)self identifier];
  id v19 = (void *)[v23 copy];
  id v22 = [(FCPurchaseLookUpEntry *)self tagID];
  char v18 = (void *)[v22 copy];
  id v21 = [(FCPurchaseLookUpEntry *)self purchaseID];
  v17 = (void *)[v21 copy];
  unint64_t v4 = [(FCPurchaseLookUpEntry *)self lastVerificationTime];
  id v5 = (void *)[v4 copy];
  uint64_t v6 = [(FCPurchaseLookUpEntry *)self lastVerificationFailureTime];
  v7 = (void *)[v6 copy];
  unint64_t v8 = [(FCPurchaseLookUpEntry *)self purchaseType];
  unint64_t v9 = [(FCPurchaseLookUpEntry *)self purchaseValidationState];
  BOOL v10 = [(FCPurchaseLookUpEntry *)self isNewsAppPurchase];
  v11 = [(FCPurchaseLookUpEntry *)self dateOfExpiration];
  v12 = (void *)[v11 copy];
  LOBYTE(v16) = [(FCPurchaseLookUpEntry *)self hasShownRenewalNotice];
  LOBYTE(v15) = v10;
  v13 = [(FCPurchaseLookUpEntry *)v20 initWithEntryID:v19 tagID:v18 purchaseID:v17 lastVerificationTime:v5 lastVerificationFailureTime:v7 purchaseType:v8 purchaseValidationState:v9 isNewsAppPurchase:v15 dateOfExpiration:v12 hasShownRenewalNotice:v16];

  return v13;
}

- (unint64_t)purchaseType
{
  return self->_purchaseType;
}

- (void)setPurchaseType:(unint64_t)a3
{
  self->_purchaseType = a3;
}

- (unint64_t)purchaseValidationState
{
  return self->_purchaseValidationState;
}

- (void)setPurchaseValidationState:(unint64_t)a3
{
  self->_purchaseValidationState = a3;
}

- (NSDate)lastVerificationTime
{
  return self->_lastVerificationTime;
}

- (void)setLastVerificationTime:(id)a3
{
}

- (NSDate)lastVerificationFailureTime
{
  return self->_lastVerificationFailureTime;
}

- (void)setLastVerificationFailureTime:(id)a3
{
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isNewsAppPurchase
{
  return self->_isNewsAppPurchase;
}

- (void)setIsNewsAppPurchase:(BOOL)a3
{
  self->_isNewsAppPurchase = a3;
}

- (NSDate)dateOfExpiration
{
  return self->_dateOfExpiration;
}

- (void)setDateOfExpiration:(id)a3
{
}

- (BOOL)hasShownRenewalNotice
{
  return self->_hasShownRenewalNotice;
}

- (void)setHasShownRenewalNotice:(BOOL)a3
{
  self->_hasShownRenewalNotice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfExpiration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_lastVerificationFailureTime, 0);
  objc_storeStrong((id *)&self->_lastVerificationTime, 0);
}

@end