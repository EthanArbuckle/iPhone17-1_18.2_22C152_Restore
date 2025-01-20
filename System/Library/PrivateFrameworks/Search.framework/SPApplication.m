@interface SPApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)displayNameLoaded;
- (BOOL)isAppClip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)isWebClip;
- (NSMutableArray)keywords;
- (NSString)appBundleIdentifier;
- (NSString)displayIdentifier;
- (NSString)displayName;
- (NSString)displayNameInternal;
- (NSString)longDisplayName;
- (NSString)shortVersion;
- (NSString)subtitle;
- (NSString)utiType;
- (NSURL)URL;
- (SPApplication)initWithCoder:(id)a3;
- (id)description;
- (int64_t)webClipType;
- (void)copyToSearchFoundationResult:(id)a3;
- (void)displayName;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setDisplayIdentifier:(id)a3;
- (void)setDisplayNameInternal:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setLongDisplayName:(id)a3;
- (void)setShortVersion:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setURL:(id)a3;
- (void)setWebClipType:(int64_t)a3;
@end

@implementation SPApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  displayIdentifier = self->_displayIdentifier;
  id v6 = a3;
  [v6 encodeObject:displayIdentifier forKey:@"_displayIdentifier"];
  v5 = [(SPApplication *)self displayNameInternal];
  [v6 encodeObject:v5 forKey:@"_displayNameInternal"];

  [v6 encodeObject:self->_longDisplayName forKey:@"_longDisplayName"];
  [v6 encodeObject:self->_keywords forKey:@"_keywords"];
  [v6 encodeObject:self->_URL forKey:@"_URL"];
  [v6 encodeObject:self->_shortVersion forKey:@"_shortVersion"];
  [v6 encodeInteger:self->_webClipType forKey:@"_webClipType"];
  [v6 encodeObject:self->_appBundleIdentifier forKey:@"_appBundleIdentifier"];
  [v6 encodeObject:self->_subtitle forKey:@"_subtitle"];
  [v6 encodeBool:self->_isPlaceholder forKey:@"_isPlaceholder"];
}

- (SPApplication)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global);
  }
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_displayIdentifier"];
  displayIdentifier = self->_displayIdentifier;
  self->_displayIdentifier = v6;

  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_displayNameInternal"];
  [(SPApplication *)self setDisplayNameInternal:v8];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_longDisplayName"];
  longDisplayName = self->_longDisplayName;
  self->_longDisplayName = v9;

  v11 = [v5 decodeObjectOfClasses:initWithCoder__objectClasses forKey:@"_keywords"];
  keywords = self->_keywords;
  self->_keywords = v11;

  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_URL"];
  URL = self->_URL;
  self->_URL = v13;

  v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_shortVersion"];
  shortVersion = self->_shortVersion;
  self->_shortVersion = v15;

  self->_webClipType = [v5 decodeIntegerForKey:@"_webClipType"];
  v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_appBundleIdentifier"];
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v17;

  v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitle"];
  subtitle = self->_subtitle;
  self->_subtitle = v19;

  LOBYTE(v8) = [v5 decodeBoolForKey:@"_isPlaceholder"];
  self->_isPlaceholder = (char)v8;
  return self;
}

uint64_t __31__SPApplication_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  initWithCoder__objectClasses = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (BOOL)isWebClip
{
  return self->_webClipType > 1uLL;
}

- (BOOL)isAppClip
{
  return self->_webClipType == 1;
}

