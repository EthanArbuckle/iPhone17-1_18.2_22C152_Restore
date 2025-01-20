@interface TVPAudioOption
- (AVMediaSelectionOption)avMediaSelectionOption;
- (BOOL)hasAudioDescriptions;
- (BOOL)hasMediaCharacteristic:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)mediaCharacteristics;
- (NSString)languageCodeBCP47;
- (NSString)languageCodeFromLocale;
- (NSString)localizedDisplayString;
- (NSString)savedLocaleLanguageCode;
- (NSString)title;
- (TVPAudioOption)initWithOption:(id)a3;
- (TVPAudioOption)initWithPropertyListRepresentation:(id)a3;
- (TVPAudioOption)initWithSavedTrackID:(int)a3 savedLocaleLanguageCode:(id)a4;
- (id)description;
- (id)propertyListRepresentation;
- (int)trackID;
- (unint64_t)hash;
- (void)_currentLocaleDidChange:(id)a3;
- (void)dealloc;
- (void)setAvMediaSelectionOption:(id)a3;
- (void)setLanguageCodeBCP47:(id)a3;
- (void)setLanguageCodeFromLocale:(id)a3;
- (void)setLocalizedDisplayString:(id)a3;
- (void)setPropertyListRepresentation:(id)a3;
- (void)setSavedLocaleLanguageCode:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrackID:(int)a3;
@end

@implementation TVPAudioOption

- (TVPAudioOption)initWithPropertyListRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPAudioOption;
  v6 = [(TVPAudioOption *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_propertyListRepresentation, a3);
    v7->_trackID = 0;
  }

  return v7;
}

- (TVPAudioOption)initWithSavedTrackID:(int)a3 savedLocaleLanguageCode:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TVPAudioOption;
  v7 = [(TVPAudioOption *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_trackID = a3;
    uint64_t v9 = [v6 copy];
    savedLocaleLanguageCode = v8->_savedLocaleLanguageCode;
    v8->_savedLocaleLanguageCode = (NSString *)v9;
  }
  return v8;
}

