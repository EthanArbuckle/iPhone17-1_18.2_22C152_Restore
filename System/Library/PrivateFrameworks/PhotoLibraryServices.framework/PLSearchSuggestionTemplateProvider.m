@interface PLSearchSuggestionTemplateProvider
+ (id)limitedTemplateKeys;
+ (id)templateForRankedGroup:(id)a3 locale:(id)a4;
+ (unint64_t)localeSupportTypeForTemplateWithKey:(id)a3 locale:(id)a4;
- (NSArray)allDateFilters;
- (NSArray)allTemplates;
- (NSArray)allTemplatesKeys;
- (NSArray)dateOnlyTemplates;
- (NSArray)limitedTemplates;
- (NSArray)supportedIdentifiers;
- (NSCalendar)calendar;
- (NSDate)todayDate;
- (NSIndexSet)nonIdentifierBasedSupportedSearchEntityTypes;
- (NSLocale)locale;
- (PLSearchSuggestionTemplateProvider)initWithLocale:(id)a3;
- (id)_allDateFilters;
- (id)_dateOnlyTemplates;
- (id)dateFilterForSearchSuggestionTemplateDateType:(unint64_t)a3;
- (id)templatesForSearchIndexCategory:(unint64_t)a3 secondIndexCategory:(unint64_t)a4 limitedTemplates:(id)a5;
- (void)setAllDateFilters:(id)a3;
- (void)setAllTemplates:(id)a3;
- (void)setAllTemplatesKeys:(id)a3;
- (void)setDateOnlyTemplates:(id)a3;
- (void)setLimitedTemplates:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNonIdentifierBasedSupportedSearchEntityTypes:(id)a3;
- (void)setSupportedIdentifiers:(id)a3;
@end

@implementation PLSearchSuggestionTemplateProvider

+ (unint64_t)localeSupportTypeForTemplateWithKey:(id)a3 locale:(id)a4
{
  return 3;
}

- (id)dateFilterForSearchSuggestionTemplateDateType:(unint64_t)a3
{
  v5 = [(PLSearchSuggestionTemplateProvider *)self calendar];
  v6 = [(PLSearchSuggestionTemplateProvider *)self todayDate];
  v7 = +[PLSearchSuggestionDateUtility dateFilterForSearchSuggestionTemplateDateType:a3 calendar:v5 relativeDate:v6];

  if (v7) {
    v8 = [[PLInitialSuggestionDateFilter alloc] initWithTemplateDateType:a3 psiDateFilter:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (PLSearchSuggestionTemplateProvider)initWithLocale:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSearchSuggestionTemplateProvider;
  v6 = [(PLSearchSuggestionTemplateProvider *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = (void *)MEMORY[0x1E4F1C9A8];
    v9 = [v5 calendarIdentifier];
    uint64_t v10 = [v8 calendarWithIdentifier:v9];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v10;

    v12 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    todayDate = v7->_todayDate;
    v7->_todayDate = v12;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_allDateFilters, 0);
  objc_storeStrong((id *)&self->_supportedIdentifiers, 0);
  objc_storeStrong((id *)&self->_nonIdentifierBasedSupportedSearchEntityTypes, 0);
  objc_storeStrong((id *)&self->_dateOnlyTemplates, 0);
  objc_storeStrong((id *)&self->_allTemplatesKeys, 0);
  objc_storeStrong((id *)&self->_limitedTemplates, 0);
  objc_storeStrong((id *)&self->_allTemplates, 0);
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setAllDateFilters:(id)a3
{
}

- (void)setSupportedIdentifiers:(id)a3
{
}

- (void)setNonIdentifierBasedSupportedSearchEntityTypes:(id)a3
{
}

- (void)setDateOnlyTemplates:(id)a3
{
}

- (void)setAllTemplatesKeys:(id)a3
{
}

- (void)setLimitedTemplates:(id)a3
{
}

- (void)setAllTemplates:(id)a3
{
}

- (id)_dateOnlyTemplates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PLSearchSuggestionTemplateProvider *)self allTemplates];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDateOnlyTemplate", (void)v12)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (id)_allDateFilters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = +[PLSearchSuggestionDateUtility allTemplateDateTypes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PLSearchSuggestionTemplateProvider__allDateFilters__block_invoke;
  v9[3] = &unk_1E5873A00;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateIndexesUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __53__PLSearchSuggestionTemplateProvider__allDateFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) dateFilterForSearchSuggestionTemplateDateType:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

- (id)templatesForSearchIndexCategory:(unint64_t)a3 secondIndexCategory:(unint64_t)a4 limitedTemplates:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (!a3)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplateProvider.m", 145, @"Invalid parameter not satisfying: %@", @"firstIndexCategory != PLSearchIndexCategoryNone" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_30:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplateProvider.m", 146, @"Invalid parameter not satisfying: %@", @"secondIndexCategory != PLSearchIndexCategoryNone" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_30;
  }
