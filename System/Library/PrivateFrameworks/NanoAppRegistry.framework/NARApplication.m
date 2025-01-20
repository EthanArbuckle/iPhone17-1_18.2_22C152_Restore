@interface NARApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)isHidden;
- (BOOL)supportsForegroundApplication;
- (NARApplication)initWithCoder:(id)a3;
- (NARApplicationState)appState;
- (NARGlance)glance;
- (NSArray)appTags;
- (NSArray)localizations;
- (NSArray)supportedSchemes;
- (NSDictionary)iTunesPlistStrings;
- (NSDictionary)infoPlist;
- (NSDictionary)localizedBundleNames;
- (NSDictionary)localizedDisplayNames;
- (NSDictionary)localizedStrings;
- (NSString)applicationIdentifier;
- (NSString)bundleName;
- (NSString)bundleVersion;
- (NSString)itemName;
- (NSString)launchServicesBundleType;
- (NSString)localizedDisplayName;
- (NSString)parentApplicationBundleIdentifier;
- (NSString)vendorName;
- (id)description;
- (id)objectForInfoDictionaryKey:(id)a3;
- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAppState:(id)a3;
- (void)setAppTags:(id)a3;
- (void)setITunesPlistStrings:(id)a3;
- (void)setInfoPlist:(id)a3;
- (void)setLaunchServicesBundleType:(id)a3;
- (void)setLocalizedStrings:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSupportsForegroundApplication:(BOOL)a3;
@end

@implementation NARApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NARApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NARApplication;
  v5 = [(NARApplication *)&v23 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_0);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__plistClasses forKey:@"infoPlist"];
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClasses:initWithCoder__plistClasses forKey:@"localizedStrings"];
    localizedStrings = v5->_localizedStrings;
    v5->_localizedStrings = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClasses:initWithCoder__plistClasses forKey:@"iTunesPlistStrings"];
    iTunesPlistStrings = v5->_iTunesPlistStrings;
    v5->_iTunesPlistStrings = (NSDictionary *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceNumber"];
    v5->_sequenceNumber = [v12 unsignedIntegerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchServicesBundleType"];
    launchServicesBundleType = v5->_launchServicesBundleType;
    v5->_launchServicesBundleType = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appState"];
    appState = v5->_appState;
    v5->_appState = (NARApplicationState *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:initWithCoder__plistClasses forKey:@"appTags"];
    appTags = v5->_appTags;
    v5->_appTags = (NSArray *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsForegroundApplication"];
    v20 = v19;
    if (v19) {
      char v21 = [v19 BOOLValue];
    }
    else {
      char v21 = 1;
    }
    v5->_supportsForegroundApplication = v21;
  }
  return v5;
}

uint64_t __32__NARApplication_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  initWithCoder__plistClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (void)encodeWithCoder:(id)a3
{
  infoPlist = self->_infoPlist;
  id v5 = a3;
  [v5 encodeObject:infoPlist forKey:@"infoPlist"];
  [v5 encodeObject:self->_localizedStrings forKey:@"localizedStrings"];
  [v5 encodeObject:self->_iTunesPlistStrings forKey:@"iTunesPlistStrings"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
  [v5 encodeObject:v6 forKey:@"sequenceNumber"];

  [v5 encodeObject:self->_launchServicesBundleType forKey:@"launchServicesBundleType"];
  [v5 encodeObject:self->_appState forKey:@"appState"];
  [v5 encodeObject:self->_appTags forKey:@"appTags"];
  id v7 = [NSNumber numberWithBool:self->_supportsForegroundApplication];
  [v5 encodeObject:v7 forKey:@"supportsForegroundApplication"];
}

- (NSString)applicationIdentifier
{
  uint64_t v2 = [(NARApplication *)self infoPlist];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFB58]];

  return (NSString *)v3;
}

- (NSString)bundleName
{
  uint64_t v2 = [(NARApplication *)self infoPlist];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFB68]];

  return (NSString *)v3;
}

