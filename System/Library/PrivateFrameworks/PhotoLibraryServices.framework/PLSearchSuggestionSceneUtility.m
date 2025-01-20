@interface PLSearchSuggestionSceneUtility
+ (id)_templateKeyPrefixForSceneTemplateType:(unint64_t)a3;
+ (id)generateSceneBasedTemplateWithSceneTemplateType:(unint64_t)a3 sceneTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7;
+ (id)sceneIdentifierForSceneTemplateType:(unint64_t)a3;
+ (id)supportedSceneIdentifiers;
@end

@implementation PLSearchSuggestionSceneUtility

+ (id)_templateKeyPrefixForSceneTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 0x32) {
    return 0;
  }
  else {
    return off_1E586D130[a3 - 1];
  }
}

+ (id)generateSceneBasedTemplateWithSceneTemplateType:(unint64_t)a3 sceneTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v24 = v11;
  switch(a4)
  {
    case 1uLL:
      v14 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v15 = 0;
      uint64_t v16 = 11;
      uint64_t v17 = 1300;
      v18 = @"_WITH_PERSON";
      break;
    case 2uLL:
      v14 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v17 = 0;
      uint64_t v16 = 9;
      uint64_t v15 = 2;
      v18 = @"_LAST_WEEK";
      break;
    case 3uLL:
      v14 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v17 = 0;
      uint64_t v16 = 9;
      uint64_t v15 = 3;
      v18 = @"_LAST_MONTH";
      break;
    case 4uLL:
      v14 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v17 = 0;
      uint64_t v16 = 9;
      uint64_t v15 = 4;
      v18 = @"_LAST_YEAR";
      break;
    case 5uLL:
      v14 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v15 = 0;
      uint64_t v16 = 11;
      uint64_t v17 = 5;
      v18 = @"_IN_CITY";
      break;
    case 6uLL:
      v18 = +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:a3];
      uint64_t v17 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 9;
      v14 = @"AT_THE_";
      break;
    default:
      uint64_t v17 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      v18 = 0;
      v14 = 0;
      break;
  }
  v19 = [NSString stringWithFormat:@"%@%@", v14, v18];
  v20 = +[PLSearchSuggestionSceneUtility sceneIdentifierForSceneTemplateType:a3];
  if (-[__CFString length](v14, "length") && -[__CFString length](v18, "length") && [v20 length])
  {
    v21 = [[PLSearchSuggestionTemplate alloc] initWithSuggestionTemplateKey:v19 firstIndexCategory:1500 secondIndexCategory:v17 templateType:v16 templateContentType:8 templateDateType:v15 styleType:0 identifier:v20 todayDate:v12 locale:v13];
  }
  else
  {
    v22 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      __int16 v27 = 2048;
      unint64_t v28 = a3;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)sceneIdentifierForSceneTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 0x32)
  {
    v5 = 0;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"%@/%llu", @"scene", qword_19BA9E860[a3 - 1], v3];
  }
  return v5;
}

+ (id)supportedSceneIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 1; i != 52; ++i)
  {
    uint64_t v4 = +[PLSearchSuggestionSceneUtility sceneIdentifierForSceneTemplateType:i];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  v5 = (void *)[v2 copy];

  return v5;
}

@end