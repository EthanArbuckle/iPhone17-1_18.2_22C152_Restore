@interface FCNetworkBehaviorMonitor
- (FCNetworkBehaviorMonitor)init;
- (FCNetworkBehaviorMonitor)initWithCacheDirectory:(id)a3;
- (FCNetworkBehaviorMonitor)initWithOptions:(int64_t)a3 cacheDirectory:(id)a4;
- (NSArray)networkEvents;
- (NSArray)sessions;
- (NSDate)dateOfLastNetworkIssue;
- (id)initForLoggingOnly;
- (void)_visitEventGroupsFromDate:(void *)a3 toDate:(void *)a4 block:;
- (void)addObserver:(id)a3;
- (void)logNetworkEvent:(id)a3;
- (void)operationThrottlerPerformOperation:(id)a3;
- (void)populateTelemetry:(id)a3 withNetworkEventsFromDate:(id)a4 toDate:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setDateOfLastNetworkIssue:(id)a3;
- (void)wifiReachabilityDidChange:(id)a3;
@end

@implementation FCNetworkBehaviorMonitor

- (FCNetworkBehaviorMonitor)initWithOptions:(int64_t)a3 cacheDirectory:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FCNetworkBehaviorMonitor;
  v7 = [(FCNetworkBehaviorMonitor *)&v27 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("FCNetworkBehaviorMonitor.accessQueue", v8);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessions = v7->_sessions;
    v7->_sessions = v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    sessionIDsThisLaunch = v7->_sessionIDsThisLaunch;
    v7->_sessionIDsThisLaunch = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v7->_events;
    v7->_events = v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v17;

    v7->_options = a3;
    v19 = +[FCNetworkReachability sharedNetworkReachability];
    [v19 addObserver:v7];

    if (v6 && (v7->_options & 8) != 0)
    {
      v20 = [[FCTimedOperationThrottler alloc] initWithDelegate:v7];
      [(FCTimedOperationThrottler *)v20 setCooldownTime:2.0];
      saveThrottler = v7->_saveThrottler;
      v7->_saveThrottler = (FCOperationThrottler *)v20;
    }
    v22 = v7->_accessQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke;
    v24[3] = &unk_1E5B4BE70;
    v25 = v7;
    id v26 = v6;
    dispatch_async(v22, v24);
  }
  return v7;
}

