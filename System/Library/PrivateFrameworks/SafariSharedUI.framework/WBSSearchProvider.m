@interface WBSSearchProvider
+ (BOOL)supportsSecureCoding;
+ (id)defaultProviderInUserVisibleProviders:(id)a3 usingSettings:(id)a4 forPrivateBrowsing:(BOOL)a5;
+ (id)sortedSearchProvidersInArray:(id)a3 usingShortNameOrder:(id)a4;
+ (id)userVisibleProvidersInAllProviders:(id)a3 usingContext:(id)a4;
- (BOOL)searchShouldUseSafeSearchTemplate;
- (BOOL)shouldDisplaySearchProviderInContext:(id)a3;
- (BOOL)urlIsHomepage:(id)a3;
- (BOOL)urlIsHomepage:(id)a3 shouldUseCanonicalRepresentation:(BOOL)a4;
- (BOOL)urlIsValidSearch:(id)a3;
- (BOOL)usesSearchTermsFromFragment;
- (BOOL)usesSecureSearchURL;
- (NSArray)hostSuffixes;
- (NSArray)languages;
- (NSArray)pathPrefixes;
- (NSArray)userRegions;
- (NSDictionary)safeSearchURLQueryParameters;
- (NSDictionary)topLevelDomains;
- (NSSet)homepageURLs;
- (NSString)carrierInfo;
- (NSString)description;
- (NSString)displayName;
- (NSString)groupIdentifierQueryStringKey;
- (NSString)parsecSearchIdentifier;
- (NSString)parsecSearchSuggestionIdentifier;
- (NSString)scriptName;
- (NSString)searchEngineIdentifier;
- (NSString)shortName;
- (WBSOpenSearchURLTemplate)safeSearchURLTemplate;
- (WBSOpenSearchURLTemplate)searchURLTemplate;
- (WBSOpenSearchURLTemplate)suggestionsURLTemplate;
- (WBSSearchProvider)initWithCoder:(id)a3;
- (WBSSearchProvider)initWithDictionary:(id)a3 usingContext:(id)a4;
- (id)_searchURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4;
- (id)_substitutionValuesForTemplateURLUsingContext:(id)a3;
- (id)_suggestionsURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4;
- (id)_urlByEnsuringQueryItemInURL:(id)a3 percentEncodedQueryItemKey:(id)a4 percentEncodedQueryItemValue:(id)a5;
- (id)safeSearchURLForSearchURL:(id)a3;
- (id)searchURLForUserTypedString:(id)a3;
- (id)suggestionsURLForUserTypedString:(id)a3;
- (id)urlAttributingToSafariIfValidSearchURL:(id)a3;
- (id)urlByIncorporatingGroupIdentifier:(unint64_t)a3 ifIsValidSearchResultsURL:(id)a4;
- (id)userVisibleQueryFromSearchURL:(id)a3;
- (id)userVisibleQueryFromSearchURL:(id)a3 allowQueryThatLooksLikeURL:(BOOL)a4;
- (int)_parsecSearchResultTypeInDictionary:(id)a3;
- (int)parsecSearchResultType;
- (int64_t)searchID;
- (unint64_t)_parsecSearchEndpointTypeInDictionary:(id)a3;
- (unint64_t)parsecSearchEndpointType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSSearchProvider

- (BOOL)shouldDisplaySearchProviderInContext:(id)a3
{
  id v4 = a3;
  v5 = [(WBSSearchProvider *)self languages];
  if ([v5 count]
    && ([v4 systemLanguage],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 containsObject:v6],
        v6,
        !v7))
  {
    BOOL v11 = 0;
  }
  else
  {
    v8 = [(WBSSearchProvider *)self userRegions];
    BOOL v11 = (![v8 count]
        || ([v4 countryCode],
            v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v8 containsObject:v9],
            v9,
            v10))
       && (![(NSString *)self->_shortName isEqualToString:@"Baidu"]
        || [v4 isSearchProviderEnabled:0])
       && (![(NSString *)self->_shortName isEqualToString:@"Qihoo"]
        || [v4 isSearchProviderEnabled:2])
       && (![(NSString *)self->_shortName isEqualToString:@"Sogou"]
        || [v4 isSearchProviderEnabled:1])
       && (![(NSString *)self->_shortName isEqualToString:@"Yandex"]
        || [v4 isSearchProviderEnabled:3]);
  }
  return v11;
}

- (NSArray)languages
{
  return self->_languages;
}

