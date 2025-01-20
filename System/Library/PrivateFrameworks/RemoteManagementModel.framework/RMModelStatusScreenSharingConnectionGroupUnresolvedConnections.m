@interface RMModelStatusScreenSharingConnectionGroupUnresolvedConnections
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 unresolvedConnections:(id)a5;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusUnresolvedConnections;
- (NSNumber)statusRemoved;
- (NSString)statusIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusUnresolvedConnections:(id)a3;
@end

@implementation RMModelStatusScreenSharingConnectionGroupUnresolvedConnections

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"unresolved_connections";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"screensharing.connection.group.unresolved-connection";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 unresolvedConnections:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusIdentifier:v9];

  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setStatusRemoved:v11];

  [v10 setStatusUnresolvedConnections:v7];
  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusIdentifier:v3];

  return v4;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = &unk_2708C3750;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C08E8];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0900];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelStatusScreenSharingConnectionGroupUnresolvedConnections allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"unresolved_connections" forKeyPath:@"statusUnresolvedConnections" validator:&__block_literal_global_24 isRequired:0 defaultValue:0 error:a5];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __116__RMModelStatusScreenSharingConnectionGroupUnresolvedConnections_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelStatusScreenSharingConnectionGroupUnresolvedConnections *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"identifier" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusScreenSharingConnectionGroupUnresolvedConnections *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"_removed" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelStatusScreenSharingConnectionGroupUnresolvedConnections *)self statusUnresolvedConnections];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"unresolved_connections" value:v7 itemSerializer:&__block_literal_global_38 isRequired:0 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

id __91__RMModelStatusScreenSharingConnectionGroupUnresolvedConnections_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusScreenSharingConnectionGroupUnresolvedConnections;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_statusUnresolvedConnections copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
}

- (NSArray)statusUnresolvedConnections
{
  return self->_statusUnresolvedConnections;
}

- (void)setStatusUnresolvedConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUnresolvedConnections, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end