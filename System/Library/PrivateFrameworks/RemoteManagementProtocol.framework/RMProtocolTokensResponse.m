@interface RMProtocolTokensResponse
+ (id)requestWithSyncTokens:(id)a3;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (RMProtocolSynchronizationTokens)responseSyncTokens;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseSyncTokens:(id)a3;
@end

@implementation RMProtocolTokensResponse

+ (id)requestWithSyncTokens:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setResponseSyncTokens:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  LOWORD(v10) = a4;
  LOBYTE(a5) = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SyncTokens" forKeyPath:@"responseSyncTokens" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v10 error:a5];

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMProtocolTokensResponse *)self responseSyncTokens];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__RMProtocolTokensResponse_serializeWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v10 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SyncTokens" value:v6 dictSerializer:v9 isRequired:1 defaultValue:0];

  v7 = (void *)[v5 copy];

  return v7;
}

uint64_t __46__RMProtocolTokensResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMProtocolTokensResponse;
  v4 = [(RMModelPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RMProtocolSynchronizationTokens *)self->_responseSyncTokens copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (RMProtocolSynchronizationTokens)responseSyncTokens
{
  return self->_responseSyncTokens;
}

- (void)setResponseSyncTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end