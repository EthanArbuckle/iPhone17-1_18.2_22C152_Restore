@interface IMWritePushNotificationSettingsService
- (IMWritePushNotificationSettingsService)initWithData:(id)a3;
- (NSData)data;
- (id)urlRequest;
- (void)setData:(id)a3;
@end

@implementation IMWritePushNotificationSettingsService

- (IMWritePushNotificationSettingsService)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMWritePushNotificationSettingsService;
  v5 = [(IMBaseStoreService *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IMWritePushNotificationSettingsService *)v5 setData:v4];
    [(IMBaseStoreService *)v6 setPersonalizeRequests:1];
  }

  return v6;
}

- (id)urlRequest
{
  v3 = [(IMPushNotificationSettingsService *)self endpointURLForKey:@"setPushNotificationSettings"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__IMWritePushNotificationSettingsService_urlRequest__block_invoke;
  v6[3] = &unk_1E5E63928;
  v6[4] = self;
  id v4 = [v3 thenWithBlock:v6];

  return v4;
}

id __52__IMWritePushNotificationSettingsService_urlRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F28E88] requestWithURL:a2];
  [v3 setHTTPMethod:@"POST"];
  [v3 addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  id v4 = [*(id *)(a1 + 32) data];
  [v3 setHTTPBody:v4];

  v5 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v3];

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end