@interface INAccountEventDetailsRequest
+ (Class)responseClass;
- (INAccountEventDetailsRequest)initWithAccount:(id)a3 pushMessage:(id)a4;
- (NSData)pushToken;
- (id)urlRequest;
- (id)urlString;
- (void)setPushToken:(id)a3;
@end

@implementation INAccountEventDetailsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (INAccountEventDetailsRequest)initWithAccount:(id)a3 pushMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INAccountEventDetailsRequest;
  v9 = [(INAccountEventDetailsRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_pushMessage, a4);
  }

  return v10;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 getAccountEventDetailsURL];

  return v3;
}

- (id)urlRequest
{
  v16.receiver = self;
  v16.super_class = (Class)INAccountEventDetailsRequest;
  v3 = [(INAccountEventDetailsRequest *)&v16 urlRequest];
  id v4 = [v3 mutableCopy];

  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100028A84(self);
  }

  [v4 setHTTPMethod:@"POST"];
  v6 = [(APSMessage *)self->_pushMessage userInfo];
  id v7 = [v6 mutableCopy];

  [v7 removeObjectForKey:@"aps"];
  id v15 = 0;
  id v8 = +[NSJSONSerialization dataWithJSONObject:v7 options:0 error:&v15];
  id v9 = v15;
  if (v9)
  {
    v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029764();
    }
  }
  else
  {
    [v4 setHTTPBody:v8];
  }
  v11 = _INLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100028940(v4);
  }

  [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  objc_super v12 = [(NSData *)self->_pushToken aaf_toHexString];
  [v4 setValue:v12 forHTTPHeaderField:@"X-APNS-Token"];

  objc_msgSend(v4, "aa_addDeviceIDHeader");
  v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000288BC(v4);
  }

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  return v4;
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
  objc_storeStrong((id *)&self->_pushMessage, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end