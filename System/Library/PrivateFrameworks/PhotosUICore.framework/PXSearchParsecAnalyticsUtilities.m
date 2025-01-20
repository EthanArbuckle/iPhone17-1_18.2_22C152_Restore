@interface PXSearchParsecAnalyticsUtilities
+ (id)SFSearchResultForInitialSuggestionWithQueryId:(int64_t)a3;
+ (id)SFSearchResultFromAssetUUID:(id)a3 isTopResult:(BOOL)a4 retrievalType:(unint64_t)a5 queryId:(int64_t)a6;
+ (id)SFSearchResultFromCollectionIdentifier:(id)a3 type:(unint64_t)a4 queryId:(int64_t)a5;
+ (id)SFSearchResultFromSearchSuggestion:(id)a3 queryId:(int64_t)a4;
+ (id)_baseSFSearchResultForQueryId:(int64_t)a3;
+ (id)_descriptionForSearchToken:(unint64_t)a3;
+ (id)_identifierForSearchSuggestion:(id)a3;
+ (id)_legacyDescriptionForSearchToken:(id)a3;
+ (id)_legacyTokenCategoryTypesForSearchTokens:(id)a3;
+ (id)_resultRankingFeedbacksFromSFSearchResults:(id)a3;
+ (id)_resultSectionForInitialSuggestions:(id)a3 queryId:(int64_t)a4;
+ (id)_searchResultDescriptionForSearchResultType:(unint64_t)a3;
+ (id)_sectionRankingFeedbackWithResultSection:(id)a3 localSectionPosition:(unint64_t)a4;
+ (id)_tokenCategoryTypesForSearchTokens:(id)a3;
+ (id)commandFeedbackFromSFSearchResult:(id)a3;
+ (id)descriptionForSearchString:(id)a3 searchTokens:(id)a4;
+ (id)legacyDescriptionForSearchString:(id)a3 searchTokens:(id)a4;
+ (id)sectionRankingFeedbackWithInitialSuggestions:(id)a3 queryId:(int64_t)a4;
+ (unint64_t)_wordCountForSearchString:(id)a3;
@end

@implementation PXSearchParsecAnalyticsUtilities

+ (id)legacyDescriptionForSearchString:(id)a3 searchTokens:(id)a4
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = [a1 _wordCountForSearchString:v6];
    v9 = [a1 _legacyTokenCategoryTypesForSearchTokens:v7];
    v28[0] = @"cc";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v29[0] = v10;
    v28[1] = @"wc";
    v11 = [NSNumber numberWithUnsignedInteger:v8];
    v29[1] = v11;
    v28[2] = @"tc";
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v28[3] = @"tt";
    v29[2] = v12;
    v29[3] = v9;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

    id v21 = 0;
    v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v21];
    id v15 = v21;
    if (v15)
    {
      v16 = PLSearchUIParsecAnalyticsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v23 = v15;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Error serializing search characteristics: %@ for search string: %@, search tokens: %@", buf, 0x20u);
      }
    }
    if (v14) {
      v17 = (__CFString *)[[NSString alloc] initWithData:v14 encoding:4];
    }
    else {
      v17 = 0;
    }
    v18 = &stru_1F00B0030;
    if (v17) {
      v18 = v17;
    }
    v19 = v18;
  }
  else
  {
    v19 = &stru_1F00B0030;
  }

  return v19;
}

+ (id)_identifierForSearchSuggestion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v3, "hash"));
  if (![v4 length])
  {
    v5 = PLSearchUIParsecAnalyticsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Error constructing identifier for search suggestion: %@", buf, 0xCu);
    }
  }
  return v4;
}

+ (unint64_t)_wordCountForSearchString:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([v3 length])
  {
    id v4 = (id)*MEMORY[0x1E4F38880];
    v15[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F388F0]) initWithTagSchemes:v5];
    [v6 setString:v3];
    uint64_t v7 = [v3 length];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__PXSearchParsecAnalyticsUtilities__wordCountForSearchString___block_invoke;
    v10[3] = &unk_1E5DBDD48;
    v10[4] = &v11;
    objc_msgSend(v6, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v7, 0, v4, 6, v10);
    unint64_t v8 = v12[3];
  }
  else
  {
    unint64_t v8 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __62__PXSearchParsecAnalyticsUtilities__wordCountForSearchString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqualToString:*MEMORY[0x1E4F388A8]];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

