@interface RMModelCommandBase
+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)mustBeSupervised;
- (NSString)commandIdentifier;
- (NSString)commandType;
- (RMModelAnyPayload)commandPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setCommandIdentifier:(id)a3;
- (void)setCommandPayload:(id)a3;
- (void)setCommandType:(id)a3;
@end

@implementation RMModelCommandBase

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"Type"];
  v9 = (void *)v8;
  v10 = @"(nil)";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  if (+[RMModelClasses classForCommandType:v11])
  {
    v12 = objc_opt_new();
    if ([v12 loadFromDictionary:v7 serializationType:v6 error:a5]) {
      a5 = v12;
    }
    else {
      a5 = 0;
    }
  }
  else if (a5)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithFormat:@"Could not match command type: %@", v11, *MEMORY[0x263F08320]];
    v18[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];

    a5 = 0;
  }

  return a5;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Type" forKeyPath:@"commandType" isRequired:1 defaultValue:0 error:a5]&& [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Identifier" forKeyPath:@"commandIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Payload"];
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x263EFFA78];
    if (v9) {
      v11 = (void *)v9;
    }
    id v12 = v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(a5) = [(RMModelCommandBase *)self loadPayloadFromDictionary:v12 serializationType:v6 error:a5];
    }
    else if (a5)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      v14 = [NSString stringWithFormat:@"Invalid nested item in key: %@", @"Payload", *MEMORY[0x263F08320]];
      v18[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(RMModelCommandBase *)self commandType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Type" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelCommandBase *)self commandIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Identifier" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelCommandBase *)self serializePayloadWithType:v3];
  if ([v8 count]) {
    [v5 setObject:v8 forKeyedSubscript:@"Payload"];
  }
  uint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelCommandBase;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_commandType copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_commandIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_commandPayload copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(id)a3
{
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
}

- (RMModelAnyPayload)commandPayload
{
  return self->_commandPayload;
}

- (void)setCommandPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPayload, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_commandType, 0);
}

@end