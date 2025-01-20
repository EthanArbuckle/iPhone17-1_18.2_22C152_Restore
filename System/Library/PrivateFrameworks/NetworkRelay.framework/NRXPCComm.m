@interface NRXPCComm
- (NRDeviceIdentifier)deviceIdentifier;
- (NRXPCComm)initWithDeviceIdentifier:(id)a3 notificationQueue:(id)a4 notificationBlock:(id)a5;
- (id)description;
- (void)activate;
- (void)activateLocked;
- (void)cancel;
- (void)dealloc;
- (void)sendMessageLocked:(uint64_t)a1;
- (void)sendXPCCommDictionary:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
@end

@implementation NRXPCComm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    if (!self->_cancelled)
    {
      -[NRXPCComm activateLocked]((uint64_t)self);
      goto LABEL_8;
    }
    os_log_t v4 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    os_log_t v5 = v4;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (!v6) {
        goto LABEL_8;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d not activating as cancelled", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_8:
  os_unfair_lock_unlock(p_lock);
}

- (void)activateLocked
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
    if (!*(void *)(a1 + 32))
    {
      if (nrXPCCopyQueue_onceToken != -1) {
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
      }
      v2 = (id)nrXPCCopyQueue_nrXPCQueue;
      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v2, 2uLL);
      os_log_t v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = mach_service;

      objc_initWeak(&location, (id)a1);
      os_log_t v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__NRXPCComm_activateLocked__block_invoke;
      v7[3] = &unk_263FD14A0;
      objc_copyWeak(&v8, &location);
      xpc_connection_set_event_handler(v5, v7);

      BOOL v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
      xpc_connection_activate(v6);

      -[NRXPCComm sendMessageLocked:](a1, 0);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __27__NRXPCComm_activateLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_42;
  }
  uint64_t v5 = MEMORY[0x210512A10](v3);
  if (v5 == MEMORY[0x263EF8720])
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 3);
    *((unsigned char *)WeakRetained + 8) = 0;
    if (v3 == (id)MEMORY[0x263EF86A0])
    {
      os_log_t v21 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      os_log_t v22 = v21;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v53 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (!v53) {
          goto LABEL_38;
        }
      }
      os_log_t v54 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      os_log_t v40 = v54;
      v60 = "%s%.30s:%-4d xpc connection interrupted";
    }
    else
    {
      id v9 = (id)MEMORY[0x263EF86A8];
      os_log_t v10 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      os_log_t v11 = v10;
      if (v3 != v9)
      {
        if (sNRCopyLogToStdErr)
        {

LABEL_27:
          os_log_t v40 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
          _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d received unknown XPC error: %@", v41, v42, v43, v44, v45, (uint64_t)"");
LABEL_37:

          goto LABEL_38;
        }
        BOOL v39 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v39) {
          goto LABEL_27;
        }
LABEL_38:
        id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v30 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"teardown"];
        v62 = (void *)*((void *)WeakRetained + 5);
        if (v62)
        {
          id v63 = v62;
          v64 = *((void *)WeakRetained + 6);
          v70[0] = MEMORY[0x263EF8330];
          v70[1] = 3221225472;
          v70[2] = __27__NRXPCComm_activateLocked__block_invoke_2;
          v70[3] = &unk_263FD1338;
          id v72 = v63;
          id v71 = v30;
          id v65 = v63;
          dispatch_async(v64, v70);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);
        goto LABEL_41;
      }
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v61 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (!v61) {
          goto LABEL_38;
        }
      }
      os_log_t v54 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      os_log_t v40 = v54;
      v60 = "%s%.30s:%-4d received XPC error invalid";
    }
    _NRLogWithArgs((uint64_t)v54, 0, (uint64_t)v60, v55, v56, v57, v58, v59, (uint64_t)"");
    goto LABEL_37;
  }
  uint64_t v6 = MEMORY[0x263EF8708];
  if (v5 == MEMORY[0x263EF8708])
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 3);
    os_log_t v12 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    os_log_t v13 = v12;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

      if (!v23) {
        goto LABEL_20;
      }
    }
    os_log_t v24 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v24, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v25, v26, v27, v28, v29, (uint64_t)"");

