@interface OBPrivacyFlow
+ (OBPrivacyFlow)flowWithBundle:(id)a3;
+ (id)_modelSpecificLocalizedStringKeyForKey:(id)a3 preferredDeviceType:(unint64_t)a4;
+ (id)_splashPlistFromBundle:(id)a3 forContentName:(id)a4;
- (BOOL)_conformsToRequirement:(id)a3;
- (BOOL)_conformsToRequirements:(id)a3;
- (BOOL)enablesGroupingInCombinedList;
- (BOOL)isPersonallyIdentifiable;
- (BOOL)platformSupported;
- (BOOL)showInCombinedList;
- (NSArray)localizedContentList;
- (NSAttributedString)localizedCombinedFooter;
- (NSString)identifier;
- (NSString)localizedButtonCaption;
- (NSString)localizedButtonTitle;
- (NSString)localizedCombinedHeader;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (OBBundle)bundle;
- (OBImage)buttonIcon;
- (OBPrivacyFlow)initWithBundle:(id)a3;
- (OBPrivacyFlow)initWithSplashContent:(id)a3;
- (id)_SKU;
- (id)_bestStringForKeyWithPrefix:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5;
- (id)_bundleImageNamed:(id)a3;
- (id)_currentPlatform;
- (id)_deviceClass;
- (id)_iconType;
- (id)_legacyLocalizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5;
- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 table:(id)a5 preferredDeviceType:(unint64_t)a6;
- (id)_splashPlist;
- (id)_stringForPlaceholderBundleWithString:(id)a3;
- (id)_stringKeyWithCapabilitiesFromPrefix:(id)a3 withNetwork:(BOOL)a4 withGenerative:(BOOL)a5;
- (id)_textForConditionalItem:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5;
- (id)_verifiedSplashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5;
- (id)localizedButtonCaptionForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedButtonTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedCombinedFooterComponentsForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedCombinedFooterForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedCombinedHeaderForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedShortTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)localizedTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4;
- (id)replaceeIdentifierSets;
- (id)replacementPrecondition;
- (unint64_t)contentVersion;
- (void)setBundle:(id)a3;
- (void)setButtonIcon:(id)a3;
@end

@implementation OBPrivacyFlow

- (unint64_t)contentVersion
{
  v2 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ContentVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

+ (OBPrivacyFlow)flowWithBundle:(id)a3
{
  id v3 = a3;
  v4 = [[OBPrivacyFlow alloc] initWithBundle:v3];

  return v4;
}

- (OBPrivacyFlow)initWithBundle:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OBPrivacyFlow;
  v6 = [(OBPrivacyFlow *)&v26 init];
  v7 = v6;
  if (!v6)
  {
LABEL_21:
    v20 = v7;
    goto LABEL_22;
  }
  p_bundle = (id *)&v6->_bundle;
  objc_storeStrong((id *)&v6->_bundle, a3);
  v9 = [*p_bundle underlyingBundle];
  v10 = [v9 infoDictionary];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"GDPRSplash"];
  splashContentName = v7->_splashContentName;
  v7->_splashContentName = (NSString *)v11;

  if (v7->_splashContentName)
  {
    v13 = [*p_bundle underlyingBundle];
    uint64_t v14 = +[OBPrivacyFlow _splashPlistFromBundle:v13 forContentName:v7->_splashContentName];
    splashPlist = v7->_splashPlist;
    v7->_splashPlist = (NSDictionary *)v14;

    v16 = v7->_splashPlist;
    if (v16)
    {
      v17 = [(NSDictionary *)v16 objectForKeyedSubscript:@"ButtonTitle"];
      if (v17)
      {
        v7->_splashPListContainsLegacyStringKeys = 1;
      }
      else
      {
        v21 = [(NSDictionary *)v7->_splashPlist objectForKeyedSubscript:@"ButtonCaption"];
        if (v21)
        {
          v7->_splashPListContainsLegacyStringKeys = 1;
        }
        else
        {
          v22 = [(NSDictionary *)v7->_splashPlist objectForKeyedSubscript:@"Title"];
          if (v22)
          {
            v7->_splashPListContainsLegacyStringKeys = 1;
          }
          else
          {
            v23 = [(NSDictionary *)v7->_splashPlist objectForKeyedSubscript:@"ShortTitle"];
            if (v23)
            {
              v7->_splashPListContainsLegacyStringKeys = 1;
            }
            else
            {
              v24 = [(NSDictionary *)v7->_splashPlist objectForKeyedSubscript:@"Content"];
              v7->_splashPListContainsLegacyStringKeys = v24 != 0;
            }
          }
        }
      }

      goto LABEL_21;
    }
  }
  else
  {
    v18 = _OBLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v5 identifier];
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_19BF0F000, v18, OS_LOG_TYPE_DEFAULT, "No GDPRSplash for bundle %@", buf, 0xCu);
    }
  }

  v20 = 0;
