@interface STSTransactionEndEvent
- (BOOL)background;
- (NSDictionary)parsedInfo;
- (NSString)keyIdentifier;
- (NSString)readerIdentifier;
- (NSString)transactionIdentifier;
- (STSCredential)credential;
- (STSTransactionEndEvent)initWithCredential:(id)a3 andDigitalCarKeyEndEvent:(id)a4;
- (STSTransactionEndEvent)initWithCredential:(id)a3 andNearFieldEndEvent:(id)a4;
- (unint64_t)status;
- (void)setBackground:(BOOL)a3;
- (void)setCredential:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setParsedInfo:(id)a3;
- (void)setReaderIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation STSTransactionEndEvent

- (STSTransactionEndEvent)initWithCredential:(id)a3 andNearFieldEndEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STSTransactionEndEvent;
  v8 = [(STSTransactionEndEvent *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(STSTransactionEndEvent *)v8 setCredential:v6];
    -[STSTransactionEndEvent setBackground:](v9, "setBackground:", [v7 background]);
    v10 = [v7 parsedInfo];
    [(STSTransactionEndEvent *)v9 setParsedInfo:v10];

    v11 = [v7 readerIdentifier];
    [(STSTransactionEndEvent *)v9 setReaderIdentifier:v11];

    v12 = [v7 keyIdentifier];
    [(STSTransactionEndEvent *)v9 setKeyIdentifier:v12];

    v13 = [v7 transactionIdentifier];
    [(STSTransactionEndEvent *)v9 setTransactionIdentifier:v13];

    if ([v7 didError]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    [(STSTransactionEndEvent *)v9 setStatus:v14];
    unsigned __int16 v15 = [v7 result] + 4092;
    if (v15 <= 2u) {
      [(STSTransactionEndEvent *)v9 setStatus:v15 + 8];
    }
  }

  return v9;
}

- (STSTransactionEndEvent)initWithCredential:(id)a3 andDigitalCarKeyEndEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STSTransactionEndEvent;
  v8 = [(STSTransactionEndEvent *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(STSTransactionEndEvent *)v8 setBackground:0];
    [(STSTransactionEndEvent *)v9 setReaderIdentifier:0];
    [(STSTransactionEndEvent *)v9 setTransactionIdentifier:0];
    [(STSTransactionEndEvent *)v9 setParsedInfo:0];
    [(STSTransactionEndEvent *)v9 setCredential:v6];
    v10 = [v7 keyIdentifier];
    [(STSTransactionEndEvent *)v9 setKeyIdentifier:v10];

    if ([v7 didError]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    [(STSTransactionEndEvent *)v9 setStatus:v11];
    uint64_t v12 = [v7 result] - 61444;
    if (v12 <= 2) {
      [(STSTransactionEndEvent *)v9 setStatus:v12 + 8];
    }
  }

  return v9;
}

- (STSCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSDictionary)parsedInfo
{
  return self->_parsedInfo;
}

- (void)setParsedInfo:(id)a3
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

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void)setReaderIdentifier:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_parsedInfo, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end