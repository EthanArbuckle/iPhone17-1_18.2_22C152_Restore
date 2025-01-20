@interface NRCompanionLinkPreferences
- (BOOL)highThroughput;
- (BOOL)includeP2P;
- (BOOL)isEqual:(id)a3;
- (NRCompanionLinkPreferences)initWithServiceClass:(unsigned __int8)a3;
- (id)copyShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForHighThroughputWithServiceClass:(unsigned __int8)a3 includeP2P:(BOOL)a4;
- (id)initInternalWithServiceClass:(unsigned __int8)a3 highThroughout:(BOOL)a4 includeP2P:(BOOL)a5;
- (unsigned)serviceClass;
@end

@implementation NRCompanionLinkPreferences

- (unsigned)serviceClass
{
  return *(&self->super._linkType + 3);
}

- (BOOL)includeP2P
{
  return *(&self->super._linkType + 2);
}

- (BOOL)highThroughput
{
  return *(&self->super._linkType + 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NRCompanionLinkPreferences *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    int v7 = *(&self->super._linkType + 1);
    if (v7 == [(NRCompanionLinkPreferences *)v6 highThroughput]
      && (int v8 = *(&self->super._linkType + 2), v8 == [(NRCompanionLinkPreferences *)v6 includeP2P]))
    {
      int v9 = *(&self->super._linkType + 3);
      BOOL v10 = v9 == [(NRCompanionLinkPreferences *)v6 serviceClass];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyShortDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = *(void *)&self->_highThroughput;
  uint64_t v5 = *(&self->super._linkType + 3);
  if (v5 >= 6) {
    v6 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%u)", v5);
  }
  else {
    v6 = off_263FD1C88[*(&self->super._linkType + 3)];
  }
  if (*(&self->super._linkType + 1)) {
    int v7 = " ht";
  }
  else {
    int v7 = "";
  }
  if (*(&self->super._linkType + 2)) {
    int v8 = " p2p";
  }
  else {
    int v8 = "";
  }
  int v9 = (void *)[v3 initWithFormat:@"[%llu %@%s%s", v4, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NRCompanionLinkPreferences;
  uint64_t v4 = [(NRLinkPreferences *)&v7 copyWithZone:a3];
  unsigned __int8 v5 = [(NRCompanionLinkPreferences *)self serviceClass];
  if (v4)
  {
    v4[11] = v5;
    v4[9] = [(NRCompanionLinkPreferences *)self highThroughput];
    v4[10] = [(NRCompanionLinkPreferences *)self includeP2P];
  }
  else
  {
    [(NRCompanionLinkPreferences *)self highThroughput];
    [(NRCompanionLinkPreferences *)self includeP2P];
  }
  return v4;
}

- (id)initForHighThroughputWithServiceClass:(unsigned __int8)a3 includeP2P:(BOOL)a4
{
  return [(NRCompanionLinkPreferences *)self initInternalWithServiceClass:a3 highThroughout:1 includeP2P:a4];
}

- (NRCompanionLinkPreferences)initWithServiceClass:(unsigned __int8)a3
{
  return (NRCompanionLinkPreferences *)[(NRCompanionLinkPreferences *)self initInternalWithServiceClass:a3 highThroughout:0 includeP2P:0];
}

- (id)initInternalWithServiceClass:(unsigned __int8)a3 highThroughout:(BOOL)a4 includeP2P:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)NRCompanionLinkPreferences;
  id result = [(NRCompanionLinkPreferences *)&v20 init];
  if (!result)
  {
    int v9 = nrCopyLogObj_433();
    BOOL v10 = v9;
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
        *(void *)(v18 + 4) = "-[NRCompanionLinkPreferences initInternalWithServiceClass:highThroughout:includeP2P:]";
        id v19 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_8;
  }
  *((void *)result + 2) = atomic_fetch_add_explicit(&initInternalWithServiceClass_highThroughout_includeP2P__sNRLinkID, 1uLL, memory_order_relaxed);
  *((unsigned char *)result + 11) = a3;
  *((unsigned char *)result + 9) = a4;
  *((unsigned char *)result + 10) = a5;
  return result;
}

@end