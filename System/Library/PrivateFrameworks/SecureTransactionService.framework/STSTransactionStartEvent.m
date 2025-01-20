@interface STSTransactionStartEvent
- (BOOL)background;
- (NSString)spIdentifier;
- (STSCredential)credential;
- (STSTransactionStartEvent)initWithCredential:(id)a3 andDigitalCarKeyStartEvent:(id)a4;
- (STSTransactionStartEvent)initWithCredential:(id)a3 andNearFieldStartEvent:(id)a4;
- (unsigned)transactionMode;
- (void)setBackground:(BOOL)a3;
- (void)setCredential:(id)a3;
- (void)setSpIdentifier:(id)a3;
- (void)setTransactionMode:(unsigned __int16)a3;
@end

@implementation STSTransactionStartEvent

- (STSCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (unsigned)transactionMode
{
  return self->_transactionMode;
}

- (void)setTransactionMode:(unsigned __int16)a3
{
  self->_transactionMode = a3;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (void)setSpIdentifier:(id)a3
{
}

- (BOOL)background
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (STSTransactionStartEvent)initWithCredential:(id)a3 andNearFieldStartEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSTransactionStartEvent;
  v8 = [(STSTransactionStartEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(STSTransactionStartEvent *)v8 setCredential:v6];
    -[STSTransactionStartEvent setBackground:](v9, "setBackground:", [v7 background]);
  }

  return v9;
}

- (STSTransactionStartEvent)initWithCredential:(id)a3 andDigitalCarKeyStartEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSTransactionStartEvent;
  v8 = [(STSTransactionStartEvent *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(STSTransactionStartEvent *)v8 setCredential:v6];
    [(STSTransactionStartEvent *)v9 setBackground:0];
    [(STSTransactionStartEvent *)v9 setTransactionMode:0];
    v10 = [v7 spIdentifier];
    [(STSTransactionStartEvent *)v9 setSpIdentifier:v10];
  }
  return v9;
}

@end