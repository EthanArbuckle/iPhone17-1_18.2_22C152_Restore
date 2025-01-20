@interface NRDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)archived;
- (BOOL)canMigrate;
- (BOOL)migrationConfirmed;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)supportsCapability:(id)a3;
- (NRDevice)init;
- (NRDevice)initWithCoder:(id)a3;
- (NRDevice)initWithQueue:(id)a3;
- (NRDevice)initWithRegistry:(id)a3 diff:(id)a4 pairingID:(id)a5 notify:(BOOL)a6;
- (NSUUID)pairingID;
- (id)description;
- (id)migrationError;
- (id)propertyNames;
- (id)valueForProperty:(id)a3;
- (uint64_t)_updateSelfRetain;
- (void)_fireChangeNotificationsForDiff:(void *)a3 secureProperties:(int)a4 notify:;
- (void)_queueFirePropertyObserversForProperty:(void *)a3 fromValue:;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)addPropertyObserver:(id)a3 forPropertyChanges:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)postNotification:(uint64_t)a1 withUserInfo:(void *)a2;
- (void)registerForPropertyChanges:(id)a3 withBlock:(id)a4;
- (void)removePropertyObserver:(id)a3 forPropertyChanges:(id)a4;
- (void)unregisterForPropertyChanges:(id)a3 withBlock:(id)a4;
@end

@implementation NRDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiscuousChangeBlocks, 0);
  objc_storeStrong((id *)&self->_changeBlocks, 0);
  objc_storeStrong((id *)&self->_promiscuousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_oldPropertiesForChangeNotifications, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);

  objc_storeStrong((id *)&self->_me, 0);
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__NRDevice_setValue_forProperty___block_invoke;
  v13[3] = &unk_1E5B00280;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  p_lock = &self->_lock;
  v9 = self;
  id v10 = v7;
  id v11 = v6;
  os_unfair_lock_lock_with_options();
  __33__NRDevice_setValue_forProperty___block_invoke((uint64_t)v13);
  os_unfair_lock_unlock(p_lock);

  return 1;
}

uint64_t __33__NRDevice_setValue_forProperty___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setValue:*(void *)(a1 + 40) forProperty:*(void *)(a1 + 48)];
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  properties = self->_properties;
  if (!properties)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = self->_properties;
    self->_properties = v8;

    registry = self->_registry;
    self->_registry = 0;

    properties = self->_properties;
  }
  if (v11) {
    [(NSMutableDictionary *)properties setObject:v11 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:v6];
  }
}

- (NRDevice)initWithQueue:(id)a3
{
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [(NRDevice *)self initWithRegistry:v4 diff:0 pairingID:v5 notify:0];

  return v6;
}

- (NRDevice)initWithRegistry:(id)a3 diff:(id)a4 pairingID:(id)a5 notify:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v43.receiver = self;
  v43.super_class = (Class)NRDevice;
  id v14 = [(NRDevice *)&v43 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_registry, a3);
    objc_storeStrong((id *)&v15->_pairingID, a5);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v15->_observers;
    v15->_observers = v16;

    uint64_t v18 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    promiscuousObservers = v15->_promiscuousObservers;
    v15->_promiscuousObservers = (NSPointerArray *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    changeBlocks = v15->_changeBlocks;
    v15->_changeBlocks = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    promiscuousChangeBlocks = v15->_promiscuousChangeBlocks;
    v15->_promiscuousChangeBlocks = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    oldPropertiesForChangeNotifications = v15->_oldPropertiesForChangeNotifications;
    v15->_oldPropertiesForChangeNotifications = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v15->_me, v15);
    if (v11)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke;
      v38[3] = &unk_1E5B01B30;
      v26 = v15;
      v39 = v26;
      id v40 = v12;
      id v27 = v11;
      id v41 = v27;
      BOOL v42 = a6;
      [v27 grabRegistryWithReadBlock:v38];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_2;
      v36[3] = &unk_1E5B01B58;
      v28 = v26;
      v37 = v28;
      id v29 = (id)[v27 addDiffObserverWithWriteBlock:v36];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_3;
      v34[3] = &unk_1E5B01B80;
      v35 = v28;
      id v30 = (id)[v27 addSecurePropertiesObserverWithReadBlock:v34];

      properties = (NSMutableDictionary *)v39;
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
      properties = v15->_properties;
      v15->_properties = (NSMutableDictionary *)v32;
    }
  }
  return v15;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_changeBlocks removeAllObjects];
  [(NSMutableArray *)self->_promiscuousChangeBlocks removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)NRDevice;
  [(NRDevice *)&v3 dealloc];
}

