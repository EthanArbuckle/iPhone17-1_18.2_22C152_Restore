@interface NRDevicePreferences
- (BOOL)hasPreferWiFiRequest;
- (BOOL)hasQuickRelayRequest;
- (BOOL)isNRDTestServer;
- (NRBluetoothLinkPreferences)bluetoothLinkPreferences;
- (NRCompanionLinkPreferences)companionLinkPreferences;
- (NRDeviceIdentifier)deviceIdentifier;
- (NRDevicePreferences)initWithDeviceIdentifier:(id)a3;
- (NSSet)policyTrafficClassifiers;
- (const)copyDetailsLocked;
- (id)description;
- (uint64_t)restartConnectionLocked;
- (void)addPreferWiFiRequest;
- (void)addQuickRelayRequest;
- (void)cancel;
- (void)cancelConnectionLocked;
- (void)dealloc;
- (void)deviceSetupCompleted;
- (void)deviceSetupStarted;
- (void)removeAllQuickRelayRequests;
- (void)removePreferWiFiRequest;
- (void)removePreferWiFiRequestLocked;
- (void)removeQuickRelayRequest;
- (void)removeQuickRelayRequestLocked:(uint64_t)a1;
- (void)resetCompanionLinkPreferencesLocked;
- (void)sendDevicePreferencesLocked;
- (void)setBluetoothLinkPreferences:(id)a3;
- (void)setBluetoothLinkPreferencesLocked:(uint64_t)a1;
- (void)setCompanionLinkPreferences:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIsNRDTestServer:(BOOL)a3;
- (void)setPolicyTrafficClassifiers:(id)a3;
@end

@implementation NRDevicePreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmpnLnkPrefsEvaluator, 0);
  objc_storeStrong((id *)&self->_internalPolicyTrafficClassifiers, 0);
  objc_storeStrong((id *)&self->_internalCompanionLinkPreferences, 0);
  objc_storeStrong((id *)&self->_internalBluetoothLinkPreferences, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_quickRelayPreference, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)setIsNRDTestServer:(BOOL)a3
{
  self->_isNRDTestServer = a3;
}

