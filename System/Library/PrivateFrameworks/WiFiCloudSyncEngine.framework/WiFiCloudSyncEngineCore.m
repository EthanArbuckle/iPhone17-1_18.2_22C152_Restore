@interface WiFiCloudSyncEngineCore
- (BOOL)iCloudSyncingEnabled;
- (BOOL)isKVSEncrypted;
- (NSThread)clientThread;
- (NSUbiquitousKeyValueStore)keyValueStore;
- (OS_dispatch_queue)clientQueue;
- (WiFiCloudSyncEngineCore)initWithEncryptedKVS:(BOOL)a3;
- (id)readCompleteKVStore;
- (void)addToKVStore:(id)a3 synchronize:(BOOL)a4;
- (void)callback;
- (void)clearKVS;
- (void)context;
- (void)dealloc;
- (void)dispatchUbiquitousKeyValueStoreDidChangeOnBackground:(id)a3;
- (void)enableIcloudSyncing:(BOOL)a3 ForBundleId:(id)a4;
- (void)printCompleteKVStore;
- (void)pruneKVSStore;
- (void)queryKeychainSyncState;
- (void)readStoreValueForKey:(id)a3;
- (void)registerCallback:(void *)a3 context:(void *)a4;
- (void)registerCallback:(void *)a3 queue:(id)a4 context:(void *)a5;
- (void)relayCloudCleanUpEvent;
- (void)relayCloudEvent:(id)a3;
- (void)relayKeychainSyncState:(id)a3;
- (void)relayMergeNetworks:(id)a3;
- (void)relayPruneKVSStore:(id)a3;
- (void)relayReadStoreValueAction:(id)a3;
- (void)removeFromKVStore:(id)a3;
- (void)setCallback:(void *)a3;
- (void)setClientQueue:(id)a3;
- (void)setClientThread:(id)a3;
- (void)setContext:(void *)a3;
- (void)setICloudSyncingEnabled:(BOOL)a3;
- (void)setIsKVSEncrypted:(BOOL)a3;
- (void)setKeyValueStore:(id)a3;
- (void)subscribeKVStoreNotficationsForBundleId:(id)a3;
- (void)synchronizeAndCallMergeNetworks;
- (void)synchronizeKVS;
- (void)ubiquitousKeyValueStoreDidChange:(id)a3;
- (void)unSubscribeKVStoreNotfications;
@end

@implementation WiFiCloudSyncEngineCore

- (WiFiCloudSyncEngineCore)initWithEncryptedKVS:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WiFiCloudSyncEngineCore;
  v4 = [(WiFiCloudSyncEngineCore *)&v7 init];
  v5 = v4;
  if (v4) {
    [(WiFiCloudSyncEngineCore *)v4 setIsKVSEncrypted:v3];
  }
  return v5;
}

- (void)registerCallback:(void *)a3 context:(void *)a4
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

- (void)registerCallback:(void *)a3 queue:(id)a4 context:(void *)a5
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

- (void)dealloc
{
  [(WiFiCloudSyncEngineCore *)self unSubscribeKVStoreNotfications];
  v3.receiver = self;
  v3.super_class = (Class)WiFiCloudSyncEngineCore;
  [(WiFiCloudSyncEngineCore *)&v3 dealloc];
}

- (void)synchronizeKVS
{
  BOOL v2 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] synchronize];
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v3) {
      return;
    }
  }
  else if (!v3)
  {
    return;
  }
  _os_log_send_and_compose_impl();
}

