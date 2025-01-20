@interface VSDiagnosticService
+ (id)defaultService;
- (NSDictionary)audioDumpFileAttributes;
- (NSString)audioDumpPath;
- (VSDiagnosticService)initWithDirectory:(id)a3;
- (unint64_t)totalDiagnosticFileSize;
- (void)collectTailspin:(id)a3;
- (void)createDirectoryIfNeeded;
- (void)dumpCompressedAudio:(id)a3 forRequest:(id)a4;
- (void)dumpInstrumentMetrics:(id)a3 withTimestamp:(int64_t)a4;
- (void)dumpStreamAudio:(id)a3 forRequest:(id)a4;
- (void)removeDirectory;
- (void)removeOldFiles;
- (void)setAudioDumpFileAttributes:(id)a3;
- (void)setAudioDumpPath:(id)a3;
@end

@implementation VSDiagnosticService

+ (id)defaultService
{
  if (defaultService_onceToken != -1) {
    dispatch_once(&defaultService_onceToken, &__block_literal_global_2193);
  }
  v2 = (void *)defaultService___defaultStore;
  return v2;
}

- (unint64_t)totalDiagnosticFileSize
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(VSDiagnosticService *)self audioDumpPath];
  unint64_t v5 = [v3 directorySize:v4];

  return v5;
}

- (NSString)audioDumpPath
{
  return self->_audioDumpPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDumpFileAttributes, 0);
  objc_storeStrong((id *)&self->_audioDumpPath, 0);
}

- (void)setAudioDumpFileAttributes:(id)a3
{
}

- (NSDictionary)audioDumpFileAttributes
{
  return self->_audioDumpFileAttributes;
}

- (void)setAudioDumpPath:(id)a3
{
}

- (void)collectTailspin:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(VSDiagnosticService *)self createDirectoryIfNeeded];
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
  v6 = NSString;
  v7 = [MEMORY[0x263EFF910] date];
  v8 = [v5 stringFromDate:v7];
  v9 = [v6 stringWithFormat:@"TTS-stall-%@.tailspin", v8];

  v10 = NSString;
  v22[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
  v22[1] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v12 = [v10 pathWithComponents:v11];

  v13 = [MEMORY[0x263F08850] defaultManager];
  [v13 createFileAtPath:v12 contents:0 attributes:0];

  v14 = [MEMORY[0x263F08840] fileHandleForUpdatingAtPath:v12];
  [v14 fileDescriptor];
  v15 = dispatch_get_global_queue(9, 0);
  v20 = v12;
  v21 = v4;
  v19 = v14;
  id v16 = v12;
  id v17 = v4;
  id v18 = v14;
  tailspin_dump_output();
}

uint64_t __39__VSDiagnosticService_collectTailspin___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dumpInstrumentMetrics:(id)a3 withTimestamp:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v20 = 0;
    v7 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v20];
    v8 = v20;
    if (v8)
    {
      v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v6;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_error_impl(&dword_226CB1000, v9, OS_LOG_TYPE_ERROR, "Unable to parse json for dictionary '%@', error: %@", buf, 0x16u);
      }
    }
    else
    {
      [(VSDiagnosticService *)self createDirectoryIfNeeded];
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"TTSMetrics-%lld", a4);
      v10 = NSString;
      v21[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
      v11 = [v9 stringByAppendingString:@".json"];
      v21[1] = v11;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      v13 = [v10 pathWithComponents:v12];

      v14 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__VSDiagnosticService_dumpInstrumentMetrics_withTimestamp___block_invoke;
      block[3] = &unk_2647DCC20;
      id v17 = v13;
      id v18 = self;
      id v19 = v7;
      id v15 = v13;
      dispatch_async(v14, block);
    }
  }
  else
  {
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "No json data to dump", buf, 2u);
    }
  }
}

void __59__VSDiagnosticService_dumpInstrumentMetrics_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) audioDumpFileAttributes];
  [v2 createFileAtPath:v3 contents:0 attributes:v4];

  LOBYTE(v3) = [*(id *)(a1 + 48) writeToFile:*(void *)(a1 + 32) atomically:1];
  id v5 = VSGetLogDefault();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Instrument metrics json dump saved as %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Unable to create instrument metrics json dump at '%@'", (uint8_t *)&v9, 0xCu);
  }
}

- (void)dumpStreamAudio:(id)a3 forRequest:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([a4 canLogRequestText])
  {
    if (v6)
    {
      [(VSDiagnosticService *)self createDirectoryIfNeeded];
      uint64_t v7 = objc_alloc_init(MEMORY[0x263F08790]);
      [v7 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
      uint64_t v8 = NSString;
      int v9 = [MEMORY[0x263EFF910] date];
      uint64_t v10 = [v7 stringFromDate:v9];
      uint64_t v11 = [v8 stringWithFormat:@"TTS-%@", v10];

      v12 = NSString;
      v25[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
      v13 = [v11 stringByAppendingString:@".tmp"];
      v25[1] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      id v15 = [v12 pathWithComponents:v14];

      id v16 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__VSDiagnosticService_dumpStreamAudio_forRequest___block_invoke;
      block[3] = &unk_2647DCBF8;
      id v20 = v15;
      v21 = self;
      id v22 = v6;
      id v23 = v11;
      id v17 = v11;
      id v18 = v15;
      dispatch_async(v16, block);
    }
    else
    {
      uint64_t v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "No audio do dump", buf, 2u);
      }
    }
  }
}