- (WBSSearchProvider)initWithDictionary:(id)a3 usingContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v90.receiver = self;
  v90.super_class = (Class)WBSSearchProvider;
  v8 = [(WBSSearchProvider *)&v90 init];
  if (!v8) {
    goto LABEL_15;
  }
  v9 = objc_msgSend(v6, "safari_stringForKey:", @"ScriptingName");
  uint64_t v10 = [v9 copy];
  scriptName = v8->_scriptName;
  v8->_scriptName = (NSString *)v10;

  if (![(NSString *)v8->_scriptName length]) {
    goto LABEL_15;
  }
  v12 = objc_msgSend(v6, "safari_stringForKey:", @"ShortName");
  uint64_t v13 = [v12 copy];
  shortName = v8->_shortName;
  v8->_shortName = (NSString *)v13;

  if (![(NSString *)v8->_shortName length]) {
    goto LABEL_15;
  }
  v15 = objc_msgSend(v6, "safari_stringForKey:", @"LocalizedName");
  v16 = (NSString *)[v15 copy];
  v17 = v16;
  if (!v16) {
    v17 = v8->_shortName;
  }
  objc_storeStrong((id *)&v8->_displayName, v17);

  v18 = objc_msgSend(v6, "safari_numberForKey:", @"SearchEngineID");
  v8->_searchID = [v18 integerValue];

  v19 = objc_msgSend(v6, "safari_stringForKey:", @"SearchEngineIdentifier");
  uint64_t v20 = [v19 copy];
  searchEngineIdentifier = v8->_searchEngineIdentifier;
  v8->_searchEngineIdentifier = (NSString *)v20;

  if (!v8->_searchID) {
    goto LABEL_15;
  }
  if ([(NSString *)v8->_searchEngineIdentifier length])
  {
    v22 = objc_msgSend(v6, "safari_stringForKey:", @"ParsecSearchIdentifier");
    uint64_t v23 = [v22 copy];
    parsecSearchIdentifier = v8->_parsecSearchIdentifier;
    v8->_parsecSearchIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v6, "safari_stringForKey:", @"ParsecSearchSuggestionIdentifier");
    uint64_t v26 = [v25 copy];
    parsecSearchSuggestionIdentifier = v8->_parsecSearchSuggestionIdentifier;
    v8->_parsecSearchSuggestionIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v6, "safari_arrayForKey:", @"Language");
    uint64_t v29 = [v28 copy];
    languages = v8->_languages;
    v8->_languages = (NSArray *)v29;

    v31 = objc_msgSend(v6, "safari_arrayForKey:", @"UserRegions");
    uint64_t v32 = [v31 copy];
    userRegions = v8->_userRegions;
    v8->_userRegions = (NSArray *)v32;

    v34 = objc_msgSend(v6, "safari_arrayForKey:", @"HostSuffixes");
    uint64_t v35 = [v34 copy];
    hostSuffixes = v8->_hostSuffixes;
    v8->_hostSuffixes = (NSArray *)v35;

    v37 = objc_msgSend(v6, "safari_arrayForKey:", @"PathPrefixes");
    uint64_t v38 = [v37 copy];
    pathPrefixes = v8->_pathPrefixes;
    v8->_pathPrefixes = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    v41 = objc_msgSend(v6, "safari_arrayForKey:", @"HomepageURLs");
    uint64_t v42 = [v40 setWithArray:v41];
    homepageURLs = v8->_homepageURLs;
    v8->_homepageURLs = (NSSet *)v42;

    v44 = objc_msgSend(v6, "safari_dictionaryForKey:", @"TopLevelDomains");
    uint64_t v45 = [v44 copy];
    topLevelDomains = v8->_topLevelDomains;
    v8->_topLevelDomains = (NSDictionary *)v45;

    v8->_usesSearchTermsFromFragment = objc_msgSend(v6, "safari_BOOLForKey:", @"UsesSearchTermsFromFragment");
    v47 = objc_msgSend(v6, "safari_stringForKey:", @"GroupIdentifierQueryStringKey");
    uint64_t v48 = [v47 copy];
    groupIdentifierQueryStringKey = v8->_groupIdentifierQueryStringKey;
    v8->_groupIdentifierQueryStringKey = (NSString *)v48;

    v50 = objc_msgSend(v6, "safari_stringForKey:", @"ParsecSearchIdentifier");
    uint64_t v51 = [v50 copy];
    v52 = v8->_parsecSearchIdentifier;
    v8->_parsecSearchIdentifier = (NSString *)v51;

    v53 = objc_msgSend(v6, "safari_stringForKey:", @"ParsecSearchSuggestionIdentifier");
    uint64_t v54 = [v53 copy];
    v55 = v8->_parsecSearchSuggestionIdentifier;
    v8->_parsecSearchSuggestionIdentifier = (NSString *)v54;

    v8->_parsecSearchEndpointType = [(WBSSearchProvider *)v8 _parsecSearchEndpointTypeInDictionary:v6];
    v8->_parsecSearchResultType = [(WBSSearchProvider *)v8 _parsecSearchResultTypeInDictionary:v6];
    uint64_t v56 = [v7 deviceType];
    v57 = objc_msgSend(v6, "safari_arrayForKey:", @"CarrierInfoTemplate");
    uint64_t v58 = [v57 copy];
    carrierInfo = v8->_carrierInfo;
    v8->_carrierInfo = (NSString *)v58;

    v60 = [v7 carrierTemplateParameterValues];
    v61 = [(WBSSearchProvider *)v8 _substitutionValuesForTemplateURLUsingContext:v7];
    v62 = [(WBSSearchProvider *)v8 _searchURLTemplateStringInDictionary:v6 usingContext:v7];
    v63 = v62;
    if (v8->_carrierInfo && v60)
    {
      uint64_t v64 = objc_msgSend(v62, "stringByAppendingString:");

      v63 = (void *)v64;
    }
    v65 = (void *)[objc_alloc(MEMORY[0x1E4F98350]) initWithString:v63];
    uint64_t v66 = [v65 templateBySubstitutingValues:v61];
    searchURLTemplate = v8->_searchURLTemplate;
    v8->_searchURLTemplate = (WBSOpenSearchURLTemplate *)v66;

    if (v8->_searchURLTemplate)
    {
      v68 = [(WBSSearchProvider *)v8 _suggestionsURLTemplateStringInDictionary:v6 usingContext:v7];
      v69 = (void *)[objc_alloc(MEMORY[0x1E4F98350]) initWithString:v68];
      uint64_t v70 = [v69 templateBySubstitutingValues:v61];
      suggestionsURLTemplate = v8->_suggestionsURLTemplate;
      v8->_suggestionsURLTemplate = (WBSOpenSearchURLTemplate *)v70;

      uint64_t v72 = objc_msgSend(v6, "safari_dictionaryForKey:", @"SafeSearchURLQueryParameters");
      safeSearchURLQueryParameters = v8->_safeSearchURLQueryParameters;
      v8->_safeSearchURLQueryParameters = (NSDictionary *)v72;

      if (v8->_safeSearchURLQueryParameters)
      {
        if ((v56 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          v74 = objc_msgSend(v6, "safari_stringForKey:", @"SafeSearchURLTemplateMac");
        }
        else
        {
          v77 = objc_msgSend(v6, "safari_stringForKey:", @"SafeSearchSuffix");
          [(WBSOpenSearchURLTemplate *)v8->_searchURLTemplate templateString];
          v78 = v68;
          v80 = v79 = v60;
          v74 = [v80 stringByAppendingString:v77];

          v60 = v79;
          v68 = v78;
        }
        uint64_t v81 = [objc_alloc(MEMORY[0x1E4F98350]) initWithString:v74];
        safeSearchURLTemplate = v8->_safeSearchURLTemplate;
        v8->_safeSearchURLTemplate = (WBSOpenSearchURLTemplate *)v81;
      }
      v83 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v63);
      v8->_usesSecureSearchURL = objc_msgSend(v83, "safari_isSecureURL");

      v84 = [(WBSOpenSearchURLTemplate *)v8->_searchURLTemplate templateString];
      v85 = queryKeyFromSearchTemplate(v84);
      uint64_t v86 = [v85 copy];
      queryKey = v8->_queryKey;
      v8->_queryKey = (NSString *)v86;

      uint64_t v88 = [objc_alloc(MEMORY[0x1E4F98420]) initWithSuffixes:v8->_hostSuffixes];
      suffixChecker = v8->_suffixChecker;
      v8->_suffixChecker = (WBSURLSuffixChecker *)v88;

      v75 = v8;
    }
    else
    {
      v75 = 0;
    }
  }
  else
  {
LABEL_15:
    v75 = 0;
  }

  return v75;
}

