@interface RMModelAppManagedDeclaration_Attributes
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithHideable:(id)a3 lockable:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 cellularSliceUUID:(id)a7 contentFilterUUID:(id)a8 dnsProxyUUID:(id)a9 relayUUID:(id)a10 tapToPayScreenLock:(id)a11 VPNUUID:(id)a12;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAssociatedDomains;
- (NSNumber)payloadAssociatedDomainsEnableDirectDownloads;
- (NSNumber)payloadHideable;
- (NSNumber)payloadLockable;
- (NSNumber)payloadTapToPayScreenLock;
- (NSString)payloadCellularSliceUUID;
- (NSString)payloadContentFilterUUID;
- (NSString)payloadDNSProxyUUID;
- (NSString)payloadRelayUUID;
- (NSString)payloadVPNUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAssociatedDomains:(id)a3;
- (void)setPayloadAssociatedDomainsEnableDirectDownloads:(id)a3;
- (void)setPayloadCellularSliceUUID:(id)a3;
- (void)setPayloadContentFilterUUID:(id)a3;
- (void)setPayloadDNSProxyUUID:(id)a3;
- (void)setPayloadHideable:(id)a3;
- (void)setPayloadLockable:(id)a3;
- (void)setPayloadRelayUUID:(id)a3;
- (void)setPayloadTapToPayScreenLock:(id)a3;
- (void)setPayloadVPNUUID:(id)a3;
@end

@implementation RMModelAppManagedDeclaration_Attributes

