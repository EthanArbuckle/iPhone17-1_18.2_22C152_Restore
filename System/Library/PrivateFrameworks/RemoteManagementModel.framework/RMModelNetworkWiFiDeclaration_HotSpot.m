@interface RMModelNetworkWiFiDeclaration_HotSpot
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithDisplayedOperatorName:(id)a3 domainName:(id)a4 roamingConsortiumOIs:(id)a5 serviceProviderRoamingEnabled:(id)a6 HESSID:(id)a7 naiRealmNames:(id)a8 mccAndMNCs:(id)a9;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadMCCAndMNCs;
- (NSArray)payloadNAIRealmNames;
- (NSArray)payloadRoamingConsortiumOIs;
- (NSNumber)payloadServiceProviderRoamingEnabled;
- (NSString)payloadDisplayedOperatorName;
- (NSString)payloadDomainName;
- (NSString)payloadHESSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadDisplayedOperatorName:(id)a3;
- (void)setPayloadDomainName:(id)a3;
- (void)setPayloadHESSID:(id)a3;
- (void)setPayloadMCCAndMNCs:(id)a3;
- (void)setPayloadNAIRealmNames:(id)a3;
- (void)setPayloadRoamingConsortiumOIs:(id)a3;
- (void)setPayloadServiceProviderRoamingEnabled:(id)a3;
@end

@implementation RMModelNetworkWiFiDeclaration_HotSpot

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DisplayedOperatorName";
  v6[1] = @"DomainName";
  v6[2] = @"RoamingConsortiumOIs";
  v6[3] = @"ServiceProviderRoamingEnabled";
  v6[4] = @"HESSID";
  v6[5] = @"NAIRealmNames";
  v6[6] = @"MCCAndMNCs";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDisplayedOperatorName:(id)a3 domainName:(id)a4 roamingConsortiumOIs:(id)a5 serviceProviderRoamingEnabled:(id)a6 HESSID:(id)a7 naiRealmNames:(id)a8 mccAndMNCs:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setPayloadDisplayedOperatorName:v21];

  [v22 setPayloadDomainName:v20];
  [v22 setPayloadRoamingConsortiumOIs:v19];

  if (v18) {
    id v23 = v18;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA80];
  }
  [v22 setPayloadServiceProviderRoamingEnabled:v23];

  [v22 setPayloadHESSID:v17];
  [v22 setPayloadNAIRealmNames:v16];

  [v22 setPayloadMCCAndMNCs:v15];
  return v22;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelNetworkWiFiDeclaration_HotSpot allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DisplayedOperatorName" forKeyPath:@"payloadDisplayedOperatorName" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DomainName" forKeyPath:@"payloadDomainName" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"RoamingConsortiumOIs" forKeyPath:@"payloadRoamingConsortiumOIs" validator:&__block_literal_global_388 isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"ServiceProviderRoamingEnabled" forKeyPath:@"payloadServiceProviderRoamingEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"HESSID" forKeyPath:@"payloadHESSID" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = 0;
            if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"NAIRealmNames" forKeyPath:@"payloadNAIRealmNames" validator:&__block_literal_global_399_0 isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"MCCAndMNCs" forKeyPath:@"payloadMCCAndMNCs" validator:&__block_literal_global_404 isRequired:0 defaultValue:0 error:a5];
            }
          }
        }
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadDisplayedOperatorName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DisplayedOperatorName" value:v5 isRequired:0 defaultValue:0];

  v6 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadDomainName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DomainName" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadRoamingConsortiumOIs];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"RoamingConsortiumOIs" value:v7 itemSerializer:&__block_literal_global_406 isRequired:0 defaultValue:0];

  v8 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadServiceProviderRoamingEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"ServiceProviderRoamingEnabled" value:v8 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v9 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadHESSID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"HESSID" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadNAIRealmNames];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"NAIRealmNames" value:v10 itemSerializer:&__block_literal_global_408 isRequired:0 defaultValue:0];

  v11 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self payloadMCCAndMNCs];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"MCCAndMNCs" value:v11 itemSerializer:&__block_literal_global_410 isRequired:0 defaultValue:0];

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RMModelNetworkWiFiDeclaration_HotSpot;
  v4 = [(RMModelPayloadBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDisplayedOperatorName copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDomainName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadRoamingConsortiumOIs copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadServiceProviderRoamingEnabled copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadHESSID copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadNAIRealmNames copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadMCCAndMNCs copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)payloadDisplayedOperatorName
{
  return self->_payloadDisplayedOperatorName;
}

- (void)setPayloadDisplayedOperatorName:(id)a3
{
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
}

- (NSArray)payloadRoamingConsortiumOIs
{
  return self->_payloadRoamingConsortiumOIs;
}

- (void)setPayloadRoamingConsortiumOIs:(id)a3
{
}

- (NSNumber)payloadServiceProviderRoamingEnabled
{
  return self->_payloadServiceProviderRoamingEnabled;
}

- (void)setPayloadServiceProviderRoamingEnabled:(id)a3
{
}

- (NSString)payloadHESSID
{
  return self->_payloadHESSID;
}

- (void)setPayloadHESSID:(id)a3
{
}

- (NSArray)payloadNAIRealmNames
{
  return self->_payloadNAIRealmNames;
}

- (void)setPayloadNAIRealmNames:(id)a3
{
}

- (NSArray)payloadMCCAndMNCs
{
  return self->_payloadMCCAndMNCs;
}

- (void)setPayloadMCCAndMNCs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_payloadNAIRealmNames, 0);
  objc_storeStrong((id *)&self->_payloadHESSID, 0);
  objc_storeStrong((id *)&self->_payloadServiceProviderRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadRoamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayedOperatorName, 0);
}

@end