+ (id)_legacyDescriptionForSearchToken:(id)a3
{
  id v3 = a3;
  id v4 = 0;
  switch([v3 searchUserCategory])
  {
    case 0:
      id v4 = @"Generic";
      break;
    case 1:
      v5 = [v3 queryToken];
      id v6 = [v5 searchedCategories];

      if ([v6 containsIndex:1301]) {
        id v4 = @"PersonalRelationship";
      }
      else {
        id v4 = @"Person";
      }

      break;
    case 2:
      id v4 = @"Contributor";
      break;
    case 3:
      id v4 = @"SharedLibrary";
      break;
    case 4:
    case 5:
      id v4 = @"SocialGroup";
      break;
    case 6:
    case 7:
      id v4 = @"Pet";
      break;
    case 8:
      id v4 = @"Date";
      break;
    case 9:
      id v4 = @"Place";
      break;
    case 10:
      id v4 = @"Home";
      break;
    case 11:
      id v4 = @"Work";
      break;
    case 12:
      id v4 = @"Favorite";
      break;
    case 13:
      id v4 = @"Tag";
      break;
    case 14:
      id v4 = @"OCR";
      break;
    case 15:
      id v4 = @"OCRTextFound";
      break;
    case 16:
      id v4 = @"Album";
      break;
    case 17:
      id v4 = @"Memory";
      break;
    case 18:
      id v4 = @"Image";
      break;
    case 19:
      id v4 = @"Video";
      break;
    case 20:
      id v4 = @"Raw";
      break;
    case 21:
      id v4 = @"CinematicVideo";
      break;
    case 22:
      id v4 = @"ProRes";
      break;
    case 23:
      id v4 = @"Slomo";
      break;
    case 24:
      id v4 = @"LivePhoto";
      break;
    case 25:
      id v4 = @"Screenshot";
      break;
    case 26:
      id v4 = @"Panorama";
      break;
    case 27:
      id v4 = @"Timelapse";
      break;
    case 28:
      id v4 = @"ScreenRecording";
      break;
    case 29:
      id v4 = @"LongExposure";
      break;
    case 30:
      id v4 = @"Animated";
      break;
    case 31:
      id v4 = @"Burst";
      break;
    case 32:
      id v4 = @"Portrait";
      break;
    case 33:
      id v4 = @"LivePortrait";
      break;
    case 34:
      id v4 = @"Selfie";
      break;
    case 36:
      id v4 = @"ImportedByApp";
      break;
    case 37:
      id v4 = @"CameraMakeAndModel";
      break;
    case 38:
      id v4 = @"AudioClassification";
      break;
    default:
      break;
  }

  return v4;
}

+ (id)_descriptionForSearchToken:(unint64_t)a3
{
  if (a3 > 0x2A) {
    return 0;
  }
  else {
    return off_1E5DBDDA0[a3];
  }
}

+ (id)_searchResultDescriptionForSearchResultType:(unint64_t)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return off_1E5DBDD68[a3];
  }
}

+ (id)_legacyTokenCategoryTypesForSearchTokens:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "representedObject", (void)v15);
        v12 = [a1 _legacyDescriptionForSearchToken:v11];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];
  return v13;
}

+ (id)_tokenCategoryTypesForSearchTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_descriptionForSearchToken:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "categoriesType", (void)v14));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

+ (id)_resultSectionForInitialSuggestions:(id)a3 queryId:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = +[PXSearchParsecAnalyticsUtilities SFSearchResultForInitialSuggestionWithQueryId:a4];
      [v6 addObject:v8];

      ++v7;
    }
    while ([v5 count] > v7);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F9A368]);
  [v9 setResults:v6];
  [v9 setIsInitiallyHidden:0];
  v10 = [NSString stringWithFormat:@"%@.%@", @"com.apple.photos", @"GenericInitialSuggestion"];
  [v9 setIdentifier:v10];

  [v9 setBundleIdentifier:@"com.apple.photos"];
  return v9;
}

+ (id)_baseSFSearchResultForQueryId:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  [v4 setUserInput:@"photos"];
  [v4 setApplicationBundleIdentifier:@"com.apple.photos"];
  [v4 setQueryId:a3];
  return v4;
}

+ (id)descriptionForSearchString:(id)a3 searchTokens:(id)a4
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = [a1 _wordCountForSearchString:v6];
    id v9 = [a1 _tokenCategoryTypesForSearchTokens:v7];
    v28[0] = @"cc";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v29[0] = v10;
    v28[1] = @"wc";
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v8];
    v29[1] = v11;
    v28[2] = @"tc";
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v28[3] = @"tt";
    v29[2] = v12;
    v29[3] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

    id v21 = 0;
    long long v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v21];
    id v15 = v21;
    if (v15)
    {
      long long v16 = PLSearchUIParsecAnalyticsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v23 = v15;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Error serializing search characteristics: %@ for search string: %@, search tokens: %@", buf, 0x20u);
      }
    }
    if (v14) {
      long long v17 = (__CFString *)[[NSString alloc] initWithData:v14 encoding:4];
    }
    else {
      long long v17 = 0;
    }
    long long v18 = &stru_1F00B0030;
    if (v17) {
      long long v18 = v17;
    }
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = &stru_1F00B0030;
  }

  return v19;
}

