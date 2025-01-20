@interface SPSearchEntity
+ (BOOL)supportsSecureCoding;
+ (SPSearchEntity)allocWithZone:(_NSZone *)a3;
+ (SPSearchEntity)searchEntityWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5;
+ (SPSearchEntity)searchEntityWithCommand:(id)a3 fromSuggestion:(BOOL)a4;
+ (SPSearchEntity)searchEntityWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4;
+ (SPSearchEntity)searchEntityWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5;
+ (SPSearchEntity)searchEntityWithPhotosSearchString:(id)a3 fromSuggestion:(BOOL)a4;
+ (SPSearchEntity)searchEntityWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5;
+ (SPSearchEntity)searchEntityWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5;
- (BOOL)hasWords;
- (BOOL)isAppEntitySearch;
- (BOOL)isCommandEntitySearch;
- (BOOL)isContactEntitySearch;
- (BOOL)isNLPEntitySearch;
- (BOOL)isPhotosEntitySearch;
- (BOOL)isScopedSearch;
- (BOOL)isServerEntitySearch;
- (BOOL)isSuggestion;
- (NSArray)groupingRules;
- (NSArray)preferredBundleIDs;
- (NSArray)spotlightFilterQueries;
- (NSDictionary)spotlightRankCategories;
- (NSDictionary)spotlightRankTerms;
- (NSString)currentSearchString;
- (NSString)displayString;
- (NSString)searchString;
- (NSString)spotlightQueryString;
- (NSString)symbolName;
- (NSString)tokenText;
- (SFColor)entityBackgroundColor;
- (SFCommand)command;
- (SPSearchEntity)initWithCoder:(id)a3;
- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7;
- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 optionalValue:(id)a6 additions:(id)a7 flags:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setEntityBackgroundColor:(id)a3;
- (void)setHasWords:(BOOL)a3;
- (void)setIsSuggestion:(BOOL)a3;
- (void)setPreferredBundleIDs:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSpotlightFilterQueries:(id)a3;
- (void)setTokenString:(id)a3;
@end

@implementation SPSearchEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPSearchEntity)allocWithZone:(_NSZone *)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SPSearchEntity_allocWithZone___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a3;
  block[5] = a1;
  if (allocWithZone__onceToken != -1) {
    dispatch_once(&allocWithZone__onceToken, block);
  }
  if ((id)allocWithZone__myClass == a1)
  {
    v6 = (void *)allocWithZone__entity;
    return (SPSearchEntity *)v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SPSearchEntity;
    return (SPSearchEntity *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

uint64_t __32__SPSearchEntity_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)&OBJC_METACLASS___SPSearchEntity;
  uint64_t v2 = objc_msgSend(objc_msgSendSuper2(&v5, sel_allocWithZone_, v1), "init");
  v3 = (void *)allocWithZone__entity;
  allocWithZone__entity = v2;

  uint64_t result = objc_opt_class();
  allocWithZone__myClass = result;
  return result;
}

- (void)setSearchString:(id)a3
{
}

- (void)setDisplayString:(id)a3
{
}

- (void)setTokenString:(id)a3
{
}

- (BOOL)isScopedSearch
{
  return 0;
}

- (BOOL)isPhotosEntitySearch
{
  return 0;
}

- (BOOL)isContactEntitySearch
{
  return 0;
}

- (BOOL)isAppEntitySearch
{
  return 0;
}

- (BOOL)isNLPEntitySearch
{
  return 0;
}

- (BOOL)isCommandEntitySearch
{
  return 0;
}

- (BOOL)isServerEntitySearch
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  searchString = self->_searchString;
  id v5 = a3;
  [v5 encodeObject:searchString forKey:@"searchString"];
  [v5 encodeObject:self->_displayString forKey:@"displayString"];
  [v5 encodeObject:self->_tokenString forKey:@"tokenString"];
  [v5 encodeObject:self->_entityBackgroundColor forKey:@"entityBackgroundColor"];
  [v5 encodeObject:self->_command forKey:@"command"];
}

