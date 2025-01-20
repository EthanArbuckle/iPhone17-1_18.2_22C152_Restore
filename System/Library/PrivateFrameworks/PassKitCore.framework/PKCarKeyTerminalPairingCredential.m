@interface PKCarKeyTerminalPairingCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)productIdentifier;
- (PKAddCarKeyPassConfiguration)configuration;
- (PKCarKeyTerminalPairingCredential)initWithConfiguration:(id)a3 productIdentifier:(id)a4;
- (id)description;
@end

@implementation PKCarKeyTerminalPairingCredential

- (PKCarKeyTerminalPairingCredential)initWithConfiguration:(id)a3 productIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKPaymentCredential *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_productIdentifier, a4);
    [(PKPaymentCredential *)v10 setDeletable:1];
    if ([v8 isEqualToString:@"carKey"]) {
      [(PKPaymentCredential *)v10 setCredentialType:301];
    }
    v11 = [v7 localizedDescription];
    [(PKPaymentCredential *)v10 setLongDescription:v11];
  }
  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"configuration: '%@'; ", self->_configuration];
  [v3 appendFormat:@"productIdentifier: '%@'; ", self->_productIdentifier];
  [v3 appendFormat:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKCarKeyTerminalPairingCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKCarKeyTerminalPairingCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  if (!a3) {
    return 0;
  }
  configuration = self->_configuration;
  v4 = a3;
  BOOL v5 = [(PKAddCarKeyPassConfiguration *)configuration pairedReaderIdentifier];
  v6 = (void *)v4[13];

  uint64_t v7 = [v6 pairedReaderIdentifier];
  id v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    char v10 = v5 == (void *)v7;
  }
  else {
    char v10 = [v5 isEqual:v7];
  }

  return v10;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end