void __44__FCNetworkBehaviorMonitor_logNetworkEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) startTime];
  double v3 = v2;
  [*(id *)(a1 + 32) dnsDuration];
  double v5 = v4;
  [*(id *)(a1 + 32) connectDuration];
  double v7 = v6;
  [*(id *)(a1 + 32) requestDuration];
  double v9 = v8;
  [*(id *)(a1 + 32) responseDuration];
  double v11 = v10;
  v12 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  v14 = v13;
  if (v12)
  {
    int v15 = [v13 type];
    if ((v15 - 1) >= 0x10)
    {
      if (v15 != 17)
      {
        v19 = 0;
        goto LABEL_13;
      }
      v16 = [v14 HTTPResponseHeaders];
      uint64_t v17 = v16;
      v18 = @"X-Responding-Instance";
    }
    else
    {
      v16 = [v14 HTTPResponseHeaders];
      uint64_t v17 = v16;
      v18 = @"Via";
    }
    v19 = [v16 objectForKeyedSubscript:v18];

    if (v19)
    {
      uint64_t v20 = [v19 rangeOfString:@"-"];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v21 = v20;
        if (qword_1EB5D11C0 != -1) {
          dispatch_once(&qword_1EB5D11C0, &__block_literal_global_45);
        }
        uint64_t v22 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", _MergedGlobals_152, 4, 0, v21);
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v19, "substringWithRange:", v22 + v23, v21 - (v22 + v23));
LABEL_14:

          goto LABEL_15;
        }
      }
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
LABEL_15:

  id v24 = objc_alloc_init(MEMORY[0x1E4F82AC0]);
  if (v3 != 0.0)
  {
    v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v3];
    objc_msgSend(v24, "setStartTime:", objc_msgSend(v25, "fc_millisecondTimeIntervalSince1970"));
  }
  if (v5 != 0.0) {
    objc_msgSend(v24, "setDnsDuration:", (unint64_t)(fmax(v5, 0.0) * 1000.0));
  }
  if (v7 != 0.0) {
    objc_msgSend(v24, "setConnectDuration:", (unint64_t)(fmax(v7, 0.0) * 1000.0));
  }
  if (v9 != 0.0) {
    objc_msgSend(v24, "setRequestDuration:", (unint64_t)(fmax(v9, 0.0) * 1000.0));
  }
  if (v11 != 0.0) {
    objc_msgSend(v24, "setResponseDuration:", (unint64_t)(fmax(v11, 0.0) * 1000.0));
  }
  if ([*(id *)(a1 + 32) responseSize]) {
    objc_msgSend(v24, "setResponseSize:", objc_msgSend(*(id *)(a1 + 32), "responseSize"));
  }
  if ([*(id *)(a1 + 32) HTTPStatusCode]) {
    objc_msgSend(v24, "setHttpStatusCode:", objc_msgSend(*(id *)(a1 + 32), "HTTPStatusCode"));
  }
  id v26 = [*(id *)(a1 + 32) error];
  uint64_t v27 = [v26 code];

  if (v27)
  {
    v28 = [*(id *)(a1 + 32) error];
    objc_msgSend(v24, "setErrorCode:", objc_msgSend(v28, "code"));
  }
  if ([*(id *)(a1 + 32) type]) {
    objc_msgSend(v24, "setType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  }
  v29 = [*(id *)(a1 + 32) URL];

  if (v29)
  {
    v30 = [*(id *)(a1 + 32) URL];
    v31 = [v30 absoluteString];
    [v24 setUrl:v31];
  }
  v32 = [*(id *)(a1 + 32) requestUUID];

  if (v32)
  {
    v33 = [*(id *)(a1 + 32) requestUUID];
    [v24 setRequestUUID:v33];
  }
  if (v12) {
    [v24 setRespondingPOP:v12];
  }
  if ([*(id *)(a1 + 32) isProxyConnection]) {
    objc_msgSend(v24, "setIsProxyConnection:", objc_msgSend(*(id *)(a1 + 32), "isProxyConnection"));
  }
  v34 = [*(id *)(*(void *)(a1 + 40) + 16) lastObject];
  if ([v34 sessionID]) {
    objc_msgSend(v24, "setSessionID:", objc_msgSend(v34, "sessionID"));
  }
  uint64_t v35 = *(void *)(a1 + 40);
  uint64_t v36 = *(void *)(v35 + 64);
  if ((v36 & 2) == 0)
  {
    if ((v36 & 4) == 0) {
      goto LABEL_45;
    }
LABEL_56:
    objc_msgSend(*(id *)(v35 + 32), "addObject:", v24, (void)v42);
    uint64_t v35 = *(void *)(a1 + 40);
    if ((*(void *)(v35 + 64) & 8) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v37 = *(id *)(v35 + 56);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(v37);
        }
        objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "networkEventMonitor:loggedEvent:inSession:", *(void *)(a1 + 40), v24, v34, (void)v42);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v39);
  }

  uint64_t v35 = *(void *)(a1 + 40);
  uint64_t v36 = *(void *)(v35 + 64);
  if ((v36 & 4) != 0) {
    goto LABEL_56;
  }
LABEL_45:
  if ((v36 & 8) != 0) {
LABEL_46:
  }
    objc_msgSend(*(id *)(v35 + 48), "tickle", (void)v42);
LABEL_47:
}

- (void)logNetworkEvent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (!self) {
    goto LABEL_11;
  }
  [v4 startTime];
  if (v6 == 0.0)
  {
LABEL_8:

    goto LABEL_9;
  }
  double v7 = [v5 error];
  if (objc_msgSend(v7, "fc_isCancellationError"))
  {
LABEL_7:

    goto LABEL_8;
  }
  double v8 = [v5 error];
  double v9 = [v8 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F289A0]])
  {

LABEL_11:
    goto LABEL_12;
  }
  double v10 = [v5 error];
  if ([v10 code] == -1005)
  {

    goto LABEL_7;
  }
  uint64_t v21 = [v5 error];
  uint64_t v22 = [v21 code];

  if (v22 == -1009) {
    goto LABEL_9;
  }
LABEL_12:
  uint64_t v11 = [v5 error];
  if (v11)
  {
    v12 = (void *)v11;
    id v13 = [v5 error];
    int v14 = objc_msgSend(v13, "fc_isRecoverableNetworkError");

    if (v14)
    {
      int v15 = [MEMORY[0x1E4F1C9C8] date];
      [(FCNetworkBehaviorMonitor *)self setDateOfLastNetworkIssue:v15];
    }
  }
  if ((self->_options & 1) == 0) {
    goto LABEL_28;
  }
  v16 = [v5 error];

  uint64_t v17 = FCNetworkLog;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)FCNetworkLog, OS_LOG_TYPE_ERROR))
    {
      id v24 = v17;
      v25 = [v5 description];
      *(_DWORD *)buf = 138543362;
      v30 = v25;
      _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "logged network event: %{public}@. This log is being duplicated as an default-level log.", buf, 0xCu);

      uint64_t v17 = FCNetworkLog;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v18 = v17;
    v19 = [v5 description];
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    uint64_t v20 = "logged network event: %{public}@. This log is being duplicated as an error-level log.";
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCNetworkLog, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      v19 = [v5 debugDescription];
      *(_DWORD *)buf = 138543362;
      v30 = v19;
      _os_log_debug_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEBUG, "logged network event: %{public}@", buf, 0xCu);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v18 = v17;
    v19 = [v5 description];
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    uint64_t v20 = "logged network event: %{public}@";
  }
  _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
