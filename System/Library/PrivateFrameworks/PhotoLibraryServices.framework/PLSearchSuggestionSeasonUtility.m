@interface PLSearchSuggestionSeasonUtility
+ (id)_templateKeySubstringForSeasonTemplateType:(unint64_t)a3;
+ (id)generateSeasonBasedTemplateWithSeasonTemplateType:(unint64_t)a3 seasonTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7;
+ (id)seasonIdentifierForSeasonTemplateType:(unint64_t)a3;
+ (id)supportedSeasonIdentifiers;
@end

@implementation PLSearchSuggestionSeasonUtility

+ (id)_templateKeySubstringForSeasonTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E586B208[a3 - 1];
  }
}

+ (id)generateSeasonBasedTemplateWithSeasonTemplateType:(unint64_t)a3 seasonTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 2)
  {
    v18 = [a1 _templateKeySubstringForSeasonTemplateType:a3];
    uint64_t v16 = 1104;
    uint64_t v17 = 1101;
    v15 = @"_YEAR";
  }
  else if (a4 == 1)
  {
    v15 = [a1 _templateKeySubstringForSeasonTemplateType:a3];
    uint64_t v16 = 5;
    uint64_t v17 = 1104;
    v18 = @"CITY_IN_THE_";
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    v15 = 0;
    v18 = 0;
  }
  v19 = [NSString stringWithFormat:@"%@%@", v18, v15];
  v20 = [a1 seasonIdentifierForSeasonTemplateType:a3];
  if (-[__CFString length](v18, "length") && -[__CFString length](v15, "length") && [v20 length])
  {
    v21 = [[PLSearchSuggestionTemplate alloc] initWithSuggestionTemplateKey:v19 firstIndexCategory:v16 secondIndexCategory:v17 templateType:11 templateContentType:2 templateDateType:0 styleType:0 identifier:v20 todayDate:v13 locale:v14];
  }
  else
  {
    v22 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)seasonIdentifierForSeasonTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"%@/%lu", @"season", qword_19BA9AE78[a3 - 1], v3];
  }
  return v5;
}

+ (id)supportedSeasonIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 5; ++i)
  {
    uint64_t v4 = +[PLSearchSuggestionSeasonUtility seasonIdentifierForSeasonTemplateType:i];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  v5 = (void *)[v2 copy];

  return v5;
}

@end