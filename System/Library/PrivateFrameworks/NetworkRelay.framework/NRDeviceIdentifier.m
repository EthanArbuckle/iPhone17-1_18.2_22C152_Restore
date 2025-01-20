@interface NRDeviceIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)copyBestTestingDeviceIdentifier;
+ (id)copyDeviceIdentifierWithIDSDeviceID:(id)a3;
+ (id)newDeviceIdentifierWithBluetoothUUID:(id)a3;
+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3;
+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3 shouldCreate:(BOOL)a4;
+ (id)newEphemeralDeviceIdentifier;
- (BOOL)ephemeral;
- (BOOL)isEphemeral;
- (BOOL)isEqual:(id)a3;
- (NRDeviceIdentifier)initWithCoder:(id)a3;
- (NRDeviceIdentifier)initWithUUID:(id)a3;
- (NSUUID)bluetoothUUID;
- (NSUUID)nrDeviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEphemeral:(BOOL)a3;
- (void)setNrDeviceIdentifier:(id)a3;
@end

@implementation NRDeviceIdentifier

- (void).cxx_destruct
{
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (BOOL)ephemeral
{
  return self->_ephemeral;
}

- (void)setNrDeviceIdentifier:(id)a3
{
}

- (NSUUID)nrDeviceIdentifier
{
  return self->_nrDeviceIdentifier;
}

- (NSUUID)bluetoothUUID
{
  v7 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
  if (nrCopyLogObj_onceToken_761 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Querying BluetoothUUID for nrUUID %@", v2, v3, v4, v5, v6, (uint64_t)"");
  }
  os_unfair_lock_lock(&sBluetoothUUIDToNRUUIDMappingLock);
  if (sBluetoothUUIDToNRUUIDMapping)
  {
    v8 = [(id)sBluetoothUUIDToNRUUIDMapping allKeysForObject:v7];
    if ([v8 count])
    {
      v9 = [v8 firstObject];

      if (v9)
      {
        if (nrCopyLogObj_onceToken_761 == -1)
        {
          if (!sNRCopyLogToStdErr) {
            goto LABEL_11;
          }
        }
        else
        {
          dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
          if (!sNRCopyLogToStdErr)
          {
LABEL_11:
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
          }
        }
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got BluetoothUUID %@ from cache for nrUUID %@", v10, v11, v12, v13, v14, (uint64_t)"");
        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  v9 = nrXPCCopyBluetoothUUIDForNRUUID(v7);
  if (v9)
  {
    if (nrCopyLogObj_onceToken_761 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
      if (sNRCopyLogToStdErr) {
        goto LABEL_18;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      v20 = (void *)sBluetoothUUIDToNRUUIDMapping;
      if (!sBluetoothUUIDToNRUUIDMapping)
      {
        id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v22 = (void *)sBluetoothUUIDToNRUUIDMapping;
        sBluetoothUUIDToNRUUIDMapping = (uint64_t)v21;

        v20 = (void *)sBluetoothUUIDToNRUUIDMapping;
      }
      if ((unint64_t)[v20 count] <= 0xF) {
        [(id)sBluetoothUUIDToNRUUIDMapping setObject:v7 forKeyedSubscript:v9];
      }
      goto LABEL_23;
    }
LABEL_18:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got BluetoothUUID %@ from daemon for nrUUID %@", v15, v16, v17, v18, v19, (uint64_t)"");
    goto LABEL_19;
  }
LABEL_23:
  os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);

  return (NSUUID *)v9;
}

- (unint64_t)hash
{
  uint64_t v2 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
    v7 = [v5 nrDeviceIdentifier];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = (void *)[v3 initWithFormat:@"NRD[%@]", v5];

  return v6;
}

- (NRDeviceIdentifier)initWithUUID:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v9 = nrCopyLogObj_776();
    uint64_t v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11) {
        goto LABEL_16;
      }
    }
    id v18 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v18, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL nrDeviceIdentifier", v19, v20, v21, v22, v23, (uint64_t)"");

LABEL_16:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136446466;
    *(void *)(v24 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
    *(_WORD *)(v24 + 12) = 2080;
    *(void *)(v24 + 14) = "-[NRDeviceIdentifier initWithUUID:]";
    goto LABEL_23;
  }
  id v5 = v4;
  *(void *)uu = 0;
  uint64_t v42 = 0;
  [v4 getUUIDBytes:uu];
  if (uuid_is_null(uu))
  {
    uint64_t v12 = nrCopyLogObj_776();
    uint64_t v13 = v12;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v14) {
        goto LABEL_19;
      }
    }
    id v25 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with all-zero nrDeviceIdentifier", v26, v27, v28, v29, v30, (uint64_t)"");

LABEL_19:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136446466;
    *(void *)(v31 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
    *(_WORD *)(v31 + 12) = 2080;
    *(void *)(v31 + 14) = "-[NRDeviceIdentifier initWithUUID:]";
    goto LABEL_23;
  }
  v40.receiver = self;
  v40.super_class = (Class)NRDeviceIdentifier;
  uint64_t v6 = [(NRDeviceIdentifier *)&v40 init];
  if (!v6)
  {
    uint64_t v15 = nrCopyLogObj_776();
    uint64_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17) {
        goto LABEL_22;
      }
    }
    id v32 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v32, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v33, v34, v35, v36, v37, (uint64_t)"");

