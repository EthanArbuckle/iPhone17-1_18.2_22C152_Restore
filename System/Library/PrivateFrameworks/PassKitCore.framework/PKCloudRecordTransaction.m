@interface PKCloudRecordTransaction
+ (BOOL)supportsSecureCoding;
+ (id)dateFormatter;
- (PKCloudRecordTransaction)initWithCoder:(id)a3;
- (PKPaymentTransaction)transaction;
- (id)_descriptionWithIncludeItem:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)item;
- (int64_t)compare:(id)a3;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKCloudRecordTransaction

+ (id)dateFormatter
{
  if (qword_1E92C3130 != -1) {
    dispatch_once(&qword_1E92C3130, &__block_literal_global_219);
  }
  v2 = (void *)_MergedGlobals_1_8;
  return v2;
}

uint64_t __41__PKCloudRecordTransaction_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_1_8;
  _MergedGlobals_1_8 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_1_8;
  return [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
}

- (id)item
{
  return self->_transaction;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordTransaction;
  v5 = [(PKCloudRecordObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transcation"];
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordTransaction;
  id v4 = a3;
  [(PKCloudRecordObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, @"transcation", v5.receiver, v5.super_class);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = [(PKCloudRecordTransaction *)self transaction];
    uint64_t v6 = [v5 transactionDate];
    v7 = [v4 transaction];
    v8 = [v7 transactionDate];
    int64_t v9 = [v6 compare:v8];
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (id)descriptionWithItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = -[PKCloudRecordTransaction _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordTransaction;
  uint64_t v6 = [(PKCloudRecordObject *)&v8 descriptionWithItem:v3];
  [v5 appendFormat:@"\n%@", v6];

  return v5;
}

- (id)description
{
  BOOL v3 = [(PKCloudRecordTransaction *)self _descriptionWithIncludeItem:0];
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordTransaction;
  id v4 = [(PKCloudRecordObject *)&v6 description];
  [v3 appendFormat:@"\n%@", v4];

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] string];
  objc_super v6 = v5;
  if (self->_transaction)
  {
    if (v3)
    {
      v7 = [(id)objc_opt_class() dateFormatter];
      objc_super v8 = [(PKPaymentTransaction *)self->_transaction transactionDate];
      int64_t v9 = [v7 stringFromDate:v8];

      [v6 appendFormat:@"transaction: (%@)\n%@\n", v9, self->_transaction];
    }
  }
  else
  {
    [v5 appendFormat:@"No associated transaction in database\n"];
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordTransaction;
    [(PKCloudRecordObject *)&v10 applyCloudRecordObject:v4];
    id v5 = v4;
    objc_super v6 = v5;
    if (!self->_transaction)
    {
      v7 = [v5 transaction];

      if (v7)
      {
        objc_super v8 = [v6 transaction];
        transaction = self->_transaction;
        self->_transaction = v8;
      }
    }
  }
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end