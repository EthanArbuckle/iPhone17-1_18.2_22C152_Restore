@interface SPSearchCommandEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isCommandEntitySearch;
- (BOOL)isPhotosEntitySearch;
- (BOOL)isScopedSearch;
- (BOOL)isServerEntitySearch;
- (SPSearchCommandEntity)initWithCoder:(id)a3;
- (SPSearchCommandEntity)initWithCommand:(id)a3 fromSuggestion:(BOOL)a4;
- (SPSearchCommandEntity)initWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5;
- (id)command;
- (id)currentSearchString;
- (id)queryString;
- (id)spotlightFilterQueries;
- (id)spotlightQueryString;
- (id)symbolName;
- (void)encodeWithCoder:(id)a3;
- (void)updateSearchString:(id)a3;
@end

@implementation SPSearchCommandEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCommandEntitySearch
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPSearchCommandEntity;
  id v4 = a3;
  [(SPSearchEntity *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbolName, @"symbolName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_performCommand forKey:@"performCommand"];
  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), @"isSuggestion");
}

- (SPSearchCommandEntity)initWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SPSearchCommandEntity;
  v11 = [(SPSearchCommandEntity *)&v36 init];
  if (!v11) {
    goto LABEL_14;
  }
  v12 = [v9 currentToken];
  v13 = [v12 displayText];
  v14 = [v13 string];
  v15 = [v14 lowercaseString];

  [(SPSearchEntity *)v11 setSearchString:v15];
  [(SPSearchEntity *)v11 setDisplayString:v15];
  v16 = [v9 currentToken];
  BOOL v34 = v5;
  if ([v16 tokenKind] == 17)
  {
  }
  else
  {
    v17 = [v9 currentToken];
    uint64_t v18 = [v17 tokenKind];

    if (v18 != 45)
    {
      v30 = (SFCommand *)objc_opt_new();
      [(SFCommand *)v30 setSearchString:v15];
      [(SFCommand *)v30 setQuerySource:1];
      performCommand = v11->_performCommand;
      v11->_performCommand = v30;
      goto LABEL_10;
    }
  }
  v19 = [v9 currentToken];
  v20 = [v19 scopes];
  performCommand = [v20 firstObject];

  [(SPSearchEntity *)v11 setTokenString:performCommand];
  v22 = (SFCommand *)objc_opt_new();
  [(SFCommand *)v22 setSearchString:v15];
  [(SFCommand *)v22 setTokenString:performCommand];
  v23 = [v9 currentToken];
  uint64_t v24 = [v23 tokenKind];

  if (v24 == 17)
  {
    uint64_t v25 = 1;
  }
  else
  {
    v26 = [v9 currentToken];
    BOOL v27 = [v26 tokenKind] == 45;

    uint64_t v25 = (4 * v27);
  }
  [(SFCommand *)v22 setEntityType:v25];
  v28 = objc_opt_new();
  [v28 setIsTemplate:1];
  [v28 setSymbolName:v10];
  [(SFCommand *)v22 setSymbolImage:v28];
  v29 = v11->_performCommand;
  v11->_performCommand = v22;

LABEL_10:
  id v35 = 0;
  v31 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v35];
  id v32 = v35;
  [(SFCommand *)v11->_performCommand setBackendData:v31];

  if (v32 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:]();
  }
  objc_storeStrong((id *)&v11->_symbolName, a4);
  objc_storeStrong((id *)&v11->_searchModel, a3);
  [(SPSearchEntity *)v11 setIsSuggestion:v34];

LABEL_14:
  return v11;
}

- (SPSearchCommandEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPSearchCommandEntity;
  BOOL v5 = [(SPSearchEntity *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"performCommand"];
    performCommand = v5->_performCommand;
    v5->_performCommand = (SFCommand *)v8;

    id v10 = [(SFCommand *)v5->_performCommand backendData];

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v12 = objc_opt_class();
      v13 = [(SFCommand *)v5->_performCommand backendData];
      id v18 = 0;
      uint64_t v14 = [v11 unarchivedObjectOfClass:v12 fromData:v13 error:&v18];
      id v15 = v18;
      searchModel = v5->_searchModel;
      v5->_searchModel = (CSSuggestion *)v14;

      if (v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:]();
      }
    }
    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", [v4 decodeBoolForKey:@"isSuggestion"]);
  }

  return v5;
}

