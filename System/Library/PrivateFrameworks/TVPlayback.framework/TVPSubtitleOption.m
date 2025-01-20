@interface TVPSubtitleOption
+ (id)autoSubtitleOption;
+ (id)offSubtitleOption;
+ (id)offSubtitleOptionWithAVMediaSelectionOption:(id)a3;
- (AVMediaSelectionOption)avMediaSelectionOption;
- (BOOL)containsOnlyForcedSubtitles;
- (BOOL)isEqual:(id)a3;
- (NSNumber)cachedContainsOnlyForcedSubtitles;
- (NSNumber)cachedSubtitleType;
- (NSString)identifier;
- (NSString)languageCodeBCP47;
- (NSString)languageCodeFromLocale;
- (NSString)localizedDisplayString;
- (TVPSubtitleOption)initWithAVMediaSelectionOption:(id)a3;
- (id)description;
- (int64_t)subtitleType;
- (unint64_t)hash;
- (void)_currentLocaleDidChange:(id)a3;
- (void)dealloc;
- (void)setAvMediaSelectionOption:(id)a3;
- (void)setCachedContainsOnlyForcedSubtitles:(id)a3;
- (void)setCachedSubtitleType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCodeBCP47:(id)a3;
- (void)setLanguageCodeFromLocale:(id)a3;
- (void)setLocalizedDisplayString:(id)a3;
@end

@implementation TVPSubtitleOption

+ (id)offSubtitleOption
{
  v2 = [(TVPSubtitleOption *)[TVPOffSubtitleOption alloc] initWithAVMediaSelectionOption:0];
  return v2;
}

+ (id)offSubtitleOptionWithAVMediaSelectionOption:(id)a3
{
  id v3 = a3;
  v4 = [(TVPSubtitleOption *)[TVPOffSubtitleOption alloc] initWithAVMediaSelectionOption:v3];

  return v4;
}

+ (id)autoSubtitleOption
{
  v2 = [(TVPSubtitleOption *)[TVPAutoSubtitleOption alloc] initWithAVMediaSelectionOption:0];
  return v2;
}

- (TVPSubtitleOption)initWithAVMediaSelectionOption:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVPSubtitleOption;
  v6 = [(TVPSubtitleOption *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avMediaSelectionOption, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPSubtitleOption;
  [(TVPSubtitleOption *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    v6 = [v4 avMediaSelectionOption];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(TVPSubtitleOption *)self avMediaSelectionOption];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)languageCodeFromLocale
{
  if (!self->_languageCodeFromLocale)
  {
    unint64_t v3 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    id v4 = [v3 locale];
    objc_msgSend(v4, "tvp_subtitleLanguageCode");
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    languageCodeFromLocale = self->_languageCodeFromLocale;
    self->_languageCodeFromLocale = v5;

    if (!self->_languageCodeFromLocale && [(TVPSubtitleOption *)self subtitleType] == 2)
    {
      char v7 = self->_languageCodeFromLocale;
      self->_languageCodeFromLocale = (NSString *)@"en";
    }
  }
  v8 = self->_languageCodeFromLocale;
  return v8;
}

- (NSString)languageCodeBCP47
{
  languageCodeBCP47 = self->_languageCodeBCP47;
  if (!languageCodeBCP47)
  {
    id v4 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    id v5 = [v4 extendedLanguageTag];
    v6 = (NSString *)[v5 copy];
    char v7 = self->_languageCodeBCP47;
    self->_languageCodeBCP47 = v6;

    languageCodeBCP47 = self->_languageCodeBCP47;
  }
  return languageCodeBCP47;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    id v4 = (void *)MEMORY[0x263EFA748];
    id v5 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    v6 = [v5 commonMetadata];
    char v7 = [v4 metadataItemsFromArray:v6 withKey:*MEMORY[0x263EF9DC8] keySpace:*MEMORY[0x263EF9E78]];

    v8 = [v7 firstObject];
    v9 = [v8 stringValue];
    objc_super v10 = (NSString *)[v9 copy];
    v11 = self->_identifier;
    self->_identifier = v10;

    if (!self->_identifier)
    {
      self->_identifier = (NSString *)&stru_26EA147D8;
    }
    identifier = self->_identifier;
  }
  return identifier;
}

- (NSString)localizedDisplayString
{
  localizedDisplayString = self->_localizedDisplayString;
  if (!localizedDisplayString)
  {
    id v4 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    id v5 = objc_msgSend(v4, "tvp_localizedDisplayString");
    v6 = (NSString *)[v5 copy];
    char v7 = self->_localizedDisplayString;
    self->_localizedDisplayString = v6;

    localizedDisplayString = self->_localizedDisplayString;
  }
  return localizedDisplayString;
}

- (BOOL)containsOnlyForcedSubtitles
{
  cachedContainsOnlyForcedSubtitles = self->_cachedContainsOnlyForcedSubtitles;
  if (!cachedContainsOnlyForcedSubtitles)
  {
    id v4 = NSNumber;
    id v5 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "hasMediaCharacteristic:", *MEMORY[0x263EF9C98]));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    char v7 = self->_cachedContainsOnlyForcedSubtitles;
    self->_cachedContainsOnlyForcedSubtitles = v6;

    cachedContainsOnlyForcedSubtitles = self->_cachedContainsOnlyForcedSubtitles;
  }
  return [(NSNumber *)cachedContainsOnlyForcedSubtitles BOOLValue];
}