LABEL_22:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136446210;
    *(void *)(v38 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
LABEL_23:
    id v39 = nrCopyLogObj_776();
    _NRLogAbortWithPack(v39);
  }
  v7 = v6;
  [(NRDeviceIdentifier *)v6 setNrDeviceIdentifier:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
  [v5 encodeObject:v4 forKey:@"nrDeviceIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[NRDeviceIdentifier ephemeral](self, "ephemeral"), @"ephemeral");
}

- (NRDeviceIdentifier)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRDeviceIdentifier;
  id v5 = [(NRDeviceIdentifier *)&v20 init];
  if (!v5)
  {
    v9 = nrCopyLogObj_776();
    uint64_t v10 = v9;
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
        *(void *)(v18 + 4) = "-[NRDeviceIdentifier initWithCoder:]";
        id v19 = nrCopyLogObj_776();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_8;
  }
  uint64_t v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nrDeviceIdentifier"];
  [(NRDeviceIdentifier *)v6 setNrDeviceIdentifier:v7];

  -[NRDeviceIdentifier setEphemeral:](v6, "setEphemeral:", [v4 decodeBoolForKey:@"ephemeral"]);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NRDeviceIdentifier *)self nrDeviceIdentifier];
  uint64_t v6 = (void *)[v4 initWithUUID:v5];

  objc_msgSend(v6, "setEphemeral:", -[NRDeviceIdentifier ephemeral](self, "ephemeral"));
  return v6;
}

+ (id)copyDeviceIdentifierWithIDSDeviceID:(id)a3
{
  return +[NRDeviceIdentifier newDeviceIdentifierWithIDSDeviceID:a3 shouldCreate:0];
}

+ (id)newDeviceIdentifierWithBluetoothUUID:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v42 = nrCopyLogObj_776();
    uint64_t v43 = v42;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

      if (!v44) {
        goto LABEL_51;
      }
    }
    id v50 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v50, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL bluetoothUUID", v51, v52, v53, v54, v55, (uint64_t)"");

LABEL_51:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v56 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v56 = 136446466;
    *(void *)(v56 + 4) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    *(_WORD *)(v56 + 12) = 2080;
    *(void *)(v56 + 14) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    goto LABEL_55;
  }
  id v4 = v3;
  *(void *)uu = 0;
  uint64_t v74 = 0;
  [v3 getUUIDBytes:uu];
  if (uuid_is_null(uu))
  {
    v45 = nrCopyLogObj_776();
    v46 = v45;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

      if (!v47) {
        goto LABEL_54;
      }
    }
    id v57 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with all-zero bluetoothUUID", v58, v59, v60, v61, v62, (uint64_t)"");

LABEL_54:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v63 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v63 = 136446466;
    *(void *)(v63 + 4) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    *(_WORD *)(v63 + 12) = 2080;
    *(void *)(v63 + 14) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
