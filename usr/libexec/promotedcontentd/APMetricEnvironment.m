@interface APMetricEnvironment
- (APClientInfo)clientInfo;
- (APContentDataInternal)internalContent;
- (APContext)context;
- (APIDAccount_Private)idAccount;
- (id)findInternalContentDataById:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setContext:(id)a3;
- (void)setIdAccount:(id)a3;
- (void)setInternalContent:(id)a3;
@end

@implementation APMetricEnvironment

- (id)findInternalContentDataById:(id)a3
{
  v3 = +[APManagedContentData findById:a3];
  if (v3) {
    v4 = [[APContentDataInternal alloc] initWithContentDataProvider:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (APContentDataInternal)internalContent
{
  return self->_internalContent;
}

- (void)setInternalContent:(id)a3
{
}

- (APContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (void)setIdAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_internalContent, 0);
}

@end