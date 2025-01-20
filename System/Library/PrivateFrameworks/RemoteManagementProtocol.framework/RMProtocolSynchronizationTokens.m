@interface RMProtocolSynchronizationTokens
+ (id)requestWithTimestamp:(id)a3 declarationsToken:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDate)tokensTimestamp;
- (NSString)tokensDeclarationsToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setTokensDeclarationsToken:(id)a3;
- (void)setTokensTimestamp:(id)a3;
@end

@implementation RMProtocolSynchronizationTokens

+ (id)requestWithTimestamp:(id)a3 declarationsToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTokensTimestamp:v6];

  [v7 setTokensDeclarationsToken:v5];

  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  if ([(RMModelPayloadBase *)self loadDateFromDictionary:v8 usingKey:@"Timestamp" forKeyPath:@"tokensTimestamp" isRequired:1 defaultValue:0 serializationType:v6 error:a5])
  {
    BOOL v9 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"DeclarationsToken" forKeyPath:@"tokensDeclarationsToken" isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMProtocolSynchronizationTokens *)self tokensTimestamp];
  [(RMModelPayloadBase *)self serializeDateIntoDictionary:v5 usingKey:@"Timestamp" value:v6 isRequired:1 defaultValue:0 serializationType:v3];

  v7 = [(RMProtocolSynchronizationTokens *)self tokensDeclarationsToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"DeclarationsToken" value:v7 isRequired:1 defaultValue:0];

  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMProtocolSynchronizationTokens;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSDate *)self->_tokensTimestamp copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_tokensDeclarationsToken copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSDate)tokensTimestamp
{
  return self->_tokensTimestamp;
}

- (void)setTokensTimestamp:(id)a3
{
}

- (NSString)tokensDeclarationsToken
{
  return self->_tokensDeclarationsToken;
}

- (void)setTokensDeclarationsToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensDeclarationsToken, 0);

  objc_storeStrong((id *)&self->_tokensTimestamp, 0);
}

@end