- (BOOL)isNRDTestServer
{
  return self->_isNRDTestServer;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setPolicyTrafficClassifiers:(id)a3
{
  id v25 = a3;
  if (v25) {
    id v4 = (id)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v25 copyItems:1];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  v5 = v4;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    internalPolicyTrafficClassifiers = self->_internalPolicyTrafficClassifiers;
  }
  else {
    internalPolicyTrafficClassifiers = 0;
  }
  if ([v5 isEqual:internalPolicyTrafficClassifiers])
  {
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)nrCopyLogObj_sNRLogObj_105;
      v22 = _NRCopyPolicyTrafficClassifiersDescription(v5);
      _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d %@ policy traffic classifiers already set to %@", v8, v9, v10, v11, v12, (uint64_t)"");
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)nrCopyLogObj_sNRLogObj_105;
      if (self) {
        v14 = self->_internalPolicyTrafficClassifiers;
      }
      else {
        v14 = 0;
      }
      v15 = v14;
      id v16 = v13;
      v23 = _NRCopyPolicyTrafficClassifiersDescription(v15);
      v24 = _NRCopyPolicyTrafficClassifiersDescription(v5);
      _NRLogWithArgs((uint64_t)v16, 0, (uint64_t)"%s%.30s:%-4d %@ setting policy traffic classifiers from %@ to %@", v17, v18, v19, v20, v21, (uint64_t)"");
    }
    if (self)
    {
      objc_storeStrong((id *)&self->_internalPolicyTrafficClassifiers, v5);
      -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)sendDevicePreferencesLocked
{
  location[2] = *(id *)MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  v2 = (const os_unfair_lock *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if ([(id)a1 isNRDTestServer]) {
    return;
  }
  os_unfair_lock_assert_owner(v2);
  id v3 = *(id *)(a1 + 64);
  if (([v3 isNotEmpty] & 1) != 0 || objc_msgSend(*(id *)(a1 + 80), "count") || *(unsigned char *)(a1 + 8))
  {

    goto LABEL_7;
  }
  int v28 = *(unsigned __int8 *)(a1 + 9);

  if (v28)
  {
LABEL_7:
    if (!*(void *)(a1 + 56))
    {
      if (nrXPCCopyQueue_onceToken != -1) {
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
      }
      id v4 = (id)nrXPCCopyQueue_nrXPCQueue;
      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v4, 2uLL);
      v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = mach_service;

      objc_initWeak(location, (id)a1);
      id v7 = (_xpc_connection_s *)*(id *)(a1 + 56);
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke;
      v65[3] = &unk_263FD14A0;
      objc_copyWeak(&v66, location);
      xpc_connection_set_event_handler(v7, v65);

      uint64_t v8 = (_xpc_connection_s *)*(id *)(a1 + 56);
      xpc_connection_activate(v8);

      objc_destroyWeak(&v66);
      objc_destroyWeak(location);
    }
    location[0] = 0;
    location[1] = 0;
    uint64_t v9 = [(id)a1 deviceIdentifier];
    uint64_t v10 = [v9 nrDeviceIdentifier];
    [v10 getUUIDBytes:location];

    id v16 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)a1);
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ sending device preferences: %@", v11, v12, v13, v14, v15, (uint64_t)"");
    }
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    uint64_t v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_uint64(v17, "Type", 0xBuLL);
      xpc_dictionary_set_uuid(v18, "DeviceIdentifier", (const unsigned __int8 *)location);
      xpc_dictionary_set_BOOL(v18, "DevicePreferencesIsDeviceSetupInProgress", *(unsigned char *)(a1 + 8));
      if ([*(id *)(a1 + 64) isNotEmpty])
      {
        uint64_t v19 = (void *)[*(id *)(a1 + 64) copyEncodedXPCDict];
        xpc_dictionary_set_value(v18, "DevicePreferencesBTLinkPreferences", v19);
      }
      if (![*(id *)(a1 + 80) count]) {
        goto LABEL_29;
      }
      xpc_object_t v20 = xpc_array_create(0, 0);
      if (v20)
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v21 = *(id *)(a1 + 80);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v62 != v23) {
                objc_enumerationMutation(v21);
              }
              xpc_array_set_string(v20, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v61 + 1) + 8 * i) UTF8String]);
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v67 count:16];
          }
          while (v22);
        }

        xpc_dictionary_set_value(v18, "DevicePreferencesPolicyTrafficClassifiers", v20);
LABEL_29:
        objc_initWeak(&v60, (id)a1);
        id v25 = (_xpc_connection_s *)*(id *)(a1 + 56);
        if (nrXPCCopyQueue_onceToken != -1) {
          dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
        }
        v26 = (id)nrXPCCopyQueue_nrXPCQueue;
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke_2;
        v57[3] = &unk_263FD10D8;
        objc_copyWeak(&v59, &v60);
        v27 = v16;
        v58 = v27;
        xpc_connection_send_message_with_reply(v25, v18, v26, v57);

        objc_destroyWeak(&v59);
        objc_destroyWeak(&v60);

        return;
      }
      v38 = nrCopyLogObj_109();
      v39 = v38;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v40 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

        if (!v40) {
          goto LABEL_53;
        }
      }
      id v48 = nrCopyLogObj_109();
      _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v49, v50, v51, v52, v53, (uint64_t)"");

LABEL_53:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v54 = _os_log_pack_fill();
      __os_log_helper_1_2_3_8_34_8_0_4_0(v54, (uint64_t)"nr_xpc_array_create");
LABEL_54:
      id v55 = nrCopyLogObj_109();
      _NRLogAbortWithPack(v55);
    }
    v35 = nrCopyLogObj_109();
    v36 = v35;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37) {
        goto LABEL_50;
      }
    }
    id v41 = nrCopyLogObj_109();
    _NRLogWithArgs((uint64_t)v41, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v42, v43, v44, v45, v46, (uint64_t)"");

LABEL_50:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v47 = _os_log_pack_fill();
    __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v47, (uint64_t)"nr_xpc_dictionary_create");
    goto LABEL_54;
  }
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = (id)nrCopyLogObj_sNRLogObj_105;
    v56 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)a1);
    _NRLogWithArgs((uint64_t)v29, 0, (uint64_t)"%s%.30s:%-4d %@ cancelling connection because not needed %@", v30, v31, v32, v33, v34, (uint64_t)"");
  }
  -[NRDevicePreferences cancelConnectionLocked](a1);
}

