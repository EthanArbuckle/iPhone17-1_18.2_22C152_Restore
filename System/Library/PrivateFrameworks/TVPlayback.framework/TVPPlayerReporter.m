@interface TVPPlayerReporter
+ (void)initialize;
- (RTCReporting)rtcAgent;
- (TVPPlayer)player;
- (TVPPlayerReporter)initWithPlayer:(id)a3;
- (id)_rtcAgentUserInfo;
- (id)reportingHierarchyToken;
- (void)_playerCurrentMediaItemDidChange:(id)a3;
- (void)_playerCurrentMediaItemWillChange:(id)a3;
- (void)_playerStateWillChange:(id)a3;
- (void)_sendPlaybackStartupEventsIfNecessary;
- (void)_sendRTCEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6;
- (void)_setupRTCAgent;
- (void)_tearDownRTCAgent;
- (void)dealloc;
- (void)sendPlaybackStartupMetricsManually;
- (void)setPlayer:(id)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setRtcAgent:(id)a3;
@end

@implementation TVPPlayerReporter

+ (void)initialize
{
  if (initialize_onceToken_6 != -1) {
    dispatch_once(&initialize_onceToken_6, &__block_literal_global_14);
  }
}

uint64_t __31__TVPPlayerReporter_initialize__block_invoke()
{
  sLogObject_4 = (uint64_t)os_log_create("com.apple.AppleTV.playback", "TVPPlayerReporter");
  return MEMORY[0x270F9A758]();
}

- (TVPPlayerReporter)initWithPlayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlayerReporter;
  v5 = [(TVPPlayerReporter *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__playerStateWillChange_ name:@"TVPPlaybackStateWillChangeNotification" object:v4];
    [v7 addObserver:v6 selector:sel__playerCurrentMediaItemWillChange_ name:@"TVPPlaybackCurrentMediaItemWillChangeNotification" object:v4];
    [v7 addObserver:v6 selector:sel__playerCurrentMediaItemDidChange_ name:@"TVPPlaybackCurrentMediaItemDidChangeNotification" object:v4];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerReporter;
  [(TVPPlayerReporter *)&v4 dealloc];
}

- (void)sendPlaybackStartupMetricsManually
{
  v3 = [(TVPPlayerReporter *)self rtcAgent];

  if (v3)
  {
    [(TVPPlayerReporter *)self _sendPlaybackStartupEventsIfNecessary];
  }
  else
  {
    [(TVPPlayerReporter *)self _setupRTCAgent];
    [(TVPPlayerReporter *)self _sendPlaybackStartupEventsIfNecessary];
    [(TVPPlayerReporter *)self _tearDownRTCAgent];
  }
}

- (id)reportingHierarchyToken
{
  id reportingHierarchyToken = self->_reportingHierarchyToken;
  if (!reportingHierarchyToken)
  {
    [(TVPPlayerReporter *)self _setupRTCAgent];
    id reportingHierarchyToken = self->_reportingHierarchyToken;
  }
  return reportingHierarchyToken;
}

- (void)_playerStateWillChange:(id)a3
{
  id v10 = [a3 userInfo];
  objc_super v4 = [v10 objectForKey:@"TVPPlaybackStateOldStateKey"];
  v5 = [v10 objectForKey:@"TVPPlaybackStateNewStateKey"];
  v6 = +[TVPPlaybackState stopped];
  if (v4 == v6)
  {
    v8 = +[TVPPlaybackState stopped];

    if (v5 != v8)
    {
      [(TVPPlayerReporter *)self _setupRTCAgent];
      goto LABEL_7;
    }
  }
  else
  {
  }
  v7 = +[TVPPlaybackState stopped];

  if (v5 == v7)
  {
    [(TVPPlayerReporter *)self _sendPlaybackStartupEventsIfNecessary];
    [(TVPPlayerReporter *)self _tearDownRTCAgent];
  }
LABEL_7:
  if (v4 != v5)
  {
    objc_super v9 = +[TVPPlaybackState playing];

    if (v5 == v9) {
      [(TVPPlayerReporter *)self _sendPlaybackStartupEventsIfNecessary];
    }
  }
}

