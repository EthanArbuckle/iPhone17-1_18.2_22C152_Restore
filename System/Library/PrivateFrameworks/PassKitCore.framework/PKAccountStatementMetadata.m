@interface PKAccountStatementMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenProcessed;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)closingDate;
- (NSDate)lastReportDate;
- (NSDate)openingDate;
- (NSString)accountIdentifier;
- (NSString)statementIdentifier;
- (PKAccountStatementMetadata)initWithArray:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5;
- (PKAccountStatementMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsMissingFromDevice;
- (id)reportForMissingItems;
- (int64_t)reportCount;
- (unint64_t)accountType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(unint64_t)a3;
- (void)setClosingDate:(id)a3;
- (void)setHasBeenProcessed:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setLastReportDate:(id)a3;
- (void)setOpeningDate:(id)a3;
- (void)setReportCount:(int64_t)a3;
- (void)setStatementIdentifier:(id)a3;
@end

@implementation PKAccountStatementMetadata

- (PKAccountStatementMetadata)initWithArray:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountStatementMetadata;
  v11 = [(PKAccountStatementMetadata *)&v28 init];
  v12 = v11;
  if (v11)
  {
    id v23 = v9;
    objc_storeStrong((id *)&v11->_accountIdentifier, a4);
    objc_storeStrong((id *)&v12->_statementIdentifier, a5);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[PKAccountStatementMetadataItem alloc] initWithDictionary:*(void *)(*((void *)&v24 + 1) + 8 * v18)];
          [v13 safelyAddObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      uint64_t v20 = [v13 copy];
      items = v12->_items;
      v12->_items = (NSArray *)v20;
    }
    else
    {
      items = v12->_items;
      v12->_items = 0;
    }
    id v9 = v23;
  }
  return v12;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 safelySetObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  v4 = PKAccountTypeToString(self->_accountType);
  [v3 safelySetObject:v4 forKey:@"accountType"];

  [v3 safelySetObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  v5 = PKMediumDateString(self->_openingDate);
  [v3 safelySetObject:v5 forKey:@"openingDate"];

  v6 = PKMediumDateString(self->_closingDate);
  [v3 safelySetObject:v6 forKey:@"closingDate"];

  v7 = PKISO8601DateStringFromDate(self->_lastReportDate);
  [v3 safelySetObject:v7 forKey:@"lastReportDate"];

  id v8 = [NSNumber numberWithBool:self->_hasBeenProcessed];
  [v3 safelySetObject:v8 forKey:@"hasBeenProcessed"];

  id v9 = [NSNumber numberWithInteger:self->_reportCount];
  [v3 safelySetObject:v9 forKey:@"reportCount"];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = self->_items;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
        [v10 safelyAddObject:v16];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [v3 safelySetObject:v10 forKey:@"items"];
  uint64_t v17 = (void *)[v3 copy];

  return v17;
}

- (id)itemsMissingFromDevice
{
  return [(NSArray *)self->_items pk_objectsPassingTest:&__block_literal_global_60];
}

BOOL __52__PKAccountStatementMetadata_itemsMissingFromDevice__block_invoke(uint64_t a1, void *a2)
{
  return [a2 status] != 1;
}