LABEL_22:

  return v20;
}

+ (id)_splashPlistFromBundle:(id)a3 forContentName:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a3 pathForResource:a4 ofType:@"plist"];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  if (!v5)
  {
    v6 = _OBLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19BF0F000, v6, OS_LOG_TYPE_DEFAULT, "No splash found in bundle at path: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

- (id)replacementPrecondition
{
  v2 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ReplacementInfo"];
  id v3 = [v2 objectForKeyedSubscript:@"Precondition"];

  return v3;
}

- (id)replaceeIdentifierSets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ReplacementInfo", 0];
  id v3 = [v2 objectForKeyedSubscript:@"ReplaceeSets"];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (!v6) {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
        [v6 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v11 = (void *)[v6 copy];
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_buttonIcon, 0);
  objc_storeStrong((id *)&self->_splashPlist, 0);
  objc_storeStrong((id *)&self->_splashContentName, 0);
}

- (OBPrivacyFlow)initWithSplashContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyFlow;
  id v6 = [(OBPrivacyFlow *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_splashPlist, a3);
  }

  return v7;
}

- (NSString)identifier
{
  return [(OBBundle *)self->_bundle identifier];
}

- (id)_currentPlatform
{
  return @"iOS";
}

- (BOOL)platformSupported
{
  v2 = self;
  id v3 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"SupportedPlatforms"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__OBPrivacyFlow_platformSupported__block_invoke;
  v5[3] = &unk_1E58AEB08;
  v5[4] = v2;
  LOBYTE(v2) = [v3 indexOfObjectPassingTest:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v2;
}

uint64_t __34__OBPrivacyFlow_platformSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _currentPlatform];
  id v5 = [v4 lowercaseString];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v3 lowercaseString];
    uint64_t v7 = [v6 isEqualToString:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_verifiedSplashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8 = a3;
  objc_super v9 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v8 language:a4 preferredDeviceType:a5];
  uint64_t v10 = v9;
  if (v9 && ([v9 isEqualToString:v8] & 1) == 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8 = a3;
  objc_super v9 = self->_splashContentName;
  uint64_t v10 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v8 language:a4 table:v9 preferredDeviceType:a5];
  if (v10)
  {
    id v11 = (id)v10;
    if ([(OBBundle *)self->_bundle isPlaceholder])
    {
      uint64_t v12 = [(OBPrivacyFlow *)self _stringForPlaceholderBundleWithString:v11];

      id v11 = (id)v12;
    }
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)_stringForPlaceholderBundleWithString:(id)a3
{
  bundle = self->_bundle;
  id v4 = a3;
  id v5 = [(OBBundle *)bundle identifier];
  id v6 = [v4 stringByReplacingOccurrencesOfString:@"%@" withString:v5];

  return v6;
}

- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 table:(id)a5 preferredDeviceType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = +[OBPrivacyFlow _modelSpecificLocalizedStringKeyForKey:v10 preferredDeviceType:a6];
  long long v14 = [(OBBundle *)self->_bundle underlyingBundle];
  long long v15 = +[OBUtilities localizedString:v13 forTable:v12 inBundle:v14 forLanguage:v11];

  if (![(__CFString *)v15 length]
    || [(__CFString *)v15 isEqualToString:v13])
  {
    long long v16 = [(OBBundle *)self->_bundle underlyingBundle];
    uint64_t v17 = +[OBUtilities localizedString:v10 forTable:v12 inBundle:v16 forLanguage:v11];

    long long v15 = (__CFString *)v17;
  }
  if ([(__CFString *)v15 length] && ([(__CFString *)v15 isEqualToString:v10] & 1) == 0)
  {
    CFPropertyListRef v19 = CFPreferencesCopyValue(@"OBShowFakeText", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v19)
    {
      v20 = v19;
      if ([(__CFString *)v15 length] && os_variant_has_internal_ui())
      {

        long long v15 = @"ONBOARDINGKIT PRIVACY TEXT";
      }
      CFRelease(v20);
    }
    uint64_t v18 = v15;
    long long v15 = v18;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)_modelSpecificLocalizedStringKeyForKey:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1uLL:
      [NSString stringWithFormat:@"%@_IPHONE", v6];
      break;
    case 2uLL:
      [NSString stringWithFormat:@"%@_IPAD", v6];
      break;
    case 3uLL:
      [NSString stringWithFormat:@"%@_IPOD", v6];
      break;
    case 4uLL:
      +[OBUtilities stringWithFormat:@"%@_MAC", v6];
      break;
    case 5uLL:
      +[OBUtilities stringWithFormat:@"%@_APPLETV", v6];
      break;
    case 6uLL:
      +[OBUtilities stringWithFormat:@"%@_HOMEPOD", v6];
      break;
    case 7uLL:
      +[OBUtilities stringWithFormat:@"%@_APPLEWATCH", v6];
      break;
    case 8uLL:
      +[OBUtilities stringWithFormat:@"%@_APPLEVISION", v6];
      break;
    default:
      if (_CFMZEnabled()) {
        [a1 _modelSpecificLocalizedStringKeyForKey:v6 preferredDeviceType:4];
      }
      else {
        [MEMORY[0x1E4FB16C8] modelSpecificLocalizedStringKeyForKey:v6];
      }
      break;
  uint64_t v7 = };

  return v7;
}

- (id)_bundleImageNamed:(id)a3
{
  bundle = self->_bundle;
  id v4 = a3;
  id v5 = [(OBBundle *)bundle underlyingBundle];
  id v6 = +[OBImage imageNamed:v4 inBundle:v5];

  return v6;
}

- (BOOL)isPersonallyIdentifiable
{
  v2 = [(OBPrivacyFlow *)self _iconType];
  id v3 = [v2 lowercaseString];
  char v4 = [v3 isEqualToString:@"pii"];

  return v4;
}

- (id)_iconType
{
  return [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"IconType"];
}

- (id)_splashPlist
{
  return self->_splashPlist;
}

- (OBImage)buttonIcon
{
  if (!self->_buttonIconLoaded && [(OBPrivacyFlow *)self isPersonallyIdentifiable])
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v4 = +[OBImage imageNamed:@"PII.pdf" inBundle:v3];

    [(OBPrivacyFlow *)self setButtonIcon:v4];
  }
  buttonIcon = self->_buttonIcon;
  return buttonIcon;
}

- (void)setButtonIcon:(id)a3
{
  if (self->_buttonIcon != a3) {
    objc_storeStrong((id *)&self->_buttonIcon, a3);
  }
  self->_buttonIconLoaded = 1;
  MEMORY[0x1F41817F8]();
}

- (BOOL)showInCombinedList
{
  id v3 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"HideFromCombinedList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 BOOLValue]) {
      goto LABEL_10;
    }
  }
  else if (v3)
  {
    char v4 = _OBLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BF0F000, v4, OS_LOG_TYPE_DEFAULT, "HideFromCombinedList must be a BOOLean", buf, 2u);
    }
  }
  id v5 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"HideFromCombinedListForSKUs"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5)
    {
      objc_super v9 = _OBLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v14 = 0;
        _os_log_impl(&dword_19BF0F000, v9, OS_LOG_TYPE_DEFAULT, "HideFromCombinedListForSKUs must be an array", v14, 2u);
      }
    }
LABEL_16:
    id v10 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ShowInCombinedListForDeviceClasses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [(OBPrivacyFlow *)self _deviceClass];
      char v8 = [v10 containsObject:v11];
    }
    else
    {
      if (!v10)
      {
        char v8 = 1;
        goto LABEL_23;
      }
      id v11 = _OBLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v13 = 0;
        _os_log_impl(&dword_19BF0F000, v11, OS_LOG_TYPE_DEFAULT, "ShowInCombinedListForDeviceClasses must be an array", v13, 2u);
      }
      char v8 = 1;
    }