- (SPSearchCommandEntity)initWithCommand:(id)a3 fromSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SPSearchCommandEntity;
  uint64_t v8 = [(SPSearchCommandEntity *)&v43 init];
  if (!v8) {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v10 = [v9 searchString];
    [(SPSearchEntity *)v8 setSearchString:v10];

    v11 = [v9 searchString];
    [(SPSearchEntity *)v8 setDisplayString:v11];

    symbolName = v8->_symbolName;
    v13 = @"magnifyingglass";
LABEL_9:
    v8->_symbolName = &v13->isa;
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    id v15 = [v14 searchString];
    [(SPSearchEntity *)v8 setSearchString:v15];

    v16 = [v14 searchString];
    if (v16)
    {
      [(SPSearchEntity *)v8 setDisplayString:v16];
    }
    else
    {
      v22 = [v14 tokenString];
      [(SPSearchEntity *)v8 setDisplayString:v22];
    }
    v23 = [v14 tokenString];
    [(SPSearchEntity *)v8 setTokenString:v23];

    symbolName = [v14 symbolImage];
    uint64_t v24 = [symbolName symbolName];
    uint64_t v25 = v8->_symbolName;
    v8->_symbolName = (NSString *)v24;

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v7;
    id v18 = [v17 person];
    objc_super v19 = [v18 displayName];
    [(SPSearchEntity *)v8 setSearchString:v19];

    v20 = [v17 person];
    v21 = [v20 displayName];
    [(SPSearchEntity *)v8 setDisplayString:v21];

    symbolName = v8->_symbolName;
    v13 = @"person.crop.circle";
    goto LABEL_9;
  }
LABEL_13:
  p_performCommand = (id *)&v8->_performCommand;
  objc_storeStrong((id *)&v8->_performCommand, a3);
  BOOL v27 = [(SFCommand *)v8->_performCommand backendData];

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v29 = objc_opt_class();
    v30 = [*p_performCommand backendData];
    id v42 = 0;
    uint64_t v31 = [v28 unarchivedObjectOfClass:v29 fromData:v30 error:&v42];
    id v32 = v42;
    searchModel = v8->_searchModel;
    v8->_searchModel = (CSSuggestion *)v31;
  }
  else
  {
    BOOL v34 = (void *)MEMORY[0x1E4F23870];
    id v35 = [MEMORY[0x1E4F23870] emptySuggestion];
    objc_super v36 = [(SPSearchEntity *)v8 displayString];
    uint64_t v37 = [v34 updatedSuggestionWithCurrentSuggestion:v35 userString:v36 tokens:MEMORY[0x1E4F1CBF0]];
    v38 = v8->_searchModel;
    v8->_searchModel = (CSSuggestion *)v37;

    v39 = v8->_searchModel;
    id v41 = 0;
    v30 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:&v41];
    id v32 = v41;
    [*p_performCommand setBackendData:v30];
  }

  if (v32 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:]();
  }
  [(SPSearchEntity *)v8 setIsSuggestion:v4];

LABEL_20:
  return v8;
}

- (void)updateSearchString:(id)a3
{
  id v16 = a3;
  -[SPSearchEntity setSearchString:](self, "setSearchString:");
  BOOL v4 = [(SPSearchCommandEntity *)self currentSearchString];
  BOOL v5 = [(SPSearchEntity *)self displayString];
  if (self->_searchModel)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = self->_performCommand;
      id v7 = [(SFCommand *)v6 searchString];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [(SFCommand *)v6 tokenString];
      }
      id v10 = v9;

      BOOL v5 = v10;
    }
  }
  unint64_t v11 = [v4 length];
  if (v11 < [v5 length]
    || ([v4 lowercaseString],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v5 lowercaseString],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v12 containsString:v13],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    [(SPSearchEntity *)self setDisplayString:v16];
    searchModel = self->_searchModel;
    self->_searchModel = 0;
  }
}

- (BOOL)isScopedSearch
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)isServerEntitySearch
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [(SFCommand *)self->_performCommand entityType] == 3;
}

- (BOOL)isPhotosEntitySearch
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [(SFCommand *)self->_performCommand entityType] == 1;
}