- (BOOL)supportsCapability:(id)a3
{
  id v4 = a3;
  v5 = [(NRDevice *)self valueForProperty:@"capabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 hasUUID:v4];
  }
  else {
    char v6 = [v5 containsObject:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  uint64_t v24 = __Block_byref_object_dispose__8;
  id v25 = 0;
  registry = self->_registry;
  if (registry)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __29__NRDevice_valueForProperty___block_invoke;
    v18[3] = &unk_1E5B01BA8;
    v18[4] = self;
    v19[0] = v4;
    v19[1] = &v20;
    [(NRRegistry *)registry deasyncGrabRegistryWithReadBlock:v18];
    BOOL v7 = (id *)v19;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v14 = __29__NRDevice_valueForProperty___block_invoke_2;
    id v15 = &unk_1E5B01BD0;
    v17[1] = &v20;
    v16 = self;
    v17[0] = v4;
    p_lock = &self->_lock;
    v9 = v13;
    id v10 = self;
    os_unfair_lock_lock_with_options();
    v14(v9);
    BOOL v7 = (id *)v17;

    os_unfair_lock_unlock(p_lock);
  }

  id v11 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __29__NRDevice_valueForProperty___block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) secureProperties];
  -[NRDevice _fireChangeNotificationsForDiff:secureProperties:notify:](v2, v3, v4, *(unsigned __int8 *)(a1 + 56));

  uint64_t v5 = *(void *)(a1 + 32);

  return -[NRDevice _updateSelfRetain](v5);
}

- (uint64_t)_updateSelfRetain
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = (void *)[*(id *)(result + 40) count];
    if (v2) {
      uint64_t v2 = v1;
    }
    v1[1] = v2;
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_fireChangeNotificationsForDiff:(void *)a3 secureProperties:(int)a4 notify:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  if (a1)
  {
    char v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 24)];
    BOOL v7 = v6;
    if (!v6)
    {
LABEL_51:

      goto LABEL_52;
    }
    uint64_t v8 = [v6 diff];
    v9 = (void *)v8;
    if (a4 && v8)
    {
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke;
      v61[3] = &unk_1E5B01BF8;
      v61[4] = a1;
      +[NRMutableDevice parseDiff:v8 forPropertyChange:@"isActive" withBlock:v61];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_2;
      v60[3] = &unk_1E5B01BF8;
      v60[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"bluetoothPaired" withBlock:v60];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_3;
      v59[3] = &unk_1E5B01BF8;
      v59[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"isActive" withBlock:v59];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_4;
      v58[3] = &unk_1E5B01BF8;
      v58[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"remoteUnpairingStarted" withBlock:v58];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_5;
      v57[3] = &unk_1E5B01BF8;
      v57[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"isPaired" withBlock:v57];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_6;
      v56[3] = &unk_1E5B01BF8;
      v56[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"isSetup" withBlock:v56];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_7;
      v55[3] = &unk_1E5B01BF8;
      v55[4] = a1;
      +[NRMutableDevice parseDiff:v9 forPropertyChange:@"compatibilityState" withBlock:v55];
    }
    if ([v7 changeType] == 2)
    {
      id v10 = v9;
      if (a4)
      {
        id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isActive"];
        int v12 = [v11 isEqual:MEMORY[0x1E4F1CC38]];

        if (v12)
        {
          -[NRDevice postNotification:withUserInfo:](a1, @"NRPairedDeviceRegistryDeviceDidBecomeInactive");
          id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isPaired"];
          int v14 = [v13 isEqual:MEMORY[0x1E4F1CC38]];

          if (v14) {
            -[NRDevice postNotification:withUserInfo:](a1, @"NRPairedDeviceRegistryDeviceDidUnpairNotification");
          }
        }
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:v20];
            if (a4) {
              -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](a1, v20, v21);
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
        }
        while (v17);
      }

      if (!a4)
      {
LABEL_49:
        [*(id *)(a1 + 40) removeAllObjects];
LABEL_50:

        goto LABEL_51;
      }
      uint64_t v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isActive"];
      int v23 = [v22 BOOLValue];

      if (v23) {
        -[NRDevice postNotification:withUserInfo:](a1, @"NRPairedDeviceRegistryDeviceDidBecomeInactive");
      }
      uint64_t v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isPaired"];
      if ([v24 BOOLValue])
      {
      }
      else
      {
        v37 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"bluetoothPaired"];
        int v38 = [v37 BOOLValue];

        if (!v38) {
          goto LABEL_47;
        }
      }
      -[NRDevice postNotification:withUserInfo:](a1, @"NRPairedDeviceRegistryDeviceDidUnpairNotification");
