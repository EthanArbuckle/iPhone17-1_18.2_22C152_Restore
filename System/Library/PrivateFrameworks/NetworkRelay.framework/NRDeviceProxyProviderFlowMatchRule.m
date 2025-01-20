@interface NRDeviceProxyProviderFlowMatchRule
+ (BOOL)supportsSecureCoding;
+ (id)copyMatchRulesForCellularSlicing;
- (BOOL)hasMatchRulesExcludingEntitlements;
- (BOOL)hasMatchRulesWithTokens;
- (BOOL)isEqual:(id)a3;
- (NRDeviceProxyProviderFlowMatchRule)initWithCoder:(id)a3;
- (NRDeviceProxyProviderFlowMatchRule)initWithReceivedData:(id)a3;
- (NSDictionary)entitlements;
- (NSString)domain;
- (NSString)matchResultAccountID;
- (NSString)matchResultBundleID;
- (id)copyExcludedBundleIdentifiers;
- (id)copyMatchTokens;
- (id)copySendData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)trafficClass;
- (unsigned)transportProtocol;
- (void)addMatchRuleForClientsWithEntitlement:(id)a3 entitlementValue:(id)a4;
- (void)addMatchToken:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)excludeBundleIdentifier:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setMatchResultAccountID:(id)a3;
- (void)setMatchResultBundleID:(id)a3;
- (void)setTrafficClass:(unsigned __int16)a3;
- (void)setTransportProtocol:(unsigned __int8)a3;
@end

@implementation NRDeviceProxyProviderFlowMatchRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchResultBundleID, 0);
  objc_storeStrong((id *)&self->_matchResultAccountID, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_excludedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_matchTokens, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setMatchResultBundleID:(id)a3
{
}

- (NSString)matchResultBundleID
{
  return self->_matchResultBundleID;
}

- (void)setMatchResultAccountID:(id)a3
{
}

- (NSString)matchResultAccountID
{
  return self->_matchResultAccountID;
}

- (void)setEntitlements:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setTrafficClass:(unsigned __int16)a3
{
  self->_trafficClass = a3;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (void)setTransportProtocol:(unsigned __int8)a3
{
  self->_transportProtocol = a3;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (BOOL)hasMatchRulesWithTokens
{
  if (self) {
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_matchTokens;
  }
  return [(NRDeviceProxyProviderFlowMatchRule *)self count] != 0;
}

- (BOOL)hasMatchRulesExcludingEntitlements
{
  if ([(NRDeviceProxyProviderFlowMatchRule *)self trafficClass]
    || [(NRDeviceProxyProviderFlowMatchRule *)self transportProtocol])
  {
    return 1;
  }
  v5 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)excludeBundleIdentifier:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 length];
  id v5 = v10;
  if (v4)
  {
    v6 = self ? self->_excludedBundleIdentifiers : 0;
    uint64_t v4 = [(NSArray *)v6 containsObject:v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      id v7 = objc_alloc(MEMORY[0x263EFF980]);
      if (self) {
        excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
      }
      else {
        excludedBundleIdentifiers = 0;
      }
      v9 = (void *)[v7 initWithArray:excludedBundleIdentifiers];
      [v9 addObject:v10];
      if (self) {
        objc_storeStrong((id *)&self->_excludedBundleIdentifiers, v9);
      }

      id v5 = v10;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)copyExcludedBundleIdentifiers
{
  if (self) {
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_excludedBundleIdentifiers;
  }
  return self;
}

- (void)addMatchToken:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 length];
  id v5 = v10;
  if (v4)
  {
    v6 = self ? self->_matchTokens : 0;
    uint64_t v4 = [(NSArray *)v6 containsObject:v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      id v7 = objc_alloc(MEMORY[0x263EFF980]);
      if (self) {
        matchTokens = self->_matchTokens;
      }
      else {
        matchTokens = 0;
      }
      v9 = (void *)[v7 initWithArray:matchTokens];
      [v9 addObject:v10];
      if (self) {
        objc_storeStrong((id *)&self->_matchTokens, v9);
      }

      id v5 = v10;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)copyMatchTokens
{
  if (self) {
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_matchTokens;
  }
  return self;
}

- (void)addMatchRuleForClientsWithEntitlement:(id)a3 entitlementValue:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (!v26)
  {
    id v10 = nrCopyLogObj_612();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v14) {
        goto LABEL_5;
      }
    }
    id v9 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%s called with null entitlement", v15, v16, v17, v18, v19, (uint64_t)"-[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:]");
    goto LABEL_4;
  }
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    v8 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
    id v9 = (id)[v7 initWithDictionary:v8];

    [v9 setObject:v6 forKeyedSubscript:v26];
    [(NRDeviceProxyProviderFlowMatchRule *)self setEntitlements:v9];
LABEL_4:

    goto LABEL_5;
  }
  v12 = nrCopyLogObj_612();
  v13 = v12;
  if (sNRCopyLogToStdErr)
  {

LABEL_15:
    id v9 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%s called with null entitlementValue", v21, v22, v23, v24, v25, (uint64_t)"-[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:]");
    goto LABEL_4;
  }
  BOOL v20 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

  if (v20) {
    goto LABEL_15;
  }
