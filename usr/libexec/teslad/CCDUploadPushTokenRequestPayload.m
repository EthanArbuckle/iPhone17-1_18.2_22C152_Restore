@interface CCDUploadPushTokenRequestPayload
- (NSData)pushToken;
- (NSString)pushTopic;
- (id)action;
- (id)dictionary;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
@end

@implementation CCDUploadPushTokenRequestPayload

- (id)dictionary
{
  v15.receiver = self;
  v15.super_class = (Class)CCDUploadPushTokenRequestPayload;
  v3 = [(CCDRequestPayload *)&v15 dictionary];
  v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  v5 = [v4 objectForKeyedSubscript:@"device"];
  id v6 = [v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;

  v10 = [(CCDUploadPushTokenRequestPayload *)self pushToken];
  v11 = [v10 base64EncodedStringWithOptions:0];
  [v9 setObject:v11 forKeyedSubscript:@"app_push_token"];

  v12 = [(CCDUploadPushTokenRequestPayload *)self pushTopic];
  [v9 setObject:v12 forKeyedSubscript:@"push_topic"];

  [v4 setObject:v9 forKeyedSubscript:@"device"];
  id v13 = [v4 copy];

  return v13;
}

- (id)action
{
  return @"DeviceRegistration";
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
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

  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end