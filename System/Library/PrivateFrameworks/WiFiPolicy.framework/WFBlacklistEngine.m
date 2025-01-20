@interface WFBlacklistEngine
+ (id)stringRepresentationWithReason:(unint64_t)a3;
+ (id)stringRepresentationWithState:(unint64_t)a3;
- (BOOL)_evaluateTriggersForBlacklisting:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 ssid:(id)a7 state:(unint64_t)a8;
- (BOOL)_evaluateTriggersForUnblacklisting:(id)a3 unblacklistReason:(unint64_t)a4 ssid:(id)a5;
- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 node:(id)a4;
- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 perSsid:(BOOL)a5 bssid:(id)a6 ssid:(id)a7;
- (BOOL)changeBlacklistingThresholds:(unint64_t)a3 value:(unsigned int)a4 perSsid:(BOOL)a5;
- (BOOL)enabled;
- (BOOL)isNetworkBlacklistedForAutoJoinDueToTrigDisc:(id)a3 rssi:(int64_t *)a4 timestamp:(double *)a5;
- (BOOL)isNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4;
- (BOOL)removeBlacklistedStateForNetworkWithReason:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5;
- (NSMutableArray)bssidThresholds;
- (NSMutableArray)ssidThresholds;
- (WFBlacklistDelegate)blacklistDelegate;
- (WFBlacklistEngine)initWithBlacklistDelegate:(id)a3 profile:(unint64_t)a4;
- (double)autojoinBlacklistExpiry;
- (double)bssBlacklistExpiry;
- (double)wowBlacklistExpiry;
- (id)_findBlacklistNode:(id)a3;
- (id)denyListThreshold:(unint64_t)a3 perSSID:(BOOL)a4;
- (id)getBlacklist;
- (id)retrieveBlacklistedNetworkSsids:(unint64_t)a3;
- (id)retrieveBlacklistedStateHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (id)retrieveNetworksInBlacklistedState:(unint64_t)a3;
- (id)retrieveNetworksInBlacklistedStateHistory:(unint64_t)a3;
- (id)retrieveReasonsForNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (int64_t)getRssiWhenNetworkWasBlacklisted:(id)a3;
- (unint64_t)getBlacklistedNetworkCount;
- (void)_printBlacklist;
- (void)_setBlacklistedState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)clearTriggerForNetworkWithUnblacklistReason:(id)a3 reason:(unint64_t)a4;
- (void)configureBlacklistedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4;
- (void)dealloc;
- (void)networkPruned:(id)a3;
- (void)networkRemovedForSsid:(id)a3;
- (void)removeBlacklistedStateWithUnblacklistType:(unint64_t)a3;
- (void)removeBlacklistedStates;
- (void)removeExpiredBlacklistedState:(unint64_t)a3;
- (void)setAutojoinBlacklistExpiry:(double)a3;
- (void)setBlacklistDelegate:(id)a3;
- (void)setBssBlacklistExpiry:(double)a3;
- (void)setBssidThresholds:(id)a3;
- (void)setDefaultBlacklistThresholds;
- (void)setEnabled:(BOOL)a3;
- (void)setSsidThresholds:(id)a3;
- (void)setTriggerForNetworkWithReason:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6;
- (void)setTriggerForNetworkWithReasonAndState:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 state:(unint64_t)a7;
- (void)setWowBlacklistExpiry:(double)a3;
@end

@implementation WFBlacklistEngine

- (WFBlacklistEngine)initWithBlacklistDelegate:(id)a3 profile:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFBlacklistEngine;
  v7 = [(WFBlacklistEngine *)&v21 init];
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s self alloc failed", "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(WFBlacklistEngine *)v7 setEnabled:0];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s Invalid blacklistDelegate", "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      [(NSMutableArray *)v8->_blacklist removeAllObjects];
      v15 = 0;
      goto LABEL_12;
    }
LABEL_10:
    v17 = NSString;
    id v16 = v16;
    objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
    id v18 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = v19;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    goto LABEL_11;
  }
  [(WFBlacklistEngine *)v8 setBlacklistDelegate:v6];
  [(WFBlacklistEngine *)v8 setWowBlacklistExpiry:600.0];
  [(WFBlacklistEngine *)v8 setAutojoinBlacklistExpiry:300.0];
  [(WFBlacklistEngine *)v8 setBssBlacklistExpiry:300.0];
  v8->_profile = a4;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  blacklist = v8->_blacklist;
  v8->_blacklist = v9;

  if (!v8->_blacklist)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s _blacklist alloc failed", "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:13];
  ssidThresholds = v8->_ssidThresholds;
  v8->_ssidThresholds = (NSMutableArray *)v11;

  if (!v8->_ssidThresholds)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  ssidThresholds alloc failed", "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:13];
  bssidThresholds = v8->_bssidThresholds;
  v8->_bssidThresholds = (NSMutableArray *)v13;

  if (!v8->_bssidThresholds)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  bssidThresholds alloc failed", "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(WFBlacklistEngine *)v8 setDefaultBlacklistThresholds];
  v15 = v8;
LABEL_12:

  return v15;
}

- (void)setDefaultBlacklistThresholds
{
  v3 = [NSNumber numberWithUnsignedInt:1];
  v4 = [(WFBlacklistEngine *)self bssidThresholds];
  [v4 setObject:v3 atIndexedSubscript:0];

  v5 = [NSNumber numberWithUnsignedInt:1];
  id v6 = [(WFBlacklistEngine *)self bssidThresholds];
  [v6 setObject:v5 atIndexedSubscript:1];

  v7 = [NSNumber numberWithUnsignedInt:1];
  v8 = [(WFBlacklistEngine *)self bssidThresholds];
  [v8 setObject:v7 atIndexedSubscript:2];

  v9 = [NSNumber numberWithUnsignedInt:3];
  v10 = [(WFBlacklistEngine *)self bssidThresholds];
  [v10 setObject:v9 atIndexedSubscript:3];

  uint64_t v11 = [NSNumber numberWithUnsignedInt:3];
  v12 = [(WFBlacklistEngine *)self bssidThresholds];
  [v12 setObject:v11 atIndexedSubscript:4];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:10];
  v14 = [(WFBlacklistEngine *)self bssidThresholds];
  [v14 setObject:v13 atIndexedSubscript:5];

  v15 = [NSNumber numberWithUnsignedInt:1];
  id v16 = [(WFBlacklistEngine *)self bssidThresholds];
  [v16 setObject:v15 atIndexedSubscript:6];

  v17 = [NSNumber numberWithUnsignedInt:3];
  id v18 = [(WFBlacklistEngine *)self bssidThresholds];
  [v18 setObject:v17 atIndexedSubscript:7];

  uint64_t v19 = [NSNumber numberWithUnsignedInt:1];
  v20 = [(WFBlacklistEngine *)self ssidThresholds];
  [v20 setObject:v19 atIndexedSubscript:0];

  objc_super v21 = [NSNumber numberWithUnsignedInt:1];
  v22 = [(WFBlacklistEngine *)self ssidThresholds];
  [v22 setObject:v21 atIndexedSubscript:1];

  uint64_t v23 = [NSNumber numberWithUnsignedInt:1];
  uint64_t v24 = [(WFBlacklistEngine *)self ssidThresholds];
  [v24 setObject:v23 atIndexedSubscript:2];

  v25 = [NSNumber numberWithUnsignedInt:5];
  v26 = [(WFBlacklistEngine *)self ssidThresholds];
  [v26 setObject:v25 atIndexedSubscript:3];

  v27 = [NSNumber numberWithUnsignedInt:5];
  v28 = [(WFBlacklistEngine *)self ssidThresholds];
  [v28 setObject:v27 atIndexedSubscript:4];

  v29 = [NSNumber numberWithUnsignedInt:10];
  v30 = [(WFBlacklistEngine *)self ssidThresholds];
  [v30 setObject:v29 atIndexedSubscript:5];

  v31 = [NSNumber numberWithUnsignedInt:1];
  v32 = [(WFBlacklistEngine *)self ssidThresholds];
  [v32 setObject:v31 atIndexedSubscript:6];

  id v34 = [NSNumber numberWithUnsignedInt:3];
  v33 = [(WFBlacklistEngine *)self ssidThresholds];
  [v33 setObject:v34 atIndexedSubscript:7];
}

- (void)dealloc
{
  v3 = [(WFBlacklistEngine *)self ssidThresholds];
  [v3 removeAllObjects];

  v4 = [(WFBlacklistEngine *)self bssidThresholds];
  [v4 removeAllObjects];

  [(NSMutableArray *)self->_blacklist removeAllObjects];
  v5.receiver = self;
  v5.super_class = (Class)WFBlacklistEngine;
  [(WFBlacklistEngine *)&v5 dealloc];
}

- (void)configureBlacklistedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 3uLL:
      if (a3 == 0.0 || a3 > 3600.0)
      {
        v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Out of range WoWBlacklisting timeout value:%f", "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(void *)&a3);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      -[WFBlacklistEngine setWowBlacklistExpiry:](self, "setWowBlacklistExpiry:");
      break;
    case 2uLL:
      if (a3 == 0.0 || a3 > 300.0)
      {
        v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Out of range BssBlacklisting timeout value:%f", "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(void *)&a3);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      -[WFBlacklistEngine setBssBlacklistExpiry:](self, "setBssBlacklistExpiry:");
      break;
    case 1uLL:
      if (a3 != 0.0 && a3 <= 86400.0)
      {
        -[WFBlacklistEngine setAutojoinBlacklistExpiry:](self, "setAutojoinBlacklistExpiry:");
        return;
      }
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Out of range AutojoinBlacklisting timeout value:%f", "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(void *)&a3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
LABEL_27:

      return;
    default:
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Invalid state", a3, "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]");
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
LABEL_26:
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v4, "UTF8String"));
      id v5 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v7 = [v5 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

      goto LABEL_27;
  }
}

