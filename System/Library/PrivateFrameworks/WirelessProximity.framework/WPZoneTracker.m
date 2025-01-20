@interface WPZoneTracker
- (BOOL)wantEntry;
- (BOOL)wantExit;
- (WPZoneTracker)initWithDelegate:(id)a3;
- (WPZoneTracker)initWithDelegate:(id)a3 queue:(id)a4;
- (WPZoneTrackerDelegate)delegate;
- (id)clientAsString;
- (id)description;
- (void)enteredZone:(id)a3 manufacturerData:(id)a4;
- (void)exitedZone:(id)a3;
- (void)failedToRegisterZones:(id)a3 withError:(id)a4;
- (void)fetchedCurrentlyTrackedZones:(id)a3;
- (void)getCurrentTrackedZones;
- (void)invalidate;
- (void)registerForZoneChangesMatching:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWantEntry:(BOOL)a3;
- (void)setWantExit:(BOOL)a3;
- (void)stateDidChange:(int64_t)a3;
- (void)unregisterAllZoneChanges;
- (void)unregisterForZoneChanges:(id)a3;
@end

@implementation WPZoneTracker

- (WPZoneTracker)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPZoneTracker;
  v7 = [(WPClient *)&v10 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_wantEntry = 1;
    v8->_wantExit = 1;
  }

  return v8;
}

- (WPZoneTracker)initWithDelegate:(id)a3
{
  return [(WPZoneTracker *)self initWithDelegate:a3 queue:0];
}

- (void)invalidate
{
  [(WPZoneTracker *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v3 invalidate];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)WPZoneTracker;
  v4 = [(WPClient *)&v9 description];
  v5 = [v3 stringWithString:v4];

  if ([(WPZoneTracker *)self wantExit]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if ([(WPZoneTracker *)self wantExit]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v5 appendFormat:@". Entry = %@, Exit = %@", v6, v7];

  return v5;
}

- (id)clientAsString
{
  return @"WPZoneTracker";
}

- (void)registerForZoneChangesMatching:(id)a3
{
  id v4 = a3;
  [(WPZoneTracker *)self setWantEntry:1];
  [(WPZoneTracker *)self setWantExit:1];
  v5 = [v4 allKeys];
  int v6 = [v5 containsObject:@"ZTZoneEntry"];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"ZTZoneEntry"];
    -[WPZoneTracker setWantEntry:](self, "setWantEntry:", [v7 BOOLValue]);
  }
  v8 = [v4 allKeys];
  int v9 = [v8 containsObject:@"ZTZoneExit"];

  if (v9)
  {
    objc_super v10 = [v4 objectForKeyedSubscript:@"ZTZoneExit"];
    -[WPZoneTracker setWantExit:](self, "setWantExit:", [v10 BOOLValue]);
  }
  v11 = objc_opt_new();
  [v11 setClientType:2];
  int64x2_t v16 = vdupq_n_s64(0x3C6uLL);
  uint64_t v17 = 30;
  [v11 setScanningRates:&v16];
  v12 = (void *)MEMORY[0x263EFF9C0];
  v13 = [v4 objectForKeyedSubscript:@"ZTZonesArray"];
  v14 = [v12 setWithArray:v13];
  [v11 setZones:v14];

  v15.receiver = self;
  v15.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v15 startTrackingZone:v11];
}

- (void)unregisterForZoneChanges:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"ZTZonesArray"];
  v5.receiver = self;
  v5.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v5 stopTrackingZones:v4];
}

- (void)unregisterAllZoneChanges
{
  v2.receiver = self;
  v2.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v2 stopTrackingAllZones];
}

- (void)getCurrentTrackedZones
{
  v2.receiver = self;
  v2.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v2 getAllTrackedZones];
}