LABEL_23:
    goto LABEL_24;
  }
  id v6 = [(OBPrivacyFlow *)self _SKU];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  char v8 = 0;
LABEL_24:

  return v8;
}

- (BOOL)enablesGroupingInCombinedList
{
  v2 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"EnablesGroupingInCombinedList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 BOOLValue];
  }
  else
  {
    if (v2)
    {
      char v4 = _OBLoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19BF0F000, v4, OS_LOG_TYPE_DEFAULT, "EnablesGroupingInCombinedList must be a BOOLean", v6, 2u);
      }
    }
    char v3 = 0;
  }

  return v3;
}

- (id)_deviceClass
{
  v2 = (void *)MGGetStringAnswer();
  return v2;
}

- (id)_SKU
{
  v2 = (void *)MGGetStringAnswer();
  return v2;
}

- (id)_bestStringForKeyWithPrefix:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[OBCapabilities sharedCapabilities];
  int v11 = [v10 deviceSupportsGenerativeModels];

  if (v11)
  {
    id v12 = [(OBPrivacyFlow *)self _stringKeyWithCapabilitiesFromPrefix:v8 withNetwork:1 withGenerative:1];
    long long v13 = [(OBPrivacyFlow *)self _verifiedSplashLocalizedStringForKey:v12 language:v9 preferredDeviceType:a5];
    if (v13)
    {
LABEL_8:
      id v16 = v13;
      goto LABEL_9;
    }
    long long v14 = [(OBPrivacyFlow *)self _stringKeyWithCapabilitiesFromPrefix:v8 withNetwork:0 withGenerative:1];
    long long v15 = [(OBPrivacyFlow *)self _verifiedSplashLocalizedStringForKey:v14 language:v9 preferredDeviceType:a5];
    if (v15)
    {
      id v16 = v15;

      goto LABEL_9;
    }
  }
  id v12 = [(OBPrivacyFlow *)self _stringKeyWithCapabilitiesFromPrefix:v8 withNetwork:1 withGenerative:0];
  long long v13 = [(OBPrivacyFlow *)self _verifiedSplashLocalizedStringForKey:v12 language:v9 preferredDeviceType:a5];
  if (v13) {
    goto LABEL_8;
  }
  long long v13 = [(OBPrivacyFlow *)self _verifiedSplashLocalizedStringForKey:v8 language:v9 preferredDeviceType:a5];
  if (v13) {
    goto LABEL_8;
  }
  id v16 = 0;
LABEL_9:

  return v16;
}

- (id)_stringKeyWithCapabilitiesFromPrefix:(id)a3 withNetwork:(BOOL)a4 withGenerative:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    id v9 = +[OBCapabilities sharedCapabilities];
    int v10 = [v9 isWAPI];

    if (v10) {
      int v11 = @"_WLAN";
    }
    else {
      int v11 = @"_WIFI";
    }
    id v8 = [v7 stringByAppendingString:v11];
  }
  if (v5)
  {
    uint64_t v12 = [v8 stringByAppendingString:@"_GENERATIVE"];

    id v8 = (void *)v12;
  }

  return v8;
}

