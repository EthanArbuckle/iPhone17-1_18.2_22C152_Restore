@interface NRDeviceMonitor
- (BOOL)isAsleep;
- (BOOL)isClassCConnected;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isEnabled;
- (BOOL)isNearby;
- (BOOL)isRegistered;
- (BOOL)pluggedIn;
- (NRDeviceIdentifier)deviceIdentifier;
- (NRDeviceMonitor)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 queue:(id)a5;
- (NSString)proxyServiceInterfaceName;
- (int)thermalPressureLevel;
- (unsigned)linkSubtype;
- (unsigned)linkType;
- (void)checkInWithRetryCount:(uint64_t)a3;
- (void)dealloc;
- (void)setInternalProxySvcIntfName:(uint64_t)a1;
- (void)updateStateFromResponse:(uint64_t)a1;
@end

@implementation NRDeviceMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalProxySvcIntfName, 0);
  objc_storeStrong((id *)&self->_internalDeviceIdentifier, 0);
}

- (BOOL)pluggedIn
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalPluggedIn;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)thermalPressureLevel
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LODWORD(v2) = v2->_internalThermalPressureLevel;
  }
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (unsigned)linkSubtype
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalLinkSubtype;
  }
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (NSString)proxyServiceInterfaceName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    internalProxySvcIntfName = self->_internalProxySvcIntfName;
  }
  else {
    internalProxySvcIntfName = 0;
  }
  v5 = (void *)[(NSString *)internalProxySvcIntfName copy];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v5;
}

- (unsigned)linkType
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalLinkType;
  }
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (BOOL)isClassCConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsClassCConnected;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAsleep
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsAsleep;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCloudConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsCloudConnected;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsConnected;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isNearby
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsNearby;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsEnabled;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRegistered
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_internalIsRegistered;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NRDeviceIdentifier)deviceIdentifier
{
  if (self) {
    self = (NRDeviceMonitor *)self->_internalDeviceIdentifier;
  }
  return (NRDeviceIdentifier *)self;
}

- (void)dealloc
{
  if (nrCopyLogObj_onceToken_204 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)nrCopyLogObj_sNRLogObj_206;
    v11 = [(NRDeviceMonitor *)self deviceIdentifier];
    _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@ for %@", v4, v5, v6, v7, v8, (uint64_t)"");
  }
  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      v10 = self->_connection;
      self->_connection = 0;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)NRDeviceMonitor;
  [(NRDeviceMonitor *)&v12 dealloc];
}

- (NRDeviceMonitor)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 queue:(id)a5
{
  location[1] = *(id *)MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v39 = nrCopyLogObj_214();
    v40 = v39;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v41 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

      if (!v41) {
        goto LABEL_40;
      }
    }
    id v51 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v52, v53, v54, v55, v56, (uint64_t)"");

    goto LABEL_40;
  }
  if (!v10)
  {
    v42 = nrCopyLogObj_214();
    v43 = v42;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

      if (!v44) {
        goto LABEL_40;
      }
    }
    id v57 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL delegate", v58, v59, v60, v61, v62, (uint64_t)"");

    goto LABEL_40;
  }
  objc_super v12 = v11;
  if (!v11)
  {
    v45 = nrCopyLogObj_214();
    v46 = v45;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

      if (!v47)
      {
LABEL_40:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v69 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v69 = 136446466;
        *(void *)(v69 + 4) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        *(_WORD *)(v69 + 12) = 2080;
        *(void *)(v69 + 14) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        id v70 = nrCopyLogObj_214();
        _NRLogAbortWithPack(v70);
      }
    }
    id v63 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v63, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL queue", v64, v65, v66, v67, v68, (uint64_t)"");

    goto LABEL_40;
  }
  v80.receiver = self;
  v80.super_class = (Class)NRDeviceMonitor;
  v13 = [(NRDeviceMonitor *)&v80 init];
  v14 = v13;
  if (!v13)
  {
    v48 = nrCopyLogObj_214();
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v50 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

      if (!v50)
      {
LABEL_43:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v77 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v77 = 136446210;
        *(void *)(v77 + 4) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        id v78 = nrCopyLogObj_214();
        _NRLogAbortWithPack(v78);
      }
    }
    id v71 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v71, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v72, v73, v74, v75, v76, (uint64_t)"");

    goto LABEL_43;
  }
  objc_storeStrong((id *)&v13->_internalDeviceIdentifier, a3);
  objc_storeWeak((id *)&v14->_delegate, v10);
  objc_storeStrong((id *)&v14->_delegateQueue, a5);
  *(_WORD *)&v14->_internalLinkType = 0;
  *(void *)&v14->_internalIsRegistered = 0;
  internalProxySvcIntfName = v14->_internalProxySvcIntfName;
  v14->_internalProxySvcIntfName = 0;

  v14->_internalThermalPressureLevel = 0;
  v14->_lock._os_unfair_lock_opaque = 0;
  v16 = v14->_delegateQueue;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v16, 2uLL);
  connection = v14->_connection;
  v14->_connection = mach_service;

  if (!v14->_connection)
  {
    if (nrCopyLogObj_onceToken_204 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    }
    if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_FAULT))
      && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 17, (uint64_t)"Failed to create NRDeviceMonitor XPC connection", v19, v20, v21, v22, v23, v79), nrCopyLogObj_onceToken_204 != -1))
    {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      if (sNRCopyLogToStdErr) {
        goto LABEL_19;
      }
    }
    else if (sNRCopyLogToStdErr)
    {
      goto LABEL_19;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      v37 = 0;
      goto LABEL_21;
    }
