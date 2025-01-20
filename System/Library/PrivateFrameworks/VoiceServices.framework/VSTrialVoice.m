@interface VSTrialVoice
- (BOOL)isLocal;
- (NSString)language;
- (NSString)name;
- (NSString)path;
- (VSTrialVoice)initWithFactorLevel:(id)a3;
- (VSTrialVoice)initWithFactorName:(id)a3;
- (VSTrialVoice)initWithLanguage:(id)a3 name:(id)a4;
- (double)preferenceScore;
- (id)description;
- (id)factorName;
- (int64_t)compatibilityVersion;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)type;
- (unint64_t)assetSize;
- (unint64_t)version;
- (void)setAssetSize:(unint64_t)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setGender:(int64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation VSTrialVoice

- (BOOL)isLocal
{
  return [(NSString *)self->_path length] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (unint64_t)assetSize
{
  return self->_assetSize;
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

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (id)description
{
  v2 = NSString;
  v3 = [(VSTrialVoice *)self factorName];
  v4 = [v2 stringWithFormat:@"Voice factor name: %@", v3];

  return v4;
}

- (double)preferenceScore
{
  unint64_t v2 = self->_type - 1;
  double v3 = 0.0;
  if (v2 <= 3) {
    double v3 = dbl_20CB03938[v2];
  }
  int64_t footprint = self->_footprint;
  if (footprint == 3)
  {
    double v6 = v3 + 300.0;
  }
  else
  {
    double v5 = v3 + 200.0;
    if (footprint == 1) {
      double v3 = v3 + 100.0;
    }
    if (footprint == 2) {
      double v6 = v5;
    }
    else {
      double v6 = v3;
    }
  }
  BOOL v7 = [(VSTrialVoice *)self isLocal];
  double result = v6 + 10.0;
  if (!v7) {
    return v6;
  }
  return result;
}

- (id)factorName
{
  double v3 = [(NSString *)self->_language stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v4 = +[VSVoiceAsset typeStringFromType:self->_type];
  double v5 = +[VSVoiceAsset footprintStringFromFootprint:self->_footprint];
  double v6 = [NSString stringWithFormat:@"%@.voice.%@.%@.%@.%@", @"com.apple.siri.tts", v3, self->_name, v4, v5];

  return v6;
}

- (VSTrialVoice)initWithFactorLevel:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 factor];
  double v6 = [v5 name];
  BOOL v7 = [(VSTrialVoice *)self initWithFactorName:v6];

  if (v7)
  {
    if ([v4 hasLevel])
    {
      v8 = [v4 level];
      v9 = [v8 directoryValue];

      if (v9)
      {
        if ([v9 hasAsset])
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
          v16 = [v15 objectForKeyedSubscript:@"assetSize"];

          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v7->_assetSize = [v16 longLongValue];
            }
          }
          v17 = [v4 level];
          v18 = [v17 metadata];
          v19 = [v18 objectForKeyedSubscript:@"ttsCompatibilityVersion"];

          if (v19)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v7->_compatibilityVersion = [v19 integerValue];
            }
          }
          v20 = [v4 level];
          v21 = [v20 metadata];
          v22 = [v21 objectForKeyedSubscript:@"ttsContentVersion"];

          if (v22)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v7->_version = [v22 integerValue];
            }
          }
          v23 = [v4 level];
          v24 = [v23 metadata];
          v25 = [v24 objectForKeyedSubscript:@"gender"];

          if (v25) {
            v7->_gender = +[VSVoiceAsset genderFromString:v25];
          }

          goto LABEL_20;
        }
        v27 = VSGetLogDefault();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        v28 = [v4 factor];
        v29 = [v28 name];
        int v32 = 138412290;
        v33 = v29;
        v30 = "#Trial Error: voice is not deployed. It will be ignored. Factor name: %@";
      }
      else
      {
        v27 = VSGetLogDefault();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
LABEL_29:

          goto LABEL_30;
        }
        v28 = [v4 factor];
        v29 = [v28 name];
        int v32 = 138412290;
        v33 = v29;
        v30 = "#Trial Error: voice should be as directory. Factor name: %@";
      }
      _os_log_error_impl(&dword_20CABC000, v27, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0xCu);
    }
    else
    {
      v9 = VSGetLogDefault();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_30:

        v26 = 0;
        goto LABEL_31;
      }
      v27 = [v4 factor];
      v28 = [v27 name];
      int v32 = 138412290;
      v33 = v28;
      _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "#Trial Error: Factor has no level. It will be ignored. Factor name: %@", (uint8_t *)&v32, 0xCu);
    }

    goto LABEL_29;
  }
LABEL_20:
  v26 = v7;
LABEL_31:

  return v26;
}

- (VSTrialVoice)initWithFactorName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrefix:@"com.apple.siri.tts.voice"]
    && ([v4 hasSuffix:@".version"] & 1) == 0)
  {
    double v6 = [v4 componentsSeparatedByString:@"."];
    if ([v6 count] == 9)
    {
      BOOL v7 = [v6 objectAtIndexedSubscript:5];
      v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

      v9 = [v6 objectAtIndexedSubscript:6];
      v10 = [(VSTrialVoice *)self initWithLanguage:v8 name:v9];
      if (v10)
      {
        uint64_t v11 = [v6 objectAtIndexedSubscript:7];
        v10->_type = +[VSVoiceAsset typeFromString:v11];

        uint64_t v12 = [v6 objectAtIndexedSubscript:8];
        v10->_int64_t footprint = +[VSVoiceAsset footprintFromString:v12];
      }
      self = v10;

      double v5 = self;
    }
    else
    {
      v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, "#Trial Unexpected voice factor name: %@", (uint8_t *)&v15, 0xCu);
      }

      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (VSTrialVoice)initWithLanguage:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VSTrialVoice;
  v9 = [(VSTrialVoice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_language, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

@end