@interface VSTrialVoiceResource
- (BOOL)isLocal;
- (NSString)language;
- (NSString)path;
- (VSTrialVoiceResource)initWithFactorLevel:(id)a3;
- (VSTrialVoiceResource)initWithFactorName:(id)a3;
- (VSTrialVoiceResource)initWithLanguage:(id)a3;
- (id)factorName;
- (unint64_t)version;
- (void)setLanguage:(id)a3;
- (void)setPath:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation VSTrialVoiceResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (VSTrialVoiceResource)initWithFactorLevel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 factor];
  v6 = [v5 name];
  v7 = [(VSTrialVoiceResource *)self initWithFactorName:v6];

  if (v7 && [v4 hasLevel])
  {
    v8 = [v4 level];
    v9 = [v8 directoryValue];

    if (v9)
    {
      if ([v9 hasPath])
      {
        v10 = [v9 path];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          uint64_t v12 = [v9 path];
          path = v7->_path;
          v7->_path = (NSString *)v12;
        }
      }
      v14 = [v4 level];
      v15 = [v14 metadata];
      v16 = [v15 objectForKeyedSubscript:@"ttsContentVersion"];

      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7->_version = [v16 integerValue];
        }
      }
    }
    else
    {
      v9 = VSGetLogDefault();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      v16 = [v4 factor];
      v18 = [v16 name];
      int v19 = 138412290;
      v20 = v18;
      _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "#Trial Error: resource should be as directory. Factor name: %@", (uint8_t *)&v19, 0xCu);
    }
LABEL_12:
  }
  return v7;
}

- (VSTrialVoiceResource)initWithFactorName:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrefix:@"com.apple.siri.tts.resource"]
    && ([v4 hasSuffix:@".version"] & 1) == 0)
  {
    v6 = [v4 componentsSeparatedByString:@"."];
    if ([v6 count] == 6)
    {
      v7 = [v6 objectAtIndexedSubscript:5];
      v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

      self = [(VSTrialVoiceResource *)self initWithLanguage:v8];
      v5 = self;
    }
    else
    {
      v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "#Trial Unexpected resource factor name: %@", (uint8_t *)&v11, 0xCu);
      }

      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (VSTrialVoiceResource)initWithLanguage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSTrialVoiceResource;
  v5 = [(VSTrialVoiceResource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    language = v5->_language;
    v5->_language = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isLocal
{
  return [(NSString *)self->_path length] != 0;
}

- (id)factorName
{
  v2 = [(NSString *)self->_language stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v3 = [NSString stringWithFormat:@"%@.resource.%@", @"com.apple.siri.tts", v2];

  return v3;
}

@end