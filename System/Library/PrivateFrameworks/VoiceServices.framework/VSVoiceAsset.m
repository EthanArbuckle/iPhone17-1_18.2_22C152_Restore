@interface VSVoiceAsset
+ (BOOL)supportsSecureCoding;
+ (id)compatibilityVersionFromMobileAssetAttributes:(id)a3;
+ (id)footprintStringFromFootprint:(int64_t)a3;
+ (id)genderStringFromGender:(int64_t)a3;
+ (id)languagesFromMobileAssetAttributes:(id)a3;
+ (id)typeStringFromType:(int64_t)a3;
+ (int64_t)footprintFromString:(id)a3;
+ (int64_t)genderFromString:(id)a3;
+ (int64_t)typeFromString:(id)a3;
- (BOOL)isBuiltInVoice;
- (BOOL)isInstalled;
- (BOOL)isVoiceReadyToUse;
- (NSArray)languages;
- (NSString)name;
- (VSVoiceAsset)initWithCoder:(id)a3;
- (VSVoiceAsset)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)descriptiveKey;
- (id)dictionaryRepresentation;
- (id)initFromMobileAssetAttributes:(id)a3;
- (id)nameKey;
- (id)voiceKey;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)type;
- (void)amendNameVersionAndSizeWithMobileAssetAttributes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setGender:(int64_t)a3;
- (void)setIsBuiltInVoice:(BOOL)a3;
- (void)setIsInstalled:(BOOL)a3;
- (void)setIsVoiceReadyToUse:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VSVoiceAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)amendNameVersionAndSizeWithMobileAssetAttributes:(id)a3
{
  id v16 = a3;
  v4 = [(VSVoiceAsset *)self name];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    v6 = [v16 objectForKeyedSubscript:@"Name"];
    [(VSVoiceAsset *)self setName:v6];
  }
  v7 = [(VSAssetBase *)self masteredVersion];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    v9 = [v16 objectForKeyedSubscript:*MEMORY[0x263F55898]];
    [(VSAssetBase *)self setMasteredVersion:v9];
  }
  v10 = [(VSAssetBase *)self contentVersion];

  if (!v10)
  {
    v11 = [v16 objectForKeyedSubscript:*MEMORY[0x263F55880]];
    [(VSAssetBase *)self setContentVersion:v11];
  }
  v12 = [(VSAssetBase *)self compatibilityVersion];

  if (!v12)
  {
    v13 = +[VSVoiceAsset compatibilityVersionFromMobileAssetAttributes:v16];
    [(VSAssetBase *)self setCompatibilityVersion:v13];
  }
  v14 = [(VSAssetBase *)self downloadSize];

  if (!v14)
  {
    v15 = [v16 objectForKeyedSubscript:*MEMORY[0x263F55888]];
    [(VSAssetBase *)self setDownloadSize:v15];
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
}

- (void)setLanguages:(id)a3
{
}

- (void)setIsVoiceReadyToUse:(BOOL)a3
{
  self->_isVoiceReadyToUse = a3;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (NSString)name
{
  return self->_name;
}

+ (id)languagesFromMobileAssetAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"LanguagesCompatibility"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"LanguagesCompatibility"];
    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v13 = [v3 objectForKeyedSubscript:@"Languages"];
    if (v13)
    {
      id v7 = v13;
      v6 = v7;
    }
    else
    {
      v14 = [v3 objectForKeyedSubscript:@"Language"];
      v20 = v14;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

      id v7 = 0;
    }
  }

  return v6;
}

+ (id)compatibilityVersionFromMobileAssetAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F55868]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v3 objectForKeyedSubscript:@"Name"];
      uint64_t v10 = [v3 objectForKeyedSubscript:*MEMORY[0x263F55880]];
      int v11 = 138412802;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v4;
      _os_log_debug_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEBUG, "ASAttributeCompatibilityVersion should be NSNumber, got NSString for %@\tCV: %@\tCompatibility: %@", (uint8_t *)&v11, 0x20u);
    }
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (int64_t)footprintFromString:(id)a3
{
  id v3 = [a3 lowercaseString];
  v4 = [@"compact" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [@"premium" lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 2;
    }
    else
    {
      uint64_t v9 = [@"premiumhigh" lowercaseString];
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        int64_t v6 = 3;
      }
      else
      {
        int v11 = [@"beta" lowercaseString];
        uint64_t v12 = [v3 isEqualToString:v11];

        int64_t v6 = v12 << 63 >> 63;
      }
    }
  }

  return v6;
}