- (void)addToKVStore:(id)a3 synchronize:(BOOL)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 139;
    goto LABEL_51;
  }
  BOOL v4 = a4;
  if (![(WiFiCloudSyncEngineCore *)self iCloudSyncingEnabled])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 141;
    goto LABEL_51;
  }
  objc_super v7 = (void *)[a3 allKeys];
  if (!v7 || (v8 = v7, ![v7 count]))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 145;
    goto LABEL_51;
  }
  v9 = (void *)[v8 objectAtIndex:0];
  uint64_t v10 = [a3 objectForKey:v9];
  if (!v9 || (v11 = (void *)v10) == 0)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 150;
    goto LABEL_51;
  }
  unint64_t v12 = [v9 lengthOfBytesUsingEncoding:4];
  uint64_t v13 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] maximumKeyLength];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v58 = 136316418;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 155;
    __int16 v64 = 2112;
    v65 = v9;
    __int16 v66 = 2048;
    unint64_t v67 = v12;
    __int16 v68 = 2048;
    uint64_t v69 = v13;
    LODWORD(v47) = 58;
    v45 = &v58;
    _os_log_send_and_compose_impl();
  }
  if (v12 >= v13 + 1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 157;
    goto LABEL_51;
  }
  id v14 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] objectForKey:v9];
  if (!v14 || (v15 = v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] setObject:v11 forKey:v9];
    if (!v4) {
      return;
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke_62;
    block[3] = &unk_26454D158;
    block[4] = self;
    v43 = block;
    goto LABEL_44;
  }
  id v16 = (id)[v15 mutableCopy];
  if (![(WiFiCloudSyncEngineCore *)self isKVSEncrypted])
  {
    [v16 addEntriesFromDictionary:v11];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"WEP"), @"WEP");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"WPA_IE"), @"WPA_IE");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"RSN_IE"), @"RSN_IE");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"WPA3_RSN_IE"), @"WPA3_RSN_IE");
    uint64_t v44 = [v15 objectForKeyedSubscript:@"addedByVersion"];
    if (v44) {
      [v16 setObject:v44 forKeyedSubscript:@"addedByVersion"];
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, @"BSSID", v45, v47);
    if (([v16 isEqualToDictionary:v15] & 1) != 0
      || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      return;
    }
    int v58 = 136316418;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    __int16 v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    __int16 v62 = 1024;
    int v63 = 288;
    __int16 v64 = 2112;
    v65 = v9;
    __int16 v66 = 2112;
    unint64_t v67 = (unint64_t)v15;
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v16;
LABEL_51:
    _os_log_send_and_compose_impl();
    return;
  }
  BOOL v55 = v4;
  uint64_t v17 = [v15 objectForKeyedSubscript:@"addedAt"];
  uint64_t v50 = [v15 objectForKeyedSubscript:@"lastJoinedByUserAt"];
  uint64_t v52 = [v15 objectForKeyedSubscript:@"lastJoinedBySystemAtWeek"];
  uint64_t v54 = [v15 objectForKeyedSubscript:@"removedAt"];
  uint64_t v53 = [v15 objectForKeyedSubscript:@"was6GHzOnlyAtWeek"];
  uint64_t v18 = [v11 objectForKeyedSubscript:@"addedAt"];
  uint64_t v19 = [v11 objectForKeyedSubscript:@"lastJoinedByUserAt"];
  uint64_t v49 = [v11 objectForKeyedSubscript:@"lastJoinedBySystemAtWeek"];
  uint64_t v51 = [v11 objectForKeyedSubscript:@"removedAt"];
  uint64_t v20 = [v11 objectForKeyedSubscript:@"was6GHzOnlyAtWeek"];
  [v16 addEntriesFromDictionary:v11];
  if (v17 | v18)
  {
    v21 = (void *)MEMORY[0x263EFF910];
    [(id)v17 timeIntervalSinceReferenceDate];
    double v23 = v22;
    [(id)v18 timeIntervalSinceReferenceDate];
    if (v23 >= v24) {
      double v24 = v23;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:", v24, v45, v47), @"addedAt");
  }
  if (v50 | v19)
  {
    v25 = (void *)MEMORY[0x263EFF910];
    [(id)v50 timeIntervalSinceReferenceDate];
    double v27 = v26;
    [(id)v19 timeIntervalSinceReferenceDate];
    if (v27 >= v28) {
      double v28 = v27;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:", v28, v45, v47), @"lastJoinedByUserAt");
  }
  if (v52 | v49)
  {
    v29 = NSNumber;
    unint64_t v30 = [(id)v52 unsignedIntegerValue];
    unint64_t v31 = [(id)v49 unsignedIntegerValue];
    if (v30 <= v31) {
      unint64_t v32 = v31;
    }
    else {
      unint64_t v32 = v30;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithUnsignedInteger:", v32, v45, v47), @"lastJoinedBySystemAtWeek");
  }
  if (v53 | v20)
  {
    v33 = NSNumber;
    unint64_t v34 = [(id)v53 unsignedIntegerValue];
    unint64_t v35 = [(id)v20 unsignedIntegerValue];
    if (v34 <= v35) {
      unint64_t v36 = v35;
    }
    else {
      unint64_t v36 = v34;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v33, "numberWithUnsignedInteger:", v36, v45, v47), @"was6GHzOnlyAtWeek");
  }
  if (v54 | v51)
  {
    v37 = (void *)MEMORY[0x263EFF910];
    [(id)v54 timeIntervalSinceReferenceDate];
    double v39 = v38;
    [(id)v51 timeIntervalSinceReferenceDate];
    if (v39 >= v40) {
      double v40 = v39;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:", v40, v45, v47), @"removedAt");
  }
  uint64_t v41 = objc_msgSend(v15, "objectForKeyedSubscript:", @"addedByVersion", v45, v47);
  if (v41) {
    [v16 setObject:v41 forKeyedSubscript:@"addedByVersion"];
  }
  [v16 setObject:0 forKeyedSubscript:@"BSSID"];
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isWEP"), @"isWEP");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isWAPI"), @"isWAPI");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isWPA"), @"isWPA");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isWPA2"), @"isWPA2");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isWPA3"), @"isWPA3");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isOpen"), @"isOpen");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isPSK"), @"isPSK");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"isEAP"), @"isEAP");
  if (([v16 isEqualToDictionary:v15] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v58 = 136316418;
      v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
      __int16 v60 = 2080;
      v61 = "WiFiCloudSyncEngineCore.m";
      __int16 v62 = 1024;
      int v63 = 236;
      __int16 v64 = 2112;
      v65 = v9;
      __int16 v66 = 2112;
      unint64_t v67 = (unint64_t)v15;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v16;
      LODWORD(v48) = 58;
      v46 = &v58;
      _os_log_send_and_compose_impl();
    }
    [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] setObject:v16 forKey:v9];
    if (v55)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke;
      v57[3] = &unk_26454D158;
      v57[4] = self;
      v43 = v57;