- (BOOL)_conformsToRequirement:(id)a3
{
  char v3 = [a3 lowercaseString];
  BOOL v7 = 0;
  if (([v3 isEqualToString:@"wifi"] & 1) != 0
    || [v3 isEqualToString:@"wlan"])
  {
    char v4 = +[OBCapabilities sharedCapabilities];
    char v5 = [v4 isWAPI];

    BOOL v6 = (v5 & 1) != 0 ? @"wlan" : @"wifi";
    if ([v3 isEqualToString:v6]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_conformsToRequirements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(OBPrivacyFlow *)self _conformsToRequirement:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        char v9 = 0;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              char v9 = v9 & 1 | -[OBPrivacyFlow _conformsToRequirement:](self, "_conformsToRequirement:", v12, (void)v14);
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
      else
      {
        char v9 = 0;
      }

      BOOL v5 = v9 & 1;
    }
    else
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)_textForConditionalItem:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v8 language:v9 preferredDeviceType:a5];
    if (![v10 length] || objc_msgSend(v10, "isEqualToString:", v8))
    {
      int v11 = +[OBCapabilities sharedCapabilities];
      char v12 = [v11 isWAPI];

      if (v12) {
        [NSString stringWithFormat:@"%@_WLAN", v8];
      }
      else {
      v23 = [NSString stringWithFormat:@"%@_WIFI", v8];
      }
      uint64_t v24 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v23 language:v9 preferredDeviceType:a5];

      uint64_t v10 = (void *)v24;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v28 = v8;
        unint64_t v26 = a5;
        id v27 = v9;
        uint64_t v16 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              v20 = [v19 objectForKeyedSubscript:@"Text"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [v19 objectForKeyedSubscript:@"Requirements"];
                BOOL v22 = [(OBPrivacyFlow *)self _conformsToRequirements:v21];

                if (v22)
                {
                  id v9 = v27;
                  uint64_t v10 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v20 language:v27 preferredDeviceType:v26];

                  id v8 = v28;
                  goto LABEL_24;
                }
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        uint64_t v10 = 0;
        id v9 = v27;
        id v8 = v28;
      }
      else
      {
        uint64_t v10 = 0;
      }
LABEL_24:
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (NSString)localizedButtonTitle
{
  return (NSString *)[(OBPrivacyFlow *)self localizedButtonTitleForLanguage:0 preferredDeviceType:0];
}

- (id)localizedButtonTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[OBCapabilities sharedCapabilities];
  id v8 = [v7 additionalDisplayLanguageForDisplayLanguage:v6];

  if (v8)
  {
    if (self->_splashPListContainsLegacyStringKeys)
    {
      id v9 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonTitleForLanguageAddition"];
      uint64_t v10 = [(OBPrivacyFlow *)self _textForConditionalItem:v9 language:v6 preferredDeviceType:a4];

      if (v10)
      {
LABEL_4:
        if (self->_splashPListContainsLegacyStringKeys)
        {
          int v11 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonTitle"];
          char v12 = [(OBPrivacyFlow *)self _textForConditionalItem:v11 language:v8 preferredDeviceType:a4];
        }
        else
        {
          char v12 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_TITLE" language:v8 preferredDeviceType:a4];
        }
        id v13 = [v10 stringByReplacingOccurrencesOfString:@"%@" withString:v12];

        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v10 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_TITLE_FOR_LANGUAGE_ADDITION" language:v6 preferredDeviceType:a4];
      if (v10) {
        goto LABEL_4;
      }
    }
  }
  if (!self->_splashPListContainsLegacyStringKeys)
  {
    id v13 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_TITLE" language:v6 preferredDeviceType:a4];
    goto LABEL_13;
  }
  uint64_t v10 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonTitle"];
  id v13 = [(OBPrivacyFlow *)self _textForConditionalItem:v10 language:v6 preferredDeviceType:a4];
LABEL_12:

LABEL_13:
  return v13;
}

- (NSString)localizedButtonCaption
{
  return (NSString *)[(OBPrivacyFlow *)self localizedButtonCaptionForLanguage:0 preferredDeviceType:0];
}

- (id)localizedButtonCaptionForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[OBCapabilities sharedCapabilities];
  id v8 = [v7 additionalDisplayLanguageForDisplayLanguage:v6];

  if (v8)
  {
    if (self->_splashPListContainsLegacyStringKeys)
    {
      id v9 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonCaptionForLanguageAddition"];
      uint64_t v10 = [(OBPrivacyFlow *)self _textForConditionalItem:v9 language:v6 preferredDeviceType:a4];

      if (v10)
      {
LABEL_4:
        if (self->_splashPListContainsLegacyStringKeys)
        {
          int v11 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonCaption"];
          char v12 = [(OBPrivacyFlow *)self _textForConditionalItem:v11 language:v8 preferredDeviceType:a4];
        }
        else
        {
          char v12 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_CAPTION" language:v8 preferredDeviceType:a4];
        }
        id v13 = [v10 stringByReplacingOccurrencesOfString:@"%@" withString:v12];

        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v10 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_CAPTION_FOR_LANGUAGE_ADDITION" language:@"en" preferredDeviceType:a4];
      if (v10) {
        goto LABEL_4;
      }
    }
  }
  if (!self->_splashPListContainsLegacyStringKeys)
  {
    id v13 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"BUTTON_CAPTION" language:v6 preferredDeviceType:a4];
    goto LABEL_13;
  }
  uint64_t v10 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"ButtonCaption"];
  id v13 = [(OBPrivacyFlow *)self _textForConditionalItem:v10 language:v6 preferredDeviceType:a4];