void __50__VSDiagnosticService_dumpStreamAudio_forRequest___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) audioDumpFileAttributes];
  [v2 createFileAtPath:v3 contents:0 attributes:v4];

  if ([*(id *)(a1 + 48) writeWaveToFilePath:*(void *)(a1 + 32)])
  {
    id v5 = NSString;
    v20[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
    id v6 = [*(id *)(a1 + 56) stringByAppendingString:@".wav"];
    v20[1] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v8 = [v5 pathWithComponents:v7];

    int v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = 0;
    [v9 moveItemAtPath:v10 toPath:v8 error:&v15];
    id v11 = v15;

    v12 = VSGetLogDefault();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "Unable to create audio dump at '%@', error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_226CB1000, v13, OS_LOG_TYPE_INFO, "Audio save as %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v17 = v14;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Unable to create intermediate audio dump at '%@'", buf, 0xCu);
    }
  }
}

- (void)dumpCompressedAudio:(id)a3 forRequest:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([a4 canLogRequestText])
  {
    if (v6)
    {
      [(VSDiagnosticService *)self createDirectoryIfNeeded];
      uint64_t v7 = objc_alloc_init(MEMORY[0x263F08790]);
      [v7 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
      uint64_t v8 = NSString;
      int v9 = [MEMORY[0x263EFF910] date];
      uint64_t v10 = [v7 stringFromDate:v9];
      id v11 = [v8 stringWithFormat:@"TTS-%@", v10];

      v12 = NSString;
      v25[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
      v13 = [v11 stringByAppendingString:@".tmp"];
      v25[1] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      id v15 = [v12 pathWithComponents:v14];

      id v16 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__VSDiagnosticService_dumpCompressedAudio_forRequest___block_invoke;
      block[3] = &unk_2647DCBF8;
      id v20 = v15;
      v21 = self;
      id v22 = v6;
      id v23 = v11;
      id v17 = v11;
      id v18 = v15;
      dispatch_async(v16, block);
    }
    else
    {
      uint64_t v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "No compressed audio do dump", buf, 2u);
      }
    }
  }
}

void __54__VSDiagnosticService_dumpCompressedAudio_forRequest___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) audioDumpFileAttributes];
  [v2 createFileAtPath:v3 contents:0 attributes:v4];

  if ([*(id *)(a1 + 48) writeToFilePath:*(void *)(a1 + 32)])
  {
    id v5 = NSString;
    v20[0] = @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/";
    id v6 = [*(id *)(a1 + 56) stringByAppendingString:@".wav"];
    v20[1] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v8 = [v5 pathWithComponents:v7];

    int v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = 0;
    [v9 moveItemAtPath:v10 toPath:v8 error:&v15];
    id v11 = v15;

    v12 = VSGetLogDefault();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "Unable to create audio dump at '%@', error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_226CB1000, v13, OS_LOG_TYPE_INFO, "Audio save as %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v17 = v14;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Unable to create intermediate audio dump at '%@'", buf, 0xCu);
    }
  }
}

- (void)createDirectoryIfNeeded
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v14 = 0;
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 fileExistsAtPath:self->_audioDumpPath isDirectory:&v14];

  if (!v14)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    audioDumpPath = self->_audioDumpPath;
    audioDumpFileAttributes = self->_audioDumpFileAttributes;
    id v13 = 0;
    char v7 = [v4 createDirectoryAtPath:audioDumpPath withIntermediateDirectories:1 attributes:audioDumpFileAttributes error:&v13];
    id v8 = v13;

    int v9 = VSGetLogDefault();
    uint64_t v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_audioDumpPath;
        *(_DWORD *)buf = 138412290;
        id v16 = (const char *)v11;
        _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "Created audio dump directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = [v8 description];
      *(_DWORD *)buf = 136315394;
      id v16 = "-[VSDiagnosticService createDirectoryIfNeeded]";
      __int16 v17 = 2112;
      __int16 v18 = v12;
      _os_log_error_impl(&dword_226CB1000, v10, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);
    }
  }
}

- (void)removeDirectory
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [(VSDiagnosticService *)self audioDumpPath];
  [v4 removeDirectory:v3];
}

- (void)removeOldFiles
{
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-864000.0];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(VSDiagnosticService *)self audioDumpPath];
  [v3 cleanDirectory:v4 withDateOlderThan:v5];
}

- (VSDiagnosticService)initWithDirectory:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSDiagnosticService;
  id v6 = [(VSDiagnosticService *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioDumpPath, a3);
    uint64_t v12 = *MEMORY[0x263F08060];
    v13[0] = @"mobile";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    audioDumpFileAttributes = v7->_audioDumpFileAttributes;
    v7->_audioDumpFileAttributes = (NSDictionary *)v8;
  }
  return v7;
}

void __37__VSDiagnosticService_defaultService__block_invoke()
{
  v0 = [MEMORY[0x263F84E90] standardInstance];
  int v1 = [v0 enableAudioDump];

  if (v1)
  {
    defaultService___defaultStore = [[VSDiagnosticService alloc] initWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/"];
    MEMORY[0x270F9A758]();
  }
}

@end