- (id)reportForMissingItems
{
  id v3 = [(PKAccountStatementMetadata *)self itemsMissingFromDevice];
  if ([v3 count]) {
    v4 = [[PKAccountStatementMetadataReport alloc] initWithItems:v3 accountIdentifier:self->_accountIdentifier statementIdentifier:self->_statementIdentifier openingDate:self->_openingDate closingDate:self->_closingDate];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountStatementMetadata;
  v5 = [(PKAccountStatementMetadata *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v5->_accountType = [v4 decodeIntegerForKey:@"accountType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementIdentifier"];
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastReportDate"];
    lastReportDate = v5->_lastReportDate;
    v5->_lastReportDate = (NSDate *)v14;

    v5->_hasBeenProcessed = [v4 decodeBoolForKey:@"hasBeenProcessed"];
    v5->_reportCount = [v4 decodeIntegerForKey:@"reportCount"];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_accountType forKey:@"accountType"];
  [v5 encodeObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  [v5 encodeObject:self->_openingDate forKey:@"openingDate"];
  [v5 encodeObject:self->_closingDate forKey:@"closingDate"];
  [v5 encodeObject:self->_lastReportDate forKey:@"lastReportDate"];
  [v5 encodeBool:self->_hasBeenProcessed forKey:@"hasBeenProcessed"];
  [v5 encodeInteger:self->_reportCount forKey:@"reportCount"];
  [v5 encodeObject:self->_items forKey:@"items"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v5 = (void *)v4[2];
  uint64_t v6 = self->_accountIdentifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_13;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_14;
    }
  }
  uint64_t v10 = (void *)v4[4];
  uint64_t v6 = self->_statementIdentifier;
  v11 = v10;
  if (v6 != v11)
  {
    uint64_t v8 = v11;
    if (v6 && v11)
    {
      BOOL v12 = [(NSString *)v6 isEqualToString:v11];

      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_17:
  items = self->_items;
  uint64_t v16 = (NSArray *)v4[9];
  if (items && v16)
  {
    if ((-[NSArray isEqual:](items, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (items != v16)
  {
    goto LABEL_14;
  }
  openingDate = self->_openingDate;
  uint64_t v18 = (NSDate *)v4[5];
  if (openingDate && v18)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (openingDate != v18)
  {
    goto LABEL_14;
  }
  closingDate = self->_closingDate;
  long long v20 = (NSDate *)v4[6];
  if (closingDate && v20)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (closingDate != v20)
  {
    goto LABEL_14;
  }
  lastReportDate = self->_lastReportDate;
  objc_super v22 = (NSDate *)v4[7];
  if (lastReportDate && v22)
  {
    if ((-[NSDate isEqual:](lastReportDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (lastReportDate != v22)
  {
    goto LABEL_14;
  }
  if (self->_accountType == v4[3] && self->_reportCount == v4[8])
  {
    BOOL v13 = self->_hasBeenProcessed == *((unsigned __int8 *)v4 + 8);
    goto LABEL_15;
  }
LABEL_14:
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_statementIdentifier];
  [v3 safelyAddObject:self->_items];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_openingDate];
  [v3 safelyAddObject:self->_closingDate];
  [v3 safelyAddObject:self->_lastReportDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_accountType - v4 + 32 * v4;
  int64_t v6 = self->_reportCount - v5 + 32 * v5;
  unint64_t v7 = self->_hasBeenProcessed - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  uint64_t v4 = PKAccountTypeToString(self->_accountType);
  [v3 appendFormat:@"accountType: '%@'; ", v4];

  [v3 appendFormat:@"statementIdentifier: '%@'; ", self->_statementIdentifier];
  [v3 appendFormat:@"openingDate: '%@'; ", self->_openingDate];
  [v3 appendFormat:@"closingDate: '%@'; ", self->_closingDate];
  [v3 appendFormat:@"lastReportDate: '%@'; ", self->_lastReportDate];
  objc_msgSend(v3, "appendFormat:", @"reportCount: %ld; ", self->_reportCount);
  if (self->_hasBeenProcessed) {
    unint64_t v5 = @"YES";
  }
  else {
    unint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"hasBeenProcessed: '%@'; ", v5];
  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_statementIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSArray *)self->_items copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  uint64_t v12 = [(NSDate *)self->_openingDate copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSDate *)self->_closingDate copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSDate *)self->_lastReportDate copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  *(void *)(v5 + 64) = self->_reportCount;
  *(void *)(v5 + 24) = self->_accountType;
  *(unsigned char *)(v5 + 8) = self->_hasBeenProcessed;
  return (id)v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
}

- (BOOL)hasBeenProcessed
{
  return self->_hasBeenProcessed;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->_hasBeenProcessed = a3;
}

- (NSDate)lastReportDate
{
  return self->_lastReportDate;
}

- (void)setLastReportDate:(id)a3
{
}

- (int64_t)reportCount
{
  return self->_reportCount;
}

- (void)setReportCount:(int64_t)a3
{
  self->_reportCount = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_lastReportDate, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end