LABEL_12:

LABEL_13:
  return v13;
}

- (NSString)localizedTitle
{
  return (NSString *)[(OBPrivacyFlow *)self localizedTitleForLanguage:0 preferredDeviceType:0];
}

- (id)localizedTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    id v7 = a3;
    id v8 = [(NSDictionary *)splashPlist objectForKeyedSubscript:@"Title"];
    id v9 = [(OBPrivacyFlow *)self _textForConditionalItem:v8 language:v7 preferredDeviceType:a4];
  }
  else
  {
    id v8 = a3;
    id v9 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"SPLASH_TITLE" language:v8 preferredDeviceType:a4];
  }

  return v9;
}

- (NSString)localizedShortTitle
{
  return (NSString *)[(OBPrivacyFlow *)self localizedShortTitleForLanguage:0 preferredDeviceType:0];
}

- (id)localizedShortTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    id v7 = a3;
    id v8 = [(NSDictionary *)splashPlist objectForKeyedSubscript:@"ShortTitle"];
    id v9 = [(OBPrivacyFlow *)self _textForConditionalItem:v8 language:v7 preferredDeviceType:a4];
  }
  else
  {
    id v8 = a3;
    id v9 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"SPLASH_SHORT_TITLE" language:v8 preferredDeviceType:a4];
  }

  return v9;
}

- (NSString)localizedCombinedHeader
{
  return (NSString *)[(OBPrivacyFlow *)self localizedCombinedHeaderForLanguage:0 preferredDeviceType:0];
}

- (id)localizedCombinedHeaderForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    id v7 = a3;
    id v8 = [(NSDictionary *)splashPlist objectForKeyedSubscript:@"CombinedHeader"];
    id v9 = [(OBPrivacyFlow *)self _textForConditionalItem:v8 language:v7 preferredDeviceType:a4];
  }
  else
  {
    id v8 = a3;
    id v9 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"COMBINED_HEADER" language:v8 preferredDeviceType:a4];
  }

  return v9;
}

- (NSAttributedString)localizedCombinedFooter
{
  return (NSAttributedString *)[(OBPrivacyFlow *)self localizedCombinedFooterForLanguage:0 preferredDeviceType:0];
}

- (id)localizedCombinedFooterForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(OBPrivacyFlow *)self localizedCombinedFooterComponentsForLanguage:a3 preferredDeviceType:a4];
  BOOL v5 = [v4 text];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v7 = [v4 text];
    BOOL v5 = (void *)[v6 initWithString:v7];

    uint64_t v8 = [v4 linkText];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [v4 linkURLString];

      if (v10)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
        char v12 = [v4 linkText];
        uint64_t v21 = *MEMORY[0x1E4FB0720];
        id v13 = [v4 linkURLString];
        v22[0] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        uint64_t v15 = (void *)[v11 initWithString:v12 attributes:v14];

        uint64_t v16 = [v4 text];
        uint64_t v17 = [v16 rangeOfString:@"%@"];
        uint64_t v19 = v18;

        objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v17, v19, v15);
      }
    }
  }

  return v5;
}

- (id)localizedCombinedFooterComponentsForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(OBPrivacyCombinedFooterComponents);
  if (self->_splashPListContainsLegacyStringKeys)
  {
    uint64_t v8 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"CombinedFooter"];
    id v9 = [(OBPrivacyFlow *)self _textForConditionalItem:v8 language:v6 preferredDeviceType:a4];
    [(OBPrivacyCombinedFooterComponents *)v7 setText:v9];
  }
  else
  {
    uint64_t v8 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"COMBINED_FOOTER" language:v6 preferredDeviceType:a4];
    [(OBPrivacyCombinedFooterComponents *)v7 setText:v8];
  }

  uint64_t v10 = [(OBPrivacyCombinedFooterComponents *)v7 text];

  if (v10)
  {
    if (self->_splashPListContainsLegacyStringKeys)
    {
      id v11 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"CombinedFooterButton"];
      char v12 = [(OBPrivacyFlow *)self _textForConditionalItem:v11 language:v6 preferredDeviceType:a4];

      id v13 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"CombinedFooterButtonURL"];
      uint64_t v14 = [(OBPrivacyFlow *)self _textForConditionalItem:v13 language:v6 preferredDeviceType:a4];

      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
      char v12 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"COMBINED_FOOTER_BUTTON" language:v6 preferredDeviceType:a4];
      uint64_t v14 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"COMBINED_FOOTER_BUTTON_URL" language:v6 preferredDeviceType:a4];
      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (v14)
    {
      [(OBPrivacyCombinedFooterComponents *)v7 setLinkText:v12];
      [(OBPrivacyCombinedFooterComponents *)v7 setLinkURLString:v14];
    }
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (NSArray)localizedContentList
{
  return (NSArray *)[(OBPrivacyFlow *)self localizedContentListForLanguage:0 preferredDeviceType:0];
}

- (id)localizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_splashPListContainsLegacyStringKeys)
  {
    id v7 = [(OBPrivacyFlow *)self _legacyLocalizedContentListForLanguage:v6 preferredDeviceType:a4];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"SPLASH_SUMMARY" language:v6 preferredDeviceType:a4];
    if (v9)
    {
      uint64_t v10 = objc_opt_new();
      [v10 setText:v9];
      [v8 addObject:v10];
    }
    uint64_t v24 = v9;
    unint64_t v26 = v8;
    id v11 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [&unk_1EEC37AE8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(&unk_1EEC37AE8);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "stringByAppendingString:", @"_BULLET", v24);
          uint64_t v17 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:v16 language:v6 preferredDeviceType:a4];
          if (!v17)
          {

            goto LABEL_15;
          }
          uint64_t v18 = (void *)v17;
          uint64_t v19 = objc_opt_new();
          [v19 setText:v18];
          [v11 addObject:v19];
        }
        uint64_t v13 = [&unk_1EEC37AE8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_15:
    id v7 = v26;
    if (objc_msgSend(v11, "count", v24))
    {
      v20 = objc_opt_new();
      [v20 setBullets:v11];
      [v26 addObject:v20];
    }
    uint64_t v21 = [(OBPrivacyFlow *)self _bestStringForKeyWithPrefix:@"FOOTER_TEXT" language:v6 preferredDeviceType:a4];
    if (v21)
    {
      BOOL v22 = objc_opt_new();
      [v22 setText:v21];
      [v26 addObject:v22];
    }
  }

  return v7;
}

