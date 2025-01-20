@interface RMModelDeclarationBase
+ (BOOL)isDeclarationTypeKnown:(id)a3;
+ (BOOL)isSupportedDeclaration:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5;
+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)declarationClassType;
- (NSString)declarationIdentifier;
- (NSString)declarationServerToken;
- (NSString)declarationType;
- (RMModelAnyPayload)declarationPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setDeclarationPayload:(id)a3;
- (void)setDeclarationServerToken:(id)a3;
- (void)setDeclarationType:(id)a3;
- (void)updateServerToken;
@end

@implementation RMModelDeclarationBase

+ (BOOL)isDeclarationTypeKnown:(id)a3
{
  id v3 = a3;
  if (+[RMModelClasses classForDeclarationType:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = +[RMModelConfigurationSchema schemas];
    v6 = [v5 objectForKeyedSubscript:v3];
    BOOL v4 = v6 != 0;
  }
  return v4;
}

+ (BOOL)isSupportedDeclaration:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5
{
  id v7 = a3;
  v8 = +[RMModelClasses classForDeclarationType:v7];
  if (v8)
  {
    if (([(objc_class *)v8 isSupportedForPlatform:a4 scope:a5] & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    v9 = +[RMModelConfigurationSchema schemas];
    v10 = [v9 objectForKeyedSubscript:v7];

    if (!v10 || ([v10 isSupportedForPlatform:a4 scope:a5] & 1) == 0)
    {

LABEL_9:
      BOOL v11 = 0;
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (NSString)declarationClassType
{
  return (NSString *)&stru_2708A9900;
}

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"Type"];
  v9 = (void *)v8;
  v10 = @"(nil)";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  BOOL v11 = v10;

  if (!+[RMModelClasses classForDeclarationType:v11])
  {
    v12 = +[RMModelConfigurationSchema schemas];
    v13 = [v12 objectForKeyedSubscript:v11];

    objc_opt_class();
  }
  v14 = objc_opt_new();
  int v15 = [v14 loadFromDictionary:v7 serializationType:v6 error:a5];

  if (v15) {
    id v16 = v14;
  }
  else {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"Type", @"declarationType", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"Identifier", @"declarationIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         @"ServerToken",
         @"declarationServerToken",
         1,
         0,
         a5))
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Payload"];
    v10 = (void *)v9;
    BOOL v11 = (void *)MEMORY[0x263EFFA78];
    if (v9) {
      BOOL v11 = (void *)v9;
    }
    id v12 = v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(a5) = [(RMModelDeclarationBase *)self loadPayloadFromDictionary:v12 serializationType:v6 error:a5];
    }
    else if (a5)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      int v15 = [NSString stringWithFormat:@"Invalid nested item in key: %@", @"Payload", *MEMORY[0x263F08320]];
      v18[0] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a5 = [v14 errorWithDomain:@"error" code:1 userInfo:v16];

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
  uint64_t v6 = [(RMModelDeclarationBase *)self declarationType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Type" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelDeclarationBase *)self declarationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Identifier" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelDeclarationBase *)self declarationServerToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ServerToken" value:v8 isRequired:1 defaultValue:0];

  uint64_t v9 = [(RMModelDeclarationBase *)self serializePayloadWithType:v3];
  [v5 setObject:v9 forKeyedSubscript:@"Payload"];

  v10 = (void *)[v5 copy];
  return v10;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (void)updateServerToken
{
  uint64_t v3 = (void *)MEMORY[0x263F08AC0];
  BOOL v4 = [(RMModelDeclarationBase *)self serializePayloadWithType:0];
  id v7 = [v3 dataWithPropertyList:v4 format:100 options:0 error:0];

  if (v7)
  {
    v5 = [v7 RMModelSHA1HexString];
  }
  else
  {
    v5 = &stru_2708A9900;
  }
  objc_storeStrong((id *)&self->_declarationServerToken, v5);
  uint64_t v6 = v7;
  if (v7)
  {

    uint64_t v6 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelDeclarationBase;
  BOOL v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_declarationType copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_declarationIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_declarationServerToken copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(RMModelAnyPayload *)self->_declarationPayload copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (void)setDeclarationType:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (void)setDeclarationServerToken:(id)a3
{
}

- (RMModelAnyPayload)declarationPayload
{
  return self->_declarationPayload;
}

- (void)setDeclarationPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationPayload, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
}

@end