LABEL_19:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d Failed to start %@ for %@", v19, v20, v21, v22, v23, (uint64_t)"");
    goto LABEL_20;
  }
  objc_initWeak(location, v14);
  v24 = v14->_connection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __24__NRDeviceMonitor_start__block_invoke;
  handler[3] = &unk_263FD14A0;
  objc_copyWeak(&v82, location);
  xpc_connection_set_event_handler(v24, handler);

  v25 = v14->_connection;
  xpc_connection_activate(v25);

  -[NRDeviceMonitor checkInWithRetryCount:]((id *)&v14->super.isa, 0, v26, v27, v28, v29, v30, v31, v79);
  objc_destroyWeak(&v82);
  objc_destroyWeak(location);
  if (nrCopyLogObj_onceToken_204 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 0, (uint64_t)"%s%.30s:%-4d Started %@ for %@", v32, v33, v34, v35, v36, (uint64_t)"");
  }
  v37 = v14;
LABEL_21:

  return v37;
}

void __24__NRDeviceMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](v14);
    if (v4 == MEMORY[0x263EF8708])
    {
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      if (sNRCopyLogToStdErr
        || (BOOL v10 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_DEBUG), v11 = v14, v10))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
        id v11 = v14;
      }
      -[NRDeviceMonitor updateStateFromResponse:]((uint64_t)WeakRetained, v11);
    }
    else
    {
      if (v4 != MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_204 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
        }
        if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR))
          && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d Received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_204 != -1))
        {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
          if (!sNRCopyLogToStdErr)
          {
LABEL_10:
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_FAULT)) {
              goto LABEL_24;
            }
          }
        }
        else if (!sNRCopyLogToStdErr)
        {
          goto LABEL_10;
        }
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 17, (uint64_t)"Received unexpected XPC object", v5, v6, v7, v8, v9, v13);
        goto LABEL_24;
      }
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d Received XPC error: %@, retrying", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      -[NRDeviceMonitor checkInWithRetryCount:](WeakRetained, 0, v12, v5, v6, v7, v8, v9, v13);
    }
  }
LABEL_24:
}

- (void)checkInWithRetryCount:(uint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a2 >= 6)
  {
    if (nrCopyLogObj_onceToken_204 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = nrCopyLogObj_sNRLogObj_206;
      BOOL v10 = "Failed to checkin NRDeviceMonitor after retries";
LABEL_16:
      _NRLogWithArgs(v9, 17, (uint64_t)v10, a4, a5, a6, a7, a8, a9);
      return;
    }
    return;
  }
  if (a1[8])
  {
    *(void *)uuid = 0;
    uint64_t v36 = 0;
    uint64_t v13 = [a1[4] nrDeviceIdentifier];
    [v13 getUUIDBytes:uuid];

    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    v15 = v14;
    if (v14)
    {
      xpc_dictionary_set_uint64(v14, "Type", 0xAuLL);
      xpc_dictionary_set_uuid(v15, "DeviceIdentifier", uuid);
      objc_initWeak(&location, a1);
      v16 = (_xpc_connection_s *)a1[8];
      v17 = a1[6];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __41__NRDeviceMonitor_checkInWithRetryCount___block_invoke;
      handler[3] = &unk_263FD14C8;
      objc_copyWeak(&v32, &location);
      id v18 = v15;
      id v31 = v18;
      unsigned int v33 = a2;
      xpc_connection_send_message_with_reply(v16, v18, v17, handler);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

      return;
    }
    uint64_t v19 = nrCopyLogObj_214();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_24:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v28 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v28, (uint64_t)"nr_xpc_dictionary_create");
        id v29 = nrCopyLogObj_214();
        _NRLogAbortWithPack(v29);
      }
    }
    id v22 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v23, v24, v25, v26, v27, (uint64_t)"");

    goto LABEL_24;
  }
  if (nrCopyLogObj_onceToken_204 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_FAULT))
  {
    uint64_t v9 = nrCopyLogObj_sNRLogObj_206;
    BOOL v10 = "Could not check in with server as no connection found";
    goto LABEL_16;
  }
}