- (id)description
{
  v3 = NSString;
  displayIdentifier = self->_displayIdentifier;
  uint64_t v5 = [(SPApplication *)self displayNameInternal];
  id v6 = (void *)v5;
  longDisplayName = (__CFString *)self->_longDisplayName;
  v8 = @", long name:";
  shortVersion = &stru_26CF85E78;
  if (!longDisplayName)
  {
    v8 = &stru_26CF85E78;
    longDisplayName = &stru_26CF85E78;
  }
  if (self->_shortVersion) {
    shortVersion = (__CFString *)self->_shortVersion;
  }
  v10 = [v3 stringWithFormat:@"SPApplication: %@, display name:%@%@%@ version:%@", displayIdentifier, v5, v8, longDisplayName, shortVersion];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    if (self->_webClipType == v5[8])
    {
      displayIdentifier = self->_displayIdentifier;
      v7 = (NSString *)v5[3];
      if (displayIdentifier == v7) {
        goto LABEL_7;
      }
      BOOL v8 = 0;
      if (!displayIdentifier || !v7) {
        goto LABEL_24;
      }
      if (-[NSString isEqualToString:](displayIdentifier, "isEqualToString:"))
      {
LABEL_7:
        appBundleIdentifier = self->_appBundleIdentifier;
        v10 = (NSString *)v5[7];
        if (appBundleIdentifier == v10) {
          goto LABEL_11;
        }
        BOOL v8 = 0;
        if (!appBundleIdentifier || !v10) {
          goto LABEL_24;
        }
        if (-[NSString isEqualToString:](appBundleIdentifier, "isEqualToString:"))
        {
LABEL_11:
          subtitle = self->_subtitle;
          v12 = (NSString *)v5[9];
          if (subtitle == v12)
          {
LABEL_15:
            v13 = [(SPApplication *)self displayNameInternal];
            v14 = [v5 displayNameInternal];
            if (v13 == v14)
            {
              BOOL v8 = 1;
            }
            else
            {
              char v15 = [v13 isEqualToString:v14];
              if (v13) {
                BOOL v16 = v14 == 0;
              }
              else {
                BOOL v16 = 1;
              }
              if (v16) {
                BOOL v8 = 0;
              }
              else {
                BOOL v8 = v15;
              }
            }
            int isPlaceholder = self->_isPlaceholder;
            if (isPlaceholder != [v5 isPlaceholder]) {
              BOOL v8 = 0;
            }

            goto LABEL_24;
          }
          BOOL v8 = 0;
          if (!subtitle || !v12)
          {
LABEL_24:

            goto LABEL_25;
          }
          if (-[NSString isEqualToString:](subtitle, "isEqualToString:")) {
            goto LABEL_15;
          }
        }
      }
    }
    BOOL v8 = 0;
    goto LABEL_24;
  }
  BOOL v8 = 0;
LABEL_25:

  return v8;
}

- (BOOL)displayNameLoaded
{
  v2 = [(SPApplication *)self displayNameInternal];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)displayName
{
  BOOL v3 = [(SPApplication *)self displayNameInternal];
  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:self->_displayIdentifier allowPlaceholder:1 error:0];
    BOOL v3 = [v4 localizedName];

    [(SPApplication *)self setDisplayNameInternal:v3];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      [(SPApplication *)(uint64_t *)&self->_displayIdentifier displayName];
    }
  }

  return (NSString *)v3;
}

- (void)setLongDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_displayNameInternal)
  {
    id v6 = v4;
    id v4 = (id)objc_msgSend(v4, "isEqualToString:");
    id v5 = v6;
    if (v4)
    {
      objc_storeStrong((id *)&self->_longDisplayName, self->_displayNameInternal);
      id v5 = v6;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (NSString)longDisplayName
{
  return self->_longDisplayName;
}

- (NSString)utiType
{
  return (NSString *)(id)SPUTIAppType;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_int isPlaceholder = a3;
}

- (NSString)displayIdentifier
{
  return self->_displayIdentifier;
}

- (void)setDisplayIdentifier:(id)a3
{
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (int64_t)webClipType
{
  return self->_webClipType;
}

- (void)setWebClipType:(int64_t)a3
{
  self->_webClipType = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)displayNameInternal
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDisplayNameInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameInternal, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_displayIdentifier, 0);

  objc_storeStrong((id *)&self->_longDisplayName, 0);
}

- (void)copyToSearchFoundationResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F67A90]);
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v6, v7))
  {
    BOOL v8 = [(SPApplication *)self displayName];
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_21E5D7000, v6, v7, "Set title %@ for result %@", buf, 0x16u);
  }
  v9 = [(SPApplication *)self displayName];

  if (v9)
  {
    v10 = [(SPApplication *)self displayName];
    [v5 setText:v10];
  }
  v11 = [(SPApplication *)self subtitle];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F679F0];
    v13 = [(SPApplication *)self subtitle];
    v14 = [v12 textWithString:v13];

    v23 = v14;
    char v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    [v4 setDescriptions:v15];
  }
  [v4 setTitle:v5];
  if ([(SPApplication *)self isAppClip])
  {
    BOOL v16 = NSString;
    uint64_t v17 = *MEMORY[0x263F320B8];
    v18 = [(SPApplication *)self displayIdentifier];
    v19 = [v16 stringWithFormat:@"%@%@", v17, v18];
    [v4 setIdentifier:v19];

    v20 = [(SPApplication *)self appBundleIdentifier];
    [v4 setResultBundleId:v20];

    [v4 setApplicationBundleIdentifier:@"com.apple.application"];
    [v4 setIsAppClip:1];
  }
  else
  {
    objc_msgSend(v4, "setIsWebClip:", -[SPApplication isWebClip](self, "isWebClip"));
    v21 = [(SPApplication *)self displayIdentifier];
    [v4 setResultBundleId:v21];
  }
  if ([(SPApplication *)self isAppClip]) {
    v22 = @"com.apple.app-clips";
  }
  else {
    v22 = @"com.apple.application";
  }
  [v4 setSectionBundleIdentifier:v22];
  [v4 setIsLocalApplicationResult:1];
}

- (void)displayName
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "### localized app name(%@) - %@", (uint8_t *)&v3, 0x16u);
}

@end