LABEL_5:
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"), @"trafficClass");
  objc_msgSend(v9, "encodeInt32:forKey:", -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"), @"transportProtocol");
  uint64_t v4 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
  [v9 encodeObject:v4 forKey:@"domain"];

  id v5 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
  [v9 encodeObject:v5 forKey:@"entitlements"];

  if (self)
  {
    [v9 encodeObject:self->_matchTokens forKey:@"matchTokens"];
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  }
  else
  {
    [v9 encodeObject:0 forKey:@"matchTokens"];
    excludedBundleIdentifiers = 0;
  }
  [v9 encodeObject:excludedBundleIdentifiers forKey:@"excludedBundleIdentifiers"];
  id v7 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
  [v9 encodeObject:v7 forKey:@"matchResultAccountID"];

  v8 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
  [v9 encodeObject:v8 forKey:@"matchResultBundleID"];
}

- (NRDeviceProxyProviderFlowMatchRule)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NRDeviceProxyProviderFlowMatchRule;
  id v5 = [(NRDeviceProxyProviderFlowMatchRule *)&v28 init];
  if (!v5)
  {
    uint64_t v17 = nrCopyLogObj_612();
    uint64_t v18 = v17;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v19)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v26 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v26 = 136446210;
        *(void *)(v26 + 4) = "-[NRDeviceProxyProviderFlowMatchRule initWithCoder:]";
        id v27 = nrCopyLogObj_612();
        _NRLogAbortWithPack(v27);
      }
    }
    id v20 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v20, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v21, v22, v23, v24, v25, (uint64_t)"");

    goto LABEL_8;
  }
  id v6 = v5;
  -[NRDeviceProxyProviderFlowMatchRule setTrafficClass:](v5, "setTrafficClass:", (unsigned __int16)[v4 decodeInt32ForKey:@"trafficClass"]);
  -[NRDeviceProxyProviderFlowMatchRule setTransportProtocol:](v6, "setTransportProtocol:", [v4 decodeInt32ForKey:@"transportProtocol"]);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  [(NRDeviceProxyProviderFlowMatchRule *)v6 setDomain:v7];

  uint64_t v8 = objc_opt_class();
  id v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"entitlements"];
  [(NRDeviceProxyProviderFlowMatchRule *)v6 setEntitlements:v9];

  uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"matchTokens"];
  matchTokens = v6->_matchTokens;
  v6->_matchTokens = (NSArray *)v10;

  uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"excludedBundleIdentifiers"];
  excludedBundleIdentifiers = v6->_excludedBundleIdentifiers;
  v6->_excludedBundleIdentifiers = (NSArray *)v12;

  BOOL v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchResultAccountID"];
  [(NRDeviceProxyProviderFlowMatchRule *)v6 setMatchResultAccountID:v14];

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchResultBundleID"];
  [(NRDeviceProxyProviderFlowMatchRule *)v6 setMatchResultBundleID:v15];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTrafficClass:", -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"));
  objc_msgSend(v4, "setTransportProtocol:", -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"));
  id v5 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
  id v6 = (void *)[v5 copy];
  [v4 setDomain:v6];

  id v7 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setEntitlements:v8];

  if (self) {
    matchTokens = self->_matchTokens;
  }
  else {
    matchTokens = 0;
  }
  uint64_t v10 = matchTokens;
  v11 = (void *)[(NSArray *)v10 copy];
  if (v4) {
    objc_storeStrong(v4 + 3, v11);
  }

  if (self) {
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  }
  else {
    excludedBundleIdentifiers = 0;
  }
  v13 = excludedBundleIdentifiers;
  BOOL v14 = (void *)[(NSArray *)v13 copy];
  if (v4) {
    objc_storeStrong(v4 + 4, v14);
  }

  uint64_t v15 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setMatchResultAccountID:v16];

  uint64_t v17 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setMatchResultBundleID:v18];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int v6 = [(NRDeviceProxyProviderFlowMatchRule *)self trafficClass];
      if (v6 != [v5 trafficClass]) {
        goto LABEL_35;
      }
      int v7 = [(NRDeviceProxyProviderFlowMatchRule *)self transportProtocol];
      if (v7 != [v5 transportProtocol]) {
        goto LABEL_35;
      }
      uint64_t v8 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
      if (v8)
      {
      }
      else
      {
        uint64_t v10 = [v5 domain];

        if (!v10) {
          goto LABEL_10;
        }
      }
      v11 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
      uint64_t v12 = [v5 domain];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_35;
      }
