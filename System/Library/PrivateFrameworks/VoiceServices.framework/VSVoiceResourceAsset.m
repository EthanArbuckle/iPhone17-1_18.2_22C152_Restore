@interface VSVoiceResourceAsset
+ (BOOL)supportsSecureCoding;
+ (id)resourceFromTrial:(id)a3;
- (NSArray)languages;
- (NSArray)resourceList;
- (NSDictionary)resourceMimeTypes;
- (NSDictionary)vocalizerConfig;
- (NSDictionary)voiceConfig;
- (NSURL)searchPathURL;
- (VSVoiceResourceAsset)initWithCoder:(id)a3;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)_defaultVoices;
- (id)defaultVoice;
- (id)defaultVoiceNameForGender:(int64_t)a3;
- (id)description;
- (id)key;
- (int64_t)defaultVoiceGender;
- (int64_t)defaultVoiceType;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setPitch:(float)a3;
- (void)setRate:(float)a3;
- (void)setResourceList:(id)a3;
- (void)setResourceMimeTypes:(id)a3;
- (void)setSearchPathURL:(id)a3;
- (void)setVocalizerConfig:(id)a3;
- (void)setVoiceConfig:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation VSVoiceResourceAsset

+ (id)resourceFromTrial:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setStorage:3];
  v5 = [v3 language];
  v13[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v4 setLanguages:v6];

  v7 = [v3 path];

  if (v7)
  {
    v8 = NSURL;
    v9 = [v3 path];
    v10 = [v8 fileURLWithPath:v9];
    [v4 setSearchPathURL:v10];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "version"));
  [v4 setContentVersion:v11];

  [v4 setCompatibilityVersion:&unk_26C1BAB30];
  [v4 setIsPurgeable:1];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocalizerConfig, 0);
  objc_storeStrong((id *)&self->_voiceConfig, 0);
  objc_storeStrong((id *)&self->_searchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceMimeTypes, 0);
  objc_storeStrong((id *)&self->_resourceList, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

- (void)setVocalizerConfig:(id)a3
{
}

- (void)setVoiceConfig:(id)a3
{
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (void)setSearchPathURL:(id)a3
{
}

- (NSURL)searchPathURL
{
  return self->_searchPathURL;
}

- (void)setResourceMimeTypes:(id)a3
{
}

- (void)setResourceList:(id)a3
{
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)languages
{
  return self->_languages;
}

- (id)defaultVoice
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
      v8,
      2u);
  }

  id v4 = [(VSVoiceResourceAsset *)self _defaultVoices];
  v5 = [v4 objectForKeyedSubscript:@"default"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = @"Gender";
    v10[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)defaultVoiceType
{
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
      v9,
      2u);
  }

  id v4 = [(VSVoiceResourceAsset *)self defaultVoiceNameForGender:2];
  uint64_t v5 = [(VSVoiceResourceAsset *)self defaultVoiceNameForGender:1];
  v6 = (void *)v5;
  if (v4 && v5 && ![v4 isEqualToString:v5]) {
    int64_t v7 = 3;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)defaultVoiceNameForGender:(int64_t)a3
{
  id v4 = [(VSVoiceResourceAsset *)self _defaultVoices];
  uint64_t v5 = +[VSVoiceAsset genderStringFromGender:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (int64_t)defaultVoiceGender
{
  v2 = [(VSVoiceResourceAsset *)self _defaultVoices];
  id v3 = [v2 objectForKeyedSubscript:@"default"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = +[VSVoiceAsset genderFromString:v3];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_defaultVoices
{
  id v3 = [(VSVoiceResourceAsset *)self voiceConfig];

  if (v3)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self voiceConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"_voices"];

    if (v5)
    {
      v6 = v5;
      int64_t v7 = v6;
      goto LABEL_10;
    }
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "voice_configs.plist does not have key '_voices'", v10, 2u);
    }

    v6 = 0;
  }
  else
  {
    v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Unable to read voice_configs.plist", buf, 2u);
    }
  }
  int64_t v7 = 0;
LABEL_10:

  return v7;
}

