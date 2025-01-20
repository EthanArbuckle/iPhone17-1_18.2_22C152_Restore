@interface RMModelConfigurationDynamic
+ (id)buildWithSchema:(id)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDictionary)payload;
- (RMModelConfigurationDynamic)initWithSchema:(id)a3;
- (RMModelConfigurationSchema)schema;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declarationClassType;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayload:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation RMModelConfigurationDynamic

+ (id)buildWithSchema:(id)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[RMModelConfigurationDynamic alloc] initWithSchema:v12];

  [(RMModelDeclarationBase *)v13 setDeclarationType:v11];
  [(RMModelDeclarationBase *)v13 setDeclarationIdentifier:v10];

  v14 = (void *)[v9 copy];
  [(RMModelConfigurationDynamic *)v13 setPayload:v14];

  [(RMModelDeclarationBase *)v13 updateServerToken];
  return v13;
}

- (RMModelConfigurationDynamic)initWithSchema:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMModelConfigurationDynamic;
  v6 = [(RMModelConfigurationDynamic *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_schema, a3);
  }

  return v7;
}

- (id)assetReferences
{
  v3 = [(RMModelConfigurationDynamic *)self schema];
  v4 = [v3 assetReferences];
  id v5 = [(RMModelConfigurationDynamic *)self payload];
  v6 = [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v4 payloadObject:v5];

  return v6;
}

- (id)declarationClassType
{
  return @"configuration";
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = +[RMModelConfigurationSchema schemas];
  v8 = [(RMModelDeclarationBase *)self declarationType];
  objc_super v9 = [v7 objectForKeyedSubscript:v8];
  [(RMModelConfigurationDynamic *)self setSchema:v9];

  id v10 = (void *)[v6 copy];
  [(RMModelConfigurationDynamic *)self setPayload:v10];

  return 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v3 = [(RMModelConfigurationDynamic *)self payload];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelConfigurationDynamic;
  v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_schema);
  uint64_t v5 = [(NSDictionary *)self->_payload copy];
  id v6 = v4[7];
  v4[7] = (id)v5;

  return v4;
}

- (RMModelConfigurationSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end