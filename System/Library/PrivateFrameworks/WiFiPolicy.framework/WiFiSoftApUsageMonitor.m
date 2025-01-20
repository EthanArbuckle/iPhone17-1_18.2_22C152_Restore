@interface WiFiSoftApUsageMonitor
+ (id)sharedInstance;
- (BOOL)compatibilityEnabled;
- (BOOL)compatibilityToggled;
- (BOOL)statsValid;
- (NSDate)softApOldestActiveTime;
- (OS_dispatch_queue)internalQueue;
- (WiFiSoftApUsageMonitor)init;
- (id)description;
- (id)statsDictionary;
- (unint64_t)appleClientConnectCount;
- (unint64_t)fiveGHzSessionCount;
- (unint64_t)mixClientConnectedSessionCount;
- (unint64_t)noClientConnectedSessionCount;
- (unint64_t)onlyAppleClientConnectedSessionCount;
- (unint64_t)onlyOtherClientConnectedSessionCount;
- (unint64_t)otherClientConnectCount;
- (unint64_t)softApUpCount;
- (unint64_t)twoFourGHzSessionCount;
- (void)initStats;
- (void)initStats:(id)a3;
- (void)persistStats;
- (void)resetStats;
- (void)resetStatsInternal;
- (void)setAppleClientConnectCount:(unint64_t)a3;
- (void)setCompatibilityEnabled:(BOOL)a3;
- (void)setCompatibilityToggled:(BOOL)a3;
- (void)setFiveGHzSessionCount:(unint64_t)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMixClientConnectedSessionCount:(unint64_t)a3;
- (void)setNoClientConnectedSessionCount:(unint64_t)a3;
- (void)setOnlyAppleClientConnectedSessionCount:(unint64_t)a3;
- (void)setOnlyOtherClientConnectedSessionCount:(unint64_t)a3;
- (void)setOtherClientConnectCount:(unint64_t)a3;
- (void)setSoftApOldestActiveTime:(id)a3;
- (void)setSoftApUpCount:(unint64_t)a3;
- (void)setStatsValid:(BOOL)a3;
- (void)setTwoFourGHzSessionCount:(unint64_t)a3;
- (void)statsDictionaryInternal:(id)a3;
- (void)updateStats:(id)a3;
- (void)updateStatsInternal:(id)a3;
@end

@implementation WiFiSoftApUsageMonitor

uint64_t __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statsDictionaryInternal:*(void *)(a1 + 40)];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedWiFiSoftApUsageMonitor;

  return v2;
}

- (id)statsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke;
  v9[3] = &unk_1E69BC8B0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(internalQueue, v9);
  v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)statsDictionaryInternal:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_statsValid)
  {
    [v4 setObject:self->_softApOldestActiveTime forKeyedSubscript:@"OldestActiveTime"];
    id v5 = [NSNumber numberWithUnsignedInteger:self->_softApUpCount];
    [v18 setObject:v5 forKeyedSubscript:@"SoftApUpCount"];

    v6 = [NSNumber numberWithUnsignedInteger:self->_noClientConnectedSessionCount];
    [v18 setObject:v6 forKeyedSubscript:@"NoClientConnectedSessionCount"];

    id v7 = [NSNumber numberWithUnsignedInteger:self->_onlyAppleClientConnectedSessionCount];
    [v18 setObject:v7 forKeyedSubscript:@"OnlyAppleClientConnectedSessionCount"];

    v8 = [NSNumber numberWithUnsignedInteger:self->_onlyOtherClientConnectedSessionCount];
    [v18 setObject:v8 forKeyedSubscript:@"OnlyOtherClientConnectedSessionCount"];

    v9 = [NSNumber numberWithUnsignedInteger:self->_mixClientConnectedSessionCount];
    [v18 setObject:v9 forKeyedSubscript:@"MixClientConnectedSessionCount"];

    id v10 = [NSNumber numberWithUnsignedInteger:self->_appleClientConnectCount];
    [v18 setObject:v10 forKeyedSubscript:@"AppleClientConnectCount"];

    v11 = [NSNumber numberWithUnsignedInteger:self->_otherClientConnectCount];
    [v18 setObject:v11 forKeyedSubscript:@"OtherClientConnectCount"];

    v12 = [NSNumber numberWithUnsignedInteger:self->_twoFourGHzSessionCount];
    [v18 setObject:v12 forKeyedSubscript:@"24GHzSessionCount"];

    v13 = [NSNumber numberWithUnsignedInteger:self->_fiveGHzSessionCount];
    [v18 setObject:v13 forKeyedSubscript:@"5GHzSessionCount"];

    v14 = [NSNumber numberWithBool:self->_compatibilityEnabled];
    [v18 setObject:v14 forKeyedSubscript:@"MaximizeCompatibilityEnabled"];

    v15 = [NSNumber numberWithBool:self->_compatibilityToggled];
    [v18 setObject:v15 forKeyedSubscript:@"MaximizeCompatibilityToggled"];

    BOOL statsValid = self->_statsValid;
  }
  else
  {
    BOOL statsValid = 0;
  }
  v17 = [NSNumber numberWithBool:statsValid];
  [v18 setObject:v17 forKeyedSubscript:@"StatsValid"];
}