LABEL_55:
    id v64 = nrCopyLogObj_776();
    _NRLogAbortWithPack(v64);
  }
  if (nrCopyLogObj_onceToken_761 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Querying NRUUID for bluetoothUUID %@", v5, v6, v7, v8, v9, (uint64_t)"");
  }
  os_unfair_lock_lock(&sBluetoothUUIDToNRUUIDMappingLock);
  if (sBluetoothUUIDToNRUUIDMapping)
  {
    uint64_t v10 = [(id)sBluetoothUUIDToNRUUIDMapping objectForKeyedSubscript:v4];
    if (v10)
    {
      uint64_t v16 = (void *)v10;
      if (nrCopyLogObj_onceToken_761 == -1)
      {
        if (!sNRCopyLogToStdErr) {
          goto LABEL_12;
        }
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
        if (!sNRCopyLogToStdErr)
        {
LABEL_12:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
            goto LABEL_23;
          }
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from cache for bluetoothUUID %@", v11, v12, v13, v14, v15, (uint64_t)"");
      goto LABEL_23;
    }
  }
  uint64_t v17 = nrXPCCopyNRUUIDForBluetoothUUID(v4);
  if (!v17)
  {
    os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);
    if (nrCopyLogObj_onceToken_761 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    }
    id v32 = (id)nrCopyLogObj_sNRLogObj_763;
    uint64_t v33 = v32;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_FAULT);

      if (!v34)
      {
LABEL_36:
        uint64_t v16 = 0;
        goto LABEL_37;
      }
    }
    if (nrCopyLogObj_onceToken_761 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    }
    id v35 = (id)nrCopyLogObj_sNRLogObj_763;
    _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"%s called with null nrUUID", v36, v37, v38, v39, v40, (uint64_t)"+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]");

    goto LABEL_36;
  }
  uint64_t v16 = v17;
  if (nrCopyLogObj_onceToken_761 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_18:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from daemon for bluetoothUUID %@", v18, v19, v20, v21, v22, (uint64_t)"");
      goto LABEL_19;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    if (sNRCopyLogToStdErr) {
      goto LABEL_18;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v23 = (void *)sBluetoothUUIDToNRUUIDMapping;
  if (!sBluetoothUUIDToNRUUIDMapping)
  {
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v25 = (void *)sBluetoothUUIDToNRUUIDMapping;
    sBluetoothUUIDToNRUUIDMapping = (uint64_t)v24;

    uint64_t v23 = (void *)sBluetoothUUIDToNRUUIDMapping;
  }
  if ((unint64_t)[v23 count] <= 0xF) {
    [(id)sBluetoothUUIDToNRUUIDMapping setObject:v16 forKeyedSubscript:v4];
  }
LABEL_23:
  os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);
  *(void *)uu = 0;
  uint64_t v74 = 0;
  [v16 getUUIDBytes:uu];
  if (uuid_is_null(uu))
  {
    v48 = nrCopyLogObj_776();
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {

LABEL_61:
      id v66 = nrCopyLogObj_776();
      _NRLogWithArgs((uint64_t)v66, 17, (uint64_t)"called with all-zero nrUUID", v67, v68, v69, v70, v71, v72);

      goto LABEL_37;
    }
    BOOL v65 = os_log_type_enabled(v48, OS_LOG_TYPE_FAULT);

    if (v65) {
      goto LABEL_61;
    }
LABEL_37:
    uint64_t v31 = 0;
    goto LABEL_38;
  }
  uint64_t v31 = [[NRDeviceIdentifier alloc] initWithUUID:v16];
  if (nrCopyLogObj_onceToken_761 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_27:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Found %@ for bluetoothUUID %@", v26, v27, v28, v29, v30, (uint64_t)"");
      goto LABEL_38;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    if (sNRCopyLogToStdErr) {
      goto LABEL_27;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    goto LABEL_27;
  }
LABEL_38:

  return v31;
}

+ (id)newEphemeralDeviceIdentifier
{
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [[NRDeviceIdentifier alloc] initWithUUID:v2];
  [(NRDeviceIdentifier *)v3 setEphemeral:1];
  if (nrCopyLogObj_onceToken_761 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Creating %@ for ephemeral pairing", v4, v5, v6, v7, v8, (uint64_t)"");
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEphemeral
{
  return self->_ephemeral;
}

+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3
{
  return +[NRDeviceIdentifier newDeviceIdentifierWithIDSDeviceID:a3 shouldCreate:1];
}

+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3 shouldCreate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    uint64_t v40 = nrCopyLogObj_776();
    v41 = v40;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v42 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (!v42)
      {
LABEL_40:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v49 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v49 = 136446466;
        *(void *)(v49 + 4) = "+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]";
        *(_WORD *)(v49 + 12) = 2080;
        *(void *)(v49 + 14) = "+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]";
        id v50 = nrCopyLogObj_776();
        _NRLogAbortWithPack(v50);
      }
    }
    id v43 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v43, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL idsDeviceID", v44, v45, v46, v47, v48, (uint64_t)"");

    goto LABEL_40;
  }
  uint64_t v11 = v5;
  if (nrCopyLogObj_onceToken_761 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Querying NRUUID for IDSDeviceID %@", v6, v7, v8, v9, v10, (uint64_t)"");
  }
  os_unfair_lock_lock(&sIDSDeviceIDToNRUUIDMappingLock);
  if (sIDSDeviceIDToNRUUIDMapping)
  {
    uint64_t v12 = [(id)sIDSDeviceIDToNRUUIDMapping objectForKeyedSubscript:v11];
    if (v12)
    {
      uint64_t v18 = (void *)v12;
      if (nrCopyLogObj_onceToken_761 == -1)
      {
        if (!sNRCopyLogToStdErr) {
          goto LABEL_11;
        }
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
        if (!sNRCopyLogToStdErr)
        {
LABEL_11:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
            goto LABEL_21;
          }
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from cache for idsDeviceID %@", v13, v14, v15, v16, v17, (uint64_t)"");
      goto LABEL_21;
    }
  }
  uint64_t v19 = nrXPCCopyNRUUIDForIDSDeviceID(v11, v4);
  if (!v19)
  {
    os_unfair_lock_unlock(&sIDSDeviceIDToNRUUIDMappingLock);
    if (v4)
    {
      if (nrCopyLogObj_onceToken_761 == -1)
      {
        if (sNRCopyLogToStdErr)
        {
LABEL_30:
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 17, (uint64_t)"%s called with null nrUUID", v34, v35, v36, v37, v38, (uint64_t)"+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]");
          goto LABEL_31;
        }
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
        if (sNRCopyLogToStdErr) {
          goto LABEL_30;
        }
      }
      if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_FAULT)) {
        goto LABEL_30;
      }
    }
