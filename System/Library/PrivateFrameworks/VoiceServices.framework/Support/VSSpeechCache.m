@interface VSSpeechCache
+ (VSSpeechCache)defaultCacheStore;
- (BOOL)isPreinstalledCacheAvailableForRequest:(id)a3;
- (NSString)dirPath;
- (NSString)preinstalledCacheDir;
- (VSSpeechCache)initWithStorePath:(id)a3;
- (id)addCache:(id)a3;
- (id)cacheDataForKey:(id)a3;
- (id)preinstalledCacheForText:(id)a3 language:(id)a4 name:(id)a5;
- (unint64_t)totalCacheSize;
- (void)cleanCache;
- (void)deleteCache;
- (void)setDirPath:(id)a3;
- (void)setPreinstalledCacheDir:(id)a3;
@end

@implementation VSSpeechCache

- (NSString)dirPath
{
  return self->_dirPath;
}

+ (VSSpeechCache)defaultCacheStore
{
  if (defaultCacheStore_onceToken != -1) {
    dispatch_once(&defaultCacheStore_onceToken, &__block_literal_global_1099);
  }
  v2 = (void *)defaultCacheStore___defaultStore;
  return (VSSpeechCache *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preinstalledCacheDir, 0);
  objc_storeStrong((id *)&self->_dirPath, 0);
}

- (void)setPreinstalledCacheDir:(id)a3
{
}

- (NSString)preinstalledCacheDir
{
  return self->_preinstalledCacheDir;
}

- (void)setDirPath:(id)a3
{
}

- (void)deleteCache
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v3 = [(VSSpeechCache *)self dirPath];
  [v4 removeDirectory:v3];
}

- (unint64_t)totalCacheSize
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(VSSpeechCache *)self dirPath];
  unint64_t v5 = [v3 directorySize:v4];

  return v5;
}

- (void)cleanCache
{
  if ([MEMORY[0x263F84EB8] isHomePod]) {
    uint64_t v3 = 5000;
  }
  else {
    uint64_t v3 = 2000;
  }
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(VSSpeechCache *)self dirPath];
  [v5 cleanDirectory:v4 withLRULimit:v3];
}

- (BOOL)isPreinstalledCacheAvailableForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  v6 = [v4 languageCode];
  v7 = [v4 voiceName];

  v8 = [(VSSpeechCache *)self preinstalledCacheForText:v5 language:v6 name:v7];

  return v8 != 0;
}