- (BOOL)changeBlacklistingThresholds:(unint64_t)a3 value:(unsigned int)a4 perSsid:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v7 = a3 >= 7 || a4 >= 0xFF;
  BOOL v8 = !v7;
  if (v7)
  {
    uint64_t v13 = "perBSSID";
    if (a5) {
      uint64_t v13 = "perSSID";
    }
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Invalid Config Params. type:%s triggerReason:%lu threshCount:%u", "-[WFBlacklistEngine changeBlacklistingThresholds:value:perSsid:]", v13, a3, *(void *)&a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v14, "UTF8String"));
      id v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v15 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    v10 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
    if (v5) {
      [(WFBlacklistEngine *)self ssidThresholds];
    }
    else {
    uint64_t v11 = [(WFBlacklistEngine *)self bssidThresholds];
    }
    [v11 setObject:v10 atIndexedSubscript:a3];
  }
  return v8;
}

- (id)denyListThreshold:(unint64_t)a3 perSSID:(BOOL)a4
{
  if (a4) {
    [(WFBlacklistEngine *)self ssidThresholds];
  }
  else {
  BOOL v5 = [(WFBlacklistEngine *)self bssidThresholds];
  }
  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (void)_setBlacklistedState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
}

- (void)setTriggerForNetworkWithReasonAndState:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 state:(unint64_t)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if ([(WFBlacklistEngine *)self enabled])
  {
    uint64_t v14 = [(WFBlacklistEngine *)self _findBlacklistNode:v12];
    if (v14)
    {
      id v15 = (id)v14;
      id v16 = 0;
    }
    else
    {
      uint64_t v18 = [[WFBlackListNode alloc] initWithBlacklistNetwork:v12];
      if (!v18)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%s BlacklistElement alloc failed", "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v26 = NSString;
          id v24 = v24;
          objc_msgSend(v26, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
          id v27 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446210;
          v29 = (const char *)[v27 UTF8String];
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
        uint64_t v19 = 0;
        id v16 = 0;
        id v15 = 0;
        goto LABEL_17;
      }
      id v16 = v18;
      id v15 = v16;
    }
    if ([(WFBlacklistEngine *)self _ignoreTriggersForDeviceProfile:a4 node:v15])
    {
      uint64_t v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v20 = [v15 networkDelegate];
    uint64_t v19 = [v20 ssid];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
      *(_DWORD *)buf = 136317186;
      v29 = "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]";
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2160;
      uint64_t v37 = 1752392040;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 2048;
      unint64_t v41 = a4;
      __int16 v42 = 2048;
      int64_t v43 = a5;
      __int16 v44 = 2048;
      unint64_t v45 = a7;
      _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Trigger '%@' for '%{mask.hash}@ [%{mask.hash}@]' (reason=%lu reasonData=%ld state=%lu)", buf, 0x5Cu);
    }
    [v15 addBlacklistTrigger:a4 reasonData:a5 bssid:v13];
    BOOL v21 = [(WFBlacklistEngine *)self _evaluateTriggersForBlacklisting:v15 reason:a4 reasonData:a5 bssid:v13 ssid:v19 state:a7];
    if (([(NSMutableArray *)self->_blacklist containsObject:v15] & 1) == 0) {
      [(NSMutableArray *)self->_blacklist addObject:v15];
    }
    [(WFBlacklistEngine *)self _printBlacklist];
    if (!v21) {
      goto LABEL_18;
    }
    v22 = [(WFBlacklistEngine *)self blacklistDelegate];
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0) {
      goto LABEL_18;
    }
    id v24 = [(WFBlacklistEngine *)self blacklistDelegate];
    [v24 blacklistDidUpdate];
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s No Blacklisting", "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = NSString;
    id v15 = v15;
    objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    id v16 = (WFBlackListNode *) objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = (const char *)[(WFBlackListNode *)v16 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
LABEL_19:
  }
}

- (void)setTriggerForNetworkWithReason:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6
{
}

- (BOOL)_evaluateTriggersForBlacklisting:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 ssid:(id)a7 state:(unint64_t)a8
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v105 = a6;
  id v98 = a7;
  if (!v12)
  {
    v95 = objc_msgSend(NSString, "stringWithFormat:", @"%s node is null", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v95, "UTF8String"));
      id v96 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      v116 = (const char *)[v96 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    char v93 = 0;
    goto LABEL_95;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v13 = [v12 blacklistTriggers];
  uint64_t v110 = [v13 countByEnumeratingWithState:&v111 objects:v125 count:16];
  if (!v110)
  {

    char v93 = 0;
    goto LABEL_94;
  }
  uint64_t v97 = 0;
  int v14 = 0;
  int v15 = 0;
  uint64_t v103 = 0;
  unint64_t v104 = 0;
  char v99 = 0;
  uint64_t v109 = *(void *)v112;
  unint64_t v101 = a8 & 0xFFFFFFFFFFFFFFFELL;
  char v102 = 0;
  id v16 = MEMORY[0x1E4F14500];
  id obj = v13;
  unint64_t v107 = a8;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v112 != v109) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v111 + 1) + 8 * v17);
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSince1970];
      double v21 = v20;

      uint64_t v22 = [v18 triggerReason];
      [v18 triggerReasonTimestamp];
      double v24 = v23;
      if ([v12 enterprisePolicy])
      {
        if (a4 <= 7)
        {
          double v25 = v21 - v24;
          if (v21 - v24 <= 300.0)
          {
            v26 = objc_msgSend(v18, "bssid", v25);
            uint64_t v27 = [v26 compare:v105 options:1];

            BOOL v28 = v27 == 0;
            unsigned int v29 = HIDWORD(v103);
            if (!v27) {
              unsigned int v29 = HIDWORD(v103) + 1;
            }
            if (v22 != a4) {
              BOOL v28 = 0;
            }
            uint64_t v30 = (v104 + v28);
            if (v22 == a4) {
              uint64_t v31 = (HIDWORD(v104) + 1);
            }
            else {
              uint64_t v31 = HIDWORD(v104);
            }
            unsigned int v32 = v103 + 1;
            HIDWORD(v103) = v29;
            unint64_t v104 = __PAIR64__(v31, v30);
            LODWORD(v103) = v103 + 1;
            if (v29 > 0x12
              || [(WFBlacklistEngine *)self _meetsThresholds:a4 count:v30 perSsid:0 bssid:v105 ssid:v98]|| v32 > 0x12|| [(WFBlacklistEngine *)self _meetsThresholds:a4 count:v31 perSsid:1 bssid:v105 ssid:v98])
            {
              a8 = v107;
              if (v107 != 5 && v107 != 3)
              {
                __int16 v36 = NSString;
                uint64_t v37 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
                __int16 v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
                id v39 = [v36 stringWithFormat:@"%s WFNetworkBlacklistStateNoWoW ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v37, v38];

                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v39, "UTF8String"));
                  id v40 = objc_claimAutoreleasedReturnValue();
                  uint64_t v41 = [v40 UTF8String];
                  *(_DWORD *)buf = 136446210;
                  v116 = (const char *)v41;
                  _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
                }
                goto LABEL_31;
              }
              [(WFBlacklistEngine *)self _setBlacklistedState:v12 state:3 reason:a4 reasonData:a5];
              char v99 = 1;
            }
            else
            {
LABEL_31:
              a8 = v107;
            }
            id v16 = MEMORY[0x1E4F14500];
            goto LABEL_33;
          }
        }
      }
      if (objc_msgSend(v12, "enterprisePolicy", v25) && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = +[WFBlacklistEngine stringRepresentationWithReason:v22];
        v35 = [v18 bssid];
        *(_DWORD *)buf = 136316162;
        v116 = "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]";
        __int16 v117 = 2112;
        v118 = v34;
        __int16 v119 = 2160;
        uint64_t v120 = 1752392040;
        __int16 v121 = 2112;
        v122 = v35;
        __int16 v123 = 2048;
        double v124 = v21 - v24;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s Trigger %@ for [%{mask.hash}@] was %f seconds ago and outside window. Will not consider for WoW blacklist", buf, 0x34u);

        id v16 = MEMORY[0x1E4F14500];
      }
LABEL_33:
      if (v22 != a4)
      {
        v54 = NSString;
        v55 = +[WFBlacklistEngine stringRepresentationWithReason:v22];
        id v16 = MEMORY[0x1E4F14500];
        v56 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
        v57 = [v54 stringWithFormat:@"%s Reasons differ. TriggerNodeReason: %@ CurrentReason: %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v55, v56];

        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_47;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v57, "UTF8String"));
        id v58 = objc_claimAutoreleasedReturnValue();
        uint64_t v59 = [v58 UTF8String];
        *(_DWORD *)buf = 136446210;
        v116 = (const char *)v59;
        v60 = v16;
        os_log_type_t v61 = OS_LOG_TYPE_DEBUG;
        goto LABEL_46;
      }
      if (a4 > 3)
      {
        if (a4 == 4)
        {
          double v33 = v21 - v24;
          if (v21 - v24 > 300.0) {
            goto LABEL_48;
          }
          LODWORD(v97) = v97 + 1;
          if (v97 >= 3)
          {
            if ((a8 | 4) != 5)
            {
              v89 = NSString;
              v90 = +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", 4, v33);
              v91 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
              v51 = [v89 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v90, v91];

              id v16 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, 4, objc_msgSend(v18, "triggerReasonData", v33));
            char v102 = 1;
          }
        }
      }
      else
      {
        if (a8 != 1 && a8 != 5)
        {
          if (a8 == 3)
          {
            [(WFBlacklistEngine *)self _setBlacklistedState:v12 state:3 reason:a4 reasonData:a5];
            __int16 v42 = NSString;
            int64_t v43 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
            __int16 v44 = [v42 stringWithFormat:@"%s Power Alert Event Generated, Blacklist for WoW, TimeStamp: %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v43];

            unint64_t v45 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
              id v46 = objc_claimAutoreleasedReturnValue();
              uint64_t v47 = [v46 UTF8String];
              *(_DWORD *)buf = 136446210;
              v116 = (const char *)v47;
              _os_log_impl(&dword_1D3CCD000, v45, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
            }
            char v99 = 1;
          }
          v48 = NSString;
          v49 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
          v50 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
          v51 = [v48 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v49, v50];

          id v16 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_42:
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v51, "UTF8String"));
            id v52 = objc_claimAutoreleasedReturnValue();
            uint64_t v53 = [v52 UTF8String];
            *(_DWORD *)buf = 136446210;
            v116 = (const char *)v53;
            _os_log_impl(&dword_1D3CCD000, v16, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }
LABEL_43:

          a8 = v107;
          goto LABEL_56;
        }
        char v102 = 1;
        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, a4, [v18 triggerReasonData]);
      }
