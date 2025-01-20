@interface SMTRequestDispatcherSessionConfiguration
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)understandingOnDevice;
- (NSString)assistantId;
- (NSString)languageCode;
- (NSString)sharedUserId;
- (SMTRequestDispatcherSessionConfiguration)init;
- (SMTRequestDispatcherSessionConfiguration)initWithBuilder:(id)a3;
@end

@implementation SMTRequestDispatcherSessionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (BOOL)understandingOnDevice
{
  return self->_understandingOnDevice;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (SMTRequestDispatcherSessionConfiguration)init
{
  return [(SMTRequestDispatcherSessionConfiguration *)self initWithBuilder:&__block_literal_global_144];
}

- (SMTRequestDispatcherSessionConfiguration)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SMTRequestDispatcherSessionConfigurationMutating *))a3;
  v20.receiver = self;
  v20.super_class = (Class)SMTRequestDispatcherSessionConfiguration;
  v5 = [(SMTRequestDispatcherSessionConfiguration *)&v20 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SMTRequestDispatcherSessionConfigurationMutating);
    v4[2](v4, v7);
    v8 = [(SMTRequestDispatcherSessionConfigurationMutating *)v7 assistantId];
    uint64_t v9 = [v8 copy];
    assistantId = v6->_assistantId;
    v6->_assistantId = (NSString *)v9;

    v11 = [(SMTRequestDispatcherSessionConfigurationMutating *)v7 languageCode];
    uint64_t v12 = [v11 copy];
    languageCode = v6->_languageCode;
    v6->_languageCode = (NSString *)v12;

    v6->_understandingOnDevice = [(SMTRequestDispatcherSessionConfigurationMutating *)v7 understandingOnDevice];
    v14 = [(SMTRequestDispatcherSessionConfigurationMutating *)v7 sharedUserId];
    uint64_t v15 = [v14 copy];
    sharedUserId = v6->_sharedUserId;
    v6->_sharedUserId = (NSString *)v15;

    if (v7)
    {
      [(SMTRequestDispatcherSessionConfigurationMutating *)v7 clientAuditToken];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    *(_OWORD *)v6->_clientAuditToken.val = v18;
    *(_OWORD *)&v6->_clientAuditToken.val[4] = v19;
  }
  return v6;
}

@end