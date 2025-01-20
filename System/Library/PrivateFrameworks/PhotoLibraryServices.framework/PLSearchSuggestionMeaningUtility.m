@interface PLSearchSuggestionMeaningUtility
+ (id)_templateKeyPrefixForMeaningTemplateType:(unint64_t)a3;
+ (id)generateMeaningBasedTemplateWithMeaningTemplateType:(unint64_t)a3 meaningTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7;
+ (id)meaningIdentifierForMeaningTemplateType:(unint64_t)a3;
+ (id)supportedMeaningIdentifiers;
@end

@implementation PLSearchSuggestionMeaningUtility

+ (id)_templateKeyPrefixForMeaningTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return *(&off_1E586E8F8 + a3 - 1);
  }
}

+ (id)generateMeaningBasedTemplateWithMeaningTemplateType:(unint64_t)a3 meaningTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a7;
  v12 = +[PLSearchSuggestionMeaningUtility _templateKeyPrefixForMeaningTemplateType:a3];
  unint64_t v13 = a4 - 1;
  if (a4 - 1 > 4)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v14 = qword_19BA9EA78[v13];
    uint64_t v15 = qword_19BA9EAA0[v13];
    uint64_t v16 = qword_19BA9EAC8[v13];
    uint64_t v17 = (uint64_t)*(&off_1E586E8D0 + v13);
  }
  v18 = [NSString stringWithFormat:@"%@%@", v12, v17];
  v19 = +[PLSearchSuggestionMeaningUtility meaningIdentifierForMeaningTemplateType:a3];
  if ([v12 length] && objc_msgSend(v12, "length") && objc_msgSend(v19, "length"))
  {
    v20 = [[PLSearchSuggestionTemplate alloc] initWithSuggestionTemplateKey:v18 firstIndexCategory:1600 secondIndexCategory:v15 templateType:v16 templateContentType:5 templateDateType:v14 styleType:0 identifier:v19 todayDate:v10 locale:v11];
  }
  else
  {
    v21 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v12;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v20 = 0;
  }

  return v20;
}

+ (id)meaningIdentifierForMeaningTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"%@/%lu", @"meaning", a3 + 35, v3];
  }
  return v5;
}

+ (id)supportedMeaningIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 4; ++i)
  {
    uint64_t v4 = +[PLSearchSuggestionMeaningUtility meaningIdentifierForMeaningTemplateType:i];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  v5 = (void *)[v2 copy];

  return v5;
}

@end