LABEL_20:
    xpc_dictionary_get_dictionary(v3, "XPCCommNotification");
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = xpc_dictionary_get_value(v30, "XPCCommDictionary");
    if (MEMORY[0x210512A10]() == v6)
    {
      v34 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v35 = (void *)*((void *)WeakRetained + 5);
      if (v35)
      {
        id v36 = v35;
        v37 = *((void *)WeakRetained + 6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __27__NRXPCComm_activateLocked__block_invoke_3;
        block[3] = &unk_263FD1338;
        id v69 = v36;
        id v68 = v34;
        id v38 = v36;
        dispatch_async(v37, block);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);

      goto LABEL_31;
    }
    os_log_t v32 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    os_log_t v33 = v32;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v46 = os_log_type_enabled(v32, OS_LOG_TYPE_FAULT);

      if (!v46)
      {
LABEL_30:
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);
LABEL_31:

LABEL_41:
        goto LABEL_42;
      }
    }
    os_log_t v47 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"Invalid notification format", v48, v49, v50, v51, v52, v66);

    goto LABEL_30;
  }
  os_log_t v7 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
  os_log_t v8 = v7;
  if (sNRCopyLogToStdErr)
  {

LABEL_13:
    os_log_t v15 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d received unexpected XPC message %@", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_42;
  }
  BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v14) {
    goto LABEL_13;
  }
LABEL_42:
}

- (void)sendMessageLocked:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  -[NRXPCComm activateLocked](a1);
  *(void *)uuid = 0;
  uint64_t v35 = 0;
  os_log_t v4 = [(id)a1 deviceIdentifier];
  uint64_t v5 = [v4 nrDeviceIdentifier];
  [v5 getUUIDBytes:uuid];

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  os_log_t v7 = v6;
  if (!v6)
  {
    uint64_t v16 = nrCopyLogObj_312();
    uint64_t v17 = v16;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v18) {
        goto LABEL_23;
      }
    }
    goto LABEL_22;
  }
  xpc_dictionary_set_uint64(v6, "Type", 0x29uLL);
  xpc_dictionary_set_uuid(v7, "DeviceIdentifier", uuid);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    uint64_t v19 = nrCopyLogObj_312();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_23:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v28 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v28, (uint64_t)"nr_xpc_dictionary_create");
        id v29 = nrCopyLogObj_312();
        _NRLogAbortWithPack(v29);
      }
    }
LABEL_22:
    id v22 = nrCopyLogObj_312();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v23, v24, v25, v26, v27, (uint64_t)"");

    goto LABEL_23;
  }
  if (v3) {
    id v9 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v3];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  os_log_t v10 = v9;
  if (!*(unsigned char *)(a1 + 8)) {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"checkin"];
  }
  os_log_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(v8, "XPCCommDictionary", v11);
  xpc_dictionary_set_value(v7, "XPCCommNotification", v8);
  objc_initWeak(&location, (id)a1);
  os_log_t v12 = [v10 description];
  os_log_t v13 = (_xpc_connection_s *)*(id *)(a1 + 32);
  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  BOOL v14 = (id)nrXPCCopyQueue_nrXPCQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __31__NRXPCComm_sendMessageLocked___block_invoke;
  handler[3] = &unk_263FD10D8;
  objc_copyWeak(&v32, &location);
  id v15 = v12;
  id v31 = v15;
  xpc_connection_send_message_with_reply(v13, v7, v14, handler);

  *(unsigned char *)(a1 + 8) = 1;
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
LABEL_12:
}

void __31__NRXPCComm_sendMessageLocked___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](v21);
    uint64_t v5 = MEMORY[0x263EF8720];
    os_log_t v6 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
    os_log_t v7 = v6;
    if (v4 == v5)
    {
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v15 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

        if (!v15) {
          goto LABEL_12;
        }
      }
      os_log_t v9 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
      _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d failed to send %@ due to error %@", v16, v17, v18, v19, v20, (uint64_t)"");
    }
    else
    {
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

        if (!v8) {
          goto LABEL_12;
        }
      }
      os_log_t v9 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
      _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d sent %@", v10, v11, v12, v13, v14, (uint64_t)"");
    }
  }
LABEL_12:
}

uint64_t __27__NRXPCComm_activateLocked__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __27__NRXPCComm_activateLocked__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendXPCCommDictionary:(id)a3
{
  id v15 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self)
  {
    os_log_t v7 = 0;
    goto LABEL_6;
  }
  if (!self->_cancelled)
  {
    os_log_t v7 = self;
LABEL_6:
    -[NRXPCComm sendMessageLocked:]((uint64_t)v7, v15);
    goto LABEL_9;
  }
  os_log_t v5 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v6 = v5;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v8) {
      goto LABEL_9;
    }
  }
  os_log_t v9 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d not sending message as cancelled", v10, v11, v12, v13, v14, (uint64_t)"");