LABEL_27:

LABEL_28:
  if ((self->_options & 6) != 0)
  {
    accessQueue = self->_accessQueue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__FCNetworkBehaviorMonitor_logNetworkEvent___block_invoke_2;
    v26[3] = &unk_1E5B4BE70;
    id v27 = v5;
    v28 = self;
    dispatch_async(accessQueue, v26);
  }
LABEL_9:
}

uint64_t __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(a2, "sessionID")) ^ 1;
}

void __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F82AC8]);
  [v2 setSessionID:0];
  double v3 = +[FCNetworkReachability sharedNetworkReachability];
  objc_msgSend(v2, "setWifiReachable:", objc_msgSend(v3, "isNetworkReachableViaWiFi"));

  id v4 = +[FCNetworkReachability sharedNetworkReachability];
  objc_msgSend(v2, "setCellularRadioAccessTechnology:", objc_msgSend(v4, "cellularRadioAccessTechnology"));

  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addIndex:", objc_msgSend(v2, "sessionID"));
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 64) & 8) != 0 && *(void *)(a1 + 40))
  {
    double v5 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    [(FCKeyValueStoreClassRegistry *)v5 registerClass:objc_opt_class()];
    double v6 = [[FCKeyValueStore alloc] initWithName:@"network-behavior-monitor" directory:*(void *)(a1 + 40) version:8 options:0 classRegistry:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    double v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"sessions"];
    double v10 = [v9 networkSessions];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = *(void **)(*(void *)(a1 + 32) + 16);
      id v13 = [v9 networkSessions];
      objc_msgSend(v12, "fc_insertObjects:atIndex:", v13, 0);

      int v14 = [v9 networkSessions];
      int v15 = [v14 lastObject];
      uint64_t v16 = [v15 sessionID] + 1;
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
      [v17 setSessionID:v16];

      [*(id *)(*(void *)(a1 + 32) + 24) removeIndex:0];
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 24);
      uint64_t v20 = [*(id *)(v18 + 16) lastObject];
      objc_msgSend(v19, "addIndex:", objc_msgSend(v20, "sessionID"));
    }
    uint64_t v21 = [v9 networkEvents];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 32);
      id v24 = [v9 networkEvents];
      objc_msgSend(v23, "fc_insertObjects:atIndex:", v24, 0);
    }
    if ([*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      v25 = [MEMORY[0x1E4F28E60] indexSet];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v26 = *(id *)(*(void *)(a1 + 32) + 32);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v37;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v37 != v29) {
              objc_enumerationMutation(v26);
            }
            objc_msgSend(v25, "addIndex:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v30++), "sessionID"));
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v28);
      }

      uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
      objc_msgSend(v25, "addIndex:", objc_msgSend(v31, "sessionID"));

      v32 = *(void **)(*(void *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke_2;
      v34[3] = &unk_1E5B4FF38;
      id v35 = v25;
      id v33 = v25;
      objc_msgSend(v32, "fc_removeObjectsPassingTest:", v34);
    }
  }
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F82AD0]);
  accessQueue = self->_accessQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __63__FCNetworkBehaviorMonitor_operationThrottlerPerformOperation___block_invoke;
  double v10 = &unk_1E5B4BE70;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  [(FCKeyValueStore *)self->_localStore setObject:v6, @"sessions", v7, v8, v9, v10, v11 forKey];
}

- (FCNetworkBehaviorMonitor)initWithCacheDirectory:(id)a3
{
  return [(FCNetworkBehaviorMonitor *)self initWithOptions:15 cacheDirectory:a3];
}

- (id)initForLoggingOnly
{
  return [(FCNetworkBehaviorMonitor *)self initWithOptions:1 cacheDirectory:0];
}

void __63__FCNetworkBehaviorMonitor_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "fc_trimFromFrontToMaxCount:", 2500);
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  [*(id *)(a1 + 40) setNetworkSessions:v2];

  id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  [*(id *)(a1 + 40) setNetworkEvents:v3];
}