+ (int64_t)genderFromString:(id)a3
{
  id v3 = [a3 lowercaseString];
  v4 = [@"male" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [@"female" lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 2;
    }
    else
    {
      uint64_t v9 = [@"neutral" lowercaseString];
      int v10 = [v3 isEqualToString:v9];

      if (v10) {
        int64_t v6 = 3;
      }
      else {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_isInstalled = a3;
}

+ (id)typeStringFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_2640E8D88[a3];
  }
}

- (id)initFromMobileAssetAttributes:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VSVoiceAsset;
  id v3 = a3;
  v4 = [(VSVoiceAsset *)&v10 init];
  char v5 = +[VSVoiceAsset languagesFromMobileAssetAttributes:](VSVoiceAsset, "languagesFromMobileAssetAttributes:", v3, v10.receiver, v10.super_class);
  [(VSVoiceAsset *)v4 setLanguages:v5];

  int64_t v6 = [v3 objectForKeyedSubscript:@"Gender"];
  [(VSVoiceAsset *)v4 setGender:+[VSVoiceAsset genderFromString:v6]];

  id v7 = [v3 objectForKeyedSubscript:@"Type"];
  [(VSVoiceAsset *)v4 setType:+[VSVoiceAsset typeFromString:v7]];

  char v8 = [v3 objectForKeyedSubscript:@"Footprint"];
  [(VSVoiceAsset *)v4 setFootprint:+[VSVoiceAsset footprintFromString:v8]];

  [(VSVoiceAsset *)v4 amendNameVersionAndSizeWithMobileAssetAttributes:v3];
  return v4;
}

- (BOOL)isVoiceReadyToUse
{
  return self->_isVoiceReadyToUse;
}

- (void)setIsBuiltInVoice:(BOOL)a3
{
  self->_isBuiltInVoice = a3;
}

- (BOOL)isBuiltInVoice
{
  return self->_isBuiltInVoice;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSArray)languages
{
  return self->_languages;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"Name"];
  }
  languages = self->_languages;
  if (languages) {
    [v4 setObject:languages forKey:@"Languages"];
  }
  id v7 = [NSNumber numberWithLong:self->_gender];
  [v4 setObject:v7 forKey:@"Gender"];

  if (self->_type)
  {
    char v8 = objc_msgSend(NSNumber, "numberWithLong:");
    [v4 setObject:v8 forKey:@"Type"];
  }
  uint64_t v9 = [(VSAssetBase *)self masteredVersion];

  if (v9)
  {
    objc_super v10 = [(VSAssetBase *)self masteredVersion];
    [v4 setObject:v10 forKey:@"MasteredVersion"];
  }
  int v11 = [(VSAssetBase *)self contentVersion];

  if (v11)
  {
    uint64_t v12 = [(VSAssetBase *)self contentVersion];
    [v4 setObject:v12 forKey:@"ContentVersion"];
  }
  return v4;
}

- (VSVoiceAsset)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSVoiceAsset;
  char v5 = [(VSVoiceAsset *)&v21 init];
  if (v5)
  {
    int64_t v6 = [v4 objectForKey:@"Name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    [(VSVoiceAsset *)v5 setName:v7];
    char v8 = [v4 objectForKey:@"Languages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_3550];
      objc_super v10 = [v8 filteredArrayUsingPredicate:v9];
      [(VSVoiceAsset *)v5 setLanguages:v10];
    }
    else
    {
      [(VSVoiceAsset *)v5 setLanguages:0];
    }
    int v11 = [v4 objectForKey:@"Gender"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v11 integerValue];
    }
    else {
      uint64_t v12 = 0;
    }
    [(VSVoiceAsset *)v5 setGender:v12];
    __int16 v13 = [v4 objectForKey:@"Type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = [v13 integerValue];
    }
    else {
      uint64_t v14 = 0;
    }
    [(VSVoiceAsset *)v5 setType:v14];
    __int16 v15 = [v4 objectForKey:@"MasteredVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v16 = v15;
    }
    else {
      long long v16 = 0;
    }
    [(VSAssetBase *)v5 setMasteredVersion:v16];
    uint64_t v17 = [v4 objectForKey:@"ContentVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v18 = v17;
    }
    else {
      long long v18 = 0;
    }
    [(VSAssetBase *)v5 setContentVersion:v18];
    long long v19 = v5;
  }
  return v5;
}

