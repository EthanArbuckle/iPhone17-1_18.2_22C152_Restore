@interface WFBlackListNode
- (BOOL)containsNetwork:(id)a3;
- (BOOL)enterprisePolicy;
- (BOOL)hasBlacklistedState:(unint64_t)a3;
- (BOOL)updateNetwork:(id)a3;
- (NSMutableArray)blacklistTriggers;
- (NSMutableArray)blacklistedStatesCurrent;
- (NSMutableArray)blacklistedStatesHistory;
- (WFBlackListNode)initWithBlacklistNetwork:(id)a3;
- (WFBlacklistNetwork)networkDelegate;
- (id)_copyCreateBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addBlacklistTrigger:(unint64_t)a3 reasonData:(int64_t)a4 bssid:(id)a5;
- (void)addBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addBlacklistedStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)dealloc;
- (void)networkPruned;
- (void)processBlacklistedStateMetric:(id)a3 unblacklisting:(BOOL)a4 unblacklistingReason:(unint64_t)a5;
- (void)setBlacklistTriggers:(id)a3;
- (void)setBlacklistedStatesCurrent:(id)a3;
- (void)setBlacklistedStatesHistory:(id)a3;
- (void)setEnterprisePolicy:(BOOL)a3;
- (void)setNetworkDelegate:(id)a3;
@end

@implementation WFBlackListNode

- (WFBlackListNode)initWithBlacklistNetwork:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFBlackListNode;
  v5 = [(WFBlackListNode *)&v19 init];
  if (!v5)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s self nil", "-[WFBlackListNode initWithBlacklistNetwork:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v4)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s network nil", "-[WFBlackListNode initWithBlacklistNetwork:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  blacklistTriggers = v5->_blacklistTriggers;
  v5->_blacklistTriggers = v6;

  if (!v5->_blacklistTriggers)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Alloc failed: triggersList", "-[WFBlackListNode initWithBlacklistNetwork:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  blacklistedStatesCurrent = v5->_blacklistedStatesCurrent;
  v5->_blacklistedStatesCurrent = v8;

  if (!v5->_blacklistedStatesCurrent)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Alloc failed: statesList", "-[WFBlackListNode initWithBlacklistNetwork:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  blacklistedStatesHistory = v5->_blacklistedStatesHistory;
  v5->_blacklistedStatesHistory = v10;

  if (!v5->_blacklistedStatesHistory)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Alloc failed: historyList", "-[WFBlackListNode initWithBlacklistNetwork:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
      id v16 = objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v17;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
LABEL_18:

    v13 = 0;
    goto LABEL_19;
  }
  char v12 = [v4 isEAP];
  v5->_enterprisePolicy = v12 & [v4 isProfileBased];
  v13 = (void *)[v4 copyWithZone:0];
  if (![v13 isEqualToBlacklistNetwork:v4])
  {
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  [(WFBlackListNode *)v5 setNetworkDelegate:v13];
  v14 = v5;
LABEL_20:

  return v14;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_blacklistTriggers removeAllObjects];
  [(NSMutableArray *)self->_blacklistedStatesCurrent removeAllObjects];
  [(NSMutableArray *)self->_blacklistedStatesHistory removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)WFBlackListNode;
  [(WFBlackListNode *)&v3 dealloc];
}

- (void)addBlacklistTrigger:(unint64_t)a3 reasonData:(int64_t)a4 bssid:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = [(WFBlackListNode *)self blacklistTriggers];
  unint64_t v10 = [v9 count];

  if (v10 >= 0x10)
  {
    v11 = [(WFBlackListNode *)self blacklistTriggers];
    [v11 removeObjectAtIndex:0];
  }
  char v12 = objc_alloc_init(WFBlacklistTriggerNode);
  if (v12)
  {
    id v13 = +[WFBlacklistEngine stringRepresentationWithReason:a3];
    [(WFBlacklistTriggerNode *)v12 setTriggerReason:a3];
    [(WFBlacklistTriggerNode *)v12 setTriggerReasonData:a4];
    if (v13) {
      [(WFBlacklistTriggerNode *)v12 setTriggerReasonString:v13];
    }
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSince1970];
    -[WFBlacklistTriggerNode setTriggerReasonTimestamp:](v12, "setTriggerReasonTimestamp:");

    if (v8) {
      [(WFBlacklistTriggerNode *)v12 setBssid:v8];
    }
    id v15 = [(WFBlackListNode *)self blacklistTriggers];
    [v15 addObject:v12];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s ev alloc failed", "-[WFBlackListNode addBlacklistTrigger:reasonData:bssid:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    id v16 = NSString;
    id v13 = v13;
    objc_msgSend(v16, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
    id v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v15 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

LABEL_10:
}

- (BOOL)containsNetwork:(id)a3
{
  if (a3) {
    return -[WFBlacklistNetwork isEqualToBlacklistNetwork:](self->_networkDelegate, "isEqualToBlacklistNetwork:");
  }
  else {
    return 0;
  }
}

- (BOOL)hasBlacklistedState:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(WFBlackListNode *)self blacklistedStatesCurrent];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) blacklistedState] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)updateNetwork:(id)a3
{
  id v4 = (WFBlacklistNetwork *)[a3 copyWithZone:0];
  networkDelegate = self->_networkDelegate;
  self->_networkDelegate = v4;

  return 1;
}