LABEL_47:
      v39 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isArchived"];
      int v40 = [v39 BOOLValue];

      if (v40) {
        -[NRDevice postNotification:withUserInfo:](a1, @"NRPairedDeviceRegistryUnmigratedDeviceDidUnpairNotification");
      }
      goto LABEL_49;
    }
    id v41 = v9;
    BOOL v42 = v7;
    id v25 = [v7 diff];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (!v26) {
      goto LABEL_44;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v52;
    uint64_t v45 = a1;
LABEL_27:
    uint64_t v29 = 0;
    uint64_t v44 = v27;
    while (1)
    {
      if (*(void *)v52 != v28) {
        objc_enumerationMutation(v25);
      }
      id v30 = *(void **)(*((void *)&v51 + 1) + 8 * v29);
      v31 = [v25 objectForKeyedSubscript:v30];
      if ([v31 changeType] == 2)
      {
        uint64_t v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:v30];
        if (v32)
        {
          [*(id *)(a1 + 40) removeObjectForKey:v30];
          if (a4) {
            -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](a1, v30, v32);
          }
        }
        goto LABEL_42;
      }
      uint64_t v32 = [v31 diff];
      v33 = [v32 value];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v34 = [v43 objectForKeyedSubscript:v33];
      if (v34) {
        goto LABEL_38;
      }
LABEL_41:

      a1 = v45;
LABEL_42:

      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (!v27)
        {
LABEL_44:

          id v10 = v41;
          BOOL v7 = v42;
          goto LABEL_50;
        }
        goto LABEL_27;
      }
    }
    id v34 = v33;
LABEL_38:
    uint64_t v35 = v28;
    v36 = [*(id *)(v45 + 40) objectForKeyedSubscript:v30];
    [*(id *)(v45 + 40) setObject:v34 forKeyedSubscript:v30];
    if (a4) {
      -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](v45, v30, v36);
    }

    uint64_t v28 = v35;
    uint64_t v27 = v44;
    goto LABEL_41;
  }
LABEL_52:
}

