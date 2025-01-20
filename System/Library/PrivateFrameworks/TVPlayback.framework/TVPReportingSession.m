@interface TVPReportingSession
+ (void)initialize;
- (RTCReporting)reporter;
- (TVPMediaItem)mediaItem;
- (TVPReportingSession)initWithMediaItem:(id)a3;
- (void)_sendEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6;
- (void)reportDownloadFinishedWithResult:(int64_t)a3 error:(id)a4;
- (void)setMediaItem:(id)a3;
- (void)setReporter:(id)a3;
@end

@implementation TVPReportingSession

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

uint64_t __33__TVPReportingSession_initialize__block_invoke()
{
  sLogObject = (uint64_t)os_log_create("com.apple.AppleTV.playback", "TVPReportingSession");
  return MEMORY[0x270F9A758]();
}

- (TVPReportingSession)initWithMediaItem:(id)a3
{
  v37[6] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TVPReportingSession;
  v6 = [(TVPReportingSession *)&v35 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_mediaItem, a3);
      v8 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v9 = [v8 bundleIdentifier];

      if (v9) {
        v10 = (__CFString *)v9;
      }
      else {
        v10 = &stru_26EA147D8;
      }
      uint64_t v11 = *MEMORY[0x263F62A68];
      v36[0] = *MEMORY[0x263F62A60];
      v36[1] = v11;
      v37[0] = &unk_26EA25BA0;
      v37[1] = &unk_26EA25BB8;
      v36[2] = *MEMORY[0x263F62AA8];
      v12 = [NSNumber numberWithUnsignedInt:arc4random()];
      uint64_t v13 = *MEMORY[0x263F62A40];
      v37[2] = v12;
      v37[3] = MEMORY[0x263EFFA80];
      uint64_t v14 = *MEMORY[0x263F62A78];
      v36[3] = v13;
      v36[4] = v14;
      v36[5] = *MEMORY[0x263F62A50];
      v37[4] = MEMORY[0x263EFFA88];
      v37[5] = v10;
      v15 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:6];
      v16 = (void *)[v15 mutableCopy];

      v17 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataServiceIdentifier"];
      v18 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"];
      if (![v17 length])
      {
        uint64_t v19 = [v18 objectForKey:*MEMORY[0x263EFA200]];

        v17 = (void *)v19;
      }
      if ([v17 length])
      {
        v34 = v16;
        v20 = v10;
        id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v22 = [MEMORY[0x263F086E0] mainBundle];
        v23 = [v22 executablePath];
        uint64_t v24 = [v23 lastPathComponent];
        v25 = (void *)v24;
        v26 = @"(UNKNOWN)";
        if (v24) {
          v26 = (__CFString *)v24;
        }
        v27 = v26;

        v28 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStoreFrontIdentifier"];
        [v21 setObject:v17 forKey:*MEMORY[0x263F62AC8]];
        [v21 setObject:v27 forKey:*MEMORY[0x263F62AB8]];

        if (v28) {
          [v21 setObject:v28 forKey:@"StorefrontID"];
        }
        v10 = v20;
        if (v18) {
          [v21 addEntriesFromDictionary:v18];
        }
        v16 = v34;
        uint64_t v29 = [objc_alloc(MEMORY[0x263F62A08]) initWithSessionInfo:v34 userInfo:v21 frameworksToCheck:0];
        reporter = v7->_reporter;
        v7->_reporter = (RTCReporting *)v29;

        [(RTCReporting *)v7->_reporter startConfigurationWithCompletionHandler:&__block_literal_global_19];
      }
      else
      {
        v32 = sLogObject;
        if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR)) {
          -[TVPReportingSession initWithMediaItem:](v32);
        }
      }
    }
    else
    {
      v31 = sLogObject;
      if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR)) {
        -[TVPReportingSession initWithMediaItem:](v31);
      }
    }
  }

  return v7;
}

void __41__TVPReportingSession_initWithMediaItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = sLogObject;
  if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "RTCReporting backends: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)reportDownloadFinishedWithResult:(int64_t)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 == 1) {
    unsigned int v7 = 300;
  }
  else {
    unsigned int v7 = 200;
  }
  if (a3 == 2) {
    uint64_t v8 = 500;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = v6;
  uint64_t v11 = v10;
  if (v10)
  {
    unsigned int v23 = v8;
    v25 = self;
    uint64_t v12 = 0;
    uint64_t v26 = *MEMORY[0x263F08608];
    id v24 = v10;
    do
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"errorDomain%d", v12);
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"errorCode%d", v12);
      v15 = [v11 domain];
      v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
      if (v15) {
        [v9 setObject:v15 forKey:v13];
      }
      [v9 setObject:v16 forKey:v14];
      v17 = [v11 userInfo];
      v18 = [v17 objectForKey:v26];

      if (!v18) {
        break;
      }
      uint64_t v11 = v18;
      BOOL v19 = v12 >= 9;
      uint64_t v12 = (v12 + 1);
    }
    while (!v19);

    uint64_t v11 = v24;
    self = v25;
    uint64_t v8 = v23;
  }
  v20 = [(TVPReportingSession *)self mediaItem];
  id v21 = [v20 mediaItemMetadataForProperty:@"TVPMediaItemMetadataDownloadQOSMetrics"];

  if (v21) {
    [v9 addEntriesFromDictionary:v21];
  }
  v22 = sLogObject;
  if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Sending download result %d with payload: %@", buf, 0x12u);
  }
  [(TVPReportingSession *)self _sendEvent:@"downloadResult" withCategory:12345 type:v8 values:v9];
}

- (void)_sendEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(TVPReportingSession *)self reporter];

  if (v12)
  {
    if (!v11) {
      id v11 = (id)MEMORY[0x263EFFA78];
    }
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
    uint64_t v14 = v13;
    if (v10) {
      [v13 setObject:v10 forKey:@"event"];
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = [NSNumber numberWithUnsignedShort:v8];
    [v15 setObject:v16 forKey:*MEMORY[0x263F62A18]];

    v17 = [NSNumber numberWithUnsignedShort:v7];
    [v15 setObject:v17 forKey:*MEMORY[0x263F62A30]];

    [v15 setObject:&unk_26EA25BD0 forKey:*MEMORY[0x263F62A20]];
    if (v14) {
      [v15 setObject:v14 forKey:*MEMORY[0x263F62A28]];
    }
    v18 = [(TVPReportingSession *)self reporter];
    int v19 = [v18 sendMessageWithDictionary:v15 error:0];

    v20 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = @"unsuccessful";
      if (v19) {
        id v21 = @"successful";
      }
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "RTC Sending %@ payload was %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    v22 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVPReportingSession _sendEvent:withCategory:type:values:]((uint64_t)v10, v22);
    }
  }
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (RTCReporting)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

- (void)initWithMediaItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Unable to create RTCReporting object since media item is nil", v1, 2u);
}

- (void)initWithMediaItem:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Unable to create RTCReporting object since service ID is nil", v1, 2u);
}

- (void)_sendEvent:(uint64_t)a1 withCategory:(NSObject *)a2 type:values:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "**** RTC is not configured. Not sending metrics for event %@. ****", (uint8_t *)&v2, 0xCu);
}

@end