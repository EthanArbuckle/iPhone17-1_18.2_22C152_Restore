@interface PDPaymentTransactionProcessorConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSString)transactionIdentifier;
- (PDPaymentTransactionProcessorConfiguration)initWithTransactionIdentifier:(id)a3 updateReasons:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)updateReasons;
@end

@implementation PDPaymentTransactionProcessorConfiguration

- (PDPaymentTransactionProcessorConfiguration)initWithTransactionIdentifier:(id)a3 updateReasons:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPaymentTransactionProcessorConfiguration;
  v8 = [(PDPaymentTransactionProcessorConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transactionIdentifier, a3);
    v9->_updateReasons = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDPaymentTransactionProcessorConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PDPaymentTransactionProcessorConfiguration *)self isEqualToConfiguration:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_updateReasons == *((void *)v4 + 2))
  {
    BOOL v6 = (void *)*((void *)v4 + 1);
    id v7 = self->_transactionIdentifier;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      unsigned __int8 v10 = 0;
      if (v7 && v8) {
        unsigned __int8 v10 = [(NSString *)v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 safelyAddObject:self->_transactionIdentifier];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
}

@end