- (BOOL)canMigrate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"119C9267-C24D-4FC3-8FE9-2D394943F2E6"];
  BOOL v4 = [(NRDevice *)self supportsCapability:v3];

  if (v4)
  {
    uint64_t v5 = [(NRDevice *)self valueForProperty:@"migrationKeyRevision"];
    char v6 = v5;
    if (v5 && [v5 integerValue])
    {
      BOOL v7 = [(NRDevice *)self valueForProperty:@"isPaired"];
      uint64_t v8 = v7;
      if (v7 && [v7 BOOLValue])
      {
        v9 = [(NRDevice *)self valueForProperty:@"MDMManagementState"];
        uint64_t v10 = [v9 unsignedIntegerValue];
        if (v9) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        BOOL v12 = v11;
        if (v11)
        {
          id v13 = &stru_1EF6CAD80;
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Managed by MDM (%lu)", v10);
          id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        BOOL v12 = 0;
        id v13 = @"Device not paired";
      }
    }
    else
    {
      BOOL v12 = 0;
      id v13 = @"Does not have migration key revision";
    }
  }
  else
  {
    BOOL v12 = 0;
    id v13 = @"Does not support migration capability";
  }
  int v14 = nr_framework_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    uint64_t v16 = nr_framework_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(NRDevice *)self valueForProperty:@"pairingID"];
      *(_DWORD *)buf = 136316162;
      v21 = "-[NRDevice(migration) canMigrate]";
      uint64_t v18 = " - ";
      __int16 v22 = 2112;
      __int16 v24 = 1024;
      int v23 = v17;
      if (v12) {
        uint64_t v18 = "";
      }
      BOOL v25 = v12;
      __int16 v26 = 2080;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl(&dword_1A356E000, v16, OS_LOG_TYPE_DEFAULT, "%s: %@ %{BOOL}d%s%@", buf, 0x30u);
    }
  }

  return v12;
}

- (BOOL)archived
{
  uint64_t v2 = [(NRDevice *)self valueForProperty:@"isArchived"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)migrationError
{
  if ([(NRDevice *)self archived])
  {
    char v3 = [(NRDevice *)self valueForProperty:@"lastPairingError"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)migrationConfirmed
{
  uint64_t v2 = [(NRDevice *)self valueForProperty:@"migrationConsent"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NRDevice)init
{
}

uint64_t __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  -[NRDevice _fireChangeNotificationsForDiff:secureProperties:notify:](*(void *)(a1 + 32), a2, a4, 1);
  uint64_t v5 = *(void *)(a1 + 32);

  return -[NRDevice _updateSelfRetain](v5);
}

void __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = a3;
  if (v4)
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:*(void *)(v4 + 24)];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          BOOL v11 = [v5 objectForKeyedSubscript:v10];
          BOOL v12 = [v11 value];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [v15 objectForKeyedSubscript:v12];
            if (v13)
            {
              int v14 = [*(id *)(v4 + 40) objectForKeyedSubscript:v10];

              if (!v14)
              {
                [*(id *)(v4 + 40) setObject:v13 forKeyedSubscript:v10];
                -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](v4, v10, 0);
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

- (void)_queueFirePropertyObserversForProperty:(void *)a3 fromValue:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 56) objectForKey:v5];
  uint64_t v8 = [v7 allObjects];
  v9 = [*(id *)(a1 + 64) allObjects];
  uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

  BOOL v11 = [*(id *)(a1 + 72) objectForKey:v5];
  BOOL v12 = [v11 arrayByAddingObjectsFromArray:*(void *)(a1 + 80)];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NRDevice__queueFirePropertyObserversForProperty_fromValue___block_invoke;
  block[3] = &unk_1E5B01C20;
  id v18 = v10;
  uint64_t v19 = a1;
  id v13 = v5;
  id v20 = v13;
  id v14 = v6;
  id v21 = v14;
  id v22 = v12;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)invalidate
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__NRDevice_invalidate__block_invoke;
  v5[3] = &unk_1E5B00230;
  v5[4] = self;
  p_lock = &self->_lock;
  char v3 = self;
  os_unfair_lock_lock_with_options();
  __22__NRDevice_invalidate__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  me = v3->_me;
  v3->_me = 0;
}

uint64_t __22__NRDevice_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v2 removeAllObjects];
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"NRDevice[%p]: ", self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(NRDevice *)self propertyNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1A624A5B0]();
        BOOL v11 = [(NRDevice *)self objectForKeyedSubscript:v9];
        [v3 appendFormat:@"%@=\"%@\" ", v9, v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)addPropertyObserver:(id)a3 forPropertyChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke;
  v12[3] = &unk_1E5B00280;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  p_lock = &self->_lock;
  uint64_t v9 = self;
  id v10 = v7;
  id v11 = v6;
  os_unfair_lock_lock_with_options();
  __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);
}

