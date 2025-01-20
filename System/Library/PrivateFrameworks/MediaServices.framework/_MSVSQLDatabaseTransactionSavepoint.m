@interface _MSVSQLDatabaseTransactionSavepoint
- (BOOL)commit;
- (NSString)description;
- (NSString)name;
- (void)dealloc;
@end

@implementation _MSVSQLDatabaseTransactionSavepoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)commit
{
  return [(MSVSQLDatabaseTransaction *)self->_transaction _releaseSavepoint:self];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p name=%@ transaction=%@>", objc_opt_class(), self, self->_name, self->_transaction];
}

- (void)dealloc
{
  [(_MSVSQLDatabaseTransactionSavepoint *)self commit];
  v3.receiver = self;
  v3.super_class = (Class)_MSVSQLDatabaseTransactionSavepoint;
  [(_MSVSQLDatabaseTransactionSavepoint *)&v3 dealloc];
}

@end