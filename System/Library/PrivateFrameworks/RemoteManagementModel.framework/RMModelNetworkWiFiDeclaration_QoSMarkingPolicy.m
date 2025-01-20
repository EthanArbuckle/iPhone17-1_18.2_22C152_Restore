@interface RMModelNetworkWiFiDeclaration_QoSMarkingPolicy
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAllowListAppIdentifiers:(id)a3 appleAudioVideoCalls:(id)a4 enabled:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAllowListAppIdentifiers;
- (NSNumber)payloadAppleAudioVideoCalls;
- (NSNumber)payloadEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAllowListAppIdentifiers:(id)a3;
- (void)setPayloadAppleAudioVideoCalls:(id)a3;
- (void)setPayloadEnabled:(id)a3;
@end

@implementation RMModelNetworkWiFiDeclaration_QoSMarkingPolicy

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AllowListAppIdentifiers";
  v6[1] = @"AppleAudioVideoCalls";
  v6[2] = @"Enabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAllowListAppIdentifiers:(id)a3 appleAudioVideoCalls:(id)a4 enabled:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadAllowListAppIdentifiers:v9];

  v11 = (void *)MEMORY[0x263EFFA88];
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAppleAudioVideoCalls:v12];

  if (v7) {
    id v13 = v7;
  }
  else {
    id v13 = v11;
  }
  [v10 setPayloadEnabled:v13];

  return v10;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"AllowListAppIdentifiers" forKeyPath:@"payloadAllowListAppIdentifiers" validator:&__block_literal_global_468 isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"AppleAudioVideoCalls" forKeyPath:@"payloadAppleAudioVideoCalls" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Enabled" forKeyPath:@"payloadEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5];
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkWiFiDeclaration_QoSMarkingPolicy *)self payloadAllowListAppIdentifiers];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"AllowListAppIdentifiers" value:v5 itemSerializer:&__block_literal_global_476 isRequired:0 defaultValue:0];

  v6 = [(RMModelNetworkWiFiDeclaration_QoSMarkingPolicy *)self payloadAppleAudioVideoCalls];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"AppleAudioVideoCalls" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  id v8 = [(RMModelNetworkWiFiDeclaration_QoSMarkingPolicy *)self payloadEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enabled" value:v8 isRequired:0 defaultValue:v7];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelNetworkWiFiDeclaration_QoSMarkingPolicy;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadAllowListAppIdentifiers copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAppleAudioVideoCalls copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadEnabled copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)payloadAllowListAppIdentifiers
{
  return self->_payloadAllowListAppIdentifiers;
}

- (void)setPayloadAllowListAppIdentifiers:(id)a3
{
}

- (NSNumber)payloadAppleAudioVideoCalls
{
  return self->_payloadAppleAudioVideoCalls;
}

- (void)setPayloadAppleAudioVideoCalls:(id)a3
{
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
  objc_storeStrong((id *)&self->_payloadAppleAudioVideoCalls, 0);
  objc_storeStrong((id *)&self->_payloadAllowListAppIdentifiers, 0);
}

@end