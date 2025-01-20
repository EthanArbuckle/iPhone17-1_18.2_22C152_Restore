@interface NWStatsMonitor
- (BOOL)currentForegroundStateForProcessWithPid:(int)a3;
- (BOOL)debugMode;
- (NWStatsMonitor)initWithQueue:(id)a3;
- (id)allIdentifiersForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7;
- (id)bestIdentifierForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7 derivation:(int *)a8;
- (id)extensionNameForUUID:(id)a3;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)processNameForUUID:(id)a3;
- (id)processNameForUUIDString:(id)a3;
- (id)stateDictionary;
- (void)configure:(id)a3;
- (void)noteFailedLookupFor:(id)a3 processName:(char *)a4 pid:(int)a5;
@end

@implementation NWStatsMonitor

- (id)bestIdentifierForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7 derivation:(int *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  uint64_t v30 = 0;
  v16 = [(NWStatsMonitor *)self identifierForUUID:v14 derivation:(char *)&v30 + 4];
  if (v16) {
    goto LABEL_16;
  }
  if (self->_useCoalitionIDs)
  {
    if ([(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper noteUUID:v14 forPid:v11])
    {
      v16 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v14 derivation:(char *)&v30 + 4];
      if (v16) {
        goto LABEL_16;
      }
    }
  }
  [(NWStatsMonitor *)self noteFailedLookupFor:v14 processName:a7 pid:v11];
  if (self->_useProcessNames)
  {
    v16 = 0;
    if (!a7) {
      goto LABEL_15;
    }
  }
  else
  {
    v16 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v14 derivation:(char *)&v30 + 4];
    if (!a7) {
      goto LABEL_15;
    }
  }
  if (!v16)
  {
    v17 = [NSString stringWithUTF8String:a7];
    v18 = v17;
    if (v17 && [v17 length])
    {
      [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper noteUUID:v14 forProcessName:v18];
      v16 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v14 derivation:(char *)&v30 + 4];
    }
    else
    {
      v16 = 0;
    }
  }