- (const)copyDetailsLocked
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    id v2 = [NSString alloc];
    uint64_t v3 = *(void *)&v1[8]._os_unfair_lock_opaque;
    id v4 = *(void **)&v1[16]._os_unfair_lock_opaque;
    id v5 = *(id *)&v1[20]._os_unfair_lock_opaque;
    id v6 = v4;
    id v7 = _NRCopyPolicyTrafficClassifiersDescription(v5);
    uint64_t v8 = [v2 initWithFormat:@"%llu preferWiFi, %@, %@", v3, v6, v7];

    return (const os_unfair_lock *)v8;
  }
  return result;
}

- (void)cancelConnectionLocked
{
  if (a1)
  {
    id v2 = (const os_unfair_lock *)(a1 + 16);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (id)nrCopyLogObj_sNRLogObj_105;
      os_unfair_lock_assert_owner(v2);
      id v4 = [NSString alloc];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(a1 + 80);
      id v7 = *(id *)(a1 + 64);
      id v8 = v6;
      uint64_t v9 = _NRCopyPolicyTrafficClassifiersDescription(v8);
      uint64_t v10 = (void *)[v4 initWithFormat:@"%llu preferWiFi, %@, %@", v5, v7, v9];

      _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d %@ cancelling connection %@", v11, v12, v13, v14, v15, (uint64_t)"");
    }
    id v16 = *(_xpc_connection_s **)(a1 + 56);
    if (v16)
    {
      xpc_connection_cancel(v16);
      xpc_object_t v17 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
  }
}

void __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MEMORY[0x210512A10](v14) == MEMORY[0x263EF8720])
    {
      os_unfair_lock_lock(WeakRetained + 4);
      if (v14 == (id)MEMORY[0x263EF86A0])
      {
        if (nrCopyLogObj_onceToken_103 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ interrupted, resubmitting device preferences", v9, v10, v11, v12, v13, (uint64_t)"");
        }
        -[NRDevicePreferences sendDevicePreferencesLocked](WeakRetained);
      }
      else
      {
        if (v14 == (id)MEMORY[0x263EF86A8])
        {
          if (nrCopyLogObj_onceToken_103 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ received XPC error invalid", v9, v10, v11, v12, v13, (uint64_t)"");
          }
        }
        else
        {
          if (nrCopyLogObj_onceToken_103 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_ERROR)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 16, (uint64_t)"%s%.30s:%-4d %@ received unknown XPC error: %@", v9, v10, v11, v12, v13, (uint64_t)"");
          }
        }
        -[NRDevicePreferences restartConnectionLocked]((uint64_t)WeakRetained);
      }
      os_unfair_lock_unlock(WeakRetained + 4);
    }
    else
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 16, (uint64_t)"%s%.30s:%-4d %@ received unexpected XPC message %@", v4, v5, v6, v7, v8, (uint64_t)"");
      }
    }
  }
}

void __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (MEMORY[0x210512A10](v9) == MEMORY[0x263EF8720])
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 16, (uint64_t)"%s%.30s:%-4d %@ failed to send device preferences: %@, error %@", v4, v5, v6, v7, v8, (uint64_t)"");
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ sent device preferences: %@", v4, v5, v6, v7, v8, (uint64_t)"");
      }
    }
  }
}

- (uint64_t)restartConnectionLocked
{
  id v2 = (const os_unfair_lock *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)nrCopyLogObj_sNRLogObj_105;
    os_unfair_lock_assert_owner(v2);
    id v4 = [NSString alloc];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 80);
    id v7 = *(id *)(a1 + 64);
    id v8 = v6;
    id v9 = _NRCopyPolicyTrafficClassifiersDescription(v8);
    uint64_t v10 = (void *)[v4 initWithFormat:@"%llu preferWiFi, %@, %@", v5, v7, v9];

    _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d %@ restarting connection %@", v11, v12, v13, v14, v15, (uint64_t)"");
  }
  -[NRDevicePreferences cancelConnectionLocked](a1);
  return -[NRDevicePreferences sendDevicePreferencesLocked](a1);
}

- (NSSet)policyTrafficClassifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    id v4 = (objc_class *)MEMORY[0x263EFFA08];
    if (self->_internalPolicyTrafficClassifiers)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:self->_internalPolicyTrafficClassifiers copyItems:1];
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = (objc_class *)MEMORY[0x263EFFA08];
  }
  id v5 = objc_alloc_init(v4);