LABEL_31:
    uint64_t v33 = 0;
    goto LABEL_32;
  }
  uint64_t v18 = v19;
  if (nrCopyLogObj_onceToken_761 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_17:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from daemon for idsDeviceID %@", v20, v21, v22, v23, v24, (uint64_t)"");
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    if (sNRCopyLogToStdErr) {
      goto LABEL_17;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    goto LABEL_17;
  }
LABEL_18:
  id v25 = (void *)sIDSDeviceIDToNRUUIDMapping;
  if (!sIDSDeviceIDToNRUUIDMapping)
  {
    id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v27 = (void *)sIDSDeviceIDToNRUUIDMapping;
    sIDSDeviceIDToNRUUIDMapping = (uint64_t)v26;

    id v25 = (void *)sIDSDeviceIDToNRUUIDMapping;
  }
  [v25 setObject:v18 forKeyedSubscript:v11];
LABEL_21:
  os_unfair_lock_unlock(&sIDSDeviceIDToNRUUIDMappingLock);
  uint64_t v33 = [[NRDeviceIdentifier alloc] initWithUUID:v18];
  if (nrCopyLogObj_onceToken_761 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_24:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_763, 1, (uint64_t)"%s%.30s:%-4d Found %@ for idsDeviceID %@", v28, v29, v30, v31, v32, (uint64_t)"");
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
    if (sNRCopyLogToStdErr) {
      goto LABEL_24;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_763, OS_LOG_TYPE_INFO)) {
    goto LABEL_24;
  }
LABEL_25:

LABEL_32:
  return v33;
}

+ (id)copyBestTestingDeviceIdentifier
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = nrXPCCopyBestTestingNRUUID();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v6 = nrCopyLogObj_776();
    uint64_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v10) {
        goto LABEL_14;
      }
    }
    id v11 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v12, v13, v14, v15, v16, (uint64_t)"+[NRDeviceIdentifier(Internal) copyBestTestingDeviceIdentifier]");
LABEL_13:

    goto LABEL_14;
  }
  *(void *)uu = 0;
  uint64_t v25 = 0;
  [v2 getUUIDBytes:uu];
  if (uuid_is_null(uu))
  {
    uint64_t v8 = nrCopyLogObj_776();
    uint64_t v9 = v8;
    if (sNRCopyLogToStdErr)
    {

LABEL_12:
      id v11 = nrCopyLogObj_776();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"called with all-zero nrUUID", v18, v19, v20, v21, v22, v23);
      goto LABEL_13;
    }
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

    if (v17) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v4 = 0;
    goto LABEL_4;
  }
  BOOL v4 = [[NRDeviceIdentifier alloc] initWithUUID:v3];
LABEL_4:

  return v4;
}

@end