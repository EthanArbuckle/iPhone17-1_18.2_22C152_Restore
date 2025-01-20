@interface RMProtocolEnrollResponse
+ (id)requestWithPushTopic:(id)a3 pushEnvironment:(id)a4 statusItems:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)responseStatusItems;
- (NSString)responsePushEnvironment;
- (NSString)responsePushTopic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponsePushEnvironment:(id)a3;
- (void)setResponsePushTopic:(id)a3;
- (void)setResponseStatusItems:(id)a3;
@end

@implementation RMProtocolEnrollResponse

+ (id)requestWithPushTopic:(id)a3 pushEnvironment:(id)a4 statusItems:(id)a5
{
  id v7 = a5;
  v8 = (__CFString *)a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setResponsePushTopic:v9];

  if (v8) {
    v11 = v8;
  }
  else {
    v11 = @"production";
  }
  [v10 setResponsePushEnvironment:v11];

  [v10 setResponseStatusItems:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PushTopic" forKeyPath:@"responsePushTopic" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v8 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PushEnvironment" forKeyPath:@"responsePushEnvironment" isRequired:0 defaultValue:@"production" error:a5])
    {
      BOOL v8 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"StatusItems" forKeyPath:@"responseStatusItems" validator:&__block_literal_global isRequired:0 defaultValue:0 error:a5];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __71__RMProtocolEnrollResponse_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMProtocolEnrollResponse *)self responsePushTopic];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PushTopic" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMProtocolEnrollResponse *)self responsePushEnvironment];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PushEnvironment" value:v6 isRequired:0 defaultValue:@"production"];

  id v7 = [(RMProtocolEnrollResponse *)self responseStatusItems];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"StatusItems" value:v7 itemSerializer:&__block_literal_global_27 isRequired:0 defaultValue:0];

  BOOL v8 = (void *)[v4 copy];

  return v8;
}

id __46__RMProtocolEnrollResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMProtocolEnrollResponse;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responsePushTopic copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responsePushEnvironment copy];
  BOOL v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_responseStatusItems copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)responsePushTopic
{
  return self->_responsePushTopic;
}

- (void)setResponsePushTopic:(id)a3
{
}

- (NSString)responsePushEnvironment
{
  return self->_responsePushEnvironment;
}

- (void)setResponsePushEnvironment:(id)a3
{
}

- (NSArray)responseStatusItems
{
  return self->_responseStatusItems;
}

- (void)setResponseStatusItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseStatusItems, 0);
  objc_storeStrong((id *)&self->_responsePushEnvironment, 0);

  objc_storeStrong((id *)&self->_responsePushTopic, 0);
}

@end