- (id)_suggestionsURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 deviceType];
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v7 = WBSSearchProviderDefinitionSuggestionsURLTemplateMacKey;
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    id v7 = WBSSearchProviderDefinitionSuggestionsURLTemplateIPadKey;
LABEL_5:
    v8 = objc_msgSend(v5, "safari_stringForKey:", *v7);
    if (v8) {
      goto LABEL_7;
    }
  }
  v8 = objc_msgSend(v5, "safari_stringForKey:", @"SuggestionsURLTemplate");
LABEL_7:

  return v8;
}

- (id)_searchURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 deviceType];
  if (v7 > 3
    || (objc_msgSend(v5, "safari_stringForKey:", *off_1E5E44090[v7]),
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![v6 isChinaDevice]
      || (objc_msgSend(v5, "safari_stringForKey:", @"SearchURLTemplateChina"),
          (v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = objc_msgSend(v5, "safari_stringForKey:", @"SearchURLTemplate");
    }
  }

  return v8;
}

- (int)_parsecSearchResultTypeInDictionary:(id)a3
{
  v3 = objc_msgSend(a3, "safari_numberForKey:", @"ParsecSearchResultType");
  id v4 = v3;
  if (v3) {
    int v5 = [v3 integerValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (unint64_t)_parsecSearchEndpointTypeInDictionary:(id)a3
{
  v3 = objc_msgSend(a3, "safari_numberForKey:", @"ParsecSearchEndpointType");
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 integerValue];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)userRegions
{
  return self->_userRegions;
}

- (id)_substitutionValuesForTemplateURLUsingContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 countryCode];
  id v6 = (void *)v5;
  if (v5) {
    unint64_t v7 = (__CFString *)v5;
  }
  else {
    unint64_t v7 = &stru_1F031A860;
  }
  v8 = v7;

  v9 = [(NSDictionary *)self->_topLevelDomains objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v11 = [(NSDictionary *)self->_topLevelDomains objectForKeyedSubscript:&stru_1F031A860];
    v12 = (void *)v11;
    uint64_t v13 = &stru_1F031A860;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    uint64_t v10 = v13;
  }
  v14 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v10 forKey:@"topLevelDomain"];
  v15 = [v4 templateParameterValues];
  [v14 addEntriesFromDictionary:v15];

  if (self->_carrierInfo)
  {
    v16 = [v4 carrierTemplateParameterValues];

    if (v16)
    {
      v17 = [v4 carrierTemplateParameterValues];
      [v14 addEntriesFromDictionary:v17];
    }
  }
  v18 = (void *)[v14 copy];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userVisibleQueryFromSearchURL:(id)a3
{
  return [(WBSSearchProvider *)self userVisibleQueryFromSearchURL:a3 allowQueryThatLooksLikeURL:0];
}

+ (id)defaultProviderInUserVisibleProviders:(id)a3 usingSettings:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v5) {
    uint64_t v10 = @"PrivateLocallySelectedBuiltInProviderShortName";
  }
  else {
    uint64_t v10 = @"LocallySelectedBuiltInProviderShortName";
  }
  uint64_t v11 = objc_msgSend(v8, "safari_stringForKey:", v10);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v12);
        }
        if (!v15)
        {
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "shortName", (void)v26);
          int v20 = [v11 isEqualToString:v19];

          if (v20) {
            id v15 = v18;
          }
          else {
            id v15 = 0;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }

  id v21 = v15;
  v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = [v12 firstObject];
  }
  v24 = v23;

  return v24;
}