- (void)enteredZone:(id)a3 manufacturerData:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(WPZoneTracker *)self wantEntry])
  {
    v8 = [(WPZoneTracker *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      objc_super v10 = [(WPZoneTracker *)self delegate];
      [v10 zoneTracker:self enteredZone:v6];
    }
  }
  if ([(WPZoneTracker *)self wantEntry])
  {
    v11 = [(WPZoneTracker *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      long long v46 = 0uLL;
      id v13 = v7;
      uint64_t v14 = [v13 bytes];
      unsigned int v15 = [v13 length];
      if (v15 < 0x10 || (long long v46 = *(_OWORD *)v14, v15 < 0x12))
      {
        int v18 = 0;
        unsigned int v16 = 0;
      }
      else
      {
        unsigned int v16 = __rev16(*(unsigned __int16 *)(v14 + 16));
        if (v15 >= 0x14)
        {
          uint64_t v17 = __rev16(*(unsigned __int16 *)(v14 + 18));
          if (v15 == 20) {
            int v18 = 0;
          }
          else {
            int v18 = *(char *)(v14 + 20);
          }
          goto LABEL_13;
        }
        int v18 = 0;
      }
      uint64_t v17 = 0;
LABEL_13:
      v19 = [MEMORY[0x263EFF8F8] dataWithBytes:&v46 length:16];
      if (v19)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_164);
        }
        v20 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413570;
          v35 = v19;
          __int16 v36 = 2048;
          uint64_t v37 = v16;
          __int16 v38 = 2048;
          uint64_t v39 = v16;
          __int16 v40 = 2048;
          uint64_t v41 = v17;
          __int16 v42 = 2048;
          uint64_t v43 = v17;
          __int16 v44 = 1024;
          int v45 = v18;
          _os_log_impl(&dword_2144AA000, v20, OS_LOG_TYPE_DEFAULT, "Entered zone %@ with major %ld (0x%lx), minor %ld (0x%lx), tx (%d)", buf, 0x3Au);
        }
        v33[0] = v19;
        v32[0] = @"WPZoneTrackerKeyZone";
        v32[1] = @"WPZoneTrackerKeyMajor";
        v21 = [NSNumber numberWithInteger:v16];
        v33[1] = v21;
        v32[2] = @"WPZoneTrackerKeyMinor";
        v22 = [NSNumber numberWithInteger:v17];
        v33[2] = v22;
        v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_169_1);
        }
        v24 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v23;
          _os_log_impl(&dword_2144AA000, v24, OS_LOG_TYPE_DEFAULT, "dicToSend: %@", buf, 0xCu);
        }
        v25 = [(WPZoneTracker *)self delegate];
        v31[0] = v6;
        v26 = objc_msgSend(NSNumber, "numberWithInteger:", v16, @"WPZoneTrackerKeyZone", @"WPZoneTrackerKeyMajor");
        v31[1] = v26;
        v30[2] = @"WPZoneTrackerKeyMinor";
        v27 = [NSNumber numberWithInteger:v17];
        v31[2] = v27;
        v28 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
        [v25 zoneTracker:self enteredZoneInfo:v28];
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
        }
        v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPZoneTracker enteredZone:manufacturerData:](v29);
        }
      }
    }
  }
}

- (void)exitedZone:(id)a3
{
  id v7 = a3;
  if ([(WPZoneTracker *)self wantExit])
  {
    id v4 = [(WPZoneTracker *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(WPZoneTracker *)self delegate];
      [v6 zoneTracker:self exitedZone:v7];
    }
  }
}

- (void)failedToRegisterZones:(id)a3 withError:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WPZoneTracker *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_super v10 = [(WPZoneTracker *)self delegate];
    char v12 = @"ZTZonesArray";
    v13[0] = v6;
    v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v10 zoneTracker:self didFailToRegisterZones:v11 withError:v7];
  }
}

- (void)fetchedCurrentlyTrackedZones:(id)a3
{
  id v7 = a3;
  id v4 = [(WPZoneTracker *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPZoneTracker *)self delegate];
    [v6 infoForCurrentlyTrackedZones:v7];
  }
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPZoneTracker;
  [(WPClient *)&v7 stateDidChange:a3];
  id v4 = [(WPZoneTracker *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPZoneTracker *)self delegate];
    [v6 zoneTrackerDidUpdateState:self];
  }
}

- (WPZoneTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPZoneTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantEntry
{
  return self->_wantEntry;
}

- (void)setWantEntry:(BOOL)a3
{
  self->_wantEntry = a3;
}

- (BOOL)wantExit
{
  return self->_wantExit;
}

- (void)setWantExit:(BOOL)a3
{
  self->_wantExit = a3;
}

- (void).cxx_destruct
{
}

- (void)enteredZone:(os_log_t)log manufacturerData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Failed to create zoneUUID data", v1, 2u);
}

@end