LABEL_9:
  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self) {
    unint64_t identifier = self->_identifier;
  }
  else {
    unint64_t identifier = 0;
  }
  os_log_t v5 = [(NRXPCComm *)self deviceIdentifier];
  os_log_t v6 = [v5 nrDeviceIdentifier];
  os_log_t v7 = [v6 UUIDString];
  BOOL v8 = (void *)[v3 initWithFormat:@"XPCComm[%llu %@]", identifier, v7];

  return v8;
}

- (void)dealloc
{
  os_log_t v3 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v4 = v3;
  if (sNRCopyLogToStdErr)
  {

LABEL_4:
    os_log_t v6 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d Dealloc", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_5;
  }
  BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
  [(NRXPCComm *)self cancel];
  uint64_t v12 = self->_nrUUID;
  os_unfair_lock_lock(&sNRLogLock);
  [(id)sNRUUIDsEligibleForLogObject removeObject:v12];

  os_unfair_lock_unlock(&sNRLogLock);
  v13.receiver = self;
  v13.super_class = (Class)NRXPCComm;
  [(NRXPCComm *)&v13 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_log_t v4 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v5 = v4;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6) {
      goto LABEL_5;
    }
  }
  os_log_t v7 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d Cancel", v8, v9, v10, v11, v12, (uint64_t)"");

LABEL_5:
  self->_cancelled = 1;
  os_unfair_lock_assert_owner(p_lock);
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    uint64_t v14 = self->_connection;
    self->_connection = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NRXPCComm)initWithDeviceIdentifier:(id)a3 notificationQueue:(id)a4 notificationBlock:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v29 = nrCopyLogObj_312();
    id v30 = v29;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v31 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v31) {
        goto LABEL_16;
      }
    }
    id v35 = nrCopyLogObj_312();
    _NRLogWithArgs((uint64_t)v35, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v36, v37, v38, v39, v40, (uint64_t)"");

LABEL_16:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v41 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v41 = 136446466;
    *(void *)(v41 + 4) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
    *(_WORD *)(v41 + 12) = 2080;
    *(void *)(v41 + 14) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  v50.receiver = self;
  v50.super_class = (Class)NRXPCComm;
  objc_super v13 = [(NRXPCComm *)&v50 init];
  if (!v13)
  {
    id v32 = nrCopyLogObj_312();
    os_log_t v33 = v32;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (!v34) {
        goto LABEL_19;
      }
    }
    id v42 = nrCopyLogObj_312();
    _NRLogWithArgs((uint64_t)v42, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v43, v44, v45, v46, v47, (uint64_t)"");

LABEL_19:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v48 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v48 = 136446210;
    *(void *)(v48 + 4) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
LABEL_20:
    id v49 = nrCopyLogObj_312();
    _NRLogAbortWithPack(v49);
  }
  uint64_t v14 = v13;
  objc_storeStrong((id *)&v13->_deviceIdentifier, a3);
  objc_storeStrong((id *)&v14->_notificationQueue, a4);
  uint64_t v15 = MEMORY[0x210512410](v12);
  id notificationBlock = v14->_notificationBlock;
  v14->_id notificationBlock = (id)v15;

  v14->_lock._os_unfair_lock_opaque = 0;
  v14->_unint64_t identifier = atomic_fetch_add_explicit(&initWithDeviceIdentifier_notificationQueue_notificationBlock__sNRDevicePreferencesIndex, 1uLL, memory_order_relaxed);
  uint64_t v17 = [(NRDeviceIdentifier *)v14->_deviceIdentifier nrDeviceIdentifier];
  nrUUID = v14->_nrUUID;
  v14->_nrUUID = (NSUUID *)v17;

  _NRAddEligibleNRUUIDForLogObject(v14->_nrUUID);
  os_log_t v19 = _NRCopyLogObjectForNRUUID(v14->_nrUUID);
  os_log_t v20 = v19;
  if (sNRCopyLogToStdErr)
  {

LABEL_6:
    os_log_t v22 = _NRCopyLogObjectForNRUUID(v14->_nrUUID);
    _NRLogWithArgs((uint64_t)v22, 0, (uint64_t)"%s%.30s:%-4d Init for %@", v23, v24, v25, v26, v27, (uint64_t)"");

    goto LABEL_7;
  }
  BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v21) {
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

@end