LABEL_56:
      BOOL v62 = a4 == 5;
      unsigned int v63 = v15 + 1;
      if (a4 == 5) {
        ++v15;
      }
      if (v63 <= 9) {
        BOOL v62 = 0;
      }
      BOOL v64 = (v14 + 1) > 2;
      if (a4 == 7)
      {
        ++v14;
        BOOL v62 = v64;
      }
      if (v62)
      {
        if ((a8 | 4) == 5)
        {
          -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, a4, [v18 triggerReasonData]);
          char v102 = 1;
        }
        else
        {
          v65 = NSString;
          v66 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
          v67 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
          v68 = [v65 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v66, v67];

          id v16 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v68, "UTF8String"));
            id v69 = objc_claimAutoreleasedReturnValue();
            uint64_t v70 = [v69 UTF8String];
            *(_DWORD *)buf = 136446210;
            v116 = (const char *)v70;
            _os_log_impl(&dword_1D3CCD000, v16, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }
          a8 = v107;
        }
      }
      if (a4 - 11 <= 1)
      {
        if (v101 != 4)
        {
          v76 = NSString;
          v77 = +[WFBlacklistEngine stringRepresentationWithReason:a4];
          v78 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
          v57 = [v76 stringWithFormat:@"%s WFNetworkBlacklistStateTemporarilyUnavailable ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v77, v78];

          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            goto LABEL_47;
          }
LABEL_87:
          objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v57, "UTF8String"));
          id v58 = objc_claimAutoreleasedReturnValue();
          uint64_t v88 = [v58 UTF8String];
          *(_DWORD *)buf = 136446210;
          v116 = (const char *)v88;
          v60 = v16;
          os_log_type_t v61 = OS_LOG_TYPE_INFO;
LABEL_46:
          _os_log_impl(&dword_1D3CCD000, v60, v61, "%{public}s", buf, 0xCu);

          goto LABEL_47;
        }
        uint64_t v71 = [v18 triggerReasonData];
        v72 = self;
        id v73 = v12;
        uint64_t v74 = 4;
        unint64_t v75 = a4;
        goto LABEL_71;
      }
      if (a4 == 8)
      {
        v79 = [v18 bssid];
        uint64_t v80 = [v79 compare:v105 options:1];

        if (v80) {
          unsigned int v81 = HIDWORD(v97);
        }
        else {
          unsigned int v81 = HIDWORD(v97) + 1;
        }
        HIDWORD(v97) = v81;
        if (v81 >= 3)
        {
          if (a8 != 2)
          {
            v85 = NSString;
            v86 = +[WFBlacklistEngine stringRepresentationWithReason:8];
            v87 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
            v57 = [v85 stringWithFormat:@"%s WFNetworkBlacklistReasonBssBlacklist ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v86, v87];

            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_87;
            }
LABEL_47:

            goto LABEL_48;
          }
          uint64_t v71 = [v18 triggerReasonData];
          v72 = self;
          id v73 = v12;
          uint64_t v74 = 2;
          unint64_t v75 = 8;
LABEL_71:
          [(WFBlacklistEngine *)v72 _setBlacklistedState:v73 state:v74 reason:v75 reasonData:v71];
          char v102 = 1;
        }
      }
      else if (a4 == 6)
      {
        if ((a8 | 4) != 5)
        {
          v82 = NSString;
          v83 = +[WFBlacklistEngine stringRepresentationWithReason:6];
          v84 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
          v57 = [v82 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v83, v84];

          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            goto LABEL_47;
          }
          goto LABEL_87;
        }
        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, 6, [v18 triggerReasonData]);
        char v102 = 1;
      }
LABEL_48:
      ++v17;
    }
    while (v110 != v17);
    uint64_t v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16, v33);
    uint64_t v110 = v92;
  }
  while (v92);

  char v93 = v102;
  if (v99)
  {
    [v12 addBlacklistedStateHistory:0 state:a8 reason:a4 reasonData:a5];
    char v93 = 1;
  }
LABEL_94:
  [(WFBlacklistEngine *)self _printBlacklist];
LABEL_95:

  return v93 & 1;
}

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 node:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_profile != 2)
  {
    if (([v6 enterprisePolicy] & 1) != 0
      || ([v7 networkDelegate],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isProfileBased],
          v13,
          v14))
    {
      int v15 = [(WFBlacklistEngine *)self blacklistDelegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        char v25 = 0;
        unsigned int v24 = 0;
        uint64_t v17 = [(WFBlacklistEngine *)self blacklistDelegate];
        int v18 = [v17 retrieveBatteryInfo:&v25 batteryLevel:&v24];

        if (v18)
        {
          if (v25)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%s BlacklistTrigger %lu ignored as device connected to external power supply", "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", a3);
            id v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_5;
            }
            goto LABEL_21;
          }
          if (a3 == 2 && v24 >= 0x51)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%s BlacklistTrigger %lu ignored as battery level is %d", "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", 2, v24);
            id v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_5;
            }
LABEL_21:
            uint64_t v22 = NSString;
            id v8 = v8;
            objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
            id v9 = objc_claimAutoreleasedReturnValue();
            uint64_t v23 = [v9 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v27 = v23;
            v10 = MEMORY[0x1E4F14500];
            os_log_type_t v11 = OS_LOG_TYPE_ERROR;
            goto LABEL_4;
          }
        }
      }
      else
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s Delegate does not respond to blacklistProfileBatteryInfo", "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]");
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
          id v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446210;
          uint64_t v27 = [v20 UTF8String];
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s BlacklistTrigger %lu ignored for %lu", "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", a3, 2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
    id v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v9 UTF8String];
    v10 = MEMORY[0x1E4F14500];
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_4:
    _os_log_impl(&dword_1D3CCD000, v10, v11, "%{public}s", buf, 0xCu);
  }
LABEL_5:

  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)removeBlacklistedStateForNetworkWithReason:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = [(WFBlacklistEngine *)self _findBlacklistNode:a3];
  BOOL v9 = v8 != 0;
  if (!v8)
  {
LABEL_17:
    [(WFBlacklistEngine *)self _printBlacklist];
    goto LABEL_18;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10)
  {
    os_log_type_t v11 = v10;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v12 = [v8 blacklistedStatesCurrent];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v17 blacklistedState] == a4 && objc_msgSend(v17, "blacklistedReason") == a5) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke;
    v26[3] = &unk_1E69BE488;
    id v18 = v8;
    id v27 = v18;
    [v11 enumerateObjectsUsingBlock:v26];
    uint64_t v19 = [v18 blacklistedStatesCurrent];
    [v19 removeObjectsInArray:v11];

    if ([v11 count])
    {
      id v20 = [(WFBlacklistEngine *)self blacklistDelegate];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        uint64_t v22 = [(WFBlacklistEngine *)self blacklistDelegate];
        [v22 blacklistDidUpdate];
      }
    }
    [v11 removeAllObjects];

    BOOL v9 = v8 != 0;
    goto LABEL_17;
  }
  unsigned int v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s discardedNodes is null", "-[WFBlacklistEngine removeBlacklistedStateForNetworkWithReason:state:reason:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
    id v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v34 = [v25 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

uint64_t __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:1];
}

- (void)removeBlacklistedStateWithUnblacklistType:(unint64_t)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v7 = v6;
  v87 = v5;
  if (!v5)
  {
    v76 = objc_msgSend(NSString, "stringWithFormat:", @"%s discardedNodes is null", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_77;
  }
  unint64_t v8 = 0x1E4F29000uLL;
  if (!v6)
  {
    v76 = objc_msgSend(NSString, "stringWithFormat:", @"%s discardedBlacklistNodes is null", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_76:
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v76, "UTF8String"));
      id v77 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v106 = [v77 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
LABEL_77:

    goto LABEL_72;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = self->_blacklist;
  uint64_t v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  int v9 = 0;
  if (!v82) {
    goto LABEL_64;
  }
  id v10 = 0;
  uint64_t v81 = *(void *)v102;
  os_log_type_t v11 = MEMORY[0x1E4F14500];
  v78 = v7;
  v86 = self;
  do
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10;
    do
    {
      if (*(void *)v102 != v81) {
        objc_enumerationMutation(obj);
      }
      uint64_t v84 = v12;
      id v10 = *(id *)(*((void *)&v101 + 1) + 8 * v12);

      if (a3 == 1)
      {
        uint64_t v14 = [v10 blacklistTriggers];
        [v14 removeAllObjects];

        uint64_t v15 = [v10 blacklistedStatesCurrent];
        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke;
        v99[3] = &unk_1E69BE488;
        id v16 = v10;
        id v100 = v16;
        [v15 enumerateObjectsUsingBlock:v99];

        uint64_t v17 = [v16 blacklistedStatesCurrent];
        [v17 removeAllObjects];

        [v7 addObject:v16];
        int v9 = 1;
        id v18 = v100;
        goto LABEL_61;
      }
      int v80 = v9;
      uint64_t v19 = [v10 networkDelegate];
      id v18 = [v19 ssid];

      id v20 = [v10 networkDelegate];
      v85 = [v20 bssid];

      char v21 = [v10 networkDelegate];
      BOOL v22 = [(WFBlacklistEngine *)self isNetworkInBlacklistedState:v21 state:1];

      double v23 = 0.0;
      id v83 = v10;
      if (v22)
      {
        unsigned int v24 = [v10 blacklistTriggers];
        [v24 removeAllObjects];

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v25 = [v10 blacklistedStatesCurrent];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v95 objects:v116 count:16];
        if (!v26) {
          goto LABEL_38;
        }
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v96;
        while (1)
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v96 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = *(void **)(*((void *)&v95 + 1) + 8 * v29);
            if ([v30 blacklistedState] != 1) {
              goto LABEL_28;
            }
            if ([v30 blacklistedReason] == 6) {
              goto LABEL_32;
            }
            if (a3 != 3) {
              goto LABEL_25;
            }
            [v30 blacklistedStateTimestamp];
            if (v31 > v23)
            {
              [v30 blacklistedStateTimestamp];
              double v23 = v32;
            }
            double v33 = [MEMORY[0x1E4F1C9C8] date];
            [v33 timeIntervalSince1970];
            double v35 = v34;

            [(WFBlacklistEngine *)v86 autojoinBlacklistExpiry];
            __int16 v36 = *(void **)(v8 + 24);
            if (v35 - v23 > v37)
            {
              __int16 v38 = [v36 stringWithFormat:@"Network '%@' is due for unblacklisting", v18];
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v38, "UTF8String"));
                id v39 = objc_claimAutoreleasedReturnValue();
                uint64_t v40 = [v39 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v106 = v40;
                _os_log_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                unint64_t v8 = 0x1E4F29000uLL;
              }

LABEL_25:
              uint64_t v41 = [*(id *)(v8 + 24) stringWithFormat:@"%s Unblacklisting network '%@' for autojoin ", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18];
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v41, "UTF8String"));
                id v42 = objc_claimAutoreleasedReturnValue();
                uint64_t v43 = [v42 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v106 = v43;
                _os_log_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                unint64_t v8 = 0x1E4F29000uLL;
              }

              [v87 addObject:v30];