+ (id)userVisibleProvidersInAllProviders:(id)a3 usingContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "shouldDisplaySearchProviderInContext:", v6, (void)v20))
        {
          id v15 = [v14 shortName];
          uint64_t v16 = [v8 objectForKeyedSubscript:v15];

          if (!v16)
          {
            v17 = [v14 shortName];
            [v8 setObject:v14 forKeyedSubscript:v17];

            [v7 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  v18 = (void *)[v7 copy];
  return v18;
}

uint64_t __70__WBSSearchProvider_sortedSearchProvidersInArray_usingShortNameOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 shortName];
  unint64_t v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v6 shortName];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return 1;
  }
}

- (NSString)shortName
{
  return self->_shortName;
}

- (WBSSearchProvider)initWithCoder:(id)a3
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 allowsKeyedCoding]
    && (v43.receiver = self,
        v43.super_class = (Class)WBSSearchProvider,
        (self = [(WBSSearchProvider *)&v43 init]) != 0))
  {
    self->_searchID = (int)[v4 decodeIntForKey:@"searchID"];
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchEngineIdentifier"];
    searchEngineIdentifier = self->_searchEngineIdentifier;
    self->_searchEngineIdentifier = v5;

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortName"];
    shortName = self->_shortName;
    self->_shortName = v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchURLTemplate"];
    searchURLTemplate = self->_searchURLTemplate;
    self->_searchURLTemplate = v9;

    unint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    uint64_t v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"safeSearchURLQueryParameters"];
    safeSearchURLQueryParameters = self->_safeSearchURLQueryParameters;
    self->_safeSearchURLQueryParameters = v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"safeSearchURLTemplate"];
    safeSearchURLTemplate = self->_safeSearchURLTemplate;
    self->_safeSearchURLTemplate = v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionsURLTemplate"];
    suggestionsURLTemplate = self->_suggestionsURLTemplate;
    self->_suggestionsURLTemplate = v18;

    long long v20 = (void *)MEMORY[0x1E4F1CAD0];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    long long v22 = [v20 setWithArray:v21];
    long long v23 = [v4 decodeObjectOfClasses:v22 forKey:@"hostSuffixes"];
    hostSuffixes = self->_hostSuffixes;
    self->_hostSuffixes = v23;

    uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    long long v27 = [v25 setWithArray:v26];
    long long v28 = [v4 decodeObjectOfClasses:v27 forKey:@"pathPrefixes"];
    pathPrefixes = self->_pathPrefixes;
    self->_pathPrefixes = v28;

    self->_usesSearchTermsFromFragment = [v4 decodeBoolForKey:@"usesSearchTermsFromFragment"];
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifierQueryStringKey"];
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    self->_groupIdentifierQueryStringKey = v30;

    uint64_t v32 = (void *)MEMORY[0x1E4F1CB10];
    v33 = [(WBSOpenSearchURLTemplate *)self->_searchURLTemplate templateString];
    v34 = objc_msgSend(v32, "safari_URLWithUserTypedString:", v33);
    self->_usesSecureSearchURL = objc_msgSend(v34, "safari_isSecureURL");

    uint64_t v35 = [(WBSOpenSearchURLTemplate *)self->_searchURLTemplate templateString];
    v36 = queryKeyFromSearchTemplate(v35);
    v37 = (NSString *)[v36 copy];
    queryKey = self->_queryKey;
    self->_queryKey = v37;

    v39 = (WBSURLSuffixChecker *)[objc_alloc(MEMORY[0x1E4F98420]) initWithSuffixes:self->_hostSuffixes];
    suffixChecker = self->_suffixChecker;
    self->_suffixChecker = v39;

    self = self;
    v41 = self;
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  if ([v13 allowsKeyedCoding])
  {
    [v13 encodeInteger:self->_searchID forKey:@"searchID"];
    [v13 encodeObject:self->_searchEngineIdentifier forKey:@"searchEngineIdentifier"];
    shortName = self->_shortName;
    if (shortName) {
      [v13 encodeObject:shortName forKey:@"shortName"];
    }
    searchURLTemplate = self->_searchURLTemplate;
    if (searchURLTemplate) {
      [v13 encodeObject:searchURLTemplate forKey:@"searchURLTemplate"];
    }
    safeSearchURLTemplate = self->_safeSearchURLTemplate;
    id v7 = v13;
    if (safeSearchURLTemplate)
    {
      [v13 encodeObject:safeSearchURLTemplate forKey:@"safeSearchURLTemplate"];
      id v7 = v13;
    }
    suggestionsURLTemplate = self->_suggestionsURLTemplate;
    if (suggestionsURLTemplate)
    {
      [v13 encodeObject:suggestionsURLTemplate forKey:@"suggestionsURLTemplate"];
      id v7 = v13;
    }
    hostSuffixes = self->_hostSuffixes;
    if (hostSuffixes)
    {
      [v13 encodeObject:hostSuffixes forKey:@"hostSuffixes"];
      id v7 = v13;
    }
    pathPrefixes = self->_pathPrefixes;
    if (pathPrefixes)
    {
      [v13 encodeObject:pathPrefixes forKey:@"pathPrefixes"];
      id v7 = v13;
    }
    safeSearchURLQueryParameters = self->_safeSearchURLQueryParameters;
    if (safeSearchURLQueryParameters)
    {
      [v13 encodeObject:safeSearchURLQueryParameters forKey:@"safeSearchURLQueryParameters"];
      id v7 = v13;
    }
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    if (groupIdentifierQueryStringKey)
    {
      [v13 encodeObject:groupIdentifierQueryStringKey forKey:@"groupIdentifierQueryStringKey"];
      id v7 = v13;
    }
    [v7 encodeBool:self->_usesSearchTermsFromFragment forKey:@"usesSearchTermsFromFragment"];
  }
}

