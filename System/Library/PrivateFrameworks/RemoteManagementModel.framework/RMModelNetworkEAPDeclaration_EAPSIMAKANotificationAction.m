@interface RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithCode:(id)a3;
+ (id)buildWithCode:(id)a3 name:(id)a4 description:(id)a5 action:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadCode;
- (NSString)payloadAction;
- (NSString)payloadDescription;
- (NSString)payloadName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAction:(id)a3;
- (void)setPayloadCode:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadName:(id)a3;
@end

@implementation RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Code";
  v6[1] = @"Name";
  v6[2] = @"Description";
  v6[3] = @"Action";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCode:(id)a3 name:(id)a4 description:(id)a5 action:(id)a6
{
  v9 = (__CFString *)a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadCode:v12];

  [v13 setPayloadName:v11];
  [v13 setPayloadDescription:v10];

  if (v9) {
    v14 = v9;
  }
  else {
    v14 = @"Default";
  }
  [v13 setPayloadAction:v14];

  return v13;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadCode:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"Code" forKeyPath:@"payloadCode" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Name" forKeyPath:@"payloadName" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Description" forKeyPath:@"payloadDescription" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Action" forKeyPath:@"payloadAction" isRequired:0 defaultValue:@"Default" error:a5];
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction *)self payloadCode];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"Code" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction *)self payloadName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Name" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction *)self payloadDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Description" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction *)self payloadAction];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Action" value:v8 isRequired:0 defaultValue:@"Default"];

  v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelNetworkEAPDeclaration_EAPSIMAKANotificationAction;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadCode copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDescription copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAction copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadCode
{
  return self->_payloadCode;
}

- (void)setPayloadCode:(id)a3
{
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (NSString)payloadAction
{
  return self->_payloadAction;
}

- (void)setPayloadAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAction, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
  objc_storeStrong((id *)&self->_payloadCode, 0);
}

@end