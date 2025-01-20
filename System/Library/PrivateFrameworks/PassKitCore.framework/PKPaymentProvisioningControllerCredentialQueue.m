@interface PKPaymentProvisioningControllerCredentialQueue
- (PKPaymentProvisioningControllerCredentialQueue)init;
- (id)completedCredentials;
- (id)credentials;
- (id)nextCredentialToProvision;
- (unint64_t)completedCount;
- (unint64_t)count;
- (unint64_t)remaining;
- (void)removeCredential:(id)a3;
- (void)setCredentialsToProvision:(id)a3;
- (void)setCurrentCredential:(id)a3;
@end

@implementation PKPaymentProvisioningControllerCredentialQueue

- (PKPaymentProvisioningControllerCredentialQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentProvisioningControllerCredentialQueue;
  v2 = [(PKPaymentProvisioningControllerCredentialQueue *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completedCredentials = v3->_completedCredentials;
    v3->_completedCredentials = v4;
  }
  return v3;
}

- (void)setCredentialsToProvision:(id)a3
{
  self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  v4 = (NSMutableArray *)[a3 mutableCopy];
  credentials = self->_credentials;
  self->_credentials = v4;

  completedCredentials = self->_completedCredentials;
  [(NSMutableArray *)completedCredentials removeAllObjects];
}

- (void)removeCredential:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = [(NSMutableArray *)self->_credentials indexOfObject:v4];
    id v4 = v11;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      [(NSMutableArray *)self->_completedCredentials addObject:v11];
      [(NSMutableArray *)self->_credentials removeObjectAtIndex:v6];
      id v4 = v11;
      unint64_t currentIndex = self->_currentIndex;
      if (currentIndex != 0x7FFFFFFFFFFFFFFFLL && v6 <= currentIndex)
      {
        unint64_t v8 = currentIndex - 1;
        BOOL v9 = currentIndex == 0;
        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v9) {
          unint64_t v10 = v8;
        }
        self->_unint64_t currentIndex = v10;
      }
    }
  }
}

- (id)nextCredentialToProvision
{
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = currentIndex + 1;
  }
  unint64_t v5 = [(NSMutableArray *)self->_credentials count];
  unint64_t v6 = 0;
  if (v4 < v5)
  {
    unint64_t v6 = [(NSMutableArray *)self->_credentials objectAtIndex:v4];
    self->_unint64_t currentIndex = v4;
  }
  return v6;
}

- (void)setCurrentCredential:(id)a3
{
  if (a3) {
    unint64_t v4 = -[NSMutableArray indexOfObject:](self->_credentials, "indexOfObject:");
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_unint64_t currentIndex = v4;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_credentials count];
}

- (unint64_t)remaining
{
  unint64_t result = [(NSMutableArray *)self->_credentials count];
  if (result)
  {
    unint64_t currentIndex = self->_currentIndex;
    if (currentIndex == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = ~currentIndex;
    }
    result += v5;
  }
  return result;
}

- (unint64_t)completedCount
{
  return [(NSMutableArray *)self->_completedCredentials count];
}

- (id)credentials
{
  v2 = (void *)[(NSMutableArray *)self->_credentials copy];
  return v2;
}

- (id)completedCredentials
{
  v2 = (void *)[(NSMutableArray *)self->_completedCredentials copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedCredentials, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end