- (id)currentSearchString
{
  v3 = [(SPSearchEntity *)self searchString];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = self->_performCommand;
    if ([(SFCommand *)v4 entityType] == 2)
    {
      BOOL v5 = NSString;
      uint64_t v6 = [(SPSearchEntity *)self tokenText];
      id v7 = [v5 stringWithFormat:@"%@ %@", v6, v3];

      v3 = (void *)v6;
    }
    else
    {
      if (-[SFCommand entityType](v4, "entityType") != 1 || v3 && [v3 length]) {
        goto LABEL_9;
      }
      id v7 = @".";
    }

    v3 = v7;
LABEL_9:
  }
  return v3;
}

- (id)queryString
{
  v3 = [(SPSearchEntity *)self searchString];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  BOOL v4 = self->_performCommand;
  BOOL v5 = [(SFCommand *)v4 searchString];
  if ([(SPSearchCommandEntity *)self isServerEntitySearch])
  {
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [(SFCommand *)v4 tokenString];
    }
    goto LABEL_12;
  }
  if ([(SPSearchCommandEntity *)self isPhotosEntitySearch])
  {
    id v6 = [(SPSearchEntity *)self displayString];
LABEL_12:
    uint64_t v13 = (uint64_t)v6;
    goto LABEL_13;
  }
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v7 = [(__CFString *)v3 length];
  if (v7 < [v5 length]) {
    goto LABEL_14;
  }
  uint64_t v8 = [(__CFString *)v3 lowercaseString];
  id v9 = [v5 lowercaseString];
  int v10 = [v8 containsString:v9];

  if (!v10) {
    goto LABEL_14;
  }
  unint64_t v11 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:v5 withString:&stru_1F1824018];
  uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v13 = [(__CFString *)v11 stringByTrimmingCharactersInSet:v12];

  v3 = v11;
LABEL_13:

  v3 = (__CFString *)v13;
LABEL_14:

LABEL_15:
  if (v3) {
    char v14 = v3;
  }
  else {
    char v14 = &stru_1F1824018;
  }
  id v15 = v14;

  return v15;
}