- (NSArray)resourceList
{
  resourceList = self->_resourceList;
  if (!resourceList)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self voiceConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"vocalizer_resource_order"];
    v6 = self->_resourceList;
    self->_resourceList = v5;

    resourceList = self->_resourceList;
  }
  return resourceList;
}

- (NSDictionary)resourceMimeTypes
{
  resourceMimeTypes = self->_resourceMimeTypes;
  if (!resourceMimeTypes)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self voiceConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"vocalizer_resources"];
    v6 = self->_resourceMimeTypes;
    self->_resourceMimeTypes = v5;

    resourceMimeTypes = self->_resourceMimeTypes;
  }
  return resourceMimeTypes;
}

- (NSDictionary)voiceConfig
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  voiceConfig = self->_voiceConfig;
  if (!voiceConfig)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self searchPathURL];
    uint64_t v5 = [v4 URLByAppendingPathComponent:@"voice_configs.plist"];

    id v11 = 0;
    v6 = [NSDictionary dictionaryWithContentsOfURL:v5 error:&v11];
    id v7 = v11;
    v8 = self->_voiceConfig;
    self->_voiceConfig = v6;

    if (v7)
    {
      v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v5;
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "Unable to load plist at '%{public}@', error: %{public}@", buf, 0x16u);
      }
    }
    voiceConfig = self->_voiceConfig;
  }
  return voiceConfig;
}

- (NSDictionary)vocalizerConfig
{
  vocalizerConfig = self->_vocalizerConfig;
  if (!vocalizerConfig)
  {
    int64_t v4 = NSDictionary;
    uint64_t v5 = [(VSVoiceResourceAsset *)self searchPathURL];
    v6 = [v5 URLByAppendingPathComponent:@"VoiceServices-Config.plist"];
    id v7 = [v4 dictionaryWithContentsOfURL:v6];
    v8 = self->_vocalizerConfig;
    self->_vocalizerConfig = v7;

    vocalizerConfig = self->_vocalizerConfig;
  }
  return vocalizerConfig;
}

- (float)volume
{
  float result = self->_volume;
  if (result == 0.0)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self vocalizerConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"voice_speech_volume"];

    [v5 floatValue];
    self->_volume = v6;

    return self->_volume;
  }
  return result;
}

- (float)pitch
{
  float result = self->_pitch;
  if (result == 0.0)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self vocalizerConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"voice_speech_pitch"];

    [v5 floatValue];
    self->_pitch = v6;

    return self->_pitch;
  }
  return result;
}

- (float)rate
{
  float result = self->_rate;
  if (result == 0.0)
  {
    int64_t v4 = [(VSVoiceResourceAsset *)self vocalizerConfig];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"voice_speech_rate"];

    [v5 floatValue];
    self->_rate = v6;

    return self->_rate;
  }
  return result;
}

- (id)key
{
  id v3 = NSString;
  int64_t v4 = [(VSVoiceResourceAsset *)self languages];
  uint64_t v5 = [v4 firstObject];
  float v6 = [(VSAssetBase *)self masteredVersion];
  id v7 = [(VSAssetBase *)self contentVersion];
  v8 = [v3 stringWithFormat:@"%@:%@:%@", v5, v6, v7];

  return v8;
}

- (VSVoiceResourceAsset)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSVoiceResourceAsset;
  uint64_t v5 = [(VSAssetBase *)&v14 initWithCoder:v4];
  if (v5)
  {
    float v6 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_languages"];
    languages = v5->_languages;
    v5->_languages = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_searchPathURL"];
    searchPathURL = v5->_searchPathURL;
    v5->_searchPathURL = (NSURL *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VSVoiceResourceAsset;
  id v4 = a3;
  [(VSAssetBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, @"_languages", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_searchPathURL forKey:@"_searchPathURL"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(NSArray *)self->_languages componentsJoinedByString:@", "];
  objc_super v5 = [(VSAssetBase *)self contentVersion];
  float v6 = [v3 stringWithFormat:@"VoiceResource: %@_CV%@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end