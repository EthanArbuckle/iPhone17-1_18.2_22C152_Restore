@interface RTWalletManagerNotificationPaymentUsed
- (CLLocation)location;
- (NSDate)date;
- (NSNumber)muid;
- (NSNumber)provider;
- (NSString)passIdentifier;
- (NSString)transactionIdentifier;
- (RTWalletManagerNotificationPaymentUsed)initWithPassIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5;
@end

@implementation RTWalletManagerNotificationPaymentUsed

- (RTWalletManagerNotificationPaymentUsed)initWithPassIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RTWalletManagerNotificationPaymentUsed;
  v11 = [(RTNotification *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    passIdentifier = v11->_passIdentifier;
    v11->_passIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    transactionIdentifier = v11->_transactionIdentifier;
    v11->_transactionIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F87FF0]];
    date = v11->_date;
    v11->_date = (NSDate *)v16;

    uint64_t v18 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F88000]];
    location = v11->_location;
    v11->_location = (CLLocation *)v18;

    uint64_t v20 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F87FE8]];
    muid = v11->_muid;
    v11->_muid = (NSNumber *)v20;

    uint64_t v22 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F87FF8]];
    provider = v11->_provider;
    v11->_provider = (NSNumber *)v22;
  }
  return v11;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSNumber)muid
{
  return self->_muid;
}

- (NSNumber)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);

  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

@end