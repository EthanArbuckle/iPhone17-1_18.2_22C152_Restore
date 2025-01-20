@interface STPersistenceOperation
- (STPersistenceControllerProtocol)persistenceController;
- (STPersistenceOperation)initWithPersistenceController:(id)a3;
- (void)setPersistenceController:(id)a3;
@end

@implementation STPersistenceOperation

- (STPersistenceOperation)initWithPersistenceController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STPersistenceOperation;
  v6 = [(STOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistenceController, a3);
  }

  return v7;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end