- (id)spotlightQueryString
{
  if ([(SPSearchCommandEntity *)self isPhotosEntitySearch])
  {
    v3 = 0;
    goto LABEL_39;
  }
  BOOL v4 = self->_searchModel;
  if (!v4)
  {
    BOOL v5 = [(SPSearchCommandEntity *)self currentSearchString];
    if (v5)
    {
      id v6 = NSString;
      unint64_t v7 = [(SPSearchCommandEntity *)self currentSearchString];
      uint64_t v8 = [v6 stringWithFormat:@"%@*", v7];
    }
    else
    {
      uint64_t v8 = [(SPSearchEntity *)self searchString];
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [(SFCommand *)self->_performCommand entityType] - 1;
      if (v9 > 3) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = qword_1BDC5F638[v9];
      }
      unint64_t v11 = [MEMORY[0x1E4F23870] emptySuggestion];
      uint64_t v12 = v11;
      uint64_t v13 = v8;
      uint64_t v14 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        BOOL v4 = 0;
        goto LABEL_18;
      }
      unint64_t v11 = [MEMORY[0x1E4F23870] emptySuggestion];
      uint64_t v12 = v11;
      uint64_t v13 = v8;
      uint64_t v14 = 1;
    }
    spotlightSuggestionWithCurrentSuggestion(v11, v13, v14);
    BOOL v4 = (CSSuggestion *)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      goto LABEL_18;
    }
  }
  id v15 = [(CSSuggestion *)v4 suggestionTokens];
  id v16 = [v15 lastObject];
  v3 = [v16 queryString];

  if (!v3)
  {
LABEL_18:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = self->_performCommand;
      if ([(SFCommand *)v17 entityType] == 3)
      {
        id v18 = NSString;
        objc_super v19 = [(SPSearchEntity *)self searchString];
        v20 = SSEscapedStringForSearchQuery(v19);
        v3 = [v18 stringWithFormat:@"(**=\"%@\"cwd)", v20];

LABEL_37:
        goto LABEL_38;
      }
      v26 = [(SFCommand *)v17 entityIdentifier];
LABEL_36:
      v3 = v26;
      goto LABEL_37;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    performCommand = self->_performCommand;
    if (isKindOfClass)
    {
      v23 = NSString;
      id v17 = [(SFCommand *)performCommand person];
      uint64_t v24 = [(SFCommand *)v17 displayName];
      uint64_t v25 = SSEscapedStringForSearchQuery(v24);
      v3 = [v23 stringWithFormat:@"(**=\"%@\"cwd)", v25];

LABEL_26:
      goto LABEL_37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v27 = self->_performCommand;
      v28 = NSString;
      id v17 = [(SFCommand *)v27 searchString];
      uint64_t v24 = SSEscapedStringForSearchQuery(v17);
      v3 = [v28 stringWithFormat:@"(**=\"%@\"cwd)", v24];
      goto LABEL_26;
    }
    uint64_t v29 = [(SPSearchEntity *)self tokenText];

    if (v29)
    {
      v30 = NSString;
      uint64_t v31 = [(SPSearchEntity *)self tokenText];
    }
    else
    {
      id v17 = [(SPSearchEntity *)self searchString];

      if (!v17)
      {
LABEL_32:
        if ([(SFCommand *)v17 length]) {
          BOOL v34 = v17;
        }
        else {
          BOOL v34 = 0;
        }
        v26 = v34;
        goto LABEL_36;
      }
      v30 = NSString;
      uint64_t v31 = [(SPSearchEntity *)self searchString];
    }
    id v32 = v31;
    v33 = SSEscapedStringForSearchQuery(v31);
    [v30 stringWithFormat:@"(**=\"%@\"cwd)", v33];
    id v17 = (SFCommand *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
LABEL_38:

LABEL_39:
  return v3;
}

- (id)spotlightFilterQueries
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(SPSearchCommandEntity *)self isPhotosEntitySearch])
  {
    if (spotlightFilterQueries_onceToken != -1) {
      dispatch_once(&spotlightFilterQueries_onceToken, &__block_literal_global_436_0);
    }
    v13[0] = spotlightFilterQueries_sPhotosFilterQuery;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else if ([(SPSearchCommandEntity *)self isServerEntitySearch])
  {
    BOOL v4 = NSString;
    BOOL v5 = [(SPSearchCommandEntity *)self queryString];
    id v6 = [(SPSearchCommandEntity *)self queryString];
    unint64_t v7 = [(SPSearchCommandEntity *)self queryString];
    uint64_t v8 = [(SPSearchCommandEntity *)self queryString];
    unsigned int v9 = [(SPSearchCommandEntity *)self queryString];
    uint64_t v10 = [v4 stringWithFormat:@"(kMDItemTitle=\"%@\"cwd || kMDItemSubject=\"%@\"cwd || kMDItemDescription=\"%@\"cwd || kMDItemSnippet=\"%@\"cwd || (_kMDItemBundleID=\"%@\" && kMDItemTextContent=\"%@\"cwd))", v5, v6, v7, v8, @"com.apple.MobileSMS", v9];
    uint64_t v12 = v10;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __47__SPSearchCommandEntity_spotlightFilterQueries__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = SSBundlesDonatingPhotos();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = [NSString stringWithFormat:@"_kMDItemBundleID=%@", *(void *)(*((void *)&v11 + 1) + 8 * v5)];
        [v0 addObject:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  if ([v0 count])
  {
    unint64_t v7 = NSString;
    uint64_t v8 = [v0 componentsJoinedByString:@"||"];
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"((kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\") && (%@))", v8);
    uint64_t v10 = (void *)spotlightFilterQueries_sPhotosFilterQuery;
    spotlightFilterQueries_sPhotosFilterQuery = v9;
  }
  else
  {
    uint64_t v8 = (void *)spotlightFilterQueries_sPhotosFilterQuery;
    spotlightFilterQueries_sPhotosFilterQuery = @"(kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\")";
  }
}

- (id)symbolName
{
  return self->_symbolName;
}

- (id)command
{
  return self->_performCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_performCommand, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (void)initWithSpotlightSuggestion:symbolName:fromSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, MEMORY[0x1E4F14500], v0, "Error archiving backend search model: %@", v1, v2, v3, v4, v5);
}

@end