LABEL_3:
  if ([v9 count])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [(PLSearchSuggestionTemplateProvider *)self allTemplates];
  }
  v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v14) {
    goto LABEL_26;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v27 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      int v19 = [v18 templateType];
      if ((~v19 & 3) != 0)
      {
        if ((v19 & 1) != 0
          && ([v18 firstIndexCategory] == a3 || objc_msgSend(v18, "firstIndexCategory") == a4))
        {
          goto LABEL_23;
        }
      }
      else
      {
        BOOL v20 = [v18 firstIndexCategory] == a3 && objc_msgSend(v18, "secondIndexCategory") == a4;
        BOOL v21 = [v18 secondIndexCategory] == a3 && objc_msgSend(v18, "firstIndexCategory") == a4;
        if (v20 || v21)
        {
LABEL_23:
          [v12 addObject:v18];
          continue;
        }
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v15);
LABEL_26:

  v22 = (void *)[v12 copy];
  return v22;
}

- (NSArray)allDateFilters
{
  allDateFilters = self->_allDateFilters;
  if (!allDateFilters)
  {
    id v4 = [(PLSearchSuggestionTemplateProvider *)self _allDateFilters];
    id v5 = self->_allDateFilters;
    self->_allDateFilters = v4;

    allDateFilters = self->_allDateFilters;
  }
  return allDateFilters;
}

- (NSArray)supportedIdentifiers
{
  supportedIdentifiers = self->_supportedIdentifiers;
  if (!supportedIdentifiers)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = +[PLSearchSuggestionSceneUtility supportedSceneIdentifiers];
    [v4 addObjectsFromArray:v5];

    uint64_t v6 = +[PLSearchSuggestionMeaningUtility supportedMeaningIdentifiers];
    [v4 addObjectsFromArray:v6];

    id v7 = +[PLSearchSuggestionSeasonUtility supportedSeasonIdentifiers];
    [v4 addObjectsFromArray:v7];

    v8 = (NSArray *)[v4 copy];
    id v9 = self->_supportedIdentifiers;
    self->_supportedIdentifiers = v8;

    supportedIdentifiers = self->_supportedIdentifiers;
  }
  return supportedIdentifiers;
}

- (NSIndexSet)nonIdentifierBasedSupportedSearchEntityTypes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  nonIdentifierBasedSupportedSearchEntityTypes = self->_nonIdentifierBasedSupportedSearchEntityTypes;
  if (!nonIdentifierBasedSupportedSearchEntityTypes)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(PLSearchSuggestionTemplateProvider *)self allTemplates];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v11 = [v10 identifier];
          uint64_t v12 = [v11 length];

          if (!v12)
          {
            if ([v10 firstIndexCategory]) {
              objc_msgSend(v4, "addIndex:", objc_msgSend(v10, "firstIndexCategory"));
            }
            if ([v10 secondIndexCategory]) {
              objc_msgSend(v4, "addIndex:", objc_msgSend(v10, "secondIndexCategory"));
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    id v13 = (NSIndexSet *)[v4 copy];
    uint64_t v14 = self->_nonIdentifierBasedSupportedSearchEntityTypes;
    self->_nonIdentifierBasedSupportedSearchEntityTypes = v13;

    nonIdentifierBasedSupportedSearchEntityTypes = self->_nonIdentifierBasedSupportedSearchEntityTypes;
  }
  return nonIdentifierBasedSupportedSearchEntityTypes;
}

- (NSArray)dateOnlyTemplates
{
  dateOnlyTemplates = self->_dateOnlyTemplates;
  if (!dateOnlyTemplates)
  {
    id v4 = [(PLSearchSuggestionTemplateProvider *)self _dateOnlyTemplates];
    id v5 = self->_dateOnlyTemplates;
    self->_dateOnlyTemplates = v4;

    dateOnlyTemplates = self->_dateOnlyTemplates;
  }
  return dateOnlyTemplates;
}