LABEL_28:
              if ([v30 blacklistedState] == 3)
              {
                __int16 v44 = [*(id *)(v8 + 24) stringWithFormat:@"%s Unblacklisting network '%@' for WoW ", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18];
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
                  id v45 = objc_claimAutoreleasedReturnValue();
                  uint64_t v46 = [v45 UTF8String];
                  *(_DWORD *)buf = 136446210;
                  uint64_t v106 = v46;
                  _os_log_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                  unint64_t v8 = 0x1E4F29000;
                }

                [v87 addObject:v30];
              }
              goto LABEL_32;
            }
            uint64_t v47 = [v36 stringWithFormat:@"Skip unblacklisting network '%@' - not due.", v18];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v47, "UTF8String"));
              id v48 = objc_claimAutoreleasedReturnValue();
              uint64_t v49 = [v48 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v106 = v49;
              _os_log_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              unint64_t v8 = 0x1E4F29000;
            }

LABEL_32:
            ++v29;
          }
          while (v27 != v29);
          uint64_t v50 = [v25 countByEnumeratingWithState:&v95 objects:v116 count:16];
          uint64_t v27 = v50;
          if (!v50)
          {
LABEL_38:

            BOOL v7 = v78;
            self = v86;
            id v10 = v83;
            break;
          }
        }
      }
      v51 = [v10 networkDelegate];
      BOOL v52 = [(WFBlacklistEngine *)self isNetworkInBlacklistedState:v51 state:2];

      if (!v52) {
        goto LABEL_60;
      }
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      uint64_t v53 = [v10 blacklistedStatesCurrent];
      uint64_t v54 = [v53 countByEnumeratingWithState:&v91 objects:v115 count:16];
      if (!v54) {
        goto LABEL_59;
      }
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v92 != v56) {
            objc_enumerationMutation(v53);
          }
          id v58 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if ([v58 blacklistedState] == 2)
          {
            if (a3 != 3) {
              goto LABEL_52;
            }
            [v58 blacklistedStateTimestamp];
            if (v59 > v23)
            {
              [v58 blacklistedStateTimestamp];
              double v23 = v60;
            }
            os_log_type_t v61 = [MEMORY[0x1E4F1C9C8] date];
            [v61 timeIntervalSince1970];
            double v63 = v62;

            double v64 = v63 - v23;
            [(WFBlacklistEngine *)v86 bssBlacklistExpiry];
            double v66 = v65;
            BOOL v67 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (v64 > v66)
            {
              if (v67)
              {
                *(_DWORD *)buf = 141558786;
                uint64_t v106 = 1752392040;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v18;
                __int16 v109 = 2160;
                uint64_t v110 = 1752392040;
                __int16 v111 = 2112;
                uint64_t v112 = (uint64_t)v85;
                _os_log_error_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "BSS '%{mask.hash}@[%{mask.hash}@]' is due for unblacklisting", buf, 0x2Au);
              }
LABEL_52:
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v106 = (uint64_t)"-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]";
                __int16 v107 = 2160;
                uint64_t v108 = 1752392040;
                __int16 v109 = 2112;
                uint64_t v110 = (uint64_t)v18;
                __int16 v111 = 2160;
                uint64_t v112 = 1752392040;
                __int16 v113 = 2112;
                long long v114 = v85;
                _os_log_error_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "%s Unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' for autojoin ", buf, 0x34u);
              }
              [v87 addObject:v58];
              continue;
            }
            if (v67)
            {
              *(_DWORD *)buf = 141558786;
              uint64_t v106 = 1752392040;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v18;
              __int16 v109 = 2160;
              uint64_t v110 = 1752392040;
              __int16 v111 = 2112;
              uint64_t v112 = (uint64_t)v85;
              _os_log_error_impl(&dword_1D3CCD000, v11, OS_LOG_TYPE_ERROR, "Skip unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' - not due.", buf, 0x2Au);
            }
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v91 objects:v115 count:16];
      }
      while (v55);
LABEL_59:

      BOOL v7 = v78;
      self = v86;
      id v10 = v83;
LABEL_60:
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_107;
      v88[3] = &unk_1E69BE4B0;
      unint64_t v90 = a3;
      id v68 = v10;
      id v89 = v68;
      [v87 enumerateObjectsUsingBlock:v88];
      id v69 = [v68 blacklistedStatesCurrent];
      [v69 removeObjectsInArray:v87];

      int v9 = ([v87 count] != 0) | v80;
      id v10 = v83;
      [v87 removeAllObjects];

      unint64_t v8 = 0x1E4F29000uLL;
LABEL_61:

      uint64_t v12 = v84 + 1;
      uint64_t v13 = v10;
    }
    while (v84 + 1 != v82);
    uint64_t v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  }
  while (v82);

LABEL_64:
  if ([v7 count])
  {
    uint64_t v70 = objc_msgSend(NSString, "stringWithFormat:", @"%s Unblacklisting all networks", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v70, "UTF8String"));
      id v71 = objc_claimAutoreleasedReturnValue();
      uint64_t v72 = [v71 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v106 = v72;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    [(NSMutableArray *)self->_blacklist removeObjectsInArray:v7];
  }
  if (v9)
  {
    id v73 = [(WFBlacklistEngine *)self blacklistDelegate];
    char v74 = objc_opt_respondsToSelector();

    if (v74)
    {
      unint64_t v75 = [(WFBlacklistEngine *)self blacklistDelegate];
      [v75 blacklistDidUpdate];
    }
  }
  [(WFBlacklistEngine *)self _printBlacklist];
LABEL_72:
}

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:2];
}

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_107(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v3 == 2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 4 * (v3 == 3);
  }
  return [v2 processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:v5];
}

- (void)removeExpiredBlacklistedState:(unint64_t)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = self->_blacklist;
    uint64_t v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    id v6 = 0;
    if (v82)
    {
      uint64_t v81 = *(void *)v95;
      v85 = v5;
      v87 = self;
LABEL_4:
      uint64_t v7 = 0;
      unint64_t v8 = v6;
      while (1)
      {
        if (*(void *)v95 != v81) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v94 + 1) + 8 * v7);

        int v9 = [v6 blacklistedStatesCurrent];

        if (v9) {
          break;
        }
LABEL_64:
        ++v7;
        unint64_t v8 = v6;
        if (v7 == v82)
        {
          uint64_t v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v94 objects:v99 count:16];
          if (!v82)
          {
            id v74 = v6;
            id v6 = 0;
            goto LABEL_67;
          }
          goto LABEL_4;
        }
      }
      id v10 = [v6 networkDelegate];
      uint64_t v11 = [v10 ssid];

      v86 = (void *)v11;
      if (v11)
      {
        uint64_t v12 = [v6 blacklistedStatesHistory];
        uint64_t v13 = [v12 count];

        double v14 = 0.0;
        if (v13) {
          BOOL v15 = (int)v13 < 1;
        }
        else {
          BOOL v15 = 1;
        }
        uint64_t v84 = v7;
        if (!v15)
        {
          uint64_t v16 = v13 + 1;
          while (1)
          {
            uint64_t v17 = [v6 blacklistedStatesHistory];
            id v18 = [v17 objectAtIndex:(v16 - 2)];

            if (v18)
            {
              if ([v18 blacklistedState] == a3 || objc_msgSend(v18, "blacklistedState") == 5) {
                break;
              }
            }

            if ((unint64_t)--v16 <= 1) {
              goto LABEL_20;
            }
          }
          [v18 blacklistedStateTimestamp];
          double v14 = v19;
        }
LABEL_20:
        unint64_t v20 = 0x1E4F29000uLL;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v83 = v6;
        char v21 = [v6 blacklistedStatesCurrent];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v90 objects:v98 count:16];
        if (!v22) {
          goto LABEL_58;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v91;
LABEL_22:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v91 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v90 + 1) + 8 * v25);
          uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
          [v27 timeIntervalSince1970];
          double v29 = v28;

          if ([v26 blacklistedState] != a3 || objc_msgSend(v26, "blacklistedState") != 3) {
            goto LABEL_38;
          }
          [(WFBlacklistEngine *)self wowBlacklistExpiry];
          if (v14 != 0.0) {
            break;
          }
          objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s No history for most recent blacklisting time!!", "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          double v32 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
LABEL_52:

