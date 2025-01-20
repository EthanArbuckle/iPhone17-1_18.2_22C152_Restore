@interface WBSParsecSearchResult
+ (int64_t)typeForSFSearchResult:(id)a3;
- (BOOL)isPredictionFromServerMatchingUserTypedQuery:(id)a3;
- (NSString)completion;
- (NSString)debugDescription;
- (NSString)descriptionText;
- (NSString)feedbackIdentifier;
- (NSString)identifier;
- (NSString)imageURL;
- (NSString)parsecDomainIdentifier;
- (NSString)query;
- (NSString)referrerForLoadingResult;
- (NSString)sectionBundleIdentifier;
- (NSString)sectionHeader;
- (NSString)stringForType;
- (NSString)title;
- (NSString)urlString;
- (NSURL)appPunchoutURL;
- (SFSearchResult)sfSearchResult;
- (SFSearchResult)sfSearchResultValue;
- (WBSParsecSearchResult)init;
- (WBSParsecSearchResult)initWithSFSearchResult:(id)a3;
- (int64_t)parsecQueryID;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)engagementDestination;
- (unint64_t)minimumRankOfTopHitToSuppressResult;
- (void)type;
@end

@implementation WBSParsecSearchResult

- (WBSParsecSearchResult)init
{
  return 0;
}

- (WBSParsecSearchResult)initWithSFSearchResult:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSParsecSearchResult;
  v6 = [(WBSParsecSearchResult *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sfSearchResult, a3);
    v8 = [(WBSParsecSearchResult *)v7 sfSearchResultValue];
    v9 = objc_msgSend(v8, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v10 = [v9 thumbnail];

    if (v10) {
      goto LABEL_4;
    }
    v11 = [(WBSParsecSearchResult *)v7 sfSearchResultValue];
    v12 = objc_msgSend(v11, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v10 = [v12 image];

    if (v10)
    {
LABEL_4:
      v13 = [v10 dictionaryRepresentation];
      v14 = [v13 objectForKeyedSubscript:@"urlValue"];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"address"];
      imageURL = v7->_imageURL;
      v7->_imageURL = (NSString *)v15;
    }
    v17 = v7;
  }

  return v7;
}

- (int64_t)type
{
  v2 = self->_sfSearchResult;
  int64_t v3 = +[WBSParsecSearchResult typeForSFSearchResult:v2];
  if (!v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXParsec();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(WBSParsecSearchResult *)v4 type];
    }
  }

  return v3;
}

- (NSString)stringForType
{
  int64_t v2 = [(WBSParsecSearchResult *)self type];
  if ((unint64_t)(v2 - 1) > 4) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_1E5C9DC40[v2 - 1]->isa;
  }
}

+ (int64_t)typeForSFSearchResult:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 resultType];
  char v5 = [v4 isEqualToString:@"flights"];

  if (v5)
  {
    int64_t v6 = 5;
  }
  else
  {
    v7 = [v3 resultType];
    char v8 = [v7 isEqualToString:@"sports"];

    if (v8)
    {
      int64_t v6 = 4;
    }
    else if ([MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled] {
           && ([v3 resultType],
    }
               v9 = objc_claimAutoreleasedReturnValue(),
               char v10 = [v9 isEqualToString:@"maps"],
               v9,
               (v10 & 1) != 0))
    {
      int64_t v6 = 2;
    }
    else
    {
      v11 = [v3 inlineCard];
      v12 = [v11 cardSections];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        int64_t v6 = 4;
        while (2)
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = v13;
              goto LABEL_18;
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v26[0] = @"simple";
      v26[1] = @"maps";
      v27[0] = &unk_1EFC22810;
      v27[1] = &unk_1EFC22828;
      v26[2] = @"generic";
      v27[2] = &unk_1EFC22840;
      v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 3, v22);
      objc_super v19 = [v3 resultTemplate];
      v20 = [v18 objectForKeyedSubscript:v19];
      int64_t v6 = [v20 integerValue];

LABEL_18:
    }
  }

  return v6;
}

