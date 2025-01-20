@interface NRDeviceProxyProviderCriteria
+ (BOOL)supportsSecureCoding;
+ (id)copyCriteriaForCellularSlicing;
- (BOOL)allowsDemuxForwarding;
- (BOOL)allowsListenerClients;
- (BOOL)excludeClientApplication;
- (BOOL)excludeLegacyClients;
- (BOOL)excludeNonMatchingLegacyClients;
- (BOOL)excludeVPNClients;
- (BOOL)forwardNonMatchingTraffic;
- (BOOL)hasProxyCriteriaAssigningTokens;
- (BOOL)hasValidProxyCriteria;
- (BOOL)isEqual:(id)a3;
- (NRDeviceProxyProviderCriteria)initWithCoder:(id)a3;
- (NRDeviceProxyProviderCriteria)initWithReceivedData:(id)a3;
- (NSArray)proxyUsageRules;
- (id)copySendData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setForwardNonMatchingTraffic:(BOOL)a3;
- (void)setProxyUsageRules:(id)a3;
@end

@implementation NRDeviceProxyProviderCriteria

- (void).cxx_destruct
{
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setProxyUsageRules:(id)a3
{
}

- (NSArray)proxyUsageRules
{
  return self->_proxyUsageRules;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"["];
  v4 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
    [v3 appendFormat:@"%@ ", v6];
  }
  if ([(NRDeviceProxyProviderCriteria *)self forwardNonMatchingTraffic]) {
    [v3 appendString:@"fwd "];
  }
  if ([(NRDeviceProxyProviderCriteria *)self excludeLegacyClients]) {
    [v3 appendString:@"excl-l "];
  }
  if ([(NRDeviceProxyProviderCriteria *)self excludeNonMatchingLegacyClients]) {
    [v3 appendString:@"excl-nm-l "];
  }
  if ([(NRDeviceProxyProviderCriteria *)self excludeVPNClients]) {
    [v3 appendString:@"excl-v "];
  }
  if ([(NRDeviceProxyProviderCriteria *)self excludeClientApplication]) {
    [v3 appendString:@"excl-c "];
  }
  [v3 appendString:@"]"];
  return v3;
}

- (BOOL)hasProxyCriteriaAssigningTokens
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasMatchRulesWithTokens])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasValidProxyCriteria
{
  uint64_t v3 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  return [(NRDeviceProxyProviderCriteria *)self forwardNonMatchingTraffic];
}

- (BOOL)allowsDemuxForwarding
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)allowsListenerClients
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (BOOL)excludeClientApplication
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)excludeVPNClients
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)excludeNonMatchingLegacyClients
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)excludeLegacyClients
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)forwardNonMatchingTraffic
{
  return self->_flags & 1;
}

- (void)setForwardNonMatchingTraffic:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceProxyProviderCriteria flags](self, "flags"), @"flags");
  id v5 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  [v4 encodeObject:v5 forKey:@"proxyUsageRules"];
}

- (NRDeviceProxyProviderCriteria)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRDeviceProxyProviderCriteria;
  id v5 = [(NRDeviceProxyProviderCriteria *)&v20 init];
  if (!v5)
  {
    long long v9 = nrCopyLogObj_612();
    long long v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "-[NRDeviceProxyProviderCriteria initWithCoder:]";
        id v19 = nrCopyLogObj_612();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceProxyProviderCriteria setFlags:](v5, "setFlags:", [v4 decodeInt64ForKey:@"flags"]);
  long long v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyUsageRules"];
  [(NRDeviceProxyProviderCriteria *)v6 setProxyUsageRules:v7];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlags:", -[NRDeviceProxyProviderCriteria flags](self, "flags"));
  id v5 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  v6 = (void *)[v5 copy];
  [v4 setProxyUsageRules:v6];

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
      unint64_t v6 = [(NRDeviceProxyProviderCriteria *)self flags];
      if (v6 == [v5 flags])
      {
        long long v7 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
        if (v7)
        {
        }
        else
        {
          long long v9 = [v5 proxyUsageRules];

          if (!v9)
          {
LABEL_9:
            BOOL v8 = 1;
LABEL_11:

            goto LABEL_12;
          }
        }
        long long v10 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
        BOOL v11 = [v5 proxyUsageRules];
        int v12 = [v10 isEqual:v11];

        if (v12) {
          goto LABEL_9;
        }
      }
      BOOL v8 = 0;
      goto LABEL_11;
    }
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (id)copySendData
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  id v4 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v6 = [(NRDeviceProxyProviderCriteria *)self proxyUsageRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (id)[*(id *)(*((void *)&v15 + 1) + 8 * v10) copySendData];
          id v12 = v3;
          NRTLVAdd(v12, 50, (unsigned __int16)[v11 length], objc_msgSend(v11, "bytes"));

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  if ([(NRDeviceProxyProviderCriteria *)self flags])
  {
    unint64_t v14 = bswap64([(NRDeviceProxyProviderCriteria *)self flags]);
    NRTLVAdd(v3, 51, 8u, (uint64_t)&v14);
  }
  return v3;
}