uint64_t __49__VSVoiceAsset_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (VSVoiceAsset)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSVoiceAsset;
  char v5 = [(VSAssetBase *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    char v8 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    objc_super v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_languages"];
    languages = v5->_languages;
    v5->_languages = (NSArray *)v11;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_gender = [v4 decodeIntegerForKey:@"_gender"];
    v5->_footprint = [v4 decodeIntegerForKey:@"_footprint"];
    v5->_isInstalled = [v4 decodeBoolForKey:@"_isInstalled"];
    v5->_isBuiltInVoice = [v4 decodeBoolForKey:@"_isBuiltInVoice"];
    v5->_isVoiceReadyToUse = [v4 decodeBoolForKey:@"_isVoiceReadyToUse"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VSVoiceAsset;
  id v4 = a3;
  [(VSAssetBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_languages forKey:@"_languages"];
  [v4 encodeInteger:self->_type forKey:@"_type"];
  [v4 encodeInteger:self->_gender forKey:@"_gender"];
  [v4 encodeInteger:self->_footprint forKey:@"_footprint"];
  [v4 encodeBool:self->_isInstalled forKey:@"_isInstalled"];
  [v4 encodeBool:self->_isBuiltInVoice forKey:@"_isBuiltInVoice"];
  [v4 encodeBool:self->_isVoiceReadyToUse forKey:@"_isVoiceReadyToUse"];
}

- (id)description
{
  __int16 v15 = NSString;
  id v3 = +[VSVoiceAsset typeStringFromType:[(VSVoiceAsset *)self type]];
  name = self->_name;
  id v4 = [(NSArray *)self->_languages componentsJoinedByString:@", "];
  objc_super v5 = +[VSVoiceAsset genderStringFromGender:[(VSVoiceAsset *)self gender]];
  uint64_t v6 = +[VSVoiceAsset footprintStringFromFootprint:[(VSVoiceAsset *)self footprint]];
  id v7 = [NSNumber numberWithBool:self->_isInstalled];
  char v8 = [(VSAssetBase *)self contentVersion];
  uint64_t v9 = [(VSAssetBase *)self masteredVersion];
  objc_super v10 = [(VSAssetBase *)self downloadSize];
  uint64_t v11 = [NSNumber numberWithBool:self->_isBuiltInVoice];
  uint64_t v12 = [v15 stringWithFormat:@"Type:%@, Name: %@, Languages: %@, Gender: %@, Footprint: %@, Installed: %@, ContentVersion: %@, MasteredVersion: %@, downloadSize: %@, isBuiltIn: %@", v3, name, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)descriptiveKey
{
  id v3 = NSString;
  id v4 = [(NSArray *)self->_languages componentsJoinedByString:@", "];
  objc_super v5 = +[VSVoiceAsset typeStringFromType:[(VSVoiceAsset *)self type]];
  uint64_t v6 = +[VSVoiceAsset genderStringFromGender:[(VSVoiceAsset *)self gender]];
  id v7 = [(VSVoiceAsset *)self nameKey];
  char v8 = +[VSVoiceAsset footprintStringFromFootprint:[(VSVoiceAsset *)self footprint]];
  uint64_t v9 = [(VSAssetBase *)self contentVersion];
  objc_super v10 = [(VSAssetBase *)self masteredVersion];
  uint64_t v11 = [(VSAssetBase *)self compatibilityVersion];
  uint64_t v12 = [v3 stringWithFormat:@"%@:%@:%@:%@:%@:CV%@:MV%@:Compatibility%@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)voiceKey
{
  id v3 = NSString;
  id v4 = [(NSArray *)self->_languages firstObject];
  objc_super v5 = +[VSVoiceAsset typeStringFromType:self->_type];
  uint64_t v6 = +[VSVoiceAsset genderStringFromGender:self->_gender];
  id v7 = [(VSVoiceAsset *)self nameKey];
  char v8 = +[VSVoiceAsset footprintStringFromFootprint:self->_footprint];
  uint64_t v9 = [(VSAssetBase *)self contentVersion];
  objc_super v10 = [v3 stringWithFormat:@"%@:%@:%@:%@:%@:%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)nameKey
{
  name = (__CFString *)self->_name;
  if (!name)
  {
    if (!self->_isBuiltInVoice) {
      return 0;
    }
    name = @"builtin";
  }
  return name;
}

+ (int64_t)typeFromString:(id)a3
{
  id v3 = [a3 lowercaseString];
  id v4 = [@"vocalizer" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [@"custom" lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 2;
    }
    else
    {
      uint64_t v9 = [@"gryphon" lowercaseString];
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        int64_t v6 = 3;
      }
      else
      {
        uint64_t v11 = [@"neural" lowercaseString];
        int v12 = [v3 isEqualToString:v11];

        if (v12) {
          int64_t v6 = 4;
        }
        else {
          int64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

+ (id)footprintStringFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return @"unknown";
  }
  else {
    return off_2640E8D60[a3 + 1];
  }
}

+ (id)genderStringFromGender:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_2640E8D40[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end