void __41__NRDeviceMonitor_checkInWithRetryCount___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](v13);
    if (v4 == MEMORY[0x263EF8708])
    {
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      if (sNRCopyLogToStdErr
        || (BOOL v10 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_DEBUG), v11 = v13, v10))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 2, (uint64_t)"%s%.30s:%-4d Checkin received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
        id v11 = v13;
      }
      -[NRDeviceMonitor updateStateFromResponse:]((uint64_t)WeakRetained, v11);
    }
    else
    {
      if (v4 != MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_204 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
        }
        if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR))
          && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d Checkin received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_204 != -1))
        {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
          if (!sNRCopyLogToStdErr)
          {
LABEL_10:
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_FAULT)) {
              goto LABEL_24;
            }
          }
        }
        else if (!sNRCopyLogToStdErr)
        {
          goto LABEL_10;
        }
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 17, (uint64_t)"Checkin received unexpected XPC object", v5, v6, v7, v8, v9, v12);
        goto LABEL_24;
      }
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d Checkin could not deliver message %@, error %@, retrying", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      -[NRDeviceMonitor checkInWithRetryCount:](WeakRetained, (*(_DWORD *)(a1 + 48) + 1));
    }
  }
LABEL_24:
}

- (void)updateStateFromResponse:(uint64_t)a1
{
  id v3 = a2;
  if (!v3)
  {
    v132 = nrCopyLogObj_214();
    v133 = v132;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v134 = os_log_type_enabled(v132, OS_LOG_TYPE_FAULT);

      if (!v134) {
        goto LABEL_89;
      }
    }
    id v135 = nrCopyLogObj_214();
    _NRLogWithArgs((uint64_t)v135, 17, (uint64_t)"%s called with null object", v136, v137, v138, v139, v140, (uint64_t)"-[NRDeviceMonitor updateStateFromResponse:]");

    goto LABEL_89;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v4.i32[0] = *(_DWORD *)(a1 + 9);
  v4.i16[2] = *(_WORD *)(a1 + 13);
  int8x8_t v159 = v4;
  __int8 v158 = *(unsigned char *)(a1 + 15);
  int v163 = *(unsigned __int8 *)(a1 + 17);
  int v165 = *(unsigned __int8 *)(a1 + 18);
  unint64_t v5 = (unint64_t)*(id *)(a1 + 40);
  int v161 = *(_DWORD *)(a1 + 20);
  int v160 = *(unsigned __int8 *)(a1 + 19);
  int v6 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsRegistered");
  if (*(unsigned __int8 *)(a1 + 9) != v6)
  {
    char v12 = v6;
    if (nrCopyLogObj_onceToken_204 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      if (sNRCopyLogToStdErr) {
        goto LABEL_6;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO))
    {
LABEL_7:
      *(unsigned char *)(a1 + 9) = v12;
      goto LABEL_8;
    }
LABEL_6:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isRegistered: %d -> %d", v7, v8, v9, v10, v11, (uint64_t)"");
    goto LABEL_7;
  }
LABEL_8:
  int v13 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsEnabled");
  if (*(unsigned __int8 *)(a1 + 10) == v13) {
    goto LABEL_14;
  }
  char v19 = v13;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_12:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isEnabled: %d -> %d", v14, v15, v16, v17, v18, (uint64_t)"");
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_12;
  }
LABEL_13:
  *(unsigned char *)(a1 + 10) = v19;
LABEL_14:
  int v20 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsNearby");
  if (*(unsigned __int8 *)(a1 + 11) == v20) {
    goto LABEL_20;
  }
  char v26 = v20;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_18:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isNearby: %d -> %d", v21, v22, v23, v24, v25, (uint64_t)"");
      goto LABEL_19;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_18;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_18;
  }
LABEL_19:
  *(unsigned char *)(a1 + 11) = v26;
LABEL_20:
  int v27 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsConnected");
  if (*(unsigned __int8 *)(a1 + 12) == v27) {
    goto LABEL_26;
  }
  char v33 = v27;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_24:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isConnected: %d -> %d", v28, v29, v30, v31, v32, (uint64_t)"");
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_24;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_24;
  }
LABEL_25:
  *(unsigned char *)(a1 + 12) = v33;
LABEL_26:
  int v34 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsCloudConnected");
  if (*(unsigned __int8 *)(a1 + 13) == v34) {
    goto LABEL_32;
  }
  char v40 = v34;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_30:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isCloudConnected: %d -> %d", v35, v36, v37, v38, v39, (uint64_t)"");
      goto LABEL_31;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_30;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_30;
  }
LABEL_31:
  *(unsigned char *)(a1 + 13) = v40;
LABEL_32:
  int v41 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsAsleep");
  if (*(unsigned __int8 *)(a1 + 14) == v41) {
    goto LABEL_38;
  }
  char v47 = v41;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_36:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isAsleep: %d -> %d", v42, v43, v44, v45, v46, (uint64_t)"");
      goto LABEL_37;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_36;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_36;
  }
LABEL_37:
  *(unsigned char *)(a1 + 14) = v47;