LABEL_44:
      dispatch_async(global_queue, v43);
    }
  }
}

uint64_t __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

uint64_t __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

- (void)removeFromKVStore:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v11 = 136315650;
    unint64_t v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    __int16 v13 = 2080;
    id v14 = "WiFiCloudSyncEngineCore.m";
    __int16 v15 = 1024;
    int v16 = 313;
    goto LABEL_11;
  }
  BOOL v5 = [(WiFiCloudSyncEngineCore *)self iCloudSyncingEnabled];
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v6) {
      return;
    }
    int v11 = 136315650;
    unint64_t v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    __int16 v13 = 2080;
    id v14 = "WiFiCloudSyncEngineCore.m";
    __int16 v15 = 1024;
    int v16 = 315;
LABEL_11:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v6)
  {
    int v11 = 136315906;
    unint64_t v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    __int16 v13 = 2080;
    id v14 = "WiFiCloudSyncEngineCore.m";
    __int16 v15 = 1024;
    int v16 = 317;
    __int16 v17 = 2112;
    id v18 = a3;
    LODWORD(v9) = 38;
    v8 = &v11;
    _os_log_send_and_compose_impl();
  }
  [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] removeObjectForKey:a3];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WiFiCloudSyncEngineCore_removeFromKVStore___block_invoke;
  block[3] = &unk_26454D158;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __45__WiFiCloudSyncEngineCore_removeFromKVStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

- (void)readStoreValueForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!a3)
  {
    if (!v5) {
      return;
    }
    int v13 = 136315650;
    id v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    __int16 v15 = 2080;
    int v16 = "WiFiCloudSyncEngineCore.m";
    __int16 v17 = 1024;
    int v18 = 334;
LABEL_20:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v5)
  {
    int v13 = 136315906;
    id v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    __int16 v15 = 2080;
    int v16 = "WiFiCloudSyncEngineCore.m";
    __int16 v17 = 1024;
    int v18 = 336;
    __int16 v19 = 2112;
    id v20 = a3;
    LODWORD(v10) = 38;
    uint64_t v9 = &v13;
    _os_log_send_and_compose_impl();
  }
  id v6 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] objectForKey:a3];
  if (![(WiFiCloudSyncEngineCore *)self clientThread]
    && ![(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v13 = 136315650;
    id v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    __int16 v15 = 2080;
    int v16 = "WiFiCloudSyncEngineCore.m";
    __int16 v17 = 1024;
    int v18 = 342;
    goto LABEL_20;
  }
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
      [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayReadStoreValueAction_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:v6 waitUntilDone:1];
    }
    if ([(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      objc_super v7 = [(WiFiCloudSyncEngineCore *)self clientQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke;
      v12[3] = &unk_26454D180;
      v12[4] = self;
      v12[5] = v6;
      v8 = v12;
LABEL_16:
      dispatch_sync((dispatch_queue_t)v7, v8);
    }
  }
  else
  {
    if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
      [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayReadStoreValueAction_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:a3 waitUntilDone:1];
    }
    if ([(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      objc_super v7 = [(WiFiCloudSyncEngineCore *)self clientQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke_2;
      block[3] = &unk_26454D180;
      block[4] = self;
      void block[5] = a3;
      v8 = block;
      goto LABEL_16;
    }
  }
}

uint64_t __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayReadStoreValueAction:*(void *)(a1 + 40)];
}

uint64_t __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayReadStoreValueAction:*(void *)(a1 + 40)];
}

