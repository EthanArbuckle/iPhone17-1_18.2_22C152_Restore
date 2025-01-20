@interface INAcknowledgeAccountAlertRequest
- (INAcknowledgeAccountAlertRequest)initWithAccount:(id)a3 store:(id)a4;
- (NSData)pushToken;
- (NSDictionary)pushMessageInfo;
- (id)urlRequest;
- (id)urlString;
- (void)setPushMessageInfo:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation INAcknowledgeAccountAlertRequest

- (INAcknowledgeAccountAlertRequest)initWithAccount:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INAcknowledgeAccountAlertRequest;
  v9 = [(INAcknowledgeAccountAlertRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
  }

  return v10;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 dismissAlertURL];

  return v3;
}

- (id)urlRequest
{
  v15.receiver = self;
  v15.super_class = (Class)INAcknowledgeAccountAlertRequest;
  v3 = [(INAcknowledgeAccountAlertRequest *)&v15 urlRequest];
  id v4 = [v3 mutableCopy];

  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100028A84(self);
  }

  [v4 setHTTPMethod:@"POST"];
  pushMessageInfo = self->_pushMessageInfo;
  if (pushMessageInfo)
  {
    id v14 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:pushMessageInfo options:0 error:&v14];
    id v8 = v14;
    if (v8)
    {
      v9 = _INLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000289FC();
      }
    }
    else
    {
      [v4 setHTTPBody:v7];
    }
  }
  v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100028940(v4);
  }

  [v4 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v11 = [(NSData *)self->_pushToken aaf_toHexString];
  [v4 setValue:v11 forHTTPHeaderField:@"X-APNS-Token"];

  objc_msgSend(v4, "aa_addDeviceIDHeader");
  objc_super v12 = _INLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000288BC(v4);
  }

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  return v4;
}

- (NSDictionary)pushMessageInfo
{
  return self->_pushMessageInfo;
}

- (void)setPushMessageInfo:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushMessageInfo, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end