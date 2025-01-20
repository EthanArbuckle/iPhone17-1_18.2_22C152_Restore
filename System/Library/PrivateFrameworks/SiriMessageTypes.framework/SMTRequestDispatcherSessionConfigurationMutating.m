@interface SMTRequestDispatcherSessionConfigurationMutating
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)understandingOnDevice;
- (NSString)assistantId;
- (NSString)languageCode;
- (NSString)sharedUserId;
- (void)setAssistantId:(id)a3;
- (void)setClientAuditToken:(id *)a3;
- (void)setLanguageCode:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setUnderstandingOnDevice:(BOOL)a3;
@end

@implementation SMTRequestDispatcherSessionConfigurationMutating

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

- (void)setClientAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setUnderstandingOnDevice:(BOOL)a3
{
  self->_understandingOnDevice = a3;
}

- (BOOL)understandingOnDevice
{
  return self->_understandingOnDevice;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

@end