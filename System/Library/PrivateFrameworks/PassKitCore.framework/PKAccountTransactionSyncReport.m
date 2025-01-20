@interface PKAccountTransactionSyncReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKAccountTransactionSyncReport)initWithCoder:(id)a3;
- (PKAccountTransactionSyncReport)initWithItems:(id)a3 accountIdentifier:(id)a4;
- (id)_itemArrayRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountTransactionSyncReport

- (PKAccountTransactionSyncReport)initWithItems:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountTransactionSyncReport;
  v8 = [(PKAccountReport *)&v11 initWithAccountIdentifier:a4 reportType:1];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_items, a3);
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountTransactionSyncReport;
  v3 = [(PKAccountReport *)&v8 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PKAccountTransactionSyncReport *)self _itemArrayRepresentation];
  [v4 safelySetObject:v5 forKey:@"transactionSyncReport"];

  v6 = (void *)[v4 copy];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransactionSyncReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountTransactionSyncReport;
  v5 = [(PKAccountReport *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeArrayOfObjectsOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountTransactionSyncReport;
  id v4 = a3;
  [(PKAccountReport *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_items, @"items", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountTransactionSyncReport;
  if ([(PKAccountReport *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    items = self->_items;
    v6 = (NSArray *)v4[3];
    if (items) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      char v9 = items == v6;
    }
    else {
      char v9 = -[NSArray isEqual:](items, "isEqual:");
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_items];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountTransactionSyncReport;
  id v4 = [(PKAccountReport *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKAccountReport *)self accountIdentifier];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", v4];

  unint64_t v5 = PKAccountReportTypeToString([(PKAccountReport *)self reportType]);
  [v3 appendFormat:@"reportType: '%@'; ", v5];

  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKAccountTransactionSyncReport;
  unint64_t v5 = -[PKAccountReport copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)_itemArrayRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
        [v3 safelyAddObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_super v10 = (void *)[v3 copy];
  return v10;
}

- (void).cxx_destruct
{
}

@end