LABEL_6:
  uint64_t v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v6;
}

- (void)setCompanionLinkPreferences:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!self
     || (uint64_t v6 = self->_internalCompanionLinkPreferences) == 0
     || (id v7 = v6, v8 = [v5 isEqual:self->_internalCompanionLinkPreferences], v7, !v8)))
  {
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)nrCopyLogObj_sNRLogObj_105;
      id v10 = (id)nrCopyLogObj_sNRLogObj_105;
      _NRLogWithArgs((uint64_t)v10, 0, (uint64_t)"%s%.30s:%-4d %@ setting link preferences from %@ to %@", v11, v12, v13, v14, v15, (uint64_t)"");
    }
    -[NRDevicePreferences resetCompanionLinkPreferencesLocked]((uint64_t)self);
    if (!v5) {
      goto LABEL_32;
    }
    if ([v5 serviceClass] == 2
      || [v5 serviceClass] == 3
      || [v5 serviceClass] == 4)
    {
      id v16 = objc_alloc_init(NRBluetoothLinkPreferences);
      [(NRBluetoothLinkPreferences *)v16 setPacketsPerSecond:&unk_26BE1D938];
      -[NRDevicePreferences setBluetoothLinkPreferencesLocked:]((uint64_t)self, v16);
      if (self) {
        self->_hasCmpnLnkPrefsForBT = 1;
      }
    }
    if ([v5 serviceClass] == 3)
    {
      id v17 = objc_alloc_init(MEMORY[0x263F14410]);
      [v17 requireNetworkAgentWithDomain:@"com.apple.networkrelay" type:@"PhoneCallRelayAgent"];
      uint64_t v18 = (void *)[v17 copyCParameters];
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();

      xpc_object_t v20 = (void *)nw_path_evaluator_copy_path();
      id v21 = (void *)nw_path_copy_netagent_dictionary();
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      if (v21)
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __51__NRDevicePreferences_setCompanionLinkPreferences___block_invoke;
        applier[3] = &unk_263FD1080;
        id v25 = &v26;
        id v24 = v20;
        xpc_dictionary_apply(v21, applier);

        if (self)
        {
          if (*((unsigned char *)v27 + 24))
          {
            self->_hasCmpnLnkPrefsForIsoch = 1;
            objc_storeStrong((id *)&self->_cmpnLnkPrefsEvaluator, evaluator_for_endpoint);
          }
        }
      }
      _Block_object_dispose(&v26, 8);
    }
    if (![v5 highThroughput])
    {
LABEL_32:
      if (!self) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    if ([v5 includeP2P])
    {
      if ([v5 serviceClass] != 2
        && [v5 serviceClass] != 3
        && [v5 serviceClass] != 4
        && [v5 serviceClass] != 5)
      {
        NRPreferP2PSet(1);
        if (!self) {
          goto LABEL_38;
        }
        uint64_t v22 = 10;
        goto LABEL_36;
      }
      NRPreferP2PImmediatelySet(1);
      if (self)
      {
        uint64_t v22 = 11;
LABEL_36:
        *((unsigned char *)&self->super.isa + v22) = 1;
LABEL_37:
        objc_storeStrong((id *)&self->_internalCompanionLinkPreferences, a3);
      }
    }
    else
    {
      NRPreferWiFiSet(1);
      if (self)
      {
        uint64_t v22 = 12;
        goto LABEL_36;
      }
    }
  }
LABEL_38:
  os_unfair_lock_unlock(&self->_lock);
}

- (void)resetCompanionLinkPreferencesLocked
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (*(void *)(a1 + 72))
    {
      if (*(unsigned char *)(a1 + 13))
      {
        -[NRDevicePreferences setBluetoothLinkPreferencesLocked:](a1, 0);
        *(unsigned char *)(a1 + 13) = 0;
      }
      if (*(unsigned char *)(a1 + 14))
      {
        nw_path_evaluator_cancel();
        [(id)a1 setCompanionLinkPreferences:0];
        *(unsigned char *)(a1 + 14) = 0;
      }
      if (*(unsigned char *)(a1 + 10))
      {
        NRPreferP2PSet(0);
        *(unsigned char *)(a1 + 10) = 0;
      }
      if (*(unsigned char *)(a1 + 11))
      {
        NRPreferP2PImmediatelySet(0);
        *(unsigned char *)(a1 + 11) = 0;
      }
      if (*(unsigned char *)(a1 + 12))
      {
        NRPreferWiFiSet(0);
        *(unsigned char *)(a1 + 12) = 0;
      }
      id v2 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;
    }
  }
}