- (NRDeviceProxyProviderCriteria)initWithReceivedData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NRDeviceProxyProviderCriteria;
  uint64_t v5 = [(NRDeviceProxyProviderCriteria *)&v29 init];
  if (!v5)
  {
    uint64_t v9 = nrCopyLogObj_612();
    uint64_t v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_13:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "-[NRDeviceProxyProviderCriteria initWithReceivedData:]";
        id v19 = nrCopyLogObj_612();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_612();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_13;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__NRDeviceProxyProviderCriteria_initWithReceivedData___block_invoke;
  v20[3] = &unk_263FD1210;
  v22 = &v23;
  unint64_t v6 = v5;
  uint64_t v21 = v6;
  NRTLVParse(v4, v20);
  if ([(id)v24[5] count]) {
    [(NRDeviceProxyProviderCriteria *)v6 setProxyUsageRules:v24[5]];
  }
  if ([(NRDeviceProxyProviderCriteria *)v6 hasValidProxyCriteria]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t __54__NRDeviceProxyProviderCriteria_initWithReceivedData___block_invoke(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *(unsigned __int16 *)(a2 + 1);
  uint64_t v10 = __rev16(v9);
  int v11 = *a2;
  if (v11 == 51)
  {
    if (v9 == 2048)
    {
      [*(id *)(a1 + 32) setFlags:bswap64(*(void *)(a2 + 3))];
    }
    else
    {
      if (nrCopyLogObj_onceToken_614 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_616, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_616, 16, (uint64_t)"%s%.30s:%-4d invalid size for flags %u != %zu", a4, a5, a6, a7, a8, (uint64_t)"");
      }
    }
  }
  else if (v11 == 50)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 + 3 length:v10];
    uint64_t v13 = [[NRDeviceProxyProviderFlowMatchRule alloc] initWithReceivedData:v12];
    if (v13) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
    }
  }
  return 1;
}

+ (id)copyCriteriaForCellularSlicing
{
  v2 = objc_alloc_init(NRDeviceProxyProviderCriteria);
  id v3 = +[NRDeviceProxyProviderFlowMatchRule copyMatchRulesForCellularSlicing];
  [(NRDeviceProxyProviderCriteria *)v2 setProxyUsageRules:v3];

  [(NRDeviceProxyProviderCriteria *)v2 setFlags:[(NRDeviceProxyProviderCriteria *)v2 flags] | 0x10];
  [(NRDeviceProxyProviderCriteria *)v2 setFlags:[(NRDeviceProxyProviderCriteria *)v2 flags] | 4];
  [(NRDeviceProxyProviderCriteria *)v2 setFlags:[(NRDeviceProxyProviderCriteria *)v2 flags] | 0x20];
  [(NRDeviceProxyProviderCriteria *)v2 setFlags:[(NRDeviceProxyProviderCriteria *)v2 flags] | 0x40];
  [(NRDeviceProxyProviderCriteria *)v2 setFlags:[(NRDeviceProxyProviderCriteria *)v2 flags] | 8];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end