- (TVPAudioOption)initWithOption:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVPAudioOption;
  id v6 = [(TVPAudioOption *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avMediaSelectionOption, a3);
    v7->_trackID = 0;
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPAudioOption;
  [(TVPAudioOption *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(TVPAudioOption *)self avMediaSelectionOption];
    id v6 = [v4 avMediaSelectionOption];
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
  v2 = [(TVPAudioOption *)self avMediaSelectionOption];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)languageCodeFromLocale
{
  p_languageCodeFromLocale = &self->_languageCodeFromLocale;
  languageCodeFromLocale = self->_languageCodeFromLocale;
  if (!languageCodeFromLocale)
  {
    objc_storeStrong((id *)p_languageCodeFromLocale, self->_savedLocaleLanguageCode);
    languageCodeFromLocale = self->_languageCodeFromLocale;
    if (!languageCodeFromLocale)
    {
      id v5 = [(TVPAudioOption *)self avMediaSelectionOption];
      id v6 = [v5 locale];

      char v7 = [v6 objectForKey:*MEMORY[0x263EFF508]];
      v8 = (NSString *)[v7 copy];
      uint64_t v9 = self->_languageCodeFromLocale;
      self->_languageCodeFromLocale = v8;

      languageCodeFromLocale = self->_languageCodeFromLocale;
    }
  }
  return languageCodeFromLocale;
}

- (NSString)languageCodeBCP47
{
  languageCodeBCP47 = self->_languageCodeBCP47;
  if (!languageCodeBCP47)
  {
    id v4 = [(TVPAudioOption *)self avMediaSelectionOption];
    id v5 = [v4 extendedLanguageTag];
    id v6 = (NSString *)[v5 copy];
    char v7 = self->_languageCodeBCP47;
    self->_languageCodeBCP47 = v6;

    languageCodeBCP47 = self->_languageCodeBCP47;
  }
  return languageCodeBCP47;
}

- (NSString)localizedDisplayString
{
  localizedDisplayString = self->_localizedDisplayString;
  if (!localizedDisplayString)
  {
    id v4 = [(TVPAudioOption *)self avMediaSelectionOption];
    id v5 = objc_msgSend(v4, "tvp_localizedDisplayString");
    id v6 = (NSString *)[v5 copy];
    char v7 = self->_localizedDisplayString;
    self->_localizedDisplayString = v6;

    localizedDisplayString = self->_localizedDisplayString;
  }
  return localizedDisplayString;
}

- (NSString)title
{
  title = self->_title;
  if (!title)
  {
    id v4 = (void *)MEMORY[0x263EFA748];
    id v5 = [(TVPAudioOption *)self avMediaSelectionOption];
    id v6 = [v5 commonMetadata];
    char v7 = [v4 metadataItemsFromArray:v6 filteredByIdentifier:*MEMORY[0x263EF9D78]];
    v8 = [v7 firstObject];
    uint64_t v9 = [v8 stringValue];
    objc_super v10 = (NSString *)[v9 copy];
    v11 = self->_title;
    self->_title = v10;

    title = self->_title;
  }
  return title;
}

- (id)propertyListRepresentation
{
  id v3 = self->_propertyListRepresentation;
  if (!v3)
  {
    id v4 = [(TVPAudioOption *)self avMediaSelectionOption];
    id v3 = [v4 propertyList];
  }
  return v3;
}

- (BOOL)hasAudioDescriptions
{
  v2 = [(TVPAudioOption *)self avMediaSelectionOption];
  char v3 = [v2 hasMediaCharacteristic:*MEMORY[0x263EF9CA8]];

  return v3;
}

- (NSArray)mediaCharacteristics
{
  v2 = [(TVPAudioOption *)self avMediaSelectionOption];
  char v3 = [v2 mediaCharacteristics];

  return (NSArray *)v3;
}

- (id)description
{
  v2 = [(TVPAudioOption *)self avMediaSelectionOption];
  char v3 = [v2 description];

  return v3;
}

- (int)trackID
{
  v2 = self;
  LODWORD(self) = self->_trackID;
  if (!self)
  {
    self = [(TVPAudioOption *)v2 avMediaSelectionOption];
    if (self)
    {
      char v3 = self;
      id v4 = [(TVPAudioOption *)v2 avMediaSelectionOption];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = [(TVPAudioOption *)v2 avMediaSelectionOption];
        int v7 = [v6 trackID];

        LODWORD(self) = v7;
      }
      else
      {
        LODWORD(self) = 0;
      }
    }
  }
  return (int)self;
}

- (void)_currentLocaleDidChange:(id)a3
{
}

- (BOOL)hasMediaCharacteristic:(id)a3
{
  id v4 = a3;
  char v5 = [(TVPAudioOption *)self avMediaSelectionOption];
  char v6 = [v5 hasMediaCharacteristic:v4];

  return v6;
}

- (void)setLanguageCodeFromLocale:(id)a3
{
}

- (void)setLanguageCodeBCP47:(id)a3
{
}

- (void)setLocalizedDisplayString:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setPropertyListRepresentation:(id)a3
{
}

- (AVMediaSelectionOption)avMediaSelectionOption
{
  return self->_avMediaSelectionOption;
}

- (void)setAvMediaSelectionOption:(id)a3
{
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (NSString)savedLocaleLanguageCode
{
  return self->_savedLocaleLanguageCode;
}

- (void)setSavedLocaleLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedLocaleLanguageCode, 0);
  objc_storeStrong((id *)&self->_avMediaSelectionOption, 0);
  objc_storeStrong(&self->_propertyListRepresentation, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
  objc_storeStrong((id *)&self->_languageCodeBCP47, 0);
  objc_storeStrong((id *)&self->_languageCodeFromLocale, 0);
}

@end