- (void)setBluetoothLinkPreferencesLocked:(uint64_t)a1
{
  id v16 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (id)nrCopyLogObj_sNRLogObj_105;
        _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d %@ setting Bluetooth link preferences from %@ to %@", v10, v11, v12, v13, v14, (uint64_t)"");
      }
      objc_storeStrong((id *)(a1 + 64), a2);
      -[NRDevicePreferences sendDevicePreferencesLocked](a1);
    }
    else
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 17, (uint64_t)"Invalid bluetooth link preferences", v4, v5, v6, v7, v8, v15);
      }
    }
  }
}

uint64_t __51__NRDevicePreferences_setCompanionLinkPreferences___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  uint64_t result = 1;
  if (data && length >= 0xD8 && length == *((unsigned int *)data + 53) + 216)
  {
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "PhoneCallRelayAgent"))
    {
      char v6 = nw_path_assert_agent();
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (NRCompanionLinkPreferences)companionLinkPreferences
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    internalCompanionLinkPreferences = self->_internalCompanionLinkPreferences;
  }
  else {
    internalCompanionLinkPreferences = 0;
  }
  uint64_t v5 = (void *)[(NRCompanionLinkPreferences *)internalCompanionLinkPreferences copy];
  os_unfair_lock_unlock(p_lock);
  return (NRCompanionLinkPreferences *)v5;
}

- (void)setBluetoothLinkPreferences:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (self)
  {
    self->_hasCmpnLnkPrefsForBT = 0;
    -[NRDevicePreferences setBluetoothLinkPreferencesLocked:]((uint64_t)self, v5);
  }
  else
  {
  }
  os_unfair_lock_unlock(p_lock);
}

- (NRBluetoothLinkPreferences)bluetoothLinkPreferences
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    internalBluetoothLinkPreferences = self->_internalBluetoothLinkPreferences;
  }
  else {
    internalBluetoothLinkPreferences = 0;
  }
  id v5 = (void *)[(NRBluetoothLinkPreferences *)internalBluetoothLinkPreferences copy];
  os_unfair_lock_unlock(p_lock);
  return (NRBluetoothLinkPreferences *)v5;
}

- (BOOL)hasQuickRelayRequest
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_quickRelayRequestCount != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeAllQuickRelayRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 1);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeQuickRelayRequestLocked:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  uint64_t v9 = *(void *)(a1 + 40);
  if (!v9) {
    return;
  }
  if (a2)
  {
    *(void *)(a1 + 40) = 0;
    if (nrCopyLogObj_onceToken_103 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ removing all quick relay requests (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)"");
    }
    [*(id *)(a1 + 48) removeAllQuickRelayRequests];
    if (*(void *)(a1 + 40)) {
      return;
    }
LABEL_17:
    uint64_t v10 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    return;
  }
  *(void *)(a1 + 40) = v9 - 1;
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ removing quick relay request (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)"");
  }
  [*(id *)(a1 + 48) removeQuickRelayRequest];
  if (!*(void *)(a1 + 40)) {
    goto LABEL_17;
  }
}

- (void)removeQuickRelayRequest
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)addQuickRelayRequest
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t quickRelayRequestCount = self->_quickRelayRequestCount;
  if (!quickRelayRequestCount)
  {
    if (self->_quickRelayPreference)
    {
      unint64_t quickRelayRequestCount = 0;
    }
    else
    {
      uint64_t v5 = [NRDevicePreferencesQuickRelay alloc];
      uint64_t v6 = [(NRDevicePreferences *)self deviceIdentifier];
      uint64_t v7 = [v6 nrDeviceIdentifier];
      uint64_t v8 = [(NRDevicePreferencesQuickRelay *)v5 initWithNRUUID:v7];
      quickRelayPreference = self->_quickRelayPreference;
      self->_quickRelayPreference = v8;

      unint64_t quickRelayRequestCount = self->_quickRelayRequestCount;
    }
  }
  self->_unint64_t quickRelayRequestCount = quickRelayRequestCount + 1;
  [(NRDevicePreferencesQuickRelay *)self->_quickRelayPreference addQuickRelayRequest];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasPreferWiFiRequest
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_preferWiFiRequestCount != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removePreferWiFiRequest
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removePreferWiFiRequestLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)removePreferWiFiRequestLocked
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      *(void *)(a1 + 32) = v7 - 1;
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ removing prefer Wi-Fi request (count is now %llu)", v2, v3, v4, v5, v6, (uint64_t)"");
      }
      NRPreferWiFiSet(0);
    }
    else
    {
      if (nrCopyLogObj_onceToken_103 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 16, (uint64_t)"%s%.30s:%-4d %@ not removing prefer Wi-Fi request because count is 0", v2, v3, v4, v5, v6, (uint64_t)"");
      }
    }
  }
}