- (id)_legacyLocalizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v51 = (id)objc_opt_new();
  BOOL v5 = [(NSDictionary *)self->_splashPlist objectForKeyedSubscript:@"Content"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (!v7) {
      goto LABEL_57;
    }
    uint64_t v8 = v7;
    v48 = v5;
    unint64_t v9 = 0x1E4F1C000uLL;
    uint64_t v10 = *(void *)v66;
    v58 = self;
    uint64_t v49 = *(void *)v66;
    v50 = v6;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v53 = v8;
      do
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v54 = v11;
        uint64_t v12 = *(void **)(*((void *)&v65 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = v12;
          uint64_t v14 = [v13 objectForKeyedSubscript:@"Requirements"];
          BOOL v15 = [(OBPrivacyFlow *)self _conformsToRequirements:v14];

          if (!v15)
          {
            uint64_t v8 = v53;
            goto LABEL_48;
          }
          uint64_t v16 = objc_opt_new();
          uint64_t v17 = [v13 objectForKeyedSubscript:@"Text"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v52 = v13;
          if (isKindOfClass)
          {
            uint64_t v19 = [v13 objectForKeyedSubscript:@"Text"];
            v20 = [(OBPrivacyFlow *)self _splashLocalizedStringForKey:v19 language:v57 preferredDeviceType:a4];
            [v16 setText:v20];

            goto LABEL_41;
          }
          v59 = v16;
          uint64_t v21 = [v13 objectForKeyedSubscript:@"Bullets"];
          objc_opt_class();
          char v22 = objc_opt_isKindOfClass();

          if (v22)
          {
            v55 = objc_opt_new();
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id obj = [v13 objectForKeyedSubscript:@"Bullets"];
            uint64_t v23 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
            uint64_t v24 = v16;
            if (!v23) {
              goto LABEL_38;
            }
            uint64_t v25 = v23;
            uint64_t v26 = *(void *)v62;
            while (1)
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v62 != v26) {
                  objc_enumerationMutation(obj);
                }
                long long v28 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v29 = v9;
                  long long v30 = objc_opt_new();
                  id v31 = v28;
                  uint64_t v32 = [v31 objectForKeyedSubscript:@"Text"];
                  v33 = [v31 objectForKeyedSubscript:@"IconName"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v34 = [v31 objectForKeyedSubscript:@"Requirements"];
                    BOOL v35 = [(OBPrivacyFlow *)v58 _conformsToRequirements:v34];

                    if (v35)
                    {
                      v36 = [(OBPrivacyFlow *)v58 _splashLocalizedStringForKey:v32 language:v57 preferredDeviceType:a4];
                      [v30 setText:v36];

                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v37 = [(OBPrivacyFlow *)v58 _bundleImageNamed:v33];
                        [v30 setIcon:v37];
                        goto LABEL_33;
                      }
                      if (v33)
                      {
                        v37 = _OBLoggingFacility();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                        {
                          v41 = objc_opt_class();
                          *(_DWORD *)buf = 138412290;
                          v70 = v41;
                          id v42 = v41;
                          _os_log_impl(&dword_19BF0F000, v37, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet IconName must be a string, was %@", buf, 0xCu);
                        }
LABEL_33:
                      }
                      -[NSObject addObject:](v55, "addObject:", v30, v48);
                    }
                  }
                  else
                  {
                    v38 = _OBLoggingFacility();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      v39 = objc_opt_class();
                      *(_DWORD *)buf = 138412290;
                      v70 = v39;
                      id v40 = v39;
                      _os_log_impl(&dword_19BF0F000, v38, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet Text must be a string, was %@", buf, 0xCu);
                    }
                  }

                  unint64_t v9 = v29;
                  uint64_t v24 = v59;
                  goto LABEL_36;
                }
                long long v30 = _OBLoggingFacility();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19BF0F000, v30, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet entries must be dictionaries", buf, 2u);
                }
LABEL_36:
              }
              uint64_t v25 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
              if (!v25)
              {
LABEL_38:

                uint64_t v19 = v55;
                if ([v55 count]) {
                  [v24 setBullets:v55];
                }
                self = v58;
                uint64_t v16 = v59;
                uint64_t v10 = v49;
                id v6 = v50;
LABEL_41:
                uint64_t v8 = v53;
LABEL_42:

                goto LABEL_43;
              }
            }
          }
          v45 = [v13 objectForKeyedSubscript:@"Bullets"];

          uint64_t v8 = v53;
          if (v45)
          {
            uint64_t v19 = _OBLoggingFacility();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19BF0F000, v19, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Bullets must be an array", buf, 2u);
            }
            goto LABEL_42;
          }
LABEL_43:
          v43 = objc_msgSend(v16, "text", v48);
          if (v43)
          {

            uint64_t v13 = v52;
            goto LABEL_46;
          }
          v44 = [v16 bullets];

          uint64_t v13 = v52;
          if (v44) {
LABEL_46:
          }
            [v51 addObject:v16];

          goto LABEL_48;
        }
        uint64_t v13 = _OBLoggingFacility();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BF0F000, v13, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Content entries must be dictionaries", buf, 2u);
        }
LABEL_48:

        uint64_t v11 = v54 + 1;
      }
      while (v54 + 1 != v8);
      uint64_t v46 = [v6 countByEnumeratingWithState:&v65 objects:v72 count:16];
      uint64_t v8 = v46;
      if (!v46)
      {
        BOOL v5 = v48;
        goto LABEL_57;
      }
    }
  }
  id v6 = _OBLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF0F000, v6, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Content must be an array", buf, 2u);
  }
LABEL_57:

  return v51;
}

- (OBBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

@end