- (id)userVisibleQueryFromSearchURL:(id)a3 allowQueryThatLooksLikeURL:(BOOL)a4
{
  id v6 = a3;
  if (![(WBSSearchProvider *)self urlIsValidSearch:v6])
  {
    id v14 = 0;
    goto LABEL_15;
  }
  if (!self->_usesSearchTermsFromFragment
    || ([v6 fragment],
        id v7 = objc_claimAutoreleasedReturnValue(),
        valueForKeyInQuery(v7, self->_queryKey),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    id v9 = [v6 query];
    unint64_t v8 = valueForKeyInQuery(v9, self->_queryKey);
  }
  uint64_t v10 = objc_msgSend(v8, "safari_stringDecodedFromURLQueryParameter");
  unint64_t v11 = objc_msgSend(v10, "safari_stringByTrimmingWhitespace");
  uint64_t v12 = [v11 length];

  if (!v12) {
    goto LABEL_12;
  }
  if (a4) {
    goto LABEL_13;
  }
  id v13 = objc_msgSend(v10, "safari_stringByReplacingHomoglyphForSpaceWithSpace");
  if ((objc_msgSend(v13, "safari_containsInteriorWhitespace") & 1) != 0
    || (objc_msgSend(v13, "safari_containsPeriodOrHomoglyphForPeriod") & 1) == 0)
  {
    char v15 = objc_msgSend(v13, "safari_mightContainURLScheme");

    if (v15) {
      goto LABEL_12;
    }
LABEL_13:
    id v14 = v10;
    goto LABEL_14;
  }

LABEL_12:
  id v14 = 0;
LABEL_14:

LABEL_15:
  return v14;
}

- (BOOL)urlIsValidSearch:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
    && (suffixChecker = self->_suffixChecker,
        [v4 host],
        id v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(suffixChecker) = [(WBSURLSuffixChecker *)suffixChecker hasSuffix:v6],
        v6,
        suffixChecker))
  {
    if ([(NSArray *)self->_pathPrefixes count])
    {
      id v7 = objc_msgSend(v4, "safari_path");
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      unint64_t v8 = self->_pathPrefixes;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(v7, "safari_hasPrefix:", v12, (void)v14) & 1) != 0)
            {
              LOBYTE(v9) = 1;
              goto LABEL_18;
            }
          }
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)sortedSearchProvidersInArray:(id)a3 usingShortNameOrder:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__WBSSearchProvider_sortedSearchProvidersInArray_usingShortNameOrder___block_invoke;
  v9[3] = &unk_1E5E44020;
  id v10 = v5;
  id v6 = v5;
  id v7 = [a3 sortedArrayUsingComparator:v9];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSearchSuggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_parsecSearchIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifierQueryStringKey, 0);
  objc_storeStrong((id *)&self->_scriptName, 0);
  objc_storeStrong((id *)&self->_topLevelDomains, 0);
  objc_storeStrong((id *)&self->_userRegions, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_homepageURLs, 0);
  objc_storeStrong((id *)&self->_carrierInfo, 0);
  objc_storeStrong((id *)&self->_pathPrefixes, 0);
  objc_storeStrong((id *)&self->_hostSuffixes, 0);
  objc_storeStrong((id *)&self->_suggestionsURLTemplate, 0);
  objc_storeStrong((id *)&self->_safeSearchURLQueryParameters, 0);
  objc_storeStrong((id *)&self->_safeSearchURLTemplate, 0);
  objc_storeStrong((id *)&self->_searchURLTemplate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_searchEngineIdentifier, 0);
  objc_storeStrong((id *)&self->_queryKey, 0);
  objc_storeStrong((id *)&self->_suffixChecker, 0);
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WBSSearchProvider *)self shortName];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = \"%@\"; scriptingName = \"%@\">",
    v5,
    self,
    v6,
  id v7 = self->_scriptName);

  return (NSString *)v7;
}