LABEL_10:
      BOOL v14 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
      if (v14)
      {
      }
      else
      {
        uint64_t v15 = [v5 entitlements];

        if (!v15) {
          goto LABEL_14;
        }
      }
      uint64_t v16 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
      uint64_t v17 = [v5 entitlements];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_35;
      }
LABEL_14:
      if (self)
      {
        BOOL v19 = self->_matchTokens;
        if (v19)
        {

          uint64_t v20 = v5[3];
        }
        else
        {
          uint64_t v20 = v5[3];
          if (!v20)
          {
LABEL_21:
            uint64_t v24 = self->_excludedBundleIdentifiers;
            if (v24)
            {

              uint64_t v25 = v5[4];
            }
            else
            {
              uint64_t v25 = v5[4];
              if (!v25) {
                goto LABEL_26;
              }
            }
            excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
            goto LABEL_25;
          }
        }
        matchTokens = self->_matchTokens;
      }
      else
      {
        uint64_t v20 = v5[3];
        if (!v20) {
          goto LABEL_40;
        }
        matchTokens = 0;
      }
      uint64_t v22 = matchTokens;
      int v23 = [(NSArray *)v22 isEqual:v20];

      if (!v23) {
        goto LABEL_35;
      }
      if (self) {
        goto LABEL_21;
      }
LABEL_40:
      uint64_t v25 = v5[4];
      if (!v25) {
        goto LABEL_26;
      }
      excludedBundleIdentifiers = 0;
LABEL_25:
      id v27 = excludedBundleIdentifiers;
      int v28 = [(NSArray *)v27 isEqual:v25];

      if (!v28) {
        goto LABEL_35;
      }
