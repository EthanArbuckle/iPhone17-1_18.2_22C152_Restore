@interface PKAccountExportedTransactionInfo
+ (BOOL)supportsSecureCoding;
- (NSData)transactionData;
- (NSString)transactionDataFilename;
- (NSString)transactionDataHash;
- (PKAccountExportedTransactionInfo)initWithCoder:(id)a3;
- (PKAccountStatementMetadata)statementMetadata;
- (void)encodeWithCoder:(id)a3;
- (void)setStatementMetadata:(id)a3;
- (void)setTransactionData:(id)a3;
- (void)setTransactionDataFilename:(id)a3;
- (void)setTransactionDataHash:(id)a3;
@end

@implementation PKAccountExportedTransactionInfo

- (void)encodeWithCoder:(id)a3
{
  transactionData = self->_transactionData;
  id v5 = a3;
  [v5 encodeObject:transactionData forKey:@"transactionData"];
  [v5 encodeObject:self->_transactionDataFilename forKey:@"transactionDataFilename"];
  [v5 encodeObject:self->_transactionDataHash forKey:@"transactionDataHash"];
  [v5 encodeObject:self->_statementMetadata forKey:@"statementMetadata"];
}

- (PKAccountExportedTransactionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountExportedTransactionInfo;
  id v5 = [(PKAccountExportedTransactionInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDataFilename"];
    transactionDataFilename = v5->_transactionDataFilename;
    v5->_transactionDataFilename = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDataHash"];
    transactionDataHash = v5->_transactionDataHash;
    v5->_transactionDataHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementMetadata"];
    statementMetadata = v5->_statementMetadata;
    v5->_statementMetadata = (PKAccountStatementMetadata *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
}

- (NSString)transactionDataFilename
{
  return self->_transactionDataFilename;
}

- (void)setTransactionDataFilename:(id)a3
{
}

- (NSString)transactionDataHash
{
  return self->_transactionDataHash;
}

- (void)setTransactionDataHash:(id)a3
{
}

- (PKAccountStatementMetadata)statementMetadata
{
  return self->_statementMetadata;
}

- (void)setStatementMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementMetadata, 0);
  objc_storeStrong((id *)&self->_transactionDataHash, 0);
  objc_storeStrong((id *)&self->_transactionDataFilename, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end