- (SPSearchEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SPSearchEntity;
  id v5 = [(SPSearchEntity *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayString"];
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenString"];
    tokenString = v5->_tokenString;
    v5->_tokenString = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityBackgroundColor"];
    entityBackgroundColor = v5->_entityBackgroundColor;
    v5->_entityBackgroundColor = (SFColor *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    command = v5->_command;
    v5->_command = (SFCommand *)v14;
  }
  return v5;
}

- (NSString)tokenText
{
  return self->_tokenString;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)currentSearchString
{
  return self->_searchString;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)symbolName
{
  return 0;
}

- (NSString)spotlightQueryString
{
  return 0;
}

- (NSArray)spotlightFilterQueries
{
  return 0;
}

- (NSDictionary)spotlightRankCategories
{
  return 0;
}

- (NSDictionary)spotlightRankTerms
{
  return 0;
}

- (NSArray)groupingRules
{
  return 0;
}

- (SFCommand)command
{
  command = self->_command;
  if (!command)
  {
    id v4 = (SFCommand *)objc_opt_new();
    id v5 = [(SPSearchEntity *)self searchString];
    [(SFCommand *)v4 setSearchString:v5];

    uint64_t v6 = self->_command;
    self->_command = v4;

    command = self->_command;
  }
  return command;
}

+ (SPSearchEntity)searchEntityWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SPSearchCommandEntity alloc] initWithSpotlightSuggestion:v8 symbolName:v7 fromSuggestion:v5];

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithPhotosSearchString:(id)a3 fromSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x1E4F23870];
  id v6 = a3;
  id v7 = [v5 emptySuggestion];
  id v8 = spotlightSuggestionWithCurrentSuggestion(v7, v6, 6);

  if (v8) {
    v9 = [[SPSearchCommandEntity alloc] initWithSpotlightSuggestion:v8 symbolName:@"photo.on.rectangle" fromSuggestion:v4];
  }
  else {
    v9 = 0;
  }

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[SPSearchSuggestionEntity alloc] initWithSearchString:v9 spotlightQueryString:v8 preferredBundleIDs:v7];

  return (SPSearchEntity *)v10;
}

+ (SPSearchEntity)searchEntityWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[SPSearchAppEntity alloc] initWithBundleIdentifier:v8 appName:v7 fromSuggestion:v5];

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[SPSearchContactEntity alloc] initWithContactIdentifier:v5 fromSuggestion:v4];

  return (SPSearchEntity *)v6;
}

+ (SPSearchEntity)searchEntityWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[SPSearchContactEntity alloc] initWithPersonQueryIdentifier:v8 personName:v7 fromSuggestion:v5];

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithCommand:(id)a3 fromSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (SFCommand *)v6;
    if ([(SFCommand *)v7 entityType] == 2)
    {
      id v8 = [(SFCommand *)v7 entityIdentifier];
      id v9 = [(SFCommand *)v7 tokenString];
      uint64_t v10 = [a1 searchEntityWithPersonQueryIdentifier:v8 personName:v9 fromSuggestion:v4];
    }
    else
    {
      uint64_t v10 = [[SPSearchCommandEntity alloc] initWithCommand:v7 fromSuggestion:v4];
    }
    v11 = [(SFCommand *)v7 entityBackgroundColor];
    [(SPSearchEntity *)v10 setEntityBackgroundColor:v11];

    command = v10->super._command;
    v10->super._command = v7;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (SPSearchEntity *)v10;
}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7
{
  id v18 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (__CFString *)a7;
  if ([v12 length])
  {
    if ([v18 length]) {
      [v18 appendString:@" || "];
    }
    uint64_t v15 = [(__CFString *)v14 length];
    v16 = &stru_1F1824018;
    if (v15) {
      v16 = v14;
    }
    if (v13) {
      [v18 appendFormat:@"(%@=\"%@\"%@ && %@)", v11, v12, v16, v13];
    }
    else {
      [v18 appendFormat:@"%@=\"%@\"%@", v11, v12, v16, v17];
    }
  }
}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 optionalValue:(id)a6 additions:(id)a7 flags:(id)a8
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (__CFString *)a8;
  if ([v14 length] || objc_msgSend(v15, "length"))
  {
    if ([v22 length]) {
      [v22 appendString:@" || "];
    }
    id v18 = objc_opt_new();
    if (v14 && [v14 length])
    {
      uint64_t v19 = [(__CFString *)v17 length];
      v20 = &stru_1F1824018;
      if (v19) {
        v20 = v17;
      }
      [v18 appendFormat:@"%@=\"%@\"%@", v13, v14, v20];
    }
    if (v15 && [v15 length])
    {
      if ([v18 length]) {
        [v18 appendString:@" || "];
      }
      [v18 appendFormat:@"%@=\"%@*\"cwd", v13, v15];
    }
    if (v16) {
      [v22 appendFormat:@"(%@ && %@)", v18, v16];
    }
    else {
      [v22 appendFormat:@"(%@)", v18, v21];
    }
  }
}

- (BOOL)hasWords
{
  return self->_hasWords;
}

- (void)setHasWords:(BOOL)a3
{
  self->_hasWords = a3;
}

- (BOOL)isSuggestion
{
  return self->_isSuggestion;
}

- (void)setIsSuggestion:(BOOL)a3
{
  self->_isSuggestion = a3;
}

- (void)setSpotlightFilterQueries:(id)a3
{
}

- (NSArray)preferredBundleIDs
{
  return self->_preferredBundleIDs;
}

- (void)setPreferredBundleIDs:(id)a3
{
}

- (SFColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (void)setEntityBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBundleIDs, 0);
  objc_storeStrong((id *)&self->_spotlightFilterQueries, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end