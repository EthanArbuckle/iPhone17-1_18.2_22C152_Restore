@interface NREndpoint
- (NRDeviceIdentifier)deviceIdentifier;
- (NREndpoint)initWithDeviceIdentifier:(id)a3 portString:(id)a4 dataProtectionClass:(unsigned __int8)a5;
- (NSString)portString;
- (id)copyEndpoint;
- (id)copyNWEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)dataProtectionClass;
- (void)setDataProtectionClass:(unsigned __int8)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setPortString:(id)a3;
@end

@implementation NREndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)setDataProtectionClass:(unsigned __int8)a3
{
  self->_dataProtectionClass = a3;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setPortString:(id)a3
{
}

- (NSString)portString
{
  return self->_portString;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (id)copyNWEndpoint
{
  v3 = [(NREndpoint *)self deviceIdentifier];
  v4 = [v3 nrDeviceIdentifier];
  unsigned int v5 = [(NREndpoint *)self dataProtectionClass];
  v6 = [(NREndpoint *)self portString];
  id v7 = v4;
  id v8 = v6;
  id v9 = v7;
  id v10 = [NSString alloc];
  v11 = [v9 UUIDString];
  v12 = (void *)[v10 initWithFormat:@"%@/%llu", v11, v5];

  os_unfair_lock_lock((os_unfair_lock_t)&sAddressCacheLock);
  int v13 = NREndpointCacheValidLocked_sAddressCacheChangeToken;
  if (NREndpointCacheValidLocked_sAddressCacheChangeToken != -1) {
    goto LABEL_2;
  }
  if (notify_register_check("com.apple.networkrelay.endpointcache", &NREndpointCacheValidLocked_sAddressCacheChangeToken))
  {
    NREndpointCacheValidLocked_sAddressCacheChangeToken = -1;
    if (nrCopyLogObj_onceToken != -1) {
      dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_register_check(%s) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
    }
    goto LABEL_33;
  }
  int v13 = NREndpointCacheValidLocked_sAddressCacheChangeToken;
  if (NREndpointCacheValidLocked_sAddressCacheChangeToken != -1)
  {
LABEL_2:
    uint64_t v14 = NREndpointCacheValidLocked_sAddressCacheGeneration;
    *(void *)state64 = NREndpointCacheValidLocked_sAddressCacheGeneration;
    int check = 0;
    if (notify_check(v13, &check))
    {
      if (nrCopyLogObj_onceToken != -1) {
        dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_check(%s, %d) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
      }
      goto LABEL_8;
    }
    if (check)
    {
      if (notify_get_state(NREndpointCacheValidLocked_sAddressCacheChangeToken, (uint64_t *)state64))
      {
        if (nrCopyLogObj_onceToken != -1) {
          dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_get_state(%s, %d) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
        }
LABEL_8:
        notify_cancel(NREndpointCacheValidLocked_sAddressCacheChangeToken);
        NREndpointCacheValidLocked_sAddressCacheChangeToken = -1;
        *(void *)state64 = 0;
        if (!NREndpointCacheValidLocked_sAddressCacheGeneration) {
          goto LABEL_33;
        }
LABEL_9:
        if (nrCopyLogObj_onceToken != -1) {
          dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_INFO)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 1, (uint64_t)"%s%.30s:%-4d NREndpoint cache generation changed: %llu -> %llu", v15, v16, v17, v18, v19, (uint64_t)"");
        }
        NREndpointCacheValidLocked_sAddressCacheGeneration = *(void *)state64;
        goto LABEL_33;
      }
      uint64_t v14 = *(void *)state64;
    }
    if (NREndpointCacheValidLocked_sAddressCacheGeneration == v14)
    {
      if (v14) {
        goto LABEL_39;
      }
      goto LABEL_33;
    }
    goto LABEL_9;
  }
LABEL_33:
  if (nrCopyLogObj_onceToken != -1) {
    dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 1, (uint64_t)"%s%.30s:%-4d Clearing NREndpoint cache", v15, v16, v17, v18, v19, (uint64_t)"");
  }
  v20 = (void *)sAddressDataCache;
  sAddressDataCache = 0;