- (void)addPreferWiFiRequest
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_preferWiFiRequestCount;
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d %@ adding prefer Wi-Fi request (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)"");
  }
  NRPreferWiFiSet(1);
  os_unfair_lock_unlock(p_lock);
}

- (void)deviceSetupCompleted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_internalDeviceSetupStarted = 256;
  -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)deviceSetupStarted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_internalDeviceSetupStarted = 1;
  -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
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
  uint64_t v5 = [(NRDevicePreferences *)self deviceIdentifier];
  uint64_t v6 = [v5 nrDeviceIdentifier];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = (void *)[v3 initWithFormat:@"DevPref[%llu %@]", identifier, v7];

  return v8;
}

- (void)dealloc
{
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d Dealloc: %@", v2, v3, v4, v5, v6, (uint64_t)"");
  }
  [(NRDevicePreferences *)self cancel];
  v8.receiver = self;
  v8.super_class = (Class)NRDevicePreferences;
  [(NRDevicePreferences *)&v8 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)nrCopyLogObj_sNRLogObj_105;
    uint64_t v11 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)self);
    _NRLogWithArgs((uint64_t)v4, 0, (uint64_t)"%s%.30s:%-4d Cancel: %@ %@", v5, v6, v7, v8, v9, (uint64_t)"");
  }
  while (self->_preferWiFiRequestCount)
    -[NRDevicePreferences removePreferWiFiRequestLocked]((uint64_t)self);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 1);
  internalBluetoothLinkPreferences = self->_internalBluetoothLinkPreferences;
  self->_internalBluetoothLinkPreferences = 0;

  *(_WORD *)&self->_internalDeviceSetupStarted = 0;
  -[NRDevicePreferences resetCompanionLinkPreferencesLocked]((uint64_t)self);
  -[NRDevicePreferences cancelConnectionLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (NRDevicePreferences)initWithDeviceIdentifier:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = nrCopyLogObj_109();
    id v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17) {
        goto LABEL_17;
      }
    }
    id v21 = nrCopyLogObj_109();
    _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v22, v23, v24, v25, v26, (uint64_t)"");

LABEL_17:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136446466;
    *(void *)(v27 + 4) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
    *(_WORD *)(v27 + 12) = 2080;
    *(void *)(v27 + 14) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  v36.receiver = self;
  v36.super_class = (Class)NRDevicePreferences;
  uint64_t v7 = [(NRDevicePreferences *)&v36 init];
  if (!v7)
  {
    uint64_t v18 = nrCopyLogObj_109();
    uint64_t v19 = v18;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v20) {
        goto LABEL_20;
      }
    }
    id v28 = nrCopyLogObj_109();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v29, v30, v31, v32, v33, (uint64_t)"");

LABEL_20:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136446210;
    *(void *)(v34 + 4) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
LABEL_21:
    id v35 = nrCopyLogObj_109();
    _NRLogAbortWithPack(v35);
  }
  uint64_t v8 = v7;
  objc_storeStrong((id *)&v7->_deviceIdentifier, a3);
  v8->_lock._os_unfair_lock_opaque = 0;
  v8->_unint64_t identifier = atomic_fetch_add_explicit(&initWithDeviceIdentifier__sNRDevicePreferencesIndex, 1uLL, memory_order_relaxed);
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_105, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_105, 0, (uint64_t)"%s%.30s:%-4d Init: %@", v9, v10, v11, v12, v13, (uint64_t)"");
  }

  return v8;
}

@end