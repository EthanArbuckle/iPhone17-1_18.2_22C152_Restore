@interface RMModelAnyDeclaration
+ (id)buildWithType:(id)a3 identifier:(id)a4 payload:(id)a5;
+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDictionary)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declarationClassType;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayload:(id)a3;
@end

@implementation RMModelAnyDeclaration

+ (id)buildWithType:(id)a3 identifier:(id)a4 payload:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setDeclarationType:v9];

  [v10 setDeclarationIdentifier:v8];
  v11 = (void *)[v7 copy];

  [v10 setPayload:v11];
  [v10 updateServerToken];
  return v10;
}

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  LODWORD(a5) = [v8 loadFromDictionary:v7 serializationType:v6 error:a5];

  if (a5) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)declarationClassType
{
  v3 = [(RMModelDeclarationBase *)self declarationType];
  char v4 = [v3 hasPrefix:@"com.apple.activation."];

  if (v4) {
    return @"activation";
  }
  uint64_t v6 = [(RMModelDeclarationBase *)self declarationType];
  char v7 = [v6 hasPrefix:@"com.apple.asset."];

  if (v7) {
    return @"asset";
  }
  id v8 = [(RMModelDeclarationBase *)self declarationType];
  char v9 = [v8 hasPrefix:@"com.apple.configuration."];

  if (v9) {
    return @"configuration";
  }
  v10 = [(RMModelDeclarationBase *)self declarationType];
  int v11 = [v10 hasPrefix:@"com.apple.management."];

  if (v11) {
    return @"management";
  }
  else {
    return @"unknown";
  }
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = (void *)[a3 copy];
  [(RMModelAnyDeclaration *)self setPayload:v6];

  return 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v3 = [(RMModelAnyDeclaration *)self payload];
  char v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelAnyDeclaration;
  char v4 = [(RMModelDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_payload copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
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
}

@end