- (void)_setupRTCAgent
{
  v34[7] = *MEMORY[0x263EF8340];
  v3 = [(TVPPlayerReporter *)self rtcAgent];

  if (!v3)
  {
    objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];

    if (v5) {
      v6 = (__CFString *)v5;
    }
    else {
      v6 = &stru_26EA147D8;
    }
    uint64_t v7 = *MEMORY[0x263F62A68];
    v33[0] = *MEMORY[0x263F62A60];
    v33[1] = v7;
    v34[0] = &unk_26EA25CF0;
    v34[1] = &unk_26EA25D08;
    v33[2] = *MEMORY[0x263F62AA8];
    v8 = [NSNumber numberWithUnsignedInt:arc4random()];
    uint64_t v9 = *MEMORY[0x263F62A40];
    v34[2] = v8;
    v34[3] = MEMORY[0x263EFFA80];
    uint64_t v10 = *MEMORY[0x263F62A90];
    v33[3] = v9;
    v33[4] = v10;
    uint64_t v11 = *MEMORY[0x263F62A78];
    v34[4] = MEMORY[0x263EFFA88];
    v34[5] = MEMORY[0x263EFFA88];
    uint64_t v12 = *MEMORY[0x263F62A50];
    v33[5] = v11;
    v33[6] = v12;
    v34[6] = v6;
    v13 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:7];
    v14 = (void *)[v13 mutableCopy];

    v15 = [(TVPPlayerReporter *)self player];
    v16 = [v15 currentMediaItem];

    id v17 = [v16 mediaItemMetadataForProperty:@"TVPMediaItemMetadataRTCParentHierarchyToken"];
    v18 = sLogObject_4;
    BOOL v19 = os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, "Using existing RTC hierarchy token in reporter", buf, 2u);
      }
    }
    else
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, "Creating RTC hierarchy tokens in reporter", buf, 2u);
      }
      id v17 = (id)[MEMORY[0x263F62A08] newHierarchyTokenFromParentToken:0];
      if (v17)
      {
        v20 = (void *)[MEMORY[0x263F62A08] newHierarchyTokenFromParentToken:v17];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __35__TVPPlayerReporter__setupRTCAgent__block_invoke;
        v27[3] = &unk_264CC6538;
        id v28 = v16;
        id v17 = v17;
        id v29 = v17;
        id v30 = v20;
        id v21 = v20;
        [v28 performMediaItemMetadataTransactionWithBlock:v27];
      }
    }
    v22 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v17;
      _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "RTC hierarchy token for session: %@", buf, 0xCu);
    }
    if (v17) {
      [v14 setObject:v17 forKey:*MEMORY[0x263F62A80]];
    }
    id v23 = objc_alloc(MEMORY[0x263F62A08]);
    v24 = [(TVPPlayerReporter *)self _rtcAgentUserInfo];
    v25 = (void *)[v23 initWithSessionInfo:v14 userInfo:v24 frameworksToCheck:MEMORY[0x263EFFA68]];
    [(TVPPlayerReporter *)self setRtcAgent:v25];

    v26 = [(TVPPlayerReporter *)self rtcAgent];
    [v26 startConfigurationWithCompletionHandler:&__block_literal_global_23];
  }
}

uint64_t __35__TVPPlayerReporter__setupRTCAgent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMediaItemMetadata:*(void *)(a1 + 40) forProperty:@"TVPMediaItemMetadataRTCParentHierarchyToken"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setMediaItemMetadata:v3 forProperty:@"TVPMediaItemMetadataRTCChildHierarchyToken"];
}

void __35__TVPPlayerReporter__setupRTCAgent__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEBUG)) {
    __35__TVPPlayerReporter__setupRTCAgent__block_invoke_20_cold_1((uint64_t)v2, v3);
  }
}

- (void)_tearDownRTCAgent
{
}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  objc_super v4 = [a3 object];
  uint64_t v5 = [v4 currentMediaItem];
  if (v5)
  {
    v6 = [v4 state];
    uint64_t v7 = +[TVPPlaybackState stopped];

    if (v6 == v7)
    {
      v8 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Not sending playback startup report on media item will change because player is stopped", v9, 2u);
      }
    }
    else
    {
      [(TVPPlayerReporter *)self _sendPlaybackStartupEventsIfNecessary];
    }
  }
}

- (void)_playerCurrentMediaItemDidChange:(id)a3
{
  id v5 = [a3 object];
  objc_super v4 = [v5 currentMediaItem];
  [(TVPPlayerReporter *)self _tearDownRTCAgent];
  if (v4) {
    [(TVPPlayerReporter *)self _setupRTCAgent];
  }
}

- (void)_sendRTCEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(TVPPlayerReporter *)self rtcAgent];

  if (v12)
  {
    v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
    v14 = v13;
    if (v10) {
      [v13 setObject:v10 forKey:@"event"];
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = [NSNumber numberWithUnsignedShort:v8];
    [v15 setObject:v16 forKey:*MEMORY[0x263F62A18]];

    id v17 = [NSNumber numberWithUnsignedShort:v7];
    [v15 setObject:v17 forKey:*MEMORY[0x263F62A30]];

    [v15 setObject:&unk_26EA25D20 forKey:*MEMORY[0x263F62A20]];
    if (v14) {
      [v15 setObject:v14 forKey:*MEMORY[0x263F62A28]];
    }
    v18 = [(TVPPlayerReporter *)self rtcAgent];
    int v19 = [v18 sendMessageWithDictionary:v15 error:0];

    v20 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = @"unsuccessful";
      if (v19) {
        id v21 = @"successful";
      }
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "RTC Sending %@ payload was %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    v22 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_ERROR)) {
      -[TVPReportingSession _sendEvent:withCategory:type:values:]((uint64_t)v10, v22);
    }
  }
}

- (void)_sendPlaybackStartupEventsIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVPPlayerReporter *)self player];
  objc_super v4 = [v3 currentMediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];

  if (!v5) {
    goto LABEL_36;
  }
  if ([v5 complete]) {
    goto LABEL_36;
  }
  [v5 setComplete:1];
  uint64_t v6 = [v5 rtcReportingEventDict];
  if (!v6) {
    goto LABEL_36;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [v5 videoType];
  uint64_t v9 = v8;
  id v10 = @"UNDETERMINED";
  if (v8 == 2) {
    id v10 = @"HLS";
  }
  if (v8 == 1) {
    id v11 = @"FILE";
  }
  else {
    id v11 = v10;
  }
  uint64_t v12 = [(TVPPlayerReporter *)self _rtcAgentUserInfo];
  [v12 setObject:v11 forKey:@"assetType"];
  v13 = [(TVPPlayerReporter *)self rtcAgent];
  [v13 fetchReportingStatesWithUserInfo:v12 fetchComplete:&__block_literal_global_49];

  v14 = [v7 objectForKey:TVPPlaybackReportingEventPlaybackStartupResult];
  if ([v14 isEqualToString:TVPPlaybackReportingEventValueSuccess])
  {
    uint64_t v15 = 200;
  }
  else if ([v14 isEqualToString:TVPPlaybackReportingEventValueCancelled])
  {
    uint64_t v15 = 300;
  }
  else if ([v14 isEqualToString:TVPPlaybackReportingEventValueError])
  {
    uint64_t v15 = 500;
  }
  else
  {
    uint64_t v15 = 200;
  }
  v16 = [(TVPPlayerReporter *)self player];
  id v17 = [v16 currentMediaItem];
  v18 = [v17 mediaItemMetadataForProperty:@"TVPMediaItemMetadataRentalID"];

  if (!v9)
  {
    BOOL v24 = v18 == 0;
    __int16 v25 = 1200;
    goto LABEL_25;
  }
  if (v9 == 1)
  {
    BOOL v24 = v18 == 0;
    __int16 v25 = 1100;
LABEL_25:
    if (v24) {
      unsigned __int16 v19 = v25;
    }
    else {
      unsigned __int16 v19 = v25 + 1;
    }
    goto LABEL_31;
  }
  if (v9 == 2 && v18)
  {
    unsigned __int16 v19 = 1001;
  }
  else
  {
    v20 = [(TVPPlayerReporter *)self player];
    [v20 duration];
    double v22 = v21;

    if (v22 == 3.40282347e38)
    {
      int v23 = @"LIVE";
    }
    else
    {
      if (v22 == 0.0)
      {
        unsigned __int16 v19 = 1000;
        goto LABEL_31;
      }
      int v23 = @"VOD";
    }
    v26 = (void *)[v7 mutableCopy];
    [v26 setObject:v23 forKey:@"PlayType"];

    unsigned __int16 v19 = 1000;
    uint64_t v7 = v26;
  }
LABEL_31:
  uint64_t v27 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Reporting dict: %@", buf, 0xCu);
  }
  [(TVPPlayerReporter *)self _sendRTCEvent:@"playbackStartup" withCategory:v19 type:v15 values:v7];
  if (MGGetBoolAnswer())
  {
    id v28 = [(TVPPlayerReporter *)self player];
    id v29 = [NSString stringWithFormat:@"app playback startup metrics: %@", v7];
    [v28 setPlaybackHUDString:v29];
  }
LABEL_36:
}

- (id)_rtcAgentUserInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 executablePath];

  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = @"(UNKNOWN)";
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  id v10 = [(TVPPlayerReporter *)self player];
  id v11 = [v10 currentMediaItem];
  uint64_t v12 = [v11 mediaItemMetadataForProperty:@"TVPMediaItemMetadataServiceIdentifier"];
  v13 = [v11 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStoreFrontIdentifier"];
  v14 = [v11 mediaItemMetadataForProperty:@"TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"];
  if (![v12 length])
  {
    uint64_t v15 = [v14 objectForKey:*MEMORY[0x263EFA200]];

    if ([v15 length])
    {
      uint64_t v12 = v15;
    }
    else
    {
      v16 = NSString;
      unsigned __int16 v19 = [MEMORY[0x263F086E0] mainBundle];
      id v17 = [v19 bundleIdentifier];
      uint64_t v12 = [v16 stringWithFormat:@"(%@)", v17];
    }
  }
  [v3 setObject:v9 forKey:*MEMORY[0x263F62AB8]];
  if (v12) {
    [v3 setObject:v12 forKey:*MEMORY[0x263F62AC8]];
  }
  if (v13) {
    [v3 setObject:v13 forKey:@"StorefrontID"];
  }
  if (v14) {
    [v3 addEntriesFromDictionary:v14];
  }

  return v3;
}

- (TVPPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (TVPPlayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (RTCReporting)rtcAgent
{
  return (RTCReporting *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRtcAgent:(id)a3
{
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportingHierarchyToken, 0);
  objc_storeStrong((id *)&self->_rtcAgent, 0);
  objc_destroyWeak((id *)&self->_player);
}

void __35__TVPPlayerReporter__setupRTCAgent__block_invoke_20_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_236FC5000, a2, OS_LOG_TYPE_DEBUG, "RTCReporting backends: %@", (uint8_t *)&v2, 0xCu);
}

@end