LABEL_39:
  if (!sAddressDataCache
    || ([(id)sAddressDataCache objectForKeyedSubscript:v12],
        (v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v22 = nrXPCCopyResolvedEndpoint(v9, v5);
    v21 = v22;
    if (v22)
    {
      if ([v22 length] == 16)
      {
        *(void *)state64 = 0;
        *(void *)&state64[8] = 0;
        [v21 getBytes:state64 length:16];
        BOOL v23 = state64[9] != 12 && v5 == 3;
        if (!v23 && *(_WORD *)&state64[10] && *(_WORD *)&state64[12] && *(_WORD *)&state64[14])
        {
          v24 = (void *)sAddressDataCache;
          if (!sAddressDataCache)
          {
            id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v26 = (void *)sAddressDataCache;
            sAddressDataCache = (uint64_t)v25;

            v24 = (void *)sAddressDataCache;
          }
          if ((unint64_t)[v24 count] <= 0x1F) {
            [(id)sAddressDataCache setObject:v21 forKeyedSubscript:v12];
          }
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sAddressCacheLock);

  if ([v21 length] == 16)
  {
    if (v8) {
      unsigned int v27 = bswap32([v8 intValue]) >> 16;
    }
    else {
      LOWORD(v27) = 0;
    }
    memset(&state64[4], 0, 24);
    *(_WORD *)state64 = 7708;
    *(_WORD *)&state64[2] = v27;
    [v21 getBytes:&state64[8] length:16];
    uint64_t v35 = [MEMORY[0x263F143F0] endpointWithAddress:state64];
  }
  else
  {
    if (nrCopyLogObj_onceToken != -1) {
      dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_ERROR))
    {
      id v33 = (id)nrCopyLogObj_sNRLogObj;
      if (v5 < 5 && ((0x1Bu >> v5) & 1) != 0) {
        v34 = off_263FD0F70[v5];
      }
      else {
        v34 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v5);
      }
      _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d Failed to resolve endpoint for %@ %@", v28, v29, v30, v31, v32, (uint64_t)"");
    }
    uint64_t v35 = [MEMORY[0x263F143F0] endpointWithHostname:@"::" port:v8];
  }
  v36 = (void *)v35;

  return v36;
}

- (id)copyEndpoint
{
  id v2 = [(NREndpoint *)self copyNWEndpoint];
  v3 = (void *)[v2 copyCEndpoint];

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NREndpoint *)self deviceIdentifier];
  unsigned int v5 = [(NREndpoint *)self portString];
  unsigned int v6 = [(NREndpoint *)self dataProtectionClass];
  if (v6 < 5 && ((0x1Bu >> v6) & 1) != 0) {
    id v7 = off_263FD0F70[v6];
  }
  else {
    id v7 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v6);
  }
  id v8 = (void *)[v3 initWithFormat:@"NREndpoint[%@ port:%@ %@]", v4, v5, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unsigned int v5 = [(NREndpoint *)self deviceIdentifier];
  unsigned int v6 = [(NREndpoint *)self portString];
  id v7 = objc_msgSend(v4, "initWithDeviceIdentifier:portString:dataProtectionClass:", v5, v6, -[NREndpoint dataProtectionClass](self, "dataProtectionClass"));

  return v7;
}

- (NREndpoint)initWithDeviceIdentifier:(id)a3 portString:(id)a4 dataProtectionClass:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v16 = nrCopyLogObj();
    uint64_t v17 = v16;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v18) {
        goto LABEL_24;
      }
    }
    id v28 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v29, v30, v31, v32, v33, (uint64_t)"");

LABEL_24:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v46 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v46 = 136446466;
    *(void *)(v46 + 4) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
    *(_WORD *)(v46 + 12) = 2080;
    *(void *)(v46 + 14) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
    goto LABEL_28;
  }
  id v10 = v9;
  if (!v9)
  {
    uint64_t v19 = nrCopyLogObj();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21) {
        goto LABEL_24;
      }
    }
    id v34 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v34, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL portString", v35, v36, v37, v38, v39, (uint64_t)"");

    goto LABEL_24;
  }
  if ((v5 - 5) <= 0xFDu)
  {
    v22 = nrCopyLogObj();
    BOOL v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (!v24) {
        goto LABEL_24;
      }
    }
    id v40 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL dataProtectionClass == NRDataProtectionClassC || dataProtectionClass == NRDataProtectionClassD", v41, v42, v43, v44, v45, (uint64_t)"");

    goto LABEL_24;
  }
  v55.receiver = self;
  v55.super_class = (Class)NREndpoint;
  v11 = [(NREndpoint *)&v55 init];
  if (!v11)
  {
    id v25 = nrCopyLogObj();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27) {
        goto LABEL_27;
      }
    }
    id v47 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v48, v49, v50, v51, v52, (uint64_t)"");

LABEL_27:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v53 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v53 = 136446210;
    *(void *)(v53 + 4) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
LABEL_28:
    id v54 = nrCopyLogObj();
    _NRLogAbortWithPack(v54);
  }
  v12 = v11;
  int v13 = (void *)[v8 copy];
  [(NREndpoint *)v12 setDeviceIdentifier:v13];

  uint64_t v14 = (void *)[v10 copy];
  [(NREndpoint *)v12 setPortString:v14];

  [(NREndpoint *)v12 setDataProtectionClass:v5];
  return v12;
}

@end