- (void)relayReadStoreValueAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    int v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    __int16 v17 = 2080;
    int v18 = "WiFiCloudSyncEngineCore.m";
    __int16 v19 = 1024;
    int v20 = 373;
    LODWORD(v12) = 28;
    int v11 = &v15;
    _os_log_send_and_compose_impl();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([(WiFiCloudSyncEngineCore *)self isKVSEncrypted]) {
      return;
    }
    int v13 = @"SSID_STR";
    id v14 = a3;
    a3 = (id)[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v15 = 136315650;
    int v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    __int16 v17 = 2080;
    int v18 = "WiFiCloudSyncEngineCore.m";
    __int16 v19 = 1024;
    int v20 = 399;
    LODWORD(v12) = 28;
    int v11 = &v15;
    goto LABEL_11;
  }
  BOOL v5 = (void *)[a3 objectForKeyedSubscript:@"removedAt"];
  uint64_t v6 = [a3 objectForKeyedSubscript:@"addedAt"];
  if (v5)
  {
    objc_super v7 = (void *)v6;
    [v5 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [v7 timeIntervalSinceReferenceDate];
    if (v9 > v10)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList((uint64_t)[(WiFiCloudSyncEngineCore *)self context], self, a3);
        return;
      }
      int v15 = 136315650;
      int v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
      __int16 v17 = 2080;
      int v18 = "WiFiCloudSyncEngineCore.m";
      __int16 v19 = 1024;
      int v20 = 383;
      LODWORD(v12) = 28;
      int v11 = &v15;
LABEL_11:
      _os_log_send_and_compose_impl();
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    int v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    __int16 v17 = 2080;
    int v18 = "WiFiCloudSyncEngineCore.m";
    __int16 v19 = 1024;
    int v20 = 389;
    LODWORD(v12) = 28;
    int v11 = &v15;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineAddNetworkToKnownNetworksList((uint64_t)[(WiFiCloudSyncEngineCore *)self context], self, a3);
}

- (id)readCompleteKVStore
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    objc_super v7 = "-[WiFiCloudSyncEngineCore readCompleteKVStore]";
    __int16 v8 = 2080;
    double v9 = "WiFiCloudSyncEngineCore.m";
    __int16 v10 = 1024;
    int v11 = 408;
    LODWORD(v5) = 28;
    BOOL v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  return [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] dictionaryRepresentation];
}

- (void)printCompleteKVStore
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] synchronize];
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_DWORD *)__int16 v8 = 136315650;
    *(void *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(void *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)double v9 = 419;
    LODWORD(v7) = 28;
    int v6 = v8;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_DWORD *)__int16 v8 = 136315650;
    *(void *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(void *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)double v9 = 422;
    LODWORD(v7) = 28;
    int v6 = v8;
  }
  _os_log_send_and_compose_impl();
LABEL_7:
  uint64_t v5 = [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] dictionaryRepresentation];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v8 = 136315906;
    *(void *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(void *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)double v9 = 426;
    *(_WORD *)&v9[4] = 2112;
    *(void *)&v9[6] = v5;
    _os_log_send_and_compose_impl();
  }
}

