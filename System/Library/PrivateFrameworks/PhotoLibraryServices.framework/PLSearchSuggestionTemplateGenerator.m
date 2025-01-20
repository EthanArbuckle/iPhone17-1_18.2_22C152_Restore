@interface PLSearchSuggestionTemplateGenerator
- (NSCalendar)calendar;
- (NSDate)todayDate;
- (NSLocale)locale;
- (PLSearchSuggestionTemplateGenerator)initWithCalendar:(id)a3 todayDate:(id)a4 locale:(id)a5;
- (id)allDateTemplates;
- (id)allHolidayTemplates;
- (id)allMeaningTemplates;
- (id)allMiscellaneousTemplates;
- (id)allPersonTemplates;
- (id)allPetTemplates;
- (id)allSceneTemplates;
- (id)allSeasonTemplates;
- (id)allTemplates;
- (id)allTripTemplates;
- (id)limitedTemplates;
@end

@implementation PLSearchSuggestionTemplateGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)allMeaningTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 4; ++i)
  {
    for (uint64_t j = 1; j != 6; ++j)
    {
      v6 = [(PLSearchSuggestionTemplateGenerator *)self calendar];
      v7 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
      v8 = [(PLSearchSuggestionTemplateGenerator *)self locale];
      v9 = +[PLSearchSuggestionMeaningUtility generateMeaningBasedTemplateWithMeaningTemplateType:i meaningTemplateSubType:j calendar:v6 todayDate:v7 locale:v8];

      if (v9) {
        [v3 addObject:v9];
      }
    }
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (id)allTripTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [PLSearchSuggestionTemplate alloc];
  v5 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
  v6 = [(PLSearchSuggestionTemplateGenerator *)self locale];
  v7 = [(PLSearchSuggestionTemplate *)v4 initWithSuggestionTemplateKey:@"TRIPS_IN_YEAR" firstIndexCategory:1610 secondIndexCategory:1101 templateType:3 templateContentType:6 templateDateType:0 styleType:0 identifier:0 todayDate:v5 locale:v6];

  if (v7) {
    [v3 addObject:v7];
  }

  v8 = (void *)[v3 copy];
  return v8;
}

- (id)allDateTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 10; ++i)
  {
    if (i != 4 && (i & 0x7FFFFFFFFFFFFFFELL) != 2)
    {
      v5 = +[PLSearchSuggestionDateUtility templateKeyForDateTemplateType:i];
      v6 = [PLSearchSuggestionTemplate alloc];
      v7 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
      v8 = [(PLSearchSuggestionTemplateGenerator *)self locale];
      v9 = [(PLSearchSuggestionTemplate *)v6 initWithSuggestionTemplateKey:v5 firstIndexCategory:0 secondIndexCategory:0 templateType:4 templateContentType:4 templateDateType:i styleType:0 identifier:0 todayDate:v7 locale:v8];

      if (v9) {
        [v3 addObject:v9];
      }
    }
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (id)allMiscellaneousTemplates
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)allSeasonTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 5; ++i)
  {
    char v5 = 0;
    uint64_t v6 = 1;
    do
    {
      char v7 = v5;
      v8 = [(PLSearchSuggestionTemplateGenerator *)self calendar];
      v9 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
      v10 = [(PLSearchSuggestionTemplateGenerator *)self locale];
      v11 = +[PLSearchSuggestionSeasonUtility generateSeasonBasedTemplateWithSeasonTemplateType:i seasonTemplateSubType:v6 calendar:v8 todayDate:v9 locale:v10];

      if (v11) {
        [v3 addObject:v11];
      }

      char v5 = 1;
      uint64_t v6 = 2;
    }
    while ((v7 & 1) == 0);
  }
  v12 = (void *)[v3 copy];

  return v12;
}

