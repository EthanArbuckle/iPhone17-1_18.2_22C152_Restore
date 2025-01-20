@interface WBSPasswordBreachContext
- (WBSPasswordBreachConfiguration)configuration;
- (WBSPasswordBreachContext)initWithConfiguration:(id)a3 store:(id)a4;
- (WBSPasswordBreachCryptographicOperations)cryptographicOperations;
- (WBSPasswordBreachStore)store;
@end

@implementation WBSPasswordBreachContext

- (WBSPasswordBreachContext)initWithConfiguration:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachContext;
  v9 = [(WBSPasswordBreachContext *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = [[WBSPasswordBreachCryptographicOperations alloc] initWithConfiguration:v7];
    cryptographicOperations = v10->_cryptographicOperations;
    v10->_cryptographicOperations = v11;

    objc_storeStrong((id *)&v10->_store, a4);
    v13 = v10;
  }

  return v10;
}

- (WBSPasswordBreachConfiguration)configuration
{
  return self->_configuration;
}

- (WBSPasswordBreachCryptographicOperations)cryptographicOperations
{
  return self->_cryptographicOperations;
}

- (WBSPasswordBreachStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_cryptographicOperations, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end