- (id)safeSearchURLForSearchURL:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = self;
  if ([(NSDictionary *)self->_safeSearchURLQueryParameters count])
  {
    long long v23 = v4;
    v24 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:1];
    id v5 = [v24 queryItems];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(id *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v12 = [v11 name];
          id v13 = [(NSDictionary *)v26->_safeSearchURLQueryParameters objectForKeyedSubscript:v12];
          if (v13)
          {
            long long v14 = [v11 value];
            char v15 = [v13 isEqualToString:v14];

            if ((v15 & 1) == 0)
            {
              uint64_t v16 = [MEMORY[0x1E4F290C8] queryItemWithName:v12 value:v13];

              *((unsigned char *)v36 + 24) = 1;
              id v11 = (id)v16;
            }
          }
          [v7 addObject:v12];
          [v6 addObject:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v8);
    }

    safeSearchURLQueryParameters = v26->_safeSearchURLQueryParameters;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __47__WBSSearchProvider_safeSearchURLForSearchURL___block_invoke;
    v27[3] = &unk_1E5E44048;
    id v18 = v7;
    id v28 = v18;
    v30 = &v35;
    id v19 = v6;
    id v29 = v19;
    [(NSDictionary *)safeSearchURLQueryParameters enumerateKeysAndObjectsUsingBlock:v27];
    if (*((unsigned char *)v36 + 24))
    {
      [v24 setQueryItems:v19];
      id v20 = [v24 URL];
    }
    else
    {
      id v20 = v23;
    }
    id v21 = v20;

    _Block_object_dispose(&v35, 8);
    id v4 = v23;
  }
  else
  {
    id v21 = v4;
  }

  return v21;
}