LABEL_26:
      uint64_t v29 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
      if (v29)
      {
      }
      else
      {
        v30 = [v5 matchResultAccountID];

        if (!v30)
        {
LABEL_30:
          v34 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
          if (v34)
          {
          }
          else
          {
            v35 = [v5 matchResultBundleID];

            if (!v35)
            {
LABEL_34:
              BOOL v9 = 1;
LABEL_36:

              goto LABEL_37;
            }
          }
          v36 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
          v37 = [v5 matchResultBundleID];
          int v38 = [v36 isEqual:v37];

          if (v38) {
            goto LABEL_34;
          }
LABEL_35:
          BOOL v9 = 0;
          goto LABEL_36;
        }
      }
      v31 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
      v32 = [v5 matchResultAccountID];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_35;
      }
      goto LABEL_30;
    }
  }
  BOOL v9 = 0;
LABEL_37:

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendString:@"NRDPPMatchRule["];
  objc_msgSend(v3, "appendFormat:", @"tc: %u", -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"));
  if ([(NRDeviceProxyProviderFlowMatchRule *)self transportProtocol]) {
    [v3 appendFormat:@", proto: %u", -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol")];
  }
  id v4 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];

  if (v4)
  {
    id v5 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
    [v3 appendFormat:@", domain: %@", v5];
  }
  int v6 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
    [v3 appendFormat:@", entitlements: %@", v8];
  }
  if (self)
  {
    if (![(NSArray *)self->_matchTokens count]) {
      goto LABEL_12;
    }
  }
  else if (![0 count])
  {
    goto LABEL_12;
  }
  if (self) {
    matchTokens = self->_matchTokens;
  }
  else {
    matchTokens = 0;
  }
  [v3 appendFormat:@", tokens: %@", matchTokens];
LABEL_12:
  if (self)
  {
    if (![(NSArray *)self->_excludedBundleIdentifiers count]) {
      goto LABEL_17;
    }
  }
  else if (![0 count])
  {
    goto LABEL_17;
  }
  if (self) {
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  }
  else {
    excludedBundleIdentifiers = 0;
  }
  [v3 appendFormat:@", excl-bndl: %@", excludedBundleIdentifiers];
LABEL_17:
  v11 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    int v13 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultAccountID];
    [v3 appendFormat:@", res-acc-id: %@", v13];
  }
  BOOL v14 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = [(NRDeviceProxyProviderFlowMatchRule *)self matchResultBundleID];
    [v3 appendFormat:@", res-bndl-id: %@", v16];
  }
  [v3 appendString:@"]"];
  return v3;
}

- (id)copySendData
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  if ([(NRDeviceProxyProviderFlowMatchRule *)self trafficClass])
  {
    int v4 = [(NRDeviceProxyProviderFlowMatchRule *)self trafficClass];
    if (v4 > 499)
    {
      if (v4 <= 699)
      {
        if (v4 == 500)
        {
          char v10 = 5;
          goto LABEL_30;
        }
        if (v4 == 600)
        {
          char v10 = 6;
          goto LABEL_30;
        }
      }
      else
      {
        switch(v4)
        {
          case 700:
            char v10 = 7;
            goto LABEL_30;
          case 800:
            char v10 = 8;
            goto LABEL_30;
          case 900:
            char v10 = 9;
            goto LABEL_30;
        }
      }
    }
    else if (v4 <= 199)
    {
      if (!v4)
      {
LABEL_29:
        char v10 = 0;
        goto LABEL_30;
      }
      if (v4 == 100)
      {
        char v10 = 1;
        goto LABEL_30;
      }
    }
    else
    {
      switch(v4)
      {
        case 200:
          char v10 = 2;
          goto LABEL_30;
        case 300:
          char v10 = 3;
          goto LABEL_30;
        case 400:
          char v10 = 4;
LABEL_30:
          char v49 = v10;
          NRTLVAdd(v3, 1, 1u, (uint64_t)&v49);
          goto LABEL_31;
      }
    }
    if (nrCopyLogObj_onceToken_614 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_616, 16, (uint64_t)"%s%.30s:%-4d unexpected SOTraffic class %u", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_29;
  }
LABEL_31:
  if ([(NRDeviceProxyProviderFlowMatchRule *)self transportProtocol]) {
    NRTLVAdd(v3, 2, 1u, (uint64_t)&self->_transportProtocol);
  }
  v11 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];

  if (v11)
  {
    uint64_t v12 = [(NRDeviceProxyProviderFlowMatchRule *)self domain];
    int v13 = [v12 dataUsingEncoding:4];

    id v14 = v13;
    id v15 = v3;
    NRTLVAdd(v15, 3, (unsigned __int16)[v14 length], objc_msgSend(v14, "bytes"));
  }
  uint64_t v16 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    int v18 = (void *)MEMORY[0x263F08AC0];
    BOOL v19 = [(NRDeviceProxyProviderFlowMatchRule *)self entitlements];
    uint64_t v48 = 0;
    uint64_t v20 = [v18 dataWithPropertyList:v19 format:200 options:0 error:&v48];

    id v21 = v20;
    id v22 = v3;
    NRTLVAdd(v22, 4, (unsigned __int16)[v21 length], objc_msgSend(v21, "bytes"));
  }
  if (self)
  {
    if (![(NSArray *)self->_matchTokens count]) {
      goto LABEL_49;
    }
  }
  else if (![0 count])
  {
    goto LABEL_49;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  if (self) {
    matchTokens = self->_matchTokens;
  }
  else {
    matchTokens = 0;
  }
  uint64_t v24 = matchTokens;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(id *)(*((void *)&v44 + 1) + 8 * i);
        id v30 = v3;
        NRTLVAdd(v30, 5, (unsigned __int16)[v29 length], objc_msgSend(v29, "bytes"));
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v26);
  }