- (NSDictionary)localizedBundleNames
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(NARApplication *)self localizedStrings];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__NARApplication_localizedBundleNames__block_invoke;
  v7[3] = &unk_264853A30;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __38__NARApplication_localizedBundleNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263EFFB68]];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (NSString)bundleVersion
{
  uint64_t v2 = [(NARApplication *)self infoPlist];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];

  return (NSString *)v3;
}

- (NSString)localizedDisplayName
{
  uint64_t v3 = [(NARApplication *)self localizedDisplayNames];
  uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
  id v5 = [v4 localeIdentifier];

  uint64_t v6 = [v3 objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = v5;
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v10 = [v9 preferredLocalizations];
    id v8 = [v10 firstObject];

    uint64_t v11 = [v3 objectForKeyedSubscript:v8];
    if (v11)
    {
      id v7 = (void *)v11;
    }
    else
    {
      v12 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v13 = [v12 languageCode];

      id v7 = [v3 objectForKeyedSubscript:v13];
      if (!v7)
      {
        v14 = [(NARApplication *)self infoPlist];
        id v7 = [v14 objectForKeyedSubscript:*MEMORY[0x263EFFA90]];

        if (!v7)
        {
          id v7 = [(NARApplication *)self bundleName];
          if (!v7)
          {
            uint64_t v15 = [(NARApplication *)self applicationIdentifier];
            v16 = [v15 componentsSeparatedByString:@"."];
            id v7 = [v16 lastObject];
          }
        }
      }
    }
  }

  return (NSString *)v7;
}

- (NSDictionary)localizedDisplayNames
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(NARApplication *)self localizedStrings];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NARApplication_localizedDisplayNames__block_invoke;
  v7[3] = &unk_264853A30;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSDictionary *)v5;
}

void __39__NARApplication_localizedDisplayNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263EFFA90]];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (NSString)vendorName
{
  uint64_t v2 = [(NARApplication *)self iTunesPlistStrings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"artistName"];

  return (NSString *)v3;
}

- (NSString)itemName
{
  uint64_t v2 = [(NARApplication *)self iTunesPlistStrings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"itemName"];

  return (NSString *)v3;
}

- (NSArray)supportedSchemes
{
  uint64_t v2 = [(NARApplication *)self infoPlist];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFAA8]];

  return (NSArray *)v3;
}

- (BOOL)isHidden
{
  return [(NSArray *)self->_appTags containsObject:@"hidden"];
}

- (NSArray)localizations
{
  uint64_t v2 = [(NARApplication *)self localizedStrings];
  uint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NARApplication *)self infoPlist];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NARApplication *)self localizedStrings];
  v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)NARApplication;
  uint64_t v3 = [(NARApplication *)&v8 description];
  id v4 = [(NARApplication *)self applicationIdentifier];
  id v5 = [v3 stringByAppendingFormat:@" %@", v4];

  if (![(NARApplication *)self supportsForegroundApplication])
  {
    uint64_t v6 = [v5 stringByAppendingString:@" <HEADLESS>"];

    id v5 = (void *)v6;
  }

  return v5;
}

- (NARGlance)glance
{
  return 0;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)launchServicesBundleType
{
  return self->_launchServicesBundleType;
}

- (void)setLaunchServicesBundleType:(id)a3
{
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (NSArray)appTags
{
  return self->_appTags;
}

- (void)setAppTags:(id)a3
{
}

- (BOOL)supportsForegroundApplication
{
  return self->_supportsForegroundApplication;
}

- (void)setSupportsForegroundApplication:(BOOL)a3
{
  self->_supportsForegroundApplication = a3;
}

- (NARApplicationState)appState
{
  return self->_appState;
}

- (void)setAppState:(id)a3
{
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
}

- (NSDictionary)localizedStrings
{
  return self->_localizedStrings;
}

- (void)setLocalizedStrings:(id)a3
{
}

- (NSDictionary)iTunesPlistStrings
{
  return self->_iTunesPlistStrings;
}

- (void)setITunesPlistStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesPlistStrings, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_appTags, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_launchServicesBundleType, 0);
}

@end