LABEL_53:
          if (v23 == ++v25)
          {
            uint64_t v68 = [v21 countByEnumeratingWithState:&v90 objects:v98 count:16];
            uint64_t v23 = v68;
            if (!v68)
            {
LABEL_58:

              v88[0] = MEMORY[0x1E4F143A8];
              v88[1] = 3221225472;
              v88[2] = __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke;
              v88[3] = &unk_1E69BE488;
              id v6 = v83;
              id v69 = v83;
              id v89 = v69;
              id v5 = v85;
              [v85 enumerateObjectsUsingBlock:v88];
              uint64_t v70 = [v69 blacklistedStatesCurrent];
              [v70 removeObjectsInArray:v85];

              if ([v85 count])
              {
                id v71 = [(WFBlacklistEngine *)self blacklistDelegate];
                char v72 = objc_opt_respondsToSelector();

                uint64_t v7 = v84;
                if (v72)
                {
                  id v73 = [(WFBlacklistEngine *)self blacklistDelegate];
                  [v73 blacklistDidUpdate];
                }
                [v85 removeAllObjects];
                [(WFBlacklistEngine *)self _printBlacklist];
              }
              else
              {
                [v85 removeAllObjects];
                uint64_t v7 = v84;
              }

              goto LABEL_64;
            }
            goto LABEL_22;
          }
        }
        double v36 = v30;
        if ([v26 blacklistedReason] == 2)
        {
          [v26 blacklistedStateTimestamp];
          if (v29 - v37 <= 3600.0)
          {
            objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s Skipping blacklist expiration: recent power alert", "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            double v32 = MEMORY[0x1E4F14500];
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_52;
            }
LABEL_29:
            double v33 = *(void **)(v20 + 24);
            id v31 = v31;
            objc_msgSend(v33, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
            id v34 = objc_claimAutoreleasedReturnValue();
            uint64_t v35 = [v34 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v101 = v35;
            _os_log_impl(&dword_1D3CCD000, v32, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

            goto LABEL_52;
          }
        }
        __int16 v38 = objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s timeDiff :%f expiry :%f ", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v29 - v14, *(void *)&v36);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v38, "UTF8String"));
          id v39 = objc_claimAutoreleasedReturnValue();
          uint64_t v40 = [v39 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v101 = v40;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          self = v87;
        }

        if (v29 - v14 > v36)
        {
          uint64_t v41 = [v26 blacklistedStateString];
          [v26 blacklistedStateTimestamp];
          id v42 = *(void **)(v20 + 24);
          uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
          __int16 v44 = [v42 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v41, v43, v86];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
            id v45 = objc_claimAutoreleasedReturnValue();
            uint64_t v46 = [v45 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v101 = v46;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }
          [v85 addObject:v26];

          self = v87;
          unint64_t v20 = 0x1E4F29000uLL;
        }
LABEL_38:
        if ([v26 blacklistedState] == a3
          && [v26 blacklistedState] == 2
          && [v26 blacklistedReason] == 8)
        {
          [(WFBlacklistEngine *)self bssBlacklistExpiry];
          double v48 = v47;
          uint64_t v49 = *(void **)(v20 + 24);
          [v26 blacklistedStateTimestamp];
          v51 = objc_msgSend(v49, "stringWithFormat:", @"%s timeDiff :%f expiry :%f ", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v29 - v50, *(void *)&v48);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v51, "UTF8String"));
            id v52 = objc_claimAutoreleasedReturnValue();
            uint64_t v53 = [v52 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v101 = v53;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }
          [v26 blacklistedStateTimestamp];
          unint64_t v20 = 0x1E4F29000uLL;
          if (v29 - v54 > v48)
          {
            uint64_t v55 = [v26 blacklistedStateString];
            [v26 blacklistedStateTimestamp];
            uint64_t v56 = NSString;
            v57 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
            id v58 = [v56 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v55, v57, v86];

            double v59 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v58, "UTF8String"));
              id v60 = objc_claimAutoreleasedReturnValue();
              uint64_t v61 = [v60 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v101 = v61;
              _os_log_impl(&dword_1D3CCD000, v59, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
            }
            [v85 addObject:v26];

            self = v87;
            unint64_t v20 = 0x1E4F29000uLL;
          }
        }
        if ([v26 blacklistedState] != a3 || objc_msgSend(v26, "blacklistedState") != 4) {
          goto LABEL_53;
        }
        id v31 = [v26 blacklistedStateString];
        [v26 blacklistedStateTimestamp];
        double v62 = *(void **)(v20 + 24);
        double v63 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
        double v64 = [v62 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v31, v63, v86];

        double v65 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v64, "UTF8String"));
          id v66 = objc_claimAutoreleasedReturnValue();
          uint64_t v67 = [v66 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v101 = v67;
          _os_log_impl(&dword_1D3CCD000, v65, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
        [v85 addObject:v26];
        self = v87;
        unint64_t v20 = 0x1E4F29000;
        goto LABEL_52;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"%s SSID is null", "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        unint64_t v75 = NSString;
        id v74 = v74;
        objc_msgSend(v75, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v74, "UTF8String"));
        id v76 = objc_claimAutoreleasedReturnValue();
        uint64_t v77 = [v76 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v101 = v77;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }
LABEL_67:
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s discardedNodes is null", "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v78 = NSString;
      id v6 = v6;
      objc_msgSend(v78, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
      id v79 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v101 = [v79 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:5];
}

- (void)removeBlacklistedStates
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Clearing all blacklisted networks: ", "-[WFBlacklistEngine removeBlacklistedStates]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v26 = [v4 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  if ([(NSMutableArray *)self->_blacklist count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = self->_blacklist;
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v16 = self;
      id v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(id *)(*((void *)&v20 + 1) + 8 * i);

          [v5 addObject:v11];
          uint64_t v12 = [v11 blacklistedStatesCurrent];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke;
          v18[3] = &unk_1E69BE488;
          id v8 = v11;
          id v19 = v8;
          [v12 enumerateObjectsUsingBlock:v18];
        }
        uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);

      self = v16;
    }

    [(NSMutableArray *)self->_blacklist removeObjectsInArray:v5];
    uint64_t v13 = [(WFBlacklistEngine *)self blacklistDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      BOOL v15 = [(WFBlacklistEngine *)self blacklistDelegate];
      [v15 blacklistDidUpdate];
    }
  }
  else
  {
    id v5 = 0;
  }
  [(WFBlacklistEngine *)self _printBlacklist];
}

uint64_t __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:6];
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(id)a3 reason:(unint64_t)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    [(WFBlacklistEngine *)self _printBlacklist];
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Unblacklisting all networks", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
      id v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      id v89 = (const char *)[v7 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
    [(WFBlacklistEngine *)self removeBlacklistedStates];
  }
  id v8 = [(WFBlacklistEngine *)self _findBlacklistNode:v5];
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:](v5);
    }
    goto LABEL_85;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v9)
  {
    id v58 = objc_msgSend(NSString, "stringWithFormat:", @"%s discardedNodes is null", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v58, "UTF8String"));
      id v59 = objc_claimAutoreleasedReturnValue();
      uint64_t v60 = [v59 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v89 = (const char *)v60;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
LABEL_85:
    id v69 = 0;
    id v73 = 0;
    id v74 = 0;
    id v10 = 0;
    goto LABEL_79;
  }
  id v10 = v9;
  id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v74)
  {
    id v11 = [v8 networkDelegate];
    uint64_t v12 = [v11 ssid];

    id v73 = (void *)v12;
    if (v12)
    {
      uint64_t v70 = self;
      uint64_t v13 = [v8 networkDelegate];
      id v69 = [v13 bssid];

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      char v14 = [v8 blacklistedStatesCurrent];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v83 objects:v105 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v84;
        id v18 = MEMORY[0x1E4F14500];
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v84 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v20 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            if ([v20 blacklistedState] == 1)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040;
                __int16 v92 = 2112;
                long long v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040;
                __int16 v96 = 2112;
                long long v97 = v69;
                _os_log_error_impl(&dword_1D3CCD000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from Autojoin blacklist", buf, 0x34u);
              }
              [v10 addObject:v20];
            }
            if ([v20 blacklistedState] == 3
              && [(WFBlacklistEngine *)v70 _evaluateTriggersForUnblacklisting:v8 unblacklistReason:a4 ssid:v73])
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040;
                __int16 v92 = 2112;
                long long v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040;
                __int16 v96 = 2112;
                long long v97 = v69;
                _os_log_error_impl(&dword_1D3CCD000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from WoW blacklist", buf, 0x34u);
              }
              [v10 addObject:v20];
            }
            if ([v20 blacklistedState] == 2)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040;
                __int16 v92 = 2112;
                long long v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040;
                __int16 v96 = 2112;
                long long v97 = v69;
                _os_log_error_impl(&dword_1D3CCD000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from BSS blacklist", buf, 0x34u);
              }
              [v10 addObject:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v83 objects:v105 count:16];
        }
        while (v16);
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id obj = [v8 blacklistTriggers];
      uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v104 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        long long v23 = MEMORY[0x1E4F14500];
        uint64_t v24 = *(void *)v80;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v80 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void **)(*((void *)&v79 + 1) + 8 * v25);
            uint64_t v27 = [v26 triggerReasonString];
            [v26 triggerReasonTimestamp];
            double v29 = v28;
            double v30 = [MEMORY[0x1E4F1C9C8] date];
            [v30 timeIntervalSince1970];
            double v32 = v31;

            if (![v26 triggerReason]
              || [v26 triggerReason] == 1
              || [v26 triggerReason] == 5
              || [v26 triggerReason] == 7
              || [v26 triggerReason] == 2
              || [v26 triggerReason] == 3
              || [v26 triggerReason] == 11
              || [v26 triggerReason] == 12)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                double v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v29];
                *(_DWORD *)buf = 136316674;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v27;
                __int16 v92 = 2112;
                long long v93 = v33;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040;
                __int16 v96 = 2112;
                long long v97 = v73;
                __int16 v98 = 2160;
                uint64_t v99 = 1752392040;
                __int16 v100 = 2112;
                uint64_t v101 = v69;
                id v34 = v23;
                uint64_t v35 = "%s Clearing trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
                goto LABEL_47;
              }
              goto LABEL_43;
            }
            if (a4 == 1)
            {
              double v37 = v32 - v29;
              if ([v26 triggerReason] == 4 && v29 != 0.0 && v37 > 300.0)
              {
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  double v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v29];
                  *(_DWORD *)buf = 136316674;
                  id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                  __int16 v90 = 2112;
                  uint64_t v91 = (uint64_t)v27;
                  __int16 v92 = 2112;
                  long long v93 = v33;
                  __int16 v94 = 2160;
                  uint64_t v95 = 1752392040;
                  __int16 v96 = 2112;
                  long long v97 = v73;
                  __int16 v98 = 2160;
                  uint64_t v99 = 1752392040;
                  __int16 v100 = 2112;
                  uint64_t v101 = v69;
                  id v34 = v23;
                  uint64_t v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
LABEL_47:
                  uint32_t v36 = 72;
LABEL_48:
                  _os_log_error_impl(&dword_1D3CCD000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                }
                goto LABEL_43;
              }
              if ([v26 triggerReason] == 8 && v29 != 0.0)
              {
                [(WFBlacklistEngine *)v70 bssBlacklistExpiry];
                if (v37 > v38)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    double v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v29];
                    [v26 triggerReasonTimestamp];
                    *(_DWORD *)buf = 136316930;
                    id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                    __int16 v90 = 2112;
                    uint64_t v91 = (uint64_t)v27;
                    __int16 v92 = 2112;
                    long long v93 = v33;
                    __int16 v94 = 2160;
                    uint64_t v95 = 1752392040;
                    __int16 v96 = 2112;
                    long long v97 = v73;
                    __int16 v98 = 2160;
                    uint64_t v99 = 1752392040;
                    __int16 v100 = 2112;
                    uint64_t v101 = v69;
                    __int16 v102 = 2048;
                    unint64_t v103 = (unint64_t)(v32 - v39);
                    id v34 = v23;
                    uint64_t v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@] (diff:%lu)'";
                    uint32_t v36 = 82;
                    goto LABEL_48;
                  }