uint64_t __40__WiFiSoftApUsageMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WiFiSoftApUsageMonitor);
  uint64_t v2 = sharedInstance_sharedWiFiSoftApUsageMonitor;
  sharedInstance_sharedWiFiSoftApUsageMonitor = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (WiFiSoftApUsageMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)WiFiSoftApUsageMonitor;
  uint64_t v2 = [(WiFiSoftApUsageMonitor *)&v8 init];
  v2->_BOOL statsValid = 0;
  softApOldestActiveTime = v2->_softApOldestActiveTime;
  v2->_softApOldestActiveTime = 0;

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifi.softap-usage-monitor", v4);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v5;

  [(WiFiSoftApUsageMonitor *)v2 initStats];
  return v2;
}

- (void)initStats:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = [v4 keyEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    objc_super v8 = (void *)v6;
    v9 = 0;
    id v10 = MEMORY[0x1E4F14500];
    *(void *)&long long v7 = 136315394;
    long long v17 = v7;
    while (1)
    {
      v11 = v9;
      v12 = objc_msgSend(v8, "stringValue", v17, *(_OWORD *)buf, *(void *)&buf[16], v19);
      v9 = [v4 objectForKey:v12];

      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEqualToString:@"OldestActiveTime"]) {
            objc_storeStrong((id *)&self->_softApOldestActiveTime, v9);
          }
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEqualToString:@"StatsValid"])
          {
            self->_BOOL statsValid = [v9 BOOLValue];
          }
          else if ([v12 isEqualToString:@"MaximizeCompatibilityEnabled"])
          {
            self->_compatibilityEnabled = [v9 BOOLValue];
          }
          else if ([v12 isEqualToString:@"MaximizeCompatibilityToggled"])
          {
            self->_compatibilityToggled = [v9 BOOLValue];
          }
          else
          {
            unint64_t v16 = [v9 unsignedLongValue];
            if ([v12 isEqualToString:@"SoftApUpCount"])
            {
              self->_softApUpCount = v16;
            }
            else if ([v12 isEqualToString:@"NoClientConnectedSessionCount"])
            {
              self->_noClientConnectedSessionCount = v16;
            }
            else if ([v12 isEqualToString:@"OnlyAppleClientConnectedSessionCount"])
            {
              self->_onlyAppleClientConnectedSessionCount = v16;
            }
            else if ([v12 isEqualToString:@"OnlyOtherClientConnectedSessionCount"])
            {
              self->_onlyOtherClientConnectedSessionCount = v16;
            }
            else if ([v12 isEqualToString:@"MixClientConnectedSessionCount"])
            {
              self->_mixClientConnectedSessionCount = v16;
            }
            else if ([v12 isEqualToString:@"AppleClientConnectCount"])
            {
              self->_appleClientConnectCount = v16;
            }
            else if ([v12 isEqualToString:@"OtherClientConnectCount"])
            {
              self->_otherClientConnectCount = v16;
            }
            else if ([v12 isEqualToString:@"24GHzSessionCount"])
            {
              self->_twoFourGHzSessionCount = v16;
            }
            else if ([v12 isEqualToString:@"5GHzSessionCount"])
            {
              self->_fiveGHzSessionCount = v16;
            }
          }
          goto LABEL_15;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          *(void *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          v13 = v10;
          v14 = "%s: unexpected value for %@";
          goto LABEL_14;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        *(void *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        v13 = v10;
        v14 = "%s: value is null for %@";
LABEL_14:
        _os_log_impl(&dword_1D3CCD000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      }
LABEL_15:

      uint64_t v15 = [v5 nextObject];

      objc_super v8 = (void *)v15;
      if (!v15)
      {

        break;
      }
    }
  }
}

- (void)initStats
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v4 dictionaryForKey:@"WiFiHotspotUsageHistory"];
  if (v3) {
    [(WiFiSoftApUsageMonitor *)self initStats:v3];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"time_window=%@, sessionCnt=%lu, noClientSessionCnt=%lu, onlyAppleSessionCnt=%lu, only3rdPartySessionCnt=%lu mixClientSessionCnt=%lu 2.4GHzSessionCnt=%lu 5GHzSessionCnt=%lu appleClientCnt=%lu, otherClientCnt=%lu, compatibilityEnabled=%u, compatibilityToggled=%u", self->_softApOldestActiveTime, self->_softApUpCount, self->_noClientConnectedSessionCount, self->_onlyAppleClientConnectedSessionCount, self->_onlyOtherClientConnectedSessionCount, self->_mixClientConnectedSessionCount, self->_appleClientConnectCount, self->_otherClientConnectCount, self->_twoFourGHzSessionCount, self->_fiveGHzSessionCount, self->_compatibilityEnabled, self->_compatibilityToggled];
}

