@interface PKActivityEventTransaction
- (BOOL)isEqualToActivityEvent:(id)a3;
- (PKActivityEventTransaction)initWithTransaction:(id)a3 unread:(BOOL)a4;
- (PKPaymentTransaction)transaction;
- (id)eventType;
- (unint64_t)hash;
@end

@implementation PKActivityEventTransaction

- (PKActivityEventTransaction)initWithTransaction:(id)a3 unread:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = NSString;
  v9 = [v7 identifier];
  v10 = [v8 stringWithFormat:@"transaction-%@", v9];

  v11 = [v7 transactionDate];
  v15.receiver = self;
  v15.super_class = (Class)PKActivityEventTransaction;
  v12 = [(PKActivityEvent *)&v15 initWithIdentifier:v10 date:v11 unread:v4];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_transaction, a3);
  }

  return v13;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PKActivityEventTransaction;
  unint64_t v3 = [(PKActivityEvent *)&v5 hash];
  return [(PKPaymentTransaction *)self->_transaction hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PKActivityEventTransaction;
    if ([(PKActivityEvent *)&v11 isEqualToActivityEvent:v5])
    {
      transaction = self->_transaction;
      id v7 = (PKPaymentTransaction *)v5[5];
      if (transaction) {
        BOOL v8 = v7 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8) {
        BOOL v9 = transaction == v7;
      }
      else {
        BOOL v9 = -[PKPaymentTransaction isEqual:](transaction, "isEqual:");
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)eventType
{
  return @"merchantTransaction";
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
}

@end