uint64_t __52__FCNetworkBehaviorMonitor__respondingPOPFromEvent___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@": "];
  uint64_t v1 = _MergedGlobals_152;
  _MergedGlobals_152 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)addObserver:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  [(NSHashTable *)self->_observers addObject:v5];
}

- (FCNetworkBehaviorMonitor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCNetworkBehaviorMonitor init]";
    __int16 v9 = 2080;
    double v10 = "FCNetworkBehaviorMonitor.m";
    __int16 v11 = 1024;
    int v12 = 100;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNetworkBehaviorMonitor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)populateTelemetry:(id)a3 withNetworkEventsFromDate:(id)a4 toDate:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__FCNetworkBehaviorMonitor_populateTelemetry_withNetworkEventsFromDate_toDate___block_invoke;
  v10[3] = &unk_1E5B4FF60;
  id v11 = v8;
  id v9 = v8;
  -[FCNetworkBehaviorMonitor _visitEventGroupsFromDate:toDate:block:]((uint64_t)self, a4, a5, v10);
}

uint64_t __79__FCNetworkBehaviorMonitor_populateTelemetry_withNetworkEventsFromDate_toDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addNetworkEventGroups:a2];
}

- (void)_visitEventGroupsFromDate:(void *)a3 toDate:(void *)a4 block:
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a3;
    uint64_t v9 = objc_msgSend(a2, "fc_millisecondTimeIntervalSince1970");
    uint64_t v10 = objc_msgSend(v8, "fc_millisecondTimeIntervalSince1970");

    id v11 = *(NSObject **)(a1 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke;
    v12[3] = &unk_1E5B50030;
    v12[4] = a1;
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    id v13 = v7;
    dispatch_sync(v11, v12);
  }
}

- (NSArray)sessions
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__FCNetworkBehaviorMonitor_sessions__block_invoke;
  v8[3] = &unk_1E5B4FF60;
  id v9 = v3;
  id v4 = v3;
  -[FCNetworkBehaviorMonitor _visitEventGroupsFromDate:toDate:block:]((uint64_t)self, 0, 0, v8);
  id v5 = [v4 allValues];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_30];

  return (NSArray *)v6;
}

void __36__FCNetworkBehaviorMonitor_sessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "sessionID"));
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = objc_alloc_init(FCNetworkSession);
    -[FCNetworkSession setWifiReachable:](v8, "setWifiReachable:", [v5 wifiReachable]);
    -[FCNetworkSession setCellularRadioAccessTechnology:](v8, "setCellularRadioAccessTechnology:", (int)[v5 cellularRadioAccessTechnology]);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "sessionID"));
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [(FCNetworkSession *)v8 addEventGroup:v11];
}

uint64_t __36__FCNetworkBehaviorMonitor_sessions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)networkEvents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__19;
  uint64_t v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke_2;
  v7[3] = &unk_1E5B4FFA8;
  v7[4] = v2;
  uint64_t v4 = objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [a2 sessionID];
  return [v2 containsIndex:v3];
}

- (void)removeObserver:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  [(NSHashTable *)self->_observers removeObject:v5];
}

