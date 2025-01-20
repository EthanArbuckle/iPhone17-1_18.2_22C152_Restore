@interface PPReadTransaction
- (PPReadTransaction)initWithHandle:(id)a3;
- (_PASSqliteDatabase)db;
@end

@implementation PPReadTransaction

- (void).cxx_destruct
{
}

- (PPReadTransaction)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPReadTransaction;
  v6 = [(PPReadTransaction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_db, a3);
  }

  return v7;
}

- (_PASSqliteDatabase)db
{
  return (_PASSqliteDatabase *)objc_getProperty(self, a2, 8, 1);
}

@end