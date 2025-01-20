@interface BYLocaleDataSource
+ (id)newWithLanguage:(id)a3;
- (BOOL)hasRecommendedLocaleFromLanguage;
- (NSMutableArray)moreCountries;
- (NSMutableArray)suggestedCountries;
- (NSString)language;
- (id)otherLocaleAtIndex:(unint64_t)a3;
- (id)recommendedLocaleAtIndex:(unint64_t)a3;
- (unint64_t)numberOfOtherLocales;
- (unint64_t)numberOfRecommendedLocales;
- (void)reloadData;
- (void)setHasRecommendedLocaleFromLanguage:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMoreCountries:(id)a3;
- (void)setSuggestedCountries:(id)a3;
@end

@implementation BYLocaleDataSource

+ (id)newWithLanguage:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setLanguage:v3];

  return v4;
}

- (void)reloadData
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = +[BYLocationController sharedBuddyLocationController];
  v4 = [v3 guessedCountries];

  uint64_t v5 = [(BYLocaleDataSource *)self language];
  if (v5 && (v6 = (void *)v5, uint64_t v7 = [v4 count], v6, !v7))
  {
    v8 = (void *)MEMORY[0x1E4F1CA20];
    v9 = [(BYLocaleDataSource *)self language];
    v10 = [v8 baseLanguageFromLanguage:v9];

    v38 = [MEMORY[0x1E4F1CA20] exemplarRegionForLanguage:v10];
  }
  else
  {
    v38 = 0;
  }
  v11 = _BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v45 = v38;
    __int16 v46 = 2114;
    v47 = v4;
    _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, "Setup Assistant Locale: initializing with exemplar region %{public}@ countries = %{public}@", buf, 0x16u);
  }
  v36 = v4;

  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [MEMORY[0x1E4F1CA48] array];
  [(BYLocaleDataSource *)self setSuggestedCountries:v13];

  v14 = [MEMORY[0x1E4F1CA48] array];
  [(BYLocaleDataSource *)self setMoreCountries:v14];

  [(BYLocaleDataSource *)self setHasRecommendedLocaleFromLanguage:0];
  v15 = [MEMORY[0x1E4F1CA20] supportedRegions];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1E4F1CA20];
        v22 = [(BYLocaleDataSource *)self language];
        v23 = [v21 localeWithLocaleIdentifier:v22];
        v24 = [v23 localizedStringForRegion:v20 context:3 short:0];

        if ([v24 isEqualToString:v20])
        {
          _BYLoggingFacility();
          v25 = (BYLocaleCountry *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v20;
            _os_log_impl(&dword_1A7DED000, &v25->super, OS_LOG_TYPE_DEFAULT, "Missing localization for country code: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (![v24 length]) {
            goto LABEL_22;
          }
          v25 = objc_alloc_init(BYLocaleCountry);
          [(BYLocaleCountry *)v25 setName:v24];
          [(BYLocaleCountry *)v25 setCode:v20];
          if (([v12 containsObject:v25] & 1) == 0)
          {
            [v12 addObject:v25];
            if (([v36 containsObject:v20] & 1) != 0
              || [v38 isEqualToString:v20])
            {
              v26 = [(BYLocaleDataSource *)self suggestedCountries];
              [v26 addObject:v25];

              if ([v38 isEqualToString:v20]) {
                [(BYLocaleDataSource *)self setHasRecommendedLocaleFromLanguage:1];
              }
            }
          }
        }

LABEL_22:
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }
  -[BYLocaleDataSource setMoreCountries:](self, "setMoreCountries:", v12, v36);
  v27 = [(BYLocaleDataSource *)self moreCountries];
  v28 = [(BYLocaleDataSource *)self suggestedCountries];
  [v27 removeObjectsInArray:v28];

  v29 = [(BYLocaleDataSource *)self language];
  if ([v29 length])
  {
    v30 = (void *)MEMORY[0x1E4F1CA20];
    v31 = [(BYLocaleDataSource *)self language];
    v32 = [v30 localeWithLocaleIdentifier:v31];
  }
  else
  {
    v32 = 0;
  }

  v33 = +[BYLocaleCountry comparatorForLocale:v32];
  v34 = [(BYLocaleDataSource *)self moreCountries];
  [v34 sortUsingComparator:v33];

  v35 = [(BYLocaleDataSource *)self suggestedCountries];
  [v35 sortUsingComparator:v33];
}

- (unint64_t)numberOfRecommendedLocales
{
  v2 = [(BYLocaleDataSource *)self suggestedCountries];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)numberOfOtherLocales
{
  v2 = [(BYLocaleDataSource *)self moreCountries];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)recommendedLocaleAtIndex:(unint64_t)a3
{
  v4 = [(BYLocaleDataSource *)self suggestedCountries];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)otherLocaleAtIndex:(unint64_t)a3
{
  v4 = [(BYLocaleDataSource *)self moreCountries];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)setLanguage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v7 = v4;
    if (![(NSString *)self->_language isEqualToString:v4])
    {
      uint64_t v5 = (NSString *)[v7 copy];
      language = self->_language;
      self->_language = v5;

      [(BYLocaleDataSource *)self reloadData];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)hasRecommendedLocaleFromLanguage
{
  return self->_hasRecommendedLocaleFromLanguage;
}

- (void)setHasRecommendedLocaleFromLanguage:(BOOL)a3
{
  self->_hasRecommendedLocaleFromLanguage = a3;
}

- (NSMutableArray)suggestedCountries
{
  return self->_suggestedCountries;
}

- (void)setSuggestedCountries:(id)a3
{
}

- (NSMutableArray)moreCountries
{
  return self->_moreCountries;
}

- (void)setMoreCountries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreCountries, 0);
  objc_storeStrong((id *)&self->_suggestedCountries, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end