void __47__WBSSearchProvider_safeSearchURLForSearchURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v8] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v6 = *(void **)(a1 + 40);
    id v7 = [MEMORY[0x1E4F290C8] queryItemWithName:v8 value:v5];
    [v6 addObject:v7];
  }
}

- (BOOL)searchShouldUseSafeSearchTemplate
{
  return 0;
}

- (id)searchURLForUserTypedString:(id)a3
{
  id v4 = a3;
  id v5 = self->_searchURLTemplate;
  if (self->_safeSearchURLTemplate
    && [(WBSSearchProvider *)self searchShouldUseSafeSearchTemplate])
  {
    id v6 = self->_safeSearchURLTemplate;

    id v5 = v6;
  }
  id v7 = [(WBSOpenSearchURLTemplate *)v5 URLWithSearchTerms:v4];

  return v7;
}

- (id)suggestionsURLForUserTypedString:(id)a3
{
  return (id)[(WBSOpenSearchURLTemplate *)self->_suggestionsURLTemplate URLWithSearchTerms:a3];
}

- (BOOL)urlIsHomepage:(id)a3
{
  return [(WBSSearchProvider *)self urlIsHomepage:a3 shouldUseCanonicalRepresentation:0];
}

- (BOOL)urlIsHomepage:(id)a3 shouldUseCanonicalRepresentation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    if (v4)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v6);
      id v8 = objc_msgSend(v7, "safari_canonicalURL");
      uint64_t v9 = objc_msgSend(v8, "safari_originalDataAsString");

      if (![v9 length])
      {
        BOOL v10 = 0;
        id v6 = v9;
        goto LABEL_8;
      }
      id v6 = v9;
    }
    BOOL v10 = [(NSSet *)self->_homepageURLs containsObject:v6];
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)_urlByEnsuringQueryItemInURL:(id)a3 percentEncodedQueryItemKey:(id)a4 percentEncodedQueryItemValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [MEMORY[0x1E4F29088] componentsWithURL:v7 resolvingAgainstBaseURL:0];
  id v11 = [v10 percentEncodedQueryItems];
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__20;
  long long v31 = __Block_byref_object_dispose__20;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __106__WBSSearchProvider__urlByEnsuringQueryItemInURL_percentEncodedQueryItemKey_percentEncodedQueryItemValue___block_invoke;
  long long v22 = &unk_1E5E44070;
  id v12 = v8;
  id v23 = v12;
  uint64_t v25 = &v27;
  long long v26 = &v33;
  id v13 = v9;
  id v24 = v13;
  [v11 enumerateObjectsUsingBlock:&v19];
  if (*((unsigned char *)v34 + 24) && objc_msgSend((id)v28[5], "count", v19, v20, v21, v22, v23) == 1)
  {
    id v14 = v7;
  }
  else
  {
    if (v11)
    {
      uint64_t v15 = [v11 mutableCopy];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v16 = (void *)v15;
    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v12 value:v13];
    if (v28[5])
    {
      objc_msgSend(v16, "removeObjectsAtIndexes:");
      objc_msgSend(v16, "insertObject:atIndex:", v17, objc_msgSend((id)v28[5], "firstIndex"));
    }
    else
    {
      [v16 addObject:v17];
    }
    objc_msgSend(v10, "setPercentEncodedQueryItems:", v16, v19, v20, v21, v22);
    id v14 = [v10 URL];
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v14;
}

