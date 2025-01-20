@interface RMProtocolPushMessage
+ (id)requestWithEnrollmentToken:(id)a3 syncTokens:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)messageEnrollmentToken;
- (RMProtocolSynchronizationTokens)messageSyncTokens;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setMessageEnrollmentToken:(id)a3;
- (void)setMessageSyncTokens:(id)a3;
@end

@implementation RMProtocolPushMessage

+ (id)requestWithEnrollmentToken:(id)a3 syncTokens:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setMessageEnrollmentToken:v6];

  [v7 setMessageSyncTokens:v5];

  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"EnrollmentToken" forKeyPath:@"messageEnrollmentToken" isRequired:1 defaultValue:0 error:a5])
  {
    LOWORD(v11) = a4;
    BOOL v9 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SyncTokens" forKeyPath:@"messageSyncTokens" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v11 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMProtocolPushMessage *)self messageEnrollmentToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"EnrollmentToken" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolPushMessage *)self messageSyncTokens];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__RMProtocolPushMessage_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SyncTokens" value:v7 dictSerializer:v10 isRequired:0 defaultValue:0];

  id v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __43__RMProtocolPushMessage_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMProtocolPushMessage;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_messageEnrollmentToken copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(RMProtocolSynchronizationTokens *)self->_messageSyncTokens copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)messageEnrollmentToken
{
  return self->_messageEnrollmentToken;
}

- (void)setMessageEnrollmentToken:(id)a3
{
}

- (RMProtocolSynchronizationTokens)messageSyncTokens
{
  return self->_messageSyncTokens;
}

- (void)setMessageSyncTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSyncTokens, 0);

  objc_storeStrong((id *)&self->_messageEnrollmentToken, 0);
}

@end