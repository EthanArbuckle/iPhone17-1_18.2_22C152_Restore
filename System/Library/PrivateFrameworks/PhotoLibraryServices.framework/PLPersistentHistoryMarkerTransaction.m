@interface PLPersistentHistoryMarkerTransaction
- (NSString)description;
- (PLPersistentHistoryMarkerTransaction)initWithTransaction:(id)a3;
- (id)overrride_changeRequestForFetching;
- (id)overrride_shortDescription;
@end

@implementation PLPersistentHistoryMarkerTransaction

- (void).cxx_destruct
{
}

- (id)overrride_shortDescription
{
  return (id)[NSString stringWithFormat:@".Transaction(%@)", self->_transaction];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PLPersistentHistoryMarkerTransaction(%@)", self->_transaction];
}

- (id)overrride_changeRequestForFetching
{
  return (id)[MEMORY[0x1E4F1C160] fetchHistoryAfterTransaction:self->_transaction];
}

- (PLPersistentHistoryMarkerTransaction)initWithTransaction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerTransaction;
  v6 = [(PLPersistentHistoryMarkerTransaction *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v8 = v7;
  }

  return v7;
}

@end