+ (id)_resultRankingFeedbacksFromSFSearchResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    do
    {
      id v7 = objc_alloc(MEMORY[0x1E4F9A360]);
      uint64_t v8 = [v3 objectAtIndexedSubscript:v5];
      id v9 = (void *)[v7 initWithResult:v8 hiddenResults:v6 duplicateResults:v6 localResultPosition:++v5];

      [v4 addObject:v9];
    }
    while (v5 < [v3 count]);
  }
  v10 = (void *)[v4 copy];

  return v10;
}

+ (id)_sectionRankingFeedbackWithResultSection:(id)a3 localSectionPosition:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 results];
  uint64_t v8 = [a1 _resultRankingFeedbacksFromSFSearchResults:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F9A3F0]) initWithResults:v8 section:v6 localSectionPosition:a4 personalizationScore:0.0];
  return v9;
}

+ (id)sectionRankingFeedbackWithInitialSuggestions:(id)a3 queryId:(int64_t)a4
{
  unint64_t v5 = [a1 _resultSectionForInitialSuggestions:a3 queryId:a4];
  id v6 = [a1 _sectionRankingFeedbackWithResultSection:v5 localSectionPosition:1];

  return v6;
}

+ (id)commandFeedbackFromSFSearchResult:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F99FA8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F99EF0]);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v5 cardSection:v6 result:v4 button:v7];

  [v8 setTriggerEvent:2];
  return v8;
}

+ (id)SFSearchResultFromSearchSuggestion:(id)a3 queryId:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PXSearchParsecAnalyticsUtilities.m", 87, @"Invalid parameter not satisfying: %@", @"searchSuggestion" object file lineNumber description];
  }
  uint64_t v8 = [a1 _baseSFSearchResultForQueryId:a4];
  id v9 = objc_msgSend(a1, "_descriptionForSearchToken:", objc_msgSend(v7, "categoriesType"));
  v10 = [NSString stringWithFormat:@"%@.%@", @"com.apple.photos.suggestions", v9];
  uint64_t v11 = [a1 _identifierForSearchSuggestion:v7];
  [v8 setIdentifier:v11];

  [v8 setResultBundleId:v10];
  [v8 setSectionBundleIdentifier:@"com.apple.photos.suggestions"];
  [v8 setResultType:@"suggestion"];

  return v8;
}

+ (id)SFSearchResultForInitialSuggestionWithQueryId:(int64_t)a3
{
  id v3 = [a1 _baseSFSearchResultForQueryId:a3];
  id v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.photos.zkw", @"Unknown"];
  [v3 setResultBundleId:v4];
  [v3 setSectionBundleIdentifier:v4];
  [v3 setIdentifier:@"Undefined"];

  return v3;
}

+ (id)SFSearchResultFromCollectionIdentifier:(id)a3 type:(unint64_t)a4 queryId:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _baseSFSearchResultForQueryId:a5];
  v10 = [a1 _searchResultDescriptionForSearchResultType:a4];
  uint64_t v11 = [NSString stringWithFormat:@"%@.%@", @"com.apple.photos", v10];
  [v9 setResultBundleId:v11];
  [v9 setSectionBundleIdentifier:v11];
  [v9 setIdentifier:v8];

  return v9;
}

+ (id)SFSearchResultFromAssetUUID:(id)a3 isTopResult:(BOOL)a4 retrievalType:(unint64_t)a5 queryId:(int64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 _baseSFSearchResultForQueryId:a6];
  v12 = @"AssetResult";
  if (v8) {
    v12 = @"TopAssetResult";
  }
  uint64_t v13 = [NSString stringWithFormat:@"%@.%@", @"com.apple.photos", v12];
  [v11 setResultBundleId:v13];
  [v11 setSectionBundleIdentifier:v13];
  [v11 setIdentifier:v10];

  id v14 = objc_alloc_init(MEMORY[0x1E4F9A2D0]);
  [v14 setIsEmbeddingMatched:(a5 & 0xFFFFFFFFFFFFFFFELL) == 2];
  [v14 setIsMetadataMatched:(a5 & 0xFFFFFFFFFFFFFFFDLL) == 1];
  [v11 setPhotosAttributes:v14];

  return v11;
}

@end