void __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = v4;
  if (v1)
  {
    if (v4)
    {
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v28;
        obuint64_t j = v5;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v11 = [*(id *)(v1 + 56) objectForKey:v10];
            if (v11)
            {
              long long v25 = 0u;
              long long v26 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              id v12 = v11;
              uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:&v31 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v24;
                while (2)
                {
                  for (uint64_t j = 0; j != v14; ++j)
                  {
                    if (*(void *)v24 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    if (*(id *)(*((void *)&v23 + 1) + 8 * j) == v3)
                    {

                      goto LABEL_21;
                    }
                  }
                  uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:&v31 count:16];
                  if (v14) {
                    continue;
                  }
                  break;
                }
              }
            }
            else
            {
              id v12 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
            }
            [v12 addPointer:v3];
            [*(id *)(v1 + 56) setObject:v12 forKey:v10];
LABEL_21:
          }
          uint64_t v5 = obj;
          uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v7);
      }
    }
    else
    {
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      id v17 = *(id *)(v1 + 64);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        while (2)
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            if (*(id *)(*((void *)&v31 + 1) + 8 * k) == v3)
            {

              goto LABEL_34;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      [*(id *)(v1 + 64) addPointer:v3];
    }
  }
LABEL_34:
}

- (void)removePropertyObserver:(id)a3 forPropertyChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke;
  v12[3] = &unk_1E5B00280;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  p_locuint64_t k = &self->_lock;
  uint64_t v9 = self;
  id v10 = v7;
  id v11 = v6;
  os_unfair_lock_lock_with_options();
  __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);
}

void __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  obuint64_t j = v2;
  uint64_t v37 = v1;
  if (v1)
  {
    if (obj)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v4 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v51 != v6) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = [*(id *)(v37 + 56) objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v9 = v8;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = 0;
              uint64_t v13 = *(void *)v47;
              while (2)
              {
                uint64_t v14 = 0;
                uint64_t v15 = v11 + v12;
                do
                {
                  if (*(void *)v47 != v13) {
                    objc_enumerationMutation(v9);
                  }
                  if (*(id *)(*((void *)&v46 + 1) + 8 * v14) == v3)
                  {

                    if (v12 + v14 != 0x7FFFFFFFFFFFFFFFLL) {
                      objc_msgSend(v9, "removePointerAtIndex:");
                    }
                    goto LABEL_19;
                  }
                  ++v14;
                }
                while (v11 != v14);
                uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
                uint64_t v12 = v15;
                if (v11) {
                  continue;
                }
                break;
              }
            }

LABEL_19:
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v5);
      }
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v35 = [*(id *)(v1 + 56) allKeys];
      uint64_t v16 = [v35 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v35);
            }
            uint64_t v20 = [*(id *)(v37 + 56) objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * j)];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v21 = v20;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v54 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = 0;
              uint64_t v25 = *(void *)v43;
              while (2)
              {
                uint64_t v26 = 0;
                uint64_t v27 = v23 + v24;
                do
                {
                  if (*(void *)v43 != v25) {
                    objc_enumerationMutation(v21);
                  }
                  if (*(id *)(*((void *)&v42 + 1) + 8 * v26) == v3)
                  {

                    if (v24 + v26 != 0x7FFFFFFFFFFFFFFFLL) {
                      objc_msgSend(v21, "removePointerAtIndex:");
                    }
                    goto LABEL_38;
                  }
                  ++v26;
                }
                while (v23 != v26);
                uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v54 count:16];
                uint64_t v24 = v27;
                if (v23) {
                  continue;
                }
                break;
              }
            }