- (int64_t)subtitleType
{
  cachedSubtitleType = self->_cachedSubtitleType;
  if (!cachedSubtitleType)
  {
    id v4 = [(TVPSubtitleOption *)self avMediaSelectionOption];
    id v5 = [v4 mediaType];
    char v6 = [v5 isEqualToString:*MEMORY[0x263EF9CF0]];

    if (v6)
    {
      uint64_t v7 = 2;
    }
    else if ([v4 hasMediaCharacteristic:*MEMORY[0x263EF9CA0]] {
           && ([v4 hasMediaCharacteristic:*MEMORY[0x263EF9CD8]] & 1) != 0)
    }
    {
      uint64_t v7 = 1;
    }
    else if ([v4 hasMediaCharacteristic:*MEMORY[0x263EF9CB0]])
    {
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8 = [NSNumber numberWithInteger:v7];
    v9 = self->_cachedSubtitleType;
    self->_cachedSubtitleType = v8;

    cachedSubtitleType = self->_cachedSubtitleType;
  }
  return [(NSNumber *)cachedSubtitleType integerValue];
}

- (id)description
{
  v2 = [(TVPSubtitleOption *)self avMediaSelectionOption];
  unint64_t v3 = [v2 description];

  return v3;
}

- (void)_currentLocaleDidChange:(id)a3
{
}

- (void)setLanguageCodeFromLocale:(id)a3
{
}

- (void)setLanguageCodeBCP47:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setLocalizedDisplayString:(id)a3
{
}

- (AVMediaSelectionOption)avMediaSelectionOption
{
  return self->_avMediaSelectionOption;
}

- (void)setAvMediaSelectionOption:(id)a3
{
}

- (NSNumber)cachedContainsOnlyForcedSubtitles
{
  return self->_cachedContainsOnlyForcedSubtitles;
}

- (void)setCachedContainsOnlyForcedSubtitles:(id)a3
{
}

- (NSNumber)cachedSubtitleType
{
  return self->_cachedSubtitleType;
}

- (void)setCachedSubtitleType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubtitleType, 0);
  objc_storeStrong((id *)&self->_cachedContainsOnlyForcedSubtitles, 0);
  objc_storeStrong((id *)&self->_avMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_languageCodeBCP47, 0);
  objc_storeStrong((id *)&self->_languageCodeFromLocale, 0);
}

@end