@interface GreymatterDomain
+ (BOOL)supportsSecureCoding;
+ (id)excludedEnglishVariants;
+ (id)uiLocalesRequiringExactMatch;
- (BOOL)_checkDeviceLanguage:(id)a3;
- (BOOL)_checkDeviceLanguage:(id)a3 matchesSiriLanguage:(id)a4;
- (BOOL)_checkSiriLanguage:(id)a3;
- (BOOL)_equivalentLocale:(id)a3 isPresentInArray:(id)a4;
- (GreymatterDomain)init;
- (GreymatterDomain)initWithCoder:(id)a3;
- (id)_greymatterLanguage:(id)a3;
- (id)_primaryLanguageFromPreferredLanguages:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch;
- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3;
- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation GreymatterDomain

- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3
{
  id v4 = a3;
  v5 = +[MobileAssetManager sharedInstance];
  v6 = [v5 greymatterAsset];
  v7 = [v6 countryCodes];
  v16.receiver = self;
  v16.super_class = (Class)GreymatterDomain;
  unint64_t v8 = [(EligibilityDomain *)&v16 computeInputStatusForLocatedCountryInput:v4];

  v9 = +[InputManager sharedInstance];
  v10 = [v9 objectForInputValue:2];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 countryCode];

    if (v12)
    {
      v13 = [v11 countryCode];
      unsigned __int8 v14 = [v7 containsObject:v13];

      if ((v14 & (v8 != 3)) != 0) {
        unint64_t v8 = 2;
      }
      else {
        unint64_t v8 = 3;
      }
    }
  }

  return v8;
}

- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch
{
  v3 = +[InputManager sharedInstance];
  id v4 = [v3 objectForInputValue:7];
  v5 = [v3 objectForInputValue:10];
  uint64_t v6 = [(GreymatterDomain *)self _greymatterLanguage:v4];
  uint64_t v7 = [v5 language];
  if (v6 | v7) {
    BOOL v8 = (v6 == 0) == (v7 != 0);
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unint64_t v9 = 3;
  }
  else if ([(GreymatterDomain *)self _checkDeviceLanguage:v6 matchesSiriLanguage:v7])
  {
    unint64_t v9 = 3;
  }
  else
  {
    unint64_t v9 = 2;
  }

  return v9;
}

- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3
{
  id v4 = [a3 language];
  if (v4)
  {
    if ([(GreymatterDomain *)self _checkSiriLanguage:v4]) {
      unint64_t v5 = 3;
    }
    else {
      unint64_t v5 = 2;
    }
  }
  else
  {
    unint64_t v5 = 3;
  }

  return v5;
}

- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3
{
  id v4 = [(GreymatterDomain *)self _greymatterLanguage:a3];
  if ([(GreymatterDomain *)self _checkDeviceLanguage:v4])
  {
    BOOL v8 = v4;
    unint64_t v5 = +[NSArray arrayWithObjects:&v8 count:1];
    unint64_t v6 = 3;
  }
  else
  {
    unint64_t v5 = 0;
    unint64_t v6 = 2;
  }
  [(EligibilityDomain *)self addContextForKey:@"OS_ELIGIBILITY_CONTEXT_ELIGIBLE_DEVICE_LANGUAGES" value:v5];

  return v6;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  if ([a3 isChinaSKU]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)_primaryLanguageFromPreferredLanguages:(id)a3
{
  id v3 = a3;
  id v4 = +[NSLocale systemLanguages];
  unint64_t v5 = AFPreferencesSupportedLanguages();
  unint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v7 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v3];

  BOOL v8 = [v7 firstObject];

  return v8;
}

- (id)_greymatterLanguage:(id)a3
{
  id v4 = [a3 deviceLanguages];
  unint64_t v5 = [(GreymatterDomain *)self _primaryLanguageFromPreferredLanguages:v4];

  return v5;
}

- (BOOL)_checkDeviceLanguage:(id)a3 matchesSiriLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"en"])
  {
    id v8 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v6];
    id v9 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v7];
    v10 = +[GreymatterDomain excludedEnglishVariants];
    unsigned __int8 v11 = [(GreymatterDomain *)self _equivalentLocale:v8 isPresentInArray:v10];

    if ((v11 & 1) == 0)
    {
      v13 = +[GreymatterDomain uiLocalesRequiringExactMatch];
      unsigned int v14 = [(GreymatterDomain *)self _equivalentLocale:v8 isPresentInArray:v13];

      if (v14)
      {
        unsigned __int8 v12 = [v8 isEquivalentTo:v9];
        goto LABEL_9;
      }
      if ([(GreymatterDomain *)self _equivalentLocale:v9 isPresentInArray:&off_100040480])
      {
        v15 = +[IntlUtility parentLocaleIdentifierForIdentifier:v6];
        id v16 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v15];
        unsigned __int8 v12 = [v16 isEquivalentTo:v9];

        goto LABEL_9;
      }
    }
    unsigned __int8 v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  unsigned __int8 v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)_checkSiriLanguage:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"en"])
  {
    id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v4];
    id v6 = +[GreymatterDomain uiLocalesRequiringExactMatch];
    BOOL v7 = [(GreymatterDomain *)self _equivalentLocale:v5 isPresentInArray:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_checkDeviceLanguage:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"en"])
  {
    id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v4];
    id v6 = +[GreymatterDomain excludedEnglishVariants];
    unsigned __int8 v7 = [(GreymatterDomain *)self _equivalentLocale:v5 isPresentInArray:v6];

    if (v7)
    {
      BOOL v8 = 0;
    }
    else
    {
      id v9 = +[GreymatterDomain uiLocalesRequiringExactMatch];
      unsigned __int8 v10 = [(GreymatterDomain *)self _equivalentLocale:v5 isPresentInArray:v9];

      if (v10)
      {
        BOOL v8 = 1;
      }
      else
      {
        unsigned __int8 v11 = +[IntlUtility parentLocaleIdentifierForIdentifier:v4];
        id v12 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v11];
        v13 = +[GreymatterDomain uiLocalesRequiringExactMatch];
        BOOL v8 = [(GreymatterDomain *)self _equivalentLocale:v12 isPresentInArray:v13];
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_equivalentLocale:(id)a3 isPresentInArray:(id)a4
{
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc((Class)NSLocale);
        id v12 = [v11 initWithLocaleIdentifier:v10];
        unsigned __int8 v13 = [v12 isEquivalentTo:v5];

        if (v13)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)updateParameters
{
  [(EligibilityDomain *)self setGenerativeModelSystemVersionInterest];
  [(EligibilityDomain *)self setDeviceRegionInterest];
  [(EligibilityDomain *)self setSiriLanguageInterest];
  [(EligibilityDomain *)self setDeviceLanguageInterest];
  [(EligibilityDomain *)self setExternalBootInterest];
  [(EligibilityDomain *)self setSharediPadInterest];
  [(EligibilityDomain *)self setDeviceAndSiriLangaugeMatchInterest];
  id v5 = +[MobileAssetManager sharedInstance];
  id v3 = [v5 greymatterAsset];
  id v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4 isInverted:1];
}

- (GreymatterDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GreymatterDomain;
  id v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(GreymatterDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (GreymatterDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)GreymatterDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(GreymatterDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.greymatter";
}

- (unint64_t)domain
{
  return 122;
}

+ (id)uiLocalesRequiringExactMatch
{
  return &off_100040468;
}

+ (id)excludedEnglishVariants
{
  return &off_100040450;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end