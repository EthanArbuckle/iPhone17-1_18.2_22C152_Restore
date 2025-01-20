@interface SSAppPurchaseHistoryTransaction
- (SSAppPurchaseHistoryTransaction)initWithDatabase:(id)a3;
- (SSSQLiteDatabase)database;
- (void)dealloc;
@end

@implementation SSAppPurchaseHistoryTransaction

- (SSAppPurchaseHistoryTransaction)initWithDatabase:(id)a3
{
  v4 = [(SSAppPurchaseHistoryTransaction *)self init];
  if (v4) {
    v4->_database = (SSSQLiteDatabase *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSAppPurchaseHistoryTransaction;
  [(SSAppPurchaseHistoryTransaction *)&v3 dealloc];
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

@end