- (id)allHolidayTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v5 = qword_19BA9AC08[i];
    uint64_t v6 = qword_19BA9ABF0[i];
    uint64_t v7 = qword_19BA9ABD8[i];
    v8 = off_1E5869800[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    v10 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
    v11 = [(PLSearchSuggestionTemplateGenerator *)self locale];
    v12 = [(PLSearchSuggestionTemplate *)v9 initWithSuggestionTemplateKey:v8 firstIndexCategory:1103 secondIndexCategory:v5 templateType:v7 templateContentType:3 templateDateType:v6 styleType:0 identifier:0 todayDate:v10 locale:v11];

    if (v12) {
      [v3 addObject:v12];
    }
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (id)allSceneTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 52; ++i)
  {
    for (uint64_t j = 1; j != 7; ++j)
    {
      uint64_t v6 = [(PLSearchSuggestionTemplateGenerator *)self calendar];
      uint64_t v7 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
      v8 = [(PLSearchSuggestionTemplateGenerator *)self locale];
      v9 = +[PLSearchSuggestionSceneUtility generateSceneBasedTemplateWithSceneTemplateType:i sceneTemplateSubType:j calendar:v6 todayDate:v7 locale:v8];

      if (v9) {
        [v3 addObject:v9];
      }
    }
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (id)allPetTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v5 = qword_19BA9ABC0[i];
    uint64_t v6 = qword_19BA9ABA8[i];
    uint64_t v7 = qword_19BA9AB90[i];
    v8 = off_1E58697E8[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    v10 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
    v11 = [(PLSearchSuggestionTemplateGenerator *)self locale];
    v12 = [(PLSearchSuggestionTemplate *)v9 initWithSuggestionTemplateKey:v8 firstIndexCategory:v6 secondIndexCategory:v5 templateType:v7 templateContentType:7 templateDateType:0 styleType:0 identifier:0 todayDate:v10 locale:v11];

    if (v12) {
      [v3 addObject:v12];
    }
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (id)allPersonTemplates
{
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 10; ++i)
  {
    v4 = off_1E5869798[i];
    uint64_t v5 = qword_19BA9AA50[i];
    uint64_t v6 = qword_19BA9AAA0[i];
    uint64_t v7 = qword_19BA9AAF0[i];
    uint64_t v8 = qword_19BA9AB40[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    v10 = [(PLSearchSuggestionTemplateGenerator *)self todayDate];
    v11 = [(PLSearchSuggestionTemplateGenerator *)self locale];
    v12 = [(PLSearchSuggestionTemplate *)v9 initWithSuggestionTemplateKey:v4 firstIndexCategory:v7 secondIndexCategory:v8 templateType:v5 templateContentType:9 templateDateType:v6 styleType:0 identifier:0 todayDate:v10 locale:v11];

    if (v12) {
      [v15 addObject:v12];
    }
  }
  v13 = (void *)[v15 copy];

  return v13;
}

- (id)limitedTemplates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLSearchSuggestionTemplateProvider limitedTemplateKeys];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(PLSearchSuggestionTemplateGenerator *)self allTemplates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 suggestionTemplateKey];
        int v12 = [v3 containsObject:v11];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

- (id)allTemplates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [(PLSearchSuggestionTemplateGenerator *)self allPersonTemplates];
  [v3 addObjectsFromArray:v14];
  id v4 = [(PLSearchSuggestionTemplateGenerator *)self allPetTemplates];
  [v3 addObjectsFromArray:v4];
  uint64_t v5 = [(PLSearchSuggestionTemplateGenerator *)self allSceneTemplates];
  [v3 addObjectsFromArray:v5];
  uint64_t v6 = [(PLSearchSuggestionTemplateGenerator *)self allHolidayTemplates];
  [v3 addObjectsFromArray:v6];
  uint64_t v7 = [(PLSearchSuggestionTemplateGenerator *)self allSeasonTemplates];
  [v3 addObjectsFromArray:v7];
  uint64_t v8 = [(PLSearchSuggestionTemplateGenerator *)self allMiscellaneousTemplates];
  [v3 addObjectsFromArray:v8];
  v9 = [(PLSearchSuggestionTemplateGenerator *)self allDateTemplates];
  [v3 addObjectsFromArray:v9];
  v10 = [(PLSearchSuggestionTemplateGenerator *)self allMeaningTemplates];
  [v3 addObjectsFromArray:v10];
  v11 = [(PLSearchSuggestionTemplateGenerator *)self allTripTemplates];
  [v3 addObjectsFromArray:v11];
  int v12 = (void *)[v3 copy];

  return v12;
}

- (PLSearchSuggestionTemplateGenerator)initWithCalendar:(id)a3 todayDate:(id)a4 locale:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplateGenerator.m", 31, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplateGenerator.m", 32, @"Invalid parameter not satisfying: %@", @"todayDate" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PLSearchSuggestionTemplateGenerator;
  v13 = [(PLSearchSuggestionTemplateGenerator *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_calendar, a3);
    objc_storeStrong((id *)&v14->_todayDate, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
  }

  return v14;
}

@end