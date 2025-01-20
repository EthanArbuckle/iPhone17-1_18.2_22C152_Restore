@interface NRLinkPreferences
+ (id)createFromEncodedXPCDict:(id)a3;
- (BOOL)isNotEmpty;
- (NRLinkPreferences)initWithLinkType:(unsigned __int8)a3;
- (id)copyEncodedXPCDict;
- (id)copyLongDescription;
- (id)copyShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)linkType;
@end

@implementation NRLinkPreferences

- (unsigned)linkType
{
  return self->_linkType;
}

- (id)copyShortDescription
{
  id v3 = [NSString alloc];
  StringFromNRLinkType = (void *)createStringFromNRLinkType([(NRLinkPreferences *)self linkType]);
  v5 = (void *)[v3 initWithFormat:@"LinkPref[%@]", StringFromNRLinkType];

  return v5;
}

- (id)copyLongDescription
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  StringFromNRLinkType = (void *)createStringFromNRLinkType([(NRLinkPreferences *)self linkType]);
  v5 = (void *)[v3 initWithFormat:@"Link Type: %@", StringFromNRLinkType];

  return v5;
}

- (id)description
{
  id v2 = [(NRLinkPreferences *)self copyShortDescription];
  return v2;
}

- (id)copyEncodedXPCDict
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    v6 = nrCopyLogObj_433();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v15, (uint64_t)"nr_xpc_dictionary_create");
        id v16 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v16);
      }
    }
    id v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_8;
  }
  v4 = v3;
  xpc_dictionary_set_uint64(v3, "LinkType", [(NRLinkPreferences *)self linkType]);
  return v4;
}

- (BOOL)isNotEmpty
{
  return 0;
}

- (NRLinkPreferences)initWithLinkType:(unsigned __int8)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)NRLinkPreferences;
  result = [(NRLinkPreferences *)&v16 init];
  if (!result)
  {
    v5 = nrCopyLogObj_433();
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v14 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v14 = 136446210;
        *(void *)(v14 + 4) = "-[NRLinkPreferences initWithLinkType:]";
        id v15 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v15);
      }
    }
    id v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)"");

    goto LABEL_8;
  }
  result->_linkType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NRLinkPreferences *)self linkType];
  return (id)[v4 initWithLinkType:v5];
}

+ (id)createFromEncodedXPCDict:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    uint64_t v9 = nrCopyLogObj_433();
    uint64_t v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);

      if (!v13) {
        goto LABEL_15;
      }
    }
    id v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 17, (uint64_t)"%s called with null encodedDict", v14, v15, v16, v17, v18, (uint64_t)"+[NRLinkPreferences createFromEncodedXPCDict:]");
LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  if (MEMORY[0x210512A10](v3) != MEMORY[0x263EF8708])
  {
    uint64_t v11 = nrCopyLogObj_433();
    uint64_t v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v19) {
        goto LABEL_15;
      }
    }
    id v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 17, (uint64_t)"%s called with null xpc_get_type(encodedDict) == (&_xpc_type_dictionary)", v20, v21, v22, v23, v24, (uint64_t)"+[NRLinkPreferences createFromEncodedXPCDict:]");
    goto LABEL_14;
  }
  if (xpc_dictionary_get_uint64(v4, "LinkType") != 1)
  {
LABEL_15:
    uint64_t v5 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = objc_alloc_init(NRBluetoothLinkPreferences);
  v6 = NRLPCopyUInt64NSNumberFromXPCDict(v4, "InputBPS");
  [(NRBluetoothLinkPreferences *)v5 setInputBytesPerSecond:v6];

  BOOL v7 = NRLPCopyUInt64NSNumberFromXPCDict(v4, "OutputBPS");
  [(NRBluetoothLinkPreferences *)v5 setOutputBytesPerSecond:v7];

  id v8 = NRLPCopyUInt64NSNumberFromXPCDict(v4, "PacketsPerSecond");
  [(NRBluetoothLinkPreferences *)v5 setPacketsPerSecond:v8];
LABEL_5:

LABEL_16:
  return v5;
}

@end