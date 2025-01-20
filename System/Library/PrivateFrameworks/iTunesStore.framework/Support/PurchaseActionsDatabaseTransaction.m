@interface PurchaseActionsDatabaseTransaction
- (PurchaseActionsDatabaseTransaction)initWithDatabase:(id)a3;
- (SSSQLiteDatabase)database;
@end

@implementation PurchaseActionsDatabaseTransaction

- (PurchaseActionsDatabaseTransaction)initWithDatabase:(id)a3
{
  id v5 = a3;
  v6 = [(PurchaseActionsDatabaseTransaction *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
}

@end