- (id)_copyCreateBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(WFBlacklistStateNode);
  if (v8)
  {
    id v9 = +[WFBlacklistEngine stringRepresentationWithState:a3];
    unint64_t v10 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
    [(WFBlacklistStateNode *)v8 setBlacklistedState:a3];
    [(WFBlacklistStateNode *)v8 setBlacklistedStateString:v9];
    long long v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSince1970];
    -[WFBlacklistStateNode setBlacklistedStateTimestamp:](v8, "setBlacklistedStateTimestamp:");

    [(WFBlacklistStateNode *)v8 setBlacklistedReason:a4];
    [(WFBlacklistStateNode *)v8 setBlacklistedReasonData:a5];
    [(WFBlacklistStateNode *)v8 setBlacklistedReasonString:v10];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s stateNode alloc failed", "-[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v13 = NSString;
      id v9 = v9;
      objc_msgSend(v13, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v9, "UTF8String"));
      id v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = [v14 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v8;
}

- (void)addBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  unint64_t v5 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = [(WFBlackListNode *)self _copyCreateBlacklistedState:a3 reason:a4 reasonData:a5];
  if (v8)
  {
    id v9 = [(WFBlackListNode *)self networkDelegate];
    id v10 = [v9 ssid];

    long long v11 = [(WFBlackListNode *)self networkDelegate];
    id v12 = [v11 bssid];

    long long v13 = [(WFBlackListNode *)self blacklistedStatesCurrent];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v15 = [(WFBlackListNode *)self blacklistedStatesCurrent];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        unint64_t v32 = v5;
        id v33 = v12;
        id v18 = v10;
        id v19 = 0;
        uint64_t v20 = *(void *)v35;
        while (2)
        {
          uint64_t v21 = 0;
          uint64_t v22 = v19;
          do
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v15);
            }
            id v19 = *(id *)(*((void *)&v34 + 1) + 8 * v21);

            uint64_t v23 = [v19 blacklistedState];
            if (v23 == [v8 blacklistedState])
            {

              id v10 = v18;
              id v12 = v33;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v28 = +[WFBlacklistEngine stringRepresentationWithState:a3];
                v29 = +[WFBlacklistEngine stringRepresentationWithReason:v32];
                *(_DWORD *)buf = 141559554;
                uint64_t v40 = 1752392040;
                __int16 v41 = 2112;
                id v42 = v18;
                __int16 v43 = 2160;
                uint64_t v44 = 1752392040;
                __int16 v45 = 2112;
                id v46 = v33;
                __int16 v47 = 2112;
                v48 = v28;
                __int16 v49 = 2112;
                v50 = v29;
                __int16 v51 = 2048;
                unint64_t v52 = v32;
                _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "'%{mask.hash}@[%{mask.hash}@]' was already %@. Would have blacklisted again due to %@(%lu)", buf, 0x48u);
              }
              goto LABEL_19;
            }
            ++v21;
            uint64_t v22 = v19;
          }
          while (v17 != v21);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v17) {
            continue;
          }
          break;
        }

        id v10 = v18;
        unint64_t v5 = v32;
        id v12 = v33;
      }

      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      v24 = +[WFBlacklistEngine stringRepresentationWithState:a3];
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:v5];
      *(_DWORD *)buf = 141559554;
      uint64_t v40 = 1752392040;
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2160;
      uint64_t v44 = 1752392040;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v24;
      __int16 v49 = 2112;
      v50 = v25;
      __int16 v51 = 2048;
      unint64_t v52 = v5;
      v26 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        v27 = [(WFBlackListNode *)self blacklistedStatesCurrent];
        [v27 addObject:v8];

        [(WFBlackListNode *)self processBlacklistedStateMetric:v8 unblacklisting:0 unblacklistingReason:0];
        goto LABEL_19;
      }
      v24 = +[WFBlacklistEngine stringRepresentationWithState:a3];
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:v5];
      *(_DWORD *)buf = 141559554;
      uint64_t v40 = 1752392040;
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2160;
      uint64_t v44 = 1752392040;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v24;
      __int16 v49 = 2112;
      v50 = v25;
      __int16 v51 = 2048;
      unint64_t v52 = v5;
      v26 = MEMORY[0x1E4F14500];
    }
    _os_log_error_impl(&dword_1D3CCD000, v26, OS_LOG_TYPE_ERROR, "Blacklisting and adding '%{mask.hash}@[%{mask.hash}@]' to %@ due to %@(%lu)", buf, 0x48u);

    goto LABEL_18;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s Failed to add state", "-[WFBlackListNode addBlacklistedState:reason:reasonData:]");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    goto LABEL_20;
  }
  v30 = NSString;
  id v10 = v10;
  objc_msgSend(v30, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v10, "UTF8String"));
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v12 UTF8String];
  *(_DWORD *)buf = 136446210;
  uint64_t v40 = v31;
  _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_19:

LABEL_20:
}

- (void)addBlacklistedStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v11 = v10;
  if (v10)
  {
    id v12 = v10;
LABEL_4:
    long long v13 = [(WFBlackListNode *)self networkDelegate];
    uint64_t v14 = [v13 ssid];

    id v15 = [(WFBlackListNode *)self blacklistedStatesHistory];
    unint64_t v16 = [v15 count];

    if (v16 >= 5)
    {
      uint64_t v17 = [(WFBlackListNode *)self blacklistedStatesHistory];
      [v17 removeObjectAtIndex:0];
    }
    id v18 = NSString;
    id v19 = +[WFBlacklistEngine stringRepresentationWithState:a4];
    uint64_t v20 = +[WFBlacklistEngine stringRepresentationWithReason:a5];
    uint64_t v21 = [v18 stringWithFormat:@"Adding to blacklistHistory: %@ for '%@' due to %@(%lu)", v19, v14, v20, a5];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
      id v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = [v22 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    uint64_t v23 = [(WFBlackListNode *)self blacklistedStatesHistory];
    [v23 addObject:v12];

    goto LABEL_9;
  }
  id v12 = [(WFBlackListNode *)self _copyCreateBlacklistedState:a4 reason:a5 reasonData:a6];
  if (v12) {
    goto LABEL_4;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s Failed to add state to history", "-[WFBlackListNode addBlacklistedStateHistory:state:reason:reasonData:]");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = NSString;
    id v12 = v12;
    objc_msgSend(v24, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v12, "UTF8String"));
    id v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v25 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
LABEL_9:
}

- (void)networkPruned
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5[0] = 136316162;
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v3;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s Metric for %{mask.hash}@[%{mask.hash}@] not found!", (uint8_t *)v5, 0x34u);
}