- (void)clearKVS
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [(WiFiCloudSyncEngineCore *)self isKVSEncrypted];
    BOOL v4 = "";
    int v20 = "-[WiFiCloudSyncEngineCore clearKVS]";
    double v22 = "WiFiCloudSyncEngineCore.m";
    __int16 v23 = 1024;
    int v19 = 136315906;
    int v24 = 434;
    __int16 v21 = 2080;
    if (v3) {
      BOOL v4 = "Encrypted ";
    }
    __int16 v25 = 2080;
    double v26 = v4;
    LODWORD(v12) = 38;
    int v11 = &v19;
    _os_log_send_and_compose_impl();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(-[WiFiCloudSyncEngineCore readCompleteKVStore](self, "readCompleteKVStore", v11, v12), "allKeys");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] removeObjectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WiFiCloudSyncEngineCore_clearKVS__block_invoke;
  block[3] = &unk_26454D158;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __35__WiFiCloudSyncEngineCore_clearKVS__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

- (void)dispatchUbiquitousKeyValueStoreDidChangeOnBackground:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WiFiCloudSyncEngineCore *)self clientThread]
    || [(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    if ([(WiFiCloudSyncEngineCore *)self clientThread]
      && (uint64_t v5 = (NSThread *)[MEMORY[0x263F08B88] currentThread],
          v5 == [(WiFiCloudSyncEngineCore *)self clientThread]))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = "-[WiFiCloudSyncEngineCore dispatchUbiquitousKeyValueStoreDidChangeOnBackground:]";
        __int16 v13 = 2080;
        long long v14 = "WiFiCloudSyncEngineCore.m";
        __int16 v15 = 1024;
        int v16 = 460;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke;
      v10[3] = &unk_26454D180;
      v10[4] = self;
      v10[5] = a3;
      uint64_t v8 = v10;
    }
    else
    {
      if (![(WiFiCloudSyncEngineCore *)self clientQueue]
        || (current_queue = (OS_dispatch_queue *)dispatch_get_current_queue(),
            current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue]))
      {
        [(WiFiCloudSyncEngineCore *)self ubiquitousKeyValueStoreDidChange:a3];
        return;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = "-[WiFiCloudSyncEngineCore dispatchUbiquitousKeyValueStoreDidChangeOnBackground:]";
        __int16 v13 = 2080;
        long long v14 = "WiFiCloudSyncEngineCore.m";
        __int16 v15 = 1024;
        int v16 = 468;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke_70;
      block[3] = &unk_26454D180;
      block[4] = self;
      void block[5] = a3;
      uint64_t v8 = block;
    }
    dispatch_async(global_queue, v8);
    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) ubiquitousKeyValueStoreDidChange:*(void *)(a1 + 40)];
}

uint64_t __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke_70(uint64_t a1)
{
  return [*(id *)(a1 + 32) ubiquitousKeyValueStoreDidChange:*(void *)(a1 + 40)];
}

- (void)ubiquitousKeyValueStoreDidChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v4 = (void *)[a3 userInfo];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x263F085D8]), "intValue");
  uint64_t v6 = (void *)[v4 objectForKey:*MEMORY[0x263F085E0]];
  if ([(WiFiCloudSyncEngineCore *)self clientThread]
    || [(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    if ([v6 indexOfObject:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"] == 0x7FFFFFFFFFFFFFFFLL
      || ![(NSUbiquitousKeyValueStore *)[(WiFiCloudSyncEngineCore *)self keyValueStore] objectForKey:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"])
    {
      goto LABEL_12;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316162;
      int v16 = "-[WiFiCloudSyncEngineCore ubiquitousKeyValueStoreDidChange:]";
      __int16 v17 = 2080;
      int v18 = "WiFiCloudSyncEngineCore.m";
      __int16 v19 = 1024;
      int v20 = 496;
      __int16 v21 = 1024;
      int v22 = v5;
      __int16 v23 = 2112;
      int v24 = v6;
      LODWORD(v12) = 44;
      int v11 = &v15;
      _os_log_send_and_compose_impl();
    }
    if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
      [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayCloudCleanUpEvent onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:0 waitUntilDone:0];
    }
    if ([(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      uint64_t v7 = [(WiFiCloudSyncEngineCore *)self clientQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke;
      block[3] = &unk_26454D158;
      block[4] = self;
      dispatch_async((dispatch_queue_t)v7, block);
    }
    if (v5 >= 2)
    {
LABEL_12:
      id v8 = objc_alloc(NSDictionary);
      id v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v5), @"reason", v6, @"changedKeys", 0);
      if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
        [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayCloudEvent_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:v9 waitUntilDone:0];
      }
      if ([(WiFiCloudSyncEngineCore *)self clientQueue])
      {
        uint64_t v10 = [(WiFiCloudSyncEngineCore *)self clientQueue];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke_2;
        v13[3] = &unk_26454D180;
        v13[4] = self;
        v13[5] = v9;
        dispatch_async((dispatch_queue_t)v10, v13);
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayCloudCleanUpEvent];
}

uint64_t __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayCloudEvent:*(void *)(a1 + 40)];
}

- (void)enableIcloudSyncing:(BOOL)a3 ForBundleId:(id)a4
{
  BOOL v5 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
  if (v5)
  {
    [(WiFiCloudSyncEngineCore *)self subscribeKVStoreNotficationsForBundleId:a4];
    [(WiFiCloudSyncEngineCore *)self setICloudSyncingEnabled:1];
  }
  else
  {
    [(WiFiCloudSyncEngineCore *)self unSubscribeKVStoreNotfications];
  }
}

- (void)subscribeKVStoreNotficationsForBundleId:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v5 = [(WiFiCloudSyncEngineCore *)self isKVSEncrypted];
  id v6 = objc_alloc(MEMORY[0x263F08C40]);
  if (v5)
  {
    self->keyValueStore = (NSUbiquitousKeyValueStore *)[v6 _initWithStoreIdentifier:@"com.apple.wifi.syncable-networks" usingEndToEndEncryption:1];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      int v11 = "-[WiFiCloudSyncEngineCore subscribeKVStoreNotficationsForBundleId:]";
      __int16 v12 = 2080;
      __int16 v13 = "WiFiCloudSyncEngineCore.m";
      __int16 v14 = 1024;
      int v15 = 546;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = @"com.apple.wifi.syncable-networks";
LABEL_6:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    self->keyValueStore = (NSUbiquitousKeyValueStore *)[v6 initWithBundleIdentifier:a3];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      int v11 = "-[WiFiCloudSyncEngineCore subscribeKVStoreNotficationsForBundleId:]";
      __int16 v12 = 2080;
      __int16 v13 = "WiFiCloudSyncEngineCore.m";
      __int16 v14 = 1024;
      int v15 = 556;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = @"com.apple.wifid.known-networks";
      goto LABEL_6;
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WiFiCloudSyncEngineCore_subscribeKVStoreNotficationsForBundleId___block_invoke;
  block[3] = &unk_26454D158;
  block[4] = self;
  dispatch_async(global_queue, block);
  id v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_dispatchUbiquitousKeyValueStoreDidChangeOnBackground_, *MEMORY[0x263F085E8], -[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"));
}

uint64_t __67__WiFiCloudSyncEngineCore_subscribeKVStoreNotficationsForBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

- (void)unSubscribeKVStoreNotfications
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[WiFiCloudSyncEngineCore unSubscribeKVStoreNotfications]";
    __int16 v7 = 2080;
    id v8 = "WiFiCloudSyncEngineCore.m";
    __int16 v9 = 1024;
    int v10 = 572;
    LODWORD(v4) = 28;
    BOOL v3 = &v5;
    _os_log_send_and_compose_impl();
  }
  -[WiFiCloudSyncEngineCore setICloudSyncingEnabled:](self, "setICloudSyncingEnabled:", 0, v3, v4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  self->keyValueStore = 0;
}

- (void)relayPruneKVSStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(WiFiCloudSyncEngineCore *)self clientThread])
  {
    int v5 = (NSThread *)[MEMORY[0x263F08B88] currentThread];
    if (v5 != [(WiFiCloudSyncEngineCore *)self clientThread])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v9 = 136315650;
      int v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
      __int16 v11 = 2080;
      __int16 v12 = "WiFiCloudSyncEngineCore.m";
      __int16 v13 = 1024;
      int v14 = 589;
LABEL_9:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v9 = 136315650;
      int v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
      __int16 v11 = 2080;
      __int16 v12 = "WiFiCloudSyncEngineCore.m";
      __int16 v13 = 1024;
      int v14 = 594;
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngineCore.m";
    __int16 v13 = 1024;
    int v14 = 598;
    LODWORD(v8) = 28;
    __int16 v7 = &v9;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEnginePruneNetworksInCloud((uint64_t)[(WiFiCloudSyncEngineCore *)self context], self, a3);
}

- (void)pruneKVSStore
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    __int16 v11 = "-[WiFiCloudSyncEngineCore pruneKVSStore]";
    __int16 v12 = 2080;
    __int16 v13 = "WiFiCloudSyncEngineCore.m";
    __int16 v14 = 1024;
    int v15 = 605;
    LODWORD(v8) = 28;
    __int16 v7 = &v10;
    _os_log_send_and_compose_impl();
  }
  id v3 = [(WiFiCloudSyncEngineCore *)self readCompleteKVStore];
  if (v3)
  {
    uint64_t v4 = v3;
    [(WiFiCloudSyncEngineCore *)self removeFromKVStore:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"];
    int v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer"), "objectForKey:", @"WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion");
    if (!v5 || (int)[v5 intValue] <= 1)
    {
      if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
        [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayPruneKVSStore_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:v4 waitUntilDone:1];
      }
      if ([(WiFiCloudSyncEngineCore *)self clientQueue])
      {
        id v6 = [(WiFiCloudSyncEngineCore *)self clientQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__WiFiCloudSyncEngineCore_pruneKVSStore__block_invoke;
        block[3] = &unk_26454D180;
        block[4] = self;
        void block[5] = v4;
        dispatch_sync((dispatch_queue_t)v6, block);
      }
    }
  }
}