LABEL_49:
  if (self)
  {
    if (![(NSArray *)self->_excludedBundleIdentifiers count]) {
      return v3;
    }
  }
  else if (![0 count])
  {
    return v3;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  if (self) {
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  }
  else {
    excludedBundleIdentifiers = 0;
  }
  v32 = excludedBundleIdentifiers;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = [*(id *)(*((void *)&v40 + 1) + 8 * j) dataUsingEncoding:4];
        id v38 = v3;
        NRTLVAdd(v38, 6, (unsigned __int16)[v37 length], objc_msgSend(v37, "bytes"));
      }
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v34);
  }

  return v3;
}

- (NRDeviceProxyProviderFlowMatchRule)initWithReceivedData:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NRDeviceProxyProviderFlowMatchRule;
  uint64_t v5 = [(NRDeviceProxyProviderFlowMatchRule *)&v27 init];
  if (!v5)
  {
    uint64_t v9 = nrCopyLogObj_612();
    char v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_11:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "-[NRDeviceProxyProviderFlowMatchRule initWithReceivedData:]";
        id v19 = nrCopyLogObj_612();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_11;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__NRDeviceProxyProviderFlowMatchRule_initWithReceivedData___block_invoke;
  v20[3] = &unk_263FD1210;
  id v22 = &v23;
  uint64_t v6 = v5;
  id v21 = v6;
  NRTLVParse(v4, v20);
  if (*((unsigned char *)v24 + 24)) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t __59__NRDeviceProxyProviderFlowMatchRule_initWithReceivedData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *(unsigned __int16 *)(a2 + 1);
  uint64_t v10 = __rev16(v9);
  switch(*(unsigned char *)a2)
  {
    case 1:
      if (v9 != 256)
      {
        if (nrCopyLogObj_onceToken_614 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = nrCopyLogObj_sNRLogObj_616;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      unsigned int v11 = *(unsigned __int8 *)(a2 + 3);
      if (v11 >= 0xA)
      {
        if (nrCopyLogObj_onceToken_614 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_616, 16, (uint64_t)"%s%.30s:%-4d unexpected NRTraffic class %u", a4, a5, a6, a7, a8, (uint64_t)"");
        }
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v12 = 100 * v11;
      }
      [*(id *)(a1 + 32) setTrafficClass:v12];
      return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    case 2:
      if (v9 == 256)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a2 + 3);
      }
      else
      {
        if (nrCopyLogObj_onceToken_614 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = nrCopyLogObj_sNRLogObj_616;
LABEL_35:
          _NRLogWithArgs(v22, 16, (uint64_t)"%s%.30s:%-4d invalid length", a4, a5, a6, a7, a8, (uint64_t)"");
        }
LABEL_36:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
      return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    case 3:
      uint64_t v14 = (void *)[[NSString alloc] initWithBytes:a2 + 3 length:v10 encoding:4];
      [*(id *)(a1 + 32) setDomain:v14];
      break;
    case 4:
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 + 3 length:v10];
      id v24 = 0;
      uint64_t v15 = [MEMORY[0x263F08AC0] propertyListWithData:v14 options:0 format:0 error:&v24];
      id v16 = v24;
      [*(id *)(a1 + 32) setEntitlements:v15];

      if (v16)
      {
        if (nrCopyLogObj_onceToken_614 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_616, 16, (uint64_t)"%s%.30s:%-4d deserialization error %@", v17, v18, v19, v20, v21, (uint64_t)"");
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }

      break;
    case 5:
      if (!*(_WORD *)(a2 + 1)) {
        return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 + 3 length:v10];
      [*(id *)(a1 + 32) addMatchToken:v14];
      break;
    default:
      if (*(unsigned char *)a2 != 6 || v9 == 0) {
        return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      uint64_t v14 = (void *)[[NSString alloc] initWithBytes:a2 + 3 length:v10 encoding:4];
      if (v14) {
        [*(id *)(a1 + 32) excludeBundleIdentifier:v14];
      }
      break;
  }

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

+ (id)copyMatchRulesForCellularSlicing
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = [&unk_26BE1DB60 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(&unk_26BE1DB60);
        }
        id v3 = *(id *)(*((void *)&v26 + 1) + 8 * v2);
        self;
        id v4 = [v3 componentsSeparatedByString:@"-"];

        uint64_t v20 = v2;
        if ((unint64_t)[v4 count] < 2)
        {
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = [v4 objectAtIndexedSubscript:1];
        }

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v6 = [&unk_26BE1DBF0 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v23;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v23 != v8) {
                objc_enumerationMutation(&unk_26BE1DBF0);
              }
              uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
              uint64_t v13 = objc_alloc_init(NRDeviceProxyProviderFlowMatchRule);
              uint64_t v14 = [&unk_26BE1DC18 objectForKeyedSubscript:v12];
              -[NRDeviceProxyProviderFlowMatchRule setTrafficClass:](v13, "setTrafficClass:", (unsigned __int16)[v14 unsignedIntValue]);
              id v15 = v12;
              self;
              id v16 = [v15 componentsSeparatedByString:@"-"];

              if ((unint64_t)[v16 count] >= 2)
              {
                uint64_t v10 = [v16 objectAtIndexedSubscript:1];
              }
              else
              {
                uint64_t v10 = 0;
              }

              unsigned int v11 = (void *)[[NSString alloc] initWithFormat:@"%@.%@.%@", @"com.apple.networkrelay.tethering", v10, v5];
              [(NRDeviceProxyProviderFlowMatchRule *)v13 setMatchResultAccountID:v11];

              [(NRDeviceProxyProviderFlowMatchRule *)v13 setMatchResultBundleID:@"com.apple.datausage.personalhotspot"];
              [(NRDeviceProxyProviderFlowMatchRule *)v13 addMatchRuleForClientsWithEntitlement:@"com.apple.developer.networking.slicing.appcategory" entitlementValue:v3];
              [(NRDeviceProxyProviderFlowMatchRule *)v13 addMatchRuleForClientsWithEntitlement:@"com.apple.developer.networking.slicing.trafficcategory" entitlementValue:v15];
              [v21 addObject:v13];

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [&unk_26BE1DBF0 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v7);
        }

        uint64_t v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [&unk_26BE1DB60 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v19);
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end