- (void)processBlacklistedStateMetric:(id)a3 unblacklisting:(BOOL)a4 unblacklistingReason:(unint64_t)a5
{
  BOOL v5 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s node nil", "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  if (!self->_blacklistMetrics)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blacklistMetrics = self->_blacklistMetrics;
    self->_blacklistMetrics = v8;

    if (!self->_blacklistMetrics)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s _blacklistMetrics alloc failed", "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
LABEL_33:
      __int16 v47 = NSString;
      id v13 = v13;
      objc_msgSend(v47, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
      id v45 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v53 = (const char *)[v45 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_34:

      goto LABEL_27;
    }
  }
  uint64_t v10 = [(WFBlackListNode *)self networkDelegate];
  uint64_t v11 = [v10 bssid];

  id v12 = [(WFBlackListNode *)self networkDelegate];
  id v13 = [v12 ssid];

  if (!v11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s bssid nil", "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v45, "UTF8String"));
      id v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v53 = (const char *)[v46 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    goto LABEL_34;
  }
  if (v13)
  {
    if (v5)
    {
      v50 = [MEMORY[0x1E4F28E60] indexSet];
      if ([(NSMutableArray *)self->_blacklistMetrics count])
      {
        unint64_t v14 = 0;
        id v49 = v7;
        do
        {
          id v15 = [(NSMutableArray *)self->_blacklistMetrics objectAtIndex:v14];
          unint64_t v16 = [v15 objectForKeyedSubscript:@"state"];
          uint64_t v17 = [v16 unsignedIntegerValue];
          uint64_t v18 = [v7 blacklistedState];

          if (v17 == v18)
          {
            id v19 = [v15 objectForKeyedSubscript:@"ssid"];
            if (([v19 isEqualToString:v13] & 1) == 0)
            {

LABEL_16:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v30 = [v15 objectForKeyedSubscript:@"ssid"];
                uint64_t v31 = [v15 objectForKeyedSubscript:@"bssid"];
                *(_DWORD *)buf = 136317186;
                uint64_t v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
                __int16 v54 = 2160;
                uint64_t v55 = 1752392040;
                __int16 v56 = 2112;
                id v57 = v30;
                __int16 v58 = 2160;
                uint64_t v59 = 1752392040;
                __int16 v60 = 2112;
                uint64_t v61 = (uint64_t)v31;
                __int16 v62 = 2160;
                uint64_t v63 = 1752392040;
                __int16 v64 = 2112;
                id v65 = v13;
                __int16 v66 = 2160;
                uint64_t v67 = 1752392040;
                __int16 v68 = 2112;
                uint64_t v69 = v11;
                _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s metric ssid:%{mask.hash}@ bssid:%{mask.hash}@ doesnt match with node ssid:%{mask.hash}@ bssid:%{mask.hash}@", buf, 0x5Cu);
              }
              goto LABEL_18;
            }
            uint64_t v20 = [v15 objectForKeyedSubscript:@"bssid"];
            int v21 = [v20 isEqualToString:v11];

            if (!v21) {
              goto LABEL_16;
            }
            id v22 = [MEMORY[0x1E4F1C9C8] date];
            [v22 timeIntervalSince1970];
            double v24 = v23;

            id v25 = NSNumber;
            v26 = [v15 objectForKeyedSubscript:@"blocklistTimestamp"];
            [v26 doubleValue];
            uint64_t v28 = [v25 numberWithDouble:v24 - v27];
            [v15 setObject:v28 forKeyedSubscript:@"blocklistedDuration"];

            v29 = [NSNumber numberWithUnsignedInteger:a5];
            [v15 setObject:v29 forKeyedSubscript:@"unblocklistingReason"];

            [v15 removeObjectForKey:@"ssid"];
            [v15 removeObjectForKey:@"bssid"];
            [v15 removeObjectForKey:@"state"];
            [v15 removeObjectForKey:@"blocklistTimestamp"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              unint64_t v32 = [v15 objectForKeyedSubscript:@"blocklistedDuration"];
              id v33 = [v15 objectForKeyedSubscript:@"unblocklistingReason"];
              long long v34 = [v15 objectForKeyedSubscript:@"prunedCount"];
              *(_DWORD *)buf = 136316930;
              uint64_t v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
              __int16 v54 = 2160;
              uint64_t v55 = 1752392040;
              __int16 v56 = 2112;
              id v57 = v13;
              __int16 v58 = 2160;
              uint64_t v59 = 1752392040;
              __int16 v60 = 2112;
              uint64_t v61 = v11;
              __int16 v62 = 2112;
              uint64_t v63 = (uint64_t)v32;
              __int16 v64 = 2112;
              id v65 = v33;
              __int16 v66 = 2112;
              uint64_t v67 = (uint64_t)v34;
              _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s Finish capturing metric for %{mask.hash}@[%{mask.hash}@] - {duration:%@ unblacklistReason:%@ prunedCount:%@}", buf, 0x52u);
            }
            [v50 addIndex:v14];
            id v7 = v49;
          }
LABEL_18:

          ++v14;
        }
        while (v14 < [(NSMutableArray *)self->_blacklistMetrics count]);
      }
      if ([v50 count])
      {
        uint64_t v44 = [(NSMutableArray *)self->_blacklistMetrics objectsAtIndexes:v50];
        [v44 enumerateObjectsUsingBlock:&__block_literal_global_14];
        [(NSMutableArray *)self->_blacklistMetrics removeObjectsAtIndexes:v50];
      }
    }
    else
    {
      long long v35 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v36 = [NSString stringWithString:v13];
      [v35 setObject:v36 forKeyedSubscript:@"ssid"];

      long long v37 = [NSString stringWithString:v11];
      [v35 setObject:v37 forKeyedSubscript:@"bssid"];

      v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedState"));
      [v35 setObject:v38 forKeyedSubscript:@"state"];

      v39 = NSNumber;
      [v7 blacklistedStateTimestamp];
      uint64_t v40 = objc_msgSend(v39, "numberWithDouble:");
      [v35 setObject:v40 forKeyedSubscript:@"blocklistTimestamp"];

      __int16 v41 = +[WiFiUsagePrivacyFilter sanitizedOUI:v11];
      [v35 setObject:v41 forKeyedSubscript:@"oui"];

      id v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReason"));
      [v35 setObject:v42 forKeyedSubscript:@"blocklistedReason"];

      __int16 v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReasonData"));
      [v35 setObject:v43 forKeyedSubscript:@"blocklistedSubreason"];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]((uint64_t)v13, v11, v35);
      }
      [(NSMutableArray *)self->_blacklistMetrics addObject:v35];
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s ssid nil", "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
      id v48 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v53 = (const char *)[v48 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  id v13 = (id)v11;
LABEL_27:
}

