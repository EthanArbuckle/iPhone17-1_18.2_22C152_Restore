@interface STSAuxiliaryTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)didSucceed;
- (NSError)error;
- (STSAuxiliaryCredential)credential;
- (STSAuxiliaryTransaction)initWithCoder:(id)a3;
- (STSAuxiliaryTransaction)initWithCredential:(id)a3 error:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSAuxiliaryTransaction

- (STSAuxiliaryTransaction)initWithCredential:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSAuxiliaryTransaction;
  v9 = [(STSAuxiliaryTransaction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credential, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (BOOL)didSucceed
{
  return self->_error == 0;
}

- (STSAuxiliaryTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSAuxiliaryTransaction;
  v5 = [(STSAuxiliaryTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSAuxiliaryTransactionKeyCredential"];
    credential = v5->_credential;
    v5->_credential = (STSAuxiliaryCredential *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSAuxiliaryTransactionKeyError"];
    error = v5->_error;
    v5->_error = (NSError *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  credential = self->_credential;
  id v5 = a3;
  [v5 encodeObject:credential forKey:@"STSAuxiliaryTransactionKeyCredential"];
  [v5 encodeObject:self->_error forKey:@"STSAuxiliaryTransactionKeyError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSAuxiliaryCredential)credential
{
  return self->_credential;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end