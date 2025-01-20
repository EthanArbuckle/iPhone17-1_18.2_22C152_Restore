@interface _PASSqlReadTransaction
- (_PASSqlReadTransaction)initWithHandle:(id)a3;
- (_PASSqliteDatabase)db;
@end

@implementation _PASSqlReadTransaction

- (void).cxx_destruct
{
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (_PASSqlReadTransaction)initWithHandle:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_PASSqliteTransaction.m", 25, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_PASSqlReadTransaction;
  v7 = [(_PASSqlReadTransaction *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
}

@end