LABEL_38:
  int v48 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsClassCConnected");
  if (*(unsigned __int8 *)(a1 + 15) == v48) {
    goto LABEL_44;
  }
  char v54 = v48;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_42:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d isClassCConnected: %d -> %d", v49, v50, v51, v52, v53, (uint64_t)"");
      goto LABEL_43;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_42;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_42;
  }
LABEL_43:
  *(unsigned char *)(a1 + 15) = v54;
LABEL_44:
  int v55 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusHasUnpairedBluetooth");
  if (*(unsigned __int8 *)(a1 + 16) == v55) {
    goto LABEL_50;
  }
  char v61 = v55;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_48:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d hasUnpairedBluetooth: %d -> %d", v56, v57, v58, v59, v60, (uint64_t)"");
      goto LABEL_49;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_48;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_48;
  }
LABEL_49:
  *(unsigned char *)(a1 + 16) = v61;
LABEL_50:
  unsigned __int8 uint64 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusLinkType");
  if (*(unsigned __int8 *)(a1 + 17) == uint64) {
    goto LABEL_56;
  }
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_54:
      unsigned int v63 = *(unsigned __int8 *)(a1 + 17);
      id v64 = (id)nrCopyLogObj_sNRLogObj_206;
      StringFromNRLinkType = (void *)createStringFromNRLinkType(v63);
      v144 = (void *)createStringFromNRLinkType(uint64);
      _NRLogWithArgs((uint64_t)v64, 1, (uint64_t)"%s%.30s:%-4d link type: %@ -> %@", v65, v66, v67, v68, v69, (uint64_t)"");

      goto LABEL_55;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_54;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_54;
  }
LABEL_55:
  *(unsigned char *)(a1 + 17) = uint64;
LABEL_56:
  unsigned __int8 v70 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusLinkSubtype");
  if (*(unsigned __int8 *)(a1 + 18) == v70) {
    goto LABEL_62;
  }
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_60:
      unsigned int v71 = *(unsigned __int8 *)(a1 + 18);
      id v72 = (id)nrCopyLogObj_sNRLogObj_206;
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype(v71);
      v145 = (void *)createStringFromNRLinkSubtype(v70);
      _NRLogWithArgs((uint64_t)v72, 1, (uint64_t)"%s%.30s:%-4d link subtype: %@ -> %@", v73, v74, v75, v76, v77, (uint64_t)"");

      goto LABEL_61;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_60;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_60;
  }
LABEL_61:
  *(unsigned char *)(a1 + 18) = v70;
LABEL_62:
  string = xpc_dictionary_get_string(v3, "DeviceMonitorStatusProxySvcIntfName");
  -[NRDeviceMonitor setInternalProxySvcIntfName:](a1, 0);
  if (string)
  {
    uint64_t v79 = [NSString stringWithUTF8String:string];
    -[NRDeviceMonitor setInternalProxySvcIntfName:](a1, v79);
  }
  uint64_t v80 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusThermalPressureLevel");
  if (*(_DWORD *)(a1 + 20) != v80)
  {
    if (nrCopyLogObj_onceToken_204 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_68;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      if (sNRCopyLogToStdErr) {
        goto LABEL_68;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO))
    {
LABEL_69:
      *(_DWORD *)(a1 + 20) = v80;
      goto LABEL_70;
    }
LABEL_68:
    uint64_t v81 = *(unsigned int *)(a1 + 20);
    id v82 = (id)nrCopyLogObj_sNRLogObj_206;
    StringFromThermalPressureLevel = createStringFromThermalPressureLevel(v81);
    v146 = createStringFromThermalPressureLevel(v80);
    _NRLogWithArgs((uint64_t)v82, 1, (uint64_t)"%s%.30s:%-4d thermal pressure level: %@ -> %@", v83, v84, v85, v86, v87, (uint64_t)"");

    goto LABEL_69;
  }
LABEL_70:
  int v88 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusPluggedIn");
  if (*(unsigned __int8 *)(a1 + 19) == v88) {
    goto LABEL_76;
  }
  char v94 = v88;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_74:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d plugged in: %d -> %d", v89, v90, v91, v92, v93, (uint64_t)"");
      goto LABEL_75;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_74;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
    goto LABEL_74;
  }
LABEL_75:
  *(unsigned char *)(a1 + 19) = v94;