void __106__WBSSearchProvider__urlByEnsuringQueryItemInURL_percentEncodedQueryItemKey_percentEncodedQueryItemValue___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 name];
  id v15 = [v6 lowercaseString];

  id v7 = [v5 value];

  id v8 = [v7 lowercaseString];

  if ([v15 isEqualToString:a1[4]])
  {
    id v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v9)
    {
      [v9 addIndex:a3];
    }
    else
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:a3];
      uint64_t v11 = *(void *)(a1[6] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    uint64_t v13 = *(void *)(a1[7] + 8);
    if (*(unsigned char *)(v13 + 24))
    {
      char v14 = 1;
    }
    else
    {
      char v14 = [v8 isEqualToString:a1[5]];
      uint64_t v13 = *(void *)(a1[7] + 8);
    }
    *(unsigned char *)(v13 + 24) = v14;
  }
}

- (id)urlAttributingToSafariIfValidSearchURL:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "safari_isHTTPFamilyURL"))
  {
    id v5 = [v4 host];
    id v6 = [v5 lowercaseString];
    char v7 = [v6 hasPrefix:@"www."];

    if (v7 & 1) != 0 && ([(WBSURLSuffixChecker *)self->_suffixChecker hasSuffix:v5])
    {
      id v8 = [(WBSSearchProvider *)self _urlByEnsuringQueryItemInURL:v4 percentEncodedQueryItemKey:@"client" percentEncodedQueryItemValue:@"safari"];
    }
    else
    {
      id v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (id)urlByIncorporatingGroupIdentifier:(unint64_t)a3 ifIsValidSearchResultsURL:(id)a4
{
  id v6 = a4;
  if (self->_groupIdentifierQueryStringKey && [(WBSSearchProvider *)self urlIsValidSearch:v6])
  {
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    id v9 = [(WBSSearchProvider *)self _urlByEnsuringQueryItemInURL:v6 percentEncodedQueryItemKey:groupIdentifierQueryStringKey percentEncodedQueryItemValue:v8];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (int64_t)searchID
{
  return self->_searchID;
}

- (NSString)searchEngineIdentifier
{
  return self->_searchEngineIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  return self->_searchURLTemplate;
}

- (WBSOpenSearchURLTemplate)safeSearchURLTemplate
{
  return self->_safeSearchURLTemplate;
}

- (NSDictionary)safeSearchURLQueryParameters
{
  return self->_safeSearchURLQueryParameters;
}

- (WBSOpenSearchURLTemplate)suggestionsURLTemplate
{
  return self->_suggestionsURLTemplate;
}

- (NSArray)hostSuffixes
{
  return self->_hostSuffixes;
}

- (NSArray)pathPrefixes
{
  return self->_pathPrefixes;
}

- (NSString)carrierInfo
{
  return self->_carrierInfo;
}

- (NSSet)homepageURLs
{
  return self->_homepageURLs;
}

- (NSDictionary)topLevelDomains
{
  return self->_topLevelDomains;
}

- (NSString)scriptName
{
  return self->_scriptName;
}

- (BOOL)usesSearchTermsFromFragment
{
  return self->_usesSearchTermsFromFragment;
}

- (BOOL)usesSecureSearchURL
{
  return self->_usesSecureSearchURL;
}

- (NSString)groupIdentifierQueryStringKey
{
  return self->_groupIdentifierQueryStringKey;
}

- (NSString)parsecSearchIdentifier
{
  return self->_parsecSearchIdentifier;
}

- (NSString)parsecSearchSuggestionIdentifier
{
  return self->_parsecSearchSuggestionIdentifier;
}

- (unint64_t)parsecSearchEndpointType
{
  return self->_parsecSearchEndpointType;
}

- (int)parsecSearchResultType
{
  return self->_parsecSearchResultType;
}

@end