LABEL_38:
          }
          uint64_t v17 = [v35 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v17);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v28 = *(id *)(v37 + 64);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:&v50 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v39;
        while (2)
        {
          uint64_t v33 = 0;
          uint64_t v34 = v30 + v31;
          do
          {
            if (*(void *)v39 != v32) {
              objc_enumerationMutation(v28);
            }
            if (*(id *)(*((void *)&v38 + 1) + 8 * v33) == v3)
            {

              if (v31 + v33 != 0x7FFFFFFFFFFFFFFFLL) {
                objc_msgSend(*(id *)(v37 + 64), "removePointerAtIndex:");
              }
              goto LABEL_51;
            }
            ++v33;
          }
          while (v30 != v33);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:&v50 count:16];
          uint64_t v31 = v34;
          if (v30) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_51:
}

void __29__NRDevice_valueForProperty___block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:*(void *)(a1[4] + 24)];
  uint64_t v6 = [v5 objectForKeyedSubscript:a1[5]];
  id v7 = [v6 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v13 objectForKeyedSubscript:v7];
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = v7;
    uint64_t v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 BOOLValue] & 1) == 0) {
    -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceDidBecomeInactive");
  }
}

- (void)postNotification:(uint64_t)a1 withUserInfo:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)[0 mutableCopy];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v4 setObject:a1 forKeyedSubscript:@"device"];
    [v4 setObject:*(void *)(a1 + 24) forKeyedSubscript:@"pairingID"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__NRDevice_postNotification_withUserInfo___block_invoke;
    block[3] = &unk_1E5B00280;
    id v7 = v3;
    uint64_t v8 = a1;
    id v9 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    int v4 = [v6 BOOLValue];
    id v5 = NRPairedDeviceRegistryDeviceDidBeginPairingNotification;
    if (!v4) {
      id v5 = NRPairedDeviceRegistryDeviceDidReceiveBTPairingRequestNotification;
    }
    -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), *v5);
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 BOOLValue]) {
    -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceDidBecomeActive");
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 BOOLValue]) {
    -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification");
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    char v5 = [v4 BOOLValue];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      -[NRDevice postNotification:withUserInfo:](v6, @"NRPairedDeviceRegistryDeviceDidPairNotification");
    }
    else
    {
      id v7 = [*(id *)(v6 + 40) objectForKeyedSubscript:@"lastPairingError"];
      if (!v7) {
        -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceDidUnpairNotification");
      }
    }
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 BOOLValue]) {
    -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceIsSetupNotification");
  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    if ([v6 integerValue] == 3)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"isPaired"];
      char v5 = [v4 BOOLValue];

      if ((v5 & 1) == 0) {
        -[NRDevice postNotification:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceDidBeginActivation");
      }
    }
  }
}

void __42__NRDevice_postNotification_withUserInfo___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:*(void *)(a1[5] + 32) userInfo:a1[6]];
}

void __61__NRDevice__queueFirePropertyObserversForProperty_fromValue___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) device:*(void *)(a1 + 40) propertyDidChange:*(void *)(a1 + 48) fromValue:*(void *)(a1 + 56)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (NRDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NRDevice;
  uint64_t v5 = [(NRDevice *)&v19 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v5->_observers;
    v5->_observers = v6;

    uint64_t v8 = NRClassesForPropertiesWithArray(0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"properties"];
    uint64_t v10 = [v9 mutableCopy];
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    promiscuousObservers = v5->_promiscuousObservers;
    v5->_promiscuousObservers = (NSPointerArray *)v12;

    long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    changeBlocks = v5->_changeBlocks;
    v5->_changeBlocks = v14;

    long long v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    promiscuousChangeBlocks = v5->_promiscuousChangeBlocks;
    v5->_promiscuousChangeBlocks = v16;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)propertyNames
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__8;
  objc_super v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  registry = self->_registry;
  if (registry)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __25__NRDevice_propertyNames__block_invoke;
    v14[3] = &unk_1E5B01410;
    v14[4] = self;
    v14[5] = &v15;
    [(NRRegistry *)registry deasyncGrabRegistryWithReadBlock:v14];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    uint64_t v10 = __25__NRDevice_propertyNames__block_invoke_2;
    uint64_t v11 = &unk_1E5B00C68;
    uint64_t v12 = self;
    long long v13 = &v15;
    p_locuint64_t k = &self->_lock;
    uint64_t v5 = v9;
    uint64_t v6 = self;
    os_unfair_lock_lock_with_options();
    v10((uint64_t)v5);

    os_unfair_lock_unlock(p_lock);
  }
  id v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __25__NRDevice_propertyNames__block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = [v7 allPropertyNames];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __25__NRDevice_propertyNames__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerForPropertyChanges:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke;
  v12[3] = &unk_1E5B00830;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  p_locuint64_t k = &self->_lock;
  uint64_t v9 = self;
  id v10 = v7;
  id v11 = v6;
  os_unfair_lock_lock_with_options();
  __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);
}