- (NSArray)allTemplatesKeys
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  allTemplatesKeys = self->_allTemplatesKeys;
  if (!allTemplatesKeys)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(PLSearchSuggestionTemplateProvider *)self allTemplates];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) suggestionTemplateKey];
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (NSArray *)[v4 copy];
    uint64_t v12 = self->_allTemplatesKeys;
    self->_allTemplatesKeys = v11;

    allTemplatesKeys = self->_allTemplatesKeys;
  }
  return allTemplatesKeys;
}

- (NSArray)limitedTemplates
{
  limitedTemplates = self->_limitedTemplates;
  if (!limitedTemplates)
  {
    id v4 = [PLSearchSuggestionTemplateGenerator alloc];
    id v5 = [(PLSearchSuggestionTemplateProvider *)self calendar];
    uint64_t v6 = [(PLSearchSuggestionTemplateProvider *)self todayDate];
    uint64_t v7 = [(PLSearchSuggestionTemplateProvider *)self locale];
    uint64_t v8 = [(PLSearchSuggestionTemplateGenerator *)v4 initWithCalendar:v5 todayDate:v6 locale:v7];

    uint64_t v9 = [(PLSearchSuggestionTemplateGenerator *)v8 limitedTemplates];
    id v10 = self->_limitedTemplates;
    self->_limitedTemplates = v9;

    limitedTemplates = self->_limitedTemplates;
  }
  return limitedTemplates;
}

- (NSArray)allTemplates
{
  allTemplates = self->_allTemplates;
  if (!allTemplates)
  {
    id v4 = [PLSearchSuggestionTemplateGenerator alloc];
    id v5 = [(PLSearchSuggestionTemplateProvider *)self calendar];
    uint64_t v6 = [(PLSearchSuggestionTemplateProvider *)self todayDate];
    uint64_t v7 = [(PLSearchSuggestionTemplateProvider *)self locale];
    uint64_t v8 = [(PLSearchSuggestionTemplateGenerator *)v4 initWithCalendar:v5 todayDate:v6 locale:v7];

    uint64_t v9 = [(PLSearchSuggestionTemplateGenerator *)v8 allTemplates];
    id v10 = self->_allTemplates;
    self->_allTemplates = v9;

    allTemplates = self->_allTemplates;
  }
  return allTemplates;
}

+ (id)templateForRankedGroup:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 searchIndexingCategory];
  if ([v5 isMePerson]) {
    uint64_t v8 = 17;
  }
  else {
    uint64_t v8 = 1;
  }
  if (v7 <= 1329)
  {
    if (v7 > 1103)
    {
      if (v7 == 1104)
      {
        uint64_t v9 = [v5 lookupIdentifier];
        v8 |= 8uLL;
        uint64_t v10 = 2;
        goto LABEL_26;
      }
      if (v7 == 1300)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 9;
        goto LABEL_26;
      }
    }
    else
    {
      if ((unint64_t)(v7 - 1100) < 2)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 4;
        goto LABEL_26;
      }
      if (v7 == 1103)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 3;
        goto LABEL_26;
      }
    }
    goto LABEL_25;
  }
  if (v7 > 1599)
  {
    if (v7 == 1600)
    {
      uint64_t v9 = [v5 lookupIdentifier];
      v8 |= 8uLL;
      uint64_t v10 = 5;
      goto LABEL_26;
    }
    if (v7 == 1610)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 6;
      goto LABEL_26;
    }
    if (v7 != 2600) {
      goto LABEL_25;
    }
LABEL_18:
    uint64_t v9 = [v5 lookupIdentifier];
    v8 |= 8uLL;
    uint64_t v10 = 8;
    goto LABEL_26;
  }
  if (v7 == 1330)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 7;
    goto LABEL_26;
  }
  if (v7 == 1500) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v9 = 0;
  uint64_t v10 = 1;
LABEL_26:
  v11 = [PLSearchSuggestionTemplate alloc];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = [(PLSearchSuggestionTemplate *)v11 initWithSuggestionTemplateKey:0 firstIndexCategory:v7 secondIndexCategory:0 templateType:v8 templateContentType:v10 templateDateType:0 styleType:1 identifier:v9 todayDate:v12 locale:v6];

  return v13;
}

+ (id)limitedTemplateKeys
{
  return &unk_1EEBF1CD0;
}

@end