+ (NSSet)allowedPayloadKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Hideable";
  v6[1] = @"Lockable";
  v6[2] = @"AssociatedDomains";
  v6[3] = @"AssociatedDomainsEnableDirectDownloads";
  v6[4] = @"CellularSliceUUID";
  v6[5] = @"ContentFilterUUID";
  v6[6] = @"DNSProxyUUID";
  v6[7] = @"RelayUUID";
  v6[8] = @"TapToPayScreenLock";
  v6[9] = @"VPNUUID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithHideable:(id)a3 lockable:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 cellularSliceUUID:(id)a7 contentFilterUUID:(id)a8 dnsProxyUUID:(id)a9 relayUUID:(id)a10 tapToPayScreenLock:(id)a11 VPNUUID:(id)a12
{
  id v37 = a12;
  id v18 = a11;
  id v35 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  v27 = v26;
  v28 = (void *)MEMORY[0x263EFFA88];
  if (v25) {
    id v29 = v25;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA88];
  }
  objc_msgSend(v26, "setPayloadHideable:", v29, v35);

  if (v24) {
    id v30 = v24;
  }
  else {
    id v30 = v28;
  }
  [v27 setPayloadLockable:v30];

  [v27 setPayloadAssociatedDomains:v23];
  v31 = (void *)MEMORY[0x263EFFA80];
  if (v22) {
    id v32 = v22;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA80];
  }
  [v27 setPayloadAssociatedDomainsEnableDirectDownloads:v32];

  [v27 setPayloadCellularSliceUUID:v21];
  [v27 setPayloadContentFilterUUID:v20];

  [v27 setPayloadDNSProxyUUID:v19];
  [v27 setPayloadRelayUUID:v36];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v31;
  }
  [v27 setPayloadTapToPayScreenLock:v33];

  [v27 setPayloadVPNUUID:v37];
  return v27;
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

  v11 = +[RMModelAppManagedDeclaration_Attributes allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Hideable" forKeyPath:@"payloadHideable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Lockable" forKeyPath:@"payloadLockable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"AssociatedDomains" forKeyPath:@"payloadAssociatedDomains" validator:&__block_literal_global_374 isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"AssociatedDomainsEnableDirectDownloads" forKeyPath:@"payloadAssociatedDomainsEnableDirectDownloads" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"CellularSliceUUID" forKeyPath:@"payloadCellularSliceUUID" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ContentFilterUUID" forKeyPath:@"payloadContentFilterUUID" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v13 = 0;
              if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DNSProxyUUID" forKeyPath:@"payloadDNSProxyUUID" isRequired:0 defaultValue:0 error:a5])
              {
                BOOL v13 = 0;
                if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"RelayUUID" forKeyPath:@"payloadRelayUUID" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v13 = 0;
                  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"TapToPayScreenLock" forKeyPath:@"payloadTapToPayScreenLock" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                  {
                    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VPNUUID" forKeyPath:@"payloadVPNUUID" isRequired:0 defaultValue:0 error:a5];
                  }
                }
              }
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
  v5 = [(RMModelAppManagedDeclaration_Attributes *)self payloadHideable];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Hideable" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  id v7 = [(RMModelAppManagedDeclaration_Attributes *)self payloadLockable];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Lockable" value:v7 isRequired:0 defaultValue:v6];

  v8 = [(RMModelAppManagedDeclaration_Attributes *)self payloadAssociatedDomains];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"AssociatedDomains" value:v8 itemSerializer:&__block_literal_global_399 isRequired:0 defaultValue:0];

  v9 = [(RMModelAppManagedDeclaration_Attributes *)self payloadAssociatedDomainsEnableDirectDownloads];
  uint64_t v10 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"AssociatedDomainsEnableDirectDownloads" value:v9 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v11 = [(RMModelAppManagedDeclaration_Attributes *)self payloadCellularSliceUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"CellularSliceUUID" value:v11 isRequired:0 defaultValue:0];

  v12 = [(RMModelAppManagedDeclaration_Attributes *)self payloadContentFilterUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ContentFilterUUID" value:v12 isRequired:0 defaultValue:0];

  BOOL v13 = [(RMModelAppManagedDeclaration_Attributes *)self payloadDNSProxyUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DNSProxyUUID" value:v13 isRequired:0 defaultValue:0];

  v14 = [(RMModelAppManagedDeclaration_Attributes *)self payloadRelayUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"RelayUUID" value:v14 isRequired:0 defaultValue:0];

  v15 = [(RMModelAppManagedDeclaration_Attributes *)self payloadTapToPayScreenLock];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"TapToPayScreenLock" value:v15 isRequired:0 defaultValue:v10];

  v16 = [(RMModelAppManagedDeclaration_Attributes *)self payloadVPNUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VPNUUID" value:v16 isRequired:0 defaultValue:0];

  v17 = (void *)[v4 copy];
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RMModelAppManagedDeclaration_Attributes;
  v4 = [(RMModelPayloadBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadHideable copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadLockable copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadAssociatedDomains copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAssociatedDomainsEnableDirectDownloads copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadCellularSliceUUID copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadContentFilterUUID copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_payloadDNSProxyUUID copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_payloadRelayUUID copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadTapToPayScreenLock copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSString *)self->_payloadVPNUUID copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSNumber)payloadHideable
{
  return self->_payloadHideable;
}

- (void)setPayloadHideable:(id)a3
{
}

- (NSNumber)payloadLockable
{
  return self->_payloadLockable;
}

- (void)setPayloadLockable:(id)a3
{
}

- (NSArray)payloadAssociatedDomains
{
  return self->_payloadAssociatedDomains;
}

- (void)setPayloadAssociatedDomains:(id)a3
{
}

- (NSNumber)payloadAssociatedDomainsEnableDirectDownloads
{
  return self->_payloadAssociatedDomainsEnableDirectDownloads;
}

- (void)setPayloadAssociatedDomainsEnableDirectDownloads:(id)a3
{
}

- (NSString)payloadCellularSliceUUID
{
  return self->_payloadCellularSliceUUID;
}

- (void)setPayloadCellularSliceUUID:(id)a3
{
}

- (NSString)payloadContentFilterUUID
{
  return self->_payloadContentFilterUUID;
}

- (void)setPayloadContentFilterUUID:(id)a3
{
}

- (NSString)payloadDNSProxyUUID
{
  return self->_payloadDNSProxyUUID;
}

- (void)setPayloadDNSProxyUUID:(id)a3
{
}

- (NSString)payloadRelayUUID
{
  return self->_payloadRelayUUID;
}

- (void)setPayloadRelayUUID:(id)a3
{
}

- (NSNumber)payloadTapToPayScreenLock
{
  return self->_payloadTapToPayScreenLock;
}

- (void)setPayloadTapToPayScreenLock:(id)a3
{
}

- (NSString)payloadVPNUUID
{
  return self->_payloadVPNUUID;
}

- (void)setPayloadVPNUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
  objc_storeStrong((id *)&self->_payloadTapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_payloadRelayUUID, 0);
  objc_storeStrong((id *)&self->_payloadDNSProxyUUID, 0);
  objc_storeStrong((id *)&self->_payloadContentFilterUUID, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadAssociatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_payloadAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_payloadLockable, 0);
  objc_storeStrong((id *)&self->_payloadHideable, 0);
}

@end