void __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    if (v3)
    {
      long long v30 = 0uLL;
      long long v31 = 0uLL;
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v29;
        obuint64_t j = v3;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            id v10 = [*(id *)(v1 + 72) objectForKey:v9];
            if (v10)
            {
              long long v26 = 0u;
              long long v27 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              id v11 = v10;
              uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:&v32 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v25;
                while (2)
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v25 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    if (*(id *)(*((void *)&v24 + 1) + 8 * j) == v4)
                    {

                      goto LABEL_21;
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:&v32 count:16];
                  if (v13) {
                    continue;
                  }
                  break;
                }
              }
            }
            else
            {
              id v11 = (id)objc_opt_new();
            }
            long long v16 = (void *)MEMORY[0x1A624A7E0](v4);
            [v11 addObject:v16];

            [*(id *)(v1 + 72) setObject:v11 forKey:v9];
LABEL_21:
          }
          id v3 = obj;
          uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v6);
      }
    }
    else
    {
      long long v34 = 0uLL;
      long long v35 = 0uLL;
      long long v32 = 0uLL;
      long long v33 = 0uLL;
      id v17 = *(id *)(v1 + 80);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
LABEL_26:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          if (*(id *)(*((void *)&v32 + 1) + 8 * v21) == v4) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v19) {
              goto LABEL_26;
            }
            goto LABEL_32;
          }
        }
      }
      else
      {
LABEL_32:

        uint64_t v22 = *(void **)(v1 + 80);
        id v17 = (id)MEMORY[0x1A624A7E0](v4);
        [v22 addObject:v17];
      }
    }
  }
}

- (void)unregisterForPropertyChanges:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke;
  v12[3] = &unk_1E5B00830;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  p_locuint64_t k = &self->_lock;
  uint64_t v9 = self;
  id v10 = v7;
  id v11 = v6;
  os_unfair_lock_lock_with_options();
  __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);
}

void __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    if (v3)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v10 = *(void **)(v1 + 72);
            if (v4)
            {
              id v11 = [v10 objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              uint64_t v12 = (void *)MEMORY[0x1A624A7E0](v4);
              [v11 removeObject:v12];

              if (![v11 count]) {
                [*(id *)(v1 + 72) removeObjectForKey:v9];
              }
            }
            else
            {
              [v10 removeObjectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            }
          }
          uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v6);
      }
    }
    else
    {
      id v13 = *(void **)(v1 + 72);
      if (v4)
      {
        id v14 = [v13 allKeys];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              uint64_t v20 = [*(id *)(v1 + 72) objectForKey:v19];
              uint64_t v21 = (void *)MEMORY[0x1A624A7E0](v4);
              [v20 removeObject:v21];

              if (![v20 count]) {
                [*(id *)(v1 + 72) removeObjectForKey:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v16);
        }
        uint64_t v22 = *(void **)(v1 + 80);
        uint64_t v23 = (void *)MEMORY[0x1A624A7E0](v4);
        [v22 removeObject:v23];
      }
      else
      {
        [v13 removeAllObjects];
        [*(id *)(v1 + 80) removeAllObjects];
      }
    }
  }
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

@end