LABEL_76:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  v95.i32[0] = *(_DWORD *)(a1 + 9);
  v95.i16[2] = *(_WORD *)(a1 + 13);
  v95.i8[6] = *(unsigned char *)(a1 + 15);
  BOOL v96 = v163 != *(unsigned __int8 *)(a1 + 17);
  BOOL v97 = v165 != *(unsigned __int8 *)(a1 + 18);
  BOOL v98 = v161 != *(_DWORD *)(a1 + 20);
  BOOL v99 = *(unsigned char *)(a1 + 19) != 0;
  if (v5 | *(void *)(a1 + 40))
  {
    v101 = (void *)v5;
    unint64_t v102 = v5;
    BOOL v103 = v161 != *(_DWORD *)(a1 + 20);
    int8x8_t v166 = v95;
    char v104 = objc_msgSend(v101, "isEqualToString:");
    int8x8_t v95 = v166;
    BOOL v98 = v103;
    unint64_t v5 = v102;
    char v100 = v104 ^ 1;
  }
  else
  {
    char v100 = 0;
  }
  int v105 = *(unsigned __int8 *)(a1 + 16);
  if (*(unsigned char *)(a1 + 8))
  {
    int8x8_t v106 = v159;
    *(__int32 *)((char *)v106.i32 + 2) = *(__int32 *)((char *)v159.i32 + 2);
    v106.i8[6] = v158;
    int8x8_t v107 = veor_s8(vceqz_s8(v95), vceqz_s8(v106));
    char v108 = v107.i8[6];
    char v109 = v107.i8[5];
    char v110 = v107.i8[4];
    char v111 = v107.i8[3];
    char v112 = v107.i8[2];
    char v113 = v107.i8[1];
    char v114 = v107.i8[0];
    char v115 = (v160 != 0) ^ v99;
  }
  else
  {
    BOOL v96 = 1;
    BOOL v97 = 1;
    *(unsigned char *)(a1 + 8) = 1;
    BOOL v98 = 1;
    char v115 = 1;
    char v100 = 1;
    char v114 = 1;
    char v113 = 1;
    char v112 = 1;
    char v111 = 1;
    char v110 = 1;
    char v109 = 1;
    char v108 = 1;
  }
  char v155 = v105;
  char v156 = v100;
  __int8 v148 = v113;
  __int8 v149 = v112;
  __int8 v150 = v111;
  __int8 v151 = v110;
  __int8 v147 = v114;
  __int8 v152 = v109;
  unsigned __int8 v153 = v108;
  BOOL v157 = v98;
  char v154 = v115;
  char v116 = (v105 != 0 || v96 || v97) | v100 | v98 | v115 | v114 | v111 | v113 | v112 | v110 | v109 | v108;
  v167 = (void *)v5;
  if (nrCopyLogObj_onceToken_204 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_85:
      BOOL v164 = v96;
      unsigned int v117 = *(unsigned __int8 *)(a1 + 17);
      char v162 = v116;
      id v118 = (id)nrCopyLogObj_sNRLogObj_206;
      v119 = (void *)createStringFromNRLinkType(v117);
      v120 = (void *)createStringFromNRLinkSubtype(*(unsigned __int8 *)(a1 + 18));
      uint64_t v121 = *(unsigned int *)(a1 + 20);
      id v122 = *(id *)(a1 + 40);
      v123 = createStringFromThermalPressureLevel(v121);
      _NRLogWithArgs((uint64_t)v118, 0, (uint64_t)"%s%.30s:%-4d Received %supdate %sregistered %sabled %snearby %sconnected %scloudConnected %sclassCConnected %shasUnpairedBluetooth %s %@(%@) prx %@ thermal %@ %spluggedIn for %@", v124, v125, v126, v127, v128, (uint64_t)"");

      char v116 = v162;
      BOOL v96 = v164;
      goto LABEL_86;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    if (sNRCopyLogToStdErr) {
      goto LABEL_85;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_85;
  }
LABEL_86:
  if (v116)
  {
    v129 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__NRDeviceMonitor_updateStateFromResponse___block_invoke;
    block[3] = &unk_263FD10A8;
    v130.i8[0] = v147;
    v130.i8[1] = v148;
    v130.i8[2] = v149;
    v130.i8[3] = v150;
    v130.i8[4] = v151;
    v130.i8[5] = v152;
    block[4] = a1;
    v130.i16[3] = v153;
    int8x8_t v131 = vand_s8(v130, (int8x8_t)0x101010101010101);
    __int8 v171 = v131.i8[6];
    __int16 v170 = v131.i16[2];
    __int32 v169 = v131.i32[0];
    char v172 = v155;
    BOOL v173 = v96;
    BOOL v174 = v97;
    char v175 = v156;
    BOOL v176 = v157;
    char v177 = v154;
    dispatch_async(v129, block);
  }

LABEL_89:
}

- (void)setInternalProxySvcIntfName:(uint64_t)a1
{
  id v4 = a2;
  int v6 = *(void **)(a1 + 40);
  unint64_t v5 = (id *)(a1 + 40);
  id v12 = v4;
  if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    if (nrCopyLogObj_onceToken_204 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_INFO)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 1, (uint64_t)"%s%.30s:%-4d proxy-svc intf name: %@ -> %@", v7, v8, v9, v10, v11, (uint64_t)"");
    }
    objc_storeStrong(v5, a2);
  }
}

