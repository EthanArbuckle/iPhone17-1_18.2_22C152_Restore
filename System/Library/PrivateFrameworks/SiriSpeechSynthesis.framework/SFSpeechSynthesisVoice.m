@interface SFSpeechSynthesisVoice
+ (id)getDefaultVoiceByLocale:(id)a3;
+ (id)getVoiceByName:(id)a3;
+ (id)supportedLocales;
+ (id)supportedVoicesByLocale:(id)a3;
+ (void)initialize;
- (BOOL)isDefault;
- (NSLocale)locale;
- (NSString)gender;
- (NSString)name;
- (SFSSResourceAsset)resourceAsset;
- (SFSSVoiceAsset)voiceAsset;
- (SFSpeechSynthesisServerVoiceConfig)serverVoiceConfig;
- (SFSpeechSynthesisVoice)initWithVoiceAsset:(id)a3 resourceAsset:(id)a4;
- (id)init:(id)a3 gender:(id)a4 name:(id)a5 isDefault:(BOOL)a6;
- (int64_t)voiceReleaseType;
- (int64_t)voiceType;
- (void)setResourceAsset:(id)a3;
- (void)setServerVoiceConfig:(id)a3;
- (void)setVoiceAsset:(id)a3;
- (void)setVoiceReleaseType:(int64_t)a3;
- (void)setVoiceType:(int64_t)a3;
@end

@implementation SFSpeechSynthesisVoice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVoiceConfig, 0);
  objc_storeStrong((id *)&self->_resourceAsset, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setServerVoiceConfig:(id)a3
{
}

- (SFSpeechSynthesisServerVoiceConfig)serverVoiceConfig
{
  return self->_serverVoiceConfig;
}

- (void)setResourceAsset:(id)a3
{
}

- (SFSSResourceAsset)resourceAsset
{
  return self->_resourceAsset;
}

- (void)setVoiceAsset:(id)a3
{
}

- (SFSSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (void)setVoiceReleaseType:(int64_t)a3
{
  self->_voiceReleaseType = a3;
}

- (int64_t)voiceReleaseType
{
  return self->_voiceReleaseType;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)init:(id)a3 gender:(id)a4 name:(id)a5 isDefault:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFSpeechSynthesisVoice;
  v14 = [(SFSpeechSynthesisVoice *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_locale, a3);
    objc_storeStrong((id *)&v15->_gender, a4);
    objc_storeStrong((id *)&v15->_name, a5);
    v15->_isDefault = a6;
  }

  return v15;
}

- (SFSpeechSynthesisVoice)initWithVoiceAsset:(id)a3 resourceAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFSpeechSynthesisVoice;
  v9 = [(SFSpeechSynthesisVoice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceAsset, a3);
    objc_storeStrong((id *)&v10->_resourceAsset, a4);
  }

  return v10;
}

+ (id)getDefaultVoiceByLocale:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF960], "currentLocale", a3);
  v5 = [a1 supportedVoicesByLocale:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDefault", (void)v12))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)getVoiceByName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)sSupportedVoices;
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "name", (void)v12);
        char v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)supportedVoicesByLocale:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)sSupportedVoices;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "locale", (void)v14);
        int v12 = [v11 isEqual:v3];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)supportedLocales
{
  return (id)sSupportedLocales;
}

+ (void)initialize
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v22 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v2 pathForResource:@"tts_voices" ofType:@"plist"];

    v20 = (void *)v3;
    id v4 = [NSDictionary dictionaryWithContentsOfFile:v3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [v4 objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v8)];
          char v10 = [v9 objectForKey:@"default"];
          BOOL v11 = v10 != 0;

          int v12 = [v9 objectForKey:@"locale"];
          long long v13 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v12];
          long long v14 = [v9 objectForKey:@"gender"];
          long long v15 = [v9 objectForKey:@"name"];
          id v16 = [[SFSpeechSynthesisVoice alloc] init:v13 gender:v14 name:v15 isDefault:v11];
          [v21 addObject:v16];
          [v22 addObject:v13];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }
    long long v17 = (void *)sSupportedVoices;
    sSupportedVoices = (uint64_t)v21;
    id v18 = v21;

    uint64_t v19 = (void *)sSupportedLocales;
    sSupportedLocales = (uint64_t)v22;
  }
}

@end