@interface WLKUserSettingsRequestOperation
- (NSString)caller;
- (WLKUserSettings)response;
- (WLKUserSettings)userSettings;
- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4;
- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4 caller:(id)a5;
- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4 dsid:(id)a5 isMigration:(BOOL)a6;
- (id)_initWithAction:(unint64_t)a3 userSettings:(id)a4 caller:(id)a5 dsid:(id)a6 isMigration:(BOOL)a7;
- (unint64_t)action;
- (void)processResponse;
@end

@implementation WLKUserSettingsRequestOperation

- (void)processResponse
{
  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v6 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v6 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;
}

- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4 dsid:(id)a5 isMigration:(BOOL)a6
{
  return (WLKUserSettingsRequestOperation *)[(WLKUserSettingsRequestOperation *)self _initWithAction:a3 userSettings:a4 caller:0 dsid:a5 isMigration:a6];
}

- (id)_initWithAction:(unint64_t)a3 userSettings:(id)a4 caller:(id)a5 dsid:(id)a6 isMigration:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a3 == 1)
  {
    WLKRequireNonNilParameter((uint64_t)v12);
    if (v7) {
      v16 = &unk_1F13D9A30;
    }
    else {
      v16 = 0;
    }
    v17 = [v12 _patchData];
    v15 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"user/settings" queryParameters:v16 httpMethod:@"PATCH" httpBody:v17 headers:&unk_1F13D9A58 caller:v13 timeout:0 apiVersion:&unk_1F13D98A8 options:0x200000];
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid action provided (%ld)", a3);
    v15 = 0;
  }
  else
  {
    v15 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"user/settings" queryParameters:0 httpMethod:@"GET" httpBody:0 headers:0 caller:v13 timeout:0 apiVersion:&unk_1F13D98A8 options:2097160];
  }
  v26.receiver = self;
  v26.super_class = (Class)WLKUserSettingsRequestOperation;
  v18 = [(WLKUTSNetworkRequestOperation *)&v26 initWithRequestProperties:v15];
  v19 = v18;
  if (v18)
  {
    v18->_action = a3;
    uint64_t v20 = [v12 copy];
    userSettings = v19->_userSettings;
    v19->_userSettings = (WLKUserSettings *)v20;

    uint64_t v22 = [v13 copy];
    caller = v19->_caller;
    v19->_caller = (NSString *)v22;

    v24 = (void *)[v14 copy];
    [(WLKNetworkRequestOperation *)v19 setDSID:v24];
  }
  return v19;
}

- (unint64_t)action
{
  return self->_action;
}

- (WLKUserSettings)userSettings
{
  return self->_userSettings;
}

- (WLKUserSettings)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_userSettings, 0);
}

- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4
{
  return [(WLKUserSettingsRequestOperation *)self initWithAction:a3 userSettings:a4 caller:0];
}

- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4 caller:(id)a5
{
  return (WLKUserSettingsRequestOperation *)[(WLKUserSettingsRequestOperation *)self _initWithAction:a3 userSettings:a4 caller:a5 dsid:0 isMigration:0];
}

- (NSString)caller
{
  return self->_caller;
}

@end