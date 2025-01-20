@interface PKValueAddedServiceTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)didSucceed;
- (NSDate)transactionDate;
- (NSNumber)terminalApplicationVersion;
- (NSString)identifier;
- (NSString)merchantURL;
- (PKValueAddedMerchant)merchant;
- (PKValueAddedServiceTransaction)init;
- (PKValueAddedServiceTransaction)initWithCoder:(id)a3;
- (id)description;
- (int64_t)error;
- (int64_t)terminalMode;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)setError:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setMerchantURL:(id)a3;
- (void)setTerminalApplicationVersion:(id)a3;
- (void)setTerminalMode:(int64_t)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation PKValueAddedServiceTransaction

- (PKValueAddedServiceTransaction)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKValueAddedServiceTransaction;
  v2 = [(PKValueAddedServiceTransaction *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  merchant = self->_merchant;
  identifier = self->_identifier;
  merchantURL = self->_merchantURL;
  terminalApplicationVersion = self->_terminalApplicationVersion;
  v14 = _PKEnumValueToString(self->_terminalMode, @"PKValueAddedServiceTerminalMode", @"PKValueAddedServiceTerminalModeUnknown, PKValueAddedServiceTerminalModeSignupOnly, PKValueAddedServiceTerminalModeVASOnly, PKValueAddedServiceTerminalModeVASAndPayment, PKValueAddedServiceTerminalModeVASOrPayment", v9, v10, v11, v12, v13, 0);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@; merchant: %@; merchantURL: %@; terminalApplicationVersion: %@; terminalMode: %@; didSucceed: %d; >",
    v4,
    self,
    identifier,
    merchant,
    merchantURL,
    terminalApplicationVersion,
    v14,
  v15 = self->_didSucceed);

  return v15;
}

- (PKValueAddedServiceTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKValueAddedServiceTransaction;
  v5 = [(PKValueAddedServiceTransaction *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionMerchantKey"];
    merchant = v5->_merchant;
    v5->_merchant = (PKValueAddedMerchant *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionMerchantURLKey"];
    merchantURL = v5->_merchantURL;
    v5->_merchantURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionTerminalApplicationVersionKey"];
    terminalApplicationVersion = v5->_terminalApplicationVersion;
    v5->_terminalApplicationVersion = (NSNumber *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionTerminalModeKey"];
    v5->_terminalMode = [v14 integerValue];

    v5->_didSucceed = [v4 decodeBoolForKey:@"PKValueAddedServiceTransactionDidSucceedKey"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionDateKey"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedServiceTransactionErrorKey"];
    v5->_error = [v17 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"PKValueAddedServiceTransactionIdentifierKey"];
  [v5 encodeObject:self->_merchant forKey:@"PKValueAddedServiceTransactionMerchantKey"];
  [v5 encodeObject:self->_merchantURL forKey:@"PKValueAddedServiceTransactionMerchantURLKey"];
  [v5 encodeObject:self->_terminalApplicationVersion forKey:@"PKValueAddedServiceTransactionTerminalApplicationVersionKey"];
  uint64_t v6 = [NSNumber numberWithInteger:self->_terminalMode];
  [v5 encodeObject:v6 forKey:@"PKValueAddedServiceTransactionTerminalModeKey"];

  [v5 encodeBool:self->_didSucceed forKey:@"PKValueAddedServiceTransactionDidSucceedKey"];
  [v5 encodeObject:self->_transactionDate forKey:@"PKValueAddedServiceTransactionDateKey"];
  id v7 = [NSNumber numberWithInteger:self->_error];
  [v5 encodeObject:v7 forKey:@"PKValueAddedServiceTransactionErrorKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKValueAddedMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)merchantURL
{
  return self->_merchantURL;
}

- (void)setMerchantURL:(id)a3
{
}

- (NSNumber)terminalApplicationVersion
{
  return self->_terminalApplicationVersion;
}

- (void)setTerminalApplicationVersion:(id)a3
{
}

- (int64_t)terminalMode
{
  return self->_terminalMode;
}

- (void)setTerminalMode:(int64_t)a3
{
  self->_terminalMode = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (int64_t)error
{
  return self->_error;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_terminalApplicationVersion, 0);
  objc_storeStrong((id *)&self->_merchantURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
}

@end