- (id)cacheDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechCache *)self dirPath];
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  v8 = v7;
  if (v7 && (id v9 = v7, [v9 bytes]))
  {
    v10 = NSString;
    id v11 = v9;
    objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "bytes"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(v12);
    v14 = objc_msgSend(v11, "subdataWithRange:", 64, objc_msgSend(v11, "length") - 64);
    v15 = (void *)[[v13 alloc] initWithKey:v4 data:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)preinstalledCacheForText:(id)a3 language:(id)a4 name:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263F84EA8] availableLanguages];
  char v12 = [v11 containsObject:v9];

  if (v12)
  {
    v13 = v9;
  }
  else
  {
    v13 = [MEMORY[0x263F84EA8] fallbackLanguageForLanguage:v9];
    v14 = VSGetLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v9;
      __int16 v31 = 2114;
      id v32 = v13;
      _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_DEFAULT, "{public}%@ is not TTS language, falling back to %{public}@", buf, 0x16u);
    }
  }
  v15 = [v8 preinstalledAudioHashForLanguage:v13 name:v10];
  v16 = [(VSSpeechCache *)self preinstalledCacheDir];
  v17 = [NSString stringWithFormat:@"%@_%@", v13, v10];
  v18 = [v16 stringByAppendingPathComponent:v17];

  v19 = [v18 stringByAppendingPathComponent:v15];

  v20 = [v19 stringByAppendingPathExtension:@"caf"];

  v21 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v18) = [v21 isReadableFileAtPath:v20];

  if (v18)
  {
    id v28 = 0;
    v22 = [MEMORY[0x263F84E18] audioDataFromFile:v20 error:&v28];
    id v23 = v28;
    if (v23)
    {
      v24 = VSGetLogDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v23;
        _os_log_error_impl(&dword_226CB1000, v24, OS_LOG_TYPE_ERROR, "Error in reading audio data from file: %@ error:%@", buf, 0x16u);
      }
      v25 = 0;
    }
    else
    {
      v24 = [NSString stringWithFormat:@"%@:%@:%@:%@:%@:%@", v13, @"gryphon", @"unknown", v10, @"premium", @"0"];
      v26 = [NSString stringWithFormat:@"%@:%@:%@", v13, @"preinstalledCache", @"0"];
      v25 = [[VSSpeechCacheAudio alloc] initWithKey:v15 audio:v22 wordTimingInfo:0 voiceKey:v24 voiceResourceKey:v26];
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)addCache:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() description];
  v6 = [v5 dataUsingEncoding:4];
  if ((unint64_t)([v6 length] - 64) > 0xFFFFFFFFFFFFFFBELL)
  {
    id v9 = [v4 serializedData];
    id v11 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v9, "length") + 64);
    [v11 appendData:v6];
    [v11 setLength:64];
    [v11 appendData:v9];
    char v12 = [(VSSpeechCache *)self dirPath];
    uint64_t v13 = [v4 key];
    v14 = [v12 stringByAppendingPathComponent:v13];

    id v18 = 0;
    LOBYTE(v13) = [v11 writeToFile:v14 options:0 error:&v18];
    id v10 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = VSGetLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = [v10 description];
        *(_DWORD *)buf = 136315394;
        v20 = "-[VSSpeechCache addCache:]";
        __int16 v21 = 2112;
        v22 = v17;
        _os_log_error_impl(&dword_226CB1000, v15, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (const char *)v5;
      _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Cache type name too long %@", buf, 0xCu);
    }

    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08338];
    v24[0] = @"Cache type name too long";
    id v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v10 = [v8 errorWithDomain:@"VSSpeechCacheErrorDomain" code:0 userInfo:v9];
  }

  return v10;
}

- (VSSpeechCache)initWithStorePath:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VSSpeechCache;
  v6 = [(VSSpeechCache *)&v19 init];
  if (!v6) {
    goto LABEL_4;
  }
  v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.voiceservices"];
  uint64_t v8 = [v7 bundlePath];
  uint64_t v9 = [(id)v8 stringByAppendingPathComponent:@"TTSResources/PreinstallCache/"];
  preinstalledCacheDir = v6->_preinstalledCacheDir;
  v6->_preinstalledCacheDir = (NSString *)v9;

  objc_storeStrong((id *)&v6->_dirPath, a3);
  id v11 = [MEMORY[0x263F08850] defaultManager];
  dirPath = v6->_dirPath;
  id v18 = 0;
  LOBYTE(v8) = [v11 createDirectoryAtPath:dirPath withIntermediateDirectories:1 attributes:0 error:&v18];
  id v13 = v18;

  if (v8)
  {

LABEL_4:
    v14 = v6;
    goto LABEL_8;
  }
  v15 = VSGetLogDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = [v13 description];
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[VSSpeechCache initWithStorePath:]";
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_error_impl(&dword_226CB1000, v15, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_8:

  return v14;
}

void __34__VSSpeechCache_defaultCacheStore__block_invoke()
{
  v7[2] = *MEMORY[0x263EF8340];
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v1 = [v0 firstObject];

  v2 = NSString;
  v7[0] = v1;
  v7[1] = @"VoiceServices";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 pathWithComponents:v3];

  id v5 = [[VSSpeechCache alloc] initWithStorePath:v4];
  v6 = (void *)defaultCacheStore___defaultStore;
  defaultCacheStore___defaultStore = (uint64_t)v5;
}

@end