- (void)updateStatsInternal:(id)a3
{
  id v4 = a3;
  BOOL compatibilityEnabled = self->_compatibilityEnabled;
  id v19 = v4;
  uint64_t v6 = [v4 objectForKey:@"MaximizeCompatibilityEnabled"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_BOOL compatibilityEnabled = [v6 BOOLValue];
    }
  }
  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_compatibilityToggled |= self->_compatibilityEnabled ^ compatibilityEnabled;
  if (softApOldestActiveTime && self->_statsValid)
  {
    objc_super v8 = v6;
  }
  else
  {
    [(WiFiSoftApUsageMonitor *)self resetStatsInternal];
    objc_super v8 = [v19 objectForKey:@"SessionStartTimestamp"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_softApOldestActiveTime, v8);
      }
    }
  }
  v9 = [v19 objectForKey:@"AppleClientConnectCount"];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = [v9 unsignedLongValue];
    self->_appleClientConnectCount += v10;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = [v19 objectForKey:@"OtherClientConnectCount"];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = [v11 unsignedLongValue];
    self->_otherClientConnectCount += v12;
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  BOOL v14 = !v13;
  uint64_t v15 = 32;
  if (!v14) {
    uint64_t v15 = 48;
  }
  uint64_t v16 = 40;
  if (!v14) {
    uint64_t v16 = 56;
  }
  if (v10) {
    uint64_t v15 = v16;
  }
  ++*(Class *)((char *)&self->super.isa + v15);
  long long v17 = [v19 objectForKey:@"TwoFourGHzChannelCount"];

  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v17 unsignedLongValue]) {
        ++self->_twoFourGHzSessionCount;
      }
    }
  }
  id v18 = [v19 objectForKey:@"FiveGHzChannelCount"];

  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v18 unsignedLongValue]) {
        ++self->_fiveGHzSessionCount;
      }
    }
  }
  ++self->_softApUpCount;
  self->_BOOL statsValid = 1;
}

- (void)updateStats:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiSoftApUsageMonitor_updateStats___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __38__WiFiSoftApUsageMonitor_updateStats___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStatsInternal:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 persistStats];
}

- (void)resetStatsInternal
{
  self->_BOOL statsValid = 0;
  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_softApOldestActiveTime = 0;

  self->_compatibilityToggled = 0;
  *(_OWORD *)&self->_softApUpCount = 0u;
  *(_OWORD *)&self->_onlyAppleClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_mixClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_otherClientConnectCount = 0u;
  self->_fiveGHzSessionCount = 0;
}

- (void)resetStats
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WiFiSoftApUsageMonitor_resetStats__block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __36__WiFiSoftApUsageMonitor_resetStats__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetStatsInternal];
}

- (void)persistStats
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(WiFiSoftApUsageMonitor *)self statsDictionaryInternal:v4];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setObject:v4 forKey:@"WiFiHotspotUsageHistory"];
}

- (NSDate)softApOldestActiveTime
{
  return self->_softApOldestActiveTime;
}

- (void)setSoftApOldestActiveTime:(id)a3
{
}

- (unint64_t)softApUpCount
{
  return self->_softApUpCount;
}

- (void)setSoftApUpCount:(unint64_t)a3
{
  self->_softApUpCount = a3;
}

- (unint64_t)noClientConnectedSessionCount
{
  return self->_noClientConnectedSessionCount;
}

- (void)setNoClientConnectedSessionCount:(unint64_t)a3
{
  self->_noClientConnectedSessionCount = a3;
}

- (unint64_t)onlyAppleClientConnectedSessionCount
{
  return self->_onlyAppleClientConnectedSessionCount;
}

- (void)setOnlyAppleClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyAppleClientConnectedSessionCount = a3;
}

- (unint64_t)onlyOtherClientConnectedSessionCount
{
  return self->_onlyOtherClientConnectedSessionCount;
}

- (void)setOnlyOtherClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyOtherClientConnectedSessionCount = a3;
}

- (unint64_t)mixClientConnectedSessionCount
{
  return self->_mixClientConnectedSessionCount;
}

- (void)setMixClientConnectedSessionCount:(unint64_t)a3
{
  self->_mixClientConnectedSessionCount = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)twoFourGHzSessionCount
{
  return self->_twoFourGHzSessionCount;
}

- (void)setTwoFourGHzSessionCount:(unint64_t)a3
{
  self->_twoFourGHzSessionCount = a3;
}

- (unint64_t)fiveGHzSessionCount
{
  return self->_fiveGHzSessionCount;
}

- (void)setFiveGHzSessionCount:(unint64_t)a3
{
  self->_fiveGHzSessionCount = a3;
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_BOOL compatibilityEnabled = a3;
}

- (BOOL)compatibilityToggled
{
  return self->_compatibilityToggled;
}

- (void)setCompatibilityToggled:(BOOL)a3
{
  self->_compatibilityToggled = a3;
}

- (BOOL)statsValid
{
  return self->_statsValid;
}

- (void)setStatsValid:(BOOL)a3
{
  self->_BOOL statsValid = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_softApOldestActiveTime, 0);
}

@end