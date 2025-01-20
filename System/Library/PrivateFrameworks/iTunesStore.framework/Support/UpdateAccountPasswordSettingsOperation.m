@interface UpdateAccountPasswordSettingsOperation
+ (int64_t)_accountPasswordSettingValueForServerValue:(id)a3;
- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4;
- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4 requestProperties:(id)a5;
- (id)_newAccountPasswordSettingsDictionary;
- (id)_requestDictionary;
- (id)_serverValueForAccountPasswordSettingValue:(int64_t)a3 defaultValue:(id)a4;
- (int64_t)freeDownloadsPasswordSetting;
- (int64_t)paidPurchasesPasswordSetting;
- (void)run;
@end

@implementation UpdateAccountPasswordSettingsOperation

- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4
{
  return [(UpdateAccountPasswordSettingsOperation *)self initWithFreeDownloadsPasswordSetting:a3 paidPurchasesPasswordSetting:a4 requestProperties:0];
}

- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4 requestProperties:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UpdateAccountPasswordSettingsOperation;
  v9 = [(UpdateAccountPasswordSettingsOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_freeDownloadsPasswordSetting = a3;
    v9->_paidPurchasesPasswordSetting = a4;
    v11 = (SSMutableURLRequestProperties *)[v8 mutableCopy];
    requestProperties = v10->_requestProperties;
    v10->_requestProperties = v11;
  }
  return v10;
}

- (int64_t)freeDownloadsPasswordSetting
{
  [(UpdateAccountPasswordSettingsOperation *)self lock];
  int64_t freeDownloadsPasswordSetting = self->_freeDownloadsPasswordSetting;
  [(UpdateAccountPasswordSettingsOperation *)self unlock];
  return freeDownloadsPasswordSetting;
}

- (int64_t)paidPurchasesPasswordSetting
{
  [(UpdateAccountPasswordSettingsOperation *)self lock];
  int64_t paidPurchasesPasswordSetting = self->_paidPurchasesPasswordSetting;
  [(UpdateAccountPasswordSettingsOperation *)self unlock];
  return paidPurchasesPasswordSetting;
}

- (void)run
{
  id v16 = objc_alloc_init((Class)ISStoreURLOperation);
  v3 = +[DaemonProtocolDataProvider provider];
  [v16 setDataProvider:v3];

  [v16 setUseUserSpecificURLBag:1];
  requestProperties = self->_requestProperties;
  if (!requestProperties)
  {
    v5 = (SSMutableURLRequestProperties *)objc_alloc_init((Class)SSMutableURLRequestProperties);
    v6 = self->_requestProperties;
    self->_requestProperties = v5;

    requestProperties = self->_requestProperties;
  }
  [(SSMutableURLRequestProperties *)requestProperties setURLBagKey:@"update-password-settings"];
  [(SSMutableURLRequestProperties *)self->_requestProperties setShouldSendSecureToken:1];
  v7 = [(UpdateAccountPasswordSettingsOperation *)self _requestDictionary];
  id v8 = [(SSMutableURLRequestProperties *)self->_requestProperties requestParameters];
  if ([v8 count])
  {
    id v9 = [v7 mutableCopy];
    [v9 addEntriesFromDictionary:v8];
    id v10 = [v9 copy];

    v7 = v10;
  }
  [(SSMutableURLRequestProperties *)self->_requestProperties setHTTPMethod:@"POST"];
  [(SSMutableURLRequestProperties *)self->_requestProperties setRequestParameters:v7];
  [(SSMutableURLRequestProperties *)self->_requestProperties setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v16 setRequestProperties:self->_requestProperties];
  if ([(UpdateAccountPasswordSettingsOperation *)self runSubOperation:v16 returningError:0])
  {
    v11 = [v16 dataProvider];
    v12 = [v11 output];

    v13 = [v12 objectForKey:@"jingleDocType"];
    id v14 = [v13 isEqualToString:@"success"];
  }
  else
  {
    id v14 = 0;
  }
  v15 = [v16 error];
  [(UpdateAccountPasswordSettingsOperation *)self setError:v15];

  [(UpdateAccountPasswordSettingsOperation *)self setSuccess:v14];
}

- (id)_requestDictionary
{
  v3 = +[ISDevice sharedInstance];
  v4 = [v3 guid];

  id v5 = [(UpdateAccountPasswordSettingsOperation *)self _newAccountPasswordSettingsDictionary];
  v8[0] = @"guid";
  v8[1] = @"settings";
  v9[0] = v4;
  v9[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)_newAccountPasswordSettingsDictionary
{
  v3 = [(UpdateAccountPasswordSettingsOperation *)self _serverValueForAccountPasswordSettingValue:self->_freeDownloadsPasswordSetting defaultValue:@"always"];
  v4 = [(UpdateAccountPasswordSettingsOperation *)self _serverValueForAccountPasswordSettingValue:self->_paidPurchasesPasswordSetting defaultValue:@"always"];
  v7[0] = @"free";
  v7[1] = @"paid";
  v8[0] = v3;
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)_serverValueForAccountPasswordSettingValue:(int64_t)a3 defaultValue:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if ((unint64_t)(a3 - 1) >= 3) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = off_1003A8730[a3 - 1];
  }

  return v7;
}

+ (int64_t)_accountPasswordSettingValueForServerValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"always"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"sometimes"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"never"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end