- (int64_t)subtype
{
  int64_t v2 = [(SFSearchResult *)self->_sfSearchResult resultType];
  id v3 = [&unk_1EFC22338 objectForKeyedSubscript:v2];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  sfSearchResult = [(SFSearchResult *)self->_sfSearchResult safari_firstInlineCardSectionOfClass:objc_opt_class()];
  int64_t v4 = sfSearchResult;
  if (!sfSearchResult)
  {
    if (+[WBSParsecSearchResult typeForSFSearchResult:self->_sfSearchResult] == 3)
    {
      char v5 = [(SFSearchResult *)self->_sfSearchResult safari_firstInlineCardSectionOfClass:objc_opt_class()];
      if (v5)
      {
        int64_t v6 = v5;
        v7 = [v5 title];
        char v8 = [v7 text];

        goto LABEL_7;
      }
    }
    sfSearchResult = self->_sfSearchResult;
  }
  int64_t v6 = [sfSearchResult title];
  char v8 = [v6 text];
LABEL_7:

  return (NSString *)v8;
}

- (NSString)descriptionText
{
  id v3 = [(SFSearchResult *)self->_sfSearchResult safari_firstInlineCardSectionOfClass:objc_opt_class()];
  int64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 subtitle];
    int64_t v6 = [v5 text];
  }
  else
  {
    if (+[WBSParsecSearchResult typeForSFSearchResult:self->_sfSearchResult] == 3&& ([(SFSearchResult *)self->_sfSearchResult safari_firstInlineCardSectionOfClass:objc_opt_class()], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v5 = v7;
      char v8 = [v7 secondaryTitle];
    }
    else
    {
      char v5 = [(SFSearchResult *)self->_sfSearchResult descriptions];
      char v8 = [v5 firstObject];
    }
    v9 = v8;
    int64_t v6 = [v8 text];
  }
  return (NSString *)v6;
}

- (NSString)identifier
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult identifier];
}

- (NSString)feedbackIdentifier
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult fbr];
}

- (NSString)urlString
{
  int64_t v2 = [(SFSearchResult *)self->_sfSearchResult url];
  id v3 = [v2 absoluteString];

  return (NSString *)v3;
}

- (NSString)sectionHeader
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult sectionHeader];
}

- (NSString)completion
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult completion];
}

- (NSString)query
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult completedQuery];
}

- (unint64_t)minimumRankOfTopHitToSuppressResult
{
  return [(SFSearchResult *)self->_sfSearchResult minimumRankOfTopHitToSuppressResult];
}

- (NSURL)appPunchoutURL
{
  int64_t v2 = [(SFSearchResult *)self->_sfSearchResult punchout];
  id v3 = [v2 preferredOpenableURL];

  return (NSURL *)v3;
}

- (NSString)referrerForLoadingResult
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult appleReferrer];
}

- (BOOL)isPredictionFromServerMatchingUserTypedQuery:(id)a3
{
  id v4 = a3;
  if ([(SFSearchResult *)self->_sfSearchResult topHit])
  {
    char v5 = [v4 queryString];
    if (v5)
    {
      int64_t v6 = [(SFSearchResult *)self->_sfSearchResult completedQuery];
      v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      char v8 = [v6 stringByTrimmingCharactersInSet:v7];

      if ([v8 hasPrefix:v5]) {
        BOOL v9 = [v8 length] != 0;
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (SFSearchResult)sfSearchResultValue
{
  return self->_sfSearchResult;
}

- (NSString)sectionBundleIdentifier
{
  return (NSString *)[(SFSearchResult *)self->_sfSearchResult sectionBundleIdentifier];
}

- (int64_t)parsecQueryID
{
  return 0;
}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (unint64_t)engagementDestination
{
  return 0;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  int64_t v6 = [(WBSParsecSearchResult *)self title];
  v7 = [(WBSParsecSearchResult *)self urlString];
  char v8 = [v3 stringWithFormat:@"<%@: %p title = %@ url = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (SFSearchResult)sfSearchResult
{
  return self->_sfSearchResult;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_sfSearchResult, 0);
}

- (void)type
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 resultTemplate];
  int v5 = 138543362;
  int64_t v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Received result of unknown type %{public}@", (uint8_t *)&v5, 0xCu);
}

@end