LABEL_15:
  if (!v16)
  {
    HIDWORD(v30) = 0;
    v16 = @"UnknownProcess";
    if (!v15) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (!v15)
  {
LABEL_18:
    if (a8) {
      *a8 = HIDWORD(v30);
    }
    v19 = [NSString stringWithString:v16];
    goto LABEL_44;
  }
LABEL_17:
  if ([v14 isEqual:v15]) {
    goto LABEL_18;
  }
  v20 = [(NWStatsMonitor *)self identifierForUUID:v15 derivation:&v30];
  if (!v20)
  {
    if (v10 == v11
      || !v10
      || !self->_useCoalitionIDs
      || ![(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper noteUUID:v15 forPid:v10]|| ([(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v15 derivation:&v30], (v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v21 = v10 == v11 ? 0 : v10;
      [(NWStatsMonitor *)self noteFailedLookupFor:v14 processName:0 pid:v21];
      v20 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v15 derivation:&v30];
      if (!v20)
      {
        NSUInteger v27 = [(NSSet *)self->_useNEHelperSet count];
        if (!a7) {
          goto LABEL_18;
        }
        if (!v27) {
          goto LABEL_18;
        }
        useNEHelperSet = self->_useNEHelperSet;
        v29 = [NSString stringWithUTF8String:a7];
        LODWORD(useNEHelperSet) = [(NSSet *)useNEHelperSet containsObject:v29];

        if (!useNEHelperSet) {
          goto LABEL_18;
        }
        v20 = [(NWStatsEntityMapperNEHelper *)self->_neHelperUUIDMapper identifierForUUID:v15 derivation:&v30];
        if (!v20) {
          goto LABEL_18;
        }
      }
    }
  }
  appendProcNameSet = self->_appendProcNameSet;
  if (appendProcNameSet)
  {
    uint64_t v23 = [(NSSet *)appendProcNameSet count];
    if (a7)
    {
      if (v23)
      {
        v24 = [NSString stringWithUTF8String:a7];
        if (v24 && [(NSSet *)self->_appendProcNameSet containsObject:v24])
        {
          uint64_t v25 = [v24 stringByAppendingFormat:@"/%@", v20];

          v20 = (void *)v25;
          if (!v25) {
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
    }
  }
  if (a8) {
    *a8 = v30;
  }
  v19 = [NSString stringWithString:v20];

LABEL_44:
  return v19;
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  if (!self->_useStaticMapping
    || ([(NWStatsEntityMapperStaticAssignment *)self->_staticAssignmentUUIDMapper identifierForUUID:v6 derivation:a4], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_useLaunchServices
      || ([(NWStatsEntityMapperDynamicLaunchServices *)self->_dynamicLaunchServicesUUIDMapper identifierForUUID:v6 derivation:a4], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!self->_useNEHelper
        || ([(NWStatsEntityMapperNEHelper *)self->_neHelperUUIDMapper identifierForUUID:v6 derivation:a4], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (!self->_useCoalitionIDs
          || ([(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v6 derivation:a4], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if (self->_useProcessNames)
          {
            v7 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v6 derivation:a4];
          }
          else
          {
            v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  appStateHandler = self->_appStateHandler;
  if (appStateHandler) {
    LOBYTE(appStateHandler) = [(NWAppStateHandler *)appStateHandler currentForegroundStateForProcessWithPid:*(void *)&a3];
  }
  return (char)appStateHandler;
}

- (void)noteFailedLookupFor:(id)a3 processName:(char *)a4 pid:(int)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = [NSString stringWithUTF8String:a4];
    }
    else
    {
      if (a5) {
        pid_to_process_name(a5);
      }
      else {
      uint64_t v9 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v8 derivation:0];
      }
    }
    uint64_t v10 = (void *)v9;
    if (!v9
      || ([(NSSet *)self->_knownDaemonSet member:v9],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      v12 = [(NSMutableDictionary *)self->_reportedLookupFailures objectForKeyedSubscript:v8];
      if (v12)
      {
        v13 = v12;
        [v12 timeIntervalSinceNow];
        if (v14 >= -900.0)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      id v15 = [MEMORY[0x263EFF910] date];
      [(NSMutableDictionary *)self->_reportedLookupFailures setObject:v15 forKeyedSubscript:v8];

      v16 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v8 derivation:0];
      v17 = [(NWStatsEntityMapperNEHelper *)self->_neHelperUUIDMapper identifierForUUID:v8 derivation:0];
      v18 = NStatGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138544130;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v10;
        __int16 v23 = 2114;
        v24 = v16;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_21C4BC000, v18, OS_LOG_TYPE_DEFAULT, "Can't lookup UUID %{public}@ for procname %{public}@, coalition %{public}@ nehelper %{public}@", (uint8_t *)&v19, 0x2Au);
      }

      v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_18:
}

- (id)processNameForUUID:(id)a3
{
  return 0;
}

- (id)processNameForUUIDString:(id)a3
{
  return 0;
}

- (id)allIdentifiersForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  v39[10] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v33 = [(NWStatsEntityMapperDynamicLaunchServices *)self->_dynamicLaunchServicesUUIDMapper identifierForUUID:v12 derivation:0];
  double v14 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v12 derivation:0];
  id v15 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v12 derivation:0];
  uint64_t v32 = [(NWStatsEntityMapperNEHelper *)self->_neHelperUUIDMapper identifierForUUID:v12 derivation:0];
  uint64_t v31 = [(NWStatsEntityMapperStaticAssignment *)self->_staticAssignmentUUIDMapper identifierForUUID:v12 derivation:0];
  if (v15)
  {
    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v16 = [NSString stringWithUTF8String:a7];
  if (v16) {
    id v15 = (__CFString *)v16;
  }
  else {
    id v15 = @"malformed-proc-name";
  }
  [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper noteUUID:v12 forProcessName:v15];
  if (!v14)
  {
LABEL_8:
    if ([(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper noteUUID:v12 forPid:v9])
    {
      double v14 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v12 derivation:0];
    }
    else
    {
      double v14 = 0;
    }
  }
LABEL_11:
  v36 = v13;
  v37 = v12;
  v35 = v15;
  if (v13 && ([v12 isEqual:v13] & 1) == 0)
  {
    int v29 = v9;
    uint64_t v30 = [(NWStatsEntityMapperDynamicLaunchServices *)self->_dynamicLaunchServicesUUIDMapper identifierForUUID:v13 derivation:0];
    v18 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v13 derivation:0];
    int v19 = [(NWStatsEntityMapperNEHelper *)self->_neHelperUUIDMapper identifierForUUID:v13 derivation:0];
    id v20 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper identifierForUUID:v13 derivation:0];
    uint64_t v21 = [(NWStatsEntityMapperStaticAssignment *)self->_staticAssignmentUUIDMapper identifierForUUID:v13 derivation:0];
    if (v8 && !v18)
    {
      if (v8 == v29
        || ![(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper noteUUID:v13 forPid:v8])
      {
        v18 = 0;
      }
      else
      {
        v18 = [(NWStatsEntityMapperCoalitionWatcher *)self->_coalitionUUIDMapper identifierForUUID:v13 derivation:0];
      }
    }
    v17 = (__CFString *)v30;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    int v19 = 0;
    id v20 = 0;
    uint64_t v21 = 0;
  }
  if (v33) {
    v22 = (__CFString *)v33;
  }
  else {
    v22 = @"nil-Core-UUID";
  }
  v34 = v22;
  if (!v14) {
    double v14 = @"nil-Coal-UUID";
  }
  if (v32) {
    __int16 v23 = (__CFString *)v32;
  }
  else {
    __int16 v23 = @"nil-NE-UUID";
  }
  if (v31) {
    v24 = (__CFString *)v31;
  }
  else {
    v24 = @"nil-static-UUID";
  }
  v38[0] = @"kNWStatsLookupUUIDCoreServices";
  v38[1] = @"kNWStatsLookupUUIDStatic";
  if (v17) {
    __int16 v25 = v17;
  }
  else {
    __int16 v25 = @"nil-Core-EUUID";
  }
  v39[0] = v22;
  v39[1] = v24;
  v38[2] = @"kNWStatsLookupUUIDNEHelper";
  v38[3] = @"kNWStatsLookupUUIDCoalitionID";
  v39[2] = v23;
  v39[3] = v14;
  v38[4] = @"kNWStatsLookupUUIDProcessName";
  v38[5] = @"kNWStatsLookupEUUIDCoreServices";
  if (!v18) {
    v18 = @"nil-Coal-EUUID";
  }
  v39[4] = v35;
  v39[5] = v25;
  v38[6] = @"kNWStatsLookupEUUIDStatic";
  v38[7] = @"kNWStatsLookupEUUIDNEHelper";
  if (!v19) {
    int v19 = @"nil-NE-EUUID";
  }
  if (!v20) {
    id v20 = @"nil-Proc-EUUID";
  }
  if (v21) {
    v26 = (__CFString *)v21;
  }
  else {
    v26 = @"nil-static-EUUID";
  }
  v39[6] = v26;
  v39[7] = v19;
  v38[8] = @"kNWStatsLookupEUUIDCoalitionID";
  v38[9] = @"kNWStatsLookupEUUIDProcessName";
  v39[8] = v18;
  v39[9] = v20;
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:10];

  return v27;
}

- (id)extensionNameForUUID:(id)a3
{
  if (self->_useLaunchServices)
  {
    v3 = [(NWStatsEntityMapperDynamicLaunchServices *)self->_dynamicLaunchServicesUUIDMapper extensionNameForUUID:a3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelper"];

  if (v5) {
    self->_useNEHelper = 1;
  }
  id v6 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];
      useNEHelperSet = self->_useNEHelperSet;
      self->_useNEHelperSet = v9;
    }
    else
    {
      uint64_t v11 = NStatGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_ERROR, "Configuration Parameters for UseNEHelperForSet not a set", buf, 2u);
      }
    }
  }
  id v12 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];

  if (v12)
  {
    id v13 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      id v15 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];
      p_super = &self->_appendProcNameSet->super;
      self->_appendProcNameSet = v15;
    }
    else
    {
      p_super = NStatGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_21C4BC000, p_super, OS_LOG_TYPE_ERROR, "Configuration Parameters for UseProcessPrefixForSet not a set", v40, 2u);
      }
    }
  }
  v17 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseCoalitions"];

  if (v17)
  {
    v18 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseCoalitions"];
    char v19 = [v18 BOOLValue];
    self->_useCoalitionIDs = v19;
    self->_useProcessNames = v19 ^ 1;
  }
  id v20 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCheckStaticAssignments"];

  if (v20)
  {
    uint64_t v21 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCheckStaticAssignments"];
    self->_useStaticMapping = [v21 BOOLValue];
  }
  v22 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidCoalitions"];

  if (v22)
  {
    __int16 v23 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidCoalitions"];
    char v24 = [v23 BOOLValue];
    self->_useCoalitionIDs = v24 ^ 1;
    self->_useProcessNames = v24;
  }
  __int16 v25 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidLaunchServices"];

  if (v25)
  {
    v26 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidLaunchServices"];
    self->_useLaunchServices = [v26 BOOLValue] ^ 1;
  }
  uint64_t v27 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingDebugMode"];

  if (v27)
  {
    v28 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingDebugMode"];
    self->_debugMode = [v28 BOOLValue];
  }
  int v29 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCanonicalizeProcessNames"];

  if (v29)
  {
    uint64_t v30 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCanonicalizeProcessNames"];
    -[NWStatsEntityMapperProcessWatcher setCanonicalizedNames:](self->_processWatcherUUIDMapper, "setCanonicalizedNames:", [v30 BOOLValue]);
  }
  uint64_t v31 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAppStateMonitoring"];

  if (v31)
  {
    uint64_t v32 = [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAppStateMonitoring"];
    if ([v32 BOOLValue])
    {
      if (!self->_appEventListener)
      {
        uint64_t v33 = [[NWStatsAppEventListener alloc] initWithQueue:self->_queue];
        appEventListener = self->_appEventListener;
        self->_appEventListener = v33;
      }
      if (self->_appStateHandler) {
        goto LABEL_37;
      }
      v35 = objc_alloc_init(NWAppStateHandler);
      appStateHandler = self->_appStateHandler;
      self->_appStateHandler = v35;

      v37 = self->_appStateHandler;
      if (!v37) {
        goto LABEL_37;
      }
      v38 = self->_appEventListener;
      if (!v38) {
        goto LABEL_37;
      }
    }
    else
    {
      v39 = self->_appStateHandler;
      self->_appStateHandler = 0;

      v38 = self->_appEventListener;
      v37 = 0;
    }
    [(NWStatsAppEventListener *)v38 setAppStateDelegate:v37];
LABEL_37:
  }
}

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(NWStatsEntityMapperDynamicLaunchServices *)self->_dynamicLaunchServicesUUIDMapper stateDictionary];
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:@"DynLSMapper"];
  }
  else
  {
    v5 = [NSDictionary dictionary];
    [v3 setObject:v5 forKeyedSubscript:@"DynLSMapper"];
  }
  id v6 = [(NWStatsEntityMapperProcessWatcher *)self->_processWatcherUUIDMapper stateDictionary];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"ProcMapper"];
  }
  else
  {
    v7 = [NSDictionary dictionary];
    [v3 setObject:v7 forKeyedSubscript:@"ProcMapper"];
  }
  return v3;
}