void __43__NRDeviceMonitor_updateStateFromResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    if (WeakRetained)
    {
      id v158 = WeakRetained;
      if (!*(unsigned char *)(a1 + 40) || (objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:
        if (!*(unsigned char *)(a1 + 41) || (objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_30:
          if (!*(unsigned char *)(a1 + 42) || (objc_opt_respondsToSelector() & 1) == 0)
          {
LABEL_41:
            if (!*(unsigned char *)(a1 + 43) || (objc_opt_respondsToSelector() & 1) == 0)
            {
LABEL_52:
              if (!*(unsigned char *)(a1 + 44) || (objc_opt_respondsToSelector() & 1) == 0)
              {
LABEL_63:
                if (!*(unsigned char *)(a1 + 45) || (objc_opt_respondsToSelector() & 1) == 0)
                {
LABEL_74:
                  if (!*(unsigned char *)(a1 + 46) || (objc_opt_respondsToSelector() & 1) == 0)
                  {
LABEL_85:
                    if (!*(unsigned char *)(a1 + 47) || (objc_opt_respondsToSelector() & 1) == 0)
                    {
LABEL_96:
                      if (!*(unsigned char *)(a1 + 48) || (objc_opt_respondsToSelector() & 1) == 0)
                      {
LABEL_107:
                        if (!*(unsigned char *)(a1 + 49) || (objc_opt_respondsToSelector() & 1) == 0)
                        {
LABEL_118:
                          if (!*(unsigned char *)(a1 + 50) || (objc_opt_respondsToSelector() & 1) == 0) {
                            goto LABEL_133;
                          }
                          if (nrCopyLogObj_onceToken_204 != -1) {
                            dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                          }
                          char v111 = (id)nrCopyLogObj_sNRLogObj_206;
                          char v112 = v111;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v113 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);

                            if (!v113)
                            {
LABEL_130:
                              uint64_t v122 = *(void *)(a1 + 32);
                              if (v122) {
                                v123 = *(void **)(v122 + 40);
                              }
                              else {
                                v123 = 0;
                              }
                              id v124 = v123;
                              uint64_t v125 = (void *)[v124 copy];
                              [v158 deviceProxyServiceInterfaceNameDidChange:v122 interfaceName:v125];

LABEL_133:
                              if (!*(unsigned char *)(a1 + 51) || (objc_opt_respondsToSelector() & 1) == 0) {
                                goto LABEL_148;
                              }
                              if (nrCopyLogObj_onceToken_204 != -1) {
                                dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                              }
                              uint64_t v126 = (id)nrCopyLogObj_sNRLogObj_206;
                              uint64_t v127 = v126;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                BOOL v128 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);

                                if (!v128)
                                {
LABEL_145:
                                  uint64_t v138 = *(void *)(a1 + 32);
                                  if (v138) {
                                    uint64_t v139 = *(unsigned int *)(v138 + 20);
                                  }
                                  else {
                                    uint64_t v139 = 0;
                                  }
                                  [v158 deviceThermalPressureLevelDidChange:v138 thermalPressureLevel:v139];
LABEL_148:
                                  if (!*(unsigned char *)(a1 + 52) || (objc_opt_respondsToSelector() & 1) == 0)
                                  {
LABEL_161:
                                    int v13 = v158;
                                    goto LABEL_162;
                                  }
                                  if (nrCopyLogObj_onceToken_204 != -1) {
                                    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                                  }
                                  uint64_t v140 = (id)nrCopyLogObj_sNRLogObj_206;
                                  v141 = v140;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    BOOL v142 = os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);

                                    if (!v142)
                                    {
LABEL_158:
                                      uint64_t v150 = *(void *)(a1 + 32);
                                      if (v150) {
                                        BOOL v151 = *(unsigned char *)(v150 + 19) != 0;
                                      }
                                      else {
                                        BOOL v151 = 0;
                                      }
                                      [v158 devicePluggedInStateDidChange:v150 pluggedIn:v151];
                                      goto LABEL_161;
                                    }
                                  }
                                  if (nrCopyLogObj_onceToken_204 != -1) {
                                    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                                  }
                                  id v143 = (id)nrCopyLogObj_sNRLogObj_206;
                                  v144 = [*(id *)(a1 + 32) deviceIdentifier];
                                  _NRLogWithArgs((uint64_t)v143, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %spluggedIn", v145, v146, v147, v148, v149, (uint64_t)"");

                                  goto LABEL_158;
                                }
                              }
                              if (nrCopyLogObj_onceToken_204 != -1) {
                                dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                              }
                              id v129 = (id)nrCopyLogObj_sNRLogObj_206;
                              int8x8_t v130 = [*(id *)(a1 + 32) deviceIdentifier];
                              uint64_t v131 = *(void *)(a1 + 32);
                              if (v131) {
                                uint64_t v132 = *(unsigned int *)(v131 + 20);
                              }
                              else {
                                uint64_t v132 = 0;
                              }
                              StringFromThermalPressureLevel = createStringFromThermalPressureLevel(v132);
                              _NRLogWithArgs((uint64_t)v129, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has thermal pressure level %@", v133, v134, v135, v136, v137, (uint64_t)"");

                              goto LABEL_145;
                            }
                          }
                          if (nrCopyLogObj_onceToken_204 != -1) {
                            dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                          }
                          id v114 = (id)nrCopyLogObj_sNRLogObj_206;
                          char v115 = [*(id *)(a1 + 32) deviceIdentifier];
                          char v116 = *(void **)(a1 + 32);
                          if (v116) {
                            char v116 = (void *)v116[5];
                          }
                          char v155 = v116;
                          _NRLogWithArgs((uint64_t)v114, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has proxy svc interface name %@", v117, v118, v119, v120, v121, (uint64_t)"");

                          goto LABEL_130;
                        }
                        if (nrCopyLogObj_onceToken_204 != -1) {
                          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                        }
                        v101 = (id)nrCopyLogObj_sNRLogObj_206;
                        unint64_t v102 = v101;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          BOOL v103 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);

                          if (!v103)
                          {
LABEL_117:
                            objc_msgSend(v158, "deviceLinkTypeDidChange:linkType:linkSubtype:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "linkType"), objc_msgSend(*(id *)(a1 + 32), "linkSubtype"));
                            goto LABEL_118;
                          }
                        }
                        if (nrCopyLogObj_onceToken_204 != -1) {
                          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                        }
                        id v104 = (id)nrCopyLogObj_sNRLogObj_206;
                        int v105 = [*(id *)(a1 + 32) deviceIdentifier];
                        StringFromNRLinkType = (void *)createStringFromNRLinkType([*(id *)(a1 + 32) linkType]);
                        StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype([*(id *)(a1 + 32) linkSubtype]);
                        _NRLogWithArgs((uint64_t)v104, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has link type %@ subtype %@", v106, v107, v108, v109, v110, (uint64_t)"");

                        goto LABEL_117;
                      }
                      if (nrCopyLogObj_onceToken_204 != -1) {
                        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                      }
                      uint64_t v92 = (id)nrCopyLogObj_sNRLogObj_206;
                      uint64_t v93 = v92;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v94 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);

                        if (!v94)
                        {
LABEL_106:
                          objc_msgSend(v158, "deviceLinkTypeDidChange:linkType:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "linkType"));
                          goto LABEL_107;
                        }
                      }
                      if (nrCopyLogObj_onceToken_204 != -1) {
                        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                      }
                      id v95 = (id)nrCopyLogObj_sNRLogObj_206;
                      __int8 v152 = [*(id *)(a1 + 32) deviceIdentifier];
                      unsigned __int8 v153 = (void *)createStringFromNRLinkType([*(id *)(a1 + 32) linkType]);
                      _NRLogWithArgs((uint64_t)v95, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has link type %@", v96, v97, v98, v99, v100, (uint64_t)"");

                      goto LABEL_106;
                    }
                    if (nrCopyLogObj_onceToken_204 != -1) {
                      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                    }
                    id v82 = (id)nrCopyLogObj_sNRLogObj_206;
                    uint64_t v83 = v82;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v84 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);

                      if (!v84)
                      {
LABEL_95:
                        [v158 deviceHasUnpairedBluetooth:*(void *)(a1 + 32)];
                        goto LABEL_96;
                      }
                    }
                    if (nrCopyLogObj_onceToken_204 != -1) {
                      dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                    }
                    id v85 = (id)nrCopyLogObj_sNRLogObj_206;
                    uint64_t v86 = [*(id *)(a1 + 32) deviceIdentifier];
                    _NRLogWithArgs((uint64_t)v85, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ %shasUnpairedBluetooth", v87, v88, v89, v90, v91, (uint64_t)"");

                    goto LABEL_95;
                  }
                  if (nrCopyLogObj_onceToken_204 != -1) {
                    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                  }
                  id v72 = (id)nrCopyLogObj_sNRLogObj_206;
                  uint64_t v73 = v72;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v74 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);

                    if (!v74)
                    {
LABEL_84:
                      objc_msgSend(v158, "deviceIsClassCConnectedDidChange:isClassCConnected:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isClassCConnected"));
                      goto LABEL_85;
                    }
                  }
                  if (nrCopyLogObj_onceToken_204 != -1) {
                    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                  }
                  id v75 = (id)nrCopyLogObj_sNRLogObj_206;
                  uint64_t v76 = [*(id *)(a1 + 32) deviceIdentifier];
                  _NRLogWithArgs((uint64_t)v75, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sclassCConnected", v77, v78, v79, v80, v81, (uint64_t)"");

                  goto LABEL_84;
                }
                if (nrCopyLogObj_onceToken_204 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                }
                uint64_t v62 = (id)nrCopyLogObj_sNRLogObj_206;
                unsigned int v63 = v62;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v64 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);

                  if (!v64)
                  {
LABEL_73:
                    objc_msgSend(v158, "deviceIsAsleepDidChange:isAsleep:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAsleep"));
                    goto LABEL_74;
                  }
                }
                if (nrCopyLogObj_onceToken_204 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
                }
                id v65 = (id)nrCopyLogObj_sNRLogObj_206;
                uint64_t v66 = [*(id *)(a1 + 32) deviceIdentifier];
                [*(id *)(a1 + 32) isAsleep];
                _NRLogWithArgs((uint64_t)v65, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %s", v67, v68, v69, v70, v71, (uint64_t)"");

                goto LABEL_73;
              }
              if (nrCopyLogObj_onceToken_204 != -1) {
                dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
              }
              uint64_t v52 = (id)nrCopyLogObj_sNRLogObj_206;
              uint64_t v53 = v52;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

                if (!v54)
                {
LABEL_62:
                  objc_msgSend(v158, "deviceIsCloudConnectedDidChange:isCloudConnected:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isCloudConnected"));
                  goto LABEL_63;
                }
              }
              if (nrCopyLogObj_onceToken_204 != -1) {
                dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
              }
              id v55 = (id)nrCopyLogObj_sNRLogObj_206;
              uint64_t v56 = [*(id *)(a1 + 32) deviceIdentifier];
              [*(id *)(a1 + 32) isCloudConnected];
              _NRLogWithArgs((uint64_t)v55, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %scloudConnected", v57, v58, v59, v60, v61, (uint64_t)"");

              goto LABEL_62;
            }
            if (nrCopyLogObj_onceToken_204 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
            }
            uint64_t v42 = (id)nrCopyLogObj_sNRLogObj_206;
            uint64_t v43 = v42;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v44 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

              if (!v44)
              {
LABEL_51:
                objc_msgSend(v158, "deviceIsConnectedDidChange:isConnected:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isConnected"));
                goto LABEL_52;
              }
            }
            if (nrCopyLogObj_onceToken_204 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
            }
            id v45 = (id)nrCopyLogObj_sNRLogObj_206;
            uint64_t v46 = [*(id *)(a1 + 32) deviceIdentifier];
            [*(id *)(a1 + 32) isConnected];
            _NRLogWithArgs((uint64_t)v45, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sconnected", v47, v48, v49, v50, v51, (uint64_t)"");

            goto LABEL_51;
          }
          if (nrCopyLogObj_onceToken_204 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
          }
          uint64_t v32 = (id)nrCopyLogObj_sNRLogObj_206;
          char v33 = v32;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

            if (!v34)
            {
LABEL_40:
              objc_msgSend(v158, "deviceIsNearbyDidChange:isNearby:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isNearby"));
              goto LABEL_41;
            }
          }
          if (nrCopyLogObj_onceToken_204 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
          }
          id v35 = (id)nrCopyLogObj_sNRLogObj_206;
          uint64_t v36 = [*(id *)(a1 + 32) deviceIdentifier];
          [*(id *)(a1 + 32) isNearby];
          _NRLogWithArgs((uint64_t)v35, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %snearby", v37, v38, v39, v40, v41, (uint64_t)"");

          goto LABEL_40;
        }
        if (nrCopyLogObj_onceToken_204 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
        }
        uint64_t v22 = (id)nrCopyLogObj_sNRLogObj_206;
        uint64_t v23 = v22;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

          if (!v24)
          {
LABEL_29:
            objc_msgSend(v158, "deviceIsEnabledDidChange:isEnabled:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
            goto LABEL_30;
          }
        }
        if (nrCopyLogObj_onceToken_204 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
        }
        id v25 = (id)nrCopyLogObj_sNRLogObj_206;
        char v26 = [*(id *)(a1 + 32) deviceIdentifier];
        [*(id *)(a1 + 32) isEnabled];
        _NRLogWithArgs((uint64_t)v25, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sabled", v27, v28, v29, v30, v31, (uint64_t)"");

        goto LABEL_29;
      }
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      uint64_t v11 = (id)nrCopyLogObj_sNRLogObj_206;
      id v12 = v11;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v14 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (!v14)
        {
LABEL_18:
          objc_msgSend(v158, "deviceIsRegisteredDidChange:isRegistered:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isRegistered"));
          goto LABEL_19;
        }
      }
      if (nrCopyLogObj_onceToken_204 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
      }
      id v15 = (id)nrCopyLogObj_sNRLogObj_206;
      uint64_t v16 = [*(id *)(a1 + 32) deviceIdentifier];
      [*(id *)(a1 + 32) isRegistered];
      _NRLogWithArgs((uint64_t)v15, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sregistered", v17, v18, v19, v20, v21, (uint64_t)"");

      goto LABEL_18;
    }
  }
  if (nrCopyLogObj_onceToken_204 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_206, OS_LOG_TYPE_ERROR))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_206, 16, (uint64_t)"%s%.30s:%-4d No delegate found", a4, a5, a6, a7, a8, (uint64_t)"");
    int v13 = 0;
  }
  else
  {
    int v13 = 0;
  }
LABEL_162:
}

@end