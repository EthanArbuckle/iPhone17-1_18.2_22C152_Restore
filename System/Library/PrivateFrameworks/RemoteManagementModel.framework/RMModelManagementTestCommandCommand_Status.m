@interface RMModelManagementTestCommandCommand_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithEcho:(id)a3;
+ (id)buildWithEcho:(id)a3;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)statusEcho;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusEcho:(id)a3;
@end

@implementation RMModelManagementTestCommandCommand_Status

+ (NSSet)allowedStatusKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Echo";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v2 = objc_opt_new();
  return (NSSet *)v2;
}

+ (id)buildWithEcho:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusEcho:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithEcho:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusEcho:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a3;
  v9 = [v8 allKeys];
  v10 = [v7 setWithArray:v9];

  v11 = +[RMModelManagementTestCommandCommand_Status allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  LOBYTE(a5) = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Echo" forKeyPath:@"statusEcho" isRequired:1 defaultValue:0 error:a5];
  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelManagementTestCommandCommand_Status *)self statusEcho];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Echo" value:v5 isRequired:1 defaultValue:0];

  v6 = (void *)[v4 copy];
  return v6;
}

- (NSString)statusEcho
{
  return self->_statusEcho;
}

- (void)setStatusEcho:(id)a3
{
}

- (void).cxx_destruct
{
}

@end