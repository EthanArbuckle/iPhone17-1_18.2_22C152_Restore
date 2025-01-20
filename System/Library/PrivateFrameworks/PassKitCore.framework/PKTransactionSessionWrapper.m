@interface PKTransactionSessionWrapper
- (NFSession)nfSession;
- (PKTransactionSessionWrapper)init;
- (PKTransactionSessionWrapper)initWithNFSession:(id)a3;
- (PKTransactionSessionWrapper)initWithSTSSession:(id)a3;
- (STSSession)stsSession;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
@end

@implementation PKTransactionSessionWrapper

- (PKTransactionSessionWrapper)init
{
  return 0;
}

- (PKTransactionSessionWrapper)initWithNFSession:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKTransactionSessionWrapper;
    v6 = [(PKTransactionSessionWrapper *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_nfSession, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKTransactionSessionWrapper)initWithSTSSession:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKTransactionSessionWrapper;
    v6 = [(PKTransactionSessionWrapper *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_stsSession, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)endSession
{
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  nfSession = self->_nfSession;
  if (nfSession)
  {
    id v7 = v4;
    [(NFSession *)nfSession endSessionWithCompletion:v4];

    stsSession = self->_stsSession;
    if (!stsSession) {
      return;
    }
    id v4 = 0;
    goto LABEL_5;
  }
  stsSession = self->_stsSession;
  if (stsSession)
  {
LABEL_5:
    id v8 = v4;
    [(STSSession *)stsSession endSessionWithCompletion:v4];
    goto LABEL_6;
  }
  if (!v4) {
    return;
  }
  id v8 = v4;
  (*((void (**)(id))v4 + 2))(v4);
LABEL_6:
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (STSSession)stsSession
{
  return self->_stsSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stsSession, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end