- (NWStatsMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NWStatsMonitor;
  id v6 = [(NWStatsMonitor *)&v28 init];
  if (!v6) {
    goto LABEL_7;
  }
  v7 = objc_alloc_init(NWStatsEntityMapperStaticAssignment);
  staticAssignmentUUIDMapper = v6->_staticAssignmentUUIDMapper;
  v6->_staticAssignmentUUIDMapper = v7;

  uint64_t v9 = objc_alloc_init(NWStatsEntityMapperNEHelper);
  neHelperUUIDMapper = v6->_neHelperUUIDMapper;
  v6->_neHelperUUIDMapper = v9;

  uint64_t v11 = objc_alloc_init(NWStatsEntityMapperDynamicLaunchServices);
  dynamicLaunchServicesUUIDMapper = v6->_dynamicLaunchServicesUUIDMapper;
  v6->_dynamicLaunchServicesUUIDMapper = v11;

  id v13 = objc_alloc_init(NWStatsEntityMapperProcessWatcher);
  processWatcherUUIDMapper = v6->_processWatcherUUIDMapper;
  v6->_processWatcherUUIDMapper = v13;

  if (v6->_staticAssignmentUUIDMapper
    && v6->_neHelperUUIDMapper
    && v6->_dynamicLaunchServicesUUIDMapper
    && v6->_processWatcherUUIDMapper)
  {
    *(_WORD *)&v6->_useCoalitionIDs = 256;
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v15 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26CCB1D68];
    knownDaemonSet = v6->_knownDaemonSet;
    v6->_knownDaemonSet = (NSSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    reportedLookupFailures = v6->_reportedLookupFailures;
    v6->_reportedLookupFailures = v17;

    char v19 = objc_alloc_init(NWStatsEntityMapperCoalitionWatcher);
    coalitionUUIDMapper = v6->_coalitionUUIDMapper;
    v6->_coalitionUUIDMapper = v19;

    v6->_useStaticMapping = 1;
    *(_WORD *)&v6->_useNEHelper = 256;
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"nsurlsessiond", 0);
    useNEHelperSet = v6->_useNEHelperSet;
    v6->_useNEHelperSet = (NSSet *)v21;

    appendProcNameSet = v6->_appendProcNameSet;
    v6->_appendProcNameSet = 0;

    v6->_debugMode = 0;
LABEL_7:
    char v24 = v6;
    goto LABEL_11;
  }
  __int16 v25 = NStatGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C4BC000, v25, OS_LOG_TYPE_ERROR, "Cannot initialize all UUID mappers", buf, 2u);
  }

  char v24 = 0;
LABEL_11:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateHandler, 0);
  objc_storeStrong((id *)&self->_appEventListener, 0);
  objc_storeStrong((id *)&self->_reportedLookupFailures, 0);
  objc_storeStrong((id *)&self->_knownDaemonSet, 0);
  objc_storeStrong((id *)&self->_appendProcNameSet, 0);
  objc_storeStrong((id *)&self->_useNEHelperSet, 0);
  objc_storeStrong((id *)&self->_processWatcherUUIDMapper, 0);
  objc_storeStrong((id *)&self->_dynamicLaunchServicesUUIDMapper, 0);
  objc_storeStrong((id *)&self->_neHelperUUIDMapper, 0);
  objc_storeStrong((id *)&self->_staticAssignmentUUIDMapper, 0);
  objc_storeStrong((id *)&self->_coalitionUUIDMapper, 0);
}

@end