LABEL_43:
                  [v74 addObject:v26];
                  goto LABEL_44;
                }
              }
            }
            double v40 = dbl_1D3D95D80[[v26 triggerReason] == 2];
            [v26 triggerReasonTimestamp];
            if (v32 - v41 > v40)
            {
              id v67 = (id)NSString;
              id v42 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v32];
              id v68 = [v67 stringWithFormat:@"%s Clearing(expired) trigger %@ (%@) for '%@'", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]", v27, v42, v73];

              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v68, "UTF8String"));
                id v43 = objc_claimAutoreleasedReturnValue();
                uint64_t v44 = [v43 UTF8String];
                *(_DWORD *)buf = 136446210;
                id v89 = (const char *)v44;
                _os_log_impl(&dword_1D3CCD000, v23, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
              }
              goto LABEL_43;
            }
LABEL_44:

            ++v25;
          }
          while (v22 != v25);
          uint64_t v45 = [obj countByEnumeratingWithState:&v79 objects:v104 count:16];
          uint64_t v22 = v45;
        }
        while (v45);
      }

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v10 = v10;
      uint64_t v46 = [v10 countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v76 != v48) {
              objc_enumerationMutation(v10);
            }
            [v8 processBlacklistedStateMetric:*(void *)(*((void *)&v75 + 1) + 8 * j) unblacklisting:1 unblacklistingReason:7];
          }
          uint64_t v47 = [v10 countByEnumeratingWithState:&v75 objects:v87 count:16];
        }
        while (v47);
      }

      double v50 = [v8 blacklistedStatesCurrent];
      [v50 removeObjectsInArray:v10];

      v51 = [v8 blacklistTriggers];
      [v51 removeObjectsInArray:v74];

      if ([v10 count])
      {
        id v52 = [(WFBlacklistEngine *)v70 blacklistDelegate];
        char v53 = objc_opt_respondsToSelector();

        if (v53)
        {
          double v54 = [(WFBlacklistEngine *)v70 blacklistDelegate];
          [v54 blacklistDidUpdate];
        }
      }
      uint64_t v55 = [v8 blacklistedStatesCurrent];
      if ([v55 count])
      {
      }
      else
      {
        uint64_t v56 = [v8 blacklistTriggers];
        uint64_t v57 = [v56 count];

        if (!v57) {
          [(NSMutableArray *)v70->_blacklist removeObject:v8];
        }
      }
    }
    else
    {
      double v64 = objc_msgSend(NSString, "stringWithFormat:", @"%s SSID is null", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v64, "UTF8String"));
        id v65 = objc_claimAutoreleasedReturnValue();
        uint64_t v66 = [v65 UTF8String];
        *(_DWORD *)buf = 136446210;
        id v89 = (const char *)v66;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }
      id v69 = 0;
      id v73 = 0;
    }
  }
  else
  {
    uint64_t v61 = objc_msgSend(NSString, "stringWithFormat:", @"%s discardedNodes is null", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v61, "UTF8String"));
      id v62 = objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [v62 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v89 = (const char *)v63;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    id v69 = 0;
    id v73 = 0;
    id v74 = 0;
  }
LABEL_79:
  [v10 removeAllObjects];
  [v74 removeAllObjects];
}

- (BOOL)_evaluateTriggersForUnblacklisting:(id)a3 unblacklistReason:(unint64_t)a4 ssid:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 blacklistedStatesHistory];
  uint64_t v9 = [v8 count];

  id v10 = [(WFBlacklistEngine *)self blacklistDelegate];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    double v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s Delegate does not respond to isUserModeInteractive", "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
      id v32 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = [v32 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    goto LABEL_24;
  }
  uint64_t v12 = [(WFBlacklistEngine *)self blacklistDelegate];
  int v13 = [v12 isUserModeInteractive];

  char v14 = "non-interactive";
  if (v13) {
    char v14 = "interactive";
  }
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s User mode %s ", "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]", v14);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    id v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = [v16 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  if (v13)
  {
LABEL_24:
    LOBYTE(v17) = 1;
    goto LABEL_25;
  }
  id v34 = v7;
  unint64_t v35 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v17 = [v7 blacklistedStatesHistory];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    char v21 = 0;
    uint64_t v22 = *(void *)v37;
    uint64_t v23 = v9 - 1;
    unint64_t v24 = 13;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v26 blacklistedState] != 1)
        {
          if ([v26 blacklistedReason] == 2)
          {
            uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
            [v27 timeIntervalSince1970];
            double v29 = v28;

            [v26 blacklistedStateTimestamp];
            v21 |= v29 - v30 < 21600.0;
          }
          if (v20 == v23) {
            unint64_t v24 = [v26 blacklistedReason];
          }
          ++v20;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }
  else
  {
    char v21 = 0;
    unint64_t v24 = 13;
  }

  LOBYTE(v17) = 0;
  if (v35 != 1 || (v21 & 1) != 0)
  {
    id v7 = v34;
  }
  else
  {
    id v7 = v34;
    if (v24 <= 7) {
      LODWORD(v17) = (0xB0u >> v24) & 1;
    }
  }
LABEL_25:

  return (char)v17;
}

- (void)networkPruned:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = self->_blacklist;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v24 = self;
      id v25 = v4;
      id v8 = 0;
      uint64_t v9 = *(void *)v27;
      id v10 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v8;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(id *)(*((void *)&v26 + 1) + 8 * v11);

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            int v13 = [v8 networkDelegate];
            char v14 = [v13 ssid];
            uint64_t v15 = [v8 networkDelegate];
            id v16 = [v15 bssid];
            *(_DWORD *)buf = 136316162;
            double v31 = "-[WFBlacklistEngine networkPruned:]";
            __int16 v32 = 2160;
            uint64_t v33 = 1752392040;
            __int16 v34 = 2112;
            unint64_t v35 = v14;
            __int16 v36 = 2160;
            uint64_t v37 = 1752392040;
            __int16 v38 = 2112;
            long long v39 = v16;
            _os_log_error_impl(&dword_1D3CCD000, v10, OS_LOG_TYPE_ERROR, "%s blacklistedNode %{mask.hash}@[%{mask.hash}@]", buf, 0x34u);
          }
          ++v11;
          uint64_t v12 = v8;
        }
        while (v7 != v11);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v7);

      self = v24;
      id v4 = v25;
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[WFBlacklistEngine networkPruned:](v4);
    }
    uint64_t v17 = [(WFBlacklistEngine *)self _findBlacklistNode:v4];
    if (v17)
    {
      id v18 = v17;
      [v17 networkPruned];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s Node not found for network", "-[WFBlacklistEngine networkPruned:]");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        char v21 = NSString;
        id v18 = v18;
        objc_msgSend(v21, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
        id v22 = objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v22 UTF8String];
        *(_DWORD *)buf = 136446210;
        double v31 = (const char *)v23;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s network nil", "-[WFBlacklistEngine networkPruned:]");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = NSString;
      id v18 = v18;
      objc_msgSend(v19, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
      id v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      double v31 = (const char *)[v20 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)networkRemovedForSsid:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = self->_blacklist;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    __int16 v34 = self;
    char v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v41;
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      uint64_t v36 = v7;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v40 + 1) + 8 * v11);

        int v13 = [v9 networkDelegate];
        char v14 = [v13 ssid];
        int v15 = [v4 isEqualToString:v14];

        if (v15)
        {
          id v16 = v5;
          id v17 = v4;
          id v18 = NSString;
          uint64_t v19 = [v9 networkDelegate];
          id v20 = [v19 ssid];
          char v21 = [v9 networkDelegate];
          id v22 = [v21 ssid];
          uint64_t v23 = [v18 stringWithFormat:@"%s Removing blacklist node for network %@[%@]", "-[WFBlacklistEngine networkRemovedForSsid:]", v20, v22];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v23, "UTF8String"));
            id v24 = objc_claimAutoreleasedReturnValue();
            uint64_t v25 = [v24 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v45 = v25;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }
          long long v26 = [v9 blacklistTriggers];
          [v26 removeAllObjects];

          long long v27 = [v9 blacklistedStatesCurrent];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke;
          v38[3] = &unk_1E69BE488;
          id v28 = v9;
          id v39 = v28;
          [v27 enumerateObjectsUsingBlock:v38];

          long long v29 = [v28 blacklistedStatesCurrent];
          [v29 removeAllObjects];

          double v30 = [v28 blacklistedStatesHistory];
          [v30 removeAllObjects];

          id v5 = v16;
          [v16 addObject:v28];

          char v8 = 1;
          id v4 = v17;
          uint64_t v10 = v35;
          uint64_t v7 = v36;
        }
        ++v11;
        uint64_t v12 = v9;
      }
      while (v7 != v11);
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v7);

    self = v34;
  }
  else
  {
    char v8 = 0;
  }

  if ([v5 count]) {
    [(NSMutableArray *)self->_blacklist removeObjectsInArray:v5];
  }
  if (v8)
  {
    double v31 = [(WFBlacklistEngine *)self blacklistDelegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      uint64_t v33 = [(WFBlacklistEngine *)self blacklistDelegate];
      [v33 blacklistDidUpdate];
    }
  }
}

