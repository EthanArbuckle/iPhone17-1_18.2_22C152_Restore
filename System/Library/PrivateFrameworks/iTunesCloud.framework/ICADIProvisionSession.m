@interface ICADIProvisionSession
- (BOOL)endWithMessageData:(id)a3 transportKey:(id)a4 error:(id *)a5;
- (BOOL)startWithServerActionData:(id)a3 returningClientData:(id *)a4 error:(id *)a5;
- (ICADIProvisionSession)initWithAccountID:(unint64_t)a3;
- (void)_destroySession;
- (void)dealloc;
@end

@implementation ICADIProvisionSession

- (void)_destroySession
{
  if (self->_sessionID)
  {
    fy34trz2st();
    self->_sessionID = 0;
  }
}

- (BOOL)endWithMessageData:(id)a3 transportKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!self->_sessionID)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"ICADIUtilities.m" lineNumber:132 description:@"ICADIProvisionSession end called for invalid session"];
  }
  id v11 = v9;
  [v11 bytes];
  [v11 length];
  id v12 = v10;
  [v12 bytes];
  [v12 length];
  uv5t6nhkui();
  int v14 = v13;
  if (v13)
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v13 userInfo:0];
  }
  else
  {
    v15 = 0;
  }
  [(ICADIProvisionSession *)self _destroySession];
  if (a5) {
    *a5 = v15;
  }

  return v14 == 0;
}

- (BOOL)startWithServerActionData:(id)a3 returningClientData:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  uint64_t v20 = 0;
  unsigned int v19 = 0;
  p_sessionID = &self->_sessionID;
  if (self->_sessionID)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ICADIUtilities.m" lineNumber:104 description:@"ICADIProvisionSession start can only be called once!"];
  }
  unint64_t accountID = self->_accountID;
  id v12 = v9;
  rsegvyrt87(accountID, [v12 bytes], objc_msgSend(v12, "length"), (uint64_t)&v20, (uint64_t)&v19, (uint64_t)p_sessionID);
  int v14 = v13;
  if (v13)
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v13 userInfo:0];
    v16 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithADIBytes:length:", v20, v19);
  v15 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v16;
LABEL_6:
  if (a5) {
    *a5 = v15;
  }

  return v14 == 0;
}

- (void)dealloc
{
  [(ICADIProvisionSession *)self _destroySession];
  v3.receiver = self;
  v3.super_class = (Class)ICADIProvisionSession;
  [(ICADIProvisionSession *)&v3 dealloc];
}

- (ICADIProvisionSession)initWithAccountID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICADIProvisionSession;
  result = [(ICADIProvisionSession *)&v5 init];
  if (result) {
    result->_unint64_t accountID = a3;
  }
  return result;
}

@end