void __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (WFBlacklistNetwork)networkDelegate
{
  return (WFBlacklistNetwork *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNetworkDelegate:(id)a3
{
}

- (NSMutableArray)blacklistTriggers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlacklistTriggers:(id)a3
{
}

- (NSMutableArray)blacklistedStatesCurrent
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBlacklistedStatesCurrent:(id)a3
{
}

- (NSMutableArray)blacklistedStatesHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlacklistedStatesHistory:(id)a3
{
}

- (BOOL)enterprisePolicy
{
  return self->_enterprisePolicy;
}

- (void)setEnterprisePolicy:(BOOL)a3
{
  self->_enterprisePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedStatesHistory, 0);
  objc_storeStrong((id *)&self->_blacklistedStatesCurrent, 0);
  objc_storeStrong((id *)&self->_blacklistTriggers, 0);
  objc_storeStrong((id *)&self->_networkDelegate, 0);

  objc_storeStrong((id *)&self->_blacklistMetrics, 0);
}

- (void)processBlacklistedStateMetric:(uint64_t)a1 unblacklisting:(uint64_t)a2 unblacklistingReason:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 objectForKeyedSubscript:@"oui"];
  id v7 = [a3 objectForKeyedSubscript:@"blocklistedReason"];
  uint64_t v8 = [a3 objectForKeyedSubscript:@"blocklistedSubreason"];
  v13[0] = 136316930;
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = a1;
  __int16 v15 = v9;
  uint64_t v16 = v10;
  __int16 v17 = v11;
  uint64_t v18 = a2;
  __int16 v19 = v11;
  uint64_t v20 = v6;
  __int16 v21 = v11;
  id v22 = v7;
  __int16 v23 = v11;
  uint64_t v24 = v12;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s Begin capturing metric for %{mask.hash}@[%{mask.hash}@] - {oui:%@ blacklistedReason:%@ blacklistedSubreason:%@}", (uint8_t *)v13, 0x52u);
}

@end