uint64_t __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:0];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_enabled = 1;
  }
  else
  {
    self->_enabled = 0;
    [(WFBlacklistEngine *)self removeBlacklistedStates];
  }
}

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 perSsid:(BOOL)a5 bssid:(id)a6 ssid:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  if (v8)
  {
    id v16 = [(WFBlacklistEngine *)self ssidThresholds];
    char v14 = [v16 objectAtIndexedSubscript:a3];
    unsigned int v15 = [v14 unsignedIntValue];

    LOBYTE(v16) = v15 <= v9;
    id v17 = NSString;
    if (v15 > v9) {
      id v18 = "not met";
    }
    else {
      id v18 = "met";
    }
    uint64_t v19 = [(WFBlacklistEngine *)self ssidThresholds];
    id v20 = [v19 objectAtIndexedSubscript:a3];
    char v21 = [v17 stringWithFormat:@"%s ssid '%@' %s thresholds. CurrentCount:%d ThresholdCount:%d", "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]", v13, v18, v9, objc_msgSend(v20, "unsignedIntValue")];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
      id v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      double v31 = (const char *)[v22 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v23 = [(WFBlacklistEngine *)self bssidThresholds];
    id v24 = [v23 objectAtIndexedSubscript:a3];
    unsigned int v25 = [v24 unsignedIntValue];
    LODWORD(v16) = v25 <= v9;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      if (v25 > v9) {
        long long v26 = "not met";
      }
      else {
        long long v26 = "met";
      }
      long long v27 = [(WFBlacklistEngine *)self bssidThresholds];
      id v28 = [v27 objectAtIndexedSubscript:a3];
      *(_DWORD *)buf = 136316418;
      double v31 = "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]";
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2080;
      uint64_t v37 = v26;
      __int16 v38 = 1024;
      int v39 = v9;
      __int16 v40 = 1024;
      int v41 = [v28 unsignedIntValue];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s bssid '%{mask.hash}@' %s thresholds. CurrentCount:%d ThresholdCount:%d", buf, 0x36u);
    }
  }

  return (char)v16;
}

- (id)_findBlacklistNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_blacklist;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v11 = v8;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v10);

      if (objc_msgSend(v8, "containsNetwork:", v4, (void)v13)) {
        break;
      }
      ++v10;
      uint64_t v11 = v8;
      if (v7 == v10)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (id)retrieveNetworksInBlacklistedState:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = self->_blacklist;
    uint64_t v23 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      id v7 = 0;
      id obj = v6;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        uint64_t v9 = v7;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id *)(*((void *)&v28 + 1) + 8 * v8);

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v10 = [v7 blacklistedStatesCurrent];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v24 + 1) + 8 * i) blacklistedState] == a3)
                {
                  long long v15 = [v7 networkDelegate];

                  if (v15)
                  {
                    long long v16 = [v7 networkDelegate];
                    id v17 = (void *)[v16 copyWithZone:0];

                    if (v17) {
                      [v5 addObject:v17];
                    }
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          ++v8;
          uint64_t v9 = v7;
        }
        while (v8 != v23);
        uint64_t v6 = obj;
        uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v23);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  results alloc failed", "-[WFBlacklistEngine retrieveNetworksInBlacklistedState:]");
    uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = NSString;
      uint64_t v6 = v6;
      objc_msgSend(v19, "stringWithFormat:", @"[WiFiPolicy] %s", -[NSMutableArray UTF8String](v6, "UTF8String"));
      id v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = [v20 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v5;
}

- (id)retrieveNetworksInBlacklistedStateHistory:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v24)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = self->_blacklist;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v31;
      id obj = v5;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v11 = v8;
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v30 + 1) + 8 * i);

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v12 = [v8 blacklistedStatesHistory];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                if ([v17 blacklistedState] == a3 || objc_msgSend(v17, "blacklistedState") == 5)
                {
                  uint64_t v18 = [v8 networkDelegate];

                  if (v18)
                  {
                    uint64_t v19 = [v8 networkDelegate];
                    id v20 = (void *)[v19 copyWithZone:0];

                    if (v20) {
                      [v24 addObject:v20];
                    }

                    goto LABEL_21;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_21:
        }
        id v5 = obj;
        uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  results alloc failed", "-[WFBlacklistEngine retrieveNetworksInBlacklistedStateHistory:]");
    id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = NSString;
      id v5 = v5;
      objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", -[NSMutableArray UTF8String](v5, "UTF8String"));
      id v23 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v37 = [v23 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v24;
}

- (id)retrieveBlacklistedStateHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(WFBlacklistEngine *)self isNetworkInBlacklistedState:v10 state:a4])
  {
    uint64_t v15 = 0;
    goto LABEL_30;
  }
  uint64_t v13 = [(WFBlacklistEngine *)self _findBlacklistNode:v10];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v14)
    {
      uint64_t v15 = v14;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v16 = [v13 blacklistedStatesHistory];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v17) {
        goto LABEL_28;
      }
      uint64_t v18 = v17;
      uint64_t v42 = v13;
      id v43 = v10;
      uint64_t v19 = *(void *)v46;
      id obj = v16;
      while (1)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(obj);
          }
          char v21 = *(void **)(*((void *)&v45 + 1) + 8 * v20);
          uint64_t v22 = [v21 blacklistedReason];
          [v21 blacklistedStateTimestamp];
          double v24 = v23;
          uint64_t v25 = [v21 blacklistedReasonData];
          long long v26 = [NSNumber numberWithUnsignedInteger:v22];
          if (!v26)
          {
            long long v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s reasonNum failed", "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
LABEL_21:
              objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
              id v32 = objc_claimAutoreleasedReturnValue();
              uint64_t v33 = [v32 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v51 = v33;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
            }
LABEL_22:

            long long v30 = 0;
            long long v28 = 0;
            goto LABEL_16;
          }
          uint64_t v27 = [NSNumber numberWithDouble:v24];
          if (!v27)
          {
            long long v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s timeNum failed", "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
          long long v28 = (void *)v27;
          uint64_t v29 = [NSNumber numberWithInteger:v25];
          if (v29)
          {
            long long v30 = (void *)v29;
            [v15 addObject:v26];
            if (v11) {
              [v11 addObject:v28];
            }
            if (v12) {
              [v12 addObject:v30];
            }
          }
          else
          {
            __int16 v34 = objc_msgSend(NSString, "stringWithFormat:", @"%s reasonDataNum failed", "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v34, "UTF8String"));
              int v41 = v34;
              id v35 = objc_claimAutoreleasedReturnValue();
              uint64_t v36 = [v35 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v51 = v36;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              __int16 v34 = v41;
            }

            long long v30 = 0;
          }
LABEL_16:

          ++v20;
        }
        while (v18 != v20);
        id v16 = obj;
        uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        uint64_t v18 = v37;
        if (!v37)
        {
          uint64_t v13 = v42;
          id v10 = v43;
          goto LABEL_28;
        }
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%s  results alloc failed", "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  Not in blacklisted state", "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
  }
  int v39 = NSString;
  id v16 = v16;
  objc_msgSend(v39, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
  id v40 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  uint64_t v51 = [v40 UTF8String];
  _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_37:
  uint64_t v15 = 0;
LABEL_28:

LABEL_30:

  return v15;
}

- (id)retrieveReasonsForNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a5;
  id v42 = a6;
  if (![(WFBlacklistEngine *)self isNetworkInBlacklistedState:v10 state:a4])
  {
    uint64_t v13 = 0;
    goto LABEL_27;
  }
  id v11 = [(WFBlacklistEngine *)self _findBlacklistNode:v10];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v12)
    {
      uint64_t v13 = v12;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v14 = [v11 blacklistTriggers];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v15) {
        goto LABEL_25;
      }
      uint64_t v16 = v15;
      id v40 = v11;
      id v41 = v10;
      uint64_t v17 = *(void *)v45;
      unint64_t v18 = 0x1E4F29000uLL;
      while (1)
      {
        uint64_t v19 = 0;
        do
        {
          unint64_t v20 = v18;
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v14);
          }
          char v21 = *(void **)(*((void *)&v44 + 1) + 8 * v19);
          uint64_t v22 = [v21 triggerReason];
          [v21 triggerReasonTimestamp];
          double v24 = v23;
          uint64_t v25 = [v21 triggerReasonData];
          long long v26 = [NSNumber numberWithUnsignedInteger:v22];
          if (v26)
          {
            uint64_t v27 = [NSNumber numberWithDouble:v24];
            if (v27)
            {
              id v28 = (id)v27;
              uint64_t v29 = [NSNumber numberWithInteger:v25];
              if (v29)
              {
                id v30 = (id)v29;
                [v13 addObject:v26];
                [v43 addObject:v28];
                [v42 addObject:v30];
LABEL_13:

                unint64_t v18 = v20;
                goto LABEL_14;
              }
              unint64_t v18 = v20;
              objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s reasonDataNum failed", "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              id v39 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v39, "UTF8String"));
                id v33 = objc_claimAutoreleasedReturnValue();
                uint64_t v34 = [v33 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v50 = v34;
                _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                unint64_t v18 = v20;
              }
            }
            else
            {
              unint64_t v18 = v20;
              objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s timeNum failed", "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              id v28 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
LABEL_19:
                long long v31 = *(void **)(v20 + 24);
                id v28 = v28;
                objc_msgSend(v31, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v28, "UTF8String"));
                id v30 = objc_claimAutoreleasedReturnValue();
                uint64_t v32 = [v30 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v50 = v32;
                _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
                goto LABEL_13;
              }
            }
          }
          else
          {
            unint64_t v18 = v20;
            objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"%s reasonNum failed", "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
          }
LABEL_14:

          ++v19;
        }
        while (v16 != v19);
        uint64_t v35 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
        uint64_t v16 = v35;
        if (!v35)
        {
          id v11 = v40;
          id v10 = v41;
          goto LABEL_25;
        }
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%s  results alloc failed", "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s  Not in blacklisted state", "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
  }
  uint64_t v37 = NSString;
  id v14 = v14;
  objc_msgSend(v37, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v14, "UTF8String"));
  id v38 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  uint64_t v50 = [v38 UTF8String];
  _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_34:
  uint64_t v13 = 0;
LABEL_25:

LABEL_27:

  return v13;
}

