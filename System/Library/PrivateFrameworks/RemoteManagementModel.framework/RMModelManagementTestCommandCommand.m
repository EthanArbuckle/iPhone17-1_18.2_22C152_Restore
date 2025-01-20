@interface RMModelManagementTestCommandCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 echo:(id)a4;
+ (id)buildWithIdentifier:(id)a3 echo:(id)a4 returnStatus:(id)a5;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadEcho;
- (NSString)payloadReturnStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadEcho:(id)a3;
- (void)setPayloadReturnStatus:(id)a3;
@end

@implementation RMModelManagementTestCommandCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.management.test";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Echo";
  v6[1] = @"ReturnStatus";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 echo:(id)a4 returnStatus:(id)a5
{
  id v7 = a3;
  v8 = (__CFString *)a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.management.test"];
  if (v7)
  {
    [v10 setCommandIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setCommandIdentifier:v12];
  }
  [v10 setPayloadEcho:v9];

  if (v8) {
    v13 = v8;
  }
  else {
    v13 = @"Executed";
  }
  [v10 setPayloadReturnStatus:v13];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 echo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.management.test"];
  if (v5)
  {
    [v7 setCommandIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setCommandIdentifier:v9];
  }
  [v7 setPayloadEcho:v6];

  return v7;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelManagementTestCommandCommand allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Echo" forKeyPath:@"payloadEcho" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ReturnStatus" forKeyPath:@"payloadReturnStatus" isRequired:0 defaultValue:@"Executed" error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelManagementTestCommandCommand *)self payloadEcho];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Echo" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelManagementTestCommandCommand *)self payloadReturnStatus];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ReturnStatus" value:v6 isRequired:0 defaultValue:@"Executed"];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelManagementTestCommandCommand;
  v4 = [(RMModelCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEcho copy];
  id v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSString *)self->_payloadReturnStatus copy];
  v8 = (void *)v4[6];
  v4[6] = v7;

  return v4;
}

- (NSString)payloadEcho
{
  return self->_payloadEcho;
}

- (void)setPayloadEcho:(id)a3
{
}

- (NSString)payloadReturnStatus
{
  return self->_payloadReturnStatus;
}

- (void)setPayloadReturnStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadReturnStatus, 0);
  objc_storeStrong((id *)&self->_payloadEcho, 0);
}

@end