uint64_t __40__WiFiCloudSyncEngineCore_pruneKVSStore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayPruneKVSStore:*(void *)(a1 + 40)];
}

- (void)relayCloudEvent:(id)a3
{
  if ([(WiFiCloudSyncEngineCore *)self clientThread])
  {
    int v5 = (NSThread *)[MEMORY[0x263F08B88] currentThread];
    if (v5 != [(WiFiCloudSyncEngineCore *)self clientThread])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
LABEL_8:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      goto LABEL_8;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self callback])
  {
    uint64_t v8 = [(WiFiCloudSyncEngineCore *)self callback];
    __int16 v7 = [(WiFiCloudSyncEngineCore *)self context];
    v8(self, a3, v7);
  }
}

- (void)relayCloudCleanUpEvent
{
  if ([(WiFiCloudSyncEngineCore *)self clientThread])
  {
    id v3 = (NSThread *)[MEMORY[0x263F08B88] currentThread];
    if (v3 != [(WiFiCloudSyncEngineCore *)self clientThread])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
LABEL_8:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      goto LABEL_8;
    }
  }

  [(WiFiCloudSyncEngineCore *)self removeFromKVStore:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"];
}

- (void)relayMergeNetworks:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(WiFiCloudSyncEngineCore *)self clientThread])
  {
    int v5 = (NSThread *)[MEMORY[0x263F08B88] currentThread];
    if (v5 != [(WiFiCloudSyncEngineCore *)self clientThread])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v9 = 136315650;
      int v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
      __int16 v11 = 2080;
      __int16 v12 = "WiFiCloudSyncEngineCore.m";
      __int16 v13 = 1024;
      int v14 = 666;
LABEL_9:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v9 = 136315650;
      int v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
      __int16 v11 = 2080;
      __int16 v12 = "WiFiCloudSyncEngineCore.m";
      __int16 v13 = 1024;
      int v14 = 671;
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngineCore.m";
    __int16 v13 = 1024;
    int v14 = 675;
    LODWORD(v8) = 28;
    __int16 v7 = &v9;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS((void *)[(WiFiCloudSyncEngineCore *)self context], self, a3);
}

- (void)synchronizeAndCallMergeNetworks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[WiFiCloudSyncEngineCore synchronizeAndCallMergeNetworks]";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngineCore.m";
    __int16 v13 = 1024;
    int v14 = 682;
    LODWORD(v7) = 28;
    id v6 = &v9;
    _os_log_send_and_compose_impl();
  }
  [(WiFiCloudSyncEngineCore *)self synchronizeKVS];
  id v3 = [(WiFiCloudSyncEngineCore *)self readCompleteKVStore];
  if (v3)
  {
    id v4 = v3;
    if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
      [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayMergeNetworks_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:v4 waitUntilDone:1];
    }
    if ([(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      int v5 = [(WiFiCloudSyncEngineCore *)self clientQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__WiFiCloudSyncEngineCore_synchronizeAndCallMergeNetworks__block_invoke;
      block[3] = &unk_26454D180;
      block[4] = self;
      void block[5] = v4;
      dispatch_sync((dispatch_queue_t)v5, block);
    }
  }
}

uint64_t __58__WiFiCloudSyncEngineCore_synchronizeAndCallMergeNetworks__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayMergeNetworks:*(void *)(a1 + 40)];
}

