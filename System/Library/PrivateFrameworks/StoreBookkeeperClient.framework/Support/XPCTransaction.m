@interface XPCTransaction
- (NSString)identifier;
- (XPCTransaction)initWithIdentifier:(id)a3;
- (id)description;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation XPCTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  [(XPCTransaction *)self close];
  v3.receiver = self;
  v3.super_class = (Class)XPCTransaction;
  [(XPCTransaction *)&v3 dealloc];
}

- (void)close
{
  if (self->_transaction)
  {
    self->_transaction = 0;
    _objc_release_x1();
  }
}

- (void)open
{
  if (!self->_transaction)
  {
    [(NSString *)self->_identifier UTF8String];
    self->_transaction = (OS_os_transaction *)os_transaction_create();
    _objc_release_x1();
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)XPCTransaction;
  objc_super v3 = [(XPCTransaction *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@ identifier = %@ %@", v3, self->_identifier, self->_transaction];

  return v4;
}

- (XPCTransaction)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XPCTransaction;
  objc_super v6 = [(XPCTransaction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

@end