- (BOOL)isNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4
{
  id v5 = [(WFBlacklistEngine *)self _findBlacklistNode:a3];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 hasBlacklistedState:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)getRssiWhenNetworkWasBlacklisted:(id)a3
{
  uint64_t v3 = [(WFBlacklistEngine *)self _findBlacklistNode:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 networkDelegate];
    int64_t v6 = [v5 rssi];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isNetworkBlacklistedForAutoJoinDueToTrigDisc:(id)a3 rssi:(int64_t *)a4 timestamp:(double *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = self->_blacklist;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v28 = a4;
    uint64_t v29 = a5;
    id v11 = 0;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        id v14 = v11;
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v35 + 1) + 8 * i);

        if ([v11 hasBlacklistedState:1])
        {
          uint64_t v15 = [v11 networkDelegate];
          uint64_t v16 = [v15 ssid];
          uint64_t v17 = [v30 ssid];
          int v18 = [v16 isEqual:v17];

          if (v18)
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v19 = [v11 blacklistedStatesCurrent];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v32;
              while (2)
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v32 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  double v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                  if ([v24 blacklistedReason] == 6)
                  {
                    if (v28) {
                      int64_t *v28 = (int)[v24 blacklistedReasonData];
                    }
                    if (v29)
                    {
                      [v24 blacklistedStateTimestamp];
                      *(void *)uint64_t v29 = v26;
                    }
                    BOOL v25 = 1;
                    goto LABEL_25;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
    BOOL v25 = 0;
    uint64_t v19 = v11;
    id v11 = 0;
LABEL_25:
  }
  else
  {
    id v11 = 0;
    BOOL v25 = 0;
  }

  return v25;
}

- (id)retrieveBlacklistedNetworkSsids:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v5)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = self->_blacklist;
    uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      id v6 = 0;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v7 = 0;
        id v8 = v6;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v7;
          id v6 = *(id *)(*((void *)&v31 + 1) + 8 * v7);

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v9 = [v6 blacklistedStatesCurrent];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v28 != v12) {
                  objc_enumerationMutation(v9);
                }
                if ([*(id *)(*((void *)&v27 + 1) + 8 * i) blacklistedState] == a3)
                {
                  id v14 = [v6 networkDelegate];
                  uint64_t v15 = [v14 ssid];

                  [v5 appendFormat:@"%@ ", v15];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v26 + 1;
          id v8 = v6;
        }
        while (v26 + 1 != v25);
        uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }
    id v16 = [NSString stringWithFormat:@"%s : %@", "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSString;
      id v16 = v16;
      objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
      id v18 = objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v38 = v19;
      uint64_t v20 = MEMORY[0x1E4F14500];
LABEL_21:
      _os_log_impl(&dword_1D3CCD000, v20, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s list not created", "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = NSString;
      id v16 = v16;
      objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
      id v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v38 = [v18 UTF8String];
      uint64_t v20 = MEMORY[0x1E4F14500];
      goto LABEL_21;
    }
  }

  return v5;
}

- (unint64_t)getBlacklistedNetworkCount
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = self->_blacklist;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v9 = v5;
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v2);
        }
        id v5 = *(id *)(*((void *)&v23 + 1) + 8 * i);

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = [v5 blacklistedStatesCurrent];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v19 + 1) + 8 * v14) blacklistedState]) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
              if (v12) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      v6 += v4;
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = 0;
  }

  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s count:%lu", "-[WFBlacklistEngine getBlacklistedNetworkCount]", v6);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = v17;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  return v6;
}

- (void)_printBlacklist
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_blacklist count])
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Current blacklist:", "-[WFBlacklistEngine _printBlacklist]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
      id v4 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v95 = [v4 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
    id v74 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v74 setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = self->_blacklist;
    uint64_t v66 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v104 count:16];
    if (v66)
    {
      id v5 = MEMORY[0x1E4F14500];
      uint64_t v65 = *(void *)v88;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v88 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v69 = v6;
          uint64_t v7 = *(void **)(*((void *)&v87 + 1) + 8 * v6);
          id v8 = [v7 networkDelegate];
          uint64_t v9 = [v8 ssid];
          uint64_t v10 = [v9 copy];

          uint64_t v11 = [v7 networkDelegate];
          uint64_t v12 = [v11 bssid];
          uint64_t v13 = [v12 copy];

          id v70 = v7;
          uint64_t v14 = [v7 blacklistedStatesCurrent];
          int v15 = [v14 count];

          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141559042;
            id v16 = "YES";
            if (!v15) {
              id v16 = "NO";
            }
            uint64_t v95 = 1752392040;
            __int16 v96 = 2112;
            uint64_t v97 = v10;
            __int16 v98 = 2160;
            uint64_t v99 = 1752392040;
            __int16 v100 = 2112;
            uint64_t v101 = v13;
            __int16 v102 = 2080;
            unint64_t v103 = v16;
            _os_log_impl(&dword_1D3CCD000, v5, OS_LOG_TYPE_DEFAULT, "Network '%{mask.hash}@' BSSID \"%{mask.hash}@\" isBlacklisted:%s ", buf, 0x34u);
          }
          id v67 = (void *)v13;
          id v68 = (void *)v10;
          id v73 = [MEMORY[0x1E4F28E78] stringWithString:@" BlacklistHistory: "];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          uint64_t v17 = [v7 blacklistedStatesHistory];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v83 objects:v93 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = 0;
            uint64_t v21 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v84 != v21) {
                  objc_enumerationMutation(v17);
                }
                long long v23 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                long long v24 = [v23 blacklistedStateString];
                [v23 blacklistedStateTimestamp];
                long long v25 = NSString;
                long long v26 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
                long long v27 = [v74 stringFromDate:v26];
                uint64_t v28 = [v25 stringWithFormat:@"[%d] %@ @ %@, ", v20 + i, v24, v27];

                [v73 appendString:v28];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v83 objects:v93 count:16];
              uint64_t v20 = (v20 + i);
            }
            while (v19);
          }

          long long v29 = [NSString stringWithFormat:@"%@", v73];
          long long v30 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v29, "UTF8String"));
            id v31 = objc_claimAutoreleasedReturnValue();
            uint64_t v32 = [v31 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v32;
            _os_log_impl(&dword_1D3CCD000, v30, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }
          char v72 = [MEMORY[0x1E4F28E78] stringWithString:@" States: "];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v33 = [v70 blacklistedStatesCurrent];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = 0;
            uint64_t v37 = *(void *)v80;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v80 != v37) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v39 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                id v40 = [v39 blacklistedStateString];
                [v39 blacklistedStateTimestamp];
                uint64_t v41 = NSString;
                id v42 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
                id v43 = [v74 stringFromDate:v42];
                long long v44 = [v41 stringWithFormat:@"[%d] %@ @ %@, ", v36 + j, v40, v43];

                [v72 appendString:v44];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
              uint64_t v36 = (v36 + j);
            }
            while (v35);
          }

          long long v45 = [NSString stringWithFormat:@"%@", v72];
          long long v46 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v45, "UTF8String"));
            id v47 = objc_claimAutoreleasedReturnValue();
            uint64_t v48 = [v47 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v48;
            _os_log_impl(&dword_1D3CCD000, v46, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }
          uint64_t v49 = [MEMORY[0x1E4F28E78] stringWithString:@" Triggers: "];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v71 = [v70 blacklistTriggers];
          uint64_t v50 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = 0;
            uint64_t v53 = *(void *)v76;
            do
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v76 != v53) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v55 = *(void **)(*((void *)&v75 + 1) + 8 * k);
                uint64_t v56 = [v55 triggerReasonString];
                [v55 triggerReasonTimestamp];
                uint64_t v57 = NSString;
                id v58 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
                id v59 = [v74 stringFromDate:v58];
                uint64_t v60 = [v57 stringWithFormat:@"[%d] %@ @ %@, ", v52 + k, v56, v59];

                [v49 appendString:v60];
              }
              uint64_t v51 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
              uint64_t v52 = (v52 + k);
            }
            while (v51);
          }

          uint64_t v61 = [NSString stringWithFormat:@"%@", v49];
          id v5 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v61, "UTF8String"));
            id v62 = objc_claimAutoreleasedReturnValue();
            uint64_t v63 = [v62 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v63;
            _os_log_impl(&dword_1D3CCD000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }
          uint64_t v6 = v69 + 1;
        }
        while (v69 + 1 != v66);
        uint64_t v66 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v104 count:16];
      }
      while (v66);
    }
  }
}

+ (id)stringRepresentationWithReason:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E69BE4D0[a3];
  }
}

+ (id)stringRepresentationWithState:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E69BE528[a3 - 1];
  }
}

- (id)getBlacklist
{
  return self->_blacklist;
}

- (WFBlacklistDelegate)blacklistDelegate
{
  return self->_blacklistDelegate;
}

- (void)setBlacklistDelegate:(id)a3
{
  self->_blacklistDelegate = (WFBlacklistDelegate *)a3;
}

- (NSMutableArray)ssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSsidThresholds:(id)a3
{
}

- (NSMutableArray)bssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBssidThresholds:(id)a3
{
}

- (double)wowBlacklistExpiry
{
  return self->_wowBlacklistExpiry;
}

- (void)setWowBlacklistExpiry:(double)a3
{
  self->_wowBlacklistExpiry = a3;
}

- (double)autojoinBlacklistExpiry
{
  return self->_autojoinBlacklistExpiry;
}

- (void)setAutojoinBlacklistExpiry:(double)a3
{
  self->_autojoinBlacklistExpiry = a3;
}

- (double)bssBlacklistExpiry
{
  return self->_bssBlacklistExpiry;
}

- (void)setBssBlacklistExpiry:(double)a3
{
  self->_bssBlacklistExpiry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssidThresholds, 0);
  objc_storeStrong((id *)&self->_ssidThresholds, 0);

  objc_storeStrong((id *)&self->_blacklist, 0);
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(void *)a1 reason:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [a1 ssid];
  uint64_t v3 = [a1 bssid];
  v4[0] = 136316162;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s node not found with ssid:%{mask.hash}@ bssid:%{mask.hash}@", (uint8_t *)v4, 0x34u);
}

- (void)networkPruned:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [a1 ssid];
  uint64_t v3 = [a1 bssid];
  v4[0] = 136316162;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s network %{mask.hash}@[%{mask.hash}@]", (uint8_t *)v4, 0x34u);
}

@end