- (void)queryKeychainSyncState
{
  block[11] = *MEMORY[0x263EF8340];
  if ([(WiFiCloudSyncEngineCore *)self context])
  {
    uint64_t v3 = [NSNumber numberWithBool:WiFiCloudSyncEngineIsRunning() != 0];
    if ([(WiFiCloudSyncEngineCore *)self clientThread]) {
      [(WiFiCloudSyncEngineCore *)self performSelector:sel_relayKeychainSyncState_ onThread:[(WiFiCloudSyncEngineCore *)self clientThread] withObject:v3 waitUntilDone:1];
    }
    if ([(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      id v4 = [(WiFiCloudSyncEngineCore *)self clientQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__WiFiCloudSyncEngineCore_queryKeychainSyncState__block_invoke;
      block[3] = &unk_26454D180;
      block[4] = self;
      void block[5] = v3;
      dispatch_sync((dispatch_queue_t)v4, block);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __49__WiFiCloudSyncEngineCore_queryKeychainSyncState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayKeychainSyncState:*(void *)(a1 + 40)];
}

- (void)relayKeychainSyncState:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = [(WiFiCloudSyncEngineCore *)self context];
  if (a3) {
    LODWORD(a3) = [a3 BOOLValue];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    __int16 v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
    __int16 v12 = 2080;
    __int16 v13 = "WiFiCloudSyncEngineCore.m";
    __int16 v14 = 1024;
    int v15 = 737;
    __int16 v16 = 1024;
    int v17 = (int)a3;
    LODWORD(v9) = 34;
    uint64_t v8 = &v10;
    _os_log_send_and_compose_impl();
  }
  if ([(WiFiCloudSyncEngineCore *)self clientThread])
  {
    id v6 = (NSThread *)[MEMORY[0x263F08B88] currentThread];
    if (v6 != [(WiFiCloudSyncEngineCore *)self clientThread])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v10 = 136315650;
      __int16 v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
      __int16 v12 = 2080;
      __int16 v13 = "WiFiCloudSyncEngineCore.m";
      __int16 v14 = 1024;
      int v15 = 740;
LABEL_13:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if ([(WiFiCloudSyncEngineCore *)self clientQueue])
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != [(WiFiCloudSyncEngineCore *)self clientQueue])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v10 = 136315650;
      __int16 v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
      __int16 v12 = 2080;
      __int16 v13 = "WiFiCloudSyncEngineCore.m";
      __int16 v14 = 1024;
      int v15 = 745;
      goto LABEL_13;
    }
  }
  if (a3) {
    WiFiCloudSyncEngineStartEngine((uint64_t)v5);
  }
  else {
    WiFiCloudSyncEngineStopEngine((uint64_t)v5);
  }
}

- (NSUbiquitousKeyValueStore)keyValueStore
{
  return self->keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
  self->keyValueStore = (NSUbiquitousKeyValueStore *)a3;
}

- (void)context
{
  return self->context;
}

- (void)setContext:(void *)a3
{
  self->context = a3;
}

- (void)callback
{
  return self->callback;
}

- (void)setCallback:(void *)a3
{
  self->callback = a3;
}

- (NSThread)clientThread
{
  return self->clientThread;
}

- (void)setClientThread:(id)a3
{
  self->clientThread = (NSThread *)a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->clientQueue;
}

- (void)setClientQueue:(id)a3
{
  self->clientQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)iCloudSyncingEnabled
{
  return self->iCloudSyncingEnabled;
}

- (void)setICloudSyncingEnabled:(BOOL)a3
{
  self->iCloudSyncingEnabled = a3;
}

- (BOOL)isKVSEncrypted
{
  return self->isKVSEncrypted;
}

- (void)setIsKVSEncrypted:(BOOL)a3
{
  self->isKVSEncrypted = a3;
}

@end