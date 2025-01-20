@interface SSRelatedSearchesSectionBuilder
+ (id)supportedBundleIds;
- (BOOL)shouldSkipSection;
- (BOOL)useHorizontallyScrollingCardSectionUI;
- (id)buildCardSections;
- (id)buildTitle;
@end

@implementation SSRelatedSearchesSectionBuilder

+ (id)supportedBundleIds
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.parsec.related_search";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)shouldSkipSection
{
  v8.receiver = self;
  v8.super_class = (Class)SSRelatedSearchesSectionBuilder;
  if ([(SSSectionBuilder *)&v8 shouldSkipSection]) {
    return 1;
  }
  v4 = [(SSSectionBuilder *)self queryContext];
  v5 = [v4 searchEntities];
  v6 = [v5 firstObject];
  if ([v6 isContactEntitySearch]) {
    BOOL v3 = [(SSSectionBuilder *)self renderState] != 4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)buildCardSections
{
  v2 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SSSectionBuilder *)self queryContext];
  v4 = [v3 searchEntities];
  v5 = [v4 firstObject];

  v44 = v3;
  v6 = [v3 searchString];
  if (![(__CFString *)v6 length])
  {
    uint64_t v7 = [v5 searchString];

    v6 = (__CFString *)v7;
  }
  objc_super v8 = [v5 tokenText];
  if ([v8 length]
    && [(__CFString *)v6 length]
    && ([(__CFString *)v6 isEqualToString:v8] & 1) == 0
    && ([v5 isPhotosEntitySearch] & 1) == 0)
  {
    v10 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [(__CFString *)v11 localizedStringForKey:@"SEARCH_CONTINUATION_STRING_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    goto LABEL_12;
  }
  if ([v8 length]
    && ![(__CFString *)v6 length]
    && ([v5 isPhotosEntitySearch] & 1) == 0)
  {
    v9 = v8;
LABEL_12:

    v6 = v9;
  }
  v42 = v8;
  v43 = v5;
  if (!v6) {
    v6 = &stru_1F1824018;
  }
  v13 = [(SSSectionBuilder *)v2 section];
  v14 = [v13 resultSet];
  v15 = [v14 array];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v41 = v2;
    uint64_t v19 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v22 = [v21 inlineCard];
        v23 = [v22 cardSections];
        v24 = [v23 firstObject];
        v25 = [v24 command];

        v26 = [v21 title];
        v27 = [v26 text];
        if ([v27 isEqualToString:v6])
        {

LABEL_29:
          char v30 = 1;
          goto LABEL_30;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28 = [v25 searchString];
          char v29 = [v28 isEqualToString:v6];

          if (v29) {
            goto LABEL_29;
          }
        }
        else
        {
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    char v30 = 0;
LABEL_30:
    v2 = v41;
  }
  else
  {
    char v30 = 0;
  }

  v45.receiver = v2;
  v45.super_class = (Class)SSRelatedSearchesSectionBuilder;
  v31 = [(SSSectionBuilder *)&v45 buildCardSections];
  if ((v30 & 1) == 0)
  {
    v32 = [@"rs:" stringByAppendingString:v6];
    v33 = [MEMORY[0x1E4F9A0E0] textWithString:v6];
    [v33 setIsEmphasized:1];
    v34 = objc_opt_new();
    v51 = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [v34 setFormattedTextPieces:v35];

    v36 = objc_opt_new();
    [v36 setSearchString:v6];
    v37 = objc_opt_new();
    [v37 setSuggestionText:v34];
    [v37 setSuggestionType:4];
    [v37 setResultIdentifier:v32];
    [v37 setCardSectionId:v32];
    [v37 setCommand:v36];
    v50 = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    uint64_t v39 = [v38 arrayByAddingObjectsFromArray:v31];

    v31 = (void *)v39;
  }

  return v31;
}

- (id)buildTitle
{
  v2 = (void *)MEMORY[0x1E4F9A378];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"RELATED_SEARCHES" value:&stru_1F1824018 table:@"SpotlightServices"];
  v5 = [v2 textWithString:v4];

  return v5;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  return 0;
}

@end