void __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke(void *a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v32 = objc_msgSend(*(id *)(a1[4] + 16), "fc_dictionaryWithKeyBlock:", &__block_literal_global_52);
  id obj = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v40 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v46;
    uint64_t v6 = off_1E5B4A000;
    uint64_t v33 = *(void *)v46;
    id v35 = v2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        if ((!a1[6] || (unint64_t)[*(id *)(*((void *)&v45 + 1) + 8 * v7) startTime] >= a1[6])
          && (!a1[7] || (unint64_t)[v8 startTime] < a1[7]))
        {
          id v9 = objc_alloc_init(v6[312]);
          int v10 = [v8 type];
          if (v9)
          {
            *((_DWORD *)v9 + 2) = v10;
            *((void *)v9 + 2) = [v8 sessionID];
            id v11 = [v8 respondingPOP];
            objc_storeStrong((id *)v9 + 3, v11);
          }
          else
          {
            [v8 sessionID];
            id v11 = [v8 respondingPOP];
          }

          int v12 = [obj objectForKeyedSubscript:v9];
          if (!v12)
          {
            id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "sessionID"));
            uint64_t v14 = [v32 objectForKeyedSubscript:v13];

            uint64_t v15 = v6;
            id v16 = objc_alloc_init(MEMORY[0x1E4F82BF8]);
            objc_msgSend(v16, "setEventType:", objc_msgSend(v8, "pbNetworkEventType"));
            uint64_t v17 = [v8 respondingPOP];
            [v16 setRespondingPop:v17];

            objc_msgSend(v16, "setWifiReachabilityStatus:", objc_msgSend(v14, "wifiReachable"));
            objc_msgSend(v16, "setCellularRadioAccessTechnology:", objc_msgSend(v14, "cellularRadioAccessTechnology"));
            [obj setObject:v16 forKeyedSubscript:v9];
            [v37 setObject:v14 forKeyedSubscript:v9];
            uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
            [v40 setObject:v18 forKeyedSubscript:v9];

            id v2 = v35;
            uint64_t v6 = v15;
            uint64_t v5 = v33;
          }
          v19 = [v40 objectForKeyedSubscript:v9];
          [v19 addObject:v8];
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v20 = [v2 countByEnumeratingWithState:&v45 objects:v50 count:16];
      uint64_t v4 = v20;
    }
    while (v20);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obja = obj;
  uint64_t v36 = [obja countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obja);
        }
        uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v23 = [obja objectForKeyedSubscript:v22];
        id v24 = [v37 objectForKeyedSubscript:v22];
        v25 = [v40 objectForKeyedSubscript:v22];
        id v26 = objc_msgSend(v25, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_56_1);
        uint64_t v27 = objc_msgSend(v25, "fc_arrayOfObjectsFailingTest:", &__block_literal_global_56_1);
        uint64_t v28 = objc_msgSend(v26, "fc_arrayByTransformingWithBlock:", &__block_literal_global_59);
        uint64_t v29 = (void *)[v28 mutableCopy];
        [v23 setSuccesses:v29];

        uint64_t v30 = objc_msgSend(v27, "fc_arrayByTransformingWithBlock:", &__block_literal_global_59);
        uint64_t v31 = (void *)[v30 mutableCopy];
        [v23 setFailures:v31];

        (*(void (**)(void))(a1[5] + 16))();
      }
      uint64_t v36 = [obja countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v36);
  }
}

uint64_t __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 sessionID];
  return [v2 numberWithUnsignedLongLong:v3];
}

uint64_t __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isSuccess];
}

id __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F82BF0]);
  if ([v2 startTime]) {
    objc_msgSend(v3, "setStartTime:", objc_msgSend(v2, "startTime"));
  }
  if ([v2 dnsDuration]) {
    objc_msgSend(v3, "setDnsDuration:", objc_msgSend(v2, "dnsDuration"));
  }
  if ([v2 connectDuration]) {
    objc_msgSend(v3, "setConnectDuration:", objc_msgSend(v2, "connectDuration"));
  }
  if ([v2 requestDuration]) {
    objc_msgSend(v3, "setRequestDuration:", objc_msgSend(v2, "requestDuration"));
  }
  if ([v2 responseDuration]) {
    objc_msgSend(v3, "setResponseDuration:", objc_msgSend(v2, "responseDuration"));
  }
  if ([v2 responseSize]) {
    objc_msgSend(v3, "setResponseSize:", objc_msgSend(v2, "responseSize"));
  }
  if ([v2 cacheState]) {
    objc_msgSend(v3, "setCacheState:", objc_msgSend(v2, "pbNetworkEventCacheState"));
  }
  if ([v2 httpStatusCode]) {
    objc_msgSend(v3, "setHttpStatusCode:", objc_msgSend(v2, "httpStatusCode"));
  }
  if ([v2 errorCode]) {
    objc_msgSend(v3, "setErrorCode:", objc_msgSend(v2, "errorCode"));
  }

  return v3;
}

- (void)wifiReachabilityDidChange:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F82AC8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setWifiReachable:", objc_msgSend(v5, "isNetworkReachableViaWiFi"));
  uint64_t v7 = [v5 cellularRadioAccessTechnology];

  [v6 setCellularRadioAccessTechnology:v7];
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__FCNetworkBehaviorMonitor_wifiReachabilityDidChange___block_invoke;
  v10[3] = &unk_1E5B4BE70;
  id v11 = v6;
  int v12 = self;
  id v9 = v6;
  dispatch_async(accessQueue, v10);
}

uint64_t __54__FCNetworkBehaviorMonitor_wifiReachabilityDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 40) + 16) lastObject];
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", objc_msgSend(v2, "sessionID") + 1);

  [*(id *)(*(void *)(a1 + 40) + 16) addObject:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v5 = [v3 sessionID];
  return [v4 addIndex:v5];
}

- (NSDate)dateOfLastNetworkIssue
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateOfLastNetworkIssue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastNetworkIssue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sessionIDsThisLaunch, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end