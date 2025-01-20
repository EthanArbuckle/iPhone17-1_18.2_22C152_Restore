@interface PKAccountStatementMetadataReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)closingDate;
- (NSDate)openingDate;
- (NSString)statementIdentifier;
- (PKAccountStatementMetadataReport)initWithCoder:(id)a3;
- (PKAccountStatementMetadataReport)initWithItems:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5 openingDate:(id)a6 closingDate:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountStatementMetadataReport

- (PKAccountStatementMetadataReport)initWithItems:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5 openingDate:(id)a6 closingDate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountStatementMetadataReport;
  v17 = [(PKAccountReport *)&v20 initWithAccountIdentifier:a4 reportType:2];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_statementIdentifier, a5);
    objc_storeStrong((id *)&v18->_openingDate, a6);
    objc_storeStrong((id *)&v18->_closingDate, a7);
    objc_storeStrong((id *)&v18->_items, a3);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 safelySetObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  v4 = PKISO8601DateStringFromDate(self->_openingDate);
  [v3 safelySetObject:v4 forKey:@"openingDate"];

  v5 = PKISO8601DateStringFromDate(self->_closingDate);
  [v3 safelySetObject:v5 forKey:@"closingDate"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = self->_items;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
        [v6 safelyAddObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [v3 safelySetObject:v6 forKey:@"items"];
  v17.receiver = self;
  v17.super_class = (Class)PKAccountStatementMetadataReport;
  id v13 = [(PKAccountReport *)&v17 dictionaryRepresentation];
  id v14 = (void *)[v13 mutableCopy];

  [v14 safelySetObject:v3 forKey:@"statementMetadataReport"];
  id v15 = (void *)[v14 copy];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadataReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountStatementMetadataReport;
  v5 = [(PKAccountReport *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementIdentifier"];
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountStatementMetadataReport;
  id v4 = a3;
  [(PKAccountReport *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_statementIdentifier, @"statementIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_openingDate forKey:@"openingDate"];
  [v4 encodeObject:self->_closingDate forKey:@"closingDate"];
  [v4 encodeObject:self->_items forKey:@"items"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKAccountStatementMetadataReport;
  if (![(PKAccountReport *)&v21 isEqual:v4]) {
    goto LABEL_27;
  }
  objc_super v5 = (void *)v4[3];
  uint64_t v6 = self->_statementIdentifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {

      goto LABEL_27;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_27;
    }
  }
  items = self->_items;
  v12 = (NSArray *)v4[6];
  if (items) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (items != v12) {
      goto LABEL_27;
    }
  }
  else
  {
    char v14 = -[NSArray isEqual:](items, "isEqual:");
    if ((v14 & 1) == 0) {
      goto LABEL_27;
    }
  }
  openingDate = self->_openingDate;
  id v16 = (NSDate *)v4[4];
  if (!openingDate || !v16)
  {
    if (openingDate == v16) {
      goto LABEL_23;
    }
LABEL_27:
    char v19 = 0;
    goto LABEL_28;
  }
  if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  closingDate = self->_closingDate;
  objc_super v18 = (NSDate *)v4[5];
  if (closingDate && v18) {
    char v19 = -[NSDate isEqual:](closingDate, "isEqual:");
  }
  else {
    char v19 = closingDate == v18;
  }
LABEL_28:

  return v19;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_statementIdentifier];
  [v3 safelyAddObject:self->_items];
  [v3 safelyAddObject:self->_openingDate];
  [v3 safelyAddObject:self->_closingDate];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountStatementMetadataReport;
  id v4 = [(PKAccountReport *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKAccountReport *)self accountIdentifier];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", v4];

  unint64_t v5 = PKAccountReportTypeToString([(PKAccountReport *)self reportType]);
  [v3 appendFormat:@"reportType: '%@'; ", v5];

  [v3 appendFormat:@"statementIdentifier: '%@'; ", self->_statementIdentifier];
  [v3 appendFormat:@"openingDate: '%@'; ", self->_openingDate];
  [v3 appendFormat:@"closingDate: '%@'; ", self->_closingDate];
  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataReport;
  unint64_t v5 = -[PKAccountReport copyWithZone:](&v15, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_statementIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSArray *)self->_items copyWithZone:a3];
  BOOL v9 = (void *)v5[6];
  v5[6] = v8;

  uint64_t v10 = [(NSDate *)self->_openingDate copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSDate *)self->_closingDate copyWithZone:a3];
  BOOL v13 = (void *)v5[5];
  v5[5] = v12;

  return v5;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end